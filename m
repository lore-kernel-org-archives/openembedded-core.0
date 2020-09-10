Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.16933.1599725444938724898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 01:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08A8Ahxs014016
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 01:10:44 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 01:10:43 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [zeus][PATCH] libxml2: Fix CVE-2020-24977
Date: Thu, 10 Sep 2020 11:10:07 +0300
Message-ID: <20200910081007.24685-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910081007.24685-1-ovidiu.panait@windriver.com>
References: <20200910081007.24685-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c. The issue has
been fixed in commit 8e7c20a1 (20910-GITv2.9.10-103-g8e7c20a1).

Reference:
https://gitlab.gnome.org/GNOME/libxml2/-/issues/178

Upstream patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../libxml/libxml2/CVE-2020-24977.patch       | 41 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.9.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
new file mode 100644
index 0000000000..8224346660
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
@@ -0,0 +1,41 @@
+From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 7 Aug 2020 21:54:27 +0200
+Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
+
+Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
+array access.
+
+Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
+the report.
+
+Fixes #178.
+
+CVE: CVE-2020-24977
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ xmllint.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xmllint.c b/xmllint.c
+index f6a8e463..c647486f 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -528,6 +528,12 @@ static void
+ xmlHTMLEncodeSend(void) {
+     char *result;
+ 
++    /*
++     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
++     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
++     * an out-of-bounds read.
++     */
++    memset(&buffer[sizeof(buffer)-4], 0, 4);
+     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
+     if (result) {
+ 	xmlGenericError(xmlGenericErrorContext, "%s", result);
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
index 1d898ab020..ff496ccfaf 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://Fix-CVE-2019-19956.patch \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
+           file://CVE-2020-24977.patch \
            "
 
 SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
-- 
2.17.1

