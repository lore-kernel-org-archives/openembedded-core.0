Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB8C475EFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:57:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 07:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,472,1432623600"; d="scan'208";a="728662437"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2015 07:57:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:56:53 +0100
Message-Id: <1b48b92c0dd407fa921a134a587fc062122c0ef4.1436884357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/useradd: don't read bbnote/bbwarn/bbfatal values
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
X-List-Received-Date: Tue, 14 Jul 2015 14:57:09 -0000

Since these functions now log through BitBake's message logging system
we must have standalone implementations here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/useradd.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index aae038f..4577e56 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -191,9 +191,9 @@ fakeroot python populate_packages_prepend () {
         preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
         if not preinst:
             preinst = '#!/bin/sh\n'
-        preinst += 'bbnote () {\n%s}\n' % d.getVar('bbnote', True)
-        preinst += 'bbwarn () {\n%s}\n' % d.getVar('bbwarn', True)
-        preinst += 'bbfatal () {\n%s}\n' % d.getVar('bbfatal', True)
+        preinst += 'bbnote () {\n\techo "NOTE: $*"\n}\n'
+        preinst += 'bbwarn () {\n\techo "WARNING: $*"\n}\n'
+        preinst += 'bbfatal () {\n\techo "ERROR: $*"\n\texit 1\n}\n'
         preinst += 'perform_groupadd () {\n%s}\n' % d.getVar('perform_groupadd', True)
         preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd', True)
         preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems', True)
-- 
2.1.0


