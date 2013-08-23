Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 809DC6A5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 20:07:02 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u12so803571lbd.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ZYz5YyBb1hZQ86No08uoFRqtgCA7nR9BCgvBld0261M=;
	b=prwn3m405/IIxwjkDKsMfrzGTpCbmv8qHwrIG+vnSkLbh+vLWzVc6LnUDVK/L+/vSl
	eR4plpvefzgEPrT4aR3bufFwknJPXbzYs1pBgAGURuMjsGKPuhGQta5hAhFVbpHHH9jH
	ipHhaHyJlMkWq6LH+wyHbBnVWCfUvnUf6H2i9mX74na5zkJqXnoRJ+bPXz9jqfU7Blo9
	VzTSzfy+tiI8xjCf5Oz7Jk2OEL38E9u+fwgsTjjxuC6plH79mQZFQTCLZ10IQVFP93D8
	lxXPry/hA6vDDZX47FBUO0/jood+YnbfmtyN+eu2wBiVC2+ZHOAD77btnwO5mUXzojYg
	2Okw==
MIME-Version: 1.0
X-Received: by 10.152.115.242 with SMTP id jr18mr854649lab.40.1377288422344;
	Fri, 23 Aug 2013 13:07:02 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 23 Aug 2013 13:07:02 -0700 (PDT)
In-Reply-To: <5217BF57.2080904@linux.intel.com>
References: <1377281368-11114-1-git-send-email-otavio@ossystems.com.br>
	<5217BF57.2080904@linux.intel.com>
Date: Fri, 23 Aug 2013 16:07:02 -0400
Message-ID: <CADkTA4Ok48K9m9HBA_LsqmiYY1CD1UUtFHspcfd65a+kkaq9dQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot, u-boot-fw-utils-cross, u-boot-mkimage: Upgrade to 2013.07
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
X-List-Received-Date: Fri, 23 Aug 2013 20:07:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 4:00 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/23/2013 11:09 AM, Otavio Salvador wrote:
>>
>> This upgrades the U-Boot for 2013.07 release. This removes the
>> 2011.03, 2011.06 and 2013.01.01 versions so we keep a single one in
>> core. The following recipes has been upgraded:
>>
>>   - u-boot
>>   - u-boot-mkimage
>>   - u-boot-fw-utils -> u-boot-fw-utils-cross (renamed)
>>
>> The 2013.07 u-boot and u-boot-mkimage recipe updates were based on a
>> patch sent by Laszlo Papp <lpapp@kde.org> but the
>> u-boot-fw-utils-cross needed some more work as it uses the
>> UBOOT_MACHINE to find default environment for use so it is indeed a
>> cross binary and not a native one.
>>
>
> As I have mentioned before, until we have a solid test against the refere=
nce
> bsps in Poky, I will not accept a straight-up update, the last version of
> 2013.01.01 has a DEFAULT_PREFERENCE =3D "-1", so it's not used, it was al=
so
> pointed out that we accidently drop the 2012.04 version with the
> MPC8315e-rdb was relying on.
>
> I will take the addition, until we have some test results against the cor=
e
> bsps that say it works for them, then we can clean this up.

Agreed. I was going to say the same thing. And yes, we do have plans to
get things cleaned up and update the reference board. I simply couldn't do
everything while grinding out the 3.10 kernel :(

Bruce

>
> We can't break the reference boards when we are about to release.
>
> Sau!
>
>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>   .../u-boot/files/fix-arm920t-eabi.patch            | 24 -------
>>   .../u-boot/u-boot-fw-utils-cross_2013.07.bb        | 38 ++++++++++
>>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb | 28 --------
>>   .../u-boot/u-boot-fw-utils_2013.01.01.bb           | 33 ---------
>>   ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
>>   ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82
>> ----------------------
>>   ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
>>   ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82
>> ----------------------
>>   meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  | 31 --------
>>   meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  | 29 --------
>>   ...age_2013.01.01.bb =3D> u-boot-mkimage_2013.07.bb} | 10 +--
>>   meta/recipes-bsp/u-boot/u-boot_2011.03.bb          | 24 -------
>>   meta/recipes-bsp/u-boot/u-boot_2011.06.bb          | 24 -------
>>   .../{u-boot_2013.01.01.bb =3D> u-boot_2013.07.bb}    | 13 ++--
>>   14 files changed, 46 insertions(+), 450 deletions(-)
>>   delete mode 100644 meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patc=
h
>>   create mode 100644
>> meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
>>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.=
bb
>>   delete mode 100644
>> meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-includ=
e-in-tools-imximage.h.patch
>>   delete mode 100644
>> meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCR=
IPT-processing-to-the-top-level-.patch
>>   delete mode 100644
>> meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-too=
ls-imximage.h.patch
>>   delete mode 100644
>> meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-proc=
essing-to-the-top-level-.patch
>>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>>   rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2013.01.01.bb =3D>
>> u-boot-mkimage_2013.07.bb} (72%)
>>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>   rename meta/recipes-bsp/u-boot/{u-boot_2013.01.01.bb =3D>
>> u-boot_2013.07.bb} (69%)
>>
>> diff --git a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
>> b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
>> deleted file mode 100644
>> index d614442..0000000
>> --- a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> ----
>> - cpu/arm920t/config.mk |    4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> ---- u-boot-1.3.2.orig/cpu/arm920t/config.mk
>> -+++ u-boot-1.3.2/cpu/arm920t/config.mk
>> -@@ -22,13 +22,13 @@
>> - #
>> -
>> - PLATFORM_RELFLAGS +=3D -fno-strict-aliasing  -fno-common -ffixed-r8 \
>> -       -msoft-float
>> -
>> --PLATFORM_CPPFLAGS +=3D -march=3Darmv4
>> -+#PLATFORM_CPPFLAGS +=3D -march=3Darmv4
>> - #
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - #
>> - # Supply options according to compiler version
>> - #
>> - #
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --PLATFORM_CPPFLAGS +=3D$(call cc-option,-mapcs-32,-mabi=3Dapcs-gnu)
>> -+PLATFORM_CPPFLAGS +=3D$(call cc-option)
>> - PLATFORM_RELFLAGS +=3D$(call cc-option,-mshort-load-bytes,$(call
>> cc-option,-malignment-traps,))
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
>> new file mode 100644
>> index 0000000..7f649ca
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
>> @@ -0,0 +1,38 @@
>> +DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb"
>> +SECTION =3D "bootloader"
>> +DEPENDS =3D "mtd-utils"
>> +
>> +# This revision corresponds to the tag "v2013.07"
>> +# We use the revision in order to avoid having to fetch it from the
>> +# repo during parse
>> +SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>> +
>> +PV =3D "v2013.07+git${SRCPV}"
>> +
>> +SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit cross
>> +
>> +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFI=
X}gcc
>> ${TOOLCHAIN_OPTIONS}"'
>> +
>> +do_compile () {
>> +  oe_runmake ${UBOOT_MACHINE}
>> +  oe_runmake env
>> +}
>> +
>> +do_install () {
>> +  install -d ${D}${bindir_cross}
>> +  install -m 755 ${S}/tools/env/fw_printenv
>> ${D}${bindir_cross}/fw_printenv
>> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_sete=
nv
>> +}
>> +
>> +SYSROOT_PREPROCESS_FUNCS =3D "uboot_fw_utils_cross"
>> +uboot_fw_utils_cross() {
>> +    sysroot_stage_dir ${D}${bindir_cross}
>> ${SYSROOT_DESTDIR}${bindir_cross}
>> +}
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> deleted file mode 100644
>> index 7c4df1a..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>> file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d0348=
df3fb90"
>> -SECTION =3D "bootloader"
>> -
>> -DEPENDS =3D "mtd-utils"
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] =3D "0cc5026aad02f218a9b9ac56b301c97a"
>> -SRC_URI[sha256sum] =3D
>> "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
>> -
>> -S =3D "${WORKDIR}/u-boot-${PV}"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}"'
>> -
>> -do_compile () {
>> -  oe_runmake env
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${base_sbindir}
>> -  install -m 755 ${S}/tools/env/fw_printenv
>> ${D}${base_sbindir}/fw_printenv
>> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_sete=
nv
>> -}
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
>> deleted file mode 100644
>> index efa418f..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb"
>> -SECTION =3D "bootloader"
>> -
>> -DEPENDS =3D "mtd-utils"
>> -
>> -# This is needs to be validated among supported BSP's before we can
>> -# make it default
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>> -# This revision corresponds to the tag "v2013.01.01"
>> -# We use the revision in order to avoid having to fetch it from the
>> -# repo during parse
>> -SRCREV =3D "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
>> -
>> -PV =3D "v2013.01.01+git${SRCPV}"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}"'
>> -
>> -do_compile () {
>> -  oe_runmake env
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${base_sbindir}
>> -  install -m 755 ${S}/tools/env/fw_printenv
>> ${D}${base_sbindir}/fw_printenv
>> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_sete=
nv
>> -}
>> diff --git
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-incl=
ude-in-tools-imximage.h.patch
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-incl=
ude-in-tools-imximage.h.patch
>> deleted file mode 100644
>> index 0405834..0000000
>> ---
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-incl=
ude-in-tools-imximage.h.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@linaro.org>
>> -Date: Thu, 3 Feb 2011 15:07:01 +0100
>> -Subject: Drop config.h include in tools/imximage.h
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Upstream-Status: Accepted
>> -
>> -"make tools-all" should allow building tools such as mkimage and the ne=
w
>> -imximage without any config, but imximage.c currently fails to build
>> -with:
>> -imximage.h:27:20: error: config.h: No such file or directory
>> -
>> -config.h is not needed in imximage.h nor in imximage.c, and imximage.h
>> -is only included from imximage.c, so drop this include to fix the build=
.
>> -
>> -Signed-off-by: Lo=EF=BF=BDc Minier <loic.minier@linaro.org>
>>
>> ----
>> - tools/imximage.h |    2 --
>> - 1 files changed, 0 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/tools/imximage.h b/tools/imximage.h
>> -index 38ca6be..d126a46 100644
>> ---- a/tools/imximage.h
>> -+++ b/tools/imximage.h
>> -@@ -24,8 +24,6 @@
>> - #ifndef _IMXIMAGE_H_
>> - #define _IMXIMAGE_H_
>> -
>> --#include <config.h>
>> --
>> - #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set
>> for v2 */
>> - #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set
>> for v1 */
>> - #define APP_CODE_BARKER       0xB1
>> ---
>> -1.7.4.4
>> -
>> diff --git
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDS=
CRIPT-processing-to-the-top-level-.patch
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDS=
CRIPT-processing-to-the-top-level-.patch
>> deleted file mode 100644
>> index 5729cd9..0000000
>> ---
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDS=
CRIPT-processing-to-the-top-level-.patch
>> +++ /dev/null
>> @@ -1,82 +0,0 @@
>> -From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
>> -From: Ilya Yanok <yanok@emcraft.com>
>> -Date: Mon, 20 Jun 2011 12:45:37 +0000
>> -Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
>> -
>> -Upstream-Status: Accepted
>> -
>> -LDSCRIPT is used only from the top-level Makefile and only when the
>> -system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
>> -related logic into the top level Makefile and under configured conditio=
n
>> -to avoid errors when building tools from unconfigured tree.
>> -
>> -Signed-off-by: Ilya Yanok <yanok@emcraft.com>
>> -Acked-by: Mike Frysinger <vapier@gentoo.org>
>> ----
>> - Makefile  |   30 ++++++++++++++++++++++++++++++
>> - config.mk |    8 --------
>> - 2 files changed, 30 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index ece91ab..358c410 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -163,6 +163,36 @@ endif
>> - # load other configuration
>> - include $(TOPDIR)/config.mk
>> -
>> -+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT,
>> use
>> -+# that (or fail if absent).  Otherwise, search for a linker script in =
a
>> -+# standard location.
>> -+
>> -+ifndef LDSCRIPT
>> -+      #LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
>> -+      ifdef CONFIG_SYS_LDSCRIPT
>> -+              # need to strip off double quotes
>> -+              LDSCRIPT :=3D $(subst ",,$(CONFIG_SYS_LDSCRIPT))
>> -+      endif
>> -+endif
>> -+
>> -+ifndef LDSCRIPT
>> -+      ifeq ($(CONFIG_NAND_U_BOOT),y)
>> -+              LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.ld=
s
>> -+              ifeq ($(wildcard $(LDSCRIPT)),)
>> -+                      LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot-nand.ld=
s
>> -+              endif
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+              LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+              LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot.lds
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+$(error could not find linker script)
>> -+      endif
>> -+endif
>> -+
>> -
>> ########################################################################=
#
>> - # U-Boot objects....order is important (i.e. start must be first)
>> -
>> -diff --git a/config.mk b/config.mk
>> -index fa46ff1..59c4c93 100644
>> ---- a/config.mk
>> -+++ b/config.mk
>> -@@ -153,14 +153,6 @@ endif
>> - RELFLAGS=3D $(PLATFORM_RELFLAGS)
>> - DBGFLAGS=3D -g # -DDEBUG
>> - OPTFLAGS=3D -Os #-fomit-frame-pointer
>> --ifndef LDSCRIPT
>> --#LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
>> --ifeq ($(CONFIG_NAND_U_BOOT),y)
>> --LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
>> --else
>> --LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
>> --endif
>> --endif
>> - OBJCFLAGS +=3D --gap-fill=3D0xff
>> -
>> - gccincdir :=3D $(shell $(CC) -print-file-name=3Dinclude)
>> ---
>> -1.7.5.4
>> -
>> diff --git
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-t=
ools-imximage.h.patch
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-t=
ools-imximage.h.patch
>> deleted file mode 100644
>> index 0405834..0000000
>> ---
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-t=
ools-imximage.h.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@linaro.org>
>> -Date: Thu, 3 Feb 2011 15:07:01 +0100
>> -Subject: Drop config.h include in tools/imximage.h
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Upstream-Status: Accepted
>> -
>> -"make tools-all" should allow building tools such as mkimage and the ne=
w
>> -imximage without any config, but imximage.c currently fails to build
>> -with:
>> -imximage.h:27:20: error: config.h: No such file or directory
>> -
>> -config.h is not needed in imximage.h nor in imximage.c, and imximage.h
>> -is only included from imximage.c, so drop this include to fix the build=
.
>> -
>> -Signed-off-by: Lo=EF=BF=BDc Minier <loic.minier@linaro.org>
>>
>> ----
>> - tools/imximage.h |    2 --
>> - 1 files changed, 0 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/tools/imximage.h b/tools/imximage.h
>> -index 38ca6be..d126a46 100644
>> ---- a/tools/imximage.h
>> -+++ b/tools/imximage.h
>> -@@ -24,8 +24,6 @@
>> - #ifndef _IMXIMAGE_H_
>> - #define _IMXIMAGE_H_
>> -
>> --#include <config.h>
>> --
>> - #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set
>> for v2 */
>> - #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set
>> for v1 */
>> - #define APP_CODE_BARKER       0xB1
>> ---
>> -1.7.4.4
>> -
>> diff --git
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-pr=
ocessing-to-the-top-level-.patch
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-pr=
ocessing-to-the-top-level-.patch
>> deleted file mode 100644
>> index 5729cd9..0000000
>> ---
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-pr=
ocessing-to-the-top-level-.patch
>> +++ /dev/null
>> @@ -1,82 +0,0 @@
>> -From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
>> -From: Ilya Yanok <yanok@emcraft.com>
>> -Date: Mon, 20 Jun 2011 12:45:37 +0000
>> -Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
>> -
>> -Upstream-Status: Accepted
>> -
>> -LDSCRIPT is used only from the top-level Makefile and only when the
>> -system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
>> -related logic into the top level Makefile and under configured conditio=
n
>> -to avoid errors when building tools from unconfigured tree.
>> -
>> -Signed-off-by: Ilya Yanok <yanok@emcraft.com>
>> -Acked-by: Mike Frysinger <vapier@gentoo.org>
>> ----
>> - Makefile  |   30 ++++++++++++++++++++++++++++++
>> - config.mk |    8 --------
>> - 2 files changed, 30 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index ece91ab..358c410 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -163,6 +163,36 @@ endif
>> - # load other configuration
>> - include $(TOPDIR)/config.mk
>> -
>> -+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT,
>> use
>> -+# that (or fail if absent).  Otherwise, search for a linker script in =
a
>> -+# standard location.
>> -+
>> -+ifndef LDSCRIPT
>> -+      #LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
>> -+      ifdef CONFIG_SYS_LDSCRIPT
>> -+              # need to strip off double quotes
>> -+              LDSCRIPT :=3D $(subst ",,$(CONFIG_SYS_LDSCRIPT))
>> -+      endif
>> -+endif
>> -+
>> -+ifndef LDSCRIPT
>> -+      ifeq ($(CONFIG_NAND_U_BOOT),y)
>> -+              LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.ld=
s
>> -+              ifeq ($(wildcard $(LDSCRIPT)),)
>> -+                      LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot-nand.ld=
s
>> -+              endif
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+              LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+              LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot.lds
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+$(error could not find linker script)
>> -+      endif
>> -+endif
>> -+
>> -
>> ########################################################################=
#
>> - # U-Boot objects....order is important (i.e. start must be first)
>> -
>> -diff --git a/config.mk b/config.mk
>> -index fa46ff1..59c4c93 100644
>> ---- a/config.mk
>> -+++ b/config.mk
>> -@@ -153,14 +153,6 @@ endif
>> - RELFLAGS=3D $(PLATFORM_RELFLAGS)
>> - DBGFLAGS=3D -g # -DDEBUG
>> - OPTFLAGS=3D -Os #-fomit-frame-pointer
>> --ifndef LDSCRIPT
>> --#LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
>> --ifeq ($(CONFIG_NAND_U_BOOT),y)
>> --LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
>> --else
>> --LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
>> --endif
>> --endif
>> - OBJCFLAGS +=3D --gap-fill=3D0xff
>> -
>> - gccincdir :=3D $(shell $(CC) -print-file-name=3Dinclude)
>> ---
>> -1.7.5.4
>> -
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>> deleted file mode 100644
>> index 34bae8e..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader mkimage tool"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>> file://README;beginline=3D1;endline=3D22;md5=3D3a00ef51d3fc96e9d6c1bc470=
8ccd3b5"
>> -SECTION =3D "bootloader"
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
>> -           file://0001-Drop-config.h-include-in-tools-imximage.h.patch =
\
>> -
>> file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
>> -
>> -SRC_URI[md5sum] =3D "91d02124c94368557d0e9ac05fb8c33f"
>> -SRC_URI[sha256sum] =3D
>> "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
>> -
>> -S =3D "${WORKDIR}/u-boot-${PV}"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTSTRIP=3Dtrue'
>> -
>> -do_compile () {
>> -  oe_runmake tools
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${bindir}
>> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>> -}
>> -
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>> deleted file mode 100644
>> index 3ca0c2c..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader mkimage tool"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>> file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d0348=
df3fb90"
>> -SECTION =3D "bootloader"
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] =3D "0cc5026aad02f218a9b9ac56b301c97a"
>> -SRC_URI[sha256sum] =3D
>> "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
>> -
>> -S =3D "${WORKDIR}/u-boot-${PV}"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTLDFLAGS=3D"${LD=
FLAGS}"
>> HOSTSTRIP=3Dtrue'
>> -
>> -do_compile () {
>> -  oe_runmake tools
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${bindir}
>> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>> -}
>> -
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>> similarity index 72%
>> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>> index 2b39998..a1b1db9 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>> @@ -3,16 +3,12 @@ LICENSE =3D "GPLv2+"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a56=
51ecb"
>>   SECTION =3D "bootloader"
>>
>> -# This is needs to be validated among supported BSP's before we can
>> -# make it default
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>> -# This revision corresponds to the tag "v2013.01.01"
>> +# This revision corresponds to the tag "v2013.07"
>>   # We use the revision in order to avoid having to fetch it from the
>>   # repo during parse
>> -SRCREV =3D "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
>> +SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>>
>> -PV =3D "v2013.01.01+git${SRCPV}"
>> +PV =3D "v2013.07+git${SRCPV}"
>>
>>   SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dg=
it"
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> deleted file mode 100644
>> index a9cbeca..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -require u-boot.inc
>> -
>> -# To build u-boot for your machine, provide the following lines in your
>> machine
>> -# config, replacing the assignments as appropriate for your machine.
>> -# UBOOT_MACHINE =3D "omap3_beagle_config"
>> -# UBOOT_ENTRYPOINT =3D "0x80008000"
>> -# UBOOT_LOADADDRESS =3D "0x80008000"
>> -
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>> file://README;beginline=3D1;endline=3D22;md5=3D3a00ef51d3fc96e9d6c1bc470=
8ccd3b5"
>> -
>> -# This revision corresponds to the tag "v2011.03"
>> -# We use the revision in order to avoid having to fetch it from the rep=
o
>> during parse
>> -SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>> -
>> -PV =3D "v2011.03+git${SRCPV}"
>> -PR =3D "r8"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> deleted file mode 100644
>> index a115ed2..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -require u-boot.inc
>> -
>> -# To build u-boot for your machine, provide the following lines in your
>> machine
>> -# config, replacing the assignments as appropriate for your machine.
>> -# UBOOT_MACHINE =3D "omap3_beagle_config"
>> -# UBOOT_ENTRYPOINT =3D "0x80008000"
>> -# UBOOT_LOADADDRESS =3D "0x80008000"
>> -
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>> file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d0348=
df3fb90"
>> -
>> -# This revision corresponds to the tag "v2011.06"
>> -# We use the revision in order to avoid having to fetch it from the rep=
o
>> during parse
>> -SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>> -
>> -PV =3D "v2011.06+git${SRCPV}"
>> -PR =3D "r3"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>> similarity index 69%
>> rename from meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
>> rename to meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>> index 8ffb8f3..2603ad1 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>> @@ -1,9 +1,5 @@
>>   require u-boot.inc
>>
>> -# This is needs to be validated among supported BSP's before we can
>> -# make it default
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>>   # To build u-boot for your machine, provide the following lines in
>>   # your machine config, replacing the assignments as appropriate for
>>   # your machine.
>> @@ -12,14 +8,15 @@ DEFAULT_PREFERENCE =3D "-1"
>>   # UBOOT_LOADADDRESS =3D "0x80008000"
>>
>>   LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> +
>> file://README;beginline=3D1;endline=3D22;md5=3D78b195c11cb6ef63e6985140d=
b7d7bab"
>>
>> -# This revision corresponds to the tag "v2013.01.01"
>> +# This revision corresponds to the tag "v2013.07"
>>   # We use the revision in order to avoid having to fetch it from the
>>   # repo during parse
>> -SRCREV =3D "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
>> +SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>>
>> -PV =3D "v2013.01.01+git${SRCPV}"
>> +PV =3D "v2013.07+git${SRCPV}"
>>   PR =3D "r0"
>>
>>   SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dg=
it"
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

