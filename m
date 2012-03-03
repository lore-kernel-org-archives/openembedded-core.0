Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3t45-0000cK-Hr
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 18:48:17 +0100
Received: by yhjj56 with SMTP id j56so1170022yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 09:39:44 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.78.201 as permitted sender) client-ip=10.236.78.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.78.201 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.78.201])
	by 10.236.78.201 with SMTP id g49mr20136029yhe.33.1330796384900
	(num_hops = 1); Sat, 03 Mar 2012 09:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wQBL1iO80jf5oOB/eqhc2R/U7DRAE9aoirB6bG+Nm4I=;
	b=Qt54ZB/YveFnKGpHd5YkbOyuD+J8SzseQCTaIS/jOJai0+X7qJK7kfalwshWWi5hRe
	8JmjceivLcws16NKNyx4u3pREyfZYk7+u5hJY17lUStu/xuMjQ9sQMqbOww+glRIkjdw
	R2WsJ9c/84OIc43lkfKeckztOFjjF52wzNBqzMuRIKAQvmRI9MUHg7M3Y7R5T9yFSFOe
	ZLq80y4rNOp/RyP5q8Isi0lm73H6KdPdjr5q9ssx0JkGB1NV4bbvAkX0ylRNLZDW9NB4
	ff82QSvPU4UfGIM7GPyFcMsk2Aa3J0TWhfVLV7FYSHx2nR926QjZmKKUArAG654yROZg
	oaDA==
Received: by 10.236.78.201 with SMTP id g49mr15963306yhe.33.1330796384857;
	Sat, 03 Mar 2012 09:39:44 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o11sm15284275anl.11.2012.03.03.09.39.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 09:39:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2012 17:39:31 +0000
Message-Id: <e0a83d8e1e13af1705b0c713c227e46209a97623.1330796256.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
Subject: [PATCH 1/4] run-postinsts: fix opkg data path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 17:48:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dpkg/run-postinsts/run-postinsts               |    4 ++--
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
index 584a92e..5f6442c 100755
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
@@ -8,8 +8,8 @@
 PKGSYSTEM=/var/lib/dpkg
 
 if [ ! -e $PKGSYSTEM/status ]; then
-  if [ -e /usr/lib/opkg/status ]; then
-    PKGSYSTEM=/usr/lib/opkg
+  if [ -e /var/lib/opkg/status ]; then
+    PKGSYSTEM=/var/lib/opkg
   else
     echo "No package system found"
     exit 1
diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
index d92200b..18a0492 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
@@ -11,7 +11,7 @@ BEGIN {
   if (rc==0)
     pkgdir="/var/lib/dpkg/info"
   else
-    pkgdir="/usr/lib/opkg/info"
+    pkgdir="/var/lib/opkg/info"
   package=""
 }
 /Package:.*/ {
diff --git a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
index f8f3368..7438a10 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Run postinstall scripts on device using awk"
 SECTION = "devel"
-PR = "r7"
+PR = "r8"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
1.7.2.5



