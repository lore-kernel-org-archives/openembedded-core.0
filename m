Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C258C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:20:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.67527.1679559643339936910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VrdMzTJU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E043C2000B;
	Thu, 23 Mar 2023 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679559641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OdYN43b3leBksHKcNKuNOkuh+iPRhSHAnVbAhbTNeqM=;
	b=VrdMzTJULKkdZcwFvygFbo6Fl5IgzjgcT/ylYmPcoDWNeIXRgV6+Zoo5OrFSOS73RRHlK8
	w7q4J6vg232U+SXTypmpbMc4umOfiQ+mZnqIrvwP5nfjUq7FDu7XXdh+AvNoJQ+CgLFJ/H
	Og9G8RNxf5+TcpPJOXNshkWNQh2WjsvgV3sG75GrVH/0L2PkV/yPzgylg+VlpO7AsL868/
	V10TyJJOq8NilfSdxd9Wg+XtmS91bdZtoFRDvOP8zSZ8cEX5rgA57Rhee5aPejEshyoYyg
	hZ4G3MNv1VWSHLiLl8jGQFp/TDRhmZUMcs75bdsEOdboidNHZ91pOVhzx99hSw==
Date: Thu, 23 Mar 2023 09:20:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH V2] debugedit: add recipe
Message-ID: <2023032308204037f2f273@mail.local>
References: <20230323081115.28531-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323081115.28531-1-Qi.Chen@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178969

Hello,

I think you also forgot to add a maintainer:

AssertionError: 
The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
debugedit (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb)

On 23/03/2023 16:11:15+0800, Chen Qi wrote:
> This recipe provides find-debuginfo which is used by rpm, more
> specifically rpmbuild.
> 
> RPM upstream removed find-debuginfo and switched to use debugedit
> in the following commit.
> 
>   https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd9466fb9dc717846f5bf15518cc
> 
> Without debugedit, rpmbuild fails to generate debuginfo package when
> %debug_package is added to spec file.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../debugedit/debugedit_5.0.bb                |  28 +++++
>  ...tools-Add-error.h-for-non-glibc-case.patch | 102 ++++++++++++++++++
>  ...ugcrcfix.c-do-not-use-64bit-variants.patch |  56 ++++++++++
>  ...003-Makefile.am-do-not-update-manual.patch |  65 +++++++++++
>  4 files changed, 251 insertions(+)
>  create mode 100644 meta/recipes-devtools/debugedit/debugedit_5.0.bb
>  create mode 100644 meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
>  create mode 100644 meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
>  create mode 100644 meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
> 
> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> new file mode 100644
> index 0000000000..257238fa24
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Tools for creating debuginfo and source file distributions"
> +DESCRIPTION = "debugedit provides programs and scripts for creating \
> +debuginfo and source file distributions, collect build-ids and rewrite \
> +source paths in DWARF data for debugging, tracing and profiling."
> +HOMEPAGE = "https://sourceware.org/debugedit/"
> +
> +LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> +                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> +                    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
> +
> +SRC_URI:append:libc-musl = " \
> +           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
> +           file://0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch \
> +           file://0003-Makefile.am-do-not-update-manual.patch \
> +           "
> +
> +SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
> +
> +DEPENDS = "elfutils"
> +
> +inherit pkgconfig autotools
> +
> +RDEPENDS:${PN} += "bash elfutils-binutils"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> new file mode 100644
> index 0000000000..f6d64cb4e7
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> @@ -0,0 +1,102 @@
> +From 4c797d3b559ba51bd9ccd9a2036245819acce843 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 23 Mar 2023 10:54:21 +0800
> +Subject: [PATCH] tools: Add error.h for non-glibc case
> +
> +error is glibc specific API, so this patch will mostly not accepted
> +upstream given that elfutils has been closely tied to glibc
> +
> +This is a OE specific workaround for musl.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + tools/debugedit.c      |  7 ++++++-
> + tools/error.h          | 27 +++++++++++++++++++++++++++
> + tools/sepdebugcrcfix.c |  7 ++++++-
> + 3 files changed, 39 insertions(+), 2 deletions(-)
> + create mode 100644 tools/error.h
> +
> +diff --git a/tools/debugedit.c b/tools/debugedit.c
> +index 668777a..a72c3c0 100644
> +--- a/tools/debugedit.c
> ++++ b/tools/debugedit.c
> +@@ -25,7 +25,6 @@
> + #include <byteswap.h>
> + #include <endian.h>
> + #include <errno.h>
> +-#include <error.h>
> + #include <limits.h>
> + #include <string.h>
> + #include <stdlib.h>
> +@@ -40,6 +39,12 @@
> + #include <gelf.h>
> + #include <dwarf.h>
> + 
> ++#ifdef __GLIBC__
> ++#include <error.h>
> ++#else
> ++#include "error.h"
> ++#endif
> ++
> + #ifndef MAX
> + #define MAX(m, n) ((m) < (n) ? (n) : (m))
> + #endif
> +diff --git a/tools/error.h b/tools/error.h
> +new file mode 100644
> +index 0000000..9b24418
> +--- /dev/null
> ++++ b/tools/error.h
> +@@ -0,0 +1,27 @@
> ++#ifndef _ERROR_H_
> ++#define _ERROR_H_
> ++
> ++#include <stdarg.h>
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <errno.h>
> ++
> ++static unsigned int error_message_count = 0;
> ++
> ++static inline void error(int status, int errnum, const char* format, ...)
> ++{
> ++	va_list ap;
> ++	fprintf(stderr, "%s: ", program_invocation_name);
> ++	va_start(ap, format);
> ++	vfprintf(stderr, format, ap);
> ++	va_end(ap);
> ++	if (errnum)
> ++		fprintf(stderr, ": %s", strerror(errnum));
> ++	fprintf(stderr, "\n");
> ++	error_message_count++;
> ++	if (status)
> ++		exit(status);
> ++}
> ++
> ++#endif        /* _ERROR_H_ */
> +diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
> +index da50e6c..c4a9d56 100644
> +--- a/tools/sepdebugcrcfix.c
> ++++ b/tools/sepdebugcrcfix.c
> +@@ -29,10 +29,15 @@
> + #include <endian.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> +-#include <error.h>
> + #include <libelf.h>
> + #include <gelf.h>
> + 
> ++#ifdef __GLIBC__
> ++#include <error.h>
> ++#else
> ++#include "error.h"
> ++#endif
> ++
> + #ifndef _
> + #define _(x) x
> + #endif
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch b/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
> new file mode 100644
> index 0000000000..4463bd2324
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
> @@ -0,0 +1,56 @@
> +From 3e05bbc1f7909ab6f529e66f0d0f70fb1e60583a Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 23 Mar 2023 11:55:53 +0800
> +Subject: [PATCH 2/2] sepdebugcrcfix.c: do not use 64bit variants
> +
> +configure.ac checks for largefile support via AC_SYS_LARGEFILE
> +already, therefore use off_t, open and lseek instead of 64bit
> +variants. Musl e.g. does not define them without _LARGEFILE64_SOURCE
> +and error is not seen on glibc because _GNU_SOURCE defines
> +_LARGEFILE64_SOURCE.
> +
> +This patch is marked as inappropriate as debugedit obviously only
> +wants to support glibc or some glibc compatible libcs. We can see
> +this from the error() usage. And this patch is only for musl.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + tools/sepdebugcrcfix.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
> +index c4a9d56..882e5f5 100644
> +--- a/tools/sepdebugcrcfix.c
> ++++ b/tools/sepdebugcrcfix.c
> +@@ -144,7 +144,7 @@ crc32 (const char *fname, const char *base_fname, uint32_t *crcp)
> +       error (0, errno, _("cannot open \"%s\""), debugname);
> +       return false;
> +     }
> +-  off64_t size = lseek64 (fd, 0, SEEK_END);
> ++  off_t size = lseek (fd, 0, SEEK_END);
> +   if (size == -1)
> +     {
> +       error (0, errno, _("cannot get size of \"%s\""), debugname);
> +@@ -289,7 +289,7 @@ process (Elf *elf, int fd, const char *fname)
> + 	  return true;
> + 	}
> +       updated_count++;
> +-      off64_t seekto = (shdr->sh_offset + data->d_off
> ++      off_t seekto = (shdr->sh_offset + data->d_off
> + 			+ (crcp - (const uint8_t *) data->d_buf));
> +       uint32_t crc_targetendian = (ehdr->e_ident[EI_DATA] == ELFDATA2LSB
> + 				   ? htole32 (crc) : htobe32 (crc));
> +@@ -361,7 +361,7 @@ main (int argc, char **argv)
> + 	error (0, errno, _("cannot chmod \"%s\" to make sure we can read and write"), fname);
> + 
> +       bool failed = false;
> +-      int fd = open64 (fname, O_RDWR);
> ++      int fd = open (fname, O_RDWR);
> +       if (fd == -1)
> + 	{
> + 	  error (0, errno, _("cannot open \"%s\""), fname);
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
> new file mode 100644
> index 0000000000..de467f5365
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
> @@ -0,0 +1,65 @@
> +From 4f0d7d2f4900ce8555e09854dc681278b7a3d9a9 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 23 Mar 2023 13:09:23 +0800
> +Subject: [PATCH 3/3] Makefile.am: do not update manual
> +
> +The tarball ships these manuals, no need to re-generate them.
> +We have local patches for debugedit.c and sepdebugcrcfix.c,
> +this will triger re-generation of the manuals, which causes
> +error of missing help2man.
> +
> +This is an OE specific patch. If we don't have local patches
> +patching debugedit.c and sepdebugcrcfix.c, this patch is also
> +not needed.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile.am | 30 ------------------------------
> + 1 file changed, 30 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 98b2f20..f91deea 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
> + # Manual pages are generated for dist
> + dist_man_MANS = debugedit.1 sepdebugcrcfix.1 find-debuginfo.1
> + 
> +-# The 'case' ensures the man pages are only generated if the corresponding
> +-# source script (the first prerequisite) or configure.ac (for the version)
> +-# has been changed.  The executable prerequisite is solely meant to force
> +-# these docs to be made only after the executable has been compiled.
> +-# This makes sure help2man is not normally necessary (since the generated
> +-# man pages are distributed).
> +-debugedit.1: tools/debugedit.c configure.ac debugedit$(EXEEXT)
> +-	@case '$?' in \
> +-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
> +-		--name='debug source path manipulation tool' \
> +-		./debugedit$(EXEEXT) ;; \
> +-	  * ) : ;; \
> +-	esac
> +-
> +-sepdebugcrcfix.1: tools/sepdebugcrcfix.c configure.ac sepdebugcrcfix$(EXEEXT)
> +-	@case '$?' in \
> +-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
> +-		--name='fixes CRC for separate .debug files' \
> +-		./sepdebugcrcfix$(EXEEXT) ;;\
> +-	  * ) : ;; \
> +-	esac
> +-
> +-find-debuginfo.1: $(top_srcdir)/scripts/find-debuginfo.in configure.ac find-debuginfo
> +-	@case '$?' in \
> +-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
> +-		--name='finds debuginfo and processes it' \
> +-		./find-debuginfo ;;\
> +-	  * ) : ;; \
> +-	esac
> +-
> + noinst_HEADERS= tools/ansidecl.h \
> + 		tools/hashtab.h \
> + 		tools/md5.h \
> +-- 
> +2.17.1
> +
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178967): https://lists.openembedded.org/g/openembedded-core/message/178967
> Mute This Topic: https://lists.openembedded.org/mt/97796617/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

