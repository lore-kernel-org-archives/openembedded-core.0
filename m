Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18ACC70D4E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 01:41:06 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so4188522pdj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QkpsbJJy5rjZeerV5f3Vfyjryx3maMKd3Uj3HE4nexo=;
	b=uC2lV5oak0TEYcaNZkAoyBgjRNFjHcjKXzR7uCDlmZajwjzDCz1xqAiQa+LBwpViEc
	lCA4WMkeRivV+fP1/toZ9CnJroRdOhdnEdmX/jA4OHqSnORA511tT8Gczt5Bfi/HSMS7
	809TEXJnE3Wj79qtPQjuHtTY1CzIv2G5LAHIbeqH9yDRJCBNcOpaJEaJGAQHvxcLBuBX
	J6GksV1ODvfhAX3FrpKeqmSq79IU3m2DQqtjbfjsNbr3moKiHm9jg/maI5AR4L2WHI/O
	knSV5hJDv9pNwNV9W8aXFoa5lRUeq12Z/tkqYcBbEaufWDOGsQJdIW9ne7EYBQ3+YmAO
	DGSw==
X-Received: by 10.66.66.202 with SMTP id h10mr16796440pat.70.1408153267392;
	Fri, 15 Aug 2014 18:41:07 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id px5sm9197723pbc.23.2014.08.15.18.41.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 18:41:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Aug 2014 18:44:16 -0700
Message-Id: <1408153456-15502-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V3] openssl: Repace if-else with case and add musl triplet
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
X-List-Received-Date: Sat, 16 Aug 2014 01:41:08 -0000

Simplifies the code and adds knowlwdge about musl targets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b839c00..a99953e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -60,17 +60,17 @@ do_configure () {
 	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
 
 	os=${HOST_OS}
-	if [ "x$os" = "xlinux-uclibc" ]; then
+	case $os in
+	linux-uclibceabi |\
+	linux-gnueabi |\
+	linux-uclibcspe |\
+	linux-gnuspe |\
+	linux-musl*)
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


