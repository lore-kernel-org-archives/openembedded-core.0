Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE10BC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 16:51:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.12465.1633366273427525687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 09:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="222944194"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="222944194"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208911"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/11] rm_work.bbclass: Fix for files starting with
 -
Date: Tue,  5 Oct 2021 00:50:53 +0800
Message-Id: 
 <88d67525dc70c21b5a29dbcef65d12a1c780d717.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 16:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156617

From: "William A. Kennington III" <wak@google.com>

This makes it possible to name files starting with a hyphen in the work
directory. Without this change rm will fail due to an unexpected option
being passed.

Signed-off-by: William A. Kennington III <wak@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f1a63e0de4921ef970114a16d0827fcddcdaa0e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/rm_work.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 01c2ab1c78..2d5a56c238 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -73,7 +73,7 @@ do_rm_work () {
             # sstate version since otherwise we'd need to leave 'plaindirs' around
             # such as 'packages' and 'packages-split' and these can be large. No end
             # of chain tasks depend directly on do_package anymore.
-            rm -f $i;
+            rm -f -- $i;
             ;;
         *_setscene*)
             # Skip stamps which are already setscene versions
@@ -90,7 +90,7 @@ do_rm_work () {
                     ;;
                 esac
             done
-            rm -f $i
+            rm -f -- $i
         esac
     done
 
@@ -100,9 +100,9 @@ do_rm_work () {
         # Retain only logs and other files in temp, safely ignore
         # failures of removing pseudo folers on NFS2/3 server.
         if [ $dir = 'pseudo' ]; then
-            rm -rf $dir 2> /dev/null || true
+            rm -rf -- $dir 2> /dev/null || true
         elif ! echo "$excludes" | grep -q -w "$dir"; then
-            rm -rf $dir
+            rm -rf -- $dir
         fi
     done
 }
-- 
2.31.1


