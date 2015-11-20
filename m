Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id CDD3760796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:26 +0000 (UTC)
Received: by igvg19 with SMTP id g19so41865263igv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5SJgrh7mfqNlobPkqGh1jU+OKWqVQeupi0OHJjvAlmg=;
	b=ml86ebUeK5RXugh3dxOwDI0lSDjhjQ3jYPbGBa599q0+Bv2IEJ3fEBjxZsN+0QixTP
	9kqdOrphuM2RGzWf6932VBieH4QIsPvAUs4QkUSG0vDjZGfB4W8Av3duJQjtEktBtPRX
	slJhu+MshF6AqyPsgC1qoaSo7mBBbgdbfKAWw+RxCZMpt59E6yUod7hM4mspNr1GanRP
	wS+NfU+5kcg0g8hMdufZhRd57aVGX7Rm3J9mT9nl2NHsIt5My4M7hU/zSLphbSPukr99
	zdyhzTjaVXM3fR7PrD9EWPr1bDbRGGay6wxeRlBcjqyh1zPB08viziegRSgfUO5VlDq9
	/pDA==
X-Received: by 10.50.43.234 with SMTP id z10mr4476984igl.53.1448059467692;
	Fri, 20 Nov 2015 14:44:27 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:26 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:53 -0800
Message-Id: <1448059438-24431-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 06/11] busybox.inc: set CC=${CC} via make command line
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:26 -0000

Busybox currently relies on 'make -e' to over-ride CC and the make
command line to over-ride LD. Set CC via the make command line to be
consistent with LD and to allow '-e' to be dropped from EXTRA_OEMAKE.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 03b6cf2..1293b07 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-EXTRA_OEMAKE += "LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
+EXTRA_OEMAKE += "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
-- 
1.9.1


