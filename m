Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 37524731A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:56:03 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so34596034wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pCPUdn98xzIraZC6e6gf2ar7lL/y23BjZP2WvGEG1jM=;
	b=uq23MMI7wugS2CAQE2ygK40lGpFBuZANImdqlzjF16wb3r3a2nbLR+5Nx2xv0au4Sq
	dFZFlw/XabseD/6hok998pFhhl6mifWx7remJc8J3+vy9BQN8Sk7Cz+M2jWZhBh4Tv6x
	LkDxLMla6uljcmEKDsu4Jy4bC4oziubGMTbVwxD+cH+Y6hHOgK9lf/oXJPTOqeV5dKaU
	tEHDaGOx+KIK+VeK8AnHh8UP2wFHtsxoqmKOe6fFzFCfIoLOmHlBrGYtIvElw+IxYh/j
	9SXxIMpp/uWbn5m3wOoO2/0vHY2bbYGEKKgDI+7JD299lqZK1Wf+NN8iS6kMYeRpgqVg
	6FhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pCPUdn98xzIraZC6e6gf2ar7lL/y23BjZP2WvGEG1jM=;
	b=RKG9x74lRFZmK1nMHyXgwqsUKyPbywLky4/gXHJN49246z8PMLdf83d4cOQHAfz+oR
	SU6tys7sVUYRj8tcCYaGLXVLeroMs86PTbSuWXYGGsdgdWh93DYNapPYDo+0K2ZJY9+l
	vexZzU45Nl6qkYYTxumrVjzXL4a9uH5mgTIXYAhNjZ0AS+MNlg0wZYWROdN176EQIUho
	W526xM85jaWu4MC3m9HPtmEg6MPRxVI++A1uYTsfOK2Q3kR2YOVQE14GyKTVeuMfWZQM
	oFC7diV8285cEvJiHoQlckPqqdy17UXcCIsEUBK6o5cQvuilAMNZuu+qYra0SYE0apuO
	BPSQ==
X-Gm-Message-State: AD7BkJKScIhtg+AfazD4mXdCD6lUZMLekxov08nB9SfCILnF7CVMqtyGSHO0jcNa3HtHg2VG
X-Received: by 10.194.63.7 with SMTP id c7mr4755785wjs.168.1457625363616;
	Thu, 10 Mar 2016 07:56:03 -0800 (PST)
Received: from draco.icx.intel.com ([83.217.123.106])
	by smtp.gmail.com with ESMTPSA id up6sm4166699wjc.6.2016.03.10.07.56.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Mar 2016 07:56:03 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 15:55:54 +0000
Message-Id: <1457625354-11657-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: brian avery <brian.avery@intel.com>
Subject: [PATCH] toaster.bbclass: show packages that were setscened into existence too
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
X-List-Received-Date: Thu, 10 Mar 2016 15:56:05 -0000

From: brian avery <avery.brian@gmail.com>

We were previously ignoring pkgs that came in from a setscene like from
an sstate mirror).  With this patch we can use pkgs than come from sstate
for image customisation as well.

Also remove unused variable.

[YOCTO #9137]

Signed-off-by: brian avery <brian.avery@intel.com>
Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/toaster.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index a17501e..1c0703c 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -112,6 +112,26 @@ def _toaster_load_pkgdatafile(dirpath, filepath):
                 pass    # ignore lines without valid key: value pairs
     return pkgdata
 
+python toaster_package_dumpdata_setscene() {
+    """
+    Dumps the data created by package_setscene
+    """
+    # replicate variables from the package.bbclass
+    packages = d.getVar('PACKAGES', True)
+    pkgdatadir = d.getVar('PKGDATA_DIR', True)
+    # scan and send data for each package
+    lpkgdata = {}
+    for pkg in packages.split():
+        try:
+          lpkgdata = _toaster_load_pkgdatafile(pkgdatadir + "/runtime/", pkg)
+        except:
+          # these are typically foo-locale which actually point into foo-locale-<language> in runtime-rprovides
+          bb.note("toaster_package_dumpdata_setscene: failed to load pkg information for: %s:%s"%(pkg,sys.exc_info()[0]))
+        # Fire an event containing the pkg data
+        bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
+
+}
+
 
 python toaster_package_dumpdata() {
     """
@@ -120,8 +140,6 @@ python toaster_package_dumpdata() {
     # replicate variables from the package.bbclass
 
     packages = d.getVar('PACKAGES', True)
-    pkgdest = d.getVar('PKGDEST', True)
-
     pkgdatadir = d.getVar('PKGDESTWORK', True)
 
     # scan and send data for each package
@@ -382,6 +400,9 @@ toaster_collect_task_stats[eventmask] = "bb.event.BuildCompleted bb.build.TaskSu
 addhandler toaster_buildhistory_dump
 toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
 
+do_packagedata_setscene[postfuncs] += "toaster_package_dumpdata_setscene "
+do_packagedata_setscene[vardepsexclude] += "toaster_package_dumpdata_setscene "
+
 do_package[postfuncs] += "toaster_package_dumpdata "
 do_package[vardepsexclude] += "toaster_package_dumpdata "
 
-- 
2.1.4


