Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A205B770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:49 +0000 (UTC)
Received: by pacao1 with SMTP id ao1so5898248pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6U6npt/EhbmBMqPFt5cnqg63TV2JvTBU8H8lzaMTyxc=;
	b=EQ/TKoWxY1bkpehsTmmZC5O8s2WljcH6agH2XknNnPpNb4UtoINm0246825KFWQC9+
	49OsKk6f0kpUIejCOcvUriA5sLAMJBG5FbMWGYUfPDvOaTsC3HVy7ZE+TYoSrJd5ilQ1
	LoEC2p/hmwJ5PFFzfN4NiVMTNEj5FkyQvlHJWZwjdnhlhDdsr9WAml+gAs1x2Yhs1l/1
	USqbZoxBphUcy2F3iFfRByDRPGtbOmt0h9WgbpV5J07D6KaPQhAaP7xQggNUsPXyTPyU
	2Rzgw4hY0ohooPOV5ATkkAWmJg49PVTcVNFvNIg+Bw1C0RNDW3JCHSILVa+w8hSilO9/
	BrkQ==
X-Received: by 10.68.223.34 with SMTP id qr2mr7040874pbc.97.1444873429897;
	Wed, 14 Oct 2015 18:43:49 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:16 -0700
Message-Id: <1444873403-21093-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:49 -0000

The busybox build currently relies on 'make -e' to over-ride CC and
the make command line to over-ride LD. Add CC to the make command line
to make the CC over-ride more explicit and consistent with LD.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 949047b..a4ecfa4 100644
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


