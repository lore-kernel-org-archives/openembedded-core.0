Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A82C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503953"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298033"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/33] classes/meson: Add optional rust definitions
Date: Thu,  9 Dec 2021 09:29:04 +0800
Message-Id: 
 <11b9c077553f06c1c52a4e03c395b6e6d567b531.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159406

From: Joshua Watt <JPEWhacker@gmail.com>

Adds the rust tools to the cross and native files if present so that
projects that use both rust and meson can build

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ec40fa3aff233bd0dde0461299150786da956ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/meson.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 4ba70de3dc..a7981e481f 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -36,8 +36,15 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
+def rust_tool(d, target_var):
+    rustc = d.getVar('RUSTC')
+    if not rustc:
+        return ""
+    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
+    return "rust = %s" % repr(cmd)
+
 addtask write_config before do_configure
-do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -54,6 +61,7 @@ llvm-config = 'llvm-config${LLVMVERSION}'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
+${@rust_tool(d, "HOST_SYS")}
 
 [built-in options]
 c_args = ${@meson_array('CFLAGS', d)}
@@ -88,6 +96,7 @@ strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
 pkgconfig = 'pkg-config-native'
+${@rust_tool(d, "BUILD_SYS")}
 
 [built-in options]
 c_args = ${@meson_array('BUILD_CFLAGS', d)}
-- 
2.33.1


