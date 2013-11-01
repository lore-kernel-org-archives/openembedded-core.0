Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id C09B16D224
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 19:47:16 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w61so4290140wes.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 12:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Jw4ejfLDDqniAizPXWfL7aycffRnFd8anAIdlAQfJVA=;
	b=UrT51EQ/pjllhQpwBq2cBySMFUyd8ptFLygNymXN6wsatskyR8VfGIP0ITWxGaOO8j
	RzO9W0yumhxCM9mPLxbK6o1XR11r1ljtY+acCtRW4Lv+PKLaVyNJYYfFLMFAOEHPk19b
	zUWBOoafwSHQjwtcc6GLV4PJfZPN73UbdZsuzKnOWfK+WpNCTCkBxCV3T/nWD7apXzqz
	+O6CxEgFR7c03i7BDCLW/HU/5I1pNu6jm0PmtPD2AVk/tdEBjwAtGlIQ2io0jfUOBdRg
	+ao32QLnD5r3QiC6w94ik8OSz7ti+IVZljfwrnnaD/FsLUBWGyZYkiRhDnqi+XykTT4I
	TlJg==
X-Gm-Message-State: ALoCoQkus7UUnQ8G8UyQZ4RKT+c9xtc942sJHzE7iCfy7OC+b8KOMj5sb+i7ymEHcrT9daCO9iGV
X-Received: by 10.194.178.6 with SMTP id cu6mr2480999wjc.61.1383335237503;
	Fri, 01 Nov 2013 12:47:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm9493750wij.6.2013.11.01.12.47.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 12:47:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 19:47:13 +0000
Message-Id: <1383335233-12366-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wipe-sysroot: explain what is being deleted and require confirmation
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
X-List-Received-Date: Fri, 01 Nov 2013 19:47:17 -0000

Instead of rushing into deleting entire directory trees without any warning,
print the directories and files that will be deleted and require confirmation
from the user (via --force) that they want files to be deleted.

[ YOCTO #5423 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |   27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index 7ca26fe..306c877 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -33,14 +33,23 @@ if [ -z "$SSTATE_MANIFESTS" -o -z "$STAGING_DIR" -o -z "$STAMPS_DIR" ]; then
     exit 1
 fi
 
-# The sysroots themselves
-rm -rf $STAGING_DIR
+echo "Will delete $STAGING_DIR."
+echo "Will also delete selected stamps from $SSTATE_MANIFESTS and $STAMPS_DIR."
 
-# The stamps that said the sysroot was populated
-rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot.*
-rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*
-rm -rf $STAMPS_DIR/*/*/*.do_packagedata.*
-rm -rf $STAMPS_DIR/*/*/*.do_packagedata_setscene.*
+if [ "$1" = "--force" ]; then
+    echo "Deleting..."
 
-# The sstate manifests
-rm -rf $SSTATE_MANIFESTS/manifest-*.populate-sysroot
+    # The sysroots themselves
+    rm -rf $STAGING_DIR
+
+    # The stamps that said the sysroot was populated
+    rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot.*
+    rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*
+    rm -rf $STAMPS_DIR/*/*/*.do_packagedata.*
+    rm -rf $STAMPS_DIR/*/*/*.do_packagedata_setscene.*
+
+    # The sstate manifests
+    rm -rf $SSTATE_MANIFESTS/manifest-*.populate-sysroot
+else
+    echo "\nThis was a dry-run.  Run with --force to delete the files."
+fi
-- 
1.7.10.4


