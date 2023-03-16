Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC75C74A5B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.5152.1679003152904171980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Uz8pJQ4h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id le6so3237928plb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyNydUgeSyII4KWleaQx8cMyA1IhwjvtNqeqdtVLrSo=;
        b=Uz8pJQ4hYQ8V763PxlDMi17E7UHCqgBJzEDcHTPRXdT+Ez4IpdBjtOQBr5gcvpd1nN
         oSFO9oAo0KPi5WtdTJP2eTcVzUMGPUsIkddlMBOIP6AxPjy7BxZloz6owE6yuchTX3Z3
         UffK5/6D2ET5PoeUrf1ZIfu5yPpzxR6pl3TG9cCRuW1BmAZjztkYMlF696/WyZribQRH
         oqDSO0iF72drkSNwhhB4JvtEO5XpC9WjxQdW7Nmf8v/MCqtVi3jeq79s7MyNquMVuxgR
         rYrNVpXEfkM7k9oGlpZjF6nyCmMusv8ycM+XYUCDyXFhanFvw1Bstlwt/XFyCjlB47lx
         ipcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyNydUgeSyII4KWleaQx8cMyA1IhwjvtNqeqdtVLrSo=;
        b=tiok7pqvOfMaVfkKog2/I3GiQDkEYk1s2lmF/iBuOW2Z9BQBf7ox5sFdS59E/ySclC
         QtYQAl1PUyx/WZnWrTm8p146LwU830KSE0nyadHLToQJWq058ycsqQIoxgG65p/4pzlA
         8T65hC7RBCAFoW614443vMmcIvAEwMt8gZs9GXzk7FlBUnHOwlmLha/LsfLp1OF17g5E
         mnptiVgJrjQ/oL5g6ejPAbWMQi8Ro3JUCDv2f8JJ3rubrRAUYOpqsGAA47Fq0+T/Pr6H
         Wq0QAXdeUAi1RpIG59IR3wHrbAtHiGG65PaJAtcDNUaa+TdZS9Puoy/qEKpQzQ4o4Oee
         ob6A==
X-Gm-Message-State: AO0yUKUZNllz8KeO9/6a9oGmQOgC093mo31lVE3N2cH+HB9ekks/yhOr
	/E29TpCoeOdmnyAVMCtCvwvD1OJR+Api0zfuc3Y=
X-Google-Smtp-Source: AK7set8KOWGEroLIVcbDtKaxPQ7RSYd8moJnRCpmHkfK+yOKSK1BiXPUcGsBqIe4oBAdrWgKWooylg==
X-Received: by 2002:a05:6a20:e20:b0:d4:b0c9:ac29 with SMTP id ej32-20020a056a200e2000b000d4b0c9ac29mr4412367pzb.22.1679003151952;
        Thu, 16 Mar 2023 14:45:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/23] meson: remove obsolete RPATH stripping patch
Date: Thu, 16 Mar 2023 11:45:10 -1000
Message-Id: <737edc7304884c9c5a094971f344d8e459049ec5.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178724

From: Ross Burton <ross.burton@arm.com>

As per the release notes for 0.55.0[1], this patch is no longer needed
as Meson now only removes the RPATHs that it adds itself, any RPATHs
added via LDFLAGS or pkgconfig files are left untouched.

[1] https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-now-more-careful

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4011c0fadec98f1001046079f59e4e2a4a3a3fcf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../meson/meson/disable-rpath-handling.patch  | 37 -------------------
 meta/recipes-devtools/meson/meson_0.63.3.bb   |  1 -
 2 files changed, 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/disable-rpath-handling.patch

diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
deleted file mode 100644
index 7aaed8b4a3..0000000000
--- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 18600f7a1cddf23aeabd188f86e66983f27ccfe3 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 23 Nov 2018 15:28:28 +0000
-Subject: [PATCH] meson: Disable rpath stripping at install time
-
-We need to allow our rpaths generated through the compiler flags to make it into
-our binaries. Therefore disable the meson manipulations of these unless there
-is a specific directive to do something differently in the project.
-
-RP 2018/11/23
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
----
- mesonbuild/minstall.py | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 7d0da13..17d50db 100644
---- a/mesonbuild/minstall.py
-+++ b/mesonbuild/minstall.py
-@@ -718,8 +718,11 @@ class Installer:
-             if file_copied:
-                 self.did_install_something = True
-                 try:
--                    self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
--                                   install_name_mappings, verbose=False)
-+                    if install_rpath:
-+                        self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
-+                                       install_name_mappings, verbose=False)
-+                    else:
-+                        print("RPATH changes at install time disabled")
-                 except SystemExit as e:
-                     if isinstance(e.code, int) and e.code == 0:
-                         pass
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/meson/meson_0.63.3.bb b/meta/recipes-devtools/meson/meson_0.63.3.bb
index 9267077422..0d13448744 100644
--- a/meta/recipes-devtools/meson/meson_0.63.3.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.3.bb
@@ -12,7 +12,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://meson-setup.py \
            file://meson-wrapper \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
-           file://disable-rpath-handling.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
-- 
2.34.1


