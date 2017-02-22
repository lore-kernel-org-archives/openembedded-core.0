Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E71173057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114017946"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:31 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:26:58 +0200
Message-Id: <1487752042-19804-27-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:30 -0000

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


