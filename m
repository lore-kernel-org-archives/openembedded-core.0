Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF7378325
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 16:38:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 09:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,304,1498546800"; d="scan'208";a="117760882"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.184.101])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2017 09:38:08 -0700
Message-ID: <1501519088.27323.413.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 09:38:08 -0700
In-Reply-To: <20170728015431.25919-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170728015431.25919-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH] cml1.bbclass: wait until menuconfig terminal finishes
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
X-List-Received-Date: Mon, 31 Jul 2017 16:38:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-07-27 at 18:54 -0700,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> There are at least two terminals types (gnome and tmux) that when
> launched to show the kernel's menuconfig, we lost track of the
> corresponding
> process ID, thus there is no way to see when they finish, yielding
> identical
> timestamps before and after menuconfig thus compile's task
> is never tainted. This commit takes the solution from [1] but now in
> the menuconfig's
> context.
> 
I am not sure that this should be specific to the menuconfig code, as
this will affect devshell also or if you enable dropping into shell for
patch fixing.

Please generalize the code in meta/lib/oe/terminal.py that gnome uses
to be useful by any terminal type.

Sau!


> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=c706bfbabbf
> 9f7caf2cf509eb91381fb49aa44cb
> 
> [YOCTO #11146]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/classes/cml1.bbclass | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 38e6613c48..1e84795aa2 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -26,8 +26,28 @@ python do_menuconfig() {
>      except OSError:
>          mtime = 0
>  
> -    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo
> 'Command failed.'; printf 'Press any key to continue... '; read r;
> fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> +    # We need to know when the command completes but some terminals
> (including gnome-terminal
> +    # and tmux) gives us no way to do this. We therefore write the
> pid to a temporal file
> +    # then monitor the pid until it exits.
> +    import tempfile
> +    pidfile = tempfile.NamedTemporaryFile(delete = False).name
> +    try:
> +        oe_terminal("${SHELL} -c \"echo $$ > %s; make %s; if [ \$?
> -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to
> continue... '; read r; fi\"" % (pidfile,
> d.getVar('KCONFIG_CONFIG_COMMAND')),
>                  d.getVar('PN') + ' Configuration', d)
> +        while os.stat(pidfile).st_size <= 0:
> +            continue
> +        with open(pidfile, "r") as f:
> +            pid = int(f.readline())
> +    finally:
> +        os.unlink(pidfile)
> +
> +    import time
> +    while True:
> +        try:
> +            os.kill(pid, 0)
> +            time.sleep(0.1)
> +        except OSError:
> +            break
>  
>      # FIXME this check can be removed when the minimum bitbake
> version has been bumped
>      if hasattr(bb.build, 'write_taint'):

