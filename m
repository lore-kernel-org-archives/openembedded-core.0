Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F04CF6012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 10:35:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAQAZV55014267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:35:32 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 Nov 2015 02:35:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 02:35:30 -0800
Message-ID: <ffc91bbcddb6b8806c4e4aacaaaf8ea122adc1c1.1448534065.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448534065.git.liezhi.yang@windriver.com>
References: <cover.1448534065.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: fix for N32 MIPS64
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
X-List-Received-Date: Thu, 26 Nov 2015 10:35:32 -0000
Content-Type: text/plain

It is 'N32 MIPS64', not 'N32 MIPS32' as command file shows:
$ file image/usr/bin/getent
getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]

And "rpm -qp --filecolor" was wrong (it was 1, but should be 4), which
caused multilib installation error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 3 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
new file mode 100644
index 0000000..a516574
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
@@ -0,0 +1,34 @@
+From 16dc683aa50be9789d1674734b06a8a955ff22ad Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 26 Nov 2015 01:36:40 -0800
+Subject: [PATCH] lib/rpmfc.c: fix for N32 MIPS64
+
+It is 'N32 MIPS64', not 'N32 MIPS32' as command file shows:
+$ file image/usr/bin/getent
+getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]
+
+And "rpm -qp --filecolor" was wrong (it was 1, but should be 4).
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/rpmfc.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpmfc.c b/lib/rpmfc.c
+index fde00c7..49779f8 100644
+--- a/lib/rpmfc.c
++++ b/lib/rpmfc.c
+@@ -575,7 +575,7 @@ static struct rpmfcTokens_s rpmfcTokens[] = {
+   { " not stripped",		RPMFC_NOTSTRIPPED },
+   { " archive",			RPMFC_ARCHIVE },
+ 
+-  { "MIPS, N32 MIPS32",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
++  { "MIPS, N32 MIPS64",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
+   { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
+   { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 951b251..0d14728 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -111,6 +111,7 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
 	   file://rpm-rpmpgp-fix.patch \
 	   file://rpm-disable-Wno-override-init.patch \
 	   file://rpm-realpath.patch \
+	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 3930410..8e1d3cb 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -101,6 +101,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
 	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
 	   file://0001-define-EM_AARCH64.patch \
+	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.9.5


