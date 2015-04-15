Return-Path: <yocto_user@gmx.com>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 8E45465C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 14:07:23 +0000 (UTC)
Received: from [192.168.3.73] ([64.211.30.29]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0MEccf-1Yc1Fl098b-00FlxO for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 16:07:24 +0200
Message-ID: <552E7098.9040304@gmx.com>
Date: Wed, 15 Apr 2015 10:07:20 -0400
From: Yocto User <yocto_user@gmx.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Provags-ID: V03:K0:S/AaRx83WILnZlm8ZX1TZ5Lwdv/cjdjqQWU68xMW9Sy0VZiDMNK
	ZivYGG24zQOL1LXbWuiBJeZUFp4DE+9TpNxKBtnoqUb5TOSUMpL98tcn+MMyhozaWPjtrRG
	ATOxTyMwdqVooobn3BDyTNHHrou0n7z+OkhmtwrPfR0UhlBFZU/L+h5Pnp/rtw35LlPLSSC
	mOdgtXcUEkm9xTUOjeYfg==
X-UI-Out-Filterresults: notjunk:1;
Subject: [PATCH] expect: install header files in usual location
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
X-List-Received-Date: Wed, 15 Apr 2015 14:07:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch resolves [Bug 7552] where the headers for the expect library 
were installed into the wrong location.

---
  meta/recipes-devtools/expect/expect_5.45.bb |   12 ++++--------
  1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb 
b/meta/recipes-devtools/expect/expect_5.45.bb
index 264f007..4129ab1 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} = "tcl"

  inherit autotools

-PR = "r1"
+PR = "r2"

  SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
             file://0001-configure.in.patch \
@@ -40,8 +40,7 @@ do_install_append() {
          sed -e 's|$dir|${libdir}|' -i 
${D}${libdir}/expect${PV}/pkgIndex.tcl
  }

-EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
-                 --with-tcl=${STAGING_LIBDIR} \
+EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                   --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
                   --enable-shared \
                   --enable-threads \
@@ -52,12 +51,9 @@ EXTRA_OEMAKE_install = " 'SCRIPTS=' "
  FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
                      ${libdir}/.debug \
                     "
+
  FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
-                   ${STAGING_INCDIR}/expect.h \
-                   ${STAGING_INCDIR}/expect_tcl.h \
-                   ${STAGING_INCDIR}/expect_comm.h \
-                   ${STAGING_INCDIR}/tcldbg.h \
-                   ${includedir}/*.h \
+                   ${includedir} \
                    "

  FILES_${PN} += "${libdir}/libexpect${PV}.so \
-- 
1.7.9.5


