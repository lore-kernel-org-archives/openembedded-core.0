Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UaPqi-0002E6-2P
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 14:21:28 +0200
Received: by mail-pd0-f178.google.com with SMTP id w11so1972812pde.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=kgTJEwDU49h/kXuHYFFbcByNhP/2SLW+3KEgkAa+IQo=;
	b=D8uvXYFxobnyd+x3R8x0rlBVPMB5xL8eMdCBeRSrakZyoVyKEbUntTD4J/jZ4WgOfO
	2UCYEAB+S9IIVFb74XKY0lHVidUGl4XscFUJ4+Uth7E8qaPYlyk1sgrBBiHuS6akDMvL
	DGyrE3u9kmDF5ROtyJQB6Gk+zZt2zHSBcouPHWlJ1eaWvI+ciIioYFmQhPsoMpbAiOAq
	dwVdEgIWmgEeMP4m1b/+x0Mk0xt0+cLSOwCpGXSUJDuOCOFVOX28R2/uO1OZiQqLvFVQ
	YpenbGk1MsupOyJ4iKhlBTzl8gi8ga+/f8g3lqtw1jn1bmrPXqtZT1fmmA+MKWRzESwE
	OcfQ==
X-Received: by 10.66.217.162 with SMTP id oz2mr12587397pac.157.1368101003687; 
	Thu, 09 May 2013 05:03:23 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id au5sm2820395pbc.40.2013.05.09.05.03.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 05:03:22 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 22:15:48 +1000
Message-Id: <1368101748-4701-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 3/3 v2] image-vmdk: Fix error recreating symbolic link
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 12:21:29 -0000

If the vmdk image symbolic link already exists from a previous build,
overwrite it instead of returning an error.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image-vmdk.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 6f7df3f..70234e2 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -18,8 +18,7 @@ inherit boot-directdisk
 
 create_vmdk_image () {
 	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
-	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
-
+	ln -sf ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
 }
 
 python do_vmdkimg() {
-- 
1.8.2.1



