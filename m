Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 578046DDF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:02:25 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hm2so526602wib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mAcILS7aST9B9jFgcq/ih1LTRSTtY/KcycWyl+7x2EU=;
	b=XzCWd0JLjR2rNnzgEaCTC39Y+6GvFeOeZn1qvncD9IC6NdJ4K9ULkYQk//F2rvvkbY
	kQIyY/UWvhKFgKXd/I+Q/rJ7CWmnpi/3NRCu6OpKIavEN5KKhSD2zmc9prY74RNsWUl+
	PAGtZZkw+WgxMGozA/FeU5BLhLjHQorV40wafYM3uGoYP3gmVcTm9pYBTg30wuX6e8/i
	xzDdUExElchJVesekollDyslzlfcu1OWtf5k+36b/BQb8r0br5ENcWx/YNibKoZZhPdO
	tRn8sBRiJJJdJA5EPpwGta7uP0estEU12Nt6ZzQRtRd82rsiHYmVCI0UjvTl9Yv6WDaX
	OtNQ==
X-Gm-Message-State: ALoCoQmmD6/eW5zqflZrD7oJFoPBCAxvd+5PSJiKqC3zyrA42z0qNctFH7seuKpgnCFJmiMUWUcT
X-Received: by 10.194.219.232 with SMTP id pr8mr26309030wjc.6.1389697345928;
	Tue, 14 Jan 2014 03:02:25 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id z2sm878771wiy.11.2014.01.14.03.02.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 03:02:25 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 12:00:48 +0100
Message-Id: <1389697249-4062-4-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
References: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 4/5] kernel.bbclass: add support for LZ4 initramfs files
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
X-List-Received-Date: Tue, 14 Jan 2014 11:02:26 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/kernel.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5fef446..f2a5ec5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -87,7 +87,7 @@ copy_initramfs() {
 	mkdir -p ${B}/usr
 	# Find and use the first initramfs image archive type we find
 	rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
-	for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
+	for img in cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
 		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
 			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
 			case $img in
@@ -96,6 +96,11 @@ copy_initramfs() {
 				gunzip -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
 				break
 				;;
+			*lz4)
+				echo "lz4 decompressing image"
+				lz4 -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				break
+				;;
 			*lzo)
 				echo "lzo decompressing image"
 				lzop -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
-- 
1.8.4.2


