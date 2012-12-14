Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TjduG-00026X-6B
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 23:39:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBEMOMTH016216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 14:24:22 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 14 Dec 2012 14:24:22 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 16:40:33 -0600
Message-ID: <1355524834-9550-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1355524834-9550-1-git-send-email-mark.hatle@windriver.com>
References: <1355524834-9550-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] classes/image: handle multilibs in complementary package lookup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 22:39:00 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

For multilib the vendor string is altered, so we need to iterate over
all of the multilib vendors when we do the glob processing for
complementary packages.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

In addition, the RPM package arch have been munged by adding the multilib
identifier.  This identifier needs to be stripped when generating the
installed_packages list for the complementary lookup code to work.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass       |   16 +++++++++++++++-
 meta/classes/package_rpm.bbclass |    5 ++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1461144..8bf718a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -113,6 +113,17 @@ python () {
             bb.fatal("%s contains conflicting IMAGE_FEATURES %s %s" % (d.getVar('PN', True), feature, ' '.join(list(temp))))
 
     d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
+
+    # Ensure we have the vendor list for complementary package handling
+    ml_vendor_list = ""
+    multilibs = d.getVar('MULTILIBS', True) or ""
+    for ext in multilibs.split():
+        eext = ext.split(':')
+        if len(eext) > 1 and eext[0] == 'multilib':
+            localdata = bb.data.createCopy(d)
+            vendor = localdata.getVar("TARGET_VENDOR_virtclass-multilib-" + eext[1], False)
+            ml_vendor_list += " " + vendor
+    d.setVar('MULTILIB_VENDORS', ml_vendor_list)
 }
 
 python image_handler () {
@@ -357,7 +368,10 @@ rootfs_install_complementary() {
 
     if [ "$GLOBS" != "" ] ; then
         # Use the magic script to do all the work for us :)
-        oe-pkgdata-util glob ${TMPDIR}/pkgdata ${TARGET_VENDOR}-${TARGET_OS} ${WORKDIR}/installed_pkgs.txt "$GLOBS" > ${WORKDIR}/complementary_pkgs.txt
+        : > ${WORKDIR}/complementary_pkgs.txt
+        for vendor in ${TARGET_VENDOR} ${MULTILIB_VENDORS} ; do
+            oe-pkgdata-util glob ${TMPDIR}/pkgdata $vendor-${TARGET_OS} ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
+        done
 
         # Install the packages, if any
         sed -i '/^$/d' ${WORKDIR}/complementary_pkgs.txt
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a00b702..05108b2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -99,8 +99,11 @@ translate_smart_to_oe() {
 				if [ "$arch" = "$cmp_arch" -o "$fixed_arch" = "$cmp_arch" ]; then
 					if [ "$mlib" = "default" ]; then
 						new_pkg="$pkg"
+						new_arch=$cmp_arch
 					else
 						new_pkg="$mlib-$pkg"
+						# We need to strip off the ${mlib}_ prefix on the arch
+						new_arch=${cmp_arch#${mlib}_}
 					fi
 					# Workaround for bug 3565
 					# Simply look to see if we know of a package with that name, if not try again!
@@ -121,7 +124,7 @@ translate_smart_to_oe() {
 
 		#echo "$pkg -> $new_pkg" >&2
 		if [ "$arg1" = "arch" ]; then
-			echo $new_pkg $cmp_arch $other
+			echo $new_pkg $new_arch $other
 		else
 			echo $new_pkg $other
 		fi
-- 
1.7.3.4



