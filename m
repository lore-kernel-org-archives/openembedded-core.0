Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58D6074B9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 18:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DC75B18524
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FMKu_605DWIM
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A8A6E1852D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96DF41E075
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BD391E074
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7F7762926
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w36IR3d9017637
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Apr 2018 20:27:03 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w36IR30x017636
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Apr 2018 20:27:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 20:26:57 +0200
Message-Id: <5ceaf205914610cdb8adf3983a7de43098ed8cd8.1523039141.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1523039141.git.pkj@axis.com>
References: <cover.1523039141.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/3] license.bbclass: Minor simplification of get_deployed_dependencies()
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
X-List-Received-Date: Fri, 06 Apr 2018 18:27:10 -0000

Since ${SSTATE_ARCHS} now contains ${PACKAGE_EXTRA_ARCHS} there is no
longer any need to add those extra architectures to the list of
architectures handled in get_deployed_dependencies().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d353110464..9ac7e0bef8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -226,9 +226,7 @@ def get_deployed_dependencies(d):
     # The manifest file name contains the arch. Because we are not running
     # in the recipe context it is necessary to check every arch used.
     sstate_manifest_dir = d.getVar("SSTATE_MANIFESTS")
-    sstate_archs = d.getVar("SSTATE_ARCHS")
-    extra_archs = d.getVar("PACKAGE_EXTRA_ARCHS")
-    archs = list(set(("%s %s" % (sstate_archs, extra_archs)).split()))
+    archs = list(set(d.getVar("SSTATE_ARCHS").split()))
     for dep in depends:
         # Some recipes have an arch on their own, so we try that first.
         special_arch = d.getVar("PACKAGE_ARCH_pn-%s" % dep)
-- 
2.12.0


