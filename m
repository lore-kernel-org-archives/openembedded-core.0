Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0ACC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:04:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.8253.1635527071322343797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RhtKatSh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u18so17263157wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oqsIUwG1e3xlX+CZHSijjzKE/GFNQji9SNlu3gfddk=;
        b=RhtKatShQyjxnZwWcyWaS3HzbpV8v1RbsgCEUxE/EGPX98sUdVVWZIt7wojlTReK7v
         V2dDGKIGJNCDYjm7X6kNuZs7LEuYjCjTLh1+LZF1rsP0guZhY21LqBdsETGfj52jOPZK
         fNLq5OCY1HMts22ZEzhxaFsNlQ3rQAsj2BEhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oqsIUwG1e3xlX+CZHSijjzKE/GFNQji9SNlu3gfddk=;
        b=W7S9+GwgJm6y8PylBc/4313aL2GzGywk3OXWhCefjjlp5haG3hJJc83vbl+kPwVyQ9
         UfIt6sv9FAGRUE4TqgEijRBVvvl98WJZN6mwmB9tOwR63nHMww60p/ZG/zhiwhaoRYaM
         1MkmQCON36r+BCcZukyi99YBbG6Gii2hNFe0xcqs8lIVIh/Ah/1Hq3EaV+yhhAra9tN+
         H8sUBnugnZaObjlySHrQz+VRJcC5CV3Br8hrHreevJoy0tFZtl7VTZdle7WimfsJxfF3
         pNWL890G3LtxUn2X611wOyXpht+7E3bu+mLHsHOaDCu3H+g74ymFFuNa2Lb0zRIDWns0
         oIZg==
X-Gm-Message-State: AOAM530TaYLJkcwKHlgNUM68WEPnrstKO0P/iwj8SnOLbhQow3NwTWDM
	GR6zLjX8wAACsVH3JdRx3Xly8mQQ3V+zwA==
X-Google-Smtp-Source: 
 ABdhPJyPjM1nwa8VYodtljieQxVCzVwlG4t9ITckq9cDST/f7YGuv2jv1voR2jJ55CREW50QP3XefA==
X-Received: by 2002:adf:d1ee:: with SMTP id
 g14mr15976503wrd.264.1635527069303;
        Fri, 29 Oct 2021 10:04:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 r10sm6259006wrl.92.2021.10.29.10.04.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:04:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Drop libgfortran patch
Date: Fri, 29 Oct 2021 18:04:28 +0100
Message-Id: <20211029170428.3431673-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:04:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157627

As far as I can see, when building libgfortran we don't set GFORTRAN so this
patch does nothing any more. The fortran build and gcc recipes have changed
massively since gcc 4.2.2 so I think this patch is simply obsolete.

I did test building libgfortran with and without this patch and there was
no difference, the correct fortran compiler is found. If it were an issue
we should just set GFORTRAN correctly. Therefore drop the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
 .../gcc/0008-fortran-cross-compile-hack.patch | 43 -------------------
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index d39307df2b1..f06c1a891b2 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -36,7 +36,6 @@ SRC_URI = "\
            file://0005-optional-libstdc.patch \
            file://0006-COLLECT_GCC_OPTIONS.patch \
            file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-           file://0008-fortran-cross-compile-hack.patch \
            file://0009-cpp-honor-sysroot.patch \
            file://0010-MIPS64-Default-to-N64-ABI.patch \
            file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
deleted file mode 100644
index 47f611e37ea..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 904d102e3ccb93296b16ceb2e283a6ccf3c1d718 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:20:01 +0400
-Subject: [PATCH] fortran cross-compile hack.
-
-* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
-used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
-directory.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- libgfortran/configure    | 2 +-
- libgfortran/configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgfortran/configure b/libgfortran/configure
-index f3634389cf8..f974e874b8e 100755
---- a/libgfortran/configure
-+++ b/libgfortran/configure
-@@ -13102,7 +13102,7 @@ esac
- 
- # We need gfortran to compile parts of the library
- #AC_PROG_FC(gfortran)
--FC="$GFORTRAN"
-+#FC="$GFORTRAN"
- ac_ext=${ac_fc_srcext-f}
- ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
- ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
-diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
-index 8961e314d82..49c8221cb6b 100644
---- a/libgfortran/configure.ac
-+++ b/libgfortran/configure.ac
-@@ -271,7 +271,7 @@ AC_SUBST(enable_static)
- 
- # We need gfortran to compile parts of the library
- #AC_PROG_FC(gfortran)
--FC="$GFORTRAN"
-+#FC="$GFORTRAN"
- AC_PROG_FC(gfortran)
- 
- # extra LD Flags which are required for targets
-- 
2.32.0


