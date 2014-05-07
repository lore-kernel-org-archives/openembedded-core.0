Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id F08A360703
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 09:20:26 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u14so917290lbd.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UKOLkrZ/pW/G6IG3eCdMFf6gILKGCWkuYo8OlqCqViU=;
	b=riwg1Mibgm5Ra0GdbiKS59uXUnOlVC54nbWQQwZ2vdVfCgA8o2fWwThgyHiFlEi0Dr
	PQ+fT3bB9mK3soPmBg4Aznc+U+u79HO5fSCehdtU4e4jinkAEP7oGj85HSLyyCpF9HTS
	v6bpbUde5/tnzlDuXT3agGZ3PJsIE+GyWIsHDI1Mt0ULbGyjGtyxpNkJsoDIFAWQ5qT1
	1Nd8jmXr0l4wq2Gjo5kPcpDoTBVm18C63eR079qDR+xRT3LvO2Utpd3Yfn0M8HZmS+7R
	ybiP8RF41Y9iDOKBLg6QwEf7/KfWogZ900u+9GpGzUxYV8ecnJ5Lr2NhRtNmmrmJZVW2
	YeMQ==
X-Received: by 10.113.5.40 with SMTP id cj8mr287071lbd.69.1399454426567;
	Wed, 07 May 2014 02:20:26 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217])
	by mx.google.com with ESMTPSA id bj7sm758301lbc.22.2014.05.07.02.20.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 May 2014 02:20:24 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org
Date: Wed,  7 May 2014 11:20:20 +0200
Message-Id: <1399454420-12823-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.0.0.rc0
Subject: [PATCH] package_manager: Fix Argument list too long
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
X-List-Received-Date: Wed, 07 May 2014 09:20:27 -0000

Function buildhistory_list_installed_image fails with error "Argument
list too long". This patch uses a temporal file to pass the package list
to opkg-query-helper.py

File: '/var/lib/jenkins/jobs/qt5022-cesium/workspace/repo/yocto/meta/lib/oe/package_manager.py', lineno: 421, function: list
     0417:            try:
     0418:                output = subprocess.check_output("echo -e '%s' | %s" %
     0419:                                                 (output, opkg_query_cmd),
     0420:                                                 stderr=subprocess.STDOUT,
 *** 0421:                                                 shell=True)
     0422:            except subprocess.CalledProcessError as e:
     0423:                bb.fatal("Cannot compute packages dependencies. Command '%s' "
     0424:                         "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
     0425:
Exception: OSError: [Errno 7] Argument list too long

ERROR: Function failed: buildhistory_list_installed_image
ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/work/qt5022-poky-linux/qimage-dev/1.0-r0/temp/log.do_rootfs.16747
NOTE: recipe qimage-dev-1.0-r0: task do_rootfs: Failed
ERROR: Task 7 (/var/lib/jenkins/jobs/qt5022-cesium/workspace/repo/yocto/../qtec/meta-qt5022/recipes-core/images/qimage-dev.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4999 tasks of which 30 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
Auto packing the repository for optimum performance.

Summary: 1 task failed:
  /var/lib/jenkins/jobs/qt5022-cesium/workspace/repo/yocto/../qtec/meta-qt5022/recipes-core/images/qimage-dev.bb, do_rootfs
Summary: There were 74 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/lib/oe/package_manager.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a8360fe..3aff9d8 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -6,6 +6,7 @@ import shutil
 import multiprocessing
 import re
 import bb
+import tempfile
 
 
 # this can be used by all PM backends to create the index files in parallel
@@ -411,16 +412,22 @@ class DpkgPkgsList(PkgsList):
             output = tmp_output
         elif format == "deps":
             opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
+            file_out = tempfile.NamedTemporaryFile()
+            file_out.write(output)
+            file_out.flush()
 
             try:
-                output = subprocess.check_output("echo -e '%s' | %s" %
-                                                 (output, opkg_query_cmd),
+                output = subprocess.check_output("cat %s | %s" %
+                                                 (file_out.name, opkg_query_cmd),
                                                  stderr=subprocess.STDOUT,
                                                  shell=True)
             except subprocess.CalledProcessError as e:
+                file_out.close()
                 bb.fatal("Cannot compute packages dependencies. Command '%s' "
                          "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
 
+            file_out.close()
+
         return output
 
 
-- 
2.0.0.rc0


