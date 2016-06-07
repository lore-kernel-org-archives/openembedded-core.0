Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6E865731CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 14:50:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 07:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,433,1459839600"; d="scan'208";a="970662493"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.25.208])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2016 07:50:41 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 15:50:37 +0100
Message-Id: <1465311037-17658-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] image: add mechanism to run QA checks on the image once it's built
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
X-List-Received-Date: Tue, 07 Jun 2016 14:50:43 -0000

Add a mechanism to run QA checks on a constructed image once it's
complete. All checks will be run with any one failure resulting in
a failed build.

QA checks should be bitbake functions which throw a
NotImplementedError when the check QA fails, with any error
messages passed to the exception.

Specify which checks to run by adding them to IMAGE_QA_COMMANDS.

i.e.

IMAGE_QA_COMMANDS += " \
    image_check_everything_ok \
"

python image_check_everything_ok () {
    raise NotImplementedError('This check always fails')
}

This code is based heavily on the configuration upgrade code in
sanity.bbclass.

[YOCTO #9448]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/image.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9f4c83f..40bcd16 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -260,6 +260,35 @@ do_image_complete[dirs] = "${TOPDIR}"
 do_image_complete[umask] = "022"
 addtask do_image_complete after do_image before do_build
 
+# Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
+#
+# IMAGE_QA_COMMANDS += " \
+#     image_check_everything_ok \
+# "
+# This task runs all functions in IMAGE_QA_COMMANDS after the image
+# construction has completed in order to validate the resulting image.
+# Image sanity checks should raise a NotImplementedError when they fail,
+# passing any failure messages to the Exception. For example:
+#
+#    python image_check_everything_ok () {
+#        raise NotImplementedError('This check always fails')
+#    }
+fakeroot python do_image_qa () {
+    qa_cmds = (d.getVar('IMAGE_QA_COMMANDS', True) or '').split()
+    imageqasane = True
+
+    for cmd in qa_cmds:
+        try:
+            bb.build.exec_func(cmd, d, pythonexception=True)
+        except NotImplementedError as e:
+            imageqasane = False
+            bb.error(str(e))
+
+    if not imageqasane:
+        bb.fatal("QA errors found whilst validating image: %s" % d.getVar('IMAGE_NAME', True))
+}
+addtask do_image_qa after do_image_complete before do_build
+
 #
 # Write environment variables used by wic
 # to tmp/sysroots/<machine>/imgdata/<image>.env
-- 
2.7.4


