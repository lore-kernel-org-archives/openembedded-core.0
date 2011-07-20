Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qjd8p-000072-N0
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:13:12 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KK91Mh020211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:09:02 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:08:57 -0700
Message-Id: <bfcf9c70069a2fd92c20452e08efc78bbd5f1045.1311192464.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
Subject: [PATCH 2/5] gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
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
X-List-Received-Date: Wed, 20 Jul 2011 20:13:12 -0000

In oe.dev we can just sed over the binary but in newer versions of this
program we need to fix the in use copy too.  As noted in the patch header,
this isn't appropriate for upstream as it could change behavior on Windows.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../use-usr-bin-env-for-python-in-xml2po.patch     |   33 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    5 ++-
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
new file mode 100644
index 0000000..a285ad2
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
@@ -0,0 +1,33 @@
+Upstream-Status="Inappropriate [Would break behavior on Windows]"
+
+We can't use #!/full/path/to/python -u as this can be longer than shebang
+allows for.  In order to be appropraite for upstream more work would be
+needed to make sure that the main xml2po code doesn't rely on python
+being invoked with -u (force stdin/out/err to be used raw).
+---
+ xml2po/xml2po/Makefile.am  |    1 -
+ xml2po/xml2po/xml2po.py.in |    2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+Index: gnome-doc-utils-0.20.6/xml2po/xml2po/Makefile.am
+===================================================================
+--- gnome-doc-utils-0.20.6.orig/xml2po/xml2po/Makefile.am
++++ gnome-doc-utils-0.20.6/xml2po/xml2po/Makefile.am
+@@ -7,7 +7,6 @@ CLEANFILES = xml2po
+ 
+ xml2po: xml2po.py.in
+ 	sed -e "s/^VERSION =.*/VERSION = \"@VERSION@\"/" \
+-	    -e "s+^#!.*python.*+#!$(PYTHON)+" \
+ 	  < $(srcdir)/xml2po.py.in > xml2po
+ 	chmod +x xml2po
+ 
+Index: gnome-doc-utils-0.20.6/xml2po/xml2po/xml2po.py.in
+===================================================================
+--- gnome-doc-utils-0.20.6.orig/xml2po/xml2po/xml2po.py.in
++++ gnome-doc-utils-0.20.6/xml2po/xml2po/xml2po.py.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python -u
++#!/usr/bin/env python
+ # -*- encoding: utf-8 -*-
+ # Copyright (c) 2004, 2005, 2006 Danilo Šegan <danilo@gnome.org>.
+ # Copyright (c) 2009 Claude Paroz <claude@2xlibre.net>.
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 4554122..1ec1076 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,9 +1,10 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r3"
+PR = "r4"
 
-SRC_URI += "file://xsltproc_nonet.patch"
+SRC_URI += "file://xsltproc_nonet.patch \
+	    file://use-usr-bin-env-for-python-in-xml2po.patch"
 
 SRC_URI[archive.md5sum] = "8f6e05071599bc073007830ea0a68391"
 SRC_URI[archive.sha256sum] = "091486e370480bf45349ad09dac799211092a02938b26a0d68206172cb6cebbf"
-- 
1.7.0.4



