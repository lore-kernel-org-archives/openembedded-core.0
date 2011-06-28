Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbbEw-00039K-7X
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 18:34:18 +0200
Received: by wyg30 with SMTP id 30so309450wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:30:36 -0700 (PDT)
Received: by 10.227.173.66 with SMTP id o2mr6799753wbz.17.1309278635223;
	Tue, 28 Jun 2011 09:30:35 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b13sm280108wbh.7.2011.06.28.09.30.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 09:30:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 18:30:30 +0200
Message-Id: <1309278630-22851-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libc-{common, package}.bbclass: fix shlib renaming for the C library
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
X-List-Received-Date: Tue, 28 Jun 2011 16:34:18 -0000

Without this you'd end up with eglibc_2.12.ipk instead of libc6_2.12.ipk as before

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/libc-common.bbclass  |    9 +++++++++
 meta/classes/libc-package.bbclass |   10 ----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index bae0ace..983ed40 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -21,3 +21,12 @@ def get_libc_fpu_setting(bb, d):
     if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
         return "--without-fp"
     return ""
+# We want to do this indirection so that we can safely 'return'
+# from the called function even though we're prepending
+python populate_packages_prepend () {
+	if bb.data.getVar('DEBIAN_NAMES', d, 1):
+		bpn = bb.data.getVar('BPN', d, 1)
+		bb.data.setVar('PKG_'+bpn, 'libc6', d)
+		bb.data.setVar('PKG_'+bpn+'-dev', 'libc6-dev', d)
+	bb.build.exec_func('package_do_split_gconvs', d)
+}
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 4bc58c8..78dae97 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -364,13 +364,3 @@ python package_do_split_gconvs () {
 		bb.note("generation of binary locales disabled. this may break i18n!")
 
 }
-
-# We want to do this indirection so that we can safely 'return'
-# from the called function even though we're prepending
-python populate_packages_prepend () {
-	if bb.data.getVar('DEBIAN_NAMES', d, 1):
-		bpn = bb.data.getVar('BPN', d, 1)
-		bb.data.setVar('PKG_'+bpn, 'libc6', d)
-		bb.data.setVar('PKG_'+bpn+'-dev', 'libc6-dev', d)
-	bb.build.exec_func('package_do_split_gconvs', d)
-}
-- 
1.6.6.1



