Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC9060DF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:48:08 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so1345582pab.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9OsCVpfC1p3Dr82CXnYszJs+AQrczQixoRL+sHs1DrM=;
	b=bdk6XffN3ytRZcWBBAMcX6mHU2G5aPkEViVq3JH80A/wdoMblvAiFR6DNAJSZ0U+9E
	mpJhDBHVYsL0MGKxNWI762sjXQdGM/Orc5MuKCzYSMyWxphibkJws8fJEzBYrYeI8wVn
	gJNSYbsz6/EcdE0N+XivzirnpCm2wqVRm2fkJIFBS/fV4/a/upJcEtcJPPjSu5mfstRt
	s4r/DRhmVMEEWeBOXHZ2ZxRO4NELb4iUL0AyUitXFg8BgzldZMumZKYLr8lr8FKsm2wS
	QUWYn5CPYKKfUYRV0KLcMQk++GzaTdd1yRM+/rH44vydGR+fTaCUIzsxqgC2K/H/5AtO
	NiFQ==
X-Received: by 10.66.121.197 with SMTP id lm5mr3132779pab.118.1408009689232;
	Thu, 14 Aug 2014 02:48:09 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	a11sm15807991pat.36.2014.08.14.02.48.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 02:48:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 02:51:22 -0700
Message-Id: <1408009882-28210-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] openssl: Repace if-else with case and add musl triplet
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
X-List-Received-Date: Thu, 14 Aug 2014 09:48:08 -0000

Simplifies the code and adds knowlwdge about musl targets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |   18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b839c00..e585dbb 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -60,17 +60,15 @@ do_configure () {
 	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
 
 	os=${HOST_OS}
-	if [ "x$os" = "xlinux-uclibc" ]; then
+	case $os in
+	linux-uclibc* |\
+	linux-musl* |\
+	linux-gnu*)
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


