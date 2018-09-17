Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFF979659
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:30:04 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id D344210C0850;
	Mon, 17 Sep 2018 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219805; bh=jPitxtS8+M8LVY5KHPIsVPU6L5aMvRMkZaO+3h14Qso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzmtfY//Zaybi6VL3ExoRPGpazwSamt3w55XLkWBqDR2WCUjoxhRF70vQ+kLsoXe7
	+gWWzybW/sdL/013cYBuwMzaiu5qZYsAGDfDUyeBNYkiuvB2xz7jzoNIlLfN0vMg3b
	BkFAQvwmlQgcEPck7W9wHAxev3VazIIzHAx2e3BHUUbzsXDS89tCtNavWs/4Vs9BSN
	OPgRMBKtXOHt7FjEZU6LtCHuOGVySGgoQUVhJOXFF2bSqHcpsFtB5YYa/PqWnE6gky
	S8EilcQyacxHIEX/yH6gUk5mirudPFAtO/xolK4ZZIdYFcJc13WBctJwQhe36zPb89
	/J4I3mHAEwaPQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 9B26055A5;
	Mon, 17 Sep 2018 14:30:04 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:40 +0300
Message-Id: <20180917212943.27237-8-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 07/10] icu: Add ARC support
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
X-List-Received-Date: Mon, 17 Sep 2018 21:30:04 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../icu/icu/0002-Add-ARC-support.patch             | 25 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_62.1.bb               |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch

diff --git a/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
new file mode 100644
index 0000000..48cbc11
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
@@ -0,0 +1,25 @@
+From fcfd57105b4bdb30d906df152ef01748fa95daff Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Thu, 13 Sep 2018 17:13:20 +0300
+Subject: [PATCH] icu: Add ARC support
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ i18n/double-conversion-utils.h                 | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+index 57fc49b231a3..0bd3e8340673 100644
+--- a/i18n/double-conversion-utils.h
++++ b/i18n/double-conversion-utils.h
+@@ -86,7 +86,7 @@ inline void abort_noreturn() { abort(); }
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || \
+-    defined(__riscv)
++    defined(__riscv) || defined(__arc__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+2.17.1
+
diff --git a/meta/recipes-support/icu/icu_62.1.bb b/meta/recipes-support/icu/icu_62.1.bb
index ec9db7d..4e3750b 100644
--- a/meta/recipes-support/icu/icu_62.1.bb
+++ b/meta/recipes-support/icu/icu_62.1.bb
@@ -16,6 +16,7 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
+           file://0002-Add-ARC-support.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
1.8.3.1


