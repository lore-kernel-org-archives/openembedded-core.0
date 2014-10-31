Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BADF71EC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 09:03:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V93E22005854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:03:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 02:03:13 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 16:59:54 +0800
Message-ID: <87c7048c7f4e76d71ad69f436cbc6642a24c3649.1414745908.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414745908.git.Chong.Lu@windriver.com>
References: <cover.1414745908.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] docbook-xsl-stylesheets: add perl to RDEPENDS
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
X-List-Received-Date: Fri, 31 Oct 2014 09:03:14 -0000
Content-Type: text/plain

This solves the following warning:

docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires /usr/bin/perl,
/bin/bash, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...-stylesheets-no-bashism-in-docbook-xsl-up.patch | 24 ++++++++++++++++++++++
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch
new file mode 100644
index 0000000..0559a5c
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch
@@ -0,0 +1,24 @@
+docbook-xsl-stylesheets: no bashism in docbook-xsl-update
+
+The checkbashisms shows there is no bashism, so use /bin/sh.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ tools/bin/docbook-xsl-update | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/bin/docbook-xsl-update b/tools/bin/docbook-xsl-update
+index aba0016..cc73aa2 100755
+--- a/tools/bin/docbook-xsl-update
++++ b/tools/bin/docbook-xsl-update
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # vim: number
+ 
+ # docbook-xsl-update - Update environment to latest docbook-xsl snapshot
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 39528c8..95498da 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6eeeed43d498c22a835382533356462"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
            file://docbook-xsl.xml \
+           file://docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch \
 "
 
 SRC_URI[md5sum] = "6dd0f89131cc35bf4f2ed105a1c17771"
@@ -63,5 +64,6 @@ docbook_xsl_stylesheets_sysroot_preprocess () {
     sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
 }
 
+RDEPENDS_${PN} += "perl"
 FILES_${PN} = "${datadir}/xml/* ${sysconfdir}/xml/docbook-xsl.xml"
 FILES_${PN}-doc = "${datadir}/doc/*"
-- 
1.9.1


