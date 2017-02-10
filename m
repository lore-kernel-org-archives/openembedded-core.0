Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E2D7C77337
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543513"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:26 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:09 +0200
Message-Id: <1486734151-28331-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: [PATCH 01/23] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:27 -0000

From: Joshua Lock <joshua.g.lock@intel.com>

Modify bindir, libdir and sbindir to be exec_prefix/$d, rather than
base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/bitbake.conf | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e421650..c5beb77 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -18,10 +18,14 @@ export prefix = "/usr"
 export exec_prefix = "${prefix}"
 
 # Base paths
-export base_bindir = "${base_prefix}/bin"
-export base_sbindir = "${base_prefix}/sbin"
-export base_libdir = "${base_prefix}/${baselib}"
-export nonarch_base_libdir = "${base_prefix}/lib"
+bin = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}/bin', '${base_prefix}/bin', d)}"
+sbin = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}/sbin', '${base_prefix}/sbin', d)}"
+lib = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}/${baselib}', '${base_prefix}/${baselib}', d)}"
+nonarch_lib = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}/lib', '${base_prefix}/lib', d)}"
+export base_bindir = "${bin}"
+export base_sbindir = "${sbin}"
+export base_libdir = "${lib}"
+export nonarch_base_libdir = "${nonarch_lib}"
 
 # Architecture independent paths
 export sysconfdir = "${base_prefix}/etc"
-- 
2.7.4


