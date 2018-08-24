Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42742795FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF04p3003239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:05 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:50 -0400
Message-ID: <f04fdefbba7c8da549670f705c123b2286ed8682.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:04 -0000
Content-Type: text/plain

From: Joshua Watt <jpewhacker@gmail.com>

Replace usage of os.utils.getstatusoutput() with direct subprocess
calls. Pass a modified environment and working directory where necessary
to bypass the need to execute in a shell.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  | 24 +++++++++++++++-------
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 077a1ab8ef71..19d74a78757b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -321,7 +321,7 @@ do_kernel_configme() {
 addtask kernel_configme before do_configure after do_patch
 
 python do_kernel_configcheck() {
-    import re, string, sys
+    import re, string, sys, subprocess
 
     # if KMETA isn't set globally by a recipe using this routine, we need to
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
@@ -330,16 +330,26 @@ python do_kernel_configcheck() {
     if not os.path.exists(kmeta):
         kmeta = "." + kmeta
 
-    pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH'), "${S}/scripts/util/")
+    s = d.getVar('S')
 
-    cmd = d.expand("scc --configs -o ${S}/.kernel-meta")
-    ret, configs = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
+    env = os.environ.copy()
+    env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
 
-    cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
-    ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
+    try:
+        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
+    except subprocess.CalledProcessError:
+        bb.fatal( "Cannot gather config fragments for audit: %s" % configs)
+
+    try:
+        subprocess.check_call(['kconf_check', '--report', '-o',
+                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s, configs], cwd=s, env=env)
+    except subprocess.CalledProcessError:
+        # The configuration gathering can return different exit codes, but
+        # we interpret them based on the KCONF_AUDIT_LEVEL variable, so we catch
+        # everything here, and let the run continue.
+        pass
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
-    bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
 
     # if config check visibility is non-zero, report dropped configuration values
     mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4ccf9b07f306..dca567f783b3 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "8cd13500a27c0a6a911cc83c0349dec01ef66e27"
+SRCREV = "602237a57487e969016db3085d181b585f5a74a7"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


