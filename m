Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74B2679CC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 16:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9646618343
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id iqYRz1qpr5E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C3E3C1834B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9BF11E075
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E8FD1E072
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 92D381863
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 858B89C121; Fri, 19 Oct 2018 18:00:06 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 18:00:01 +0200
Message-Id: <20181019160001.21686-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] devtool-source.bbclass: Only create each patch branch once
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
X-List-Received-Date: Fri, 19 Oct 2018 16:00:07 -0000

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

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/devtool-source.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
Peter Kjellerstedt pointed out some issues with v1; this updated change is
simpler. In addition to what Richard said about it causing failures in
oe-selftest. I had a issues running oe-selftest, mostly because of the large
storage requirements of /tmp and issues with company internal git hooks.  I
think I managed to run all the tests with passing results now, but please be
vigilante of testcase failures; sorry in advance!

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


