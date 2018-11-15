Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBB796011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 08:17:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAF8HEel019817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 00:17:24 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 15 Nov 2018 00:16:57 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 16:16:55 +0800
Message-ID: <1542269815-299741-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] checklayer: generate locked-sigs.inc under builddir
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
X-List-Received-Date: Thu, 15 Nov 2018 08:17:34 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

yocto-check-layer will find locked-sigs.inc under builddir,
but locked-sigs.inc is generated under current bitbake working
dir. if run yocto-check-layer outside builddir, we will met error
like "No such file or directory: *locked-sigs.inc". change to
run bitbake -S under builddir to fix this problem.

[YOCTO #12973]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 scripts/lib/checklayer/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 7788041..ca7863a 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -221,13 +221,13 @@ def add_layer(bblayersconf, layer, layers, logger):
 
     return True
 
-def check_command(error_msg, cmd):
+def check_command(error_msg, cmd, cwd=None):
     '''
     Run a command under a shell, capture stdout and stderr in a single stream,
     throw an error when command returns non-zero exit code. Returns the output.
     '''
 
-    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd=cwd)
     output, _ = p.communicate()
     if p.returncode:
         msg = "%s\nCommand: %s\nOutput:\n%s" % (error_msg, cmd, output.decode('utf-8'))
@@ -257,7 +257,7 @@ def get_signatures(builddir, failsafe=False, machine=None):
         os.unlink(sigs_file)
     try:
         check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
-                      cmd)
+                      cmd, builddir)
     except RuntimeError as ex:
         if failsafe and os.path.exists(sigs_file):
             # Ignore the error here. Most likely some recipes active
-- 
2.7.4


