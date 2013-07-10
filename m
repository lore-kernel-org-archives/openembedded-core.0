Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2696A4D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:03:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6A83qoS011510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:03:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 01:03:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 16:03:41 +0800
Message-ID: <fb33ec7730da4eec3aeb2a73295a851ed15af941.1373443071.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373443071.git.hongxu.jia@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] nss: create checksum files for the nss libraries
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
X-List-Received-Date: Wed, 10 Jul 2013 08:03:51 -0000
Content-Type: text/plain

Add checksum files required for the NSS softoken to operate in FIPS 140 mode.
The shlibsign is invoked to sign the libraries, and it is built for the target
architecture and doesn't support cross-compiling so far.

Invoke shlibsign at target's first boot time to generate checksum files.

https://developer.mozilla.org/en-US/docs/NSS/NSS_Tech_Notes/nss_tech_note6
http://en.wikipedia.org/wiki/FIPS_140
https://bugzilla.mozilla.org/show_bug.cgi?id=681624

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/nss/files/signlibs.sh | 20 ++++++++++++++++++++
 meta/recipes-support/nss/nss.inc           | 16 ++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/signlibs.sh

diff --git a/meta/recipes-support/nss/files/signlibs.sh b/meta/recipes-support/nss/files/signlibs.sh
new file mode 100644
index 0000000..1ec79f4
--- /dev/null
+++ b/meta/recipes-support/nss/files/signlibs.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# signlibs.sh
+#
+# (c)2010 Wind River Systems, Inc.
+#
+# regenerates the .chk files for the NSS libraries that require it
+# since the ones that are built have incorrect checksums that were
+# calculated on the host where they really need to be done on the
+# target
+
+CHK_FILES=`find /lib* /usr/lib* -name "*.chk"`
+SIGN_BINARY=`which shlibsign`
+for I in $CHK_FILES
+do
+       DN=`dirname $I`
+       BN=`basename $I .chk`
+       FN=$DN/$BN.so
+       $SIGN_BINARY -i $FN
+done
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 87cba38..4270743 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -18,6 +18,7 @@ SRC_URI = "\
 "
 SRC_URI_append_class-target += "\
     file://nss.pc.in \
+    file://signlibs.sh \
 "
 inherit siteinfo
 PR = "r0"
@@ -136,6 +137,14 @@ do_install() {
 }
 
 do_install_append_class-target() {
+    # Create empty .chk files for the NSS libraries at build time. They could
+    # be regenerated at target's boot time.
+    for file in libsoftokn3.chk libfreebl3.chk libnssdbm3.chk; do
+        touch ${D}/${libdir}/$file
+        chmod 755 ${D}/${libdir}/$file
+    done
+    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
+
     install -d ${D}${libdir}/pkgconfig/
     sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
     sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
@@ -151,6 +160,13 @@ do_install_append_class-target() {
     rm ./empty_password
 }
 
+pkg_postinst_${PN} () {
+    if [ -n "$D" ]; then
+        exit 1
+    fi
+    signlibs.sh
+}
+
 FILES_${PN} = "\
     ${sysconfdir} \
     ${bindir} \
-- 
1.8.1.2


