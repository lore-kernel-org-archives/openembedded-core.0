Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304E2C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 20:58:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.5504.1749243509736897199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 13:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dZSvSzxT;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a361b8a664so2048775f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749243508; x=1749848308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbsHDccuT6LL7bD8T5NhyhXi1lVlStS9IMrDDvMxPGo=;
        b=dZSvSzxTutmnssrVpe5WpZPc8eFv5l+TCcSaHGGef3BomVC4rm7vl/jWNCJZyBUyMa
         /gS7z3p9G6fDXhYzCYGdGTGm7ONS5pjWW7nD8QNrVBcqFoNovWEJbw7xvIyAQNGt4DLk
         AWD+C+9iI6HwnmI4nfZXp1DgWMmTj5uSrSpbEtr8fJITqtw6p+eiDhBq+aVxiwDTMyZN
         YEn6nEo5HsqnDmR9adXIqd8WoxcVUUtbKpbcn6cj2jUOHr2DtLU/72A5P/1FzovG3ecN
         cYO8IP5est3wGGRaZ+CGtmzCqHW3RUKQiiryawlnxHjsAkoXOTZUpAWyfQlmEpAt2Vf4
         buAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243508; x=1749848308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbsHDccuT6LL7bD8T5NhyhXi1lVlStS9IMrDDvMxPGo=;
        b=omramaiRTpqsrgFOjX4ze2k6gnC/CCmy8WHR6Drk8TBurOqiZ+g1PZRlbdf1UxpQLG
         tgekQVmKcKI7YluJJ+sThit1crupx3j4Vg16yO1ZWdyQ8q6J9szoKrYzIwwFv6cPaT8K
         Eo3vneowEFE5sdTMz+Cfhd2NsXV3NvwHNpDOsGGE9u0/A67uOuubDzX0P0oycgQjkThp
         +CtFdg9htXy1/zhutXEpkQH7FTrORFBwBiOHaU0Jp8VklLYyJVuXk8lrnbvlkzJu3ZxW
         OACO6gOtPfXdD/xSws1C9nrPpiI/sP+y+6bjEzyWCn40U++JsxHxLPYreW5G8Xcr83Mv
         z3MA==
X-Gm-Message-State: AOJu0Yy+DeihhFRKlDMUMfxagwJ6nerMVypEqPMWIowrgGIQiXcoVggG
	pqCOnJNdYzcC81ESqP3JmBzvfpdLup7Iwuwhb7sprnQe0rgqevYjShLQszv/Kg==
X-Gm-Gg: ASbGncshUeh9zBjrLCtm6Xqt1QXcSiVrFXKXpfTWdOenoMNzeMStutpYDjur0LdMvC4
	JPwWBGaIhp3z20aNIaheJ8v7Ek0LxnByhcRrvIWaPBfvQi/05ZuoO/ZOYINu39GS8HsCCNUqc7T
	cI3cBlrawGoLhUSkxAu4BKhQ8mIUss+UjlchgyaTiVb+3d2iuHmQldmqPHrMWfzZHiz4sFmSswd
	K9+tdY2fPb/90RVn9UTfxOiCQXpbvvvbzadO1e/pqHJhIp/YKwsaPBMWNvTxetTvtWBlbCnK5Bq
	lSvbXk10KZJJ8G8Zs2I89kMr/vKQUwLAnKXwiroW/GwdLzdpZssNwvosghbB5r/KmbDG8yF3eAx
	kmg87J4FTbDZ5
X-Google-Smtp-Source: AGHT+IG0dNQK17ptKOqtO/3TNY9p1S5xyIqucKB+IMEASMoF0JiiC2zWm0a+2za9kwkdT8R/6Xfvbg==
X-Received: by 2002:a05:6000:2585:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a53188da55mr4223692f8f.11.1749243508017;
        Fri, 06 Jun 2025 13:58:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f4e7sm2850859f8f.77.2025.06.06.13.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:58:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] systemtap: correctly set include location for the python module
Date: Fri,  6 Jun 2025 22:58:06 +0200
Message-Id: <20250606205809.4071299-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606205809.4071299-1-alex.kanavin@gmail.com>
References: <20250606205809.4071299-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 20:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218182

From: Alexander Kanavin <alex@linutronix.de>

This issue was as well exposed by setting S to be in UNPACKDIR.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...am-use-absolute-path-for-source-dire.patch | 36 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch b/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
new file mode 100644
index 00000000000..dacd19edd1d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
@@ -0,0 +1,36 @@
+From 71e4ffd46dbbb7de1d06edb66f3e1fe0de423586 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 21 May 2025 13:25:46 +0200
+Subject: [PATCH] python/Makefile.am: use absolute path for source directory
+ includes as well
+
+Otherwise it would be relative to the build directory,
+which works only if the build and source directory are in the
+same parent directory, and breaks if they're on different levels.
+
+Upstream-Status: Submitted [by email to fche@redhat.com,wcohen@redhat.com,systemtap@sourceware.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ python/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 9d5cb7bcb..130e90b24 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -2,10 +2,10 @@
+ 
+ AUTOMAKE_OPTIONS = subdir-objects
+ 
+-# Note that we have to use 'abs_builddir' here since we change
++# Note that we have to use absolute directores here since we change
+ # directories back to the source directory when building the python
+ # extension.
+-AM_CPPFLAGS = -I$(srcdir)/../includes
++AM_CPPFLAGS = -I$(abs_srcdir)/../includes
+ AM_CPPFLAGS += -I$(abs_builddir)/../includes/sys
+ 
+ # Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
+-- 
+2.39.5
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 254bac4d6f9..588b3b8d36f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -9,6 +9,7 @@ require systemtap_git.inc
 SRC_URI += " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
+           file://0001-python-Makefile.am-use-absolute-path-for-source-dire.patch \
            "
 
 DEPENDS = "elfutils"
-- 
2.39.5


