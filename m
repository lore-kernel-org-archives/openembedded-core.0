Return-Path: <andrea.adami@gmail.com>
X-Greylist: delayed 465 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 21:08:15 UTC
Received: from mail-ee0-f54.google.com (unknown [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B02066098B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 21:08:15 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id b57so85702eek.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3JQ7kHahX18JrgH11lZa2PHCxNWnAp7GBBQHrxKYzsI=;
	b=00VyD9f8XTUNYN7SwQT93XW9y4Gc7wsYL6yCjsau5STgFiesrKEJMTnQYRrDn0+kfi
	SvWt6I9+R511Y6ecsIt4YGkF+0c4d30fhGyQ356K7RVOFtKGT8TkIoE8UxXrH9BQ6Mxi
	ggkrEixgkMRefGUN3ccGtv7ve0Ef5yQ/KEFL2O5i9OxwIutrZnGSIdqothQdBDvTpYUn
	XSd6Hghxhd4uG6/pBe66jHrjqBJlnRhEb3Xq21vPsYbQ61vXPV0nD/JrxJuXy/vMES00
	Hj1fq9t//2PpDpDMELfMPQlZGp7ynYNMIGoz0nKJqvxhiUcyobmbXqlr+9pdoMqLn5FH
	hR5A==
X-Received: by 10.14.172.69 with SMTP id s45mr8310628eel.14.1400101231346;
	Wed, 14 May 2014 14:00:31 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host234-253-dynamic.10-79-r.retail.telecomitalia.it.
	[79.10.253.234])
	by mx.google.com with ESMTPSA id h6sm7616495eew.38.2014.05.14.14.00.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 May 2014 14:00:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 23:00:22 +0200
Message-Id: <1400101222-26332-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mips: add tune file for mips32r2 (only hard-float)
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
X-List-Received-Date: Wed, 14 May 2014 21:08:17 -0000

Kernel and initramfs built and tested on GCW Zero (jz4770)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/conf/machine/include/tune-mips32r2.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-mips32r2.inc

diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
new file mode 100644
index 0000000..fb60592
--- /dev/null
+++ b/meta/conf/machine/include/tune-mips32r2.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "mips32r2"
+
+require conf/machine/include/mips/arch-mips.inc
+
+TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
+TUNECONFLICTS[mips32r2] = "n64 n32"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mips32r2", " -march=mips32r2", "", d)}"
+
+AVAILTUNES += "mips32r2 mips32r2el"
+
+TUNE_FEATURES_tune-mips32r2 = "${TUNE_FEATURES_tune-mips} mips32r2"
+MIPSPKGSFX_VARIANT_tune-mips32r2 = "mips32r2"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2 = "mips mips32 mips32r2"
+
+TUNE_FEATURES_tune-mips32r2el = "${TUNE_FEATURES_tune-mipsel} mips32r2"
+MIPSPKGSFX_VARIANT_tune-mips32r2el = "mips32r2el"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el = "mipsel mips32el mips32r2el"
-- 
1.9.1


