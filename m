Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.1109.1626993430815504976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D69EE200006;
	Thu, 22 Jul 2021 22:37:08 +0000 (UTC)
Date: Fri, 23 Jul 2021 00:37:08 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] rootfs: remove ldconfig auxiliary cache where appropriate
Message-ID: <YPnzFOuJhmDW/kb4@piout.net>
References: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl>
MIME-Version: 1.0
In-Reply-To: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22/07/2021 11:48:22+0200, Damian Wrobel wrote:
> Removes the /var/cache/ldconfig auxiliary cache directory from
> the rootfs when:
>  - read-only-rootfs is in DISTRO_FEATURES,
>  - ldconfig is not in DISTRO_FEATURES.
> 
> In both cases the /var/cache/ldconfig/aux-cache is useless.
> 

This breaks the do_rootfs task of most of the builds with:

Exception: FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/qemuarm64-ltp/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/rootfs/var/cache/ldconfig'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemuarm64-ltp/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/temp/log.do_rootfs.51846
NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemuarm64-ltp/build/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'

Example here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1983/steps/11/logs/stdio

> Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> ---
>  meta/lib/oe/rootfs.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index ad9fd77c8b..80673fab3f 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -302,6 +302,15 @@ class Rootfs(object, metaclass=ABCMeta):
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
>                                    'new', '-v', '-X'])
>  
> +        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
> +                                        True, False, self.d)
> +        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
> +                                                 True, False, self.d)
> +        if image_rorfs or not ldconfig_in_features:
> +            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
> +            bb.note("Removing ldconfig auxiliary cache...")
> +            shutil.rmtree(ldconfig_cache_dir)
> +
>      def _check_for_kernel_modules(self, modules_dir):
>          for root, dirs, files in os.walk(modules_dir, topdown=True):
>              for name in files:
> -- 
> 2.31.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
