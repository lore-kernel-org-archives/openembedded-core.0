Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWz-0006xt-Fl
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 7EB1C3133B; Tue,  5 Jul 2011 23:51:26 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:18 +0100
Message-Id: <1b44053f6c4ac33d5058183e6634b1ba831ae601.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 17/17] chrpath: Ensure the package respects the docdir variable
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

This resolves unpackaged file QA warnings and an empty -doc package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../chrpath/chrpath/standarddoc.patch              |   19 +++++++++++++++++++
 meta/recipes-devtools/chrpath/chrpath_0.13.bb      |    5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/chrpath/chrpath/standarddoc.patch

diff --git a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
new file mode 100644
index 0000000..f96f104
--- /dev/null
+++ b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending
+
+autoconf/automake set docdir automatically, use their value ensuring 
+doc files are placed into $datadir/doc, not $prefix/doc.
+
+RP 5/7/2011
+
+Index: chrpath-0.13/Makefile.am
+===================================================================
+--- chrpath-0.13.orig/Makefile.am	2011-07-05 23:40:14.769920254 +0100
++++ chrpath-0.13/Makefile.am	2011-07-05 23:40:19.819920635 +0100
+@@ -1,7 +1,5 @@
+ SUBDIRS = testsuite deb
+ 
+-docdir = $(prefix)/doc/$(PACKAGE)-$(VERSION)
+-
+ doc_DATA = AUTHORS COPYING ChangeLog INSTALL NEWS README
+ 
+ bin_PROGRAMS = chrpath
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.13.bb b/meta/recipes-devtools/chrpath/chrpath_0.13.bb
index 200f444..d65725e 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.13.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.13.bb
@@ -4,9 +4,10 @@ looks for libraries) in an application. It does not (yet) allow you to add an \
 rpath if there isn't one already."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r2"
+PR = "r3"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/c/chrpath/chrpath_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/c/chrpath/chrpath_${PV}.orig.tar.gz \
+        file://standarddoc.patch"
 
 SRC_URI[md5sum] = "b73072a8fbba277558c50364b65bb407"
 SRC_URI[sha256sum] = "c1aa5342eac0daad81b8da05aa282ae1ccd6f68bc75ca94064304f541eed071b"
-- 
1.7.4.1



