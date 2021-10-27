Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7245DC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456799"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:18 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617146"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/36] multilib: Avoid sysroot race issues when
 multilib enabled
Date: Wed, 27 Oct 2021 23:16:23 +0800
Message-Id: 
 <7911b903ef57ee8c49c20ac189ec642e124e4134.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157531

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Multilib changes RECIPE_SYSROOT which can make the value in PSEUDO_IGNORE_PATHS
incorrect. Add the correct value, which fixes races over files in the sysroot.

[YOCTO #14581]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64003e5e1b51c0cd561681b1ac13293546b8182b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/multilib.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index d231107f8b..e9767c73b6 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -11,6 +11,8 @@ STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${MLPREFIX}recipe-sysroot"
+
 INHERIT += "multilib_global"
 
 BBCLASSEXTEND_append = " ${MULTILIBS}"
-- 
2.31.1


