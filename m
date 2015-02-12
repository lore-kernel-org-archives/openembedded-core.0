Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB2A260601
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 23:58:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1BNwmGf004149
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 15:58:48 -0800 (PST)
Received: from dell780.wrs.com (128.224.56.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 11 Feb 2015 15:58:48 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Feb 2015 19:00:24 -0500
Message-ID: <1423699224-19243-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Subject: [PATCH] mozjs: fix build failure due to missing dependency on libxt
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
X-List-Received-Date: Wed, 11 Feb 2015 23:58:59 -0000
Content-Type: text/plain

The failure intermittently shows up as follows:

ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was 'poky/build/tmp/work/core2-64-poky-linux/mozjs/17.0.0-r0/build'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: poky/build/tmp/work/core2-64-poky-linux/mozjs/17.0.0-r0/temp/log.do_configure.8047
ERROR: Task 5 (poky/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb, do_configure) failed with exit code '1'

The configure log has:

configure:5494: checking for IceConnectionNumber in -lICE
configure:5513: x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=poky/build/tmp/sysroots/genericx86-64 -o conftest  -O2 -pipe -g -feliminate-unused-debug-types  -Wl, -O1 -Wl,--hash-style=gnu -Wl,--as-needed -L/usr/lib conftest.c -lICE   1>&5
poky/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.1/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation

Checking build/config/autoconf.mk we find:

X_CFLAGS =  -I/usr/include
X_EXTRA_LIBS =
X_LIBS =  -L/usr/lib

Looking at the configure script, we see these invalid values are output
when the autoconf test for X11 fails.  That test fails in the following
fashion:

configure:4768:27: fatal error: X11/Intrinsic.h: No such file or directory

This header in turn gets put in the sysroot by our build of libxt.  So we
get build fails whenever mozjs is built before libxt.

Since the package clearly has never been built in a no-X11 OE environment,
we assume that all OE users to date are X11 users and hence simply add a
dependency on libxt.

Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index ab01471d0bab..94f73ba8e418 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/${PN}${PV}/js/src"
 
 inherit autotools pkgconfig perlnative
 
-DEPENDS += "nspr zlib"
+DEPENDS += "nspr zlib libxt"
 
 # nspr's package-config is ignored so set libs manually
 EXTRA_OECONF = " \
-- 
2.2.1


