Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhNqL-0007Uw-RV
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 17:28:49 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhNmW-0005bd-G2
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 17:24:52 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2011 16:24:51 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310657092.2378.67.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] sanity, base: remove gcc3 check since qemu doesn't need it any more
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
X-List-Received-Date: Thu, 14 Jul 2011 15:28:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Recent versions of qemu seem to be happy enough building with gcc 4.x, and indeed most modern distributions aren't shipping gcc3 any more, so there is no point checking for its presence as part of sanity.

Also remove the check_gcc3 function from base since nothing else uses it.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/base.bbclass   |   10 ----------
 meta/classes/sanity.bbclass |    8 --------
 2 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0c2c546..3ca4e47 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -397,16 +397,6 @@ python () {
             bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN", True))
 }
 
-def check_gcc3(data):
-
-	gcc3_versions = 'gcc-3.4.6 gcc-3.4.7 gcc-3.4 gcc34 gcc-3.4.4 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
-
-	for gcc3 in gcc3_versions.split():
-		if check_app_exists(gcc3, data):
-			return gcc3
-	
-	return False
-
 addtask cleansstate after do_clean
 python do_cleansstate() {
         sstate_clean_cachefiles(d)
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c9d37c9..716b158 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -211,14 +211,6 @@ def check_sanity(e):
 
     required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg chrpath wget cpio"
 
-    # qemu-native needs gcc 3.x
-    if "qemu-native" not in assume_provided and "gcc3-native" in assume_provided:
-        gcc_version = commands.getoutput("${BUILD_PREFIX}gcc --version | head -n 1 | cut -f 3 -d ' '")
-
-        if not check_gcc3(e.data) and gcc_version[0] != '3':
-            messages = messages + "gcc3-native was in ASSUME_PROVIDED but the gcc-3.x binary can't be found in PATH"
-            missing = missing + "gcc-3.x (needed for qemu-native),"
-
     if "qemu-native" in assume_provided:
         if not check_app_exists("qemu-arm", e.data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
-- 
1.7.4.1





