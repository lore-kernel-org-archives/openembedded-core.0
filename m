Return-Path: <linus@scypho.com>
Received: from mx-out01.mykolab.com (mx.kolabnow.com [95.128.36.1])
	by mail.openembedded.org (Postfix) with ESMTP id 83E2A6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx03.mykolab.com (mx03.mykolab.com [10.20.7.101])
	by mx-out01.mykolab.com (Postfix) with ESMTPS id 0DDB360DAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 11:36:03 +0100 (CET)
Received: from linus by linus.scypho.com with local (Exim 4.87)
	(envelope-from <linus@scypho.com>)
	id 1c6EcM-0005Bb-1x; Mon, 14 Nov 2016 11:36:02 +0100
From: Linus Wallgren <linus.wallgren@scypho.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 11:35:44 +0100
Message-Id: <20161114103544.19886-1-linus.wallgren@scypho.com>
Cc: Linus Wallgren <linus.wallgren@scypho.com>
Subject: [PATCH] Supply correct argument to .deb pre/postinsts
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
X-List-Received-Date: Mon, 14 Nov 2016 10:36:05 -0000

The debian policy manual and MaintainerScripts wiki page states that the
postinst script is supposed to be called with the `configure` argument
at first install, likewise the preinst script is supposed to be called
with the `install` argument on first install.

https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html
https://wiki.debian.org/MaintainerScripts
---
 meta/lib/oe/package_manager.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3cee973..ec947c3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1993,7 +1993,10 @@ class DpkgPM(OpkgDpkgPM):
     """
     def run_pre_post_installs(self, package_name=None):
         info_dir = self.target_rootfs + "/var/lib/dpkg/info"
-        suffixes = [(".preinst", "Preinstall"), (".postinst", "Postinstall")]
+        ControlScript = collections.namedtuple("ControlScript", ["suffix", "name", "argument"])
+        control_scripts = [
+                ControlScript(".preinst", "Preinstall", "install"),
+                ControlScript(".postinst", "Postinstall", "configure")]
         status_file = self.target_rootfs + "/var/lib/dpkg/status"
         installed_pkgs = []
 
@@ -2016,16 +2019,18 @@ class DpkgPM(OpkgDpkgPM):
 
         failed_pkgs = []
         for pkg_name in installed_pkgs:
-            for suffix in suffixes:
-                p_full = os.path.join(info_dir, pkg_name + suffix[0])
+            for control_script in control_scripts:
+                p_full = os.path.join(info_dir, pkg_name + control_script.suffix)
                 if os.path.exists(p_full):
                     try:
                         bb.note("Executing %s for package: %s ..." %
-                                 (suffix[1].lower(), pkg_name))
-                        subprocess.check_output(p_full, stderr=subprocess.STDOUT)
+                                 (control_script.name.lower(), pkg_name))
+                        subprocess.check_output([p_full, control_script.argument],
+                                stderr=subprocess.STDOUT)
                     except subprocess.CalledProcessError as e:
                         bb.note("%s for package %s failed with %d:\n%s" %
-                                (suffix[1], pkg_name, e.returncode, e.output.decode("utf-8")))
+                                (control_script.name, pkg_name, e.returncode,
+                                    e.output.decode("utf-8")))
                         failed_pkgs.append(pkg_name)
                         break
 
-- 
2.10.2


