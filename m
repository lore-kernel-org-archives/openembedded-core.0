Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnzS-0001x6-Ex
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:09:10 +0200
Received: by pwj9 with SMTP id 9so972491pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=LlqqXqFoD21+jpTIJkpCA3waSop74Knr+ZhTkhbYamA=;
	b=WaSQBQZZsYWD+tsPZZZ1LTokGOVYC4hkZ06vi/ipR1flGtFRcWCM7nZ0iv+Z0sTGbu
	DHE7tWsALA8p6mL1m+48IpzR1zL4zqwQLcGjm2SQr2JHx6OzM3+EEE1AJMBliNT3DYGn
	kUuPvQXyoquuys2Dx1P202r6IHvvuYFqrCi4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=X+ulZAEYVLZBzfx3KyiC30AZf1SboyIwQkhYriggHOBkXd/mRzFoFSWr/gg0A+cwG7
	oCOR++Qh2KZH8NbFOVCpG8IkUxlgfGppzVtN8BGbSI9RY6Bfdgz1bkBsFI9LMPFG2vSf
	CybxKuTr4QDrpzPe4HMimMjiSjABJjIM5UOJo=
Received: by 10.68.32.231 with SMTP id m7mr3547937pbi.200.1305752774840;
	Wed, 18 May 2011 14:06:14 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id y7sm1278411pbg.43.2011.05.18.14.06.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:06:14 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:06:02 -0700
Message-Id: <9b85119b8ec8ca42acd9385c0b350f8487701fff.1305752660.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/5] oe.packagegroup: add code for package groups (sync from OE)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 21:09:10 -0000

From: Chris Larson <chris_larson@mentor.com>

This includes some utility functions for dealing with groups of packages
defined in the metadata.  Metadata syntax:

    PACKAGE_GROUP_<group> = "<list of packages>"

If the packages in the group are optional:

    PACKAGE_GROUP_<group>[optional] = "1"

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass   |    2 +-
 meta/lib/oe/packagegroup.py |   29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta/lib/oe/packagegroup.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7950bc3..8f4ef1e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,7 @@ inherit metadata_scm
 inherit buildstats
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.data"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
new file mode 100644
index 0000000..b04c45a
--- /dev/null
+++ b/meta/lib/oe/packagegroup.py
@@ -0,0 +1,29 @@
+import itertools
+
+def is_optional(group, d):
+    return bool(d.getVarFlag("PACKAGE_GROUP_%s" % group, "optional"))
+
+def packages(groups, d):
+    for group in groups:
+        for pkg in (d.getVar("PACKAGE_GROUP_%s" % group, True) or "").split():
+            yield pkg
+
+def required_packages(groups, d):
+    req = filter(lambda group: not is_optional(group, d), groups)
+    return packages(req, d)
+
+def optional_packages(groups, d):
+    opt = filter(lambda group: is_optional(group, d), groups)
+    return packages(opt, d)
+
+def active_packages(features, d):
+    return itertools.chain(required_packages(features, d),
+                           optional_packages(features, d))
+
+def active_recipes(features, d):
+    import oe.packagedata
+
+    for pkg in active_packages(features, d):
+        recipe = oe.packagedata.recipename(pkg, d)
+        if recipe:
+            yield recipe
-- 
1.7.1



