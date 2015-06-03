Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 449A275681
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 06:11:57 +0000 (UTC)
Received: by wgv5 with SMTP id 5so64019wgv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 23:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hbwK2be8LhM2sj+WVFOhY7Csei7IOOgyTPCls+x37/g=;
	b=gaLKUMuE1GVkjNaYY+NUG5jbo2KfKSqU6CB4GvJ9RzWYim/6BBzX/CGlPnTJMO0pOe
	qqXnmON8/56glJKDV85bsYeWz09j0r+R22IkGHoNyi6VPUqSxxhKmt0SsgKEL9h9l8iG
	xkObuLZ2pnPqjQSCG9h0qkkPTSIGIPNQ/33ISuiwK8a/WJJDj/N+hB84d04ysGXIw4iq
	iJuobFn1bZyTvBezMVxKzO/3H5Vro961GNx8MEUocwATzfE8INUAuRhuIYaDHAOVkyA9
	nwF5ahb9J448G9e4BbiTkD6jhshwAVmd4vAjzdL6iLPkCGeoU7DXQGIwDwAwiTZ9SBIa
	P+3w==
X-Gm-Message-State: ALoCoQn9OZ7qId/gavUHu+RrfgQnhF04uNJ72mThNydwxLDH5gwu4nPjBwmdYJZ1L28usDagV3+4
X-Received: by 10.180.79.73 with SMTP id h9mr38073536wix.35.1433311918351;
	Tue, 02 Jun 2015 23:11:58 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	vz2sm20788305wjc.18.2015.06.02.23.11.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jun 2015 23:11:57 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 08:11:54 +0200
Message-Id: <1433311914-15725-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] bootimg bbclass: don't hardcode 'bzImage' name
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
X-List-Received-Date: Wed, 03 Jun 2015 06:12:01 -0000

In the EFI case there are 2 more architectures besides x86(_64) that may use this class: aarch32, which tends to use 'zImage' and aarch64, which uses 'Image'. Instead of hardcoding those values like the luvOS fork does, use the proper variable.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/bootimg.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b1c03ba..d248321 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -47,6 +47,8 @@ EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
 EFI_PROVIDER ?= "grub-efi"
 EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
+KERNEL_IMAGETYPE ??= "bzImage"
+
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
 # specified, maintaining the original behavior.
@@ -66,8 +68,8 @@ populate() {
 	DEST=$1
 	install -d ${DEST}
 
-	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
+	# Install kernel, initrd, and rootfs.img in DEST for all loaders to use.
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${DEST}/vmlinuz
 	
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then
-- 
1.9.3


