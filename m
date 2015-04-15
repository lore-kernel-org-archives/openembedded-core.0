Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7477A6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 12:32:43 +0000 (UTC)
Received: by wiax7 with SMTP id x7so110981286wia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 05:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uKDyQJNDBw+Chf3Hc+soyGhzV1HbKE1hFgRpiT2l4uk=;
	b=eMI/fEH6dCpphwO1LdArc+KgPTdftnMGplsSEiAcxd+jKDQZeZqJ81SLnaGmFXPeuI
	Posd41ALjYS4ToYP9bB9nnaOFDoFUjm/fwlQVQZTZiHGdVK7gqR6vyFh8c/1hcfGeyvn
	sNJfqhumW+VtasrgTNPnaACLqSPuSHgcfci3CwQIYR4moqXxkiV2K6bjqYel6eDdAQq3
	utpzpHLNC69W6LPCxAXr+9rVFyvJ4ibDITYcmCjoEDgV8EbxLPfl7fXllju2p4JHSbtl
	8odzmJbX5jPJxQc8PB2LTEgN9x21Rk+cI566NH17ld58FnecamGRJK6ZJqOid8B0Gg1p
	3kvg==
X-Gm-Message-State: ALoCoQmyTdRUOg961t7+6wcUBI/7uuXkDzB/FpEeHWGE3xZCTcR06BJ0LZ67SjAXFb/4iOWsCHqe
X-Received: by 10.194.81.1 with SMTP id v1mr47439360wjx.50.1429101164279;
	Wed, 15 Apr 2015 05:32:44 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id hl8sm5803158wjb.38.2015.04.15.05.32.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Apr 2015 05:32:43 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 14:32:37 +0200
Message-Id: <1429101157-12319-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] strace: fix build for aarch64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Apr 2015 12:32:48 -0000

Upstream added aarch64 support but forgot to update 'make dist' leading to missing files in the tarball.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../0001-Add-linux-aarch64-arch_regs.h.patch       | 25 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.10.bb        |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
new file mode 100644
index 0000000..f70766b
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
@@ -0,0 +1,25 @@
+From f85854131c8265f2eb59c714dcea5c4b3dc09bed Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Wed, 15 Apr 2015 14:29:37 +0200
+Subject: [PATCH] Add linux/aarch64/arch_regs.h
+
+It is missing from the tarball, but it is present in git for v4.10
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+Upstream-status: Pending
+---
+ linux/aarch64/arch_regs.h | 2 ++
+ 1 file changed, 2 insertions(+)
+ create mode 100644 linux/aarch64/arch_regs.h
+
+diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
+new file mode 100644
+index 0000000..9a5e33e
+--- /dev/null
++++ b/linux/aarch64/arch_regs.h
+@@ -0,0 +1,2 @@
++extern uint64_t *const aarch64_sp_ptr;
++extern uint32_t *const arm_sp_ptr;
+-- 
+1.9.3
+
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 416c387..707cb76 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
+           file://0001-Add-linux-aarch64-arch_regs.h.patch \
            file://git-version-gen \
            file://strace-add-configure-options.patch \
            file://Makefile-ptest.patch \
-- 
1.9.3


