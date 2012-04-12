Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIFlR-0007mc-Bf for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 10:52:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3C8h5En019792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:43:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19488-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:43:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3C8gwVv019786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:43:00 +0100
Message-ID: <1334220179.31685.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 09:42:59 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH[ libunistring: Fix parallel make issue
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
X-List-Received-Date: Thu, 12 Apr 2012 08:52:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See patch header for the full description of the parallel make issue this resolves.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/libunistring/libunistring/parallelmake.patch b/meta/recipes-support/libunistring/libunistring/parallelmake.patch
new file mode 100644
index 0000000..21025b8
--- a/dev/null
+++ b/meta/recipes-support/libunistring/libunistring/parallelmake.patch
@@ -0,0 +1,26 @@
+Fix a parallel make race where cdefs.h uses the unused-parameter.h header file
+but has no dependency listed. This can result in an empty cdefs.h file which 
+results in a build failure like:
+
+| In file included from striconveh.c:30:0:
+| unistr.h:193:48: error: expected ';', ',' or ')' before '_GL_UNUSED_PARAMETER'
+| In file included from striconveh.c:30:0:
+| unistr.h:263:54: error: expected ';', ',' or ')' before '_GL_UNUSED_PARAMETER'
+
+Upstream-Status: Pending
+
+RP 2012/4/12
+
+Index: libunistring-0.9.3/lib/Makefile.am
+===================================================================
+--- libunistring-0.9.3.orig/lib/Makefile.am	2012-04-12 07:45:41.450059820 +0000
++++ libunistring-0.9.3/lib/Makefile.am	2012-04-12 07:48:45.434055559 +0000
+@@ -157,7 +157,7 @@
+ 
+ # unistring/cdefs.h is not public, but is included by other header files.
+ nobase_nodist_include_HEADERS += unistring/cdefs.h
+-unistring/cdefs.h : unistring/cdefs.in.h
++unistring/cdefs.h : unistring/cdefs.in.h $(UNUSED_PARAMETER_H)
+ 	@MKDIR_P@ unistring
+ 	rm -f $@-t $@
+ 	sed -e '/definition of _GL_UNUSED_PARAMETER/r $(UNUSED_PARAMETER_H)' \
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
index eabe115..02a28f4 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
@@ -17,12 +17,13 @@ LICENSE = "GPLv3&LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6" 
 
-SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
+           file://parallelmake.patch"
 
 SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
 SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 BBCLASSEXTEND = "native nativesdk"




