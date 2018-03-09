Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AC77F7890D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:02:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651850"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:02:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:39 +0200
Message-Id: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 01/36] pciutils: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:02:54 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/pciutils/pciutils/configure.patch | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index 55edfea3f61..a7e445733a8 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -13,11 +13,11 @@ Ionut Radu <ionutx.radu@intel.com>
 
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: pciutils-3.5.4/Makefile
+Index: pciutils-3.5.6/Makefile
 ===================================================================
---- pciutils-3.5.4.orig/Makefile
-+++ pciutils-3.5.4/Makefile
-@@ -96,7 +95,7 @@ example: example.o lib/$(PCILIB)
+--- pciutils-3.5.6.orig/Makefile
++++ pciutils-3.5.6/Makefile
+@@ -96,7 +96,7 @@ example: example.o lib/$(PCILIB)
  example.o: example.c $(PCIINC)
  
  %: %.o
@@ -26,12 +26,12 @@ Index: pciutils-3.5.4/Makefile
  
  %.8 %.7: %.man
  	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
-Index: pciutils-3.5.4/lib/configure
+Index: pciutils-3.5.6/lib/configure
 ===================================================================
---- pciutils-3.5.4.orig/lib/configure
-+++ pciutils-3.5.4/lib/configure
-@@ -14,6 +14,10 @@ echo_n() {
- 	fi
+--- pciutils-3.5.6.orig/lib/configure
++++ pciutils-3.5.6/lib/configure
+@@ -9,6 +9,10 @@ echo_n() {
+ 	printf '%s' "$*"
  }
  
 +VERSION=$1
@@ -41,7 +41,7 @@ Index: pciutils-3.5.4/lib/configure
  if [ -z "$VERSION" -o -z "$IDSDIR" ] ; then
  	echo >&2 "Please run the configure script from the top-level Makefile"
  	exit 1
-@@ -21,8 +25,8 @@ fi
+@@ -16,8 +20,8 @@ fi
  
  echo_n "Configuring libpci for your system..."
  if [ -z "$HOST" ] ; then
@@ -52,7 +52,7 @@ Index: pciutils-3.5.4/lib/configure
  	realsys="$sys"
  	if [ "$sys" = "AIX" -a -x /usr/bin/oslevel -a -x /usr/sbin/lsattr ]
  	then
-@@ -30,7 +34,7 @@ if [ -z "$HOST" ] ; then
+@@ -25,7 +29,7 @@ if [ -z "$HOST" ] ; then
  		proc=`/usr/sbin/lsdev -C -c processor -S available -F name | head -1`
  		cpu=`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
  	else
@@ -61,7 +61,7 @@ Index: pciutils-3.5.4/lib/configure
  	fi
  	if [ "$sys" = "GNU/kFreeBSD" -o "$sys" = "DragonFly" ]
  	then
-@@ -40,7 +44,7 @@ if [ -z "$HOST" ] ; then
+@@ -35,7 +39,7 @@ if [ -z "$HOST" ] ; then
  	then
  		sys=cygwin
  	fi
@@ -70,7 +70,7 @@ Index: pciutils-3.5.4/lib/configure
  fi
  [ -n "$RELEASE" ] && rel="${RELEASE}"
  # CAVEAT: tr on Solaris is a bit weird and the extra [] is otherwise harmless.
-@@ -49,6 +53,8 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^
+@@ -44,6 +48,8 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^
  sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
  echo " $host $rel $cpu $sys"
  
-- 
2.16.1


