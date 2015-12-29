Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id B04C16010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 23:05:49 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id sv6so102207883lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 15:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gdHbT/Z0v4cKpC+WJJgQwjxSds+FmEPnAlOMJUQ/ceM=;
	b=eKwB2a1Q3Q1I79Nqbp3ivQgYm9fU0eKYO30/WT1ZrqIq0YL0KQdTDJM6NQ7dZfCe9R
	AjfFgGplaF4Gyhcwnm6Kc1nbSHUsx0rkMoCBNv55fgshsL3Ze7LZKzxtIjkcFZFtKiit
	7/24U/90PfBPD9CsD/Cgn1gXVym6BWH//lJduLcbXKNYSTsshTk/f17CjtSzDbcXTuqa
	2T2lmNura9yyehykHnhDWDQFnW/5itazzn7/iL+vk2EAYBRrMQRKQKesOcVVsuPkcy0k
	xfRkGdJOGxwnSPevTxCLXc9Z0tVNxYvbKZRbnCNde7wcVAVi7lx+rXFwPdTmkJabMbpf
	Rd8A==
X-Received: by 10.112.166.2 with SMTP id zc2mr16031603lbb.34.1451430349684;
	Tue, 29 Dec 2015 15:05:49 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	zm10sm11550870lbb.49.2015.12.29.15.05.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Dec 2015 15:05:48 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 00:05:27 +0100
Message-Id: <1451430328-29838-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/2] kernel.bbclass: avoids installing kernel image in do_bundle_initramfs
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
X-List-Received-Date: Tue, 29 Dec 2015 23:05:51 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

It makes no sense to install a initramfs bundled kernel image since
do_package does not depend on do_bundle_initramfs at all, it leads to
a implicit kernel-image package depending on do_package run before or
after do_bundle_initramfs.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..d1ca614 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -179,10 +179,6 @@ do_bundle_initramfs () {
 		kernel_do_compile
 		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
 		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
-		# Update install area
-		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
-		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-		echo "${B}/${KERNEL_OUTPUT}.initramfs"
 	fi
 }
 
-- 
1.9.1


