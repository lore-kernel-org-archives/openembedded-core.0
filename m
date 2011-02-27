Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyb-0007FI-5K
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:41 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800700wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:19 -0800 (PST)
Received: by 10.216.58.130 with SMTP id q2mr3821788wec.57.1298799019152;
	Sun, 27 Feb 2011 01:30:19 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s50sm1284504weh.46.2011.02.27.01.30.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:53 +0100
Message-Id: <840a14075b4c14f43404c4790a6fc2a03033e81a.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 41/50] linuxdoc-tools-native: disable doc builds requriing latex and dvips
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:41 -0000

From: Scott Garman <scott.a.garman@intel.com>

This fixes the following errors during do_install on hosts which have
latex and/or dvips installed:

fmt_latex2e::postASP: LaTeX first run problem. Aborting ...

dvips: ! DVI file can't be opened.

Our goal is to have native versions of these tools eventually. Until
then, disable these parts of the documentation install process.

This fixes [BUGID #774].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../linuxdoc-tools-native/disable_dvips_doc.patch  |   29 ++++++++++++++++++++
 .../linuxdoc-tools-native/disable_tex_doc.patch    |   25 +++++++++++++++++
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb |    6 +++-
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
new file mode 100644
index 0000000..7ac1a1f
--- /dev/null
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
@@ -0,0 +1,29 @@
+Disable building documentation which requires the dvips utility.
+This patch should be dropped once we include a native version of
+dvips.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+diff -urN linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
+--- linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh	2011-02-25 15:26:41.142917782 -0800
++++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-02-25 15:27:25.141917472 -0800
+@@ -52,13 +52,13 @@
+ #	$TMPDIR/sgml2latex --pass="\usepackage{times}" -o dvi ./guide
+ #fi
+ 
+-if [ -n "`which dvips`" ]; then
+-	echo "   + dvips" >&2
+-	dvips -t letter -o ./guide.ps ./guide.dvi
+-	if [ -n "`which gzip`" -a -f ./guide.ps ]; then
+-		gzip -fN ./guide.ps
+-	fi
+-fi
++#if [ -n "`which dvips`" ]; then
++#	echo "   + dvips" >&2
++#	dvips -t letter -o ./guide.ps ./guide.dvi
++#	if [ -n "`which gzip`" -a -f ./guide.ps ]; then
++#		gzip -fN ./guide.ps
++#	fi
++#fi
+ 
+ 
+ echo "- Building info docs" >&2
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
new file mode 100644
index 0000000..f47693b
--- /dev/null
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
@@ -0,0 +1,25 @@
+Disable building documentation which requires the latex utility.
+This patch should be dropped once we include a native version of
+latex.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+diff -urN linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
+--- linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh	2009-11-09 11:58:25.000000000 -0800
++++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-02-25 15:23:58.610016114 -0800
+@@ -46,11 +46,11 @@
+ 	$TMPDIR/sgml2txt -b 1 ./guide
+ fi
+ 
+-if [ -n "`which latex`" ]; then
+-	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2latex
+-	echo "- Building latex docs" >&2
+-	$TMPDIR/sgml2latex --pass="\usepackage{times}" -o dvi ./guide
+-fi
++#if [ -n "`which latex`" ]; then
++#	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2latex
++#	echo "- Building latex docs" >&2
++#	$TMPDIR/sgml2latex --pass="\usepackage{times}" -o dvi ./guide
++#fi
+ 
+ if [ -n "`which dvips`" ]; then
+ 	echo "   + dvips" >&2
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
index f3cd195..ed45ad9 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5fbccc46cff2379505ca4e09c7d6ccfe"
 
 DEPENDS = "openjade-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.tar.gz \
-           file://disable_sgml2rtf.patch"
+           file://disable_sgml2rtf.patch \
+           file://disable_tex_doc.patch \
+           file://disable_dvips_doc.patch"
 
 SRC_URI[md5sum] = "f214e79b0dd084689cd04f18722bd563"
 SRC_URI[sha256sum] = "128cabb52ef8fb2f370ee488ea92bf4d8e49859200c7c8cae807abfe860a62ec"
-- 
1.6.6.1



