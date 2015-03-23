Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3436AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 18:31:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2015 11:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,453,1422950400"; d="scan'208";a="684400070"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2015 11:31:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 20:31:38 +0200
Message-Id: <19f19ecbae2b46b3c46eed2d5f86c84c50fac780.1427135435.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1427135435.git.cristian.iorga@intel.com>
References: <cover.1427135435.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1427135435.git.cristian.iorga@intel.com>
References: <cover.1427135435.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] webkit-gtk: disable JIT for armv5/armv6
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
X-List-Received-Date: Mon, 23 Mar 2015 18:31:51 -0000

JIT for JS causes webkit to crash for
ARM v5 and ARM v6 arch, so disable it for now.

TODO: re-evaluate after webkit-gtk upgrade.

Fixes [YOCTO #6931].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 920e1a0..15c73cf 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -50,6 +50,8 @@ EXTRA_OECONF = "\
                 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
+EXTRA_OECONF_append_armv5 = " --disable-jit"
+EXTRA_OECONF_append_armv6 = " --disable-jit"
 
 #default unicode backend icu breaks in cross-compile when target and host are different endian type
 EXTRA_OECONF_append_powerpc = " --with-unicode-backend=glib"
-- 
2.1.0


