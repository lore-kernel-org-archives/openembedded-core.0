Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BF1CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7380.1779265270379829001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F81ALsd5;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a14580111so3308970f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265269; x=1779870069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/hvd7GpTWf4/glanBmSWN+COQQ7YAXhtXLTQDDANNY=;
        b=F81ALsd56HbM7lqWDDoGXjBZp8Fr9GJ4QRAtoWb/tkNxNYcgXLtM6m02n38Xz0airh
         iVEb/BP5kYIgAbTqsTI3FQEw0VDm/sPnmCAwK846WMWSBV7kdwFu0o5266IMuOe2KjN+
         7tnfvCojvv0b2barWUrmVu3TAXMXAYRxnG0xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265269; x=1779870069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/hvd7GpTWf4/glanBmSWN+COQQ7YAXhtXLTQDDANNY=;
        b=MToLUjJmoZfoMlUIYIwy+67YA/3iL9tmyF/2CQztQ1MVdgwsZX0qcnWqZocww7zTAG
         LcmyjithnjkE6FyDGtNn7PzEEZC+MkTZXzceHFt8LsL6Q824I3u1fIntGZeyFDAz3jQw
         kQRp7fQxA+kudpSYwcal3VYSLPiGoaS7+H4v4Rp7wvUvmGhB2YKPGnj+SA5T92VTX6gd
         AhU5+LTZ7Vrr36hdT0NQ7i3GI+Lf3SM7qmHer+J1QViugjNuMw/Imn52+xnjeVVDKu8x
         80Tn7+hgidU/1N01Upuf9zoAs1Y1rkXKYtldfiAiQYNX+QkIeA9SV0DUI8w3vFcHShos
         hmgQ==
X-Gm-Message-State: AOJu0YyMlUQAh8udURCHLmRtpukFDlrgDmawu6aLs7Ufnq1azsso30vy
	+n/o/2ZJwJCFzwsLFmMHlvDNLcxcpLHdSY2IOlsPHnpwhxAn1/LA3qZFgOyQBvEl+WfSYC30++7
	8h0uq
X-Gm-Gg: Acq92OHIgRz4nGgqSide6Rtg5VAtHYKHJ7sjtYKltTu7o3pDikCr1Df+Ms08tOoWz5o
	wxipPE+4M/gUI+Bch8DWPGF6KQQUCYwGYQCldeFrZuf0ua3CSqVDGsL/2GKVHJWNqOmKThJ86Al
	AgXp5h5VchC7j6NQDvqWIU12f9h1EnvqRw2wGul/yY6x7BOhpoq87lvV9lobzYhKBcT+mAM2SOA
	2qF7WyCCUSSWczFNyCbeU2LZwgYcMBDoCLL5oVQImYdyzC+Xs6WOUtGygKcaeat7zx9sv8MdgUi
	U1CHM/SrxkNUq0xQ+X1UMr6OkmSXl7S6tMYkXwACWNADJYT7f654y5UqHlnXeKHowkhGCGynqa8
	6k6P3V2SjLEZ7rYI31EfvZUynjKm9KmJJ8n6eBmESxuUfVRVH+lRF+xuWaZ1SKUfFsvedu60uRk
	6sx1bVgrStsyQdJ7xyGbpX1/A0OgLiKEumby9wR8TlRk0TC5WfrtX0egcZn0wG2nYJ3uTyL6Ugr
	x4GpH9dEouaebsbRhC2LawLZiwO
X-Received: by 2002:a5d:6e59:0:b0:452:c246:ab69 with SMTP id ffacd0b85a97d-45e5c5c8c03mr28646626f8f.13.1779265268705;
        Wed, 20 May 2026 01:21:08 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 15/28] efivar: Backport patch to fix -march issue for ppc64le
Date: Wed, 20 May 2026 10:20:16 +0200
Message-ID: <7a8d7df9d4295ce43b681bb2123944fa334c684a.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237414

From: Andrew Geissler <geissonator@yahoo.com>

Backport upstream commit 9711b8aa5acc to fix compilation errors on ppc64le
architecture. The issue occurs because GCC on ppc64le does not recognize the
'-march=native' option and suggests using '-mcpu=native' instead.

Upstream commit:
https://github.com/rhboot/efivar/commit/9711b8aa5acc63c54a12ba5505fe68b4475c8a13

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 683e2531be8ca28ace0ed1ef06b6211056338a35)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0003-fix-march-issue-for-ppc64le.patch    | 45 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_39.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch b/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
new file mode 100644
index 00000000000..d27541aeb10
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
@@ -0,0 +1,45 @@
+From 9711b8aa5acc63c54a12ba5505fe68b4475c8a13 Mon Sep 17 00:00:00 2001
+From: Andrew Geissler <geissonator@yahoo.com>
+Date: Tue, 4 Nov 2025 09:58:55 -0600
+Subject: [PATCH] Fix the -march issue for ppc64le
+
+Similar to the fix in aab4e9b10ac, need to also support the ppc64le
+architecture.
+
+The failure without this fix on a ppc64le machine:
+
+| cp util.c util-makeguids.c
+| gcc: error: unrecognized command-line option '-march=native'; did you mean '-mcpu=native'?
+
+Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
+
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/9711b8aa5acc63c54a12ba5505fe68b4475c8a13]
+---
+ src/include/defaults.mk | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/include/defaults.mk b/src/include/defaults.mk
+index 4da0cde3..a21a7aeb 100644
+--- a/src/include/defaults.mk
++++ b/src/include/defaults.mk
+@@ -74,6 +74,7 @@ override SOFLAGS = $(_SOFLAGS) \
+ HOST_ARCH=$(shell uname -m)
+ ifneq ($(HOST_ARCH),ia64)
+ ifneq ($(HOST_ARCH),riscv64)
++ifneq ($(HOST_ARCH),ppc64le)
+ 	HOST_MARCH=-march=native
+ else
+ 	HOST_MARCH=
+@@ -81,6 +82,9 @@ endif
+ else
+ 	HOST_MARCH=
+ endif
++else
++	HOST_MARCH=
++endif
+ HOST_CPPFLAGS ?= $(CPPFLAGS)
+ override _HOST_CPPFLAGS := $(HOST_CPPFLAGS)
+ override HOST_CPPFLAGS = $(_HOST_CPPFLAGS) \
+--
+2.34.1
+
diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index c0e8d521819..e5839f7a990 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -10,6 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch \
+           file://0003-fix-march-issue-for-ppc64le.patch \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 

