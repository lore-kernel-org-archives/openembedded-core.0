Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id D1ACF77F7A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 09:30:26 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id v27so96884215qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4mG8bgXSDWr7G2UzBmjSBxNz2jFr3co/l4d/hl01ZiU=;
	b=NTU/aJHoqzQUtbJWoOlQJjPkrXXWIfSeF55OjYwkzYfgu74eJbEalMQuo978Mpvw2c
	kNBtgX/0+KsrLfbo5FSe6OzLoRN0LsKAG9OsG5PytlGfvMbLKL2K7Omk5CvtFBiFxm74
	zjfIvFiShlBJJlZwcXQqOn13RUEPJBEo70F04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4mG8bgXSDWr7G2UzBmjSBxNz2jFr3co/l4d/hl01ZiU=;
	b=iIEaVuIP1NjiB3knMd6lmDKtZwrMYlpO5SRqUlmcnT3kv3Dah2OTvK413EftZb6B3F
	uFXhy2qV5HOrHPmlIDj3VF9cJ5v2urDOO2PfhCse2Kjzb1DFUuxGO9KSMprPgCcQymSd
	9WmTmR6oebheOq9j23A4IjBn9n2jCO8fAzmTiTJALbdHQtb/NVKRy4No/6GvufXhRb90
	QTqCzxUb2OGlcStgw6lKZD/Nn2ZTYUPxYPpyL/E6Fl5DEzvLWarWpEfJ7x6bd5UzsIa2
	TY4APc3maja6DjqC3Ra7XCQ2Po484dI3RCQ1CsRC3LBbfWkstHFp/R5DPBmHj17Dki+k
	fmGQ==
X-Gm-Message-State: AODbwcCY+sEVGhAQRTUNx6Sq0tXwcz+Wudvb+61p4wQokZfynpq4c9sB
	7dCa1tYIqScgatsm
X-Received: by 10.237.54.193 with SMTP id f59mr19516126qtb.63.1495445427902;
	Mon, 22 May 2017 02:30:27 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	n17sm11667604qtb.6.2017.05.22.02.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 May 2017 02:30:27 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 11:30:02 +0200
Message-Id: <20170522093003.17711-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
References: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/3] image_types: oe_mkext234fs: add arguments to customize output file extension
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
X-List-Received-Date: Mon, 22 May 2017 09:30:27 -0000

Add a function argument to allow users of this fonction to specify the output
file extension. This commit as it is, is a no-op, and this new feature will be
used in the future.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/image_types.bbclass | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 7749b00098..efdcfed843 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -56,9 +56,11 @@ IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${I
 
 oe_mkext234fs () {
 	fstype=$1
+	ext=$2
 	extra_imagecmd=""
 
-	if [ $# -gt 1 ]; then
+	if [ $# -gt 2 ]; then
+		shift
 		shift
 		extra_imagecmd=$@
 	fi
@@ -72,15 +74,15 @@ oe_mkext234fs () {
 		eval COUNT=\"$MIN_COUNT\"
 	fi
 	# Create a sparse image block
-	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
-	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$ext seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$ext -d ${IMAGE_ROOTFS}
 	# Error codes 0-3 indicate successfull operation of fsck (no errors or errors corrected)
-	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
+	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$ext || [ $? -le 3 ]
 }
 
-IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ext2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ext3 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ext4 ${EXTRA_IMAGECMD}"
 
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD_btrfs () {
-- 
2.11.0


