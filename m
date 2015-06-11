Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1A18758D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 22:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BMWeff002114 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:32:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tcj9PEudEXU3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:32:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BMWOlM002109
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:32:36 +0100
Message-ID: <1434061944.28975.247.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 23:32:24 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] package_ipk/deb/rpm: Improve OVERRIDES handling
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
X-List-Received-Date: Thu, 11 Jun 2015 22:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Current code doesn't handle dynamic overrides so removing all
existing OVERRIDES works ok. In future this may not be the case
so ensure we add to existing overrides, not overwrite them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 9d7c59b..d797663 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -75,7 +75,7 @@ python do_package_deb () {
             pkgname = pkg
         localdata.setVar('PKG', pkgname)
 
-        localdata.setVar('OVERRIDES', pkg)
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
         bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index dba6804..9fb9d53 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -58,7 +58,7 @@ python do_package_ipk () {
             pkgname = pkg
         localdata.setVar('PKG', pkgname)
 
-        localdata.setVar('OVERRIDES', pkg)
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
         bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e305e8b..3988b73 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -330,7 +330,7 @@ python write_specfile () {
             pkgname = pkg
         localdata.setVar('PKG', pkgname)
 
-        localdata.setVar('OVERRIDES', pkg)
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
         bb.data.update_data(localdata)
 



