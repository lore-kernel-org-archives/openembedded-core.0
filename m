Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9184B7835F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 10:11:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 79so1680529wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ndI7GMofAev82B9maxLnS33DdRKE3JJ6aItS8l4/Mi4=;
	b=HuLLsAtT/n5B5UqaYRxyLwXMvcvAHigkOr/LK1zCkopz6zjpmC3pqUvXFpvroE95Ez
	61ZMpqiXs/n4McAoHSOZUdX5w5rJ5pi0n4rO3k/r/LGNVqjx7oNLUlO/xcjNcP/YEvEg
	POGeUTqq8FG/b0cMfGjQ50fkShODEclVh0IyOcFTaSd53woCsDLMl06C3ezMcJbC4hCr
	L6UH0ODZ/SAuSx9y0G7INxopYTnya33OL8XGq1+sPtM1CWyGuI6AK4wgFGnHE6xjBGzX
	BY1GAL8dlXwtTJE0c1JPaIZJ3gqgVaOZR5sg2P0tJbcKVwYxOrg+OzDQ9ZWHPV/9yGcp
	hKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ndI7GMofAev82B9maxLnS33DdRKE3JJ6aItS8l4/Mi4=;
	b=pjbEzqlQHcJAuNamh8jmbM3jiUny9FyQVPgF6MjOGgmmasU8ureV5yju/1PwhcSgqu
	0rOF1TEX7ue4jApwGIS+ynvCntijWc0Xr3QWtlLwntuuByMetDX305tjvwXKdhmSQEg+
	zY8l/jOON7eXGizgvPCB4pdh6Z5TUfUW2wyrBEmN4yG9R4MGVE+wKfgLb618suUZwqzT
	ohme73q1LRBADS8urLHdFtnGOJ1fb8BkwajeDqCMtJ11Jvrv4CnwMOEvsRodUPaDyQaW
	9IrG2swblv4fmXhGtBphiY2GE78Yggk/Q+FaR3jfHrzSWLov6qg0Oi2DvwoYFtzIwULk
	u+gQ==
X-Gm-Message-State: AIVw1109YOU8En9hsazdz3DBgXndozKhkhEqHyi3DGVYA1NwhtZl/Z/c
	eFvkABRvHHDCrGnL
X-Received: by 10.80.136.129 with SMTP id d1mr10662556edd.130.1500804690062;
	Sun, 23 Jul 2017 03:11:30 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124])
	by smtp.gmail.com with ESMTPSA id l4sm5904891edb.35.2017.07.23.03.11.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jul 2017 03:11:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 12:11:19 +0200
Message-Id: <1500804679-8604-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] kernel-uimage: DEPENDS on u-boot-mkimage-native conditionally
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
X-List-Received-Date: Sun, 23 Jul 2017 10:11:30 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

do_uboot_mkimage would not run if KEEPUIMAGE not equal to 'yes', so it
does not have to DEPENDS on u-boot-mkimage-native in that case.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel-uimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 7c026ab..94344d9 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -2,16 +2,16 @@ inherit kernel-uboot
 
 python __anonymous () {
     if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
-        depends = d.getVar("DEPENDS")
-        depends = "%s u-boot-mkimage-native" % depends
-        d.setVar("DEPENDS", depends)
-
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We override the variable here, since we need
         # to build uImage using the kernel build system if and only if
         # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
         # the uImage .
         if d.getVar("KEEPUIMAGE") != 'yes':
+            depends = d.getVar("DEPENDS")
+            depends = "%s u-boot-mkimage-native" % depends
+            d.setVar("DEPENDS", depends)
+
             typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
             if "uImage" in typeformake.split():
                 d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
-- 
2.7.4


