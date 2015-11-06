Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id B03377710D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:40 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116508108pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4vjNCrU06vglXo7ke69QR5RG5JlB31CDdY+TcAP1Kns=;
	b=ymgBH9ZIMgKu9Zw6gh6Fwn7YOsM+HNi7TMWRh37q1+3nKiCpuT/UwF7agy4cdsEwlW
	yFffrauMYRSY+QpptZnDq/iKfBsTQhR4oIC2FN1L7gpsFmh2RG56JlmkrafISddNnTP4
	+yNdm41gWdRsdI1+h/5S26IHQqHI9A6wX6BeNsRE6ZoTJWIHUTRfoweYNi8SDAIje2K5
	WnjmlA0yzhVvQ7EdUFOSqGj/n5rB58aWbJi5QzfKc6vnP0JumTKGCHoPlaXM8nKFe/n6
	iW9P+c+0lRoZ/HNRJDrFD1fBuB593l76tEw5MZYlH3P1iqXEODwdJYNidLZYuxz2trTr
	2PcQ==
X-Received: by 10.66.246.225 with SMTP id xz1mr16019175pac.27.1446799660884;
	Fri, 06 Nov 2015 00:47:40 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:07 -0800
Message-Id: <1446799631-7037-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 07/11] busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:40 -0000

Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR,
etc), so avoid over-riding MAKEFLAGS via EXTRA_OEMAKE.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index a655a36..2b52e74 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,6 +18,10 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
+# Busybox Kbuild likes to control its own MAKEFLAGS (it adds -rR,
+# etc), so avoid over-riding MAKEFLAGS via EXTRA_OEMAKE.
+EXTRA_OEMAKE = "-e"
+
 EXTRA_OEMAKE += "'CC=${CC}' 'LD=${CCLD}'"
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
-- 
1.9.1


