Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6B13A606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 13:36:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 06:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,362,1464678000"; d="scan'208";a="995194063"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.42.195])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 06:36:39 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 14:36:32 +0100
Message-Id: <8ca29bb46b3385cfb2d8c8874487d2cd1a4c0c27.1468503047.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468503047.git.joshua.g.lock@intel.com>
References: <cover.1468503047.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1468503047.git.joshua.g.lock@intel.com>
References: <cover.1468503047.git.joshua.g.lock@intel.com>
Subject: [RFC PATCH v2 1/1] image: add do_image_qa task to run QA checks on the constructed image
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
X-List-Received-Date: Thu, 14 Jul 2016 13:36:39 -0000

This task runs all functions in IMAGE_QA_COMMANDS after the image
construction has completed in order to validate the resulting image.

Image sanity checks should either be Python functions which raise
bb.build.FuncFailed on failure or shell functions with return a
non-zero exit code.

Python functions may instead raise an oe.utils.ImageQAFailed
Exception which takes an extra argument, a description of the
failure.

   python image_check_python_ok () {
       if True:
           raise bb.build.FuncFailed('This check always fails')
       else:
           bb.note("Nothing to see here")
   }

   image_check_shell_ok () {
       if true
           exit 1
       else
           exit 0
       fi
   }

[YOCTO #9448]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/image.bbclass | 30 ++++++++++++++++++++++++++++++
 meta/lib/oe/utils.py       | 13 +++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 30dfd64..8bda94a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -275,6 +275,36 @@ do_image_complete[dirs] = "${TOPDIR}"
 do_image_complete[umask] = "022"
 addtask do_image_complete after do_image before do_build
 
+# Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
+#
+# IMAGE_QA_COMMANDS += " \
+#     image_check_everything_ok \
+# "
+# This task runs all functions in IMAGE_QA_COMMANDS after the image
+# construction has completed in order to validate the resulting image.
+fakeroot python do_image_qa () {
+    from oe.utils import ImageQAFailed
+
+    qa_cmds = (d.getVar('IMAGE_QA_COMMANDS', True) or '').split()
+    qamsg = ""
+
+    for cmd in qa_cmds:
+        try:
+            bb.build.exec_func(cmd, d)
+        except oe.utils.ImageQAFailed as e:
+            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
+        except bb.build.FuncFailed as e:
+            qamsg = qamsg + '\Image QA function %s failed' % e.name
+            if e.logfile:
+                qamsg = qamsg + ' (log file is located at %s)' % e.logfile
+            qamsg = qamsg + '\n'
+
+    if qamsg:
+        imgname = d.getVar('IMAGE_NAME', True)
+        bb.fatal("QA errors found whilst validating image: %s\n%s" % (imgname, qamsg))
+}
+addtask do_image_qa after do_image_complete before do_build
+
 #
 # Write environment variables used by wic
 # to tmp/sysroots/<machine>/imgdata/<image>.env
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index cecddc6..19db540 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -304,3 +304,16 @@ def write_ld_so_conf(d):
     with open(ldsoconf, "w") as f:
         f.write(d.getVar("base_libdir", True) + '\n')
         f.write(d.getVar("libdir", True) + '\n')
+
+class ImageQAFailed(bb.build.FuncFailed):
+    def __init__(self, description, name=None, logfile=None):
+        self.description = description
+        self.name = name
+        self.logfile=logfile
+
+    def __str__(self):
+        msg = 'Function failed: %s' % self.name
+        if self.description:
+            msg = msg + ' (%s)' % self.description
+
+        return msg
-- 
2.7.4


