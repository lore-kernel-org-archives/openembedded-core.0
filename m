Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E82F7C861
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 20:36:08 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id j12so266719eds.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 13:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ffiGuVIjsmZ0qiZLDtHd/F9UHUsXq6ccW4viUsJc/q4=;
	b=agHE7Tad/dbWUxkQB8gHLy//qfgiXL4iDl1uGQZG04/dFRMwOu+INP9pyRgDp2O8CX
	iApB3tFPW+49AbYF5Pp1DocBQiqqY70EgwCnEdK2nLv2oIEgaNF5QqkOJh/U9jEDE2Ir
	riy8AbaCBjdMiU9iB+0BySq6vGX/+hokPWPvjYUP+QIgUhTc3lzWAC/knmOTBVCIuha4
	2q2N0pkeoXhbfuIqKcXnUPsTnyf0Lx+PtEebMxn91pROExlZ580YESYAk8Q/86Y4cYsO
	KpgcMm3AKiCSq9/eEUAthc8mNmBhMKBIhG8zZIp6vLGAWVbg0xOiWbnHdLvUd/HswAro
	imtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ffiGuVIjsmZ0qiZLDtHd/F9UHUsXq6ccW4viUsJc/q4=;
	b=EiQwGt2pwyGFXCa5VguCYntz2v3WhmsYl2b0r10cMNJ3Nadacenor5RVs5h0mcbepq
	icKeiwSkhPdxVZKQ/pAydAlxc1pXOLo4WSt3KlIFjMX1Ufc6Ajr4oKlzlnH19T14S0wp
	U4N8M38+7Yc2BHq4ntgtQqI9XLypNok8OIwXNNzmtAeerV1L5aUEY4ksS+z3EEcQ3dNg
	vejWMG53OmOm4YoeebpGS3L4U+H/nSy23Ftx3yLeAjSPDQEWtV27AZ0s3uZLrKALX1/F
	LKVQ7Qmxo3IQd65+s4R4ASIFkKjsMYgoWIUMccGtpZryfqkHVN/1aI7dLEL6yA5n9pXL
	y+FA==
X-Gm-Message-State: APjAAAU4biKERqIFT/5uxK0en+2flUw4BV1UWOvjGTgreURlYelXb9tX
	BqmZjOUh/A36zGK9GX5UX3HDemsWQOR19g==
X-Google-Smtp-Source: APXvYqyV+Vw9AVFzsnei5h/RHRO2lXHmKWtkSt7seOXPWADrm/0bWOPEU3NjLK1oKi/vB0wLbkNnZg==
X-Received: by 2002:a50:ad42:: with SMTP id z2mr86505274edc.9.1558470968691;
	Tue, 21 May 2019 13:36:08 -0700 (PDT)
Received: from peterliu-Precision-M4800.toradex.int
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id h5sm6520296ede.74.2019.05.21.13.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 May 2019 13:36:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 22:36:05 +0200
Message-Id: <1558470965-11823-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: luka.pivk@toradex.com, stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: avoid depending on EXTRA_IMAGEDEPENDS for initramfs
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
X-List-Received-Date: Tue, 21 May 2019 20:36:08 -0000

From: Ming Liu <liu.ming50@gmail.com>

The dependencies in EXTRA_IMAGEDEPENDS should not be depended by
initramfs image recipes, that would introduce risk of circular
dependency issues.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 3 +++
 meta/recipes-core/images/core-image-tiny-initramfs.bb           | 3 +++
 meta/recipes-extended/images/core-image-testmaster-initramfs.bb | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 7df8ab1..1172ae7 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -16,6 +16,9 @@ PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
+# Do not depend on extra image dependencies
+EXTRA_IMAGEDEPENDS_forcevariable = ""
+
 export IMAGE_BASENAME = "${MLPREFIX}core-image-minimal-initramfs"
 IMAGE_LINGUAS = ""
 
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 0eca6d9..2e330ad 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -12,6 +12,9 @@ PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VI
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
+# Do not depend on extra image dependencies
+EXTRA_IMAGEDEPENDS_forcevariable = ""
+
 export IMAGE_BASENAME = "core-image-tiny-initramfs"
 IMAGE_LINGUAS = ""
 
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
index 09a6d16..bbf4162 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -7,6 +7,9 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-l
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
+# Do not depend on extra image dependencies
+EXTRA_IMAGEDEPENDS_forcevariable = ""
+
 export IMAGE_BASENAME = "core-image-testmaster-initramfs"
 IMAGE_LINGUAS = ""
 
-- 
2.7.4


