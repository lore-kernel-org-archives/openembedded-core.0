Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2DA6660F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:22:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5G3MxWE007110
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 20:22:59 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 20:22:58 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Jun 2014 23:22:57 -0400
Message-ID: <1402888977-658-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] archiver: create dir 'B' explicitly while WORKDIR changed
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
X-List-Received-Date: Mon, 16 Jun 2014 03:23:04 -0000
Content-Type: text/plain

From: Hongxu Jia <hongxu.jia@windriver.com>

In the do_unpack_and_patch task of archiver, the changed 'WORKDIR' also
casued 'B' changed, create dir 'B' for the possibly requiring of the
tasks which executed in do_unpack_and_patch task.

Such as cut-ecgl's do_patch required 'B' existed:
...
| cp: target 'tmp/work/x86_64-wrs-linux/cut-ecgl/1.0-r0/archiver-work
/cut-ecgl-1.0' is not a directory
...
| ERROR: Function failed: do_patch (log file is located at tmp/work/
x86_64-wrs-linux/cut-ecgl/1.0-r0/temp/do_unpack_and_patch/
log.do_unpack_and_patch.11886)
...

The 'B' dir is implicitly created at the task executing time while the
task tag 'dirs' is not assigned. In the above cut-ecgl example, the 'B'
was created at the wrl_buildlink executing time which is the prefuncs of
task do_unpack. So the following do_patch could use 'B' correctly. But
wrl_buildlink is unnecessary and not invoked in the do_unpack_and_patch
task.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/archiver.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index bcbc37d..0a8a019 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -288,6 +288,11 @@ python do_unpack_and_patch() {
     # Change the WORKDIR to make do_unpack do_patch run in another dir.
     d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
 
+    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
+    # possibly requiring of the following tasks (such as some recipes's
+    # do_patch required 'B' existed).
+    bb.utils.mkdirhier(d.getVar('B', True))
+
     # The kernel source is ready after do_validate_branches
     if bb.data.inherits_class('kernel-yocto', d):
         bb.build.exec_func('do_unpack', d)
-- 
1.7.9.5


