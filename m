Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 47F0C6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:23:19 +0000 (UTC)
Received: by lbbzk7 with SMTP id zk7so96499660lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yrUkxT7ALkSRsbEMKCKEI8sDfOwFK8VcEJbS54VGz4Y=;
	b=j1IF2hZk/VFouiYjv9qIrtvJ4jpKaZgVIvgGqo9B8BqIYgfb0aoaxKo4CN9z0tELZZ
	VM4rSK5cH5PdYYrxHy0+9o8xUwBGhpJM1Yybw0qq6xJRJuwYjx3j+sn54tqryF6duPcB
	z/JDtlj+TAfHcABC7JU2lH6F/+VDVLp+wtxNytKAdF/pE7ZC+BEka4+i9yIJxhL1IlZC
	FdsqsjakYhrpKJR2t37YNiHmLm6pThrYPOMkCYWVOIeFBE+iKeQzUjEdv+Ger54LY6Tj
	Qdin4cosL0URQ2SmjQGQSW87zC/GZE4gqk5MZyyWskI2OhAJ7McQgPFVEJUI8FWjeKyO
	Iyvw==
X-Received: by 10.153.11.163 with SMTP id ej3mr8390339lad.105.1431357799986;
	Mon, 11 May 2015 08:23:19 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id ba4sm3108875lab.31.2015.05.11.08.23.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 08:23:19 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: =?UTF-8?q?n=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Dan McGregor <dan.mcgregor@usask.ca>, Darren Hart <dvhart@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 17:23:19 +0200
Message-Id: <1431357799-30306-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xserver-nodm: Support reboot from inside X
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
X-List-Received-Date: Mon, 11 May 2015 15:23:21 -0000

If reboot was called from inside the Xserver there could happen a race
condition where chvt would never end, and therefore the whole system was
stalled.

The user could not recover the system by ssh the machine or using the
keyboard.

Running chvt in background fixes the issue.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index 2e3e09077792..31f545f79199 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -48,7 +48,7 @@ case "$1" in
   stop)
         echo "Stopping XServer"
         killproc xinit
-        chvt 1
+        chvt 1 &
   ;;
 
   restart)
-- 
2.1.4


