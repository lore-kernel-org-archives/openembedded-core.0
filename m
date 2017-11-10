Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0173878635
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAADMlGV012124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:47 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:46 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:03 +0800
Message-ID: <aecb3b662009a7f5276b78f82463fd6fc9f8a957.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/23] populate_sdk_ext.bbclass: don't rename layers when failed
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:46 -0000
Content-Type: text/plain

The previous code:
os.rename(sdkbasepath, temp_sdkbasepath)
try:
    foo
finally:
    os.rename(temp_sdkbasepath, sdkbasepath)

always renamed the path, it made the debug harder when error happened.
drop the "try: finally" makes the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3620995..3826e08 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -162,18 +162,16 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
         except FileNotFoundError:
             pass
         os.rename(sdkbasepath, temp_sdkbasepath)
+        cmdprefix = '. %s .; ' % conf_initpath
+        logfile = d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
         try:
-            cmdprefix = '. %s .; ' % conf_initpath
-            logfile = d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
-            try:
-                oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_install_targets(d), tasklistfile, cmdprefix=cmdprefix, cwd=temp_sdkbasepath, logfile=logfile)
-            except bb.process.ExecutionError as e:
-                msg = 'Failed to generate filtered task list for extensible SDK:\n%s' %  e.stdout.rstrip()
-                if 'attempted to execute unexpectedly and should have been setscened' in e.stdout:
-                    msg += '\n----------\n\nNOTE: "attempted to execute unexpectedly and should have been setscened" errors indicate this may be caused by missing sstate artifacts that were likely produced in earlier builds, but have been subsequently deleted for some reason.\n'
-                bb.fatal(msg)
-        finally:
-            os.rename(temp_sdkbasepath, sdkbasepath)
+            oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_install_targets(d), tasklistfile, cmdprefix=cmdprefix, cwd=temp_sdkbasepath, logfile=logfile)
+        except bb.process.ExecutionError as e:
+            msg = 'Failed to generate filtered task list for extensible SDK:\n%s' %  e.stdout.rstrip()
+            if 'attempted to execute unexpectedly and should have been setscened' in e.stdout:
+                msg += '\n----------\n\nNOTE: "attempted to execute unexpectedly and should have been setscened" errors indicate this may be caused by missing sstate artifacts that were likely produced in earlier builds, but have been subsequently deleted for some reason.\n'
+            bb.fatal(msg)
+        os.rename(temp_sdkbasepath, sdkbasepath)
         # Clean out residue of running bitbake, which check_sstate_task_list()
         # will effectively do
         clean_esdk_builddir(d, sdkbasepath)
-- 
2.7.4


