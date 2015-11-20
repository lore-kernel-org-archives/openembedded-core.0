Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id B752762133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:29 +0000 (UTC)
Received: by iofh3 with SMTP id h3so138752574iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Zp4abXqkikrrxZp+yGngcYdA0N5w9eWG7UVqJkhtqc=;
	b=tvACSeXQ08dCkF3585QtKWA9Lp2uvTIg0AwhsMG65ZohjGtktCu5PJSUmxIfhnDXvD
	YXim6nNSd/dGoEDSyK1PI9zQBK3ivkjVfe+Tb15a+WHxVjh/pcH8W9+FRmVfZ7iwOx/5
	251ylQHn1x+YQzARmMtjtnScwHEUpHqJkDhQ4WrMD3WBlXBYfErM4elm22ByJo0ZV1kx
	a+vF1+OhcW0w6/IkXptJltW90/NlskD0Z20lHBYc1jwT3op7X7fcE5gWFX6nBWMsx2rf
	3XqSDC0oF79w6n4Eo57/T1OtTOEdiLNktoIcHDrT3uhL9MIyYHwVcsxIdRJm8BLloqlY
	hJOw==
X-Received: by 10.107.16.84 with SMTP id y81mr15063255ioi.19.1448059470116;
	Fri, 20 Nov 2015 14:44:30 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:54 -0800
Message-Id: <1448059438-24431-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 07/11] busybox.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:29 -0000

Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR, etc),
so avoid over-riding MAKEFLAGS. Relying on 'make -e' is no longer
required so remove that too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 1293b07..fba956e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,8 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-EXTRA_OEMAKE += "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
+# We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
+EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
-- 
1.9.1


