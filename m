Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 33A7E6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:02:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2016 09:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; d="scan'208";a="939264301"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2016 09:01:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 18:01:10 +0200
Message-Id: <1458662470-20336-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1458662470-20336-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1458662470-20336-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v3 2/2] externalsrc: remove nostamp from do_configure
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
X-List-Received-Date: Tue, 22 Mar 2016 16:02:41 -0000

Extend the srctree_hash_files() function in externalsrc.bbclass to
handle non-Git source trees.  If the source tree is not a git
repository, srctree_hash_files() now simply adds the whole source tree
as a dependency, causing bitbake to basically hash every file in it.
Hidden files and directories in the source tree root are ignored by the
glob currently used. This has the advantage of automatically ignoring
.git directory, for example.

During the first bitbake run preparing of the task runqueue may take
much longer if the source tree is not a git repository. The reason is
that all the files in the source tree are hashed.  Subsequent builds are
not significantly slower because (most) file hashes are found from the
cache.

[YOCTO #8853]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index f983359..dff6184 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -149,5 +149,5 @@ def srctree_hash_files(d):
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
     else:
-        d.setVarFlag('do_compile', 'nostamp', '1')
+        ret = d.getVar('EXTERNALSRC', True) + '/*:True'
     return ret
-- 
2.6.2


