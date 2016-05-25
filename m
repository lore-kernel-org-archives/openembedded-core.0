Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 327C770034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:23:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4P9NxXk012870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 02:23:59 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 02:23:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 May 2016 02:23:57 -0700
Message-ID: <1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464168189.git.liezhi.yang@windriver.com>
References: <cover.1464168189.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] utility-tasks.bbclass: fix do_listtasks
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
X-List-Received-Date: Wed, 25 May 2016 09:23:59 -0000
Content-Type: text/plain

It lists deleted tasks which is unexpected, use __BBTASKS to fix the
problem since deltask() which is defined in bitbake/lib/bb/build.py
updates __BBTASKS correctly.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/utility-tasks.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 7bc584a..b06d335 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -3,14 +3,14 @@ do_listtasks[nostamp] = "1"
 python do_listtasks() {
     taskdescs = {}
     maxlen = 0
-    for e in d.keys():
-        if d.getVarFlag(e, 'task', True):
-            maxlen = max(maxlen, len(e))
-            if e.endswith('_setscene'):
-                desc = "%s (setscene version)" % (d.getVarFlag(e[:-9], 'doc', True) or '')
-            else:
-                desc = d.getVarFlag(e, 'doc', True) or ''
-            taskdescs[e] = desc
+    bbtasks = d.getVar('__BBTASKS', True)
+    for task in bbtasks:
+        maxlen = max(maxlen, len(task))
+        if task.endswith('_setscene'):
+            desc = "%s (setscene version)" % (d.getVarFlag(task[:-9], 'doc', True) or '')
+        else:
+            desc = d.getVarFlag(task, 'doc', True) or ''
+        taskdescs[task] = desc
 
     tasks = sorted(taskdescs.keys())
     for taskname in tasks:
-- 
2.8.0


