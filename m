Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id D315460124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:33 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116504713pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=csc28kMWLiJHThq5khZyTqUG6uBzNxuSnHuLPwjh7Hc=;
	b=gHUWJU0t9CUfBtI263TOlhzw/cimwi4IywacvJE8N8rYCF96QCX7U0r5ik0xqGxf3p
	0u0pyxPcYsQ4EaiVFkvWhz3UjkGRh+BB2nBP4+3YmE3FPqeHbugD/rYlQTKpK6/fZxJ2
	C7PFPbPp+XGbiULuGZpEXbcd7rrH1I8Z4C8rPjd9jwttjjfLiGS8xbQ5l3AtHT+IxXtK
	lZ2hULUbggqnDjcD4Jn6mhjC6kT7/aU6DwfTLJne+txknJNJ4oBIxHHycUgS83v0nGrr
	SABycz1oRNrQZRkYvYLTHh5kmBW7iTPwKZtFgEpJXDMYnF1gSuwkQZyGJq8Gh8gB/L07
	LOlw==
X-Received: by 10.68.142.37 with SMTP id rt5mr16079564pbb.64.1446799653639;
	Fri, 06 Nov 2015 00:47:33 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:04 -0800
Message-Id: <1446799631-7037-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 04/11] busybox.inc: explicitly include CC=${CC} on make command line
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:34 -0000

The busybox build currently relies on 'make -e' to over-ride CC and
the make command line to over-ride LD. Add CC to the make command line
to make the CC over-ride more explicit and consistent with LD.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 48a012c..8132641 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-EXTRA_OEMAKE += "'LD=${CCLD}'"
+EXTRA_OEMAKE += "'CC=${CC}' 'LD=${CCLD}'"
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
-- 
1.9.1


