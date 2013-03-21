Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6P-0006N2-Bs
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:31 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4swm009105; Thu, 21 Mar 2013 16:04:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Lqcop-SkDxLK; Thu, 21 Mar 2013 16:04:57 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4nQR009088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:50 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpo-0006MX-2t; Thu, 21 Mar 2013 15:55:20 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:12 +0000
Message-Id: <1363881315-24352-13-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/16] directfb: Fix case where ${B} != ${S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Add patch to allow out of tree builds to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../directfb/directfb/fixsepbuild.patch             |   19 +++++++++++++++++++
 meta/recipes-graphics/directfb/directfb_1.6.1.bb    |    3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb/fixsepbuild.patch

diff --git a/meta/recipes-graphics/directfb/directfb/fixsepbuild.patch b/meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
new file mode 100644
index 0000000..94a9ba5
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
@@ -0,0 +1,19 @@
+Fix out of tree builds
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Index: DirectFB-1.6.1/configure.in
+===================================================================
+--- DirectFB-1.6.1.orig/configure.in	2013-03-19 01:38:28.174004720 +0000
++++ DirectFB-1.6.1/configure.in	2013-03-21 12:18:10.253113675 +0000
+@@ -111,7 +111,7 @@
+ AC_PATH_TOOL(FLUXCOMP, fluxcomp)
+ AC_SUBST(FLUXCOMP)
+ if test -z "$FLUXCOMP"; then
+-  if ! test -e src/core/CoreDFB.cpp; then
++  if ! test -e $srcdir/src/core/CoreDFB.cpp; then
+     AC_MSG_ERROR([
+ *** DirectFB compilation requires fluxcomp ***
+ 
diff --git a/meta/recipes-graphics/directfb/directfb_1.6.1.bb b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
index 6c48a86..1230d12 100644
--- a/meta/recipes-graphics/directfb/directfb_1.6.1.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
@@ -6,7 +6,8 @@ PR = "${INC_PR}.2"
 DEPENDS += "sysfsutils"
 
 SRC_URI += "file://fix-compilation-with-zlib.patch \
-            file://rename-no-instrument-function-macro.patch"
+            file://rename-no-instrument-function-macro.patch \
+            file://fixsepbuild.patch"
 
 EXTRA_OECONF = "\
   --enable-freetype=yes \
-- 
1.7.10.4



