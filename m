Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BAEAB6FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:44:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2016 02:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,528,1449561600"; d="scan'208";a="756622356"
Received: from sgominde-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.23])
	by orsmga003.jf.intel.com with ESMTP; 02 Mar 2016 02:44:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 23:44:19 +1300
Message-Id: <76a7f66a3569231f4a3237cc2e42cd0d4bc90593.1456915391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456915391.git.paul.eggleton@linux.intel.com>
References: <cover.1456915391.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456915391.git.paul.eggleton@linux.intel.com>
References: <cover.1456915391.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] classes/externalsrc: fix symlinking if symlink exists pointing to another path
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
X-List-Received-Date: Wed, 02 Mar 2016 10:44:58 -0000

If the oe-workdir / oe-logs symlink exists and points to a different
path then the symlink needs to be removed before calling os.symlink() or
it'll fail.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index b608bd0..0ec338c 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -115,6 +115,7 @@ python externalsrc_configure_prefunc() {
                 # Link already exists, leave it if it points to the right location already
                 if os.readlink(lnkfile) == target:
                     continue
+                os.unlink(lnkfile)
             elif os.path.exists(lnkfile):
                 # File/dir exists with same name as link, just leave it alone
                 continue
-- 
2.5.0


