Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 900846A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ0VE5006826 for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:00:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q61xyGg4Ae-O
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:00:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ0SST006822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:00:29 +0100
Message-ID: <1411498831.15825.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 20:00:31 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] update-rc.d/systemd: Remove OVERRIDES dependency
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
X-List-Received-Date: Tue, 23 Sep 2014 19:00:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Taking run-postinsts and building for two machines which have different
OVERRIDES leads to two different sets of stamps for an allarch package.

We don't need to depend on OVERRIDES in these classes, the end resulting
variables are good enough. We can therefore exclude the dependency
and allow a single package to be generated for run-postinsts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index a6ad723..708ba89 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -55,6 +55,8 @@ fi
 
 
 systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
+systemd_populate_packages[vardepsexclude] += "OVERRIDES"
+
 
 python systemd_populate_packages() {
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 3c5414b..bc1aa7d 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -72,6 +72,7 @@ PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
 PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
+populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
 
 python populate_packages_updatercd () {
     def update_rcd_auto_depend(pkg):



