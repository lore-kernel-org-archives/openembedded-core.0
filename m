Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 400557EDF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:55:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6A2tik5006954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jul 2019 19:55:44 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 9 Jul 2019 19:55:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2019 11:07:57 +0800
Message-ID: <b2caf7c358b671376783c3b7d32a6218ac960f92.1562727995.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562727995.git.Qi.Chen@windriver.com>
References: <cover.1562727995.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] xmlcatalog: hold libxml2-native dependency
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
X-List-Received-Date: Wed, 10 Jul 2019 02:55:43 -0000
Content-Type: text/plain

Put libxml2-native dependency in this class and remove
it from recipes inheriting this class.

In fact, if a recipe inherits this class and does not have
libxml2-native, the xmlcatalog_sstate_postinst would fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/xmlcatalog.bbclass                                     | 2 ++
 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb           | 2 --
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
index 075aef8..ae4811f 100644
--- a/meta/classes/xmlcatalog.bbclass
+++ b/meta/classes/xmlcatalog.bbclass
@@ -1,3 +1,5 @@
+DEPENDS = "libxml2-native"
+
 # A whitespace-separated list of XML catalogs to be registered, for example
 # "${sysconfdir}/xml/docbook-xml.xml".
 XMLCATALOGS ?= ""
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 4b6a28e..6452c8d 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -8,8 +8,6 @@ HOMEPAGE = "http://www.docbook.org/xml/"
 LICENSE = "OASIS"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 
-DEPENDS = "libxml2-native"
-
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
 # upgrading this recipe, please verify whether this is still needed.
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index ff38e87..c5d3a24 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/
 # Reject versions ending in .0 as those are release candidates
 UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\d+)/"
 
-DEPENDS = "libxml2-native"
-
 S = "${WORKDIR}/docbook-xsl-${PV}"
 
 inherit allarch xmlcatalog
-- 
1.9.1


