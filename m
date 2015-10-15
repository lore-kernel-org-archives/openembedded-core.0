Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE66770AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:55 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so70670814pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5vlLtWHFPYZkNDfCFvOx2c2U/QKOX7RGq1rZcIL+db8=;
	b=ZQtSlWLxDgcHRo/yhg2PAtwXeC6YTjm0auBNMLprW4JPhaSdJeL7BM0nsS6h7JT+jB
	vODZlnT8R3Cz40QXiTw+QW6l6ExfrYLag00KYQpWEt8dZpYWzziwZS6EBGOZYLDX8UJP
	H1aRbIe0X2nn7V19fX5ilngOkRNgAMzLCgbmlkFcWnFaLNmMn9JiZ6Rh1PBI5OC2N5tt
	HJEZp6WuW6+DylQpSfqHUao1ST3sAMn4pknYLpkCrfcqQJGzH8/VMbUvVO/WtyB6o1Lf
	rv4idSKSBbkQTnprcZck5HOEP9wzvo+NbZIwKeurf3+gET3IxxV3RHX5nGluXL35xGo7
	ul2Q==
X-Received: by 10.68.244.34 with SMTP id xd2mr7187177pbc.0.1444873436422;
	Wed, 14 Oct 2015 18:43:56 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:19 -0700
Message-Id: <1444873403-21093-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 07/11] busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:56 -0000

Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR,
etc), so avoid over-riding MAKEFLAGS via EXTRA_OEMAKE.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b380860..878e2bb 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,6 +18,10 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
+# Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR,
+# etc), so avoid over-riding MAKEFLAGS via EXTRA_OEMAKE.
+EXTRA_OEMAKE = "-e"
+
 EXTRA_OEMAKE += "'CC=${CC}' 'LD=${CCLD}'"
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
-- 
1.9.1


