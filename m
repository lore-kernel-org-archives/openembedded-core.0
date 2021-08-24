Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.1113.1629822388143549583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360365"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360365"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659083"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/28] utils: Reduce the number of calls to the "dirname" command
Date: Wed, 25 Aug 2021 00:25:25 +0800
Message-Id: <0646862d238192c86774744216eb88aeee5e784f.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Popovych <opopovyc@cisco.com>

utils.bbclass contains create_cmdline_wrapper() function that
creates wrapper script with additional arguments for any passed
"$cmd" command, and uses several calls to "dirname".

Because "dirname" is an external command, in cases of lots of
calls to wrapped "$cmd", each call of "dirname" will incur
significant overhead.

There are three same calls to "dirname": one for saving it`s
output to "realdir" variable, and other two in "exec" command.
So last two "dirname" calls can be replaced with cached value
from "realdir" variable.

Signed-off-by: Oleksandr Popovych <opopovyc@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b9cf2c80fd14386e0b88a2e6c40a9fa3f1ae0f7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/utils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 120bcc64a6..072ea1f63c 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -214,7 +214,7 @@ create_cmdline_wrapper () {
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
 realdir=\`dirname \$realpath\`
-exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real $cmdoptions "\$@"
+exec -a \$realdir/$cmdname \$realdir/$cmdname.real $cmdoptions "\$@"
 END
 	chmod +x $cmd
 }
-- 
2.31.1

