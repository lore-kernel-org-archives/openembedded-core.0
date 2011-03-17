Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwk-00027T-EJ
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:10 +0100
Received: by ywg8 with SMTP id 8so1174488ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=hV/DH7DqXV+WpN4nfEApMeCLCTQGHR8oKtytt6TpoAQ=;
	b=UCaAyySq0QWUzIWF3oZgS0IF61tq61R2bYOp0c1axQybq3mT14HEg/2Q5FUrZFtJGP
	BZj35gFQDLxmCZgfppeDBVsqJVtdx2p6InPmEo9NOXxZRzsFY+vcIpP5x7eKyVgnaRfe
	OfgQbDPO4Lx1+d6QFQ6uKD+mk/CfjVkf0bBHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oeAzCkPU2kPc+mpy0HG8ItJHHL9JvH6p7O16eKKFBsV847kd/PQQ8rHiVS3QjqAO3I
	63cx5jwiysY8K4gGt8MpUl4Ka2rOwhKqcuwV+/y6Wz/q8msMixNp95E5PW7HZgngYDGO
	VIkLLW8dCBFE3N3GCIIAuI315X6NiEclTr25k=
Received: by 10.150.66.15 with SMTP id o15mr38047yba.209.1300378765821;
	Thu, 17 Mar 2011 09:19:25 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:25 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:06 -0700
Message-Id: <773e020cdee73dcff4a2c487e26fe817c22e1fa5.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 08/12] oe.packagegroup: add code for package groups (sync from OE)
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:10 -0000

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
index 27a68de..8e8d572 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -9,7 +9,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit buildstats
 
-OE_IMPORTS += "sys os time oe.path oe.utils oe.data"
+OE_IMPORTS += "sys os time oe.path oe.utils oe.data oe.packagegroup"
 
 def oe_import(d):
     import os, sys
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
1.7.2.3



