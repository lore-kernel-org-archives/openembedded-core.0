Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AB70475843
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:23:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 10:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,634,1427785200"; d="scan'208";a="729357417"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 10:23:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 18:23:25 +0100
Message-Id: <7d571dc6c8e365f7e36907c425aa442cd2a4ee37.1434559829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] classes/externalsrc: handle tasks with existing lockfiles
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
X-List-Received-Date: Wed, 17 Jun 2015 17:23:41 -0000

We need to ensure we add a leading space to the value we are prepending
here in case lockfiles already has a value.

Fixes [YOCTO #7813].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 75bdb7a..8f7f479 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -55,7 +55,7 @@ python () {
                 bb.build.deltask(task, d)
             else:
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
-                d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
+                d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
             # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
             cleandirs = d.getVarFlag(task, 'cleandirs', False)
-- 
2.1.0


