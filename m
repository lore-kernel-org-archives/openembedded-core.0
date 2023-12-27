Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080BDC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 11:59:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.100242.1703678363684818872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 03:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bD6sWks+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC6061C000A;
	Wed, 27 Dec 2023 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703678361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1LFLnpLE1Y305PohAe9RBkmBRpvp2og1YFvk9jr3oRw=;
	b=bD6sWks+gZT3OV7SWdmxvplkDoa3XZPtCJD+9PVOekH52cFgmjvaJETG91fSepnjYNpcKt
	8V7ZUrf3/N40pst8ti1Dd4kDShiHx6pOoCKcvBXMnP5nSWd40IMlHVEs1fLmBDm9cWqz/e
	gFHYGKIFrB87ZIHjVsqXcl7QohAZzp+bizSL0Nll7NdaQCJo55TyzbtdwNADB47nhhICF0
	agG1LBgGchjwP0XP6WTUzRBwhpBk2VBELom2q16HTyy1bfRD49FSeix5EhHUaRBYcqq+pa
	xDRgmAs+jBzTqdwaQa0QG50hjTgGSrX+8xs7zDptZT5QVBqViAOl8xVU//d65w==
Date: Wed, 27 Dec 2023 12:59:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Message-ID: <2023122711592084d34620@mail.local>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227042036.2376255-1-Qi.Chen@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 11:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192937

We hit the added warning on the autobuilders:

WARNING: systemd-1_255.1-r0 do_install: Using /home/root as root user's home directory is not fully supported by systemd

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8354/steps/14/logs/warnings

On 27/12/2023 12:20:34+0800, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> 1. Patch changes:
> 
> 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> is removed because it has no real effect now. The /lib is now
> /usr/lib because 'usrmerge' is a required distro feature for systemd.
> 
> 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
> refreshed for the new version to avoid patch-fuzz issue.
> 
> 2. root user's home directory now defaults to "/root":
> 
> The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
> value, so if users set ROOT_HOME to "/home/root", the behavior is the
> same as before. However, this is only for backward compatibility. With
> this patch, The ROOT_HOME value is set to "/root" in init-manager-systemd.inc.
> This is because systemd's source codes are hardcoding "/root", and other
> values are not officially supported. See the list below.
> $ grep -rl '"/root"' src/ | grep -v 'src/test'
> src/core/namespace.c
> src/basic/user-util.c
> src/nss-systemd/nss-systemd.c
> src/nspawn/nspawn.c
> src/firstboot/firstboot.c
> src/shared/userdb.c
> src/shared/user-record.c
> $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/ tmpfiles.d/ units/ xorg/ tools/
> sysusers.d/basic.conf.in
> tmpfiles.d/provision.conf
> units/emergency.service.in
> units/rescue.service.in
> tools/list-discoverable-partitions.py
> Previously, the recipe was just substituting sysusers.d/basic.conf.in,
> which is not enough to be treated as 'fully support'. I deliberately put
> a warning message in do_install to warn users about non "/root" ROOT_HOME
> value. Don't remove it until all above places are handled.
> 
> 3. cgroupv2 is now the default.
> cgroupv2 is the default for systemd for many years and it's the default
> for distros such as ubuntu and fedora. Let's also use it as the default.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../distro/include/init-manager-systemd.inc   |  2 +
>  meta/recipes-core/systemd/systemd.inc         |  4 +-
>  ...tall-dependency-links-at-install-tim.patch | 22 +++---
>  ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
>  .../systemd/systemd/basic.conf.in             | 40 ----------
>  .../{systemd_254.4.bb => systemd_255.1.bb}    | 16 ++--
>  6 files changed, 25 insertions(+), 132 deletions(-)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/basic.conf.in
>  rename meta/recipes-core/systemd/{systemd_254.4.bb => systemd_255.1.bb} (98%)
> 
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
> index 595d1f2644..0a76647459 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
>  VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
>  VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
>  VIRTUAL-RUNTIME_dev_manager ??= "systemd"
> +# systemd hardcodes /root in its source codes, other values are not offically supported
> +ROOT_HOME ?= "/root"
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index ccc3236457..1417e0150f 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,8 +15,8 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
> -SRCBRANCH = "v254-stable"
> +SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
> +SRCBRANCH = "v255-stable"
>  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index 085f1e9052..be231cf6b2 100644
> --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> @@ -1,8 +1,8 @@
> -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
> +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Thu, 21 Feb 2019 16:23:24 +0800
> -Subject: [PATCH] binfmt: Don't install dependency links at install time for
> - the binfmt services
> +Subject: [PATCH 1/2] binfmt: Don't install dependency links at install time
> + for the binfmt services
>  
>  use [Install] blocks so that they get created when the service is enabled
>  like a traditional service.
> @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   3 files changed, 7 insertions(+), 2 deletions(-)
>  
>  diff --git a/units/meson.build b/units/meson.build
> -index c7939a10f8..219570ab19 100644
> +index e7bfb7f838..1d5ec4b178 100644
>  --- a/units/meson.build
>  +++ b/units/meson.build
> -@@ -149,7 +149,6 @@ units = [
> +@@ -154,7 +154,6 @@ units = [
>           {
>             'file' : 'proc-sys-fs-binfmt_misc.automount',
>             'conditions' : ['ENABLE_BINFMT'],
> @@ -36,7 +36,7 @@ index c7939a10f8..219570ab19 100644
>           },
>           {
>             'file' : 'proc-sys-fs-binfmt_misc.mount',
> -@@ -246,7 +245,6 @@ units = [
> +@@ -251,7 +250,6 @@ units = [
>           {
>             'file' : 'systemd-binfmt.service.in',
>             'conditions' : ['ENABLE_BINFMT'],
> @@ -45,7 +45,7 @@ index c7939a10f8..219570ab19 100644
>           {
>             'file' : 'systemd-bless-boot.service.in',
>  diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
> -index 6b1bbdc91e..5ec5b8670a 100644
> +index 5d212015a5..6c2900ca77 100644
>  --- a/units/proc-sys-fs-binfmt_misc.automount
>  +++ b/units/proc-sys-fs-binfmt_misc.automount
>  @@ -22,3 +22,6 @@ Before=shutdown.target
> @@ -56,7 +56,7 @@ index 6b1bbdc91e..5ec5b8670a 100644
>  +[Install]
>  +WantedBy=sysinit.target
>  diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
> -index b04412e037..63f116e4fa 100644
> +index 6861c76674..531e9fbd90 100644
>  --- a/units/systemd-binfmt.service.in
>  +++ b/units/systemd-binfmt.service.in
>  @@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
> @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
>   After=proc-sys-fs-binfmt_misc.mount
>   After=local-fs.target
>  @@ -31,3 +32,6 @@ RemainAfterExit=yes
> - ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
> - ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> + ExecStart={{LIBEXECDIR}}/systemd-binfmt
> + ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
>   TimeoutSec=90s
>  +
>  +[Install]
>  +WantedBy=sysinit.target
>  -- 
> -2.39.2
> +2.34.1
>  
> diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> deleted file mode 100644
> index 98914ae154..0000000000
> --- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 29 Sep 2020 18:01:41 -0700
> -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
> -
> -These directories are moved to /lib since systemd v246, commit
> -4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
> -the old /usr/lib is still being used.
> -
> -Upstream-Status: Inappropriate (OE-specific)
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ----
> - src/core/systemd.pc.in           | 8 ++++----
> - src/libsystemd/sd-path/sd-path.c | 8 ++++----
> - 2 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
> -index 693433b34b..8368a3ff02 100644
> ---- a/src/core/systemd.pc.in
> -+++ b/src/core/systemd.pc.in
> -@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
> - 
> - user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
> - 
> --sysusers_dir=${rootprefix}/lib/sysusers.d
> -+sysusers_dir=${prefix}/lib/sysusers.d
> - sysusersdir=${sysusers_dir}
> - 
> --sysctl_dir=${rootprefix}/lib/sysctl.d
> -+sysctl_dir=${prefix}/lib/sysctl.d
> - sysctldir=${sysctl_dir}
> - 
> --binfmt_dir=${rootprefix}/lib/binfmt.d
> -+binfmt_dir=${prefix}/lib/binfmt.d
> - binfmtdir=${binfmt_dir}
> - 
> --modules_load_dir=${rootprefix}/lib/modules-load.d
> -+modules_load_dir=${prefix}/lib/modules-load.d
> - modulesloaddir=${modules_load_dir}
> - 
> - catalog_dir=${prefix}/lib/systemd/catalog
> -diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
> -index 1af3a36d1d..def502b717 100644
> ---- a/src/libsystemd/sd-path/sd-path.c
> -+++ b/src/libsystemd/sd-path/sd-path.c
> -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
> -                 return 0;
> - 
> -         case SD_PATH_SYSUSERS:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
> -+                *ret = "/usr/lib/sysusers.d";
> -                 return 0;
> - 
> -         case SD_PATH_SYSCTL:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
> -+                *ret = "/usr/lib/sysctl.d";
> -                 return 0;
> - 
> -         case SD_PATH_BINFMT:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
> -+                *ret = "/usr/lib/binfmt.d";
> -                 return 0;
> - 
> -         case SD_PATH_MODULES_LOAD:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
> -+                *ret = "/usr/lib/modules-load.d";
> -                 return 0;
> - 
> -         case SD_PATH_CATALOG:
> --- 
> -2.39.2
> -
> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
> deleted file mode 100644
> index fac288f7fa..0000000000
> --- a/meta/recipes-core/systemd/systemd/basic.conf.in
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -#  This file is part of systemd.
> -#
> -#  systemd is free software; you can redistribute it and/or modify it
> -#  under the terms of the GNU Lesser General Public License as published by
> -#  the Free Software Foundation; either version 2.1 of the License, or
> -#  (at your option) any later version.
> -
> -# The superuser
> -u root    0     "root" :ROOT_HOME:
> -
> -# The nobody user/group for NFS file systems
> -g {{NOBODY_GROUP_NAME}} 65534       -            -
> -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
> -
> -# Administrator group: can *see* more than normal users
> -g adm     {{ADM_GID    }}     -            -
> -
> -# Administrator group: can *do* more than normal users
> -g wheel   {{WHEEL_GID  }}     -            -
> -
> -# Access to shared database of users on the system
> -g utmp    {{UTMP_GID   }}     -            -
> -
> -# Physical and virtual hardware access groups
> -g audio   {{AUDIO_GID  }}     -            -
> -g cdrom   {{CDROM_GID  }}     -            -
> -g dialout {{DIALOUT_GID}}     -            -
> -g disk    {{DISK_GID   }}     -            -
> -g input   {{INPUT_GID  }}     -            -
> -g kmem    {{KMEM_GID   }}     -            -
> -g kvm     {{KVM_GID    }}     -            -
> -g lp      {{LP_GID     }}     -            -
> -g render  {{RENDER_GID }}     -            -
> -g sgx     {{SGX_GID    }}     -            -
> -g tape    {{TAPE_GID   }}     -            -
> -g tty     {{TTY_GID    }}     -            -
> -g video   {{VIDEO_GID  }}     -            -
> -
> -# Default group for normal users
> -g users   {{USERS_GID  }}     -            -
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_255.1.bb
> similarity index 98%
> rename from meta/recipes-core/systemd/systemd_254.4.bb
> rename to meta/recipes-core/systemd/systemd_255.1.bb
> index 0c12926bef..daa3a01fef 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
>  SRC_URI += " \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
> -           file://basic.conf.in \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>             file://init \
> @@ -29,7 +28,6 @@ SRC_URI += " \
>             file://systemd-pager.sh \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> -           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
>             "
>  
>  # patches needed by musl
> @@ -73,6 +71,7 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
>      backlight \
>      binfmt \
> +    cgroupv2 \
>      gshadow \
>      hibernate \
>      hostnamed \
> @@ -266,12 +265,16 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>  # The 60 seconds is watchdog's default vaule.
>  WATCHDOG_TIMEOUT ??= "60"
>  
> -do_configure:prepend() {
> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
> -}
> -
>  do_install() {
>  	meson_do_install
> +	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
> +	# This is done merely for backward compatibility with previous systemd recipes.
> +	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
> +	# may have unexpected runtime behaviors.
> +	if [ "${ROOT_HOME}" != "/root" ]; then
> +		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
> +		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
> +	fi
>  	install -d ${D}/${base_sbindir}
>  	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
>  		# Provided by a separate recipe
> @@ -754,6 +757,7 @@ FILES:udev += "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192923): https://lists.openembedded.org/g/openembedded-core/message/192923
> Mute This Topic: https://lists.openembedded.org/mt/103380516/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

