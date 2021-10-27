Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A43C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456783"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456783"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617117"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/36] externalsrc: Work with reproducible_build
Date: Wed, 27 Oct 2021 23:16:21 +0800
Message-Id: 
 <bc8448b55f06c75ec129fc32cee75ef945a49d3e.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157529

From: Mark Hatle <mark.hatle@xilinx.com>

Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
discovers the correct reproducible date as a postfuncs of do_unpack, so this
date is never found, so it falls back to the default epoch.

Instead we can move the discovery function to a prefuncs on the epoch
deploy task.  This task will run before do_configure, and since the source
is already available can run safely at anytime.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b7dd711a54e92ce54abe99f59fc67e683d52dfe)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3d6b80bee2..1ea938fb62 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -110,6 +110,16 @@ python () {
                 continue
             bb.build.deltask(task, d)
 
+        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
+            # The reproducible_build's create_source_date_epoch_stamp function must
+            # be run after the source is available and before the
+            # do_deploy_source_date_epoch task.  In the normal case, it's attached
+            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
+            # we need to move the function elsewhere.  The easiest thing to do is
+            # move it into the prefuncs of the do_deploy_source_date_epoch task.
+            # This is safe, as externalsrc runs with the source already unpacked.
+            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
+
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
-- 
2.31.1


