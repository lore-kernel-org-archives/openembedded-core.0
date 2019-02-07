Return-Path: <prvs=39412d319b=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D48156BE3A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 15:58:01 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x17FuJq3027078 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2019 09:58:03 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2qfumjvv3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:58:03 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x17Fw25V006178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2019 09:58:02 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Feb 2019 09:58:01 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Feb 2019 09:58:01 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2019 09:57:59 -0600
Message-ID: <20190207155759.6082-4-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
References: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-07_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 3/3] OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS
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
X-List-Received-Date: Thu, 07 Feb 2019 15:58:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently, BAD_RECOMMENDATIONS on the opkg backed relies on editing the
opkg status file (it sets BAD_RECOMMENDATIONS pkg want state to
deinstalled and pinned). This is brittle, and not consistent across the
different solver backends. Use new --add-ignore-recommends flag instead.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/lib/oe/package_manager.py | 41 ++--------------------------------
 meta/lib/oe/rootfs.py          |  2 --
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f26f597d03..7e7d7db083 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1339,6 +1339,8 @@ class OpkgPM(OpkgDpkgPM):
         cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
         for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
             cmd += " --add-exclude %s" % exclude
+        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
+            cmd += " --add-ignore-recommends %s" % bad_recommendation
         cmd += " install "
         cmd += " ".join(pkgs)
 
@@ -1407,45 +1409,6 @@ class OpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
 
-    def handle_bad_recommendations(self):
-        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS") or ""
-        if bad_recommendations.strip() == "":
-            return
-
-        status_file = os.path.join(self.opkg_dir, "status")
-
-        # If status file existed, it means the bad recommendations has already
-        # been handled
-        if os.path.exists(status_file):
-            return
-
-        cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
-
-        with open(status_file, "w+") as status:
-            for pkg in bad_recommendations.split():
-                pkg_info = cmd + pkg
-
-                try:
-                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip().decode("utf-8")
-                except subprocess.CalledProcessError as e:
-                    bb.fatal("Cannot get package info. Command '%s' "
-                             "returned %d:\n%s" % (pkg_info, e.returncode, e.output.decode("utf-8")))
-
-                if output == "":
-                    bb.note("Ignored bad recommendation: '%s' is "
-                            "not a package" % pkg)
-                    continue
-
-                for line in output.split('\n'):
-                    if line.startswith("Status:"):
-                        status.write("Status: deinstall hold not-installed\n")
-                    else:
-                        status.write(line + "\n")
-
-                # Append a blank line after each package entry to ensure that it
-                # is separated from the following entry
-                status.write("\n")
-
     def dummy_install(self, pkgs):
         """
         The following function dummy installs pkgs and returns the log of output.
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 551dcfc75f..cf5cd996a2 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -891,8 +891,6 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.update()
 
-        self.pm.handle_bad_recommendations()
-
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-- 
2.20.1


