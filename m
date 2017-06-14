Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 360FA782DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:32:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 04:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="980709661"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 14 Jun 2017 04:32:21 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:30:42 +0300
Message-Id: <1497439848-29967-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v4 1/7] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 14 Jun 2017 11:32:21 -0000

A new configuration variable ${root_prefix} added, which shall be used by all
base_{lib,bin,sbin}dir variables. When usrmerge DISTRO_FEATURE is enabled
${root_prefix} points to ${exec_prefix} otherwise to ${base_prefix}

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/conf/bitbake.conf | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5d5ddec..8c497fd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -17,11 +17,13 @@ export base_prefix = ""
 export prefix = "/usr"
 export exec_prefix = "${prefix}"
 
+export root_prefix = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}"
+
 # Base paths
-export base_bindir = "${base_prefix}/bin"
-export base_sbindir = "${base_prefix}/sbin"
-export base_libdir = "${base_prefix}/${baselib}"
-export nonarch_base_libdir = "${base_prefix}/lib"
+export base_bindir = "${root_prefix}/bin"
+export base_sbindir = "${root_prefix}/sbin"
+export base_libdir = "${root_prefix}/${baselib}"
+export nonarch_base_libdir = "${root_prefix}/lib"
 
 # Architecture independent paths
 export sysconfdir = "${base_prefix}/etc"
-- 
2.7.4


