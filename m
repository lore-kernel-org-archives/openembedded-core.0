Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7041C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ayzBljdf;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776686; x=1674312686;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nEsjXF1nxqdSz1f7DhA1VBghKKRZx8ubLQPs+JJcyA4=;
  b=ayzBljdf78s71l/GtPCAxw5lg/VKdSitfR3XcRH9k2+xhbpNXjv4S6Cf
   03MU9ZXf6b0seB5KFSPtnddm92WeO7IiJxqpbog426xg/GVTJz3z82Ykq
   u2TViEAGS6Vfaxj3cgpCC+JN4/NcpsxbHdovMGdrYfEJ+Zya+C5S6B3E1
   skKvlGWtyVwnAIc+HV3U1JFy7eUnDIuBFtBg47b03Tqw/Ahg4e7cfH1OB
   MXPn8YGNXh68YJWcVng9Z/jXJXUv8m5JNW7s1PxdbhqcwJE38PovAATQ/
   G6GYKRURY4I51ZqnfXzeUrZoScPP4jWZHW9tXOFvR39+dn7ELJyyhMZs+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886079"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336763"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/15] populate_sdk_base: remove unneeded dirs such
 as /dev
Date: Fri, 21 Jan 2022 22:50:57 +0800
Message-Id: 
 <0211ccb94ecc13ed0f4d3f351baf4f9a39f2ccea.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160840

From: Chen Qi <Qi.Chen@windriver.com>

We met a problem that core-image-tiny-initramfs's SDK cannot be
installed. The error message is like below.

  tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted

In fact, the '/dev' direcotry is not needed by SDK. So remove it.

This patches uses a variable, SDK_PRUNE_SYSROOT_DIRS, to hold useless dir entries
so that it could be extended. For example, '/usr/bin' could be added if wanted.

(From OE-Core rev: 9154f71c7267e9731156c1dfd57397103e9e6a2b)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 2d33611ddd..76757a3a9d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -90,6 +90,8 @@ SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
+SDK_PRUNE_SYSROOT_DIRS ?= "/dev"
+
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -101,6 +103,12 @@ python write_target_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
+sdk_prune_dirs () {
+    for d in ${SDK_PRUNE_SYSROOT_DIRS}; do
+        rm -rf ${SDK_OUTPUT}${SDKTARGETSYSROOT}$d
+    done
+}
+
 python write_sdk_test_data() {
     from oe.data import export2json
     testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR'), d.getVar('TOOLCHAIN_OUTPUTNAME'))
@@ -120,8 +128,9 @@ python write_host_sdk_manifest () {
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
-POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest; sdk_prune_dirs; "
 POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
+
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
 
-- 
2.34.1


