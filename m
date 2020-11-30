Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53736.1606698750617407323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JGRPDvBPKXCEayRKVw1BIEQqkq1mrc9G5iFjnqkbispJpTpLTTl6DoKfBaCZ/QX8loT9b70+QY
 l2f82MAcHNyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004429"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004429"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:16 -0800
IronPort-SDR: m+smgH9EEew/vnKh9xvQ01n9Nk+8yIe0gxc0d9TrGGyQ8gCS+tWcCY63WO0wtPfDMSYDMa4n2A
 YiMOh6q5Bbvg==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302719"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/21] fs-perms: Ensure /usr/src/debug/ file modes are correct
Date: Mon, 30 Nov 2020 09:11:31 +0800
Message-Id: <1f807da38b9d9aebdd86b3b5839305e03d9930e1.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If files are copied into /usr/src/debug directly from WORKDIR (e.g. makedevs)
we'd get the permissions from the checkout which would depend on the host umask.

Avoid this and be deterministic by setting the file modes consistently. Core
code copies the files in so we're responsible for the permissions.

Unfortunately to force this change to apply we need to invalidate both
the package tasks and the hash equivalance mappings since file mode
'corruption' already made it into the output hashes (both input options
were mapped to the output hashes).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f958bcd6c9cd12ec76d80586cba15f4d6ed17a7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/package.bbclass           | 2 +-
 meta/conf/abi_version.conf             | 2 +-
 meta/files/fs-perms-persistent-log.txt | 2 +-
 meta/files/fs-perms.txt                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6236c0bb2..247bdc7bbf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2340,7 +2340,7 @@ python do_package () {
     # cache.  This is useful if an item this class depends on changes in a
     # way that the output of this class changes.  rpmdeps is a good example
     # as any change to rpmdeps requires this to be rerun.
-    # PACKAGE_BBCLASS_VERSION = "2"
+    # PACKAGE_BBCLASS_VERSION = "4"
 
     # Init cachedpath
     global cpath
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 5318a10190..251d43bb21 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "3"
+HASHEQUIV_HASH_VERSION  = "4"
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
index 3a7cf3ab94..518c1be3c9 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	-	root	root
+/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index c8c3ac5dbe..daa4aed840 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
-/usr/src/debug		0755	root	root	true	-	root	root
+/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-- 
2.28.0

