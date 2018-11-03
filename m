Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id CC6E879FFC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:19 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BB222FF802;
	Sat,  3 Nov 2018 16:45:18 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:18 -0700
Message-Id: <20181103164427.16125-17-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 16/25] openssl_1.0: drop obsolete exporting of AS, EX_LIBS and DIRS
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:20 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Previously (when EXTRA_OEMAKE contained -e) exporting these variables
over-rode default values in the top-level openssl Makefile. However,
since -e was removed from EXTRA_OEMAKE as part of:

  http://git.openembedded.org/openembedded-core/commit/?id=537a404cfbb811fcb526cdb5f2e059257de6ef13

exporting these variables does nothing. The comment from that commit
that only AR is affected by removing -e wasn't correct, but the
effects of letting the openssl Makefile also control AS, EX_LIBS and
DIRS seem to be either benign or beneficial.

Since without -e make ignores DIRS from the environment and always
runs for all subdirs (including "test"), adding "test" to DIRS and
calling "make depend" again from do_compile_ptest() can be dropped.

(From OE-Core rev: b3e81e3cf86dd8736b62a6b88d6a6dbe518c9e5e)

(From OE-Core rev: 8aa33c15b7c71cda8de3e3571879a5d39c915adb)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index d2dfc5925a..0c0f015fa7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -72,9 +72,6 @@ PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryp
 # vulnerability
 EXTRA_OECONF = "no-ssl3"
 
-export DIRS = "crypto ssl apps engines"
-export AS = "${CC} -c"
-export EX_LIBS = "-lgcc -ldl"
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
@@ -216,9 +213,6 @@ do_compile_class-target () {
 }
 
 do_compile_ptest () {
-	# build dependencies for test directory too
-	export DIRS="$DIRS test"
-	oe_runmake depend
 	oe_runmake buildtest
 }
 
-- 
2.18.1


