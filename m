Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E955265CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGvqec015102 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:57:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 48eJwjFhr0mh
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:57:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGvbrV015094
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:57:48 +0100
Message-ID: <1440521857.12105.436.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:57:37 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] package_*.bbclass: Ensure OVERRIDES doesn't change sstate signature
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
X-List-Received-Date: Tue, 25 Aug 2015 16:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Changes to OVERRIDES (e.g. from changing MACHINE) should not change
the sstate signatures of do_package_write_*. Exclude the variable
explicitly in the package classes to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 398ceee..d2fea4f 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -288,6 +288,9 @@ python do_package_deb () {
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 }
+# Otherwise allarch packages may change depending on override configuration
+do_package_deb[vardepsexclude] = "OVERRIDES"
+
 
 SSTATETASKS += "do_package_write_deb"
 do_package_write_deb[sstate-inputdirs] = "${PKGWRITEDIRDEB}"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a0fa62c..4dd7a7e 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -250,6 +250,8 @@ python do_package_ipk () {
         bb.utils.unlockfile(lf)
 
 }
+# Otherwise allarch packages may change depending on override configuration
+do_package_ipk[vardepsexclude] = "OVERRIDES"
 
 SSTATETASKS += "do_package_write_ipk"
 do_package_write_ipk[sstate-inputdirs] = "${PKGWRITEDIRIPK}"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 8fd0685..264438b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -645,6 +645,8 @@ python write_specfile () {
 
     specfile.close()
 }
+# Otherwise allarch packages may change depending on override configuration
+write_specfile[vardepsexclude] = "OVERRIDES"
 
 python do_package_rpm () {
     # We need a simple way to remove the MLPREFIX from the package name,




