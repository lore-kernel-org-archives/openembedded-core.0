Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2BE6C485
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:18:08 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id wAKBI8gj012659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 20 Nov 2018 12:18:09 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.57.0])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id wAKBI82p022433;
	Tue, 20 Nov 2018 12:18:08 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9F23C9504C8;
	Tue, 20 Nov 2018 12:18:08 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:17:25 +0100
Message-Id: <20181120111725.4337-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181120111725.4337-1-andrej.valek@siemens.com>
References: <20181120111725.4337-1-andrej.valek@siemens.com>
In-Reply-To: <5cd14d41-41d1-11ea-afcd-6988f9a17cca@siemens.com>
References: <5cd14d41-41d1-11ea-afcd-6988f9a17cca@siemens.com>
Subject: [PATCH 1/1] nativesdk/sdk: Fix sdk dummy providers for opkg
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
X-List-Received-Date: Tue, 20 Nov 2018 11:18:09 -0000

| ERROR:  OE-core's config sanity checker detected a potential
| misconfiguration.
|     Either fix the cause of this error or at your own risk disable
| the checker (see sanity.conf).
|     Following is the list of potential problems / advisories:
|
|     Required perl module(s) not found: Text::ParseWords Thread::Queue
| Data::Dumper

It means that perl wasn't excluded from buildtools-tarball.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index eafcb823ab..44fb1cb714 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -20,7 +20,11 @@ PR[vardeps] += "DUMMYPROVIDES"
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
-    #d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    #d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
+
+    # opkg needs some additional package dependencies handling
+    pkg_type = d.getVar("IMAGE_PKGTYPE")
+    if pkg_type == "ipk":
+        d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
+        d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
 }
 
-- 
2.11.0


