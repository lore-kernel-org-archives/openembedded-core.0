Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.2998.1598311774884424790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 16:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07ONTUA3010752
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 18:29:31 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 1/5] package_tar.bbclass: Sync to the other package_* classes
Date: Mon, 24 Aug 2020 18:29:26 -0500
Message-Id: <20200824232930.150388-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>

Sync up the task definitions with the other package classes.  This may not
have been strictly necessary but will make overall maintenance easier as
the various package classes are now in sync.

Additional, there was a missing deltask in the nopackages.bbclass related
to the package_tar which has been corrected.  This could cause problems on
native recipes when package_tar was enabled.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/nopackages.bbclass  |  1 +
 meta/classes/package_tar.bbclass | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f5078bd..7a4f632d71 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -2,6 +2,7 @@ deltask do_package
 deltask do_package_write_rpm
 deltask do_package_write_ipk
 deltask do_package_write_deb
+deltask do_package_write_tar
 deltask do_package_qa
 deltask do_packagedata
 deltask do_package_setscene
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index ce3ab4c8e2..8946bc212a 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -57,10 +57,8 @@ python do_package_tar () {
 
 python () {
     if d.getVar('PACKAGES') != '':
-        deps = (d.getVarFlag('do_package_write_tar', 'depends') or "").split()
-        deps.append('tar-native:do_populate_sysroot')
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
+        deps = ' tar-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        d.appendVarFlag('do_package_write_tar', 'depends', deps)
         d.setVarFlag('do_package_write_tar', 'fakeroot', "1")
 }
 
@@ -70,4 +68,7 @@ python do_package_write_tar () {
     bb.build.exec_func("do_package_tar", d)
 }
 do_package_write_tar[dirs] = "${D}"
-addtask package_write_tar before do_build after do_packagedata do_package
+do_package_write_tar[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
+addtask package_write_tar after do_packagedata do_package
+
+do_build[recrdeptask] += "do_package_write_tar"
-- 
2.17.1

