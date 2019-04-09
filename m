Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14F587D574
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 08:35:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x398ZbhB016762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2019 01:35:47 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Tue, 9 Apr 2019 01:35:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Apr 2019 16:34:32 +0800
Message-ID: <783186c33501d4494c7592649cf606551aadfa7f.1554798787.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554798787.git.liezhi.yang@windriver.com>
References: <cover.1554798787.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: Use bb.utils.to_boolean() for BB_NO_NETWORK
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
X-List-Received-Date: Tue, 09 Apr 2019 08:35:57 -0000
Content-Type: text/plain

Make it consistent with bitbake

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6f51d9c..424acfb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -689,7 +689,8 @@ def pstaging_fetch(sstatefetch, d):
 
     # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
     # we'll want to allow network access for the current set of fetches.
-    if localdata.getVar('BB_NO_NETWORK') == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK') == "1":
+    if bb.utils.to_boolean(localdata.getVar('BB_NO_NETWORK')) and \
+            bb.utils.to_boolean(localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK')):
         localdata.delVar('BB_NO_NETWORK')
 
     # Try a fetch from the sstate mirror, if it fails just return and
@@ -867,7 +868,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *,
 
         # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
         # we'll want to allow network access for the current set of fetches.
-        if localdata.getVar('BB_NO_NETWORK') == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK') == "1":
+        if bb.utils.to_boolean(localdata.getVar('BB_NO_NETWORK')) and \
+                bb.utils.to_boolean(localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK')):
             localdata.delVar('BB_NO_NETWORK')
 
         from bb.fetch2 import FetchConnectionCache
-- 
2.7.4


