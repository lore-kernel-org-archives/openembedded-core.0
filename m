Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.10284.1598441257955027333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 04:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07QBRY5Z018314
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:27:35 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 1/6] package_tar.bbclass: Sync to the other package_* classes
Date: Wed, 26 Aug 2020 06:27:28 -0500
Message-Id: <20200826112733.52492-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>

Sync up the anonymous python definition with the other package_*.bbclass
files.  This should make future maintenance easier, even though it has
no difference in behavior from what was there.

Additional, there was a missing deltask in the nopackages.bbclass related
to the package_tar which has been corrected.  This could cause problems on
native recipes when package_tar was enabled.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/nopackages.bbclass  | 1 +
 meta/classes/package_tar.bbclass | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

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
index ce3ab4c8e2..d6c1b306fc 100644
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
 
-- 
2.17.1

