Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A6B6E6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9A6202E2BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Xtyq4sSyGOYP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id EC9C62E2BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D80471E078
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCD4F1E080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id BFFEC4EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u8UJrgkX011111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u8UJrgmf011110
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2016 21:53:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 21:53:40 +0200
Message-Id: <859f51cda2032d67b64c81650a4488fec8372a38.1475265162.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1475265162.git.pkj@axis.com>
References: <cover.1475265162.git.pkj@axis.com>
In-Reply-To: <cover.1475265162.git.pkj@axis.com>
References: <cover.1475265162.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/1] devtool: deploy-target: Avoid unnecessary dependency on awk on the target
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
X-List-Received-Date: Fri, 30 Sep 2016 19:53:44 -0000

Relying on that awk is installed on the target just to extract the
fourth column (i.e., the free volume size) from `df -P` is an
unnecessary dependency for devtool deploy-target. As it is already
using sed to mangle the output from `df -P`, this can easily be
modified to only extract the free volume size.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index fb84f2d..c4c7bf6 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -85,7 +85,7 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
             lines.append('do')
             lines.append('    checkpath=`dirname "$checkpath"`')
             lines.append('done')
-            lines.append('freespace=`df -P $checkpath | sed "1d" | awk \'{ print $4 }\'`')
+            lines.append(r'freespace=$(df -P $checkpath | sed -nre "s/^(\S+\s+){3}([0-9]+).*/\2/p")')
             # First line of the file is the total space
             lines.append('total=`head -n1 $3`')
             lines.append('if [ $total -gt $freespace ] ; then')
-- 
2.9.0


