Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2B11731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:58:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 01 Sep 2016 01:58:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,266,1470726000"; d="scan'208";a="163196828"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2016 01:58:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 97F286A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 01:57:52 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 11:55:59 +0300
Message-Id: <09c662d31f0fe18e30a866e287b98bc35ed6e25f.1472719962.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 2/6] sstate.bbclass: skip packaging if SSTATE_SKIP_CREATION is set
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
X-List-Received-Date: Thu, 01 Sep 2016 08:58:12 -0000

SSTATE_SKIP_CREATION variable will be used to skip creation of
sstate .tgz files. It makes sense for image creation tasks as
tarring images and keeping them in sstate would consume a lot of
disk space.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2496928..0f0baeb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -566,6 +566,8 @@ def sstate_package(ss, d):
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
+        if d.getVar('SSTATE_SKIP_CREATION', True) == '1':
+            continue
         srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files:
-- 
2.1.4


