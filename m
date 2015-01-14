Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2E0C728AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8ldbC022099
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:13 -0800
Message-ID: <2d089762d6cf082305a9a5a75bfab663a9581708.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/27] nspr: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

And bump the PR to avoid:
make[3]: ../../../config/./nsinstall: Command not found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/nspr/nspr_4.10.7.bb |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr_4.10.7.bb b/meta/recipes-support/nspr/nspr_4.10.7.bb
index 69e9dfa..de28197 100644
--- a/meta/recipes-support/nspr/nspr_4.10.7.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.7.bb
@@ -21,8 +21,7 @@ S = "${WORKDIR}/nspr-${PV}/nspr"
 RDEPENDS_${PN}-dev += "perl"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-TESTS = "runtests.pl \
-    runtests.sh \
+TESTS = " \
     accept \
     acceptread \
     acceptreademu \
@@ -138,7 +137,9 @@ TESTS = "runtests.pl \
     xnotify \
     zerolen"
 
-inherit autotools-brokensep
+PR = "r1"
+
+inherit autotools
 
 do_compile_prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C config export
@@ -154,8 +155,11 @@ do_install_append() {
     sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
-    cd ${S}/pr/tests
+
     mkdir -p ${D}${libdir}/nspr/tests
+    install -m 0755 ${S}/pr/tests/runtests.pl ${D}${libdir}/nspr/tests
+    install -m 0755 ${S}/pr/tests/runtests.sh ${D}${libdir}/nspr/tests
+    cd ${B}/pr/tests
     install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
 
     # delete compile-et.pl and perr.properties from ${bindir} because these are
-- 
1.7.9.5


