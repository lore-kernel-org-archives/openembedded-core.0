Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A665C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 16:41:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.193.1690821703462022891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 09:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gOyaWzQz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DDD5FF802;
	Mon, 31 Jul 2023 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690821701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcX1w2ZTW8OhlvcUxEzE8cTWifvXfNaK+qc9Pey6lmI=;
	b=gOyaWzQzzgyFMWpg58tgdnq65IW5jVLIgzV3b1BXPNb47L1OSRaqwJsXwMh8uUm3F4YCE2
	jaBI2t/F8nLFCmonprg59OCBSXCKyhYKxsnAceVxjHljBNY3C1krAROpDQVv7yzj0dt7MU
	oQbqBBJUz0WyjQR2OaIG4MD3wO4TcwaxKifLMJBx+OWV+Hf8C9bsGuxwj/Iaswg7CV1drj
	7jO2+LejIWGzwIgOeVLxH5iOLBuAg/H+hc/+UNQ93+T/G8C9lLKhauzdvrof8NvlTg3qOv
	TMlftI2cXUn6gcOuyLnFqc7baFTyxHSSXFKxBdZpEKejFflnkTXqj4v5s7VIJA==
Date: Mon, 31 Jul 2023 18:41:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
Message-ID: <20230731164140c1caf6b8@mail.local>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com>
 <20230731164010faa31974@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731164010faa31974@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 16:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185148

On 31/07/2023 18:40:12+0200, Alexandre Belloni wrote:
> Hello,
> 
> This causes the following failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5570/steps/14/logs/stdio
> 
> 2023-07-30 21:25:44,944 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 297, in test_all_required_variables_set
>     self.assertTrue(line, msg=res.output)
>   File "/usr/lib/python3.10/unittest/case.py", line 687, in assertTrue
>     raise self.failureException(msg)
> AssertionError: None is not true : NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 954 .bb files complete (0 cached, 954 parsed). 1878 targets, 53 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'pam-plugin-umask' (but /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd_254.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'pam-plugin-umask' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['pam-plugin-umask']
> NOTE: Runtime target 'udev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['udev', 'pam-plugin-umask']
> NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> ERROR: Required build target 'core-image-minimal' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-minimal', 'packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
> 
> It repeats for other runtime tests.
> 

Also, qa-extras2 is failing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/7544/steps/22/logs/stdio

> On 31/07/2023 12:27:36+0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > - Drop dependency on gnu-efi, add dependency on pyelftools for EFI builds
> > - Refresh patches
> > - Ship new files and directories
> > - Use meson target to build sd-boot instead of filenames
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > Note that the musl patches have been rebased to solve merge conflicts,
> > but not tested in any way.
> > v2: changed mount.ddi from sbindir to base_sbindir, unified efi and
> >     bootloader packageconfigs as it's not useful to use one witout the
> >     other
> > v3: add rrecommends on pam-plugin-umask on systemd if logind is enabled
> >     as the default configuration optionally loads this plugin
> > v4: fix typo in sd-boot meson cross (cc -> c) and restore EFI_LD variable
> >     to allow overrides
> > 
> >  ...temd-boot_253.7.bb => systemd-boot_254.bb} |  21 +-
> >  meta/recipes-core/systemd/systemd.inc         |   5 +-
> >  ...tall-dependency-links-at-install-tim.patch |  42 +--
> >  ...util-Make-STRERROR-portable-for-musl.patch |   7 +-
> >  ...sysctl.d-binfmt.d-modules-load.d-to-.patch |   2 +-
> >  ...k-parse_printf_format-implementation.patch |   6 +-
> >  ...missing.h-check-for-missing-strndupa.patch |  69 ++--
> >  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   4 +-
> >  ...14-Use-uintmax_t-for-handling-rlim_t.patch |   2 +-
> >  ...sable-tests-for-missing-typedefs-in-.patch |  41 ---
> >  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  12 +-
> >  ...uffering-when-writing-to-oom_score_a.patch |   2 +-
> >  ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
> >  ...-not-disable-buffer-in-writing-files.patch | 142 ++++---
> >  .../0022-Handle-__cpu_mask-usage.patch        |   4 +-
> >  .../systemd/0023-Handle-missing-gshadow.patch |  28 +-
> >  ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   2 +-
> >  ...-string.c-define-wchar_t-from-__WCHA.patch |  44 ---
> >  meta/recipes-core/systemd/systemd/27253.patch | 313 ----------------
> >  meta/recipes-core/systemd/systemd/27254.patch | 345 ------------------
> >  .../{systemd_253.7.bb => systemd_254.bb}      |  14 +-
> >  21 files changed, 176 insertions(+), 931 deletions(-)
> >  rename meta/recipes-core/systemd/{systemd-boot_253.7.bb => systemd-boot_254.bb} (77%)
> >  delete mode 100644 meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> >  delete mode 100644 meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> >  delete mode 100644 meta/recipes-core/systemd/systemd/27253.patch
> >  delete mode 100644 meta/recipes-core/systemd/systemd/27254.patch
> >  rename meta/recipes-core/systemd/{systemd_253.7.bb => systemd_254.bb} (98%)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd-boot_253.7.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
> > similarity index 77%
> > rename from meta/recipes-core/systemd/systemd-boot_253.7.bb
> > rename to meta/recipes-core/systemd/systemd-boot_254.bb
> > index b67706b7316..e887e636e86 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_253.7.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> > @@ -3,29 +3,27 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> >  
> >  require conf/image-uefi.conf
> >  
> > -DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native python3-jinja2-native"
> > +DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
> >  
> >  inherit meson pkgconfig gettext
> >  inherit deploy
> >  
> >  LDFLAGS:prepend = "${@ " ".join(d.getVar('LD').split()[1:])} "
> >  
> > -do_write_config[vardeps] += "CC OBJCOPY"
> > +EFI_LD = "bfd"
> > +
> > +do_write_config[vardeps] += "CC OBJCOPY EFI_LD"
> >  do_write_config:append() {
> >      cat >${WORKDIR}/meson-${PN}.cross <<EOF
> >  [binaries]
> > -efi_cc = ${@meson_array('CC', d)}
> > +c = ${@meson_array('CC', d)}
> >  objcopy = ${@meson_array('OBJCOPY', d)}
> > +c_ld = ${@meson_array('EFI_LD', d)}
> >  EOF
> >  }
> >  
> > -EFI_LD = "bfd"
> > -
> >  EXTRA_OEMESON += "-Defi=true \
> > -                  -Dgnu-efi=true \
> > -                  -Defi-includedir=${STAGING_INCDIR}/efi \
> > -                  -Defi-libdir=${STAGING_LIBDIR} \
> > -                  -Defi-ld=${EFI_LD} \
> > +                  -Dbootloader=true \
> >                    -Dman=false \
> >                    --cross-file ${WORKDIR}/meson-${PN}.cross \
> >                    "
> > @@ -54,9 +52,7 @@ COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
> >  COMPATIBLE_HOST:x86-x32 = "null"
> >  
> >  do_compile() {
> > -	ninja \
> > -		src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE} \
> > -		src/boot/efi/linux${EFI_ARCH}.efi.stub
> > +	ninja systemd-boot
> >  }
> >  
> >  do_install() {
> > @@ -67,6 +63,7 @@ do_install() {
> >  do_deploy () {
> >  	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
> >  	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOYDIR}
> > +	install ${B}/src/boot/efi/addon*.efi.stub ${DEPLOYDIR}
> >  }
> >  
> >  addtask deploy before do_build after do_compile
> > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> > index c2f2899044f..b00a49884be 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -14,10 +14,9 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> >  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> >                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
> >  
> > -SRCREV = "f1c4da0414640cf201147144f558e1af31a3ae80"
> > -SRCBRANCH = "v253-stable"
> > +SRCREV = "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
> > +SRCBRANCH = "v254-stable"
> >  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
> > -           file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
> >             "
> >  
> >  S = "${WORKDIR}/git"
> > diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > index 43611e65fbc..085f1e9052f 100644
> > --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > @@ -19,40 +19,36 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >  [rebased for systemd 243]
> >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> >  ---
> > - units/meson.build                       | 6 ++----
> > + units/meson.build                       | 2 --
> >   units/proc-sys-fs-binfmt_misc.automount | 3 +++
> >   units/systemd-binfmt.service.in         | 4 ++++
> > - 3 files changed, 9 insertions(+), 4 deletions(-)
> > + 3 files changed, 7 insertions(+), 2 deletions(-)
> >  
> >  diff --git a/units/meson.build b/units/meson.build
> >  index c7939a10f8..219570ab19 100644
> >  --- a/units/meson.build
> >  +++ b/units/meson.build
> > -@@ -62,8 +62,7 @@ units = [
> > -         ['poweroff.target',                     '',
> > -          (with_runlevels ? 'runlevel0.target' : '')],
> > -         ['printer.target',                      ''],
> > --        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT',
> > --         'sysinit.target.wants/'],
> > -+        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT'],
> > -         ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
> > -         ['reboot.target',                       '',
> > -          'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
> > -@@ -185,8 +184,7 @@ in_units = [
> > -         ['rescue.service',                       ''],
> > -         ['serial-getty@.service',                ''],
> > -         ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
> > --        ['systemd-binfmt.service',               'ENABLE_BINFMT',
> > --         'sysinit.target.wants/'],
> > -+        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
> > -         ['systemd-bless-boot.service',           'HAVE_GNU_EFI HAVE_BLKID'],
> > -         ['systemd-boot-check-no-failures.service', ''],
> > -         ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
> > +@@ -149,7 +149,6 @@ units = [
> > +         {
> > +           'file' : 'proc-sys-fs-binfmt_misc.automount',
> > +           'conditions' : ['ENABLE_BINFMT'],
> > +-          'symlinks' : ['sysinit.target.wants/'],
> > +         },
> > +         {
> > +           'file' : 'proc-sys-fs-binfmt_misc.mount',
> > +@@ -246,7 +245,6 @@ units = [
> > +         {
> > +           'file' : 'systemd-binfmt.service.in',
> > +           'conditions' : ['ENABLE_BINFMT'],
> > +-          'symlinks' : ['sysinit.target.wants/'],
> > +         },
> > +         {
> > +           'file' : 'systemd-bless-boot.service.in',
> >  diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
> >  index 6b1bbdc91e..5ec5b8670a 100644
> >  --- a/units/proc-sys-fs-binfmt_misc.automount
> >  +++ b/units/proc-sys-fs-binfmt_misc.automount
> > -@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=/proc/sys/
> > +@@ -22,3 +22,6 @@ Before=shutdown.target
> >   
> >   [Automount]
> >   Where=/proc/sys/fs/binfmt_misc
> > diff --git a/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
> > index e9e69cb6489..fcc56a2e656 100644
> > --- a/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
> > +++ b/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
> > @@ -11,8 +11,8 @@ Upstream-Status: Inappropriate [musl specific]
> >  
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > - src/basic/errno-util.h | 12 ++++++++++--
> > - 1 file changed, 10 insertions(+), 2 deletions(-)
> > + src/basic/errno-util.h | 10 +++++++++-
> > + 1 file changed, 9 insertions(+), 1 deletion(-)
> >  
> >  diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
> >  index 091f99c590..eb5c1f9961 100644
> > @@ -23,9 +23,8 @@ index 091f99c590..eb5c1f9961 100644
> >    *
> >    * Note that we use the GNU variant of strerror_r() here. */
> >  -#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN)
> > --
> >  +static inline const char * STRERROR(int errnum);
> > -+
> > + 
> >  +static inline const char * STRERROR(int errnum) {
> >  +#ifdef __GLIBC__
> >  +        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN);
> > diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> > index aa1f3c2e820..98914ae1544 100644
> > --- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> > +++ b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> > @@ -44,7 +44,7 @@ diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
> >  index 1af3a36d1d..def502b717 100644
> >  --- a/src/libsystemd/sd-path/sd-path.c
> >  +++ b/src/libsystemd/sd-path/sd-path.c
> > -@@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
> > +@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
> >                   return 0;
> >   
> >           case SD_PATH_SYSUSERS:
> > diff --git a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
> > index 2090d81dc39..4143ab4d709 100644
> > --- a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
> > +++ b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
> > @@ -23,7 +23,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> >  
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -755,6 +755,7 @@ endif
> > +@@ -781,6 +781,7 @@ endif
> >   foreach header : ['crypt.h',
> >                     'linux/memfd.h',
> >                     'linux/vm_sockets.h',
> > @@ -33,7 +33,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> >                     'valgrind/memcheck.h',
> >  --- a/src/basic/meson.build
> >  +++ b/src/basic/meson.build
> > -@@ -173,6 +173,11 @@ endforeach
> > +@@ -179,6 +179,11 @@ endforeach
> >   
> >   basic_sources += generated_gperf_headers
> >   
> > @@ -407,7 +407,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> >   #include <stddef.h>
> >   #include <sys/un.h>
> >   #include <unistd.h>
> > -@@ -25,6 +24,7 @@
> > +@@ -27,6 +26,7 @@
> >   #include "stdio-util.h"
> >   #include "string-util.h"
> >   #include "tmpfile-util.h"
> > diff --git a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
> > index bd5f6a6190c..ec451cddb71 100644
> > --- a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
> > +++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
> > @@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >  [rebased for systemd 244]
> >  [Rebased for v247]
> >  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > +[Rebased for v254]
> >  ---
> >   meson.build                                |  1 +
> >   src/backlight/backlight.c                  |  1 +
> > @@ -74,7 +75,7 @@ diff --git a/meson.build b/meson.build
> >  index fb96143c37..739b2f7f72 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -574,6 +574,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
> > +@@ -595,6 +595,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
> >   endforeach
> >   
> >   foreach ident : [
> > @@ -98,7 +99,7 @@ diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> >  index feda596939..11b4375ed5 100644
> >  --- a/src/basic/cgroup-util.c
> >  +++ b/src/basic/cgroup-util.c
> > -@@ -37,6 +37,7 @@
> > +@@ -38,6 +38,7 @@
> >   #include "unit-name.h"
> >   #include "user-util.h"
> >   #include "xattr-util.h"
> > @@ -122,14 +123,14 @@ diff --git a/src/basic/log.c b/src/basic/log.c
> >  index fc5793139e..515218fca8 100644
> >  --- a/src/basic/log.c
> >  +++ b/src/basic/log.c
> > -@@ -39,6 +39,7 @@
> > +@@ -40,6 +40,7 @@
> >   #include "terminal-util.h"
> >   #include "time-util.h"
> >   #include "utf8.h"
> >  +#include "missing_stdlib.h"
> >   
> >   #define SNDBUF_SIZE (8*1024*1024)
> > - #define IOVEC_MAX 128U
> > + #define IOVEC_MAX 256U
> >  diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
> >  index 8c76f93eb2..9068bfb4f0 100644
> >  --- a/src/basic/missing_stdlib.h
> > @@ -166,7 +167,7 @@ diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
> >  index bc74fbef8f..cdb609bb84 100644
> >  --- a/src/basic/mountpoint-util.c
> >  +++ b/src/basic/mountpoint-util.c
> > -@@ -13,6 +13,7 @@
> > +@@ -18,6 +18,7 @@
> >   #include "missing_stat.h"
> >   #include "missing_syscall.h"
> >   #include "mkdir.h"
> > @@ -214,14 +215,14 @@ diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
> >  index eea70d8606..ae3abd8402 100644
> >  --- a/src/basic/proc-cmdline.c
> >  +++ b/src/basic/proc-cmdline.c
> > -@@ -15,6 +15,7 @@
> > - #include "special.h"
> > +@@ -16,6 +16,7 @@
> >   #include "string-util.h"
> > + #include "strv.h"
> >   #include "virt.h"
> >  +#include "missing_stdlib.h"
> >   
> > - int proc_cmdline(char **ret) {
> > -         const char *e;
> > + int proc_cmdline_filter_pid1_args(char **argv, char ***ret) {
> > +         enum {
> >  diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> >  index bcba5a5208..64a95dd866 100644
> >  --- a/src/basic/procfs-util.c
> > @@ -238,7 +239,7 @@ diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> >  index b700f364ef..48a26bcec9 100644
> >  --- a/src/basic/time-util.c
> >  +++ b/src/basic/time-util.c
> > -@@ -26,6 +26,7 @@
> > +@@ -27,6 +27,7 @@
> >   #include "string-util.h"
> >   #include "strv.h"
> >   #include "time-util.h"
> > @@ -262,7 +263,7 @@ diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
> >  index b5484eda78..54ed62c790 100644
> >  --- a/src/core/dbus-cgroup.c
> >  +++ b/src/core/dbus-cgroup.c
> > -@@ -21,6 +21,7 @@
> > +@@ -23,6 +23,7 @@
> >   #include "parse-util.h"
> >   #include "path-util.h"
> >   #include "percent-util.h"
> > @@ -274,7 +275,7 @@ diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
> >  index f514b8fd12..4febd0d496 100644
> >  --- a/src/core/dbus-execute.c
> >  +++ b/src/core/dbus-execute.c
> > -@@ -45,6 +45,7 @@
> > +@@ -48,6 +48,7 @@
> >   #include "unit-printf.h"
> >   #include "user-util.h"
> >   #include "utf8.h"
> > @@ -298,7 +299,7 @@ diff --git a/src/core/execute.c b/src/core/execute.c
> >  index 853e87450f..8ef76de9ab 100644
> >  --- a/src/core/execute.c
> >  +++ b/src/core/execute.c
> > -@@ -105,6 +105,7 @@
> > +@@ -113,6 +113,7 @@
> >   #include "unit-serialize.h"
> >   #include "user-util.h"
> >   #include "utmp-wtmp.h"
> > @@ -310,9 +311,9 @@ diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
> >  index e843743777..e149807492 100644
> >  --- a/src/core/kmod-setup.c
> >  +++ b/src/core/kmod-setup.c
> > -@@ -12,6 +12,7 @@
> > - #include "recurse-dir.h"
> > +@@ -13,6 +13,7 @@
> >   #include "string-util.h"
> > + #include "strv.h"
> >   #include "virt.h"
> >  +#include "missing_stdlib.h"
> >   
> > @@ -322,7 +323,7 @@ diff --git a/src/core/service.c b/src/core/service.c
> >  index 9ad3c3d995..b112d64919 100644
> >  --- a/src/core/service.c
> >  +++ b/src/core/service.c
> > -@@ -42,6 +42,7 @@
> > +@@ -45,6 +45,7 @@
> >   #include "unit-name.h"
> >   #include "unit.h"
> >   #include "utf8.h"
> > @@ -346,7 +347,7 @@ diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-g
> >  index efc553b698..acea922311 100644
> >  --- a/src/fstab-generator/fstab-generator.c
> >  +++ b/src/fstab-generator/fstab-generator.c
> > -@@ -33,6 +33,7 @@
> > +@@ -37,6 +37,7 @@
> >   #include "unit-name.h"
> >   #include "virt.h"
> >   #include "volatile-util.h"
> > @@ -358,7 +359,7 @@ diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journ
> >  index 7df264fb53..9463a0e9fb 100644
> >  --- a/src/journal-remote/journal-remote-main.c
> >  +++ b/src/journal-remote/journal-remote-main.c
> > -@@ -25,6 +25,7 @@
> > +@@ -26,6 +26,7 @@
> >   #include "stat-util.h"
> >   #include "string-table.h"
> >   #include "strv.h"
> > @@ -370,7 +371,7 @@ diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
> >  index da0fac548e..c1c043e0e0 100644
> >  --- a/src/journal/journalctl.c
> >  +++ b/src/journal/journalctl.c
> > -@@ -72,6 +72,7 @@
> > +@@ -77,6 +77,7 @@
> >   #include "unit-name.h"
> >   #include "user-util.h"
> >   #include "varlink.h"
> > @@ -406,7 +407,7 @@ diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-sock
> >  index 64037e4fe0..9b9ce0aaa9 100644
> >  --- a/src/libsystemd/sd-bus/bus-socket.c
> >  +++ b/src/libsystemd/sd-bus/bus-socket.c
> > -@@ -27,6 +27,7 @@
> > +@@ -28,6 +28,7 @@
> >   #include "string-util.h"
> >   #include "user-util.h"
> >   #include "utf8.h"
> > @@ -418,7 +419,7 @@ diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
> >  index f6a5e4aa06..b36faa79a3 100644
> >  --- a/src/libsystemd/sd-bus/sd-bus.c
> >  +++ b/src/libsystemd/sd-bus/sd-bus.c
> > -@@ -44,6 +44,7 @@
> > +@@ -46,6 +46,7 @@
> >   #include "string-util.h"
> >   #include "strv.h"
> >   #include "user-util.h"
> > @@ -442,10 +443,10 @@ diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/
> >  index 9947947ef2..8dc6f93159 100644
> >  --- a/src/libsystemd/sd-journal/sd-journal.c
> >  +++ b/src/libsystemd/sd-journal/sd-journal.c
> > -@@ -41,6 +41,7 @@
> > - #include "string-util.h"
> > +@@ -44,6 +44,7 @@
> >   #include "strv.h"
> >   #include "syslog-util.h"
> > + #include "uid-alloc-range.h"
> >  +#include "missing_stdlib.h"
> >   
> >   #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
> > @@ -454,7 +455,7 @@ diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
> >  index ba2fca32c6..e1f9caa13b 100644
> >  --- a/src/login/pam_systemd.c
> >  +++ b/src/login/pam_systemd.c
> > -@@ -32,6 +32,7 @@
> > +@@ -34,6 +34,7 @@
> >   #include "locale-util.h"
> >   #include "login-util.h"
> >   #include "macro.h"
> > @@ -466,7 +467,7 @@ diff --git a/src/network/generator/network-generator.c b/src/network/generator/n
> >  index 1090934bfc..69a77f66e2 100644
> >  --- a/src/network/generator/network-generator.c
> >  +++ b/src/network/generator/network-generator.c
> > -@@ -13,6 +13,7 @@
> > +@@ -14,6 +14,7 @@
> >   #include "string-table.h"
> >   #include "string-util.h"
> >   #include "strv.h"
> > @@ -502,7 +503,7 @@ diff --git a/src/portable/portable.c b/src/portable/portable.c
> >  index 7811833fac..c6414da91c 100644
> >  --- a/src/portable/portable.c
> >  +++ b/src/portable/portable.c
> > -@@ -39,6 +39,7 @@
> > +@@ -40,6 +40,7 @@
> >   #include "strv.h"
> >   #include "tmpfile-util.h"
> >   #include "user-util.h"
> > @@ -550,7 +551,7 @@ diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
> >  index 1e95e36678..640ee031d5 100644
> >  --- a/src/shared/bus-unit-util.c
> >  +++ b/src/shared/bus-unit-util.c
> > -@@ -50,6 +50,7 @@
> > +@@ -51,6 +51,7 @@
> >   #include "unit-def.h"
> >   #include "user-util.h"
> >   #include "utf8.h"
> > @@ -562,7 +563,7 @@ diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
> >  index d09ec5148d..f38a8f7cc1 100644
> >  --- a/src/shared/bus-util.c
> >  +++ b/src/shared/bus-util.c
> > -@@ -21,6 +21,7 @@
> > +@@ -24,6 +24,7 @@
> >   #include "path-util.h"
> >   #include "socket-util.h"
> >   #include "stdio-util.h"
> > @@ -586,9 +587,9 @@ diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
> >  index d9eabec886..534c6cf7e3 100644
> >  --- a/src/shared/journal-importer.c
> >  +++ b/src/shared/journal-importer.c
> > -@@ -15,6 +15,7 @@
> > - #include "parse-util.h"
> > +@@ -16,6 +16,7 @@
> >   #include "string-util.h"
> > + #include "strv.h"
> >   #include "unaligned.h"
> >  +#include "missing_stdlib.h"
> >   
> > @@ -622,7 +623,7 @@ diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
> >  index 821049e667..08a5bdae3d 100644
> >  --- a/src/socket-proxy/socket-proxyd.c
> >  +++ b/src/socket-proxy/socket-proxyd.c
> > -@@ -26,6 +26,7 @@
> > +@@ -27,6 +27,7 @@
> >   #include "set.h"
> >   #include "socket-util.h"
> >   #include "string-util.h"
> > @@ -646,7 +647,7 @@ diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
> >  index 8e4d57ee72..6b4555b4d5 100644
> >  --- a/src/udev/udev-builtin-path_id.c
> >  +++ b/src/udev/udev-builtin-path_id.c
> > -@@ -22,6 +22,7 @@
> > +@@ -24,6 +24,7 @@
> >   #include "sysexits.h"
> >   #include "udev-builtin.h"
> >   #include "udev-util.h"
> > @@ -670,13 +671,13 @@ diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> >  index 5bd09a64d1..0ce79f815c 100644
> >  --- a/src/udev/udev-rules.c
> >  +++ b/src/udev/udev-rules.c
> > -@@ -34,6 +34,7 @@
> > +@@ -35,6 +35,7 @@
> >   #include "udev-util.h"
> >   #include "user-util.h"
> >   #include "virt.h"
> >  +#include "missing_stdlib.h"
> >   
> > - #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
> > + #define RULES_DIRS ((const char* const*) CONF_PATHS_STRV("udev/rules.d"))
> >   
> >  -- 
> >  2.39.2
> > diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> > index b86cc42589d..0d69e8e9cdb 100644
> > --- a/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> > +++ b/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> > @@ -130,7 +130,7 @@ index 458aed7054..2cf24b38c0 100644
> >   /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
> >    * them in the file system. This is intended to be used to create
> >    * properly owned directories beneath /tmp, /var/tmp, /run, which are
> > -@@ -2194,7 +2200,9 @@ finish:
> > +@@ -2355,7 +2361,9 @@ finish:
> >   
> >   static int glob_item(Item *i, action_t action) {
> >           _cleanup_globfree_ glob_t g = {
> > @@ -140,7 +140,7 @@ index 458aed7054..2cf24b38c0 100644
> >           };
> >           int r = 0, k;
> >   
> > -@@ -2214,7 +2222,9 @@ static int glob_item(Item *i, action_t action) {
> > +@@ -2375,7 +2383,9 @@ static int glob_item(Item *i, action_t action) {
> >   
> >   static int glob_item_recursively(Item *i, fdaction_t action) {
> >           _cleanup_globfree_ glob_t g = {
> > diff --git a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
> > index f586d3ff527..1d50faa363f 100644
> > --- a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
> > +++ b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
> > @@ -89,7 +89,7 @@ diff --git a/src/core/execute.c b/src/core/execute.c
> >  index 8ef76de9ab..ea1c203e43 100644
> >  --- a/src/core/execute.c
> >  +++ b/src/core/execute.c
> > -@@ -6034,9 +6034,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
> > +@@ -6667,9 +6667,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
> >           for (unsigned i = 0; i < RLIM_NLIMITS; i++)
> >                   if (c->rlimit[i]) {
> >                           fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
> > diff --git a/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> > deleted file mode 100644
> > index afc80b9511a..00000000000
> > --- a/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -From 96088895149746dd2ee8e8c2e4b97972ccf44696 Mon Sep 17 00:00:00 2001
> > -From: Chen Qi <Qi.Chen@windriver.com>
> > -Date: Wed, 28 Feb 2018 21:25:22 -0800
> > -Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
> > -
> > -Upstream-Status: Inappropriate [musl specific]
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ----
> > - src/test/test-sizeof.c | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> > -index 55bd81e22f..6cf92bffde 100644
> > ---- a/src/test/test-sizeof.c
> > -+++ b/src/test/test-sizeof.c
> > -@@ -55,8 +55,10 @@ int main(void) {
> > -         info(unsigned);
> > -         info(unsigned long);
> > -         info(unsigned long long);
> > -+#ifdef __GLIBC__
> > -         info(__syscall_ulong_t);
> > -         info(__syscall_slong_t);
> > -+#endif
> > -         info(intmax_t);
> > -         info(uintmax_t);
> > - 
> > -@@ -76,7 +78,9 @@ int main(void) {
> > -         info(ssize_t);
> > -         info(time_t);
> > -         info(usec_t);
> > -+#ifdef __GLIBC__
> > -         info(__time_t);
> > -+#endif
> > -         info(pid_t);
> > -         info(uid_t);
> > -         info(gid_t);
> > --- 
> > -2.39.2
> > -
> > diff --git a/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> > index 2f84d3d6c25..543fba7cdbc 100644
> > --- a/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> > +++ b/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> > @@ -34,7 +34,7 @@ diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
> >  index 932d003f19..33215dbf5f 100644
> >  --- a/src/basic/fs-util.h
> >  +++ b/src/basic/fs-util.h
> > -@@ -50,8 +50,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
> > +@@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
> >   int fd_warn_permissions(const char *path, int fd);
> >   int stat_warn_permissions(const char *path, const struct stat *st);
> >   
> > @@ -67,16 +67,16 @@ diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
> >  index be6dd1654a..2726dc946a 100644
> >  --- a/src/shared/base-filesystem.c
> >  +++ b/src/shared/base-filesystem.c
> > -@@ -131,7 +131,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
> > -                 return log_error_errno(errno, "Failed to open root file system: %m");
> > +@@ -145,7 +145,7 @@ int base_filesystem_create_fd(int fd, const char *root, uid_t uid, gid_t gid) {
> > +         /* The "root" parameter is decoration only – it's only used as part of log messages */
> >   
> >           for (size_t i = 0; i < ELEMENTSOF(table); i++) {
> >  -                if (faccessat(fd, table[i].dir, F_OK, AT_SYMLINK_NOFOLLOW) >= 0)
> >  +                if (faccessat(fd, table[i].dir, F_OK, 0) >= 0)
> >                           continue;
> >   
> > -                 if (table[i].target) {
> > -@@ -139,7 +139,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
> > +                 if (table[i].target) { /* Create as symlink? */
> > +@@ -153,7 +153,7 @@ int base_filesystem_create_fd(int fd, const char *root, uid_t uid, gid_t gid) {
> >   
> >                           /* check if one of the targets exists */
> >                           NULSTR_FOREACH(s, table[i].target) {
> > @@ -85,7 +85,7 @@ index be6dd1654a..2726dc946a 100644
> >                                           continue;
> >   
> >                                   /* check if a specific file exists at the target path */
> > -@@ -150,7 +150,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
> > +@@ -164,7 +164,7 @@ int base_filesystem_create_fd(int fd, const char *root, uid_t uid, gid_t gid) {
> >                                           if (!p)
> >                                                   return log_oom();
> >   
> > diff --git a/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > index 401a9a9546c..8162bc2c57f 100644
> > --- a/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > +++ b/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > @@ -27,7 +27,7 @@ diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> >  index 0747c14c1c..8d0c5aae92 100644
> >  --- a/src/basic/process-util.c
> >  +++ b/src/basic/process-util.c
> > -@@ -1405,7 +1405,7 @@ int set_oom_score_adjust(int value) {
> > +@@ -1516,7 +1516,7 @@ int set_oom_score_adjust(int value) {
> >           xsprintf(t, "%i", value);
> >   
> >           return write_string_file("/proc/self/oom_score_adj", t,
> > diff --git a/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> > index 48b8eda0a5e..f6d908f9476 100644
> > --- a/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> > +++ b/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> > @@ -58,7 +58,7 @@ diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journa
> >  index 136ebcb153..8a75ba4ecd 100644
> >  --- a/src/libsystemd/sd-journal/journal-send.c
> >  +++ b/src/libsystemd/sd-journal/journal-send.c
> > -@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
> > +@@ -360,7 +360,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
> >                   char* j;
> >   
> >                   errno = 0;
> > diff --git a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
> > index 46267a5ada9..ef6b5342ca1 100644
> > --- a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
> > +++ b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
> > @@ -18,34 +18,35 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> >  [rebased for systemd 243]
> >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > +[rebased for systemd 254]
> >  ---
> > - src/basic/cgroup-util.c                 | 12 ++++++------
> > - src/basic/namespace-util.c              |  4 ++--
> > - src/basic/procfs-util.c                 |  4 ++--
> > - src/basic/sysctl-util.c                 |  2 +-
> > - src/binfmt/binfmt.c                     |  6 +++---
> > - src/core/cgroup.c                       |  2 +-
> > - src/core/main.c                         |  2 +-
> > - src/core/smack-setup.c                  |  8 ++++----
> > - src/hibernate-resume/hibernate-resume.c |  2 +-
> > - src/home/homework.c                     |  2 +-
> > - src/libsystemd/sd-device/sd-device.c    |  2 +-
> > - src/nspawn/nspawn-cgroup.c              |  2 +-
> > - src/nspawn/nspawn.c                     |  6 +++---
> > - src/shared/binfmt-util.c                |  2 +-
> > - src/shared/cgroup-setup.c               |  4 ++--
> > - src/shared/coredump-util.c              |  2 +-
> > - src/shared/smack-util.c                 |  2 +-
> > - src/sleep/sleep.c                       |  8 ++++----
> > - src/udev/udev-rules.c                   |  1 -
> > - src/vconsole/vconsole-setup.c           |  2 +-
> > - 20 files changed, 37 insertions(+), 38 deletions(-)
> > + src/basic/cgroup-util.c              | 12 ++++++------
> > + src/basic/namespace-util.c           |  4 ++--
> > + src/basic/procfs-util.c              |  4 ++--
> > + src/basic/sysctl-util.c              |  2 +-
> > + src/binfmt/binfmt.c                  |  6 +++---
> > + src/core/cgroup.c                    |  2 +-
> > + src/core/main.c                      |  2 +-
> > + src/core/smack-setup.c               |  8 ++++----
> > + src/home/homework.c                  |  2 +-
> > + src/libsystemd/sd-device/sd-device.c |  2 +-
> > + src/nspawn/nspawn-cgroup.c           |  2 +-
> > + src/nspawn/nspawn.c                  |  6 +++---
> > + src/shared/binfmt-util.c             |  2 +-
> > + src/shared/cgroup-setup.c            |  4 ++--
> > + src/shared/coredump-util.c           |  2 +-
> > + src/shared/sleep-util.c              |  4 ++--
> > + src/shared/smack-util.c              |  2 +-
> > + src/sleep/sleep.c                    |  4 ++--
> > + src/udev/udev-rules.c                |  1 -
> > + src/vconsole/vconsole-setup.c        |  2 +-
> > + 20 files changed, 36 insertions(+), 37 deletions(-)
> >  
> >  diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> >  index 11b4375ed5..7d81a6007f 100644
> >  --- a/src/basic/cgroup-util.c
> >  +++ b/src/basic/cgroup-util.c
> > -@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
> > +@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
> >           if (r < 0)
> >                   return r;
> >   
> > @@ -54,7 +55,7 @@ index 11b4375ed5..7d81a6007f 100644
> >           if (r < 0)
> >                   return r;
> >   
> > -@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
> > +@@ -806,7 +806,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
> >   
> >           sc = strstrip(contents);
> >           if (isempty(sc)) {
> > @@ -63,7 +64,7 @@ index 11b4375ed5..7d81a6007f 100644
> >                   if (r < 0)
> >                           return r;
> >           } else if (!path_equal(sc, agent))
> > -@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
> > +@@ -824,7 +824,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
> >   
> >           sc = strstrip(contents);
> >           if (streq(sc, "0")) {
> > @@ -72,7 +73,7 @@ index 11b4375ed5..7d81a6007f 100644
> >                   if (r < 0)
> >                           return r;
> >   
> > -@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controller) {
> > +@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const char *controller) {
> >           if (r < 0)
> >                   return r;
> >   
> > @@ -81,7 +82,7 @@ index 11b4375ed5..7d81a6007f 100644
> >           if (r < 0)
> >                   return r;
> >   
> > -@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controller) {
> > +@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const char *controller) {
> >           if (r < 0)
> >                   return r;
> >   
> > @@ -90,7 +91,7 @@ index 11b4375ed5..7d81a6007f 100644
> >           if (r < 0)
> >                   return r;
> >   
> > -@@ -1752,7 +1752,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
> > +@@ -1764,7 +1764,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
> >           if (r < 0)
> >                   return r;
> >   
> > @@ -103,7 +104,7 @@ diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
> >  index f5c0e04cec..272b920022 100644
> >  --- a/src/basic/namespace-util.c
> >  +++ b/src/basic/namespace-util.c
> > -@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
> > +@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
> >                   freeze();
> >   
> >           xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
> > @@ -186,7 +187,7 @@ diff --git a/src/core/cgroup.c b/src/core/cgroup.c
> >  index 4cac3f6a89..bebe2cd120 100644
> >  --- a/src/core/cgroup.c
> >  +++ b/src/core/cgroup.c
> > -@@ -4267,7 +4267,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
> > +@@ -4349,7 +4349,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
> >                           u->freezer_state = FREEZER_THAWING;
> >           }
> >   
> > @@ -199,7 +200,7 @@ diff --git a/src/core/main.c b/src/core/main.c
> >  index c0b8126d96..fe676320ba 100644
> >  --- a/src/core/main.c
> >  +++ b/src/core/main.c
> > -@@ -1716,7 +1716,7 @@ static void initialize_core_pattern(bool skip_setup) {
> > +@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool skip_setup) {
> >           if (getpid_cached() != 1)
> >                   return;
> >   
> > @@ -234,19 +235,6 @@ index bcaa237c8d..4032bde19e 100644
> >           if (r < 0)
> >                   log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
> >   #endif
> > -diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
> > -index 9a9df5d22f..75ddec881a 100644
> > ---- a/src/hibernate-resume/hibernate-resume.c
> > -+++ b/src/hibernate-resume/hibernate-resume.c
> > -@@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
> > -                 return EXIT_FAILURE;
> > -         }
> > - 
> > --        r = write_string_file("/sys/power/resume", FORMAT_DEVNUM(st.st_rdev), WRITE_STRING_FILE_DISABLE_BUFFER);
> > -+        r = write_string_file("/sys/power/resume", FORMAT_DEVNUM(st.st_rdev), 0);
> > -         if (r < 0) {
> > -                 log_error_errno(r, "Failed to write '" DEVNUM_FORMAT_STR "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
> > -                 return EXIT_FAILURE;
> >  diff --git a/src/home/homework.c b/src/home/homework.c
> >  index 28907386a4..f9e45349a7 100644
> >  --- a/src/home/homework.c
> > @@ -264,7 +252,7 @@ diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-
> >  index 8c65ee3469..153edab081 100644
> >  --- a/src/libsystemd/sd-device/sd-device.c
> >  +++ b/src/libsystemd/sd-device/sd-device.c
> > -@@ -2481,7 +2481,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
> > +@@ -2515,7 +2515,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
> >           if (!value)
> >                   return -ENOMEM;
> >   
> > @@ -290,7 +278,7 @@ diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> >  index 36d336dfc8..8c5c69596b 100644
> >  --- a/src/nspawn/nspawn.c
> >  +++ b/src/nspawn/nspawn.c
> > -@@ -2771,7 +2771,7 @@ static int reset_audit_loginuid(void) {
> > +@@ -2774,7 +2774,7 @@ static int reset_audit_loginuid(void) {
> >           if (streq(p, "4294967295"))
> >                   return 0;
> >   
> > @@ -299,7 +287,7 @@ index 36d336dfc8..8c5c69596b 100644
> >           if (r < 0) {
> >                   log_error_errno(r,
> >                                   "Failed to reset audit login UID. This probably means that your kernel is too\n"
> > -@@ -4211,7 +4211,7 @@ static int setup_uid_map(
> > +@@ -4214,7 +4214,7 @@ static int setup_uid_map(
> >                   return log_oom();
> >   
> >           xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
> > @@ -308,7 +296,7 @@ index 36d336dfc8..8c5c69596b 100644
> >           if (r < 0)
> >                   return log_error_errno(r, "Failed to write UID map: %m");
> >   
> > -@@ -4221,7 +4221,7 @@ static int setup_uid_map(
> > +@@ -4224,7 +4224,7 @@ static int setup_uid_map(
> >                   return log_oom();
> >   
> >           xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
> > @@ -334,7 +322,7 @@ diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
> >  index 2ea83f05d3..8626bb184c 100644
> >  --- a/src/shared/cgroup-setup.c
> >  +++ b/src/shared/cgroup-setup.c
> > -@@ -350,7 +350,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
> > +@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
> >   
> >           xsprintf(c, PID_FMT "\n", pid);
> >   
> > @@ -343,7 +331,7 @@ index 2ea83f05d3..8626bb184c 100644
> >           if (r == -EOPNOTSUPP && cg_is_threaded(controller, path) > 0)
> >                   /* When the threaded mode is used, we cannot read/write the file. Let's return recognizable error. */
> >                   return -EUCLEAN;
> > -@@ -887,7 +887,7 @@ int cg_enable_everywhere(
> > +@@ -964,7 +964,7 @@ int cg_enable_everywhere(
> >                                           return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
> >                           }
> >   
> > @@ -356,8 +344,8 @@ diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
> >  index 3d2f179049..c1b6c170ac 100644
> >  --- a/src/shared/coredump-util.c
> >  +++ b/src/shared/coredump-util.c
> > -@@ -71,7 +71,7 @@ int set_coredump_filter(uint64_t value) {
> > -         sprintf(t, "0x%"PRIx64, value);
> > +@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
> > +         xsprintf(t, "0x%"PRIx64, value);
> >   
> >           return write_string_file("/proc/self/coredump_filter", t,
> >  -                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
> > @@ -365,11 +353,33 @@ index 3d2f179049..c1b6c170ac 100644
> >   }
> >   
> >   /* Turn off core dumps but only if we're running outside of a container. */
> > +diff --git a/src/shared/sleep-util.c b/src/shared/sleep-util.c
> > +index d7277399fb..d06d636fcc 100644
> > +--- a/src/shared/sleep-util.c
> > ++++ b/src/shared/sleep-util.c
> > +@@ -1044,7 +1044,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
> > + 
> > +         /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
> > +          * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
> > +-        r = write_string_file("/sys/power/resume_offset", offset_str, WRITE_STRING_FILE_DISABLE_BUFFER);
> > ++        r = write_string_file("/sys/power/resume_offset", offset_str, 0);
> > +         if (r == -ENOENT) {
> > +                 if (offset != 0)
> > +                         return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
> > +@@ -1060,7 +1060,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
> > +                 log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
> > +                           offset_str, device);
> > + 
> > +-        r = write_string_file("/sys/power/resume", devno_str, WRITE_STRING_FILE_DISABLE_BUFFER);
> > ++        r = write_string_file("/sys/power/resume", devno_str, 0);
> > +         if (r < 0)
> > +                 return log_error_errno(r,
> > +                                        "Failed to write device '%s' (%s) to /sys/power/resume: %m",
> >  diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
> >  index b3b5c905ad..bbfa1973fd 100644
> >  --- a/src/shared/smack-util.c
> >  +++ b/src/shared/smack-util.c
> > -@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
> > +@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
> >                   return 0;
> >   
> >           p = procfs_file_alloca(pid, "attr/current");
> > @@ -382,25 +392,7 @@ diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
> >  index 765dd4974f..cd6afb001b 100644
> >  --- a/src/sleep/sleep.c
> >  +++ b/src/sleep/sleep.c
> > -@@ -50,7 +50,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
> > -         assert(hibernate_location->swap);
> > - 
> > -         xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
> > --        r = write_string_file("/sys/power/resume", resume_str, WRITE_STRING_FILE_DISABLE_BUFFER);
> > -+        r = write_string_file("/sys/power/resume", resume_str, 0);
> > -         if (r < 0)
> > -                 return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
> > -                                        hibernate_location->swap->device, resume_str);
> > -@@ -77,7 +77,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
> > -         }
> > - 
> > -         xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
> > --        r = write_string_file("/sys/power/resume_offset", offset_str, WRITE_STRING_FILE_DISABLE_BUFFER);
> > -+        r = write_string_file("/sys/power/resume_offset", offset_str, 0);
> > -         if (r < 0)
> > -                 return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
> > -                                        hibernate_location->swap->device, offset_str);
> > -@@ -93,7 +93,7 @@ static int write_mode(char **modes) {
> > +@@ -139,7 +139,7 @@ static int write_mode(char **modes) {
> >           STRV_FOREACH(mode, modes) {
> >                   int k;
> >   
> > @@ -409,7 +401,7 @@ index 765dd4974f..cd6afb001b 100644
> >                   if (k >= 0)
> >                           return 0;
> >   
> > -@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
> > +@@ -160,7 +160,7 @@ static int write_state(FILE **f, char **states) {
> >           STRV_FOREACH(state, states) {
> >                   int k;
> >   
> > @@ -422,8 +414,8 @@ diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> >  index 0ce79f815c..28aab475d0 100644
> >  --- a/src/udev/udev-rules.c
> >  +++ b/src/udev/udev-rules.c
> > -@@ -2357,7 +2357,6 @@ static int udev_rule_apply_token_to_event(
> > -                 log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
> > +@@ -2634,7 +2634,6 @@ static int udev_rule_apply_token_to_event(
> > +                 log_event_debug(dev, token, "ATTR '%s' writing '%s'", buf, value);
> >                   r = write_string_file(buf, value,
> >                                         WRITE_STRING_FILE_VERIFY_ON_FAILURE |
> >  -                                      WRITE_STRING_FILE_DISABLE_BUFFER |
> > @@ -434,7 +426,7 @@ diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
> >  index 7d3e9db73f..2d4a0c4c9d 100644
> >  --- a/src/vconsole/vconsole-setup.c
> >  +++ b/src/vconsole/vconsole-setup.c
> > -@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
> > +@@ -259,7 +259,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
> >   static int toggle_utf8_sysfs(bool utf8) {
> >           int r;
> >   
> > diff --git a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> > index 61545f57786..341543afdcf 100644
> > --- a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> > +++ b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> > @@ -46,8 +46,8 @@ index 6cf92bffde..937d26ca55 100644
> >  -#include <sched.h>
> >   #include <stdio.h>
> >   #include <string.h>
> > - #include <sys/types.h>
> > -@@ -10,6 +9,7 @@
> > + #include <sys/resource.h>
> > +@@ -11,6 +10,7 @@
> >   #include <float.h>
> >   
> >   #include "time-util.h"
> > diff --git a/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> > index 7da8798ebc3..19ee3ff311e 100644
> > --- a/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> > +++ b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> > @@ -20,7 +20,7 @@ diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
> >  index 88b8fc2f8f..a819d41bac 100644
> >  --- a/src/shared/user-record-nss.c
> >  +++ b/src/shared/user-record-nss.c
> > -@@ -331,8 +331,10 @@ int nss_group_to_group_record(
> > +@@ -329,8 +329,10 @@ int nss_group_to_group_record(
> >           if (isempty(grp->gr_name))
> >                   return -EINVAL;
> >   
> > @@ -31,7 +31,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >   
> >           g = group_record_new();
> >           if (!g)
> > -@@ -348,6 +350,7 @@ int nss_group_to_group_record(
> > +@@ -346,6 +348,7 @@ int nss_group_to_group_record(
> >   
> >           g->gid = grp->gr_gid;
> >   
> > @@ -39,7 +39,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >           if (sgrp) {
> >                   if (looks_like_hashed_password(utf8_only(sgrp->sg_passwd))) {
> >                           g->hashed_password = strv_new(sgrp->sg_passwd);
> > -@@ -363,6 +366,7 @@ int nss_group_to_group_record(
> > +@@ -361,6 +364,7 @@ int nss_group_to_group_record(
> >                   if (r < 0)
> >                           return r;
> >           }
> > @@ -47,7 +47,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >   
> >           r = json_build(&g->json, JSON_BUILD_OBJECT(
> >                                          JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
> > -@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
> > +@@ -387,6 +391,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
> >           assert(ret_sgrp);
> >           assert(ret_buffer);
> >   
> > @@ -55,7 +55,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >           for (;;) {
> >                   _cleanup_free_ char *buf = NULL;
> >                   struct sgrp sgrp, *result;
> > -@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
> > +@@ -415,6 +420,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
> >                   buflen *= 2;
> >                   buf = mfree(buf);
> >           }
> > @@ -65,7 +65,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >   }
> >   
> >   int nss_group_record_by_name(
> > -@@ -427,7 +435,9 @@ int nss_group_record_by_name(
> > +@@ -426,7 +434,9 @@ int nss_group_record_by_name(
> >           struct group grp, *result;
> >           bool incomplete = false;
> >           size_t buflen = 4096;
> > @@ -75,7 +75,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >           int r;
> >   
> >           assert(name);
> > -@@ -457,6 +467,7 @@ int nss_group_record_by_name(
> > +@@ -455,6 +465,7 @@ int nss_group_record_by_name(
> >                   buf = mfree(buf);
> >           }
> >   
> > @@ -83,7 +83,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >           if (with_shadow) {
> >                   r = nss_sgrp_for_group(result, &sgrp, &sbuf);
> >                   if (r < 0) {
> > -@@ -468,6 +479,9 @@ int nss_group_record_by_name(
> > +@@ -466,6 +477,9 @@ int nss_group_record_by_name(
> >                   incomplete = true;
> >   
> >           r = nss_group_to_group_record(result, sresult, ret);
> > @@ -93,7 +93,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >           if (r < 0)
> >                   return r;
> >   
> > -@@ -484,7 +498,9 @@ int nss_group_record_by_gid(
> > +@@ -483,7 +497,9 @@ int nss_group_record_by_gid(
> >           struct group grp, *result;
> >           bool incomplete = false;
> >           size_t buflen = 4096;
> > @@ -102,8 +102,8 @@ index 88b8fc2f8f..a819d41bac 100644
> >  +#endif
> >           int r;
> >   
> > -         assert(ret);
> > -@@ -512,6 +528,7 @@ int nss_group_record_by_gid(
> > +         for (;;) {
> > +@@ -509,6 +525,7 @@ int nss_group_record_by_gid(
> >                   buf = mfree(buf);
> >           }
> >   
> > @@ -111,7 +111,7 @@ index 88b8fc2f8f..a819d41bac 100644
> >           if (with_shadow) {
> >                   r = nss_sgrp_for_group(result, &sgrp, &sbuf);
> >                   if (r < 0) {
> > -@@ -523,6 +540,9 @@ int nss_group_record_by_gid(
> > +@@ -520,6 +537,9 @@ int nss_group_record_by_gid(
> >                   incomplete = true;
> >   
> >           r = nss_group_to_group_record(result, sresult, ret);
> > @@ -141,7 +141,7 @@ diff --git a/src/shared/userdb.c b/src/shared/userdb.c
> >  index a77eff4407..955e361d3a 100644
> >  --- a/src/shared/userdb.c
> >  +++ b/src/shared/userdb.c
> > -@@ -1044,13 +1044,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
> > +@@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
> >                   if (gr) {
> >                           _cleanup_free_ char *buffer = NULL;
> >                           bool incomplete = false;
> > @@ -158,7 +158,7 @@ index a77eff4407..955e361d3a 100644
> >                           if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
> >                                   r = nss_sgrp_for_group(gr, &sgrp, &buffer);
> >                                   if (r < 0) {
> > -@@ -1063,6 +1065,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
> > +@@ -1057,6 +1059,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
> >                           }
> >   
> >                           r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
> > diff --git a/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> > index 15ff6eb4f8a..d64cec1585b 100644
> > --- a/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> > +++ b/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> > @@ -36,7 +36,7 @@ diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
> >  index 2726dc946a..484f63e0b4 100644
> >  --- a/src/shared/base-filesystem.c
> >  +++ b/src/shared/base-filesystem.c
> > -@@ -19,6 +19,7 @@
> > +@@ -20,6 +20,7 @@
> >   #include "string-util.h"
> >   #include "umask-util.h"
> >   #include "user-util.h"
> > diff --git a/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> > deleted file mode 100644
> > index c7e2280c3b2..00000000000
> > --- a/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 34072f456b4fe880fbb2f18760b64a1a6c1eebb8 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex@linutronix.de>
> > -Date: Mon, 6 Mar 2023 15:24:49 +0100
> > -Subject: [PATCH] src/boot/efi/efi-string.c: define wchar_t from __WCHAR_TYPE__
> > -
> > -systemd-boot relies on wchar_t being 16 bit, and breaks at build time otherwise.
> > -
> > -To set wchar_t to 16 bit it is passing -fshort-wchar to gcc; this has the
> > -desired effect on glibc (which sets wchar_t from __WCHAR_TYPE__) but not on
> > -musl (which hardcodes it to 32 bit).
> > -
> > -This patch ensures wchar_t is set from the compiler flags on all systems; note
> > -that systemd-boot is not actually using functions from musl or other libc, just their headers.
> > -
> > -Meanwhile upstream has refactored the code to not rely on libc headers at all;
> > -however this will not be backported to v253 and we need a different fix.
> > -
> > -Upstream-Status: Inappropriate [fixed differently in trunk according to https://github.com/systemd/systemd/pull/26689]
> > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ----
> > - src/boot/efi/efi-string.c | 6 ++++++
> > - 1 file changed, 6 insertions(+)
> > -
> > -diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> > -index 22923d60f6..5d09d4281f 100644
> > ---- a/src/boot/efi/efi-string.c
> > -+++ b/src/boot/efi/efi-string.c
> > -@@ -2,7 +2,13 @@
> > - 
> > - #include <stdbool.h>
> > - #include <stdint.h>
> > -+
> > -+#if SD_BOOT
> > -+typedef __WCHAR_TYPE__ wchar_t;
> > -+#define __DEFINED_wchar_t
> > -+#else
> > - #include <wchar.h>
> > -+#endif
> > - 
> > - #include "efi-string.h"
> > - 
> > --- 
> > -2.39.2
> > -
> > diff --git a/meta/recipes-core/systemd/systemd/27253.patch b/meta/recipes-core/systemd/systemd/27253.patch
> > deleted file mode 100644
> > index 6c556fe80fd..00000000000
> > --- a/meta/recipes-core/systemd/systemd/27253.patch
> > +++ /dev/null
> > @@ -1,313 +0,0 @@
> > -From 924937cbc0bf692bc6e5b3a0bd3c18347d9521e9 Mon Sep 17 00:00:00 2001
> > -From: Yu Watanabe <watanabe.yu+github@gmail.com>
> > -Date: Thu, 13 Apr 2023 16:40:36 +0900
> > -Subject: [PATCH 1/7] timesync: drop unnecessary initialization
> > -
> > -Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/27253]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/timesync/timesyncd-manager.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > ---- a/src/timesync/timesyncd-manager.c
> > -+++ b/src/timesync/timesyncd-manager.c
> > -@@ -410,7 +410,7 @@ static int manager_receive_response(sd_e
> > -                 .msg_name = &server_addr,
> > -                 .msg_namelen = sizeof(server_addr),
> > -         };
> > --        struct timespec *recv_time = NULL;
> > -+        struct timespec *recv_time;
> > -         triple_timestamp dts;
> > -         ssize_t len;
> > -         double origin, receive, trans, dest, delay, offset, root_distance;
> > -@@ -445,7 +445,7 @@ static int manager_receive_response(sd_e
> > -                 return 0;
> > -         }
> > - 
> > --        recv_time = CMSG_FIND_DATA(&msghdr, SOL_SOCKET, SCM_TIMESTAMPNS, struct timespec);
> > -+        recv_time = CMSG_FIND_AND_COPY_DATA(&msghdr, SOL_SOCKET, SCM_TIMESTAMPNS, struct timespec);
> > -         if (!recv_time)
> > -                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL), "Packet timestamp missing.");
> > - 
> > ---- a/src/basic/socket-util.h
> > -+++ b/src/basic/socket-util.h
> > -@@ -183,17 +183,22 @@ int flush_accept(int fd);
> > -  * riscv32. */
> > - #define CMSG_TYPED_DATA(cmsg, type)                                     \
> > -         ({                                                              \
> > --                struct cmsghdr *_cmsg = cmsg;                           \
> > --                assert_cc(__alignof__(type) <= __alignof__(struct cmsghdr)); \
> > -+                struct cmsghdr *_cmsg = (cmsg);                         \
> > -+                assert_cc(alignof(type) <= alignof(struct cmsghdr));    \
> > -                 _cmsg ? CAST_ALIGN_PTR(type, CMSG_DATA(_cmsg)) : (type*) NULL; \
> > -         })
> > - 
> > - struct cmsghdr* cmsg_find(struct msghdr *mh, int level, int type, socklen_t length);
> > -+void* cmsg_find_and_copy_data(struct msghdr *mh, int level, int type, void *buf, size_t buf_len);
> > - 
> > - /* Type-safe, dereferencing version of cmsg_find() */
> > - #define CMSG_FIND_DATA(mh, level, type, ctype)                          \
> > -         CMSG_TYPED_DATA(cmsg_find(mh, level, type, CMSG_LEN(sizeof(ctype))), ctype)
> > - 
> > -+/* Type-safe version of cmsg_find_and_copy_data() */
> > -+#define CMSG_FIND_AND_COPY_DATA(mh, level, type, ctype)             \
> > -+        (ctype*) cmsg_find_and_copy_data(mh, level, type, &(ctype){}, sizeof(ctype))
> > -+
> > - /* Resolves to a type that can carry cmsghdr structures. Make sure things are properly aligned, i.e. the type
> > -  * itself is placed properly in memory and the size is also aligned to what's appropriate for "cmsghdr"
> > -  * structures. */
> > ---- a/src/boot/efi/pe.c
> > -+++ b/src/boot/efi/pe.c
> > -@@ -197,7 +197,7 @@ static uint32_t get_compatibility_entry_
> > -                 uint32_t entry_point;
> > -         } _packed_ LinuxPeCompat1;
> > - 
> > --        while (size >= sizeof(LinuxPeCompat1) && addr % __alignof__(LinuxPeCompat1) == 0) {
> > -+        while (size >= sizeof(LinuxPeCompat1) && addr % alignof(LinuxPeCompat1) == 0) {
> > -                 LinuxPeCompat1 *compat = (LinuxPeCompat1 *) ((uint8_t *) dos + addr);
> > - 
> > -                 if (compat->type == 0 || compat->size == 0 || compat->size > size)
> > ---- a/src/fundamental/macro-fundamental.h
> > -+++ b/src/fundamental/macro-fundamental.h
> > -@@ -6,12 +6,13 @@
> > - #endif
> > - 
> > - #include <limits.h>
> > -+#include <stdalign.h>
> > - #include <stdbool.h>
> > - #include <stddef.h>
> > - #include <stdint.h>
> > - 
> > - #define _align_(x) __attribute__((__aligned__(x)))
> > --#define _alignas_(x) __attribute__((__aligned__(__alignof__(x))))
> > -+#define _alignas_(x) __attribute__((__aligned__(alignof(x))))
> > - #define _alignptr_ __attribute__((__aligned__(sizeof(void *))))
> > - #define _cleanup_(x) __attribute__((__cleanup__(x)))
> > - #define _const_ __attribute__((__const__))
> > -@@ -346,9 +347,9 @@ static inline size_t ALIGN_TO(size_t l,
> > - #endif
> > - 
> > - /* Checks if the specified pointer is aligned as appropriate for the specific type */
> > --#define IS_ALIGNED16(p) (((uintptr_t) p) % __alignof__(uint16_t) == 0)
> > --#define IS_ALIGNED32(p) (((uintptr_t) p) % __alignof__(uint32_t) == 0)
> > --#define IS_ALIGNED64(p) (((uintptr_t) p) % __alignof__(uint64_t) == 0)
> > -+#define IS_ALIGNED16(p) (((uintptr_t) p) % alignof(uint16_t) == 0)
> > -+#define IS_ALIGNED32(p) (((uintptr_t) p) % alignof(uint32_t) == 0)
> > -+#define IS_ALIGNED64(p) (((uintptr_t) p) % alignof(uint64_t) == 0)
> > - 
> > - /* Same as ALIGN_TO but callable in constant contexts. */
> > - #define CONST_ALIGN_TO(l, ali)                                         \
> > -@@ -366,7 +367,7 @@ static inline size_t ALIGN_TO(size_t l,
> > - #define CAST_ALIGN_PTR(t, p)                                    \
> > -         ({                                                      \
> > -                 const void *_p = (p);                           \
> > --                assert(((uintptr_t) _p) % __alignof__(t) == 0); \
> > -+                assert(((uintptr_t) _p) % alignof(t) == 0); \
> > -                 (t *) _p;                                       \
> > -         })
> > - 
> > ---- a/src/network/networkd-nexthop.c
> > -+++ b/src/network/networkd-nexthop.c
> > -@@ -894,7 +894,7 @@ int manager_rtnl_process_nexthop(sd_netl
> > -                         return 0;
> > -                 }
> > - 
> > --                assert((uintptr_t) group % __alignof__(struct nexthop_grp) == 0);
> > -+                assert((uintptr_t) group % alignof(struct nexthop_grp) == 0);
> > - 
> > -                 n_group = raw_group_size / sizeof(struct nexthop_grp);
> > -                 for (size_t i = 0; i < n_group; i++) {
> > ---- a/src/test/test-sizeof.c
> > -+++ b/src/test/test-sizeof.c
> > -@@ -17,16 +17,16 @@
> > - DISABLE_WARNING_TYPE_LIMITS;
> > - 
> > - #define info_no_sign(t)                                                 \
> > --        printf("%s → %zu bits, %zu byte alignment\n", STRINGIFY(t),     \
> > -+        printf("%s → %zu bits, %zu byte alignment\n", STRINGIFY(t),    \
> > -                sizeof(t)*CHAR_BIT,                                      \
> > --               __alignof__(t))
> > -+               alignof(t))
> > - 
> > - #define info(t)                                                         \
> > --        printf("%s → %zu bits%s, %zu byte alignment\n", STRINGIFY(t),   \
> > -+        printf("%s → %zu bits%s, %zu byte alignment\n", STRINGIFY(t),  \
> > -                sizeof(t)*CHAR_BIT,                                      \
> > -                strstr(STRINGIFY(t), "signed") ? "" :                    \
> > -                (t)-1 < (t)0 ? ", signed" : ", unsigned",                \
> > --               __alignof__(t))
> > -+               alignof(t))
> > - 
> > - enum Enum {
> > -         enum_value,
> > -@@ -44,7 +44,7 @@ enum BigEnum2 {
> > - int main(void) {
> > -         int (*function_pointer)(void);
> > - 
> > --        info_no_sign(function_pointer);
> > -+        info_no_sign(typeof(function_pointer));
> > -         info_no_sign(void*);
> > -         info(char*);
> > - 
> > ---- a/src/basic/socket-util.c
> > -+++ b/src/basic/socket-util.c
> > -@@ -1171,6 +1171,18 @@ struct cmsghdr* cmsg_find(struct msghdr
> > -         return NULL;
> > - }
> > - 
> > -+void* cmsg_find_and_copy_data(struct msghdr *mh, int level, int type, void *buf, size_t buf_len) {
> > -+        struct cmsghdr *cmsg;
> > -+
> > -+        assert(mh);
> > -+
> > -+        cmsg = cmsg_find(mh, level, type, buf_len == SIZE_MAX ? (socklen_t) -1 : CMSG_LEN(buf_len));
> > -+        if (!cmsg)
> > -+                return NULL;
> > -+
> > -+        return memcpy_safe(buf, CMSG_DATA(cmsg), buf_len == SIZE_MAX ? cmsg->cmsg_len : buf_len);
> > -+}
> > -+
> > - int socket_ioctl_fd(void) {
> > -         int fd;
> > - 
> > ---- a/src/journal/journald-server.c
> > -+++ b/src/journal/journald-server.c
> > -@@ -1385,7 +1385,7 @@ int server_process_datagram(
> > -         size_t label_len = 0, m;
> > -         Server *s = ASSERT_PTR(userdata);
> > -         struct ucred *ucred = NULL;
> > --        struct timeval *tv = NULL;
> > -+        struct timeval tv_buf, *tv = NULL;
> > -         struct cmsghdr *cmsg;
> > -         char *label = NULL;
> > -         struct iovec iovec;
> > -@@ -1461,10 +1461,10 @@ int server_process_datagram(
> > -                         label = CMSG_TYPED_DATA(cmsg, char);
> > -                         label_len = cmsg->cmsg_len - CMSG_LEN(0);
> > -                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
> > --                           cmsg->cmsg_type == SO_TIMESTAMP &&
> > -+                           cmsg->cmsg_type == SCM_TIMESTAMP &&
> > -                            cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval))) {
> > -                         assert(!tv);
> > --                        tv = CMSG_TYPED_DATA(cmsg, struct timeval);
> > -+                        tv = memcpy(&tv_buf, CMSG_DATA(cmsg), sizeof(struct timeval));
> > -                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
> > -                          cmsg->cmsg_type == SCM_RIGHTS) {
> > -                         assert(!fds);
> > ---- a/src/libsystemd-network/icmp6-util.c
> > -+++ b/src/libsystemd-network/icmp6-util.c
> > -@@ -199,9 +199,11 @@ int icmp6_receive(int fd, void *buffer,
> > -                 }
> > - 
> > -                 if (cmsg->cmsg_level == SOL_SOCKET &&
> > --                    cmsg->cmsg_type == SO_TIMESTAMP &&
> > --                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)))
> > --                        triple_timestamp_from_realtime(&t, timeval_load(CMSG_TYPED_DATA(cmsg, struct timeval)));
> > -+                    cmsg->cmsg_type == SCM_TIMESTAMP &&
> > -+                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval))) {
> > -+                        struct timeval *tv = memcpy(&(struct timeval) {}, CMSG_DATA(cmsg), sizeof(struct timeval));
> > -+                        triple_timestamp_from_realtime(&t, timeval_load(tv));
> > -+                }
> > -         }
> > - 
> > -         if (!triple_timestamp_is_set(&t))
> > ---- a/src/libsystemd-network/sd-dhcp6-client.c
> > -+++ b/src/libsystemd-network/sd-dhcp6-client.c
> > -@@ -1276,7 +1276,6 @@ static int client_receive_message(
> > -                 .msg_control = &control,
> > -                 .msg_controllen = sizeof(control),
> > -         };
> > --        struct cmsghdr *cmsg;
> > -         triple_timestamp t = {};
> > -         _cleanup_free_ DHCP6Message *message = NULL;
> > -         struct in6_addr *server_address = NULL;
> > -@@ -1320,12 +1319,9 @@ static int client_receive_message(
> > -                 server_address = &sa.in6.sin6_addr;
> > -         }
> > - 
> > --        CMSG_FOREACH(cmsg, &msg) {
> > --                if (cmsg->cmsg_level == SOL_SOCKET &&
> > --                    cmsg->cmsg_type == SO_TIMESTAMP &&
> > --                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)))
> > --                        triple_timestamp_from_realtime(&t, timeval_load(CMSG_TYPED_DATA(cmsg, struct timeval)));
> > --        }
> > -+        struct timeval *tv = CMSG_FIND_AND_COPY_DATA(&msg, SOL_SOCKET, SCM_TIMESTAMP, struct timeval);
> > -+        if (tv)
> > -+                triple_timestamp_from_realtime(&t, timeval_load(tv));
> > - 
> > -         if (client->transaction_id != (message->transaction_id & htobe32(0x00ffffff)))
> > -                 return 0;
> > ---- a/src/libsystemd-network/sd-dhcp-server.c
> > -+++ b/src/libsystemd-network/sd-dhcp-server.c
> > -@@ -407,7 +407,7 @@ static int dhcp_server_send_udp(sd_dhcp_
> > -                    rather than binding the socket. This will be mostly useful
> > -                    when we gain support for arbitrary number of server addresses
> > -                  */
> > --                pktinfo = (struct in_pktinfo*) CMSG_DATA(cmsg);
> > -+                pktinfo = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> > -                 assert(pktinfo);
> > - 
> > -                 pktinfo->ipi_ifindex = server->ifindex;
> > -@@ -1270,7 +1270,6 @@ static int server_receive_message(sd_eve
> > -                 .msg_control = &control,
> > -                 .msg_controllen = sizeof(control),
> > -         };
> > --        struct cmsghdr *cmsg;
> > -         ssize_t datagram_size, len;
> > -         int r;
> > - 
> > -@@ -1306,19 +1305,10 @@ static int server_receive_message(sd_eve
> > -         if ((size_t) len < sizeof(DHCPMessage))
> > -                 return 0;
> > - 
> > --        CMSG_FOREACH(cmsg, &msg)
> > --                if (cmsg->cmsg_level == IPPROTO_IP &&
> > --                    cmsg->cmsg_type == IP_PKTINFO &&
> > --                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct in_pktinfo))) {
> > --                        struct in_pktinfo *info = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> > --
> > --                        /* TODO figure out if this can be done as a filter on
> > --                         * the socket, like for IPv6 */
> > --                        if (server->ifindex != info->ipi_ifindex)
> > --                                return 0;
> > --
> > --                        break;
> > --                }
> > -+        /* TODO figure out if this can be done as a filter on the socket, like for IPv6 */
> > -+        struct in_pktinfo *info = CMSG_FIND_DATA(&msg, IPPROTO_IP, IP_PKTINFO, struct in_pktinfo);
> > -+        if (info && info->ipi_ifindex != server->ifindex)
> > -+                return 0;
> > - 
> > -         if (sd_dhcp_server_is_in_relay_mode(server)) {
> > -                 r = dhcp_server_relay_message(server, message, len - sizeof(DHCPMessage), buflen);
> > ---- a/src/libsystemd/sd-daemon/sd-daemon.c
> > -+++ b/src/libsystemd/sd-daemon/sd-daemon.c
> > -@@ -567,7 +567,7 @@ _public_ int sd_pid_notify_with_fds(
> > -                         cmsg->cmsg_type = SCM_CREDENTIALS;
> > -                         cmsg->cmsg_len = CMSG_LEN(sizeof(struct ucred));
> > - 
> > --                        ucred = (struct ucred*) CMSG_DATA(cmsg);
> > -+                        ucred = CMSG_TYPED_DATA(cmsg, struct ucred);
> > -                         ucred->pid = pid != 0 ? pid : getpid_cached();
> > -                         ucred->uid = getuid();
> > -                         ucred->gid = getgid();
> > ---- a/src/resolve/resolved-manager.c
> > -+++ b/src/resolve/resolved-manager.c
> > -@@ -984,7 +984,7 @@ static int manager_ipv4_send(
> > -                 cmsg->cmsg_level = IPPROTO_IP;
> > -                 cmsg->cmsg_type = IP_PKTINFO;
> > - 
> > --                pi = (struct in_pktinfo*) CMSG_DATA(cmsg);
> > -+                pi = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> > -                 pi->ipi_ifindex = ifindex;
> > - 
> > -                 if (source)
> > -@@ -1040,7 +1040,7 @@ static int manager_ipv6_send(
> > -                 cmsg->cmsg_level = IPPROTO_IPV6;
> > -                 cmsg->cmsg_type = IPV6_PKTINFO;
> > - 
> > --                pi = (struct in6_pktinfo*) CMSG_DATA(cmsg);
> > -+                pi = CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
> > -                 pi->ipi6_ifindex = ifindex;
> > - 
> > -                 if (source)
> > diff --git a/meta/recipes-core/systemd/systemd/27254.patch b/meta/recipes-core/systemd/systemd/27254.patch
> > deleted file mode 100644
> > index 3928088dc6a..00000000000
> > --- a/meta/recipes-core/systemd/systemd/27254.patch
> > +++ /dev/null
> > @@ -1,345 +0,0 @@
> > -From 79dec6f5cc0b72d43dfb0469fa68b5cd023fbaf9 Mon Sep 17 00:00:00 2001
> > -From: Lennart Poettering <lennart@poettering.net>
> > -Date: Thu, 13 Apr 2023 10:21:31 +0200
> > -Subject: [PATCH 1/3] socket-util: tighten aignment check for CMSG_TYPED_DATA()
> > -
> > -Apparently CMSG_DATA() alignment is very much undefined. Which is quite
> > -an ABI fuck-up, but we need to deal with this. CMSG_TYPED_DATA() already
> > -checks alignment of the specified pointer. Let's also check matching
> > -alignment of the underlying structures, which we already can do at
> > -compile-time.
> > -
> > -See: #27241
> > -
> > -(This does not fix #27241, but should catch such errors already at
> > -compile-time instead of runtime)
> > -
> > -Upstream-Status: Backport [https://github.com/systemd/systemd/pull/27254]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/basic/socket-util.h | 7 +++++++
> > - 1 file changed, 7 insertions(+)
> > -
> > ---- a/src/basic/socket-util.h
> > -+++ b/src/basic/socket-util.h
> > -@@ -175,9 +175,16 @@ int flush_accept(int fd);
> > - #define CMSG_FOREACH(cmsg, mh)                                          \
> > -         for ((cmsg) = CMSG_FIRSTHDR(mh); (cmsg); (cmsg) = CMSG_NXTHDR((mh), (cmsg)))
> > - 
> > -+/* Returns the cmsghdr's data pointer, but safely cast to the specified type. Does two alignment checks: one
> > -+ * at compile time, that the requested type has a smaller or same alignment as 'struct cmsghdr', and one
> > -+ * during runtime, that the actual pointer matches the alignment too. This is supposed to catch cases such as
> > -+ * 'struct timeval' is embedded into 'struct cmsghdr' on architectures where the alignment of the former is 8
> > -+ * bytes (because of a 64bit time_t), but of the latter is 4 bytes (because size_t is 32bit), such as
> > -+ * riscv32. */
> > - #define CMSG_TYPED_DATA(cmsg, type)                                     \
> > -         ({                                                              \
> > -                 struct cmsghdr *_cmsg = cmsg;                           \
> > -+                assert_cc(__alignof__(type) <= __alignof__(struct cmsghdr)); \
> > -                 _cmsg ? CAST_ALIGN_PTR(type, CMSG_DATA(_cmsg)) : (type*) NULL; \
> > -         })
> > - 
> > ---- a/src/basic/socket-util.c
> > -+++ b/src/basic/socket-util.c
> > -@@ -1047,7 +1047,7 @@ ssize_t receive_one_fd_iov(
> > -         }
> > - 
> > -         if (found)
> > --                *ret_fd = *(int*) CMSG_DATA(found);
> > -+                *ret_fd = *CMSG_TYPED_DATA(found, int);
> > -         else
> > -                 *ret_fd = -EBADF;
> > - 
> > ---- a/src/core/manager.c
> > -+++ b/src/core/manager.c
> > -@@ -2503,7 +2503,7 @@ static int manager_dispatch_notify_fd(sd
> > -                 if (cmsg->cmsg_level == SOL_SOCKET && cmsg->cmsg_type == SCM_RIGHTS) {
> > - 
> > -                         assert(!fd_array);
> > --                        fd_array = (int*) CMSG_DATA(cmsg);
> > -+                        fd_array = CMSG_TYPED_DATA(cmsg, int);
> > -                         n_fds = (cmsg->cmsg_len - CMSG_LEN(0)) / sizeof(int);
> > - 
> > -                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
> > -@@ -2511,7 +2511,7 @@ static int manager_dispatch_notify_fd(sd
> > -                            cmsg->cmsg_len == CMSG_LEN(sizeof(struct ucred))) {
> > - 
> > -                         assert(!ucred);
> > --                        ucred = (struct ucred*) CMSG_DATA(cmsg);
> > -+                        ucred = CMSG_TYPED_DATA(cmsg, struct ucred);
> > -                 }
> > -         }
> > - 
> > ---- a/src/coredump/coredump.c
> > -+++ b/src/coredump/coredump.c
> > -@@ -1163,7 +1163,7 @@ static int process_socket(int fd) {
> > -                         }
> > - 
> > -                         assert(input_fd < 0);
> > --                        input_fd = *(int*) CMSG_DATA(found);
> > -+                        input_fd = *CMSG_TYPED_DATA(found, int);
> > -                         break;
> > -                 } else
> > -                         cmsg_close_all(&mh);
> > ---- a/src/home/homed-manager.c
> > -+++ b/src/home/homed-manager.c
> > -@@ -1086,7 +1086,7 @@ static ssize_t read_datagram(
> > -                     cmsg->cmsg_type == SCM_CREDENTIALS &&
> > -                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct ucred))) {
> > -                         assert(!sender);
> > --                        sender = (struct ucred*) CMSG_DATA(cmsg);
> > -+                        sender = CMSG_TYPED_DATA(cmsg, struct ucred);
> > -                 }
> > - 
> > -                 if (cmsg->cmsg_level == SOL_SOCKET &&
> > -@@ -1098,7 +1098,7 @@ static ssize_t read_datagram(
> > -                         }
> > - 
> > -                         assert(passed_fd < 0);
> > --                        passed_fd = *(int*) CMSG_DATA(cmsg);
> > -+                        passed_fd = *CMSG_TYPED_DATA(cmsg, int);
> > -                 }
> > -         }
> > - 
> > ---- a/src/journal/journald-server.c
> > -+++ b/src/journal/journald-server.c
> > -@@ -1454,21 +1454,21 @@ int server_process_datagram(
> > -                     cmsg->cmsg_type == SCM_CREDENTIALS &&
> > -                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct ucred))) {
> > -                         assert(!ucred);
> > --                        ucred = (struct ucred*) CMSG_DATA(cmsg);
> > -+                        ucred = CMSG_TYPED_DATA(cmsg, struct ucred);
> > -                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
> > -                          cmsg->cmsg_type == SCM_SECURITY) {
> > -                         assert(!label);
> > --                        label = (char*) CMSG_DATA(cmsg);
> > -+                        label = CMSG_TYPED_DATA(cmsg, char);
> > -                         label_len = cmsg->cmsg_len - CMSG_LEN(0);
> > -                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
> > -                            cmsg->cmsg_type == SO_TIMESTAMP &&
> > -                            cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval))) {
> > -                         assert(!tv);
> > --                        tv = (struct timeval*) CMSG_DATA(cmsg);
> > -+                        tv = CMSG_TYPED_DATA(cmsg, struct timeval);
> > -                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
> > -                          cmsg->cmsg_type == SCM_RIGHTS) {
> > -                         assert(!fds);
> > --                        fds = (int*) CMSG_DATA(cmsg);
> > -+                        fds = CMSG_TYPED_DATA(cmsg, int);
> > -                         n_fds = (cmsg->cmsg_len - CMSG_LEN(0)) / sizeof(int);
> > -                 }
> > - 
> > ---- a/src/libsystemd-network/icmp6-util.c
> > -+++ b/src/libsystemd-network/icmp6-util.c
> > -@@ -192,7 +192,7 @@ int icmp6_receive(int fd, void *buffer,
> > -                 if (cmsg->cmsg_level == SOL_IPV6 &&
> > -                     cmsg->cmsg_type == IPV6_HOPLIMIT &&
> > -                     cmsg->cmsg_len == CMSG_LEN(sizeof(int))) {
> > --                        int hops = *(int*) CMSG_DATA(cmsg);
> > -+                        int hops = *CMSG_TYPED_DATA(cmsg, int);
> > - 
> > -                         if (hops != 255)
> > -                                 return -EMULTIHOP;
> > -@@ -201,7 +201,7 @@ int icmp6_receive(int fd, void *buffer,
> > -                 if (cmsg->cmsg_level == SOL_SOCKET &&
> > -                     cmsg->cmsg_type == SO_TIMESTAMP &&
> > -                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)))
> > --                        triple_timestamp_from_realtime(&t, timeval_load((struct timeval*) CMSG_DATA(cmsg)));
> > -+                        triple_timestamp_from_realtime(&t, timeval_load(CMSG_TYPED_DATA(cmsg, struct timeval)));
> > -         }
> > - 
> > -         if (!triple_timestamp_is_set(&t))
> > ---- a/src/libsystemd-network/sd-dhcp-client.c
> > -+++ b/src/libsystemd-network/sd-dhcp-client.c
> > -@@ -1981,7 +1981,7 @@ static int client_receive_message_raw(
> > - 
> > -         cmsg = cmsg_find(&msg, SOL_PACKET, PACKET_AUXDATA, CMSG_LEN(sizeof(struct tpacket_auxdata)));
> > -         if (cmsg) {
> > --                struct tpacket_auxdata *aux = (struct tpacket_auxdata*) CMSG_DATA(cmsg);
> > -+                struct tpacket_auxdata *aux = CMSG_TYPED_DATA(cmsg, struct tpacket_auxdata);
> > -                 checksum = !(aux->tp_status & TP_STATUS_CSUMNOTREADY);
> > -         }
> > - 
> > ---- a/src/libsystemd-network/sd-dhcp-server.c
> > -+++ b/src/libsystemd-network/sd-dhcp-server.c
> > -@@ -1310,7 +1310,7 @@ static int server_receive_message(sd_eve
> > -                 if (cmsg->cmsg_level == IPPROTO_IP &&
> > -                     cmsg->cmsg_type == IP_PKTINFO &&
> > -                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct in_pktinfo))) {
> > --                        struct in_pktinfo *info = (struct in_pktinfo*)CMSG_DATA(cmsg);
> > -+                        struct in_pktinfo *info = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> > - 
> > -                         /* TODO figure out if this can be done as a filter on
> > -                          * the socket, like for IPv6 */
> > ---- a/src/libsystemd/sd-bus/bus-socket.c
> > -+++ b/src/libsystemd/sd-bus/bus-socket.c
> > -@@ -604,7 +604,7 @@ static int bus_socket_read_auth(sd_bus *
> > -                                  * protocol? Somebody is playing games with
> > -                                  * us. Close them all, and fail */
> > -                                 j = (cmsg->cmsg_len - CMSG_LEN(0)) / sizeof(int);
> > --                                close_many((int*) CMSG_DATA(cmsg), j);
> > -+                                close_many(CMSG_TYPED_DATA(cmsg, int), j);
> > -                                 return -EIO;
> > -                         } else
> > -                                 log_debug("Got unexpected auxiliary data with level=%d and type=%d",
> > -@@ -1270,18 +1270,18 @@ int bus_socket_read_message(sd_bus *bus)
> > -                                          * isn't actually enabled? Close them,
> > -                                          * and fail */
> > - 
> > --                                        close_many((int*) CMSG_DATA(cmsg), n);
> > -+                                        close_many(CMSG_TYPED_DATA(cmsg, int), n);
> > -                                         return -EIO;
> > -                                 }
> > - 
> > -                                 f = reallocarray(bus->fds, bus->n_fds + n, sizeof(int));
> > -                                 if (!f) {
> > --                                        close_many((int*) CMSG_DATA(cmsg), n);
> > -+                                        close_many(CMSG_TYPED_DATA(cmsg, int), n);
> > -                                         return -ENOMEM;
> > -                                 }
> > - 
> > -                                 for (i = 0; i < n; i++)
> > --                                        f[bus->n_fds++] = fd_move_above_stdio(((int*) CMSG_DATA(cmsg))[i]);
> > -+                                        f[bus->n_fds++] = fd_move_above_stdio(CMSG_TYPED_DATA(cmsg, int)[i]);
> > -                                 bus->fds = f;
> > -                         } else
> > -                                 log_debug("Got unexpected auxiliary data with level=%d and type=%d",
> > ---- a/src/resolve/resolved-dns-stream.c
> > -+++ b/src/resolve/resolved-dns-stream.c
> > -@@ -147,7 +147,7 @@ static int dns_stream_identify(DnsStream
> > -                         switch (cmsg->cmsg_type) {
> > - 
> > -                         case IPV6_PKTINFO: {
> > --                                struct in6_pktinfo *i = (struct in6_pktinfo*) CMSG_DATA(cmsg);
> > -+                                struct in6_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
> > - 
> > -                                 if (s->ifindex <= 0)
> > -                                         s->ifindex = i->ipi6_ifindex;
> > -@@ -155,7 +155,7 @@ static int dns_stream_identify(DnsStream
> > -                         }
> > - 
> > -                         case IPV6_HOPLIMIT:
> > --                                s->ttl = *(int *) CMSG_DATA(cmsg);
> > -+                                s->ttl = *CMSG_TYPED_DATA(cmsg, int);
> > -                                 break;
> > -                         }
> > - 
> > -@@ -165,7 +165,7 @@ static int dns_stream_identify(DnsStream
> > -                         switch (cmsg->cmsg_type) {
> > - 
> > -                         case IP_PKTINFO: {
> > --                                struct in_pktinfo *i = (struct in_pktinfo*) CMSG_DATA(cmsg);
> > -+                                struct in_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> > - 
> > -                                 if (s->ifindex <= 0)
> > -                                         s->ifindex = i->ipi_ifindex;
> > -@@ -173,7 +173,7 @@ static int dns_stream_identify(DnsStream
> > -                         }
> > - 
> > -                         case IP_TTL:
> > --                                s->ttl = *(int *) CMSG_DATA(cmsg);
> > -+                                s->ttl = *CMSG_TYPED_DATA(cmsg, int);
> > -                                 break;
> > -                         }
> > -                 }
> > ---- a/src/resolve/resolved-manager.c
> > -+++ b/src/resolve/resolved-manager.c
> > -@@ -801,7 +801,7 @@ int manager_recv(Manager *m, int fd, Dns
> > -                         switch (cmsg->cmsg_type) {
> > - 
> > -                         case IPV6_PKTINFO: {
> > --                                struct in6_pktinfo *i = (struct in6_pktinfo*) CMSG_DATA(cmsg);
> > -+                                struct in6_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
> > - 
> > -                                 if (p->ifindex <= 0)
> > -                                         p->ifindex = i->ipi6_ifindex;
> > -@@ -811,11 +811,11 @@ int manager_recv(Manager *m, int fd, Dns
> > -                         }
> > - 
> > -                         case IPV6_HOPLIMIT:
> > --                                p->ttl = *(int *) CMSG_DATA(cmsg);
> > -+                                p->ttl = *CMSG_TYPED_DATA(cmsg, int);
> > -                                 break;
> > - 
> > -                         case IPV6_RECVFRAGSIZE:
> > --                                p->fragsize = *(int *) CMSG_DATA(cmsg);
> > -+                                p->fragsize = *CMSG_TYPED_DATA(cmsg, int);
> > -                                 break;
> > -                         }
> > -                 } else if (cmsg->cmsg_level == IPPROTO_IP) {
> > -@@ -824,7 +824,7 @@ int manager_recv(Manager *m, int fd, Dns
> > -                         switch (cmsg->cmsg_type) {
> > - 
> > -                         case IP_PKTINFO: {
> > --                                struct in_pktinfo *i = (struct in_pktinfo*) CMSG_DATA(cmsg);
> > -+                                struct in_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> > - 
> > -                                 if (p->ifindex <= 0)
> > -                                         p->ifindex = i->ipi_ifindex;
> > -@@ -834,11 +834,11 @@ int manager_recv(Manager *m, int fd, Dns
> > -                         }
> > - 
> > -                         case IP_TTL:
> > --                                p->ttl = *(int *) CMSG_DATA(cmsg);
> > -+                                p->ttl = *CMSG_TYPED_DATA(cmsg, int);
> > -                                 break;
> > - 
> > -                         case IP_RECVFRAGSIZE:
> > --                                p->fragsize = *(int *) CMSG_DATA(cmsg);
> > -+                                p->fragsize = *CMSG_TYPED_DATA(cmsg, int);
> > -                                 break;
> > -                         }
> > -                 }
> > ---- a/src/libsystemd/sd-device/device-monitor.c
> > -+++ b/src/libsystemd/sd-device/device-monitor.c
> > -@@ -503,7 +503,6 @@ int device_monitor_receive_device(sd_dev
> > -                 .msg_name = &snl,
> > -                 .msg_namelen = sizeof(snl),
> > -         };
> > --        struct cmsghdr *cmsg;
> > -         struct ucred *cred;
> > -         size_t offset;
> > -         ssize_t n;
> > -@@ -559,12 +558,11 @@ int device_monitor_receive_device(sd_dev
> > -                                                  snl.nl.nl_pid);
> > -         }
> > - 
> > --        cmsg = CMSG_FIRSTHDR(&smsg);
> > --        if (!cmsg || cmsg->cmsg_type != SCM_CREDENTIALS)
> > -+        cred = CMSG_FIND_DATA(&smsg, SOL_SOCKET, SCM_CREDENTIALS, struct ucred);
> > -+        if (!cred)
> > -                 return log_monitor_errno(m, SYNTHETIC_ERRNO(EAGAIN),
> > -                                          "No sender credentials received, ignoring message.");
> > - 
> > --        cred = (struct ucred*) CMSG_DATA(cmsg);
> > -         if (!check_sender_uid(m, cred->uid))
> > -                 return log_monitor_errno(m, SYNTHETIC_ERRNO(EAGAIN),
> > -                                          "Sender uid="UID_FMT", message ignored.", cred->uid);
> > ---- a/src/udev/udev-ctrl.c
> > -+++ b/src/udev/udev-ctrl.c
> > -@@ -161,7 +161,6 @@ static int udev_ctrl_connection_event_ha
> > -                 .msg_control = &control,
> > -                 .msg_controllen = sizeof(control),
> > -         };
> > --        struct cmsghdr *cmsg;
> > -         struct ucred *cred;
> > -         ssize_t size;
> > - 
> > -@@ -185,15 +184,12 @@ static int udev_ctrl_connection_event_ha
> > - 
> > -         cmsg_close_all(&smsg);
> > - 
> > --        cmsg = CMSG_FIRSTHDR(&smsg);
> > --
> > --        if (!cmsg || cmsg->cmsg_type != SCM_CREDENTIALS) {
> > -+        cred = CMSG_FIND_DATA(&smsg, SOL_SOCKET, SCM_CREDENTIALS, struct ucred);
> > -+        if (!cred) {
> > -                 log_error("No sender credentials received, ignoring message");
> > -                 return 0;
> > -         }
> > - 
> > --        cred = (struct ucred *) CMSG_DATA(cmsg);
> > --
> > -         if (cred->uid != 0) {
> > -                 log_error("Invalid sender uid "UID_FMT", ignoring message", cred->uid);
> > -                 return 0;
> > diff --git a/meta/recipes-core/systemd/systemd_253.7.bb b/meta/recipes-core/systemd/systemd_254.bb
> > similarity index 98%
> > rename from meta/recipes-core/systemd/systemd_253.7.bb
> > rename to meta/recipes-core/systemd/systemd_254.bb
> > index 1fd4556afd0..d589228a5fa 100644
> > --- a/meta/recipes-core/systemd/systemd_253.7.bb
> > +++ b/meta/recipes-core/systemd/systemd_254.bb
> > @@ -26,8 +26,6 @@ SRC_URI += " \
> >             file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
> >             file://0008-implment-systemd-sysv-install-for-OE.patch \
> >             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
> > -           file://27254.patch \
> > -           file://27253.patch \
> >             "
> >  
> >  # patches needed by musl
> > @@ -39,7 +37,6 @@ SRC_URI_MUSL = "\
> >                 file://0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
> >                 file://0013-add-missing-FTW_-macros-for-musl.patch \
> >                 file://0014-Use-uintmax_t-for-handling-rlim_t.patch \
> > -               file://0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
> >                 file://0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
> >                 file://0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> >                 file://0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
> > @@ -140,8 +137,7 @@ PACKAGECONFIG[default-compression-lz4] = "-Dlz4=true -Ddefault-compression=lz4,,
> >  PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
> >  PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
> >  PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
> > -PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
> > -PACKAGECONFIG[gnu-efi] = "-Dgnu-efi=true -Defi-libdir=${STAGING_LIBDIR} -Defi-includedir=${STAGING_INCDIR}/efi,-Dgnu-efi=false,gnu-efi"
> > +PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false -Dbootloader=false,python3-pyelftools"
> >  PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
> >  PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
> >  PACKAGECONFIG[repart] = "-Drepart=true,-Drepart=false"
> > @@ -552,6 +548,7 @@ FILES:${PN}-extra-utils = "\
> >                          ${bindir}/systemd-stdio-bridge \
> >                          ${base_bindir}/systemd-ask-password \
> >                          ${base_bindir}/systemd-tty-ask-password-agent \
> > +                        ${base_sbindir}/mount.ddi \
> >                          ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
> >                          ${systemd_system_unitdir}/systemd-ask-password-console.path \
> >                          ${systemd_system_unitdir}/systemd-ask-password-console.service \
> > @@ -622,6 +619,8 @@ FILES:${PN} = " ${base_bindir}/* \
> >                  ${datadir}/polkit-1 \
> >                  ${datadir}/${BPN} \
> >                  ${datadir}/factory \
> > +                ${sysconfdir}/credstore/ \
> > +                ${sysconfdir}/credstore.encrypted/ \
> >                  ${sysconfdir}/dbus-1/ \
> >                  ${sysconfdir}/modules-load.d/ \
> >                  ${sysconfdir}/pam.d/ \
> > @@ -650,6 +649,7 @@ FILES:${PN} = " ${base_bindir}/* \
> >                  ${bindir}/bootctl \
> >                  ${bindir}/oomctl \
> >                  ${bindir}/userdbctl \
> > +                ${exec_prefix}/lib/credstore \
> >                  ${exec_prefix}/lib/tmpfiles.d/*.conf \
> >                  ${exec_prefix}/lib/systemd \
> >                  ${exec_prefix}/lib/modules-load.d \
> > @@ -685,6 +685,7 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
> >                        kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
> >                        os-release \
> >                        systemd-conf \
> > +                      ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'pam-plugin-umask', '', d)} \
> >  "
> >  
> >  INSANE_SKIP:${PN} += "dev-so libdir"
> > @@ -708,6 +709,7 @@ FILES:udev += "${base_sbindir}/udevd \
> >                 ${rootlibexecdir}/udev/dmi_memory_id \
> >                 ${rootlibexecdir}/udev/fido_id \
> >                 ${rootlibexecdir}/udev/findkeyboards \
> > +               ${rootlibexecdir}/udev/iocost \
> >                 ${rootlibexecdir}/udev/keyboard-force-release.sh \
> >                 ${rootlibexecdir}/udev/keymap \
> >                 ${rootlibexecdir}/udev/mtd_probe \
> > @@ -719,6 +721,7 @@ FILES:udev += "${base_sbindir}/udevd \
> >                 ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-block.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
> > +               ${rootlibexecdir}/udev/rules.d/60-dmi-id.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-drm.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
> > @@ -746,6 +749,7 @@ FILES:udev += "${base_sbindir}/udevd \
> >                 ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
> >                 ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
> >                 ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
> > +               ${rootlibexecdir}/udev/rules.d/90-iocost.rules \
> >                 ${rootlibexecdir}/udev/rules.d/README \
> >                 ${sysconfdir}/udev \
> >                 ${sysconfdir}/init.d/systemd-udevd \
> > -- 
> > 2.39.2
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185136): https://lists.openembedded.org/g/openembedded-core/message/185136
> > Mute This Topic: https://lists.openembedded.org/mt/100459438/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

