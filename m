Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D84CE7F13F
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 22:00:30 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.3998.1695765626589087683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 15:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ny4303oO;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6c0a3a2cc20so5720888a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 15:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695765626; x=1696370426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbCRAtW84qPY+LCCL8DPkDbdnCagmpJU3cRjZ87QRSk=;
        b=Ny4303oOmYnjccRimDqs3F628ZAqawWY2hHszTUbBuFX5drQ33d9QRzAVl0Ug4vSMo
         g8wgAw/6rG8Ix1GGDfHNLOI3+tOfVwKvBaz/hQuuF4nvPTRaTjUoUXE7bpDJVrPNsGWH
         6G0M6DGFR+/ZVgHi7EVM2NKFN3tgpzi3WXyDd4fpSMYMt3//qYhlnueEjOCpwJPhp24H
         SiRIwUCb33zgzGBkBq7Snpsv+TJgzJFLK/hLGlK/LzBQmF6kKXByYQrAc86iln/2N358
         2ATVGDWM7JJLZiC0k6qwCGVVSB/lmbvI7WgR8IUxP2Lwyb9X7lrdohSIl7UQbiu/qe8t
         kqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695765626; x=1696370426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbCRAtW84qPY+LCCL8DPkDbdnCagmpJU3cRjZ87QRSk=;
        b=C3SacSktG4UYbz6Ir8pz8mv6va8vUpCF1KiKIbdGziN3NWd40/+Aw6DyOQMg0JH4xW
         hE0SvCmBwG3i0pJ/i4TM2Nr7E4ma1pI3BzUJS08AJE9hxvwT/SeepBcINXahv0DyJZz2
         mv7Po3AjSLQ5oLUU7r8vNNqWxZgJ17HUGaINSpIpUGk/H1mNzyOfbCqXbi41uJFt+7ux
         IhC0ml6YvIDAtZIKbAljX3qv9KD2r7vUy2cWnAbsWKSfoXgnmuyBiFXlj/1OWru+sxZS
         AOaKdeT4zbOUfEVI0q4QyURlm/mHccbWgQ5hRSUnWZjSEDzeT2bbdmrfa2/LjjYosmGQ
         AesQ==
X-Gm-Message-State: AOJu0YxPMYjFKpe6hHXOEGRYpwv59EdyiUf3MMDIWwJ3ttcu9deGUQqg
	gcyfEDbzsmXDmWRA30RJta2OPEaJssVlsA==
X-Google-Smtp-Source: AGHT+IHad01niY0r43boI8jwxBWzoHtkXDOKLVL5nq4kQ3mDtN+Js9n6POvfNAUpk7E5OPXX2dswbQ==
X-Received: by 2002:a9d:7f83:0:b0:6c2:2f93:4d2a with SMTP id t3-20020a9d7f83000000b006c22f934d2amr218099otp.8.1695765625605;
        Tue, 26 Sep 2023 15:00:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id w26-20020aa7859a000000b00690fdeb5c0dsm10410143pfn.2.2023.09.26.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 15:00:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] createrepo-c: Fix function declaration bug found with clang
Date: Tue, 26 Sep 2023 15:00:19 -0700
Message-ID: <20230926220019.230275-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 22:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188281

clang is stricter about function parameter types in its functions and
errors out.

error: incompatible integer to pointer conversion initializing 'gchar *' (aka 'char *')

Real problem is in createrepo_c code where funciton definition and
declaration scopes are different

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s_groupfile-outside-WITH_LIBMODULEMD.patch | 46 +++++++++++++++++++
 .../createrepo-c/createrepo-c_1.0.0.bb        |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
new file mode 100644
index 00000000000..ea768e06e62
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
@@ -0,0 +1,46 @@
+From 5326969acc0c7e9e3cabca202154e4120c0d2c2f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 26 Sep 2023 14:52:11 -0700
+Subject: [PATCH] Move cr_compress_groupfile outside WITH_LIBMODULEMD
+
+This function is used in code which is not conditional under WITH_LIBMODULEMD
+therefore the declaration should also match its definition scope
+
+Fixes build issues flagged by clang
+
+src/createrepo_c.c:850:16: error: incompatible integer to pointer conversion initializing 'gchar *' (aka 'char *') with an
+ expression of type 'int' [-Wint-conversion]
+|   850 |         gchar *compressed_path = cr_compress_groupfile(cmd_options->groupfile_fullpath, tmp_out_repo, compression);
+|       |                ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/387]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/metadata_internal.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/metadata_internal.h b/src/metadata_internal.h
+index 8ba0576..ecfbac2 100644
+--- a/src/metadata_internal.h
++++ b/src/metadata_internal.h
+@@ -52,14 +52,14 @@ cr_metadata_load_modulemd(ModulemdModuleIndex **moduleindex,
+  * @param dest_dir      Path to directory where the compressed groupfile should be stored.
+  * @return              Path to the new compressed groupfile. Has to be freed by the caller.
+  */
++
++#endif /* WITH_LIBMODULEMD */
++
+ gchar *
+ cr_compress_groupfile(const char *groupfile,
+                       const char *dest_dir,
+                       cr_CompressionType compression);
+ 
+-
+-#endif /* WITH_LIBMODULEMD */
+-
+ #ifdef __cplusplus
+ }
+ #endif
+-- 
+2.42.0
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
index 9b109327c8f..f4e65492f87 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
            file://time64fix.patch \
+           file://0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch \
            "
 
 SRCREV = "0cc13920991b2fb8f87fb9d352bd3394c2983289"
-- 
2.42.0


