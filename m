Return-Path: <mdurnev@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id C035F6E7AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:28:18 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so6861743pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 22:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6NqPThKkBiAW7a9Z8iJBtP6l0ckKoTSt90JVEPeDA7U=;
	b=KaGUlFQsnfE0iFJfAC0nOlFJbPGkEk772ebDXk233JFuNV2KzUwv7esP7j7efHEk6+
	jh6tQb3ck7yZsTfAmel92UxiyMBNtuuCMXEJ6sY0SuyLqqP+8cN+HLUQF528D2HTO65W
	lA3YIA2MUZIhHSrmWX8jVM7F/r58UOxu/UqsoMqdi4J7sKuyq5iAALoyYud3/onrYlF3
	qt1EiB7zvs00AYbf0wonVVZ3RmdSFfFwEhDZmoKKYtPOKWG/qo8y3vuq5bZ4Gz01uEZ0
	9uJskiANKchoLQKePJDqjVy2o6HdzPbwGyKJdEuJbYt+UVqPx1vqBCYXg974GMoED6cq
	/QLw==
X-Received: by 10.68.34.37 with SMTP id w5mr7260315pbi.159.1390890499516;
	Mon, 27 Jan 2014 22:28:19 -0800 (PST)
Received: from workstation.mgc.mentorg.com (86-102-16-90.xdsl.primorye.ru.
	[86.102.16.90]) by mx.google.com with ESMTPSA id
	ns7sm38497476pbc.32.2014.01.27.22.28.16 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Jan 2014 22:28:18 -0800 (PST)
From: mdurnev@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 17:28:04 +1100
Message-Id: <1390890484-2078-1-git-send-email-Mikhail_Durnev@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] unzip: Pass LDFLAGS to the linker
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
X-List-Received-Date: Tue, 28 Jan 2014 06:28:18 -0000

From: Mikhail Durnev <Mikhail_Durnev@mentor.com>

Change Makefile to use LDFLAGS

Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
---
 .../unzip/unzip/define-ldflags.patch               |   16 ++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |    5 +++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/unzip/unzip/define-ldflags.patch

diff --git a/meta/recipes-extended/unzip/unzip/define-ldflags.patch b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
new file mode 100644
index 0000000..a3e5178
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
@@ -0,0 +1,16 @@
+Pass LDFLAGS to the linker 
+
+Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
+
+diff -Naur old/unix/configure new/unix/configure
+--- old/unix/configure	2014-01-13 21:59:27.000000000 +1100
++++ new/unix/configure	2014-01-14 16:36:02.000000000 +1100
+@@ -16,7 +16,7 @@
+ CFLAGSR=${CFLAGS}
+ IZ_BZIP2=${3}
+ CFLAGS="${CFLAGS} -I. -DUNIX"
+-LFLAGS1=""
++LFLAGS1=${LDFLAGS}
+ LFLAGS2=""
+ LN="ln -s"
+ 
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 584802a..33c20f8 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -4,10 +4,11 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
-	file://avoid-strip.patch"
+	file://avoid-strip.patch \
+	file://define-ldflags.patch"
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
-- 
1.7.9.5


