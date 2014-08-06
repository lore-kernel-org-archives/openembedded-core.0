Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id C4343609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:07:33 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so3228856pde.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=a6qAeMRzxZVj6GosQTFjKH54gqh1MGjlHNmkRU3XUs8=;
	b=qfSVZSK7LYcdMWaKwW8s09zCV4EHjzoQdvIYCvbaf8aqzIRIUAIYKbA/rgs5ASmHe3
	FLu5vjPL641dQTibbNXbqUOFv/r88iydY6qVfxoUB0KJPuV7BYdM809PNYDl6CHVOa01
	5plsME0wcY942ZqtLdzvK7R/IC5SGhEFq965tRMWcWTu0aNQ/E+bUBGuw3O2V7CaVHpQ
	V25VQfjmyzuTlC8LrRIm9ofNzS2aj9ONA9ofNSkgYpr5S4uzuO6vJTIp6E2sDo7RCkSV
	rtgaL0fJAhlfE0K7yX+OO6PiYTMhyEkmETwSMmfOADW1zijgVValiE9CBBS0wleKkJw+
	RK/A==
X-Received: by 10.68.95.225 with SMTP id dn1mr10938667pbb.126.1407326855307;
	Wed, 06 Aug 2014 05:07:35 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id i2sm1470774pdk.70.2014.08.06.05.07.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 05:07:34 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 17:34:09 +0530
Message-Id: <1407326649-7117-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Wed, 06 Aug 2014 12:07:36 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This is needed to deal with the situation where we're using ipk packaging, so
opkg-utils must be built regardless of what update-alternatives provider we
prefer. The downside to the current implementation is the need to adjust
PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that way.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 693c216..952fce4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -19,11 +19,17 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 PYTHONRDEPS_class-native = ""
 
-PACKAGECONFIG = "python"
+PACKAGECONFIG = "python update-alternatives"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
+PACKAGECONFIG[update-alternatives] = ",,,"
+
+PROVIDES_remove = "${@'virtual/update-alternatives' if 'update-alternatives' not in PACKAGECONFIG.split() else ''}"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+        if ${@'true' if 'update-alternatives' not in PACKAGECONFIG.split() else 'false'}; then
+            rm -f "${D}${bindir}/update-alternatives"
+        fi
 }
 
 PACKAGES =+ "update-alternatives-opkg"
-- 
1.8.4


