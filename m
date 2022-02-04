Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FD6C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:12:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fnLsnGzd;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983977; x=1675519977;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fWO+daPh0XaM6YTxt0pkStSE5s+R9tUGEctZ6eE7gwY=;
  b=fnLsnGzddNRNeY0aEukVI9HhyjMno+MAeapFLtx9MZ1dNtwKGDWWEqOS
   2tKqEBC6zk6qMPsKLkIhdU6XnaCLykY0Kj95CibP5uJFNGN3wqN24bVCj
   nhJjkqwK6NhS410g1ScSPfHTHAhklMhpB7q6HsTSmQfoYu8mhHu0Vf05O
   xrKo1HVkyFp4mJSwkW9cdYVEfVkVMTUiB3DuT6aN41GFgirpa6DPDEZgG
   Kf+4jsmYnjQWyCiIBThTXyDNCbfCjRlI+9vHw1UXjqGuWVjUgfRrGjcku
   N4W7IBgs0UMHESO6MoLYEFWjIZLiMEtNlOrMpkAo3P1lBfKUqAiTleCey
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321599"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750021"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/17] sstate: Improve failure to obtain archive
 message/handling
Date: Fri,  4 Feb 2022 22:12:30 +0800
Message-Id: 
 <25a7e8dae10dde6073dcdd80f1e2448b59dc9d1a.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:12:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161351

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The bb.fatal() case where sstate failed to find/use an archive in setcene tasks
is suboptimal. Bitbakes handling of setscene tasks will be to warn but the fatal
will turn this into an error, despite the real task being rerun.

In these failure cases other messages would usually have been printed so turn
this into a warning and raise a handled exception status so that bitbake knows
to fail the task but not print more messages.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7875baeca7a3ed216b2442fb8771e51efbfa5a4f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 566a58dafb..103de01264 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -788,7 +788,9 @@ def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
     if not accelerate:
-        bb.fatal("No suitable staging package found")
+        msg = "No sstate archive obtainable, will run full task instead."
+        bb.warn(msg)
+        raise bb.BBHandledException(msg)
 
 python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
-- 
2.34.1


