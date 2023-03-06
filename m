Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C400C678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 09:53:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.29670.1678096386400779026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 01:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qj1Tz32V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id c18so5222397wmr.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 01:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE/fjgVHqL7e5gyurGQT5c59LzoMfjHv5mb+UUqvg2A=;
        b=Qj1Tz32VKAghP4sjKVVXRtvPLmE8oHFKdnttouCt/B7lvGHXDBkG4x9IRopgpeS3X0
         e6rczpdhxckxh0c4FlEae+5HIuEEsEwqIkESZ3uFY6nmCT+9hANSPHrWjgsVv9mCsXHL
         GJlILCRt0I6KemD4zPBHUf5O5nhZtVFkKgiAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dE/fjgVHqL7e5gyurGQT5c59LzoMfjHv5mb+UUqvg2A=;
        b=svjU6mRWv3tKLjexsyCu62oN965Y5CPtKP1jkrboF+MHezYXnGt1zsGywINjNW9Guc
         gC8uYO84QaJAYYyR5nY0hi3vw1JfjWAhXmc1UzjKgTAhPf6HeqCpOVyBpoT0xJ18urH5
         p0l5iHERL/gZMWiZaMqYk+h4DwFOZMNxKViTmgH/zsWBwyh4e9UOgVC0UPHmp8j8eO3Z
         5aleySj8X2lgL29+qPjvnQMOvZcIXdr4nI4zY04skEB22a2FwOdt/KTpS+0hP+wDVpxM
         9mYJccFMvjdQGgJ9FrCPNE3CHCruBtj8XliFyoDd2qt4qQj4XfnK6meTXxtVOmJCB5aw
         meFw==
X-Gm-Message-State: AO0yUKWgk6NVkfx/Jyty2gikQe0Y+L8xizquVZK9C5vC4pJwZSSj18eK
	ndZ6M4iGu49xhQQGnADz/Vn5AdUDfVSsFrVmjWM=
X-Google-Smtp-Source: AK7set9H/+cch8zSIN/oSan7qiLQ+PWjMwYTS/r98gm1CaS/Ej8zynYzMYYOuu+edjPuS4kGuZRl0Q==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr7994027wmo.25.1678096384279;
        Mon, 06 Mar 2023 01:53:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd2e:ab1c:fd8:608e])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c431500b003daf672a616sm9490820wme.22.2023.03.06.01.53.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:53:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdb: Fix occasional build failure
Date: Mon,  6 Mar 2023 09:53:02 +0000
Message-Id: <20230306095302.2288220-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178064

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
 .../gdb/gdb/add-misssing-ldflags.patch        | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/add-misssing-ldflags.patch

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
 
diff --git a/meta/recipes-devtools/gdb/gdb/add-misssing-ldflags.patch b/meta/recipes-devtools/gdb/gdb/add-misssing-ldflags.patch
new file mode 100644
index 00000000000..9385aa99c66
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/add-misssing-ldflags.patch
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


