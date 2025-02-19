Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43C8C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 19:21:45 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.31400.1739992896106919515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 11:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f391Jpma;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2bc607b33d5so40520fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992895; x=1740597695; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybOtpVjd5Zrsao2IE1OrgLpEMETpc8AhzmFm4JXYQ0s=;
        b=f391JpmaYduLXHbYOH+y48os/AvUy504de8Jnu2/xZoTEIoUyh1aIr09RSP16mHu6Z
         q0gWbUsIDic1iRRkFavTqXdyNZq9yFihdNlnO0j10mfuLHT5rfFs9+p4gzFKh21OVLDy
         9gONe8MxNQDMkpJpf+uysNUFye9cMpVxA2Ao/xQ6m0RYqMWPcC79NM7rOoweUHu4h75N
         csHskeD1oAVaW+xHt40Ip20HsfcYcaFLJdB7T3KR3Ce3T/Z0TSZpbdLpo/vNJCu0P6BR
         IcUFghXxu/HI0eJwPWAOuK+xEhBHTeNu1+vDnYlxvzwu/bfsvFr9A825RxCUCRjSTy7l
         vtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992895; x=1740597695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybOtpVjd5Zrsao2IE1OrgLpEMETpc8AhzmFm4JXYQ0s=;
        b=SAiDms8BSbd5ja5kzvL7MFgbyP7vDdFUlo1pUodA5ylF0+wJUbKXQNkskHgvjwET++
         paG7rr/ubzjDSetrxSvcXNU/6flcciVw2FTwmTH636dn38e1vKp6MhplEL+3cFIZ4UpT
         jZJMC+YjcsTd38HGErJWJzIHFaTGK9+a5Z3gUIfQ1fBHj7kZ41NmQe0X3Rur0SFEVGkH
         8cuqfW7nOGAOU9S5yxD042jeUV41JVAIgEk6ggK6xKre3KZ0nE045cYyncfXgcdoJV5e
         PFVJNCBy3c+oisiXpGOq/nUuIncRPve4MtbXA1WanEARXmPPv4xTTQ/CNOM8b3NgIE97
         9yWA==
X-Gm-Message-State: AOJu0YyR7jMUm4iHBTfjDD0MO41sUiHw+ehfvvg7E6TthcrJp+CBa3sJ
	aSwZdfZuIlYmSF0v6ov+GgL5xEons6BRyUEBevPlkAm+irgd0BJIHgfO8QydEd5OKyacuvial+L
	mAw+eR2seMFGad7FnmmxCon0xIL8ivi3u
X-Gm-Gg: ASbGncsTh3j6pSxS1ITKKV/MUyCLF7M+Imd7xcE5rU6G9Mc6J8/teAH04LsRySutBJQ
	JoeSvA+82GFg4VmXNdKsYaj+y7qOnxa2c5J4PZM1EGj/3leECTVszQxZHOnpwUiYCYoyMYXG4Ew
	BZ1DBd1J062R3uEeyrJCqpPmZHaw==
X-Google-Smtp-Source: AGHT+IFjpNAPatE7XaOd6Rp3lP5yXqOnTzBntlWrz0m+ijGFG2WG1H0I9Sji1wcvBNbGN89RC5H+5Eoo/tRcViqNtNM=
X-Received: by 2002:a05:6871:739e:b0:29e:460d:f74a with SMTP id
 586e51a60fabf-2bc99a383a5mr13079886fac.3.1739992895326; Wed, 19 Feb 2025
 11:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20250219185119.2168718-1-festevam@gmail.com> <20250219185119.2168718-2-festevam@gmail.com>
In-Reply-To: <20250219185119.2168718-2-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2025 11:21:09 -0800
X-Gm-Features: AWEUYZmZT2OJ6ZFNam3byuaPG56MR4yNz0QjSFqF_xpeoPevxjm6g8X8KcStMHo
Message-ID: <CAMKF1sr1Upsz6EiFaR=Ri8=+SgDVtfJy1VWfOD6+2sWW05h_BQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 19:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211730

LGTM

On Wed, Feb 19, 2025 at 10:51=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Upgrade to mtd-utils 2.3.0.
>
> Details about the 2.3.0 release:
>
> https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@si=
gma-star.at/T/#u
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> - Use v4 of the series submitted to linux-mtd kernel mailing list.
>
>  ...-ubifs-utils-ubifs.h-Include-fcntl.h.patch | 53 ++++++++++++++++++
>  ...ifs-utils-journal-Include-sys-stat.h.patch | 41 ++++++++++++++
>  ...d-a-check-for-execinfo-and-backtrace.patch | 54 +++++++++++++++++++
>  ...extract_files-Include-linux-limits.h.patch | 41 ++++++++++++++
>  ...{mtd-utils_2.2.1.bb =3D> mtd-utils_2.3.0.bb} | 11 +++-
>  5 files changed, 199 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubif=
s.h-Include-fcntl.h.patch
>  create mode 100644 meta/recipes-devtools/mtd/files/0002-ubifs-utils-jour=
nal-Include-sys-stat.h.patch
>  create mode 100644 meta/recipes-devtools/mtd/files/0003-configure.ac-Add=
-a-check-for-execinfo-and-backtrace.patch
>  create mode 100644 meta/recipes-devtools/mtd/files/0004-ubifs-utils-extr=
act_files-Include-linux-limits.h.patch
>  rename meta/recipes-devtools/mtd/{mtd-utils_2.2.1.bb =3D> mtd-utils_2.3.=
0.bb} (89%)
>
> diff --git a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Inc=
lude-fcntl.h.patch b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs=
.h-Include-fcntl.h.patch
> new file mode 100644
> index 0000000000..a9ececc14c
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fc=
ntl.h.patch
> @@ -0,0 +1,53 @@
> +From 2fc872697f72214e1e3efc6c2523e374fa5d681d Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@gmail.com>
> +Date: Mon, 17 Feb 2025 16:02:04 -0300
> +Subject: [PATCH v4 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h=
>
> +
> +Include the <fcntl.h> header file to fix the following error
> +when building with musl:
> +
> +| In file included from ../git/ubifs-utils/common/compr.c:42:
> +| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'l=
off_t'; did you mean 'off_t'?
> +|   313 |         loff_t ui_size;
> +|       |         ^~~~~~
> +|       |         off_t
> +| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name '=
loff_t'; did you mean 'off_t'?
> +|  1341 |         loff_t i_size;
> +|       |         ^~~~~~
> +|       |         off_t
> +| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name '=
loff_t'; did you mean 'off_t'?
> +|  1342 |         loff_t d_size;
> +|       |         ^~~~~~
> +|       |         off_t
> +| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name =
'loff_t'; did you mean 'off_t'?
> +|  1899 |                              int deletion, loff_t new_size);
> +|       |                                            ^~~~~~
> +|       |                                            off_t
> +| make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error=
 1
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/2025021913=
0244.2119582-1-festevam@gmail.com/T/#t]
> +Signed-off-by: Fabio Estevam <festevam@gmail.com>
> +Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> +Reviewed-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Changes since v3:
> +- Removed Upstream-Status tag.
> +
> + ubifs-utils/libubifs/ubifs.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
> +index 0908a2289208..1c7bc7bd0c80 100644
> +--- a/ubifs-utils/libubifs/ubifs.h
> ++++ b/ubifs-utils/libubifs/ubifs.h
> +@@ -11,6 +11,7 @@
> + #ifndef __UBIFS_H__
> + #define __UBIFS_H__
> +
> ++#include <fcntl.h>
> + #include <string.h>
> +
> + #include "linux_types.h"
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Inc=
lude-sys-stat.h.patch b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-jo=
urnal-Include-sys-stat.h.patch
> new file mode 100644
> index 0000000000..ea376437df
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sy=
s-stat.h.patch
> @@ -0,0 +1,41 @@
> +From 65077d8d664821e323d011956049c1c1b97d9560 Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@gmail.com>
> +Date: Mon, 17 Feb 2025 16:07:49 -0300
> +Subject: [PATCH v4 mtd-utils 2/4] ubifs-utils: journal: Include <sys/sta=
t.h>
> +
> +Include the <sys/stat.h> header file to fix the following error
> +when building with musl:
> +
> +| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_typ=
e':
> +| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclar=
ed (first use in this function)
> +|   414 |         switch (mode & S_IFMT) {
> +|       |                        ^~~~~~
> +| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared id=
entifier is reported only once for each function it appears in
> +| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undecla=
red (first use in this function)
> +|   415 |         case S_IFREG:
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/2025021913=
0244.2119582-2-festevam@gmail.com/T/#t]
> +Signed-off-by: Fabio Estevam <festevam@gmail.com>
> +Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> +---
> +Changes since v3:
> +- Removed Upstream-Status tag.
> +
> + ubifs-utils/libubifs/journal.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journ=
al.c
> +index e78ea14f3e69..45d82fd54bdb 100644
> +--- a/ubifs-utils/libubifs/journal.c
> ++++ b/ubifs-utils/libubifs/journal.c
> +@@ -46,6 +46,7 @@
> +  * all the nodes.
> +  */
> +
> ++#include <sys/stat.h>
> + #include "bitops.h"
> + #include "kmem.h"
> + #include "ubifs.h"
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-chec=
k-for-execinfo-and-backtrace.patch b/meta/recipes-devtools/mtd/files/0003-c=
onfigure.ac-Add-a-check-for-execinfo-and-backtrace.patch
> new file mode 100644
> index 0000000000..8ab7d7369c
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-e=
xecinfo-and-backtrace.patch
> @@ -0,0 +1,54 @@
> +From 8503bc3de0d3ff016caa715716578a3be3698548 Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@gmail.com>
> +Date: Tue, 18 Feb 2025 18:25:56 -0300
> +Subject: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo=
 and backtrace
> +
> +musl relies on an external execinfo library to provide backtrace
> +functionality. If musl cannot link to libexecinfo, the following link
> +error happens:
> +
> +| /work/festevam/oe/poky/build/tmp/work/core2-64-poky-linux-musl/mtd-uti=
ls/2.3.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec=
/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/14.2.0/ld: ubifs-utils/l=
ibubifs/mkfs_ubifs-io.o: in function `dump_stack':
> +| /usr/src/debug/mtd-utils/2.3.0/ubifs-utils/common/defs.h:71:(.text+0x2=
5): undefined reference to `backtrace'
> +....
> +| collect2: error: ld returned 1 exit status
> +| make: *** [Makefile:2959: mkfs.ubifs] Error 1
> +
> +Fix the problem by checking for backtrace support in libc first and if n=
ot
> +found, then check for backtrace support in the external libexecinfo.
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/2025021913=
0244.2119582-3-festevam@gmail.com/T/#t]
> +Signed-off-by: Fabio Estevam <festevam@gmail.com>
> +Suggested-by: Khem Raj <raj.khem@gmail.com>
> +Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> +---
> +Change since v3:
> +- None.
> +
> + configure.ac | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2a79ba820fc0..296901e61760 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -238,6 +238,17 @@ if test "x$need_cmocka" =3D "xyes"; then
> +       PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing=3D"yes"])
> + fi
> +
> ++AC_CHECK_FUNC([backtrace], [have_backtrace=3Dyes], [have_backtrace=3Dno=
])
> ++
> ++if test "x$have_backtrace" =3D "xno"; then
> ++    AC_CHECK_LIB([execinfo], [backtrace],
> ++        [LIBS=3D"$LIBS -lexecinfo"
> ++         AC_DEFINE([HAVE_BACKTRACE], [1], [backtrace is available via l=
ibexecinfo])],
> ++        [AC_MSG_WARN([backtrace support not found])])
> ++else
> ++    AC_DEFINE([HAVE_BACKTRACE], [1], [backtrace is available via libc])
> ++fi
> ++
> + AC_CHECK_HEADERS([execinfo.h])
> +
> + ##### produce summary on dependencies #####
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_fil=
es-Include-linux-limits.h.patch b/meta/recipes-devtools/mtd/files/0004-ubif=
s-utils-extract_files-Include-linux-limits.h.patch
> new file mode 100644
> index 0000000000..87806af27d
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Incl=
ude-linux-limits.h.patch
> @@ -0,0 +1,41 @@
> +From f218be1ce0c8923d690221160a3dd9f1492acaf1 Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@gmail.com>
> +Date: Tue, 18 Feb 2025 08:17:30 -0300
> +Subject: [PATCH v4 mtd-utils 4/4] ubifs-utils: extract_files: Include <l=
inux/limits.h>
> +
> +Include <linux/limits.h> to fix the following build error when building
> +with musl:
> +
> +| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_=
node':
> +| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LI=
ST_MAX' undeclared (first use in this function)
> +|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) =
{
> +|       |                                               ^~~~~~~~~~~~~~
> +| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undec=
lared identifier is reported only once for each function it appears in
> +| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_fi=
les.o] Error 1
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/2025021913=
0244.2119582-4-festevam@gmail.com/T/#t]
> +Signed-off-by: Fabio Estevam <festevam@gmail.com>
> +Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> +---
> +Changes since v3:
> +- None.
> +
> + ubifs-utils/fsck.ubifs/extract_files.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.u=
bifs/extract_files.c
> +index c83d37749bc0..000ef5d10565 100644
> +--- a/ubifs-utils/fsck.ubifs/extract_files.c
> ++++ b/ubifs-utils/fsck.ubifs/extract_files.c
> +@@ -10,6 +10,8 @@
> + #include <getopt.h>
> + #include <sys/stat.h>
> +
> ++#include <linux/limits.h>
> ++
> + #include "linux_err.h"
> + #include "bitops.h"
> + #include "kmem.h"
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb b/meta/recipes-=
devtools/mtd/mtd-utils_2.3.0.bb
> similarity index 89%
> rename from meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
> rename to meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> index 5ab5f6c729..09d191ba32 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> @@ -11,8 +11,15 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS =3D "zlib e2fsprogs util-linux"
>  RDEPENDS:mtd-utils-tests +=3D "bash"
>
> -SRCREV =3D "13ec33609213c1dbd75852a09560a707a7f19a5c"
> +DEPENDS:append:libc-musl =3D " libexecinfo"
> +LDFLAGS:append:libc-musl =3D " -lexecinfo"
> +
> +SRCREV =3D "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
>  SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster"
> +SRC_URI +=3D "file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch"
> +SRC_URI +=3D "file://0002-ubifs-utils-journal-Include-sys-stat.h.patch"
> +SRC_URI +=3D "file://0003-configure.ac-Add-a-check-for-execinfo-and-back=
trace.patch"
> +SRC_URI +=3D "file://0004-ubifs-utils-extract_files-Include-linux-limits=
.h.patch"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -31,6 +38,8 @@ CPPFLAGS:append:riscv64  =3D " -pthread -D_REENTRANT"
>
>  EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAGS=
=3D${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_=
XATTR', d)} -I${S}/include' 'BUILDDIR=3D${S}'"
>
> +CFLAGS +=3D "-D_GNU_SOURCE"
> +
>  # Use higher priority than corresponding BusyBox-provided applets
>  ALTERNATIVE_PRIORITY =3D "100"
>
> --
> 2.40.1
>

