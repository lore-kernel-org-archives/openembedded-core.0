Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494561"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494561"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075392"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/28] sstate/staging: Handle directory creation race issue
Date: Fri, 16 Jul 2021 10:42:00 +0800
Message-Id: <3bea0da687d28c80f0b63e2ad81573a3601bb482.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The sstate code tries to be careful about racing around directory creation.
In particular, the copyhardlinktree code creates the directory tree first
allowing for "already exists" errors and ignoring them, then hardlinks the
files in.

Unfortunately the sstate removal code can race against this since it
will try and remove empty directories. If there is some bad timing,
a newly created directory can be removed before it was populated, leading
to build failures.

We could try and add locking but this would damage performance, we've been
there before. It is also unclear where to actually place locks just based on
the contents of a manifest file which may cover multiple sstate install
locations for a given task.

Instead, lets disable directory removal in the problematic "shared" core
path. This could result in a few more empty directories being left on disk
but those should be harmless and better than locking hurting performance
or rare build races.

[YOCTO #13999]
[YOCTO #14379]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f94d9296394bc7ce241439f00df86eb5912875f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass  | 8 +++++---
 meta/classes/staging.bbclass | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3ab6328f91..2b5d94dd1f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -483,7 +483,7 @@ def sstate_clean_cachefiles(d):
         ss = sstate_state_fromvars(ld, task)
         sstate_clean_cachefile(ss, ld)
 
-def sstate_clean_manifest(manifest, d, prefix=None):
+def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     import oe.path
 
     mfile = open(manifest)
@@ -501,7 +501,9 @@ def sstate_clean_manifest(manifest, d, prefix=None):
             if entry.endswith("/"):
                 if os.path.islink(entry[:-1]):
                     os.remove(entry[:-1])
-                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
+                elif os.path.exists(entry) and len(os.listdir(entry)) == 0 and not canrace:
+                    # Removing directories whilst builds are in progress exposes a race. Only
+                    # do it in contexts where it is safe to do so.
                     os.rmdir(entry[:-1])
             else:
                 os.remove(entry)
@@ -539,7 +541,7 @@ def sstate_clean(ss, d):
         for lock in ss['lockfiles']:
             locks.append(bb.utils.lockfile(lock))
 
-        sstate_clean_manifest(manifest, d)
+        sstate_clean_manifest(manifest, d, canrace=True)
 
         for lock in locks:
             bb.utils.unlockfile(lock)
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 806a85773a..32a615c743 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -409,7 +409,7 @@ python extend_recipe_sysroot() {
         if os.path.islink(f) and not os.path.exists(f):
             bb.note("%s no longer exists, removing from sysroot" % f)
             lnk = os.readlink(f.replace(".complete", ""))
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
             os.unlink(f)
             os.unlink(f.replace(".complete", ""))
 
@@ -454,7 +454,7 @@ python extend_recipe_sysroot() {
             fl = depdir + "/" + l
             bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
             lnk = os.readlink(fl)
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
             os.unlink(fl)
             os.unlink(fl + ".complete")
 
@@ -475,7 +475,7 @@ python extend_recipe_sysroot() {
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
-                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+                sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
                 os.unlink(depdir + "/" + c)
                 if os.path.lexists(depdir + "/" + c + ".complete"):
                     os.unlink(depdir + "/" + c + ".complete")
-- 
2.31.1

