Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 527DB71226
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:43:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T6hpgP023182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:43:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 23:43:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Fri, 29 Aug 2014 14:43:38 +0800
Message-ID: <aeb4ac10193d4129b4391b2bf7977ed7e74ebd9b.1409294050.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409294050.git.hongxu.jia@windriver.com>
References: <cover.1409294050.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bbclass/sstate: add hook SSTATE_CHECK_FUNCTIONS for sstate checking
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
X-List-Received-Date: Fri, 29 Aug 2014 06:43:51 -0000
Content-Type: text/plain

Provide hook for sstate checking, the checking failure will
break the building immediately. Pass input parameters by
bb.data (d.setVar/d.getVar).

Hook  : SSTATE_CHECK_FUNCTIONS
Input : missed    - list of missing sstate file index in sq
      : found     - list of existing sstate file index in sq
      : sq_fn     - list of filenames in the sq
      : sq_task   - list of task names in the sq
      : sq_hash   - list of task hash in the sq
      : sq_hashfn - list of hashfn in the sq

[YOCTO #6639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..e7569be 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -622,6 +622,18 @@ sstate_unpack_package () {
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
+# Provide hook for sstate checking, the checking failure will
+# break the building immediately. Pass input parameters by
+# bb.data (d.setVar/d.getVar).
+# Input : missed    - list of missing sstate file index in sq
+#       : found     - list of existing sstate file index in sq
+#       : sq_fn     - list of filenames in the sq
+#       : sq_task   - list of task names in the sq
+#       : sq_hash   - list of task hash in the sq
+#       : sq_hashfn - list of hashfn in the sq
+#
+SSTATE_CHECK_FUNCTIONS ?= ""
+
 def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     ret = []
@@ -710,6 +722,20 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
+    localdata = bb.data.createCopy(d)
+    bb.data.update_data(localdata)
+    for f in (localdata.getVar('SSTATE_CHECK_FUNCTIONS', True) or '').split():
+        localdata = bb.data.createCopy(d)
+        bb.data.update_data(localdata)
+        localdata.setVar('missed', missed)
+        localdata.setVar('found', ret)
+        localdata.setVar('sq_fn', sq_fn)
+        localdata.setVar('sq_task', sq_task)
+        localdata.setVar('sq_hash', sq_hash)
+        localdata.setVar('sq_hashfn', sq_hashfn)
+
+        bb.build.exec_func(f, localdata)
+
     return ret
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
-- 
1.9.1


