Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qbewk-0000HC-O8
	for openembedded-core@lists.linuxtogo.org;
	Tue, 28 Jun 2011 22:31:46 +0200
Received: by wwf22 with SMTP id 22so530615wwf.6
	for <openembedded-core@lists.linuxtogo.org>;
	Tue, 28 Jun 2011 13:28:02 -0700 (PDT)
Received: by 10.227.209.205 with SMTP id gh13mr6953750wbb.47.1309292531345;
	Tue, 28 Jun 2011 13:22:11 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm411107wbb.37.2011.06.28.13.22.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 13:22:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Tue, 28 Jun 2011 22:22:02 +0200
Message-Id: <1309292522-11936-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] libc-{common, package}.bbclass: fix shlib renaming for the C library
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
X-List-Received-Date: Tue, 28 Jun 2011 20:31:46 -0000

Without this you'd end up with eglibc_2.12.ipk instead of libc6_2.12.ipk as before

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/libc-common.bbclass  |    8 ++++++++
 meta/classes/libc-package.bbclass |    7 +------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index bae0ace..a9ec5f1 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -21,3 +21,11 @@ def get_libc_fpu_setting(bb, d):
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
+}
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 4bc58c8..8e03f03 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -365,12 +365,7 @@ python package_do_split_gconvs () {
 
 }
 
-# We want to do this indirection so that we can safely 'return'
-# from the called function even though we're prepending
 python populate_packages_prepend () {
-	if bb.data.getVar('DEBIAN_NAMES', d, 1):
-		bpn = bb.data.getVar('BPN', d, 1)
-		bb.data.setVar('PKG_'+bpn, 'libc6', d)
-		bb.data.setVar('PKG_'+bpn+'-dev', 'libc6-dev', d)
 	bb.build.exec_func('package_do_split_gconvs', d)
 }
+
-- 
1.6.6.1



