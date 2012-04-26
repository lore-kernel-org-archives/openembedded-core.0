Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNW0u-0006ng-2c for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 23:14:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QL4Umg007475
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 22:04:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07307-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 22:04:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QL4M9H007469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 22:04:24 +0100
Message-ID: <1335474264.20130.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Apr 2012 22:04:24 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: mesa: Fix mklibs patch to simply remove troublesome uname usage
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
X-List-Received-Date: Thu, 26 Apr 2012 21:14:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this we started seeing the -mx32 flag being passed to the compiler
for things like arm builds which makes no sense.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 2b90aed..1c376b7 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r13"
+INC_PR = "r14"
 PE = "2"
 
 
diff --git a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
index 8994faf..f072c34 100644
--- a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
+++ b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
@@ -1,38 +1,40 @@
 Upstream-Status: Pending
 
-get correct compiler options for x32 gcc.
+Using uname like this when cross compiling is a really bad idea. We 
+provide the correct linker flags, lets just assume we can get this 
+right ourselves.
 
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
+RP 2012/04/26
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/06
-
---- Mesa-7.11/bin/mklib.x32	2011-12-06 13:15:17.968695114 -0800
-+++ Mesa-7.11/bin/mklib	2011-12-06 13:17:13.872152249 -0800
-@@ -335,7 +335,12 @@ case $ARCH in
+Index: Mesa-7.11/bin/mklib
+===================================================================
+--- Mesa-7.11.orig/bin/mklib	2012-04-26 19:43:20.729150109 +0000
++++ Mesa-7.11/bin/mklib	2012-04-26 20:30:22.421086163 +0000
+@@ -330,13 +330,7 @@
+ 	    ;;
+ 	    esac
+ 
+-	    # Check if objects are 32-bit and we're running in 64-bit
+-	    # environment.  If so, pass -m32 flag to linker.
  	    set ${OBJECTS}
- 	    ABI32=`file $1 | grep 32-bit`
- 	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-	    ABI32=`file $1 | grep 32-bit`
+-	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
 -		OPTS="-m32 ${OPTS}"
-+		ABIX32=`file $1 | grep x86-64`
-+		if [ "${ABI32}" ]; then
-+		    OPTS="-mx32 ${OPTS}"
-+		else
-+		    OPTS="-m32 ${OPTS}"
-+		fi
- 	    fi
+-	    fi
  
              if [ "${ALTOPTS}" ] ; then
-@@ -392,7 +397,12 @@ case $ARCH in
+                 OPTS=${ALTOPTS}
+@@ -387,13 +381,7 @@
+ 		# exptmp is removed below
+ 	    fi
+ 
+-	    # Check if objects are 32-bit and we're running in 64-bit
+-	    # environment.  If so, pass -m32 flag to linker.
  	    set ${OBJECTS}
- 	    ABI32=`file $1 | grep 32-bit`
- 	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-	    ABI32=`file $1 | grep 32-bit`
+-	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
 -		OPTS="-m32 ${OPTS}"
-+		ABIX32=`file $1 | grep x86-64`
-+		if [ "${ABI32}" ]; then
-+		    OPTS="-mx32 ${OPTS}"
-+		else
-+		    OPTS="-m32 ${OPTS}"
-+		fi
- 	    fi
+-	    fi
              if [ "${ALTOPTS}" ] ; then
                  OPTS=${ALTOPTS}
+             fi




