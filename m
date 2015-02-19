Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5452973608
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425560"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:53 +0000
Message-Id: <cc27d5418d61e6af29cec23227f215c64bd66871.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/15] classes/externalsrc: add workaround for recipes that use SRCPV in PV
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:24 -0000

Here we set SRC_URI to blank, however doing so means that the function
that is called when you expand the default value of SRCPV
(i.e. bb.fetch2.get_srcrev()) will fail, so any recipe that references
SRCPV in PV couldn't previously be used with externalsrc.

(At some point we may fix the function to work in the externalsrc case,
but then we would also need to ensure that ${B} did not change as a
result of PV changing any time the HEAD revision changes in the external
source tree, or you'll lose any intermediate build artifacts.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index e372392..234bd8d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -37,6 +37,10 @@ python () {
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
         d.setVar('SRC_URI', '')
 
+        if '{SRCPV}' in d.getVar('PV', False):
+            # Dummy value because the default function can't be called with blank SRC_URI
+            d.setVar('SRCPV', '999')
+
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
-- 
1.9.3


