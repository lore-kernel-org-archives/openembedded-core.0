Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09349789C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652079"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:13 +0200
Message-Id: <20180309185614.31113-35-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 35/36] attr: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:41 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../acl/test-fix-insufficient-quoting-of.patch     | 52 +++++++++-------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
index 0b350be5634..f392465b58e 100644
--- a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
+++ b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
@@ -35,61 +35,56 @@ http://git.savannah.gnu.org/cgit/acl.git/commit/?id=e98ce8acf84d12ea67a3ac76bf63
 
 Signed-off-by: Kamil Dudka <kdudka@redhat.com>
 Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- test/cp.test            | 2 +-
- test/misc.test          | 6 +++---
- test/sbits-restore.test | 6 +++---
- 3 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/test/cp.test b/test/cp.test
-index 0867f63..a927195 100644
---- a/test/cp.test
-+++ b/test/cp.test
-@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if `-p' is given.
+Index: acl-2.2.52/test/cp.test
+===================================================================
+--- acl-2.2.52.orig/test/cp.test
++++ acl-2.2.52/test/cp.test
+@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if
  	> -rw-rw-r--+
-
+ 	
  	$ cp f g
 -	$ ls -l g | awk -- '{ print $1 }' | sed 's/\.$//g'
 +	$ ls -l g | awk -- '{ print $1 }' | sed 's/\\.$//g'
  	> -rw-r--r--
-
+ 	
  	$ rm g
-diff --git a/test/misc.test b/test/misc.test
-index 6e98053..29372b7 100644
---- a/test/misc.test
-+++ b/test/misc.test
+Index: acl-2.2.52/test/misc.test
+===================================================================
+--- acl-2.2.52.orig/test/misc.test
++++ acl-2.2.52/test/misc.test
 @@ -254,7 +254,7 @@ Add some users and groups
  Symlink in directory with default ACL?
-
+ 	 
  	$ ln -s d d/l
 -	$ ls -dl d/l | awk '{print $1}' | sed 's/\.$//g'
 +	$ ls -dl d/l | awk '{print $1}' | sed 's/\\.$//g'
  	> lrwxrwxrwx
-
+ 
  	$ ls -dl -L d/l | awk '{print $1}'
 @@ -343,7 +343,7 @@ Remove the default ACL
  Reset to base entries
-
+ 	 
  	$ setfacl -b d
 -	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
 +	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
  	> drwxr-x---
-
+ 
  	$ getfacl --omit-header d
 @@ -355,7 +355,7 @@ Reset to base entries
  Now, chmod should change the group_obj entry
-
+ 	 
  	$ chmod 775 d
 -	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
 +	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
  	> drwxrwxr-x
-
+ 	
  	$ getfacl --omit-header d
-diff --git a/test/sbits-restore.test b/test/sbits-restore.test
-index de21340..5899b0a 100644
---- a/test/sbits-restore.test
-+++ b/test/sbits-restore.test
-@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via --restore works
+Index: acl-2.2.52/test/sbits-restore.test
+===================================================================
+--- acl-2.2.52.orig/test/sbits-restore.test
++++ acl-2.2.52/test/sbits-restore.test
+@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via -
  	$ touch d/g
  	$ touch d/u
  	$ setfacl --restore d.acl
@@ -103,6 +98,3 @@ index de21340..5899b0a 100644
 +	$ ls -dl d/g | awk '{print $1}' | sed 's/\\.$//g'
  	> -rw-r-Sr--
  	$ rm -Rf d
---
-1.9.1
-
-- 
2.16.1


