Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id E4DE971A52
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:00 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 515B1B8B27C; Tue,  6 Dec 2016 12:49:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:28 +0100
Message-Id: <1481024991-5882-11-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 10/33] apt: use default packaging rules for manpages
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:01 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 35 +--------------------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index 3efa14e..ba49571 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -2,45 +2,13 @@ DEPENDS = "curl db zlib"
 RDEPENDS_${PN} = "dpkg bash debianutils"
 require apt.inc
 
-apt-manpages="doc/apt-cache.8 \
-	      doc/apt-cdrom.8 \
-	      doc/apt-config.8 \
-	      doc/apt-get.8 \
-	      doc/apt.8 \
-	      doc/apt.conf.5 \
-	      doc/apt_preferences.5 \
-	      doc/sources.list.5"
-apt-utils-manpages="doc/apt-extracttemplates.1 \
-		    doc/apt-sortpkgs.1"
-
-def get_files_apt_doc(d, bb, manpages):
-    import re
-    manpages = re.sub(r'\bdoc/(\S+)/(\S+)\.\1\.(.)\b', r'${mandir}/\1/man\3/\2.\3', manpages)
-    manpages = re.sub(r'\bdoc/(\S+)\.(.)\b', r'${mandir}/man\2/\1.\2', manpages)
-    return manpages
-
-def get_commands_apt_doc(d, bb, manpages):
-    s = list()
-    __dir_cache__ = list()
-    for m in manpages.split():
-        dest = get_files_apt_doc(d, bb, m)
-        dir = os.path.dirname(dest)
-        if not dir in __dir_cache__:
-            s.append("install -d ${D}/%s" % dir)
-            __dir_cache__.append(dir)
-        s.append("install -m 0644 %s ${D}/%s" % (m, dest))
-    return "\n".join(s)
-
-PACKAGES += "${PN}-utils ${PN}-utils-doc"
+PACKAGES += "${PN}-utils"
 FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
 	       ${bindir}/apt-config ${bindir}/apt-cache \
 	       ${libdir}/apt ${libdir}/libapt*.so.* \
 	       ${localstatedir} ${sysconfdir} \
 	       ${libdir}/dpkg"
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
-FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
-		   ${docdir}/apt"
-FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
 FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
 do_install () {
@@ -87,7 +55,6 @@ PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,b
 PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
 
 FILES_${PN} += "${bindir}/apt-key"
-apt-manpages += "doc/apt-key.8"
 
 do_install_append() {
     #Write the correct apt-architecture to apt.conf
-- 
2.7.4


