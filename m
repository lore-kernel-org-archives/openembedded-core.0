Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1890.1590086473445763795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 11:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04LIf8Xw028017
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 11:41:08 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Thu, 21 May 2020
 11:41:07 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] terminal.py: do not stop searching for auto
Date: Thu, 21 May 2020 11:41:07 -0700
Message-ID: <20200521184107.103889-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

If a terminal fails to spawn() we should continue looking.
gnome-terminal, in particular can be present but not start.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/lib/oe/terminal.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index a1daa2bed6..eb10a6e33e 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -207,7 +207,10 @@ def spawn_preferred(sh_cmd, title=None, env=None, d=None):
             spawn(terminal.name, sh_cmd, title, env, d)
             break
         except UnsupportedTerminal:
-            continue
+            pass
+        except:
+            bb.warn("Terminal %s is supported but did not start" % (terminal.name))
+    # when we've run out of options
     else:
         raise NoSupportedTerminals(get_cmd_list())
 
-- 
2.17.1

