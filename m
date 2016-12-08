Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id EB83E71C84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:06 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id DF6A4B8737F; Thu,  8 Dec 2016 22:47:58 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:33 +0100
Message-Id: <1481233677-27298-10-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 09/33] apt-native: use sed to prepare apt.conf.sample
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:07 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt-native_1.2.12.bb     | 32 +++++-----------------
 .../apt/{files/apt.conf => apt/apt.conf.in}        |  6 ++--
 2 files changed, 10 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/apt/{files/apt.conf => apt/apt.conf.in} (87%)

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
index 0edceeb..695e21d 100644
--- a/meta/recipes-devtools/apt/apt-native_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
@@ -11,33 +11,10 @@ SRC_URI += "file://db_linking_hack.patch \
             file://0001-fix-the-gcc-version-check.patch \
             file://noconfigure.patch \
             file://no-curl.patch \
+            file://apt.conf.in \
 "
 
-python do_install () {
-    bb.build.exec_func('do_install_base', d)
-    bb.build.exec_func('do_install_config', d)
-}
-
-python do_install_config () {
-    indir = os.path.dirname(d.getVar('FILE', True))
-    infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
-    data = infile.read()
-    infile.close()
-
-    data = d.expand(data)
-
-    outdir = oe.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
-    if not os.path.exists(outdir):
-        os.makedirs(outdir)
-
-    outpath = oe.path.join(outdir, 'apt.conf.sample')
-    if not os.path.exists(outpath):
-        outfile = open(outpath, 'w')
-        outfile.write(data)
-        outfile.close()
-}
-
-do_install_base () {
+do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 bin/apt-cdrom ${D}${bindir}/
 	install -m 0755 bin/apt-get ${D}${bindir}/
@@ -69,4 +46,9 @@ do_install_base () {
 	install -d ${D}${localstatedir}/cache/apt/archives/partial
 
 	install -d ${D}${localstatedir}/log/apt/
+
+	sed -e "s,@STAGING_DIR_NATIVE@,${STAGING_DIR_NATIVE},g" \
+	    -e "s,@STAGING_BINDIR_NATIVE@,${STAGING_BINDIR_NATIVE},g" \
+	    -e "s,@STAGING_LIBDIR@,${STAGING_LIBDIR},g" \
+	    < ${WORKDIR}/apt.conf.in > ${D}${sysconfdir}/apt/apt.conf.sample
 }
diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/apt/apt.conf.in
similarity index 87%
rename from meta/recipes-devtools/apt/files/apt.conf
rename to meta/recipes-devtools/apt/apt/apt.conf.in
index 9ad61cc..6fc1326 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/apt/apt.conf.in
@@ -1,4 +1,4 @@
-Dir "${STAGING_DIR_NATIVE}/"
+Dir "@STAGING_DIR_NATIVE@/"
 {
    State "var/lib/apt/"
    {
@@ -11,9 +11,9 @@ Dir "${STAGING_DIR_NATIVE}/"
       pkgcache "";
       srcpkgcache "";
    };
-   Bin "${STAGING_BINDIR_NATIVE}/"
+   Bin "@STAGING_BINDIR_NATIVE@/"
    {
-      methods "${STAGING_LIBDIR}/apt/methods/";
+      methods "@STAGING_LIBDIR@/apt/methods/";
       gzip "/bin/gzip";
       dpkg "dpkg";
       dpkg-source "dpkg-source";
-- 
2.7.4


