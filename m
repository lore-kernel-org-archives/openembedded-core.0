Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE1D62137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C83E72E273
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id s6GcplEd+jtO
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 266292E233
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 105101558
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 01BD61BF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id F324AF3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5AFkC5N031878
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5AFkCba031877
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2016 17:46:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 17:46:11 +0200
Message-Id: <d0b83b40f7a5655591799b1333277df4895090cc.1465573515.git.pkj@axis.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1465573515.git.pkj@axis.com>
References: <cover.1465573515.git.pkj@axis.com>
In-Reply-To: <cover.1465573515.git.pkj@axis.com>
References: <cover.1465573515.git.pkj@axis.com>
Subject: [PATCHv2 2/2] useradd-staticids.bbclass: Avoid FutureWarning about split()
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
X-List-Received-Date: Fri, 10 Jun 2016 15:46:16 -0000

This avoids the following warning with Python 3.5:

  /usr/lib64/python3.5/re.py:203: FutureWarning: split() requires a
  non-empty pattern

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 440c0e3..d963f28 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -97,7 +97,7 @@ def update_useradd_static_config(d):
             if not param:
                 continue
             try:
-                uaargs = parser.parse_args(re.split('''[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+                uaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
                 raise bb.build.FuncFailed("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
 
@@ -231,7 +231,7 @@ def update_useradd_static_config(d):
                 continue
             try:
                 # If we're processing multiple lines, we could have left over values here...
-                gaargs = parser.parse_args(re.split('''[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+                gaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
                 raise bb.build.FuncFailed("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
 
-- 
2.8.3


