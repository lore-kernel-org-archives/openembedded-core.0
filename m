Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id B3FC97399D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:31:50 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so23916599igb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 11:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ag4qy33oPt+BZZPDlZGorYzlTJnrkSoM/yWBxolodyk=;
	b=aE7qxstTfzOHcdCcgBundaDH3DNAapCEzbLg0bUZEB6Ouy3Tnx3aZJm2JHNYMes2F8
	015IH9t8mOQC6XX1XTQZ/bhSPrP2vCScs8qmSF5ah3ZL1bNcANiERJMQFpeKYJu4nQhO
	XhgxuCltaIebfIS9DCVOuWwO+mMzZKqS1cnKPEn1XWaqCodm1xQdKYjfpy1yuRfdmpRB
	Y50i0wLIkarhE2dDKWx3A+TsI2g42+tHpSVE297cjkoaDnTbKXsLhbzZ9eBKfa5HCXss
	Yr8uDkW8/+6Nluvm9oUZYdHER0NYvJm+zXKlhLdhReKXt4w6H7bT6aZt6BwphOuT9Ha7
	cISQ==
X-Gm-Message-State: ALoCoQmSC/QNpgVWFTlx1K6PYJqVUMs3GzYVkKZwyjwYH+d0/4PdJiTb5LnKpVmhIPJ92DMcgnBS
X-Received: by 10.50.73.99 with SMTP id k3mr76332000igv.21.1425925911409;
	Mon, 09 Mar 2015 11:31:51 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194])
	by mx.google.com with ESMTPSA id w3sm6552503igz.4.2015.03.09.11.31.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 11:31:49 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 00:01:12 +0530
Message-Id: <1425925876-9663-2-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
References: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
Subject: [OE-core v1 PATCH 1/5] bootimg: Add support to install Image
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
X-List-Received-Date: Mon, 09 Mar 2015 18:31:51 -0000

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


