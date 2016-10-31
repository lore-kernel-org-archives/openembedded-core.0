Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7386E71ACF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:17 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576807"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:43 +1300
Message-Id: <e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] classes/license: fix handling of symlinks pointed to in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:17 -0000

If you set LIC_FILES_CHKSUM to point to a relative symlink then you'll
get "Could not copy license file" warnings in copy_license_files() since
the symlink won't be valid after it's copied. If the source is a symlink
then we need to dereference it first.

I encountered this when I used recipetool on the sources for capnproto,
where the c++ directory contains a LICENSE.txt symlink to the LICENSE
file in the parent directory, and this symlink ends up being pointed to
in LIC_FILES_CHKSUM.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index da4fc3e..660b85f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -351,6 +351,8 @@ def copy_license_files(lic_files_paths, destdir):
             dst = os.path.join(destdir, basename)
             if os.path.exists(dst):
                 os.remove(dst)
+            if os.path.islink(src):
+                src = os.path.realpath(src)
             canlink = os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev)
             if canlink:
                 try:
-- 
2.5.5


