Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QlGcT-0007MV-Rx
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 10:34:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6P8ULpP003259
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 01:30:21 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 25 Jul 2011 01:30:20 -0700
Message-ID: <850c23ba7c3be44ccd18825ace22f17e5dcda83d.1311574519.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1311574519.git.xiaofeng.yan@windriver.com>
References: <cover.1311574519.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 25 Jul 2011 13:59:32 +0800
Date: Mon, 25 Jul 2011 16:23:38 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] dropbear: Support pam
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
X-List-Received-Date: Mon, 25 Jul 2011 08:34:35 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I make a patch and some changes in dropbear.inc for supporting pam.
- Enable pam in configure
- Modify file option.h to open pam supporting

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |   78 +++++++++++---------
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 ++++++
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 3 files changed, 65 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1b51e1a..df1c2a0 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -9,13 +9,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
 
 DEPENDS = "zlib"
 RPROVIDES = "ssh sshd"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
-	         file://urandom-xauth-changes-to-options.h.patch \
-	         file://configure.patch \
-	         file://fix-2kb-keys.patch \
-	         file://allow-nopw.patch;apply=no \
-	         file://init"
+           file://urandom-xauth-changes-to-options.h.patch \
+           file://configure.patch \
+           file://fix-2kb-keys.patch \
+           file://allow-nopw.patch;apply=no \
+           file://init \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
+
+PAM_SRC_URI = "file://dropbear-enable-pam.patch"
 
 inherit autotools update-rc.d
 
@@ -28,54 +32,56 @@ LD = "${CC}"
 SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
+EXTRA_OECONF += "\
+    ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 DISTRO_TYPE = "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
 do_debug_patch() {
-	if [ "${DISTRO_TYPE}" = "debug" ]; then
-		bbnote "WARNING: applying allow-nopw.patch which allows password-less logins!"
-		patch -p1 < ${WORKDIR}/allow-nopw.patch
-	fi
+    if [ "${DISTRO_TYPE}" = "debug" ]; then
+        bbnote "WARNING: applying allow-nopw.patch which allows password-less logins!"
+        patch -p1 < ${WORKDIR}/allow-nopw.patch
+    fi
 }
 
 addtask do_debug_patch after do_patch before do_configure
 
 do_install() {
-	install -d ${D}${sysconfdir} \
-		   ${D}${sysconfdir}/init.d \
-		   ${D}${sysconfdir}/default \
-		   ${D}${sysconfdir}/dropbear \
+    install -d ${D}${sysconfdir} \
+           ${D}${sysconfdir}/init.d \
+           ${D}${sysconfdir}/default \
+           ${D}${sysconfdir}/dropbear \
                    ${D}${bindir} \
-		   ${D}${sbindir} \
-		   ${D}${localstatedir}
+           ${D}${sbindir} \
+           ${D}${localstatedir}
 
-	install -m 0755 dropbearmulti ${D}${sbindir}/
-	ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
-	
-	for i in ${SBINCOMMANDS}
-	do
-		ln -s ./dropbearmulti ${D}${sbindir}/$i
-	done
-	cat ${WORKDIR}/init | sed -e 's,/etc,${sysconfdir},g' \
-				  -e 's,/usr/sbin,${sbindir},g' \
-				  -e 's,/var,${localstatedir},g' \
-				  -e 's,/usr/bin,${bindir},g' \
-				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
-	chmod 755 ${D}${sysconfdir}/init.d/dropbear
+    install -m 0755 dropbearmulti ${D}${sbindir}/
+    ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
+    
+    for i in ${SBINCOMMANDS}
+    do
+        ln -s ./dropbearmulti ${D}${sbindir}/$i
+    done
+    cat ${WORKDIR}/init | sed -e 's,/etc,${sysconfdir},g' \
+                  -e 's,/usr/sbin,${sbindir},g' \
+                  -e 's,/var,${localstatedir},g' \
+                  -e 's,/usr/bin,${bindir},g' \
+                  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
+    chmod 755 ${D}${sysconfdir}/init.d/dropbear
 }
 
 pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/scp scp ${sbindir}/dropbearmulti 20
-	update-alternatives --install ${bindir}/ssh ssh ${sbindir}/dropbearmulti 20
+    update-alternatives --install ${bindir}/scp scp ${sbindir}/dropbearmulti 20
+    update-alternatives --install ${bindir}/ssh ssh ${sbindir}/dropbearmulti 20
 }
 
 pkg_postrm_append_${PN} () {
-  if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
+    if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
         rm ${sysconfdir}/dropbear/dropbear_rsa_host_key
-  fi
-  if [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
+    fi
+    if [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
         rm ${sysconfdir}/dropbear/dropbear_dss_host_key
-  fi
-  update-alternatives --remove ssh ${bindir}/dropbearmulti
-  update-alternatives --remove scp ${bindir}/dropbearmulti
+    fi
+    update-alternatives --remove ssh ${bindir}/dropbearmulti
+    update-alternatives --remove scp ${bindir}/dropbearmulti
 }
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
new file mode 100644
index 0000000..004d773
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
@@ -0,0 +1,22 @@
+dropbear: We need modify file option.h besides enabling pam in \
+configure if we want dropbear to support pam.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/options.h	2011-07-12 13:27:39.008819183 +0800
++++ b/options.h.new	2011-07-12 13:37:37.780819308 +0800
+@@ -149,9 +149,9 @@
+  * but there's an interface via a PAM module - don't bother using it otherwise.
+  * You can't enable both PASSWORD and PAM. */
+ 
+-#define ENABLE_SVR_PASSWORD_AUTH
++//#define ENABLE_SVR_PASSWORD_AUTH
+ /* PAM requires ./configure --enable-pam */
+-/*#define ENABLE_SVR_PAM_AUTH*/
++#define ENABLE_SVR_PAM_AUTH
+ #define ENABLE_SVR_PUBKEY_AUTH
+ 
+ /* Wether to ake public key options in authorized_keys file into account */
+
diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb b/meta/recipes-core/dropbear/dropbear_0.52.bb
index 78d6cf1..4013c65 100644
--- a/meta/recipes-core/dropbear/dropbear_0.52.bb
+++ b/meta/recipes-core/dropbear/dropbear_0.52.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "1c69ec674481d7745452f68f2ea5597e"
 SRC_URI[sha256sum] = "e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
 
-PR = "r2"
+PR = "r3"
-- 
1.7.0.4



