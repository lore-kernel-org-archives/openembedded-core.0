Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id E5FE76AC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:27:26 +0000 (UTC)
Received: by pdbcz9 with SMTP id cz9so40463845pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ag4qy33oPt+BZZPDlZGorYzlTJnrkSoM/yWBxolodyk=;
	b=CD74eAVgK+4Bf8T3LSRMZTy5ocZTJEcrCmihZdBl8kM0U0gJpyslufrQVV8ilPpK9q
	8HKgmXfsPdId0UpXedJxSYtkTkbfRWzbPUvzS0IoXPU2F+RgAxF96zCmuuR48BykVG9W
	Rkwm5bgWMFPQR3AQGLF4SEATncz/Cs+BNNC9zw7bDS8MLvEB1s6qV1CHHJkhfS5k2Hxa
	SsQdVVb7gvp7E6i8/t7W8JmO29bBislt25vSp9zkIaETclCJvx3zlRM5EZD4MTYMlEBJ
	lIGqUkeI4gVGW4D0q7lGMbn/ns5Kt4Kr3Nz5zpkQwiEQokb1IBoieANh2GMvDy22/Kp7
	qCxg==
X-Gm-Message-State: ALoCoQkuD0g3xhUOIMxUlXmUtb4KbJvB5JAM8mfBdxCDiJ4XwKQi4PAcUZb8yGtMUXCahTnZwgSE
X-Received: by 10.70.130.97 with SMTP id od1mr46873814pdb.0.1426678047708;
	Wed, 18 Mar 2015 04:27:27 -0700 (PDT)
Received: from Latitude-E6430.domain.name ([119.82.123.224])
	by mx.google.com with ESMTPSA id x1sm27111518pdr.17.2015.03.18.04.27.24
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Mar 2015 04:27:26 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:57:05 +0530
Message-Id: <1426678029-19516-2-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v2 PATCH 1/5] bootimg: Add support to install Image
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
X-List-Received-Date: Wed, 18 Mar 2015 11:27:27 -0000

Add support to install kernel image for aarch64

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/bootimg.bbclass |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b1c03ba..ed7b32f 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -64,10 +64,17 @@ inherit ${EFI_CLASS}
 
 populate() {
 	DEST=$1
-	install -d ${DEST}
+
+	SRC_KERNEL_IMAGE=bzImage
+	DEST_KERNEL_IMAGE=vmlinuz
+
+	if [ "${TARGET_ARCH}" = "aarch64" ]; then
+		SRC_KERNEL_IMAGE=Image
+		DEST_KERNEL_IMAGE=Image
+	fi
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
+	install -m 0644 -D ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE} ${DEST}/${DEST_KERNEL_IMAGE}
 	
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then
-- 
1.7.9.5


