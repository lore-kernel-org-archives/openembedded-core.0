Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64C61731BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 17:28:29 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r64so5801198oie.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=omQjCDZhy7+NnQf6ehA6y1X9pz/0O+Ecs+t5oEvROJI=;
	b=yXNYA4q/gnfvgADiJ4qlLT2Zbk3Iew2qjdVAJtXXdLy/u0t74ftWxj9py0YJrmqHRa
	1UlCRXz4sfYkOc6/HDKyzrlAIe7p2dpsPa8nVVFpDq2XzFQzK9diYawmN+MWh7K4UlIB
	Xj7YhNytbZCCCMQBCmtpscRs+KwWfk1nK6mMvtEHncSzxK809C91lUWNbRLVdi5/7WuA
	DSDuNoFQHayVgpcY6ybu58WHSnPn0X33RQMM+Gn9wA7Hj4n8kotMcAnhVH9ikiCDgYyO
	yavJL1BmMf53SoPA/d4UYNkEwdoSsP7JXIKSfIEND5saU/F2z0AkDTbazzIbfHgqcWT6
	5Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=omQjCDZhy7+NnQf6ehA6y1X9pz/0O+Ecs+t5oEvROJI=;
	b=FViDK+pwgdoZCJLXs9xFdj3x63ufwMxh2v4Cm7CqgxtEQzq4jAI+mBtDP0o6+wcYmW
	PIe5VfnOkfpMFlZqbqXvR2zKID0sgGQBFF3pvARx0rL+RhAgCVdBN40NLiSf+25WRdjP
	N12OWEgxkIprMRZP8g3fguSoCynY2v/MlrT9rWLbsM63En6RUg8MOOkLZuFCsmXvBemw
	7i68Sk5+ZSBoftnorJgrEYx4OMpV1vJlLzXqUvWEhxsv5eU2b4IL8n4IA5QcLU9YYnQI
	kcxDfM9nI5JNwCJLZ5LlJS4R9vjlU/Ya4iVR8MxQ2Bd8/iRHWm54f1hgVwg2av4HPCLM
	Baew==
X-Gm-Message-State: ALyK8tI2XSNgyrqJoUaToYL2OhZre0PgYy3uw3n/8Rmu1sH4H62ukAft6gQm44VSIDazLQ==
X-Received: by 10.202.94.132 with SMTP id s126mr6868838oib.34.1464283709709;
	Thu, 26 May 2016 10:28:29 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m2sm6941991oia.1.2016.05.26.10.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 May 2016 10:28:29 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 12:27:56 -0500
Message-Id: <1464283676-17773-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: marex@denx.de
Subject: [PATCH] uboot-sign: rebuild u-boot.img with signed dtb
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
X-List-Received-Date: Thu, 26 May 2016 17:28:31 -0000

u-boot-nodtb.img doesn't exist so if UBOOT_SUFFIX = "img" is used
u-boot.img must be rebuilt by running make with
EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE} then the resulting .img file must
be install to the deploy directories.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 82cec9e..57d4903 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -63,9 +63,13 @@ do_deploy_dtb () {
 do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
-	cd ${DEPLOYDIR}
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
-		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
+		if [ "x${UBOOT_SUFFIX}" = "ximg" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
+		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+			cd ${DEPLOYDIR}
 			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 		else
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
-- 
2.8.0


