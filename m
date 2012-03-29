Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SD9bF-0001K4-66
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:16:49 +0200
Received: by localhost (Postfix, from userid 1000)
	id 06CE3440C25; Thu, 29 Mar 2012 08:59:07 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:58:36 +0200
Message-Id: <1333004316-6877-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH] docbook-utils-native: fix syntax problem in jw.in
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
X-List-Received-Date: Thu, 29 Mar 2012 07:16:49 -0000

Fix runtime error occurred e.g. with docbook-to-man calls:

  grep: character class syntax is [[:space:]], not [:space:]
  grep: character class syntax is [[:space:]], not [:space:]
  jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".

See also:

   <https://qa.mandriva.com/show_bug.cgi?id=61127>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../docbook-utils/docbook-utils-0.6.14/re.patch    |   15 +++++++++++++++
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |    7 +++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch

diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
new file mode 100644
index 0000000..1e53389
--- /dev/null
+++ b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
@@ -0,0 +1,15 @@
+diff -Nurd docbook-utils-0.6.14-orig/bin/jw.in docbook-utils-0.6.14/bin/jw.in
+--- docbook-utils-0.6.14-orig/bin/jw.in	2012-03-29 07:50:00.789564826 +0200
++++ docbook-utils-0.6.14/bin/jw.in	2012-03-29 07:52:10.371302967 +0200
+@@ -80,9 +80,9 @@
+ SGML_CATALOGS_DIR="/etc/sgml"
+ if [ -f "$SGML_CONF" ]
+ then
+-  RE='^[:space:]*SGML_BASE_DIR[:space:]*=[:space:]*'
++  RE='^[[:space:]]*SGML_BASE_DIR[[:space:]]*=[[:space:]]*'
+   SGML_BASE_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
+-  RE='^[:space:]*SGML_CATALOGS_DIR[:space:]*=[:space:]*'
++  RE='^[[:space:]]*SGML_CATALOGS_DIR[[:space:]]*=[[:space:]]*'
+   SGML_CATALOGS_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
+ fi
+ 
diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
index c2ccef3..47a6167 100644
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -7,9 +7,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz"
+SRC_URI = "\
+	ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz \
+	file://re.patch \
+"
 
 SRC_URI[md5sum] = "6b41b18c365c01f225bc417cf632d81c"
 SRC_URI[sha256sum] = "48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9"
-- 
1.7.7



