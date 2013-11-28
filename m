Return-Path: <mburtin@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id EF0A36D75C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 11:10:19 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id w62so2395115wes.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 03:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3YVpwHVyJudFpzErDH5h+VeNITXOEniKTdbjbYaowzI=;
	b=sok2zeVp64hag2ewRgw/59bvEAJHRjnIrrJ8slr+iWVgFEqjSLvinMqej39OPrRYp6
	W+a8LsxT8JNOqSFeRe62Yp14A+xqegXgNg89NUvXyIyxbtmHmrxng/0oNlMUYuwf7SEJ
	OBFXcDy3A62Lj5UG/dHw8m0wOtayKWknNe6aPUuB8VdSWU5+gFUZP0jULbqu/Vmsw8ca
	VT7G/gkKxeI3Of2/XKFMQ2EXcsg1F86syNYGjGdHh1WsMY3b4XHozRzh/hjLCf9JnJaW
	3hXAfroIrDtrV3RX8FLXn69vAgBOGUK019Ctb3WXff0uuImVF7mp4fKrvap7vyGpBhnc
	w4Ng==
X-Received: by 10.180.85.42 with SMTP id e10mr1983934wiz.1.1385637018948;
	Thu, 28 Nov 2013 03:10:18 -0800 (PST)
Received: from mburtin-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id g16sm40067273wiw.6.2013.11.28.03.10.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Nov 2013 03:10:18 -0800 (PST)
Sender: =?UTF-8?Q?Micha=C3=ABl_Burtin?= <mburtin@gmail.com>
From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2013 12:10:02 +0100
Message-Id: <1385637002-15201-1-git-send-email-michael.burtin@innotis.org>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] kernel.bbclass: allow customization of initramfs image symlink name
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
X-List-Received-Date: Thu, 28 Nov 2013 11:10:20 -0000

Allow customization of symlink created when kernel contains an initramfs
image using INITRAMFS_SYMLINK_NAME variable.
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4974507..2ceb176 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -118,6 +118,7 @@ copy_initramfs() {
 }
 
 INITRAMFS_BASE_NAME = "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
+INITRAMFS_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-initramfs-${MACHINE}"
 INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
@@ -474,7 +475,7 @@ kernel_do_deploy() {
 	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
 		echo "Copying deploy kernel-initramfs image and setting up links..."
 		initramfs_base_name=${INITRAMFS_BASE_NAME}
-		initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
+		initramfs_symlink_name=${INITRAMFS_SYMLINK_NAME}
 		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
 		cd ${DEPLOYDIR}
 		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
-- 
1.8.4.2


