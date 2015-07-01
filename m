Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44F3D65C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 03:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t613PF0j029155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 20:25:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 30 Jun 2015 20:25:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Jul 2015 11:24:44 +0800
Message-ID: <1c5f07be076a91ce65e8d27aabe8e576131a5d7a.1435720976.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435720976.git.kai.kang@windriver.com>
References: <cover.1435720976.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] expect: replace the STAGING_INCDIR with includedir
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
X-List-Received-Date: Wed, 01 Jul 2015 03:25:18 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The build path is included in expect-dev rpm package. It should not set
the STAGING_INCDIR statically. The includedir will be replaced with
appropriate value in different stage.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/expect/expect_5.45.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 264f007..3c2aab4 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -40,8 +40,7 @@ do_install_append() {
         sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
-EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
-                 --with-tcl=${STAGING_LIBDIR} \
+EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                  --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
                  --enable-shared \
                  --enable-threads \
@@ -53,10 +52,10 @@ FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
                     ${libdir}/.debug \
                    "
 FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
-                   ${STAGING_INCDIR}/expect.h \
-                   ${STAGING_INCDIR}/expect_tcl.h \
-                   ${STAGING_INCDIR}/expect_comm.h \
-                   ${STAGING_INCDIR}/tcldbg.h \
+                   ${includedir}/expect.h \
+                   ${includedir}/expect_tcl.h \
+                   ${includedir}/expect_comm.h \
+                   ${includedir}/tcldbg.h \
                    ${includedir}/*.h \
                   "
 
-- 
1.9.1


