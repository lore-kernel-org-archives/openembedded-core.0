Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1004.1629822353115062713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360263"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360263"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658968"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:50 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/28] terminal.bbclass: force bash for devshell
Date: Wed, 25 Aug 2021 00:25:14 +0800
Message-Id: <48fe148e5ca344d2a6bad444ef48d9c5ea414448.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Since shell_trap_code in build.py sets /bin/sh as the interpreter
we will die a silent death if our environment contains things like
"export -f bodilyfunction" and /bin/sh is really /bin/dash.

Fixes this for the case of devshell.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23d296b3567aa31bad7b2a8558d4bd3e4505843b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/terminal.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 6059ae95e0..a564ee7494 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -26,6 +26,9 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
+        # Override the shell shell_trap_code specifies.
+        # If our shell is bash, we might well face silent death.
+        script.write("#!/bin/bash\n")
         script.write(bb.build.shell_trap_code())
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
@@ -37,7 +40,7 @@ def emit_terminal_func(command, envdata, d):
 def oe_terminal(command, title, d):
     import oe.data
     import oe.terminal
-
+    
     envdata = bb.data.init()
 
     for v in os.environ:
-- 
2.31.1

