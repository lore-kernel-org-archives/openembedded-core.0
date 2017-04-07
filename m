Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 66A1E77DA8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491560356; x=1523096356;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4tYpR4TAbmGVmolR0oc1VZc2A6WCxFRkr0F5AFs5PpU=;
	b=WRcA/w4x7912mYSctMr6UXfHyYedU09Znodc8M8beG+VJa2F4eNcbpbG
	cp9BKVYxRoXdK5Mr14GlW2QCXZ/MjA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 03:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="85894873"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2017 03:19:15 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 03:19:10 -0700
Message-Id: <1491560353-96797-2-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491560353-96797-1-git-send-email-wei.tee.ng@intel.com>
References: <1491560353-96797-1-git-send-email-wei.tee.ng@intel.com>
Subject: [PATCH 1/4] bitbake: fetch2: Do not fail to create symbolic links if they already exist
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
X-List-Received-Date: Fri, 07 Apr 2017 10:19:14 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

When the fetcher retrieves file:// URLs, there is no lock file being
used. This means that in case two separate tasks (typically from two
concurrent invocations of bitbake) want to download the same file://
URL at the same time, there is a very small chance that they also end
up wanting to create a symbolic link to the file at the same time.
This would previously lead to one of the tasks failing as the other
task would have created the link.

(Bitbake rev: 58a03531c8183b165bb7dcad86d8559c92bc150d)

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/fetch2/__init__.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index ea72025..136fc29 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -983,7 +983,14 @@ def try_mirror_url(fetch, origud, ud, ld, check = False):
                 open(ud.donestamp, 'w').close()
             dest = os.path.join(dldir, os.path.basename(ud.localpath))
             if not os.path.exists(dest):
-                os.symlink(ud.localpath, dest)
+                # In case this is executing without any file locks held (as is
+                # the case for file:// URLs), two tasks may end up here at the
+                # same time, in which case we do not want the second task to
+                # fail when the link has already been created by the first task.
+                try:
+                    os.symlink(ud.localpath, dest)
+                except FileExistsError:
+                    pass
             if not verify_donestamp(origud, ld) or origud.method.need_update(origud, ld):
                 origud.method.download(origud, ld)
                 if hasattr(origud.method,"build_mirror_data"):
@@ -995,7 +1002,11 @@ def try_mirror_url(fetch, origud, ud, ld, check = False):
                 # Broken symbolic link
                 os.unlink(origud.localpath)
 
-            os.symlink(ud.localpath, origud.localpath)
+            # As per above, in case two tasks end up here simultaneously.
+            try:
+                os.symlink(ud.localpath, origud.localpath)
+            except FileExistsError:
+                pass
         update_stamp(origud, ld)
         return ud.localpath
 
-- 
2.7.4


