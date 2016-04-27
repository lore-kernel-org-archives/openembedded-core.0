Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4411E731EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 02:20:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3R2KWTA028864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:20:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 19:20:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Apr 2016 19:20:26 -0700
Message-ID: <60a6b185a9bd89574d7a0d74347be022a499d8c9.1461723377.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461723377.git.liezhi.yang@windriver.com>
References: <cover.1461723377.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] insane.bbclass: package_qa_check_license -> populate_lic_qa_checksum
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
X-List-Received-Date: Wed, 27 Apr 2016 02:20:32 -0000
Content-Type: text/plain

The package_qa_check_license() was in do_qa_configure which had a
potential problem, when the recipe sets do_configure[noexec] = "1", then
the license checking won't run, which may hidden license issues. Rename
it to populate_lic_qa_checksum() and run in do_populate_lic[postfuncs] which
is more reasonable (when no populate license, no license checking).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a1d23d0..097dc3a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -672,7 +672,9 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
                 package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
-def package_qa_check_license(d):
+# Check license variables
+do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
+python populate_lic_qa_checksum() {
     """
     Check for changes in the license files 
     """
@@ -753,6 +755,7 @@ def package_qa_check_license(d):
                 msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                 msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
             package_qa_handle_error("license-checksum", msg, d)
+}
 
 def package_qa_check_staged(path,d):
     """
@@ -1208,12 +1211,6 @@ Rerun configure task after fixing this.""")
 Missing inherit gettext?""" % (gt, config))
 
     ###########################################################################
-    # Check license variables
-    ###########################################################################
-
-    package_qa_check_license(d)
-
-    ###########################################################################
     # Check unrecognised configure options (with a white list)
     ###########################################################################
     if bb.data.inherits_class("autotools", d):
@@ -1261,8 +1258,8 @@ python do_qa_unpack() {
 #addtask qa_staging after do_populate_sysroot before do_build
 do_populate_sysroot[postfuncs] += "do_qa_staging "
 
-# Check broken config.log files, for packages requiring Gettext which don't
-# have it in DEPENDS and for correct LIC_FILES_CHKSUM
+# Check broken config.log files, for packages requiring Gettext which
+# don't have it in DEPENDS.
 #addtask qa_configure after do_configure before do_compile
 do_configure[postfuncs] += "do_qa_configure "
 
-- 
2.7.4


