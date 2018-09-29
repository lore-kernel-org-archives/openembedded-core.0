Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 612EE7999F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:25:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T6P8OK003459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:25:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:25:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:51 +0800
Message-ID: <5266d8bc086fe75047d2cc84d25a4a83b28811b5.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] nss: move create blank certificates to pkg_postinst
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
X-List-Received-Date: Sat, 29 Sep 2018 06:25:07 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There is a multilib install file conflict of nss:
| file /etc/pki/nssdb/key4.db conflicts between attempted installs of
| lib32-nss-3.38-r0.corei7_32 and nss-3.38-r0.corei7_64

Move the creation of blank certificates to pkg_postinst. And check if
certificates exist already, don't re-create them.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/nss/nss_3.38.bb | 32 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.38.bb
index 904b621a07..74145360b5 100644
--- a/meta/recipes-support/nss/nss_3.38.bb
+++ b/meta/recipes-support/nss/nss_3.38.bb
@@ -211,20 +211,20 @@ do_install_append() {
     sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
 }
 
-do_install_append_class-target() {
-    # Create a blank certificate
-    mkdir -p ${D}${sysconfdir}/pki/nssdb/
-    touch ./empty_password
-    certutil -N -d sql:${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
-    chmod 644 ${D}${sysconfdir}/pki/nssdb/*.db
-    rm ./empty_password
-    # Remove build path prefix
-    sed -i "s:${D}::g"  ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
-}
-
 PACKAGE_WRITE_DEPS += "nss-native"
 pkg_postinst_${PN} () {
     if [ -n "$D" ]; then
+        if [ ! -d $D${sysconfdir}/pki/nssdb/ ]; then
+            # Create a blank certificate
+            mkdir -p $D${sysconfdir}/pki/nssdb/
+            touch $D/empty_password
+            certutil -N -d sql:$D${sysconfdir}/pki/nssdb/ -f $D/empty_password
+            chmod 644 $D${sysconfdir}/pki/nssdb/*.db
+            rm $D/empty_password
+            # Remove build path prefix
+            sed -i "s:$D::g"  $D${sysconfdir}/pki/nssdb/pkcs11.txt
+        fi
+
         for I in $D${libdir}/lib*.chk; do
             DN=`dirname $I`
             BN=`basename $I .chk`
@@ -235,6 +235,15 @@ pkg_postinst_${PN} () {
             fi
         done
     else
+        if [ ! -d ${sysconfdir}/pki/nssdb ]; then
+            # Create a blank certificate
+            mkdir -p ${sysconfdir}/pki/nssdb
+            empty_password=`mktemp`
+            certutil -N -d sql:$D${sysconfdir}/pki/nssdb/ -f $empty_password
+            chmod 644 $D${sysconfdir}/pki/nssdb/*.db
+            rm $empty_password
+        fi
+
         signlibs.sh
     fi
 }
@@ -244,7 +253,6 @@ FILES_${PN}-smime = "\
     ${bindir}/smime \
 "
 FILES_${PN} = "\
-    ${sysconfdir} \
     ${bindir} \
     ${libdir}/lib*.chk \
     ${libdir}/lib*.so \
-- 
2.18.0


