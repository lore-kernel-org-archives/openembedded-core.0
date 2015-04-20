Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 452F66AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 12:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KCuJnZ003096; Mon, 20 Apr 2015 13:56:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bfFjl38TrzPj; Mon, 20 Apr 2015 13:56:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KCu6d6003085
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Apr 2015 13:56:17 +0100
Message-ID: <1429534566.26983.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Apr 2015 13:56:06 +0100
In-Reply-To: <1428959649-3352-1-git-send-email-Martin.Jansa@gmail.com>
References: <1428959649-3352-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Allow to remove do_rootfs -> virtual/kernel:do_packagedata dependency
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
X-List-Received-Date: Mon, 20 Apr 2015 12:56:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-13 at 23:14 +0200, Martin Jansa wrote:
> * this is causing dependency loops in some cases
>   e.g. linux-hp-tenderloin depends on initramfs-android-image, but
>     commit 41f0f86ec0a3e0b6f6c9bb4ef71a4215c00bf66c
>     Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Date:   Tue Jan 27 15:24:52 2015 +0000
>     Subject: image: Add missing depends on virtual/kernel for depmod data
>   adds also dependency between <image>.do_rootfs and virtual/kernel:do_packagedata
>   causing this dependency loop:
> 
> Dependency loop #1 found:
>   Task 78 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_install)
>     (dependent Tasks ['linux-hp-tenderloin, do_compile',
>                       'pseudo, do_populate_sysroot'])
>   Task 88 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_package)
>     (dependent Tasks ['rpm, do_populate_sysroot',
>                       'pseudo, do_populate_sysroot',
>                       'linux-hp-tenderloin, do_install',
>                       'initramfs-android-image.bb, do_packagedata',
>                       'glibc, do_packagedata',
>                       'file, do_populate_sysroot',
>                       'gcc-runtime, do_packagedata'])
>   Task 89 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_package_write_ipk)
>     (dependent Tasks ['linux-hp-tenderloin, do_package',
>                       'opkg-utils, do_populate_sysroot',
>                       'linux-hp-tenderloin, do_packagedata',
>                       'pseudo, do_populate_sysroot'])
>   Task 560 (meta-smartphone/meta-android/recipes-core/images/initramfs-android-image.bb, do_rootfs)
>     (dependent Tasks ['bash, do_package_write_ipk',
>                       'run-postinsts, do_package_write_ipk',
>                       'db, do_package_write_ipk',
>                       'update-rc.d, do_populate_sysroot',
>                       'android-tools-conf, do_package_write_ipk',
> 		      'base-passwd, do_package_write_ipk',
>                       'initramfs-boot-android, do_package_write_ipk',
> 		      'expat, do_package_write_ipk',
>                       'bzip2, do_packagedata',
> 		      'glibc-initial, do_packagedata',
>                       'openssl, do_package_write_ipk',
>                       'bzip2, do_package_write_ipk',
> 		      'busybox, do_packagedata',
>                       'zlib, do_packagedata',
> 		      'qemuwrapper-cross, do_packagedata',
>                       'base-passwd, do_packagedata',
> 		      'busybox, do_package_write_ipk',
>                       'zlib, do_package_write_ipk',
> 		      'qemuwrapper-cross, do_package_write_ipk',
> 		      'gcc-runtime, do_package_write_ipk',
> 		      'gettext, do_packagedata',
> 		      'initramfs-boot-android, do_packagedata',
> 		      'gettext, do_package_write_ipk',
> 		      'libgcc-initial, do_packagedata',
>                       'expat, do_packagedata',
>                       'gdbm, do_packagedata',
> 		      'depmodwrapper-cross, do_package_write_ipk',
>                       'libgcc-initial, do_package_write_ipk',
>                       'glibc-initial, do_package_write_ipk',
>                       'linux-libc-headers, do_packagedata',
>                       'glibc, do_packagedata',
>                       'initramfs-android-image.bb, do_packagedata',
>                       'glibc, do_package_write_ipk',
>                       'sqlite3, do_packagedata',
>                       'initramfs-android-image.bb, do_package_write_ipk',
>                       'sqlite3, do_package_write_ipk',
>                       'android-tools-conf, do_packagedata',
>                       'ncurses, do_packagedata',
>                       'openssl, do_packagedata',
>                       'android-tools, do_packagedata',
>                       'ncurses, do_package_write_ipk',
>                       'cryptodev-linux, do_packagedata',
>                       'android-tools, do_package_write_ipk',
>                       'pseudo, do_populate_sysroot',
>                       'cryptodev-linux, do_package_write_ipk',
>                       'linux-libc-headers, do_package_write_ipk',
>                       'depmodwrapper-cross, do_packagedata',
>                       'linux-hp-tenderloin, do_packagedata',
>                       'readline, do_package_write_ipk',
>                       'opkg-utils, do_packagedata',
>                       'linux-hp-tenderloin, do_package_write_ipk',
>                       'python, do_packagedata',
>                       'gdbm, do_package_write_ipk',
>                       'opkg, do_populate_sysroot',
>                       'python, do_package_write_ipk',
>                       'libtool-cross, do_packagedata',
>                       'db, do_packagedata',
>                       'libgcc, do_packagedata',
>                       'libtool-cross, do_package_write_ipk',
>                       'update-rc.d, do_packagedata',
>                       'update-rc.d, do_package_write_ipk',
>                       'libgcc, do_package_write_ipk',
>                       'opkg-utils, do_populate_sysroot',
>                       'makedevs, do_populate_sysroot',
>                       'readline, do_packagedata',
>                       'base-files, do_packagedata',
>                       'gcc-runtime, do_packagedata',
>                       'opkg-utils, do_package_write_ipk',
>                       'base-files, do_package_write_ipk',
>                       'ldconfig-native, do_populate_sysroot',
>                       'bash, do_packagedata',
>                       'run-postinsts, do_packagedata'])
>   Task 82 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_compile)
>     (dependent Tasks ['initramfs-android-image.bb, do_rootfs',
>                       'linux-hp-tenderloin, do_configure'])
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/image.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 03cbbf7..3a7f3cf 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -76,10 +76,17 @@ LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
>  LDCONFIGDEPEND_libc-uclibc = ""
>  LDCONFIGDEPEND_libc-musl = ""
>  
> +# This is needed to have depmod data in PKGDATA_DIR,
> +# but if you're building small initramfs image
> +# e.g. to include it in your kernel, you probably
> +# don't want this dependency, which is causing dependency loop
> +KERNELDEPEND ?= "virtual/kernel:do_packagedata"
> +
>  do_rootfs[depends] += " \
>      makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND} \
>      virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot \
> -    virtual/kernel:do_packagedata"
> +    ${KERNELDEPEND} \
> +"
>  do_rootfs[recrdeptask] += "do_packagedata"

Can we call this something more specific like KERNELDEPMODDEPEND?

KERNELDEPEND doesn't tell us much about what this is for...

Cheers,

Richard


