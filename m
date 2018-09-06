Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0FAE796DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:14:57 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id l5so9193104edw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=82OOVNbuEzEdYfUOuLPnZAZjasCfvp5u39KOX06l97k=;
	b=Lrk4CPw+WUkKYDun17FAmvt/OsA8zzNOuzpvPoC66BgHGEbF2khn+OwW4wVAMLsDeV
	VyHWdDckKNpWPZ1OQ+9cYZCUGuw+5ov1ii5DwVWhbOrGCl8xPszzk39JjIhLOdrQugmQ
	e7Ah5RX5K97NiCvmZSUrHuVVtIMizLvWoibCcd486ypuvyK7Ro4epx5scMnRl/UzlZOZ
	91os4EZhAV80r5iBSWy69rJkT9YLJSGVHIztUo1QqGG5KHfSpVO9zlnUz8J3uK33kkgO
	SK30FmLAnrRRG4iH+K4KuSh2cgqswgEHQCLK5F3mTjA1roYOhSNVoFmNrgdZar3rzRFd
	27CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=82OOVNbuEzEdYfUOuLPnZAZjasCfvp5u39KOX06l97k=;
	b=X9MvRAnY7IZOUzUK7+Wt3ZX6g6I1vAZwmCJSFLQGGo5bmQOamWrl7wlH7C+a+5dUuA
	2IHLmaM37OVHHdFvIrMLJLmIOYYKTWFL8TE0UHn4c5852KnQBMY74zlmNjXNVD/wV1A7
	2/I0gZYw/XNmb8GzORyT4NX/r57IXtbIiXSWtA8RdieBIs5lBle+i1z+i/l9Cwz1dbPI
	LG9mE2AviyfFihhQ6+zGBcedUGq3tbNyqy6mOvoL8Bo9rCgm3fmDBH4CK/grdKq5m/kb
	nEGwH01CEQS5bnYE91EEjDPK5rwyiLXQuDmr3VzxVxqLdQ1arbBCuSVMuFsq1JuPn1UJ
	jTgg==
X-Gm-Message-State: APzg51BlWd7zf5xG/3LfI9j0ylWneckuI9zzrEUphqY09x1YmeubFLSU
	b5Hzc57TYk8ndsk57O3f072agIsag9aE6g==
X-Google-Smtp-Source: ANB0VdZCdoeckq2oesxfKvnDvAArZD5pH8FW0IeG3usPmmvR+95zBMUmDRatIbfKWYHMXcGiTnm30w==
X-Received: by 2002:a50:94b3:: with SMTP id
	s48-v6mr3997450eda.125.1536246898013; 
	Thu, 06 Sep 2018 08:14:58 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	y7-v6sm2716027edd.13.2018.09.06.08.14.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 08:14:57 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 17:14:52 +0200
Message-Id: <1536246893-680-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Cc: Walter Goossens <waltergoossens@creative-embedded.com>
Subject: [openembedded-core][PATCH v2 1/2] kernel-fitimage.bbclass: Handle bundled initramfs case correctly.
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
X-List-Received-Date: Thu, 06 Sep 2018 15:14:58 -0000

From: Walter Goossens <waltergoossens@creative-embedded.com>

If INITRAMFS_IMAGE was set, but also INITRAMFS_BUNDLE = 1, then
the kernel image already has the initramfs bundled inside. In that
case do not pack the initramfs inside the FIT (again).

(The fitImage name does keep the suffix INITRAMFS_IMAGE for all
initramfs cases.)

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 88d8022..8bda644 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -475,7 +475,9 @@ addtask assemble_fitimage before do_install after do_compile
 
 do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		test -n "${INITRAMFS_IMAGE}" ; then
+		test -n "${INITRAMFS_IMAGE}" && \
+		test ! -n "${INITRAMFS_IMAGE_BUNDLE}"; then
+
 		cd ${B}
 		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
 	fi
@@ -483,6 +485,18 @@ do_assemble_fitimage_initramfs() {
 
 addtask assemble_fitimage_initramfs before do_deploy after do_install
 
+do_assemble_fitimage_bundled_initramfs() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+		test -n "${INITRAMFS_IMAGE}" && \
+		test -n "${INITRAMFS_IMAGE_BUNDLE}"; then
+
+		cd ${B}
+		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE}
+	fi
+}
+
+addtask assemble_fitimage_bundled_initramfs before do_deploy after do_bundle_initramfs
+
 
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
-- 
2.7.4


