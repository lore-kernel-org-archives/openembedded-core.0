Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A65BC607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMlli5021887 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:47:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LbcJORGBt6bg
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:47:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMlUrX021869
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:47:42 +0100
Message-ID: <1437086850.3310.174.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 23:47:30 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] package_ipk/deb: Drop version information from RPROVIDES
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
X-List-Received-Date: Thu, 16 Jul 2015 22:47:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In some scenarios rpm needs version information from RPROVIDES. We can
add this to the metadata where needed however we need to stop it entering
the ipk/deb packages. This data is not needed due to the way opkg/dpkg
handle the data.

This patch ensures that data isn't used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index a165a9a..9e1ed28 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -215,7 +215,8 @@ python do_package_deb () {
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
         debian_cmp_remap(rsuggests)
-        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
+        # Deliberately drop version information here, not wanted/supported by deb
+        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
         debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e7109a9..a0fa62c 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -188,7 +188,8 @@ python do_package_ipk () {
         debian_cmp_remap(rrecommends)
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
         debian_cmp_remap(rsuggests)
-        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
+        # Deliberately drop version information here, not wanted/supported by ipk
+        rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or ""), [])
         debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)



