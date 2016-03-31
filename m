Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F17EE6E660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 22:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VMsdte013577 for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 23:54:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BoubvuoPmTcr
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 23:54:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2VMsYDd013574
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 23:54:35 +0100
Message-ID: <1459464874.21672.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2016 23:54:34 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] selftest/signing: Use packagedata to obtain PR value for signing test
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
X-List-Received-Date: Thu, 31 Mar 2016 22:54:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Using PF to calculate the rpm filename doesn't work when PR server is
enabled and an extra PR value can be injected. Add code to use packagedata
to obtain the full name, allowing the test to work when PR server is
in use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 312e502..681a959 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -46,6 +46,7 @@ class Signing(oeSelfTest):
         Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
+        import oe.packagedata
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
         if 'package_rpm' not in package_classes:
@@ -65,13 +66,18 @@ class Signing(oeSelfTest):
         bitbake(test_recipe)
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
-        pf = get_bb_var('PF', test_recipe)
+        pkgdatadir = get_bb_var('PKGDATA_DIR', test_recipe)
+        pkgdata = oe.packagedata.read_pkgdatafile(pkgdatadir + "/runtime/ed")
+        if 'PKGE' in pkgdata:
+            pf = pkgdata['PN'] + "-" + pkgdata['PKGE'] + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
+        else:
+            pf = pkgdata['PN'] + "-" + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
         deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', test_recipe)
         package_arch = get_bb_var('PACKAGE_ARCH', test_recipe).replace('-', '_')
         staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE')
 
         pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
 
         # Use a temporary rpmdb
         rpmdb = tempfile.mkdtemp(prefix='oeqa-rpmdb')
 



