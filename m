Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 39CF576AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:50 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so207614200ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6U6npt/EhbmBMqPFt5cnqg63TV2JvTBU8H8lzaMTyxc=;
	b=c+/pzscWhcGW92UkqMTx9zeaZyxu2p/BCaBjs3FNKs15jrCI1sXhJycionu7tDqd45
	1wvM0dOCamn41hoCNycIYxNiWeUDieeMWJdvRo2kk77lJb69j7DF0soVDWpOozPGO6O8
	rIV2674xkCxVZ9wgEaLUooI1bueq/d4sQX6kv3aNo8JJucuQEl7iaBRYKPkd14rfzf8O
	o2CBB+2+yNa+x8BpQ6eSYnDcYXFI+zM5bgmWbefC2CRR0A7abwdfG1hDhwBU2IV2bEet
	le/+KM9mhIUPyk+dplmPpxb0trxqe0Bd9Wa8+tWS5NGo6OTTTyPiwDeONPAV9cUoKIEy
	W+jw==
X-Received: by 10.107.168.230 with SMTP id e99mr32533861ioj.95.1444101590858; 
	Mon, 05 Oct 2015 20:19:50 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:25 -0700
Message-Id: <1444101568-16639-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/7] busybox.inc: explicitly include CC=${CC} on make command line
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:53 -0000

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


