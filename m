Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3581777085
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:51:14 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u7JApEZv025122
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 12:51:14 +0200
Received: from dev.sbt.siemens.com ([163.242.50.167])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u7JApEin017999;
	Fri, 19 Aug 2016 12:51:14 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 0774D9E055;
	Fri, 19 Aug 2016 12:51:14 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 12:51:06 +0200
Message-Id: <1471603866-30047-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: fix add missing dependencies building for test directory
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
X-List-Received-Date: Fri, 19 Aug 2016 10:51:17 -0000

Regarding the last commit about missing dependencies, another issue
was found. The problem was found, while ptest has been built with some
set extra settings. It means, when ptest is going to be built,
it is necessary to rebuild dependencies for test directory too.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 267ad0b..1fc2d3b 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -154,6 +154,9 @@ do_compile () {
 }
 
 do_compile_ptest () {
+	# build dependencies for test directory too
+	export DIRS="$DIRS test"
+	oe_runmake depend
 	oe_runmake buildtest
 }
 
-- 
2.1.4


