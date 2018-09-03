Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF5D75258
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 07:10:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w837ABgU017759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2018 00:10:11 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 00:09:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 3 Sep 2018 15:09:56 +0800
Message-ID: <1535958596-11573-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] devshell.bbclass/terminal.bbclass: add a shell check at devshell
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
X-List-Received-Date: Mon, 03 Sep 2018 07:10:12 -0000
Content-Type: text/plain

While var-SHELL is neither `bash' or `dash', such as
`csh', loading the wrapper script will fail at devshell,
because csh does not support syntax `export'.

Add a shell check at devshell, and use `/bin/sh' to replace
if shell is neither `bash' or `dash'. `/bin/sh' is safe to
use since `ecdfdd7 sanity.bbclass: check /bin/sh is dash
or bash'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/devshell.bbclass | 4 ++++
 meta/classes/terminal.bbclass | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index fdf7dc1..c4765db 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -3,6 +3,10 @@ inherit terminal
 DEVSHELL = "${SHELL}"
 
 python do_devshell () {
+    devshell = d.getVar('DEVSHELL')
+    devshell = devshell if devshell.endswith("bash") or devshell.endswith("dash") else '/bin/sh'
+    d.setVar('DEVSHELL', devshell)
+
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
        fakeenv = d.getVar("FAKEROOTENV").split()
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 73e765d..f427538 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -25,7 +25,9 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
-        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
+        shell = d.getVar('SHELL')
+        shell = shell if shell.endswith("bash") or shell.endswith("dash") else '/bin/sh'
+        script.write('#!/usr/bin/env %s\n' % shell)
         script.write('set -e\n')
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
-- 
2.7.4


