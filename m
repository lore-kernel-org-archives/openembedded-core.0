Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 75B866B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425538"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:52 +0000
Message-Id: <7b8e9b6901d212e40c6046c70eb5c42bb95cbf6a.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/15] classes/externalsrc: fix source being wiped out on clean with kernel
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:23 -0000

kernel.bbclass adds ${S} do do_clean[cleandirs], but this means if you
run bitbake -c clean <kernelrecipe> then your external source tree will
be trashed, which could be a disaster. For safety, remove ${S} from
cleandirs for every task. We also have to do the same for ${B} in the
case where EXTERNALSRC_BUILD is set to the same value as EXTERNALSRC.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 4e429d7..e372392 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -47,6 +47,20 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
 
+            # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
+            cleandirs = d.getVarFlag(task, 'cleandirs', False)
+            if cleandirs:
+                cleandirs = cleandirs.split()
+                setvalue = False
+                if '${S}' in cleandirs:
+                    cleandirs.remove('${S}')
+                    setvalue = True
+                if externalsrcbuild == externalsrc and '${B}' in cleandirs:
+                    cleandirs.remove('${B}')
+                    setvalue = True
+                if setvalue:
+                    d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
+
         for task in d.getVar("SRCTREECOVEREDTASKS", True).split():
             bb.build.deltask(task, d)
 
-- 
1.9.3


