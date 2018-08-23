Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2796B79507
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:56:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N7upi1019369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:56:51 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 00:56:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:07:25 +0800
Message-ID: <39ef539345dd647979c04b7e461e0d07b9634e85.1535011588.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011588.git.liezhi.yang@windriver.com>
References: <cover.1535011588.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] lib/oe/patch.py: Clean up getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 07:56:50 -0000
Content-Type: text/plain

We can't use subprocess.check_output() or subprocess.call() here since the one
who invokes runcmd() needs handle CmdError() exception (error out or ignore
it).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index af7aa52..e0f0604 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -21,6 +21,7 @@ class CmdError(bb.BBHandledException):
 
 def runcmd(args, dir = None):
     import pipes
+    import subprocess
 
     if dir:
         olddir = os.path.abspath(os.curdir)
@@ -33,7 +34,7 @@ def runcmd(args, dir = None):
         args = [ pipes.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
-        (exitstatus, output) = oe.utils.getstatusoutput(cmd)
+        (exitstatus, output) = subprocess.getstatusoutput(cmd)
         if exitstatus != 0:
             raise CmdError(cmd, exitstatus >> 8, output)
         if " fuzz " in output:
-- 
2.7.4


