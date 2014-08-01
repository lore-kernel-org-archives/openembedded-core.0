Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id A49BD65CD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 11:04:16 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so4157068wes.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Aug 2014 04:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cJ6uVri9PQtnNbLPwD/TDzOTJTV7agZ1lmEQgplWm50=;
	b=JLzuPRAhtoeOfzj8+GSi5NABYAEJ/yDx6h+6nZ5cxw0jey07fXrI7umXjKp4AWLfm7
	FxJQzlqMwK7zvapD6m7PylCiAmuuLOxHlkif1mOgwIAle1+xdl2L63olKsMonT/E8qP5
	yvaxDfe08g32MEb9MmWnR1nIeqC2D75H31w3BJAm5m9CKre1xFIzNoKO3KoV59rmOAms
	mF1/QBO9k9UlY3nAJ+q0qzV0akU0DInx+a5kiq7XEiu7yG4KtF14TEDE8ISPMJLRTlYP
	4GNkcUp4jSX055QHYZNh1/zhhkUH3TQOX5Qld1qXKxf0zkv+jOPXPok+NSUk4CzOjpWb
	WqBA==
X-Gm-Message-State: ALoCoQkadK4Izvqb4J6ahf2UMqIcuBlG9Z8vLxz5f1HSrRhZxnHHBBBMtXnuDmWP103xlEK9PbNH
X-Received: by 10.180.212.12 with SMTP id ng12mr5849876wic.9.1406891055897;
	Fri, 01 Aug 2014 04:04:15 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	rw4sm20127360wjb.44.2014.08.01.04.04.14 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 04:04:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Aug 2014 13:04:00 +0200
Message-Id: <1406891040-8738-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] cups: fix host contamination issue
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
X-List-Received-Date: Fri, 01 Aug 2014 11:04:22 -0000

-I/usr/include would end up in CFLAGS if /usr/bin/gcrypt-config is
present on the host systemd.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...crypt-config-from-the-host-it-leads-to-SS.patch | 28 ++++++++++++++++++++++
 meta/recipes-extended/cups/cups_1.7.4.bb           |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch

diff --git a/meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch b/meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch
new file mode 100644
index 0000000..c37fd0c
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch
@@ -0,0 +1,28 @@
+From bfcc8b85fd1b204a3bb50d7246b3adb6da57da00 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 1 Aug 2014 12:59:38 +0200
+Subject: [PATCH] don't use gcrypt-config from the host, it leads to  SSLFLAGS=-I/usr/include
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Upstream-status: Inapprotiate [OE-specific]
+---
+ configure | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure b/configure
+index 7d1e31d..01cda33 100755
+--- a/configure
++++ b/configure
+@@ -8411,9 +8411,6 @@ fi
+             if $PKGCONFIG --exists gcrypt; then
+ 	        SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
+ 	        SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
+-	    elif test "x$LIBGCRYPTCONFIG" != x; then
+-	        SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
+-	        SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
+ 	    fi
+ 	fi
+     fi
+-- 
+1.9.0
+
diff --git a/meta/recipes-extended/cups/cups_1.7.4.bb b/meta/recipes-extended/cups/cups_1.7.4.bb
index 9dae986..c15facb 100644
--- a/meta/recipes-extended/cups/cups_1.7.4.bb
+++ b/meta/recipes-extended/cups/cups_1.7.4.bb
@@ -2,5 +2,6 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
 
+SRC_URI += "file://0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch"
 SRC_URI[md5sum] = "1a2295c2b2d2f422db2e50f40ed2fb99"
 SRC_URI[sha256sum] = "358fc7f22395a9ba07efcfc0d34a057ab5e9182b6e3297f71263a6b68fb41378"
-- 
1.9.0


