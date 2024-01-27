Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4C5C47DA9
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:09 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.8497.1706323087933935498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cLOITIEd;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.178, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ff7a098ab8so11586027b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323086; x=1706927886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFwT6arLchjEjwImjZZ4EBs3wf0Uat/x91N4nDLfrrA=;
        b=cLOITIEdgZwm8iWX3aDlfd4D8ytTx8ltG36fsiq+r1jox8ayD9dbed7IyWl8QSTetJ
         sVTdjN74ekZVGc9q3sXST5X2q076ttycbW7N0GkCtRyh8z7AV7ezpCuBPfgKzYaf0uNs
         iEZ7ABL9ynrb8zlGPLEfaK3S2j3BLVmiGnjPuDhYZUND+4ZBbphTGQSIbdGd/QbajsrD
         YNdsck2XcBPlFI9mtxXUEP7b2l117/5dY5Vw+YlWQMdwA+gr05cOsKIX2jm8gfolmj8C
         VPFQj7c8+64/AkGJvjL3kcHkPtNGEVWy1nzyAgfBchAxaHxkKpwn2l2xNCQwyWfanczb
         z4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323086; x=1706927886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFwT6arLchjEjwImjZZ4EBs3wf0Uat/x91N4nDLfrrA=;
        b=WJnUsa1brkMviDgAL0pxPab+4iT5FETzKafeZKVDHy+TSF9bumHKGE9kpTc4/WonKf
         K1x/hWMOlgzSLNFf4t5ejU10eTkJxF5j+OqlbgVFfiTUn8NItYF0qiEDfY7s+YU7Kb1U
         5Dnxrx3RXjjmDJwtZgyA5exm3RAPR+SJ/gJXxoafcJ8gf0uPtPoKNLWnwhFj4tst98Nn
         PHV4C79U4wGxE/tNtdcGsLKsI3TqJl1pgV8Anj0mL1V1HiU/TBegcCrSRks7Vk1vmEnv
         bBNUNILLq5VZcQ2ffgzAz+p0jTsWD20kpeSkhP6OJ/0/BiroH0NVRdrkR6cp66rpTgY+
         LvKQ==
X-Gm-Message-State: AOJu0YxfEt+28HeKveRIA48/P2LFGAHo/xSIZ31dP23KuFR34EMR7pqE
	WTZRluUaMqr6FYLio2/EAZufr3QVCvNeF7tLYVKjLIQPxo9ngx1p9opof8uedTzMvpjTuZjgCpK
	u5lGmog==
X-Google-Smtp-Source: AGHT+IGTCafKCLQoxxrE/Yj1EKX2BKRJwRD1USbnKXFWR1i2FExGoTInBHo5FljOjLvh+FeRarfBrw==
X-Received: by 2002:a0d:dfd5:0:b0:600:517:3de4 with SMTP id i204-20020a0ddfd5000000b0060005173de4mr1068331ywe.4.1706323086379;
        Fri, 26 Jan 2024 18:38:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/23] dtc: preserve version also from shallow git clones
Date: Fri, 26 Jan 2024 16:37:23 -1000
Message-Id: <a77defdac80d4cc660d6b6677bc166a1d1d338b5.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194424

From: Peter Marko <peter.marko@siemens.com>

Since switch from Makefile to meson based build,
the version is no longer hardcoded but queried from git tag.

This works only if git history is available.
When shallow tarballs are used, tag is not available.

Example error for trusted-firmware-a from meta-arm:
dtc version too old (039a994), you need at least version 1.4.4

Backport also patch to fix version in meson file.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 319f5d8a32d1f4a71ac997ce4522249b08f84945)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-meson.build-bump-version-to-1.7.0.patch | 29 ++++++++++++++
 ...n-allow-building-from-shallow-clones.patch | 38 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  6 ++-
 3 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
new file mode 100644
index 0000000000..79a3b92b44
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
@@ -0,0 +1,29 @@
+From 9153522103bd4ed7e3299c4d073f66bb37cb2d42 Mon Sep 17 00:00:00 2001
+From: Nikolay Letov <letov.nikolay@gmail.com>
+Date: Wed, 22 Feb 2023 13:36:07 +0300
+Subject: [PATCH 1/2] meson.build: bump version to 1.7.0
+
+[This was botched in the actual 1.7.0 release :( - David Gibson]
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=64a907f08b9bedd89833c1eee674148cff2343c6]
+
+Signed-off-by: Nikolay Letov <letov.nikolay@gmail.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 78251eb..d88cd9f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project('dtc', 'c',
+-  version: '1.6.0',
++  version: '1.7.0',
+   license: ['GPL2+', 'BSD-2'],
+   default_options: 'werror=true',
+ )
+-- 
+2.30.2
+
diff --git a/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch b/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
new file mode 100644
index 0000000000..0284905913
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
@@ -0,0 +1,38 @@
+From 4415b0baece3c4351a6d3637c2754abbefd4795d Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sat, 16 Dec 2023 18:58:31 +0100
+Subject: [PATCH 2/2] meson: allow building from shallow clones
+
+When building from shallow clone, tag is not available
+and version defaults to git hash.
+Problem is that some builds check DTC version and fail the comparison.
+Example is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
+Which fails to build with following error:
+dtc version too old (039a994), you need at least version 1.4.4
+
+Drop --always from git describe command, see
+https://github.com/mesonbuild/meson/blob/1.3.0/mesonbuild/utils/universal.py#L773
+This will make it more closer to build via Makefile.
+
+Upstream-Status: Submitted [https://github.com/dgibson/dtc/pull/122]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 78251eb..fc0c92a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -56,6 +56,7 @@ py = py.find_installation(required: get_option('python'))
+ swig = find_program('swig', required: get_option('python'))
+ 
+ version_gen_h = vcs_tag(
++  command: ['git', 'describe', '--dirty=+'],
+   input: 'version_gen.h.in',
+   output: 'version_gen.h',
+ )
+-- 
+2.30.2
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 1a78a0c079..0702fc16df 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -8,7 +8,11 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
                     file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https" 
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-meson.build-bump-version-to-1.7.0.patch \
+    file://0002-meson-allow-building-from-shallow-clones.patch \
+"
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


