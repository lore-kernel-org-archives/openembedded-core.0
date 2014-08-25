Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 14DE3617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 07:57:19 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so12560853wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 00:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OCxeqlVMAFUrsvgXVr0oI9O+s4U56LrUYJq8VjbCamY=;
	b=RMAbjY7bk2LlUj/6gj33VhBhP7OSAlHt4sLGLprIaX4zdEHfKadseHI+OlImGlTD+z
	btWn82yT/yd4mlTMNHcOd0PrFILTcVG9JB71ltnG/QUQwwHBxaAe9aocdJ/J5z4NYWWe
	f8yMq3L0Bb17sgByYVpT34MyRRBSA2hWVZRm8G94xKZmz9o5QhiR7nTi4UtMLHxT0qvs
	cRbQ92obhtaQFbJSfUzCbggnsC0WMT+5DRv/tE56IUhdTdCwO5YzX3S00EtfXyLfdw2y
	BD4hbykyEMaxLnT9aqC50cAZ10MjZSkv7aYsFX9Fly3HO614c1fE10f+ju6OZKq/aynT
	4Lhw==
X-Received: by 10.180.21.141 with SMTP id v13mr13831120wie.48.1408953440671;
	Mon, 25 Aug 2014 00:57:20 -0700 (PDT)
Received: from localhost.localdomain (pD9F9BCF9.dip0.t-ipconnect.de.
	[217.249.188.249]) by mx.google.com with ESMTPSA id
	fa10sm41381107wjd.42.2014.08.25.00.57.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 00:57:19 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 09:56:31 +0200
Message-Id: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Cc: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH] md5deep: Add Recipe for md5deep package version 4.4
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
X-List-Received-Date: Mon, 25 Aug 2014 07:57:26 -0000

I need to build hashdeep/md5deep within OE to include it in my images. This recipe enables OE to cross-compile md5deep. I needed to add the patch as do_configure_qa is complaining about cross-compilation errors otherwise. I added a pull request for the issue with the variable expansion to hashdeep as well.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../md5deep/files/wrong-variable-expansion.patch   | 39 ++++++++++++++++++++++
 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    | 16 +++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
 create mode 100644 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb

diff --git a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
new file mode 100644
index 0000000..3a4c4f4
--- /dev/null
+++ b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
@@ -0,0 +1,39 @@
+--- a/configure.ac	2014-08-22 12:22:54.290884351 +0200
++++ b/configure.ac	2014-08-22 12:23:15.822306295 +0200
+@@ -42,18 +42,6 @@
+      ;;		 		     
+ esac
+ 
+-
+-# Bring additional directories where things might be found into our
+-# search path. I don't know why autoconf doesn't do this by default
+-if test x"${mingw}" == "xno" ; then
+-  for spfx in /usr/local /opt/local /sw ; do
+-    echo checking ${spfx}/include
+-    if test -d ${spfx}/include; then
+-        CPPFLAGS="-I${spfx}/include $CPPFLAGS"
+-        LDFLAGS="-L${spfx}/lib $LDFLAGS"
+-    fi
+-  done
+-fi
+ #
+ #
+ ################################################################
+@@ -71,7 +59,7 @@
+ 
+ if test $mingw = "no" ; then
+   # add the warnings we don't want to do on mingw
+-  $WARNINGS_TO_TEST="$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Weffc++"
++  WARNINGS_TO_TEST="$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Weffc++"
+ fi
+ 
+ for option in $WARNINGS_TO_TEST
+@@ -105,7 +93,7 @@
+ 
+ if test $mingw = "no" ; then
+   # add the warnings we don't want to do on mingw
+-  $WARNINGS_TO_TEST="$WARNINGS_TO_TEST  -Weffc++"
++  WARNINGS_TO_TEST="$WARNINGS_TO_TEST  -Weffc++"
+ fi
+ 
+ for option in $WARNINGS_TO_TEST
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
new file mode 100644
index 0000000..4e4a2f5
--- /dev/null
+++ b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "md5deep"
+AUTHOR = "Jesse Kornblum, Simson L. Garfinkel"
+HOMEPAGE = "http://md5deep.sourceforge.net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9190f660105b9a56cdb272309bfd5491"
+
+inherit autotools
+
+SRC_URI = "git://github.com/jessek/hashdeep.git \
+        file://wrong-variable-expansion.patch \
+        "
+
+# Release 4.4
+SRCREV = "cd2ed7416685a5e83eb10bb659d6e9bec01244ae"
+
+S = "${WORKDIR}/git"
-- 
1.8.1.rc3


