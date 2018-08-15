Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB52C790EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:43:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7F9hPGH008189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 02:43:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 02:43:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2018 17:43:24 +0800
Message-ID: <1534326204-395700-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] unzip: fix CVE-2018-1000035
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
X-List-Received-Date: Wed, 15 Aug 2018 09:43:25 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../unzip/0001-unzip-fix-CVE-2018-1000035.patch    | 46 ++++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch b/meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch
new file mode 100644
index 0000000..d82c53a
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/0001-unzip-fix-CVE-2018-1000035.patch
@@ -0,0 +1,46 @@
+From 349f566e6e757458843fa164a0f0584280e1501e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 15 Aug 2018 16:20:53 +0800
+Subject: [PATCH] unzip: fix CVE-2018-1000035
+
+Upstream-Status: Backport
+
+backport from unzip6.10c23
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ fileio.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/fileio.c b/fileio.c
+index 36bfea3..7605a29 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -1582,6 +1582,8 @@ int UZ_EXP UzpPassword (pG, rcnt, pwbuf, size, zfn, efn)
+     int r = IZ_PW_ENTERED;
+     char *m;
+     char *prompt;
++    char *ep;
++    char *zp;
+ 
+ #ifndef REENTRANT
+     /* tell picky compilers to shut up about "unused variable" warnings */
+@@ -1590,9 +1592,12 @@ int UZ_EXP UzpPassword (pG, rcnt, pwbuf, size, zfn, efn)
+ 
+     if (*rcnt == 0) {           /* First call for current entry */
+         *rcnt = 2;
+-        if ((prompt = (char *)malloc(2*FILNAMSIZ + 15)) != (char *)NULL) {
+-            sprintf(prompt, LoadFarString(PasswPrompt),
+-                    FnFilter1(zfn), FnFilter2(efn));
++        zp = FnFilter1( zfn);
++        ep = FnFilter2( efn);
++        prompt = (char *)malloc(    /* Slightly too long (2* "%s"). */
++         sizeof( PasswPrompt)+ strlen( zp)+ strlen( ep));
++        if (prompt != (char *)NULL) {
++            sprintf(prompt, LoadFarString(PasswPrompt), zp, ep);
+             m = prompt;
+         } else
+             m = (char *)LoadFarString(PasswPrompt2);
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index dbf4112..a47491e 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://18-cve-2014-9913-unzip-buffer-overflow.patch \
 	file://19-cve-2016-9844-zipinfo-buffer-overflow.patch \
 	file://symlink.patch \
+	file://0001-unzip-fix-CVE-2018-1000035.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.7.4


