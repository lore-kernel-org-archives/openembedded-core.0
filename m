Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yFw-0004hJ-Vd
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:33:01 +0100
Received: by ghbz2 with SMTP id z2so2294356ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.46.232 as permitted sender) client-ip=10.236.46.232; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.46.232 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.46.232])
	by 10.236.46.232 with SMTP id r68mr35644246yhb.80.1331054664695
	(num_hops = 1); Tue, 06 Mar 2012 09:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wQBL1iO80jf5oOB/eqhc2R/U7DRAE9aoirB6bG+Nm4I=;
	b=b68UA675SDmocavRMx2Yyf+lZueBwXU0IkMeRZhj6WP3p9LxLAbT76qFRmuUl/VBtM
	nuJ18K6TTuxVHLMq7so8l5ou+sM0elOYgbVlI1ILFkWe0+4dsRqE9rucq7eiLR4C/kiT
	FHZRK7SkcdNA6ITgyikxvOkZU1isqROAXS7eddvZ1Fo0/1NUArq7+ceZxmaa3HRSPmCA
	ivUUfodkQ5pZFKsmVoh3czcm/fVaG1B7Jc/CN+F80GHS9udLW1xATG4lMOQD7JWmo/CQ
	x/KMDQmvrV7pP/tp8nH3tKAQxptZ0Pzwq6Ozrk16OgMWFUJj5W9vADrIPG1/Fmls+WvB
	yqQQ==
Received: by 10.236.46.232 with SMTP id r68mr28213291yhb.80.1331054664615;
	Tue, 06 Mar 2012 09:24:24 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm50620004yhj.7.2012.03.06.09.24.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:24:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:24:11 +0000
Message-Id: <099e3eae09cd7f6e65e6c6c98e5178404f7e7d97.1331054558.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
Subject: [PATCH v2 1/5] run-postinsts: fix opkg data path
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
X-List-Received-Date: Tue, 06 Mar 2012 17:33:01 -0000

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



