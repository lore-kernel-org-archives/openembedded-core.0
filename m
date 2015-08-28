Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3005D71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 04:00:53 +0000 (UTC)
Received: by igui7 with SMTP id i7so9327862igu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 21:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=g6LhGGYk5cEet6LPnkruqLHxsCsdBYfdU29QKMCJgYQ=;
	b=A61mLOJl95cZDWH2+P/oPt4OfvY4IZaGEyncAxMV9YrbF10mcDvB0VfzSR+yibb6av
	fofcSkzFZId/GPxKIUdGz6c2A2E4e3At8SjuKu0PQnepztxFB372veF3jy0OR6GLOkE5
	Q/USvpzmL7ShLkt9mOkfOtmAk20QqktW3TzHmDxigJDbdrY4gOTbsETW3CC1yvGMiMT2
	r7qHSZmgfyPx7VNnaDApwwyq8CMJZqXMEIZDNodm3bRLcd4Z6auuqFc85fXeaVaBLU60
	2hme+mBGfv44CLjJ4z4/C5DoR1ViCDpTr62C5HskPxUmVWkg6zzwSKxEGkv7H6F8lp2r
	oMLg==
X-Received: by 10.50.30.226 with SMTP id v2mr1734317igh.11.1440734453682; Thu,
	27 Aug 2015 21:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 21:00:24 -0700 (PDT)
In-Reply-To: <1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 21:00:24 -0700
Message-ID: <CAMKF1sobN5CufVtRTaMFD9ZAnnWec-je4Y6O=2dnRWd7wgP2oA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Fri, 28 Aug 2015 04:00:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 8:48 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> The following changes were done to trim down the recipe size:
> * removed adbd support
> * removed android-tools-conf
>
> The main idea is to keep only what is strictly needed for make_ext4fs too=
l.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  .../android-tools/disable-selinux-support.patch    | 137 +++++++++++++++=
++++++
>  .../android-tools/reboot-syscall.patch             |  25 ++++
>  .../android-tools/remove-libselinux.patch          |  13 ++
>  .../android-tools/android-tools_4.2.2.bb           |  51 ++++++++
>  4 files changed, 226 insertions(+)
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/dis=
able-selinux-support.patch
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/reb=
oot-syscall.patch
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/rem=
ove-libselinux.patch
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools_4.2=
.2.bb
>
> diff --git a/meta/recipes-devtools/android-tools/android-tools/disable-se=
linux-support.patch b/meta/recipes-devtools/android-tools/android-tools/dis=
able-selinux-support.patch
> new file mode 100644
> index 0000000..738f575
> --- /dev/null
> +++ b/meta/recipes-devtools/android-tools/android-tools/disable-selinux-s=
upport.patch
> @@ -0,0 +1,137 @@
> +diff --git a/extras/ext4_utils/make_ext4fs.c b/extras/ext4_utils/make_ex=
t4fs.c
> +index b2d1426..94e92d6 100644
> +--- a/extras/ext4_utils/make_ext4fs.c
> ++++ b/extras/ext4_utils/make_ext4fs.c
> +@@ -59,9 +59,11 @@
> +
> + #else
> +
> ++#if 0
> + #include <selinux/selinux.h>
> + #include <selinux/label.h>
> + #include <selinux/android.h>
> ++#endif
> +

Can this be config,ed out insread of if 0 ?

> + #define O_BINARY 0
> +
> +@@ -178,6 +180,7 @@ static u32 build_directory_structure(const char *ful=
l_path, const char *dir_path
> +                       error("can't set android permissions - built with=
out android support");
> + #endif
> +               }
> ++#if 0
> + #ifndef USE_MINGW
> +               if (sehnd) {
> +                       if (selabel_lookup(sehnd, &dentries[i].secon, den=
tries[i].path, stat.st_mode) < 0) {
> +@@ -188,6 +191,7 @@ static u32 build_directory_structure(const char *ful=
l_path, const char *dir_path
> +                               printf("Labeling %s as %s\n", dentries[i]=
.path, dentries[i].secon);
> +               }
> + #endif
> ++#endif
> +
> +               if (S_ISREG(stat.st_mode)) {
> +                       dentries[i].file_type =3D EXT4_FT_REG_FILE;
> +@@ -229,10 +233,12 @@ static u32 build_directory_structure(const char *f=
ull_path, const char *dir_path
> +               dentries[0].file_type =3D EXT4_FT_DIR;
> +               dentries[0].uid =3D 0;
> +               dentries[0].gid =3D 0;
> ++#if 0
> +               if (sehnd) {
> +                       if (selabel_lookup(sehnd, &dentries[0].secon, den=
tries[0].path, dentries[0].mode) < 0)
> +                               error("cannot lookup security context for=
 %s", dentries[0].path);
> +               }
> ++#endif
> +               entries++;
> +               dirs++;
> +       }
> +@@ -270,9 +276,11 @@ static u32 build_directory_structure(const char *fu=
ll_path, const char *dir_path
> +                       dentries[i].mtime);
> +               if (ret)
> +                       error("failed to set permissions on %s\n", dentri=
es[i].path);
> ++#if 0
> +               ret =3D inode_set_selinux(entry_inode, dentries[i].secon)=
;
> +               if (ret)
> +                       error("failed to set SELinux context on %s\n", de=
ntries[i].path);
> ++#endif
> +
> +               free(dentries[i].path);
> +               free(dentries[i].full_path);
> +@@ -562,6 +570,7 @@ int make_ext4fs_internal(int fd, const char *_direct=
ory,
> +       root_mode =3D S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +       inode_set_permissions(root_inode_num, root_mode, 0, 0, 0);
> +
> ++#if 0
> + #ifndef USE_MINGW
> +       if (sehnd) {
> +               char *secontext =3D NULL;
> +@@ -578,6 +587,7 @@ int make_ext4fs_internal(int fd, const char *_direct=
ory,
> +               freecon(secontext);
> +       }
> + #endif
> ++#endif
> +
> +       ext4_update_free();
> +
> +diff --git a/extras/ext4_utils/make_ext4fs_main.c b/extras/ext4_utils/ma=
ke_ext4fs_main.c
> +index b6c740d..ce31764 100644
> +--- a/extras/ext4_utils/make_ext4fs_main.c
> ++++ b/extras/ext4_utils/make_ext4fs_main.c
> +@@ -29,6 +29,7 @@
> + #include <private/android_filesystem_config.h>
> + #endif
> +
> ++#if 0
> + #ifndef USE_MINGW
> + #include <selinux/selinux.h>
> + #include <selinux/label.h>
> +@@ -36,6 +37,7 @@
> + #else
> + struct selabel_handle;
> + #endif
> ++#endif
> +
> + #include "make_ext4fs.h"
> + #include "ext4_utils.h"
> +@@ -72,9 +74,11 @@ int main(int argc, char **argv)
> +       int exitcode;
> +       int verbose =3D 0;
> +       struct selabel_handle *sehnd =3D NULL;
> ++#if 0
> + #ifndef USE_MINGW
> +       struct selinux_opt seopts[] =3D { { SELABEL_OPT_PATH, "" } };
> + #endif
> ++#endif
> +
> +       while ((opt =3D getopt(argc, argv, "l:j:b:g:i:I:L:a:S:fwzJsctv"))=
 !=3D -1) {
> +               switch (opt) {
> +@@ -131,6 +135,7 @@ int main(int argc, char **argv)
> +                       fprintf(stderr, "Warning: -t (initialize inode ta=
bles) is deprecated\n");
> +                       break;
> +               case 'S':
> ++#if 0
> + #ifndef USE_MINGW
> +                       seopts[0].value =3D optarg;
> +                       sehnd =3D selabel_open(SELABEL_CTX_FILE, seopts, =
1);
> +@@ -139,6 +144,7 @@ int main(int argc, char **argv)
> +                               exit(EXIT_FAILURE);
> +                       }
> + #endif
> ++#endif
> +                       break;
> +               case 'v':
> +                       verbose =3D 1;
> +@@ -149,6 +155,7 @@ int main(int argc, char **argv)
> +               }
> +       }
> +
> ++#if 0
> + #if !defined(HOST)
> +       // Use only if -S option not requested
> +       if (!sehnd && mountpoint) {
> +@@ -160,6 +167,7 @@ int main(int argc, char **argv)
> +               }
> +       }
> + #endif
> ++#endif
> +
> +       if (wipe && sparse) {
> +               fprintf(stderr, "Cannot specifiy both wipe and sparse\n")=
;
> diff --git a/meta/recipes-devtools/android-tools/android-tools/reboot-sys=
call.patch b/meta/recipes-devtools/android-tools/android-tools/reboot-sysca=
ll.patch
> new file mode 100644
> index 0000000..0055416
> --- /dev/null
> +++ b/meta/recipes-devtools/android-tools/android-tools/reboot-syscall.pa=
tch
> @@ -0,0 +1,25 @@
> +Subject: port android_reboot() to call the reboot syscall via syscall() =
(glibc) rather than __reboot (bionic)
> +Author: Lo=C3=AFc Minier <loic.minier@ubuntu.com>
> +
> +--- a/core/libcutils/android_reboot.c
> ++++ b/core/libcutils/android_reboot.c
> +@@ -21,6 +21,8 @@
> + #include <fcntl.h>
> + #include <stdio.h>
> + #include <string.h>
> ++#include <linux/reboot.h>
> ++#include <sys/syscall.h>
> +
> + #include <cutils/android_reboot.h>
> +
> +@@ -121,8 +123,8 @@
> +             break;
> +
> +         case ANDROID_RB_RESTART2:
> +-            ret =3D __reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
> +-                           LINUX_REBOOT_CMD_RESTART2, arg);
> ++            ret =3D syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBO=
OT_MAGIC2,
> ++                          LINUX_REBOOT_CMD_RESTART2, arg);
> +             break;
> +
> +         default:
> diff --git a/meta/recipes-devtools/android-tools/android-tools/remove-lib=
selinux.patch b/meta/recipes-devtools/android-tools/android-tools/remove-li=
bselinux.patch
> new file mode 100644
> index 0000000..24690b2
> --- /dev/null
> +++ b/meta/recipes-devtools/android-tools/android-tools/remove-libselinux=
.patch
> @@ -0,0 +1,13 @@
> +diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/ext4_util=
s.mk
> +index cb64916..60e81d6 100644
> +--- a/debian/makefiles/ext4_utils.mk
> ++++ b/debian/makefiles/ext4_utils.mk
> +@@ -36,7 +36,7 @@ CPPFLAGS+=3D -I/usr/include
> + CPPFLAGS+=3D -I../../core/include
> + CPPFLAGS+=3D -I../../core/libsparse/include/
> +
> +-LIBS+=3D -lz -lselinux
> ++LIBS+=3D -lz
> +
> + OBJS=3D $(SRCS:.c=3D.o)
> +
> diff --git a/meta/recipes-devtools/android-tools/android-tools_4.2.2.bb b=
/meta/recipes-devtools/android-tools/android-tools_4.2.2.bb
> new file mode 100644
> index 0000000..7780e09
> --- /dev/null
> +++ b/meta/recipes-devtools/android-tools/android-tools_4.2.2.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION =3D "Different utilities from Android - based on the corresp=
onding ubuntu \
> +package"
> +SECTION =3D "console/utils"
> +LICENSE =3D "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D " \
> +  file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46=
a0096b10 \
> +  file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833a2=
2dbe6 \
> +  file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3D8bef8e6712b1be5aa76af1=
ebde9d6378 \
> +  file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d691=
9e203a55f9 \
> +  file://${WORKDIR}/debian/copyright;md5=3D141efd1050596168ca05ced04e4f4=
98b \
> +"
> +
> +DEPENDS =3D "zlib openssl"
> +
> +# Use same version than ubuntu does here
> +BASE_PV =3D "4.2.2+git20130218"

> +PV =3D "${BASE_PV}-3ubuntu13"
> +

we are not ubuntu why do this ?

> +BBCLASSEXTEND +=3D "native"
> +
> +SRC_URI =3D " \
> +    https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_$=
{BASE_PV}.orig.tar.xz;name=3Dsource \
> +    https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_$=
{PV}.debian.tar.gz;name=3Ddebian \
> +    file://reboot-syscall.patch \
> +    file://disable-selinux-support.patch \
> +    file://remove-libselinux.patch;patchdir=3D.. \
> +"
> +S =3D "${WORKDIR}/android-tools"
> +
> +SRC_URI[source.md5sum] =3D "0e653b129ab0c95bdffa91410c8b55be"
> +SRC_URI[source.sha256sum] =3D "9bfba987e1351b12aa983787b9ae4424ab752e9e6=
46d8e93771538dc1e5d932f"
> +SRC_URI[debian.md5sum] =3D "5e409d01caf3c33fc60a2100464754ff"
> +SRC_URI[debian.sha256sum] =3D "320757edc8af015f40335c41dc96bf37e2d50c9f3=
a40a31e64264ff6e2dba5e3"
> +
> +do_compile() {
> +    # Setting both variables below causing our makefiles to not work wit=
h implicit make
> +    # rules
> +    unset CFLAGS
> +    unset CPPFLAGS
> +
> +    sed -i "s%^CPPFLAGS+=3D -I/usr/include%# we don't want to include he=
aders from host CPPFLAGS+=3D -I/usr/include%g" ${WORKDIR}/debian/makefiles/=
ext4_utils.mk
> +

turn this into -I=3D/usr/include

> +    oe_runmake -f ${WORKDIR}/debian/makefiles/ext4_utils.mk -C ${S}/extr=
as/ext4_utils clean
> +    oe_runmake -f ${WORKDIR}/debian/makefiles/ext4_utils.mk -C ${S}/extr=
as/ext4_utils
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/extras/ext4_utils/make_ext4fs ${D}${bindir}

squash it into

install -Dm 0755 ${S}/extras/ext4_utils/make_ext4fs ${D}${bindir}/make_ext4=
fs

> +
> +}
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

