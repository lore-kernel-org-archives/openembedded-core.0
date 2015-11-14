Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 180E277382
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 21:35:32 +0000 (UTC)
Received: by wmec201 with SMTP id c201so126805884wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 13:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Op2l3vCTuzCf5+8gPCWrjSpgBG4cEldp4ddsUEl+oxY=;
	b=s3yCYRjC5kN/ohWRIW+sAcn077ZPZWJo32C02pJo1U34s00ClzMzHb3r7m4/wrLhg/
	wtOlwqDy3zqGj+gLfnW1lpzKqPf0Qfv/Ff15hFjTAiF5zdO1yZpTYYPDDDiFrvcj4A+L
	xnCRJl6geVusXUaq7X2/OGsa0VamNlExv+h79sxF7ktUwjkHRVfsJ29vkgA2AM+f7cC3
	tU/QD/Sv5Z5XcaUISczm1cPiSwMt6fFA8Kf/3k0yQArAVwOA/qluBreE1Xs2Olr1S08b
	3H3U8bTODGcQ+usddeUevXX6yrEhiWv+IyxXij1Is2aUmo4b7CQdB7trgCk5Pc9FK4yJ
	R5ig==
X-Received: by 10.28.94.208 with SMTP id s199mr11063561wmb.10.1447536932789;
	Sat, 14 Nov 2015 13:35:32 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	c4sm14784681wjs.36.2015.11.14.13.35.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 13:35:32 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Nov 2015 22:35:07 +0100
Message-Id: <1447536908-21449-3-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 2/3] runqemu: add support for multiple NICs
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
X-List-Received-Date: Sat, 14 Nov 2015 21:35:33 -0000

Fixes [YOCTO #6356]

Current runqemu script does not support qemu configurations with
more than one emulated NIC. If parameters for one or more
additional NICs are appended qemu ends up with an invalid
configuration.

Example to reproduce:
runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..."

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 3b0e54c..7b1fdd9 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -257,7 +257,7 @@ else
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
 
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
+        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:off"
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$VHOST_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-- 
2.4.3


