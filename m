Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7F51F70D61
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 01:33:39 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so4404203pad.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 18:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GGrfcUayWtha4aOVmaqClbldSpkyzyO4IcHZ1VIVewY=;
	b=z1FGNbfmOjU0QrhC5OTEk9XEk1eErjCQyAbFE7gBjb29/Qmla+rrR7XSt3aXBjhWfS
	i1UWrJR0/0KqKLLGiKLehsg9pKTnA8OLRVo3gjOYcYp3vEBMBhHr4iLeXn255XG90XgF
	tkPSdKLti1ZT6ocfxJ4Nqj/BBHWIfhVFxZS7wukwCc8h8jKA5qFIq4zDJn/MHsSmQTMI
	mcIxn7yDUDK/ja1DlgdkJM+pIOPt1530XoyvxPOpKL8ChZJD6Cm+tGyhKtOCc+hBu9T5
	AjKbFNlAd3MtEj1nc/0/14fC9Ejm2TtLy/32I8ZNmvCuyZAATgfM/f0Pwykfxkfyhs1Z
	pDeA==
X-Received: by 10.66.66.198 with SMTP id h6mr6370242pat.72.1408152820792;
	Fri, 15 Aug 2014 18:33:40 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	ln10sm9171124pbc.96.2014.08.15.18.33.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 18:33:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Aug 2014 18:36:50 -0700
Message-Id: <1408153010-14450-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2] openssl: Repace if-else with case and add musl triplet
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
X-List-Received-Date: Sat, 16 Aug 2014 01:33:45 -0000

Simplifies the code and adds knowlwdge about musl targets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |   21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b839c00..3a33702 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -60,17 +60,18 @@ do_configure () {
 	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
 
 	os=${HOST_OS}
-	if [ "x$os" = "xlinux-uclibc" ]; then
+	case $os in
+	linux-uclibceabi |\
+	linux-gnueabi |\
+	linux-uclibcspe |\
+	linux-gnuspe |\
+	linux-musl* |
+        )
 		os=linux
-	elif [ "x$os" = "xlinux-uclibceabi" ]; then
-		os=linux
-	elif [ "x$os" = "xlinux-uclibcspe" ]; then
-		os=linux
-	elif [ "x$os" = "xlinux-gnuspe" ]; then
-		os=linux
-	elif [ "x$os" = "xlinux-gnueabi" ]; then
-		os=linux
-	fi
+		;;
+		*)
+		;;
+	esac
 	target="$os-${HOST_ARCH}"
 	case $target in
 	linux-arm)
-- 
1.7.10.4


