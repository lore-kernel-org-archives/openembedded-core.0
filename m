Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 96BB26F12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:06:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2014 08:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="487168734"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 08:06:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 16:05:44 +0000
Message-Id: <4de333a454da92ea76af9ac8b296b44e94fc9af1.1393257867.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/sstate: fix taints being undone on execution of sstate tasks
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
X-List-Received-Date: Mon, 24 Feb 2014 16:06:22 -0000

The code here that deletes stamps was also deleting the taint files; so
forcing an sstate task with -f would force it to execute and then
because the taint file was deleted in the process, the next execution
would simply restore the output from sstate again. We need to exclude
the taint files just like we did in bb.build.make_stamp().

Fixes [YOCTO #5805].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f7bd117..c4f437b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -375,6 +375,9 @@ def sstate_clean(ss, d):
         # Keep the sigdata
         if ".sigdata." in stfile:
             continue
+        # Preserve taint files in the stamps directory
+        if stfile.endswith('.taint'):
+            continue
         if rm_stamp in stfile or rm_setscene in stfile or \
                 stfile.endswith(rm_nohash):
             oe.path.remove(stfile)
-- 
1.8.5.3


