Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8F94577D6A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406937"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:22 +1200
Message-Id: <cbe34fca7f175f800c50298defaaf0ea88473c15.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491540566.git.paul.eggleton@linux.intel.com>
References: <cover.1491540566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] classes/uninative: set SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] properly
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:38 -0000

Append to the value with appendVarFlag() instead of setting it outright,
so that we can also append to it in other places. Accordingly, this
varflag is pipe-separated (since we want to be able to exclude any
string fragment, in this case including the leading space), thus put a
leading pipe character to play nicely with any existing value.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index b578031..8f34483 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -100,7 +100,7 @@ def enable_uninative(d):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
-        d.setVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", " uninative_changeinterp")
+        d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
         d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
 python uninative_changeinterp () {
-- 
2.9.3


