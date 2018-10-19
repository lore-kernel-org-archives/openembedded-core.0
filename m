Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA81774588
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 16:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B0A8218597
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XRSrju9hLqIZ
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A07A718343
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EC301A063
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8365E1A062
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 779882BB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 6E73C9C121; Fri, 19 Oct 2018 18:07:30 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 18:07:30 +0200
Message-Id: <20181019160730.22775-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2] devtool-source.bbclass: Only create each patch branch once
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
X-List-Received-Date: Fri, 19 Oct 2018 16:07:32 -0000

For conditonally applied patches based on SRC_URI overrides, the
devtool-source class would try to create a new branch for each override
assignment as a postfunc to do_patch, but if the same override was used
multiple times, it would try to create the same branch multiple times,
causing errors like

> Exception: bb.process.ExecutionError: Execution of
\   'git checkout f0f0f0f0f0ff0f0f0f0f0f0f0f0f0f0f0ff0f0f0 -b devtool-override-foo'
\   failed with exit code 128:
> fatal: A branch named 'devtool-override-foo' already exists.

This change makes sure that the devtool-source bbclass will only create
one branch per override.

Change-Id: I8adca0b54179793ca92478ad5b3b1b6e0448e26b
Signed-off-by: Olof Johansson <olofjn@axis.com>
Reviewed-by: Peter Kjellerstedt <pkj@axis.com>
---
 meta/classes/devtool-source.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 67cd0bafb20..1372e32c9e5 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -183,14 +183,14 @@ python devtool_post_patch() {
 
     extra_overrides = d.getVar('DEVTOOL_EXTRA_OVERRIDES')
     if extra_overrides:
-        extra_override_list = extra_overrides.split(':')
+        extra_overrides = set(extra_overrides.split(':'))
         devbranch = d.getVar('DEVTOOL_DEVBRANCH')
         default_overrides = d.getVar('OVERRIDES').split(':')
         no_overrides = []
         # First, we may have some overrides that are referred to in the recipe set in
         # our configuration, so we need to make a branch that excludes those
         for override in default_overrides:
-            if override not in extra_override_list:
+            if override not in extra_overrides:
                 no_overrides.append(override)
         if default_overrides != no_overrides:
             # Some overrides are active in the current configuration, so
@@ -208,7 +208,7 @@ python devtool_post_patch() {
         else:
             bb.process.run('git checkout %s -b devtool-no-overrides' % devbranch, cwd=srcsubdir)
 
-        for override in extra_override_list:
+        for override in extra_overrides:
             localdata = bb.data.createCopy(d)
             if override in default_overrides:
                 bb.process.run('git branch devtool-override-%s %s' % (override, devbranch), cwd=srcsubdir)
-- 
2.11.0


