Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF4871A21
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 11:14:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v43BDxDg023367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 May 2017 12:14:00 +0100
Message-ID: <1493810039.23535.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2017 12:13:59 +0100
In-Reply-To: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 03 May 2017 12:14:00 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 May 2017 11:14:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-05-03 at 12:56 +0200, Patrick Ohly wrote:
> That a utility function permanently changes the process environment
> is
> bad style and leads to subtle, hard to debug problems.
> 
> For example, we had one oe-selftest which used runqemu() with an
> override for DEPLOY_DIR_IMAGE. Another test then just called runCmd()
> and ended up passing the wrong DEPLOY_DIR_IMAGE set earlier in
> os.environ.
> 
> The approach used here is to extend the launch command such that
> 'env'
> sets the environment variables. The specific values here should be
> safe to use this way, even without extra quoting. This approach is
> simple and has the advantage that the existing log.info('launchcmd=')
> output includes the environment variables.
> 
> A more complex approach would be to pass a modified environment hash
> to the subprocess module.
> 
> [YOCTO #11443]
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py
> b/meta/lib/oeqa/utils/qemurunner.py
> index ba44b96..c543797 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -98,11 +98,12 @@ class QemuRunner:
>                  raise SystemExit
>  
>      def start(self, qemuparams = None, get_ip = True,
> extra_bootparams = None, runqemuparams='', launch_cmd=None,
> discard_writes=True):
> +        env = []
>          if self.display:
> -            os.environ["DISPLAY"] = self.display
> +            env.append("DISPLAY=" + self.display)
>              # Set this flag so that Qemu doesn't do any grabs as SDL
> grabs
>              # interact badly with screensavers.
> -            os.environ["QEMU_DONT_GRAB"] = "1"
> +            env.append("QEMU_DONT_GRAB=1")
>          if not os.path.exists(self.rootfs):
>              logger.error("Invalid rootfs %s" % self.rootfs)
>              return False
> @@ -110,12 +111,12 @@ class QemuRunner:
>              logger.error("Invalid TMPDIR path %s" % self.tmpdir)
>              return False
>          else:
> -            os.environ["OE_TMPDIR"] = self.tmpdir
> +            env.append("OE_TMPDIR=" + self.tmpdir)
>          if not os.path.exists(self.deploy_dir_image):
>              logger.error("Invalid DEPLOY_DIR_IMAGE path %s" %
> self.deploy_dir_image)
>              return False
>          else:
> -            os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
> +            env.append("DEPLOY_DIR_IMAGE=" + self.deploy_dir_image)
>  
>          if not launch_cmd:
>              launch_cmd = 'runqemu %s %s ' % ('snapshot' if
> discard_writes else '', runqemuparams)
> @@ -128,6 +129,9 @@ class QemuRunner:
>                  launch_cmd += ' nographic'
>              launch_cmd += ' %s %s' % (self.machine, self.rootfs)
>  
> +        if env:
> +            launch_cmd = 'env %s %s' % (' '.join(env), launch_cmd)
> +
>          return self.launch(launch_cmd, qemuparams=qemuparams,
> get_ip=get_ip, extra_bootparams=extra_bootparams)
>  
>      def launch(self, launch_cmd, get_ip = True, qemuparams = None,
> extra_bootparams = None):

Why not pass in an env to the subprocess call in launch()?

Cheers,

Richard





