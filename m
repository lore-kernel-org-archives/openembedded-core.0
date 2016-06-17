Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2E9731DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 93611181D5;
	Fri, 17 Jun 2016 15:41:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id r+5rsiBiTcVJ; Fri, 17 Jun 2016 15:41:19 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id EDE17180F9;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D76F61BAF;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id CCD801BB0;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id CB1A5772;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HDfITW001955;
	Fri, 17 Jun 2016 15:41:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HDfI9s001951;
	Fri, 17 Jun 2016 15:41:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:41:05 +0200
Message-Id: <5a8fcccd23b68181a23508d437492b7e2567bd1c.1466170741.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
Subject: [PATCH 3/4] useradd-staticids.bbclass: Allow missing UIDs/GIDs to generate warnings
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
X-List-Received-Date: Fri, 17 Jun 2016 13:41:23 -0000

Previously when USERADD_ERROR_DYNAMIC was set to "1", an exception was
raised if no numeric UID/GID could be determined for a user/group. Now
it is possible to set it to either "error", which results in the old
behavior, or "warn" in which case a warning is issued instead.

For backwards compatibility reasons, it is still possible to set
USERADD_ERROR_DYNAMIC to "1" and get an exception in case of failure.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 5 ++++-
 meta/conf/documentation.conf           | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 90835cf..b6e498c 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -51,9 +51,12 @@ def update_useradd_static_config(d):
         return id_table
 
     def handle_missing_id(id, type, pkg):
-        if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
+        # For backwards compatibility we accept "1" in addition to "error"
+        if d.getVar('USERADD_ERROR_DYNAMIC', True) == 'error' or d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
             #bb.error("Skipping recipe %s, package %s which adds %sname %s does not have a static ID defined." % (d.getVar('PN', True),  pkg, type, id))
             raise bb.build.FuncFailed("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
+        elif d.getVar('USERADD_ERROR_DYNAMIC', True) == 'warn':
+            bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
 
     # We parse and rewrite the useradd components
     def rewrite_useradd(params):
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 38639d5..fa904c0 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -452,7 +452,7 @@ UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
 UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
 USE_DEVFS[doc] = "When building images, specifies to populate or not /dev. This variable defaults to '1' (leave directory empty, surely because devtmpfs do the job). Set it to '0' to use makedevs (or consider using a custom file with IMAGE_DEVICE_TABLES)."
 USER_CLASSES[doc] = "List of additional classes to use when building images that enable extra features."
-USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files."
+USERADD_ERROR_DYNAMIC[doc] = "If set to 'error', forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files. If set to 'warn', a warning will be issued instead."
 USERADD_GID_TABLES[doc] = "Specifies a password file to use for obtaining static group identification (gid) values when the OpenEmbedded build system adds a group to the system during package installation."
 USERADD_PACKAGES[doc] = "When a recipe inherits the useradd class, this variable specifies the individual packages within the recipe that require users and/or groups to be added."
 USERADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the useradd command if you wish to add a user to the system when the package is installed."
-- 
2.9.0


