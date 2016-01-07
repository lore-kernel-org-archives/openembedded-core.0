Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAE8B731F6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 03:30:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u073U9TA017633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 19:30:09 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jan 2016 19:30:09 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jan 2016 11:29:54 +0800
Message-ID: <1452137394-333-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [PATCH 3/3] oeqa/runtime/parselogs: escape special character for grep
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
X-List-Received-Date: Thu, 07 Jan 2016 03:30:10 -0000
Content-Type: text/plain

Sometimes the grep output is not correct if the log message contains
some special characters. Use re.escape to escape all non-alphanumerics
before grep

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/parselogs.py |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index fc2bc38..7fc7932 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -1,6 +1,7 @@
 import os
 import unittest
 import subprocess
+import re
 from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
 
@@ -50,7 +51,7 @@ x86_common = [
 qemux86_common = [
     'wrong ELF class',
     "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
-    "can't claim BAR ",
+    "can\'t claim BAR ",
 ] + common_errors
 
 ignore_errors = { 
@@ -221,7 +222,8 @@ class ParseLogsTest(oeRuntimeTest):
                 results[log.replace('target_logs/','')] = {}
                 rez = result.splitlines()
                 for xrez in rez:
-                    command = "grep \"\\"+str(xrez)+"\" -B "+str(lines_before)+" -A "+str(lines_after)+" "+str(log)
+                    nxrez = re.escape(xrez)
+                    command = "grep -E \""+str(nxrez)+"\" -B "+str(lines_before)+" -A "+str(lines_after)+" "+str(log)
                     try:
                         grep_output = subprocess.check_output(command, shell=True)
                     except:
-- 
1.7.9.5


