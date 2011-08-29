Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qy4kV-0005NY-Nk
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 18:31:47 +0200
Received: by gyg4 with SMTP id 4so4525027gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=d7fgSy1g4txGQObSy/IeGyXCXHt78IPh2OcDMFDGP88=;
	b=pEJBd/8WmBBqU9QbsYderDXglarNIki9gzqD/SeRh0EipP1mFqLLnzzqNF7+I6f4tP
	PKM8bc9teJCutyTnJqSTOFpButHY8DaEeW15Q1O6jUuBTAD0ZXZdNoCZ1lK1QW7aieK4
	ZXAISOmCXIf69C3DV37+tfzsUVdezWq2bqbSc=
Received: by 10.236.193.102 with SMTP id j66mr26399896yhn.26.1314635214978;
	Mon, 29 Aug 2011 09:26:54 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id p63sm2815253yhl.25.2011.08.29.09.26.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 09:26:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 09:26:46 -0700
Message-Id: <1314635206-5831-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] image.bbclass: use ${TARGET_PREFIX}depmod
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2011 16:31:47 -0000

From: Chris Larson <chris_larson@mentor.com>

Currently it uses ${TARGET_SYS}-. This is inconsistent, as the recipe
and kernel bbclass both use the prefix. While there aren't many cases
where the two differ, it is harmless to ensure that we are behaving
consistently.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index bf8b73a..3cd5e7a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -165,7 +165,7 @@ fakeroot do_rootfs () {
 		KERNEL_VERSION=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
 
 		mkdir -p ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VERSION
-		${TARGET_SYS}-depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
+		${TARGET_PREFIX}depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
 	fi
 
 	${IMAGE_PREPROCESS_COMMAND}
-- 
1.7.3.2.430.g208247



