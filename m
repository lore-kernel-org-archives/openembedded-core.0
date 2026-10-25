Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27811.1792952682466489243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=AKRb6Gvs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20261025182440ca9d008a45000207f8-2cwb4m@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261025182440ca9d008a45000207f8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KliNyqr0Wqn/aB3iL41k9zBwspJCPeE7oG4QDWd2Sw8=;
 b=AKRb6GvsBoW5QX9P+/SlR8eR1hSF/uZrD9cS775YKAOV//EKBLlfYtAfzaBmJcNNhXdS0l
 Zt3HBKFY8ivZbDUFMeCBwm+yhCQ16c7bpS1xFgoR/uogDHsqYYGY44HNMoumKVsJeaukFtk0
 4BUL49bep/NPpRMNaL8EwUZFWQaNzF2tLaTFavh20Dq37Tlviqwz97G5vUjIUBEygCFaEQ3Q
 5zUY2B3TwbwSYplXNT9y5NWJHd4uGOYzV43YzWew6u5YL5kHUeXSNoVWX7geiSAPCDs282Kj
 yBsBX7c6i5aQPytWVBAzd2G1q0A6o+Nvemxkb1/kVEm9gLt1jUvEXokA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 5/6] uboot-sign: enable signing SPL FIT configuration
Date: Sun, 25 Oct 2026 19:23:58 +0100
Message-ID: <20261025182436.788918-6-adrian.freihofer@siemens.com>
In-Reply-To: <20261025182436.788918-1-adrian.freihofer@siemens.com>
References: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248620
Content-Type: text/plain; charset="utf-8"

From: Marta Rybczynska <rybczynska@gmail.com>

This commit enables signing SPL FIT configuration instead of specific
elements. This introduces an incompatibility with the previous behavior,
but is the correct way to do it.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 9a79aeb366..409f6376b1 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -35,13 +35,13 @@ SPL_SIGN_ENABLE ?= "0"
 
 # Sign the FIT configuration in the SPL signing flow. Configuration
 # signatures bind the selected images and boot metadata together.
-SPL_SIGN_CONF ?= "0"
+SPL_SIGN_CONF ?= "1"
 
 # Legacy compatibility knob for per-image signatures in the SPL FIT path.
 # Individual image signatures do not protect the configuration metadata
 # which selects and parameterizes the boot images.
 # INSECURE, use at your own risk
-SPL_SIGN_INDIVIDUAL ?= "1"
+SPL_SIGN_INDIVIDUAL ?= "0"
 
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
-- 
2.56.0

