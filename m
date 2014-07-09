Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E9DE67048F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 20:50:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s69KoF45020121; Wed, 9 Jul 2014 21:50:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jpxFzhd4P4mv; Wed,  9 Jul 2014 21:50:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s69KoBcg020117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 9 Jul 2014 21:50:13 +0100
Message-ID: <1404939006.15985.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Roxana Ciobanu <roxana.ciobanu@intel.com>
Date: Wed, 09 Jul 2014 21:50:06 +0100
In-Reply-To: <478fc5d6fb31718ce9531eca7b6f626a1412c0c3.1404930808.git.roxana.ciobanu@intel.com>
References: <cover.1404930808.git.roxana.ciobanu@intel.com>
	<478fc5d6fb31718ce9531eca7b6f626a1412c0c3.1404930808.git.roxana.ciobanu@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] latencytop: fix mount error
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
X-List-Received-Date: Wed, 09 Jul 2014 20:50:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-09 at 21:52 +0300, Roxana Ciobanu wrote:
> Added a check to ensure debugfs is not mounted before trying
> to mount it, because sysfs.sh already mounts it.
> 
> [ YOCTO #6498 ]
> 
> Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
> ---
>  .../latencytop-0.5/latencytop-fsync-mount.patch         | 17 +++++++++++++++++
>  meta/recipes-kernel/latencytop/latencytop_0.5.bb        |  5 +++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
> 
> diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
> new file mode 100644
> index 0000000..6de27d0
> --- /dev/null
> +++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
> @@ -0,0 +1,17 @@
> +Index: latencytop-0.5/fsync.c
> +===================================================================
> +--- latencytop-0.5.orig/fsync.c	2014-07-09 16:56:32.565238023 +0300
> ++++ latencytop-0.5/fsync.c	2014-07-09 17:12:00.553237913 +0300
> +@@ -151,8 +151,10 @@
> +  * echo ftrace_printk > iter_ctrl 
> +  * echo 1 > tracing_on
> +  */
> +-	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
> +-	if (!ret) 
> ++    ret = system("if ! grep -q debugfs /proc/filesystems; then"
> ++                 " /bin/mount -t debugfs none /sys/kernel/debug/"
> ++                 " else false; fi");
> ++    if (!ret)
> + 		return -1;
> + 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
> + 	write_to_file("/sys/kernel/debug/tracing/iter_ctrl", "ftrace_printk");	

I'm not sure an upstream would accept what amounts to shell in the
system() call. Could we try listing that directories contents and then
only call the mount if the directory is empty/does not exist?

That patch should then be able to be sent upstream...

Cheers,

Richard


> diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> index 516e2c5..9a95b92 100644
> --- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> +++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> @@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a
>  
>  DEPENDS = "virtual/libintl ncurses glib-2.0  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
>  
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
>              file://latencytop-makefile.patch \
> -            file://latencytop-fsync.patch"
> +            file://latencytop-fsync.patch \
> +            file://latencytop-fsync-mount.patch"
>  
>  SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
>  SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
> -- 
> 1.9.1
> 



