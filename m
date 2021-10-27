Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723E3C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456789"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456789"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617132"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/36] externalsrc: Fix a source date epoch race in
 reproducible builds
Date: Wed, 27 Oct 2021 23:16:22 +0800
Message-Id: 
 <295947ac48a8c14eba8f2bedcfb7b59121a1da5f.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157530

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When reproducible builds are enabled and externalsrc is in use, the
source date epoch function is added. The conditions on the conditional
code removing the unpack task need to match the deltask function, else
the source date epoch function can end up running twice and the functions
can race with each other causing build failures or corruption.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e82095c02881410035ca23dc12692f074d8ed39b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 1ea938fb62..9fe9d36f76 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -109,16 +109,15 @@ python () {
             if local_srcuri and task in fetch_tasks:
                 continue
             bb.build.deltask(task, d)
-
-        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
-            # The reproducible_build's create_source_date_epoch_stamp function must
-            # be run after the source is available and before the
-            # do_deploy_source_date_epoch task.  In the normal case, it's attached
-            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
-            # we need to move the function elsewhere.  The easiest thing to do is
-            # move it into the prefuncs of the do_deploy_source_date_epoch task.
-            # This is safe, as externalsrc runs with the source already unpacked.
-            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
+            if bb.data.inherits_class('reproducible_build', d) and task == 'do_unpack':
+                # The reproducible_build's create_source_date_epoch_stamp function must
+                # be run after the source is available and before the
+                # do_deploy_source_date_epoch task.  In the normal case, it's attached
+                # to do_unpack as a postfuncs, but since we removed do_unpack (above)
+                # we need to move the function elsewhere.  The easiest thing to do is
+                # move it into the prefuncs of the do_deploy_source_date_epoch task.
+                # This is safe, as externalsrc runs with the source already unpacked.
+                d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
-- 
2.31.1


