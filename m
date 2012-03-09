Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62hi-0002vM-2N
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:30:06 +0100
Received: by ghbz2 with SMTP id z2so914506ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wQBL1iO80jf5oOB/eqhc2R/U7DRAE9aoirB6bG+Nm4I=;
	b=0CHjt9sWD2jkh2CnUiYlBqb7GArvQ17bEMyPu6mmMYV8vcl3QsNG3H2xIzAyujqYGc
	h/zVwXOz+x1PhXIjsWh1d3CCBNNEPmJEKrMxPoGFNkuL0ToVG3HvbxStr0O4ff3PPgWV
	ty8EdHVBelDx7nY88SwstbXXXsD5d5y/eSglgDcWHKuGAhaNu4V8c6ZZEHXm3D+bCrNK
	TcMSN3i8Npefq2kbEQ6Kw0h4IlLTGNVR1V/7oSsOB92tNy80xW8TgULrD+Qqt41qec5H
	3tH8FPylNbZTqweatC/vLVlQj7oQcV6+iq10GnREwLKgcIdriH95fYJuR6OG5MlkOK1e
	VXoA==
Received: by 10.236.154.232 with SMTP id h68mr3164085yhk.51.1331310086329;
	Fri, 09 Mar 2012 08:21:26 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm15000143yhj.7.2012.03.09.08.21.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:21:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:21:12 +0000
Message-Id: <7bfc0d456c6616249860ffe2fd503eb54e34bb99.1331310044.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
Subject: [PATCH 1/6] run-postinsts: fix opkg data path
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
X-List-Received-Date: Fri, 09 Mar 2012 16:30:06 -0000

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



