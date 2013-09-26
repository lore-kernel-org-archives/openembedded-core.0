Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 484E06CBAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 16:00:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2013 08:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,986,1371106800"; d="scan'208";a="401446815"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.50])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2013 09:00:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 17:00:33 +0100
Message-Id: <1380211233-19201-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/package_rpm: fix bitbake package-index for RPM
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
X-List-Received-Date: Thu, 26 Sep 2013 16:00:42 -0000

The function that "bitbake package-index" relies upon when using the RPM
package backend (package_update_index_rpm()) uses MULTILIB_PREFIX_LIST
to get the list of package architectures to be indexed, but that
variable is only set when populate_sdk_rpm or rootfs_rpm are inherited,
which is not the case for the package-index recipe. Until we're able to
refactor this properly, for minimal impact just use the value of
ALL_MULTILIB_PACKAGE_ARCHS if MULTILIB_PREFIX_LIST does not give us any
architectures (the equivalent function in the ipk backend uses the
former variable).

Having "bitbake package-index" working is important because it's the
only practical way of indexing RPM packages for use as a feed; host
versions of createrepo won't work properly because they won't support
indexing recommends relationships.

Stopgap fix for [YOCTO #5278].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index fd861e9..05de1ff 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -35,6 +35,11 @@ package_update_index_rpm () {
 		done
 	done
 
+	# FIXME stopgap for broken "bitbake package-index" since MULTILIB_PREFIX_LIST isn't set for that
+	if [ "$target_archs" = "" ] ; then
+		target_archs="${ALL_MULTILIB_PACKAGE_ARCHS}"
+	fi
+
 	target_archs=`echo "$target_archs" | tr - _`
 
 	archs=`for arch in $target_archs $sdk_archs ; do
-- 
1.8.1.2


