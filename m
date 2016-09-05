Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A26C06FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 14:51:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u85EpbCa008103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Sep 2016 07:51:37 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 07:51:36 -0700
To: Joshua Lock <joshuagloe@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
	<dc7a6ed9ea99d08af5f2a5945caffb3b6e0fd12c.1473083836.git.joshua.g.lock@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <62b6b79b-1f8f-1181-6e57-e9dd0ad61ca3@windriver.com>
Date: Mon, 5 Sep 2016 22:51:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <dc7a6ed9ea99d08af5f2a5945caffb3b6e0fd12c.1473083836.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH 2/4] runqemu: use glob rather than calling out to ls
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
X-List-Received-Date: Mon, 05 Sep 2016 14:51:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2016 09:59 PM, Joshua Lock wrote:
> Use the Python glob module to find files matching a pattern, rather
> than calling out to ls and parsing the output.
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  scripts/runqemu | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 72c6352..1599848 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -528,11 +528,10 @@ class BaseConfig(object):
>                  self.qemuboot = "%s/%s-%s.qemuboot.conf" % (deploy_dir_image,
>                          self.rootfs, machine)
>              else:
> -                cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
> -                logger.info('Running %s...' % cmd)
> -                qbs = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
> +                import glob
> +                qbs = glob.glob('%s/*.qemuboot.conf' %  deploy_dir_image)

I'm not sure about this, "ls -lt" will sort by time and we will use the
latest one when the user run "runqemu core-image-minimal qemux86", but
glob.glob() seems can't do this.

I have to go to sleep now, have a good day, talk to you tomorrow.

// Robert

>                  if qbs:
> -                    self.qemuboot = qbs.split()[0]
> +                    self.qemuboot = qbs.split[0]
>
>          if not os.path.exists(self.qemuboot):
>              raise Exception("Failed to find <image>.qemuboot.conf!")
>

