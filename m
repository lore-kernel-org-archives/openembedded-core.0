Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D91A780C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E034118407
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 86DnSc5f4MHl
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:32 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2B013183E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:32 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 144391A07E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:32 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 062C31A070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:32 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:31 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id EE82B21F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:16:31 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id E9BC1409BA; Tue, 30 May 2017 12:16:31 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 12:16:31 +0200
Message-Id: <20170530101631.29058-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] devtool: Compare abspath of both B and S
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
X-List-Received-Date: Tue, 30 May 2017 10:16:34 -0000

Either both or none of the paths must be passed through
os.path.abspath or things like 'A//B', 'A/./B/', and 'A/B/' in S will
cause unintentional mismatches even when B = "${S}".

Using os.path.abspath for both seems more likely to be correct as that
will also handle the case where ${B} != ${S} but the abspaths are
equal.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index d646b0cf63..29c4c05071 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -191,7 +191,7 @@ def use_external_build(same_dir, no_same_dir, d):
         logger.info('Using source tree as build directory since --same-dir specified')
     elif bb.data.inherits_class('autotools-brokensep', d):
         logger.info('Using source tree as build directory since recipe inherits autotools-brokensep')
-    elif d.getVar('B') == os.path.abspath(d.getVar('S')):
+    elif os.path.abspath(d.getVar('B')) == os.path.abspath(d.getVar('S')):
         logger.info('Using source tree as build directory since that would be the default for this recipe')
     else:
         b_is_s = False
-- 
2.11.0


