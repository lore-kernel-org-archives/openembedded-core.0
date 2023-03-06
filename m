Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47979C6FA99
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:14:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.36085.1678115666256462341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PnrDj/4b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id g3so9180084wri.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678115664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8WqGnG3YNdDFmKCjG++vX72PHXfWYs70cSqclf5emw=;
        b=PnrDj/4bBoD27JElKjOTBwUbWhUs5IGIX+8X18sH7B5vpjV/csDovuyPMw0OdqcbCm
         9Axvx1lWXSQc2iYs3RzU/YJh2CmH7MG92JZO7Jec3RdT4fzQZncGJVgnzyggolBXZDoV
         Eu0qBjLu2+NNBlJXrqzERDXvcLlfIiNb0DdE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678115664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8WqGnG3YNdDFmKCjG++vX72PHXfWYs70cSqclf5emw=;
        b=IkezA7B5IaWnnGDltCU5YP0/WMGIwvEuYoaIEMtfktw40CrHcLPc8+BhCQ9+l+d0kK
         HDitpzhRDy8XeIPhf85qW5ByV7MGnGhKlGi2qXYGv+tbztotHZbejVElQ/DhVU0vOG+Z
         jPrDSpVRGL/5EyBFl+rVaJqnGhxJ7461DzT2uKIlrB7zkbDImJWCvlVYVEuH79SwZ1UD
         mwkYg83YbTTlgIKq9Jgr11Ir2wahnu7NgVEZ3v9JvkO3/BYqTibBt0C/9ls+XXqOJtOo
         3MhW6vRDaiY60ulzC/oHHThFLnj+SutVv12BCk5OGfnyuKKvBv1G9MsuXxCKGZNN/hnJ
         L6Wg==
X-Gm-Message-State: AO0yUKUvm5xCVTb2DsgkYLXuTHpYUuSvywZu4ZF0SQZCy1YQnJj0A9dm
	00ZImAnvC9EzdE8/I75JjGu8MJFDp/FZPljkk10=
X-Google-Smtp-Source: AK7set9pBBUbSiGGawfbefOLrWtuVfHvb65Ydj5YgvN65B1amMl22ONknSF74TMBNtrG3rWYCDpdeg==
X-Received: by 2002:adf:ecc1:0:b0:2c7:df22:117d with SMTP id s1-20020adfecc1000000b002c7df22117dmr6789311wro.31.1678115664191;
        Mon, 06 Mar 2023 07:14:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd2e:ab1c:fd8:608e])
        by smtp.gmail.com with ESMTPSA id s4-20020adff804000000b002c705058773sm10575773wrp.74.2023.03.06.07.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:14:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdb: Fix occasional build failure
Date: Mon,  6 Mar 2023 15:14:23 +0000
Message-Id: <20230306151423.2340879-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178074

When running the configure check "checking for ELF support in BFD", LDFLAGS
were not being passed in to libtool. In OE/YP, we need these flags when using
uninative due to the games we play with the dynamic loader.

If a version of libzstd was built against a newer glibc, it would need
newer pthread symbols which it wouldn't find with the system linker. At
runtime this isn't an issue as it would be switched to use uninative but we
pass flags in LDFLAGS to allow this.

The bug is rare to reproduce as it depends on the host libzstd was built
against.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/add-missing-ldflags.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 18603cc7d43..9457c27f8b7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch \
+           file://add-missing-ldflags.patch \
            "
 SRC_URI[sha256sum] = "115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0"
 
diff --git a/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch b/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
new file mode 100644
index 00000000000..9385aa99c66
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/add-missing-ldflags.patch
@@ -0,0 +1,47 @@
+When running the configure check "checking for ELF support in BFD", LDFLAGS
+were not being passed in to libtool. In OE/YP, we need these flags when using
+uninative due to the games we play with the dynamic loader.
+
+If a version of libzstd was built against a newer glibc, it would need
+newer pthread symbols which it wouldn't find with the system linker. At
+runtime this isn't an issue as it would be switched to use uninative but we
+pass flags in LDFLAGS to allow this.
+
+The comments say LDFLAGS are used but it was dropped in this commit:
+
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5218fa9e8937b007d554f1e01c2e4ecdb9b7e271
+
+and probably needs to be put back upstream.
+
+The bug is rare to reproduce as it depends on the host libzstd was built
+against.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: gdb-13.1/gdb/acinclude.m4
+===================================================================
+--- gdb-13.1.orig/gdb/acinclude.m4
++++ gdb-13.1/gdb/acinclude.m4
+@@ -234,7 +234,7 @@ AC_DEFUN([GDB_AC_CHECK_BFD], [
+   # points somewhere with bfd, with -I/foo/lib and -L/foo/lib.  We
+   # always want our bfd.
+   CFLAGS="-I${srcdir}/../include -I../bfd -I${srcdir}/../bfd $CFLAGS"
+-  LDFLAGS="-L../bfd -L../libiberty"
++  LDFLAGS="-L../bfd -L../libiberty $LDFLAGS"
+   intl=`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
+   LIBS="-lbfd -liberty $intl $LIBS"
+   CC="./libtool --quiet --mode=link $CC"
+Index: gdb-13.1/gdb/configure
+===================================================================
+--- gdb-13.1.orig/gdb/configure
++++ gdb-13.1/gdb/configure
+@@ -28561,7 +28561,7 @@ WIN32LIBS="$WIN32LIBS $WIN32APILIBS"
+   # points somewhere with bfd, with -I/foo/lib and -L/foo/lib.  We
+   # always want our bfd.
+   CFLAGS="-I${srcdir}/../include -I../bfd -I${srcdir}/../bfd $CFLAGS"
+-  LDFLAGS="-L../bfd -L../libiberty"
++  LDFLAGS="-L../bfd -L../libiberty $LDFLAGS"
+   intl=`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
+   LIBS="-lbfd -liberty $intl $LIBS"
+   CC="./libtool --quiet --mode=link $CC"
-- 
2.38.1


