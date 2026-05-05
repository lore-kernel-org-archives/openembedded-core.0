Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53455FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 14:38:31 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41111.1777991905875398988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 07:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45f053b7b90so3182120b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 07:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991905; x=1778596705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVxRfVMF5XZq0mQKzlylvJSOxgHdCF7lAftzl94LFnw=;
        b=SBlBymjHuhb41Dr+c8gyO42bwbNys0rFVfMVZw/CnVOJ67G2M8eVo0iB+WfzskD6nn
         vKE3kqUFt/Qi23848jMaBocsr9WWXS4zu+sTPns0J1lVL9owdoQDykPm0eNCwwz8POZE
         v7uZ85WQyh6iZYUsLOBMMeaUWa3OneRpsZpIbwE1o3lU5NAWkzsvbL0mj2BJ/bE60IpQ
         dIGKrdUqXGUK2RIBIPR9s47f/odhBR+lc7tHAEuVem7CjXRoOA2AohPu2zmXJORjD7v1
         meeBhLRgWEcsL2fsjb0oJ00Y9LNnuE8MCiEQA5/UFRF7p/5NJelcwEF+JHuaoYEEgXG+
         sxIg==
X-Gm-Message-State: AOJu0Yy8WK0b4kJ13VJVcOw/w5ryB4yrzGx3dwiBH5ec3oiobvn2YREH
	yrMP7nxhVkBCxrKaM1adNiaI+z1cG0EAfeET0nQp+iC4X6uEDkyEQD6cBvufNA==
X-Gm-Gg: AeBDieuLzJA7RJxn63YUlyPG5++ZI5xyjIJNR9WrEVXx4qKvfxplSTp+ZjTGE9UDFXv
	GAPx4ftH6UXLxgjCwrkQnsZUcluNrJknXYe+yYqZXvUgyyLsIZzFHVnJO4hQ3l1xfEm9n9XHlcx
	Ywx4x+5eyx73LR0cEorte/ooRTS7JABDw/UHuc/7vx6IZfvQceKmDQsMdIHiusuvYM7u0PfyY3i
	EJVf0WTMM3cPnfscJMOFZL17KE8F1TkxyekVBEayb/VnYHhUR72nUg0p6YHFkHYrkEJJrzSCtTd
	60UcJALtgxlSzRG8N5KLsKC8LfgAXCXl9lBcl1ywErMx4AmdGxpbQW9mojrAbks7ozsgB8lINeC
	IwSyya562psbPiqzyjwln8rPoEty1nV/ObH2yDkLyVzsfMBZ3QTzgyCReVd8LrzsideQJw6JHch
	Hz5fDUstXWt2AaXYUMeX2Jl69lsdcEPvnFjSpHDyNR7MH2gpeyF62/50ZSMoFjBoD3pfKUi415n
	9nlsDtgburgndjoXGLPa15nqRk/D8iTwhbTc9dT0KhP6g==
X-Received: by 2002:a05:6808:e68b:b0:47c:755e:dbcd with SMTP id 5614622812f47-47c89096815mr5616062b6e.20.1777991904756;
        Tue, 05 May 2026 07:38:24 -0700 (PDT)
Received: from IBM-PW05FM02.ibm.com ([136.49.149.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c769c9b12sm8715839b6e.17.2026.05.05.07.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:38:24 -0700 (PDT)
From: Andrew Geissler <geissonator@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@yahoo.com>
Subject: [PATCH] efivar: Backport patch to fix -march issue for ppc64le
Date: Tue,  5 May 2026 09:36:54 -0500
Message-ID: <20260505143654.800752-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 14:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236489

Backport upstream commit 9711b8aa5acc to fix compilation errors on ppc64le
architecture. The issue occurs because GCC on ppc64le does not recognize the
'-march=native' option and suggests using '-mcpu=native' instead.

Upstream commit:
https://github.com/rhboot/efivar/commit/9711b8aa5acc63c54a12ba5505fe68b4475c8a13

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 .../0003-fix-march-issue-for-ppc64le.patch    | 45 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_39.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch b/meta/recipes-bsp/efivar/efivar/0003-fix-march-issue-for-ppc64le.patch
new file mode 100644
index 0000000000..d27541aeb1
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
index c0e8d52181..e5839f7a99 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -10,6 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0002-efivarfs-backport-patch-to-update-file-variable-store-on-SetVariableRT.patch \
+           file://0003-fix-march-issue-for-ppc64le.patch \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 
-- 
2.43.0


