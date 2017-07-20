Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2134078368
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 22:42:43 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id y8so379755ywi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nJOaWpBODjwDhCsrrKWj1WQg9ScMQilBR6Lsh+0itXI=;
	b=jzZ5ZDUrRoNtpdlmZS0cBSbWUkUBKnkZ4URMCG3rs29VwU/WytVnMWClCFEEFVx31a
	fOWi83QMmBgNzDC8F2k4CgxlsCoe3mHmgDMZL15jfgeCFiMmXJcG2qN6ikyeCZMhnx36
	yiRW6GupOTCK2kQK8oU92xgpvkQzJTOkRKG9+G25Wi9ha6GOF1Sjq2NXp7Js8R1Qk7r5
	gE2/ISN8EA3r86h/xu3biXp872a/Wnsn9wxEwOfyWaOjNbgtgYu6PVEspNqXMpmHwgED
	Hiz3hlwh3R2XqSX2pC2q5yhD8aDL4V265cSFfPOA2WmgM2kpPD+r8C9a5pc4cQ2DPuoZ
	dNmQ==
X-Gm-Message-State: AIVw112A0DkcGUjHtRUigltxt6XpnE6YhOy5V94uaO4hDAjLeB2xChVX
	eYRmg6OxpDYX36M1
X-Received: by 10.129.153.144 with SMTP id q138mr4452690ywg.236.1500590564968; 
	Thu, 20 Jul 2017 15:42:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id w7sm1229574yww.33.2017.07.20.15.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 15:42:43 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 18:43:51 -0400
Message-Id: <1500590631-2028-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500590631-2028-1-git-send-email-trini@konsulko.com>
References: <1500590631-2028-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/2] image-vm: Change default ROOT_VM to use PARTUUID
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
X-List-Received-Date: Thu, 20 Jul 2017 22:42:44 -0000

From: Matt Porter <mporter@konsulko.com>

Support for finding the root partition via PARTUUID is a portable method to
determine the system root device as it does not depend on device ordering and
also abstracts the diference between IDE devices and SCSI/SATA/etc type
devices.

Signed-off-by: Matt Porter <mporter@konsulko.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/classes/image-vm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index a888f0232caa..a7cabae590c0 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -42,7 +42,7 @@ ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}"
 
 # Used by bootloader
 LABELS_VM ?= "boot"
-ROOT_VM ?= "root=/dev/sda2"
+ROOT_VM ?= "root=PARTUUID=${DISK_SIGNATURE}-02"
 # Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
 INITRD_IMAGE_VM ?= ""
 INITRD_VM ?= "${@'${IMGDEPLOYDIR}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
-- 
1.9.1


