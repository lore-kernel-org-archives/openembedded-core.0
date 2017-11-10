Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60B8878662
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 15:46:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAAFkCIg015676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 07:46:12 -0800
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 10 Nov 2017 07:46:11 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 17:46:10 +0200
Message-ID: <20171110154610.36436-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] icu: CVE-2017-14952
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
X-List-Received-Date: Fri, 10 Nov 2017 15:46:11 -0000
Content-Type: text/plain

Double free in i18n/zonemeta.cpp in International Components for Unicode 
(ICU) for C/C++ through 59.1 allows remote attackers to execute arbitrary 
code via a crafted string, aka a "redundant UVector entry clean up 
function call" issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-14952

Upstream patches:
http://bugs.icu-project.org/trac/changeset/40324/trunk/icu4c/source/i18n/zonemeta.cpp

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-support/icu/icu/CVE-2017-14952.patch | 28 +++++++++++++++++++++++
 meta/recipes-support/icu/icu_59.1.bb              |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2017-14952.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2017-14952.patch b/meta/recipes-support/icu/icu/CVE-2017-14952.patch
new file mode 100644
index 0000000..f759efc
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2017-14952.patch
@@ -0,0 +1,28 @@
+From fc83cd832725d3968011f118637b9f5d212e8717 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 10 Nov 2017 16:51:25 +0200
+Subject: [PATCH] Removed redundant UVector entry clean up function call.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14952
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ i18n/zonemeta.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/i18n/zonemeta.cpp b/i18n/zonemeta.cpp
+index 84a9657..e163b00 100644
+--- a/i18n/zonemeta.cpp
++++ b/i18n/zonemeta.cpp
+@@ -690,7 +690,6 @@ ZoneMeta::createMetazoneMappings(const UnicodeString &tzid) {
+                     mzMappings = new UVector(deleteOlsonToMetaMappingEntry, NULL, status);
+                     if (U_FAILURE(status)) {
+                         delete mzMappings;
+-                        deleteOlsonToMetaMappingEntry(entry);
+                         uprv_free(entry);
+                         break;
+                     }
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/icu/icu_59.1.bb b/meta/recipes-support/icu/icu_59.1.bb
index 31f017b..9fb1be8 100644
--- a/meta/recipes-support/icu/icu_59.1.bb
+++ b/meta/recipes-support/icu/icu_59.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
            file://0001-i18n-Drop-include-xlocale.h.patch \
+           file://CVE-2017-14952.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.10.2


