Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4237473D68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:08:05 +0000 (UTC)
Received: by wiun10 with SMTP id n10so975106wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TTSbxRNCCDi+Rk6bG/45aS7yO5jrzD3oVd+HlQmpWnI=;
	b=QH+mYQUlP0Z97y7+bMgdTsIyhquc2PUj5oHCS+rKLxgrNXuvVyI4u2TKvEnNkWYd78
	bSeU73dJje1Jt03JeilteEkj7VLKKMlHABHKtbe/SLDxfJG15+R9GX2Q78XfrESUONAP
	rs18GtCBNBtvrrAzQNKrcEE6bisuGNHJkAjVr26sq4dNwPz8p44aw/KETHOEOZaWDbkL
	iCEjD9RdNIrlH3+heV8/fFQmFY9qSfjuljGOcOkFY+qakYgO92m8fla6Ch/Si8+DGFGE
	89XzqBuA5LQKRzCAuSleEgSBXzxOv37mg+bq54nkJOI9keHjZ7H7LbzEMENrdZmwYnUm
	JXqg==
X-Received: by 10.180.202.228 with SMTP id kl4mr25194186wic.66.1428962886501; 
	Mon, 13 Apr 2015 15:08:06 -0700 (PDT)
Received: from X220.home (AToulouse-651-1-103-181.w109-222.abo.wanadoo.fr.
	[109.222.70.181])
	by mx.google.com with ESMTPSA id l3sm95759wik.16.2015.04.13.15.08.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 15:08:05 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 00:08:03 +0200
Message-Id: <1428962883-26803-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Cc: tprrt <tprrt@tupi.fr>
Subject: [meta-oe][PATCH] zap_empty_root_password doesn't work with toybox, /etc/passwd isn't never edit if /etc/shadow exist.
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
X-List-Received-Date: Mon, 13 Apr 2015 22:08:10 -0000

From: tprrt <tprrt@tupi.fr>

Signed-off-by: tprrt <tprrt@tupi.fr>
---
 meta/classes/image.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 03cbbf7..541daef 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -328,7 +328,8 @@ MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
 		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
-	elif [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
+        fi
+	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
 		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
 	fi
 } 
-- 
1.7.10.4


