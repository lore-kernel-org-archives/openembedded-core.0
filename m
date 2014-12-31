Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3D760232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 02:59:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBV2xjjO010922
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 30 Dec 2014 18:59:45 -0800 (PST)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 30 Dec 2014 18:59:44 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Dec 2014 10:59:42 +0800
Message-ID: <1419994782-32245-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] oeqa/selftest: fix test_incremental_image_generation for changes in log output
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
X-List-Received-Date: Wed, 31 Dec 2014 02:59:55 -0000
Content-Type: text/plain

test_incremental_image_generation case failed because the log output
chanaged:

FAIL: test_incremental_image_generation (oeqa.selftest.buildoptions.ImageOptionsTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
  "/buildarea3/yzhao1/poky-build/meta/lib/oeqa/utils/decorators.py", line 90, in wrapped_f
    return func(*args)
  File
  "/buildarea3/yzhao1/poky-build/meta/lib/oeqa/selftest/buildoptions.py", line 25, in test_incremental_image_generation
    self.assertEqual(0, res.status, msg="No match for openssh-sshd in log.do_rootfs")
AssertionError: 0 != 1 : No match for openssh-sshd in log.do_rootfs
----------------------------------------------------------------------

Using re search instead grep

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/selftest/buildoptions.py |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 381741e..926ffe9 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -20,12 +20,15 @@ class ImageOptionsTests(oeSelfTest):
         self.write_config('INC_RPM_IMAGE_GEN = "1"')
         self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
         bitbake("core-image-minimal")
-        res = runCmd("grep 'Installing openssh-sshd' %s" % (os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")), ignore_status=True)
+        log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
+        log_data_created = ftools.read_file(log_data_file)
+        incremental_created = re.search("NOTE: load old install solution for incremental install\nNOTE: old install solution not exist\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: Installing the following packages:.*packagegroup-core-ssh-openssh", log_data_created)
         self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
-        self.assertEqual(0, res.status, msg="No match for openssh-sshd in log.do_rootfs")
+        self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
         bitbake("core-image-minimal")
-        res = runCmd("grep 'Removing openssh-sshd' %s" %(os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")),ignore_status=True)
-        self.assertEqual(0, res.status, msg="openssh-sshd was not removed from image")
+        log_data_removed = ftools.read_file(log_data_file)
+        incremental_removed = re.search("NOTE: load old install solution for incremental install\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: incremental removed:.*openssh-sshd-.*", log_data_removed)
+        self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     @testcase(925)
     def test_rm_old_image(self):
-- 
1.7.9.5


