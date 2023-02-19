Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450A6C6FA99
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.3845.1676835074788390831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fC9kmi5m;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id b10so782886wrx.11
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELUOPxjLyFcv9gJPJGb5g70iX8ohf821JgqIH0sHPLs=;
        b=fC9kmi5mq7bEeQeS+OdiweQL0RROyCSNYdcDZTEJFFPZjOws55aIji5OQTLVaKV1/5
         G771G+8B8cqhH0eOpkn/q1QeC+fp1lkbF8IQTYl0lofYWYDAMYCQKO59nlMNzM+eCF4M
         IkEqOz+xJ3PbfwrNFzWq4Xd9DS/DHNS6bpsKcfn/pnCMd+u6dkuZInQw41I5+h7rDa8M
         x4IpwD7VfjLeD4Snoh03kzbeoA4QD79m6xIKwBZquV14TQeAmXkla2FQ4tLpOvEC+OYz
         HyxBR4YNdTH07WMLTYhhC8lRhNbfoQMvrpvkh5bWzjrOQBzqvdgr0x9fSuQeXPbuHicV
         VXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELUOPxjLyFcv9gJPJGb5g70iX8ohf821JgqIH0sHPLs=;
        b=RJaAPvhSoPnC4QcRMn4yfMoosAOsQ4O8bT2Cc3jC9WPumVjl3ZKO3vbSJUq7N04+N4
         Lbg6sPkvV9Qn7WIbPNU+eRKqcx53hvLyrNL2AOirlPZwawhjGkoLts7ogFXpOIBbGl4M
         v1tYu5Bf/oGiZRDIXXwtxi+hY5gg3aSnxVIkENaycfzGNUZYsEm5l4VPAxRfYr220nt2
         OE3FPfQ2Fy1tPqk0BQP92kvrSl3jFqsz9/IDoCwK/xiaNfR/jP6eAGl/vbfPAqIgyBeM
         cLMyYlScYw3idaE5eHeVMZNq0jsVQ44whI+4J87JG0el19JOV/C49W3Hnu9zEmQotv2W
         4Q9Q==
X-Gm-Message-State: AO0yUKWGg0LNjez2wfT+wqgWSSnQLMPBdlwuippyR1s54BWcWV9b3SW8
	+Kz9zk+6SxplIgAx/ZaZxkAc1UDlvjY=
X-Google-Smtp-Source: AK7set8KEZ8wZXlER0I37u1TK2Y9xyt/7OZDTd4/Hkj6InI1hm4SplUjyhZDYYN9Lfj1wMqStzKfOg==
X-Received: by 2002:a5d:63c2:0:b0:2c5:5bbe:efbc with SMTP id c2-20020a5d63c2000000b002c55bbeefbcmr463174wrw.68.1676835073286;
        Sun, 19 Feb 2023 11:31:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/39] python3: upgrade 3.11.1 -> 3.11.2
Date: Sun, 19 Feb 2023 20:30:35 +0100
Message-Id: <20230219193101.338397-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177356

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch      | 4 ++--
 ...Lib-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 .../python3/12-distutils-prefix-is-inside-staging-area.patch  | 2 +-
 .../python/{python3_3.11.1.bb => python3_3.11.2.bb}           | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.11.1.bb => python3_3.11.2.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index bd696ade92..96e5e81342 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 32aba1dfba1e27103e7367bbb9e4bef0e31aeac5 Mon Sep 17 00:00:00 2001
+From 7d296dc635ad3ac2792955ce37e140a4104b098f Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,7 +11,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index f29ac86..930cb20 100644
+index 6811951..65ae476 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -877,8 +877,8 @@ class PyBuildExt(build_ext):
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index dc06baf504..86971f4048 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From a73020a9c388b4882c384087882a77ab2c7b3729 Mon Sep 17 00:00:00 2001
+From cab8b8b1390165a93dfb27c48c1cc4c3e4280dfd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 1879024e16..e080b5c562 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 3bdf292be303e239e78ed39dd8106fbd5f7ee645 Mon Sep 17 00:00:00 2001
+From 79e7ed59750612e57647847957ab85709307ea38 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.11.1.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.1.bb
rename to meta/recipes-devtools/python/python3_3.11.2.bb
index 37092d30d2..43c147ca6d 100644
--- a/meta/recipes-devtools/python/python3_3.11.1.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a1822df8d0f068628ca6090aedc5bfc8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -38,7 +38,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f"
+SRC_URI[sha256sum] = "29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


