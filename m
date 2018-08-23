Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 558717950F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:56:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N7utnw019384
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:56:55 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 00:56:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:07:28 +0800
Message-ID: <f3b19c25a3c5235bfa3e28a58961a09aeb0bef47.1535011588.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011588.git.liezhi.yang@windriver.com>
References: <cover.1535011588.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] compress_doc.bbclass: Clean up getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 07:56:54 -0000
Content-Type: text/plain

Replace usage of oe.utils.getstatusoutput() with direct subprocess calls.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/compress_doc.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index 069d534..45bb8ff 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -79,6 +79,7 @@ def _collect_hardlink(hardlink_dict, file):
     return hardlink_dict
 
 def _process_hardlink(hardlink_dict, compress_mode, shell_cmds, decompress=False):
+    import subprocess
     for target in hardlink_dict:
         if decompress:
             compress_format = _get_compress_format(target, shell_cmds.keys())
@@ -87,7 +88,7 @@ def _process_hardlink(hardlink_dict, compress_mode, shell_cmds, decompress=False
         else:
             cmd = "%s -f %s" % (shell_cmds[compress_mode], target)
             bb.note('compress hardlink %s' % target)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
+        (retval, output) = subprocess.getstatusoutput(cmd)
         if retval:
             bb.warn("de/compress file failed %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
             return
@@ -176,7 +177,7 @@ def compress_doc(topdir, compress_mode, compress_cmds):
                 # Normal file
                 elif os.path.isfile(file):
                     cmd = "%s %s" % (compress_cmds[compress_mode], file)
-                    (retval, output) = oe.utils.getstatusoutput(cmd)
+                    (retval, output) = subprocess.getstatusoutput(cmd)
                     if retval:
                         bb.warn("compress failed %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
                         continue
@@ -206,7 +207,7 @@ def decompress_doc(topdir, compress_mode, decompress_cmds):
                 # Normal file
                 elif os.path.isfile(file):
                     cmd = "%s %s" % (decompress_cmds[compress_format], file)
-                    (retval, output) = oe.utils.getstatusoutput(cmd)
+                    (retval, output) = subprocess.getstatusoutput(cmd)
                     if retval:
                         bb.warn("decompress failed %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
                         continue
-- 
2.7.4


