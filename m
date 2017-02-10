Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 21EA860851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543520"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:27 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:10 +0200
Message-Id: <1486734151-28331-3-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 02/23] bitbake.conf: Modify nativesdk variables to support 'usrmerge' DISTRO_FEATURE
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:28 -0000

Modify base bin, sbin, and lib nativesdk variables to be ${prefix_nativesdk}/$d,
when the usrmerge DISTRO_FEATURE is enabled.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/conf/bitbake.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c5beb77..ecff034 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -67,11 +67,11 @@ bindir_crossscripts = "${bindir}/crossscripts"
 prefix_nativesdk = "/usr"
 bindir_nativesdk = "${prefix_nativesdk}/bin"
 sbindir_nativesdk = "${prefix_nativesdk}/sbin"
-base_bindir_nativesdk = "/bin"
-base_sbindir_nativesdk = "/sbin"
-includedir_nativesdk = "${prefix_nativesdk}/include"
 libdir_nativesdk = "${prefix_nativesdk}/lib"
-base_libdir_nativesdk = "/lib"
+base_bindir_nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${bindir_nativesdk}', '/bin', d)}"
+base_sbindir_nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${sbindir_nativesdk}', '/sbin', d)}"
+base_libdir_nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${libdir_nativesdk}', '/lib', d)}"
+includedir_nativesdk = "${prefix_nativesdk}/include"
 localstatedir_nativesdk = "/var"
 
 #
-- 
2.7.4


