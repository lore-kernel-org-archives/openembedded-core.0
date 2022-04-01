Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC475C54F3D
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6323.1648857550885986161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 16:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XC16NLki;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648857551;
  x=1680393551;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=E1mUcrluSyuM+oLV1IctkoJoACPW0pkLZ8bTMU80mcY=;
  b=XC16NLkiP0YUbWYRI0ETQFhhFdmAdTy5r14aRjUQwvhKXGc1F9LfBN/z
   Ee4ijM57A8wvDBhSQPes5a4OFZo25Q+BEBRuLz7e9XoazzWp1tNsdsaX8
   1BYLGqsiuBBJLBaxkcdide18YunYDdnTGoGVfgg9dRoIhPbAeQwsL5xiL
   KF/6pTxAr43tCAJCfZz61LmZ8luHU0qoy9nyIKytZ6LXDUxwEP4LIsIby
   fJIZPx/dcEkIScn12lTJYMXrBBJfDYxNRXqS/MijLGzvsp5d79cpVrFHI
   Mx+9VgYacDVn9mOAUETKGxhqxVLulAVVh7Wa7+NExc93hY9UC2rK+gOc5
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] insane.bbclass: Make changes to QA_EMPTY_DIRS trigger
 package_qa to rerun
Date: Sat, 2 Apr 2022 01:59:06 +0200
Message-ID: <20220401235906.652-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220401235906.652-1-pkj@axis.com>
References: <20220401235906.652-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163948

If "empty-dirs" is in ERROR_QA, then changes to QA_EMPTY_DIRS should
trigger the package_qa tasks to be rerun.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 873706952b..ca67a70c43 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1117,6 +1117,7 @@ python do_package_qa () {
 # binutils is used for most checks, so need to set as dependency
 # POPULATESYSROOTDEPS is defined in staging class.
 do_package_qa[depends] += "${POPULATESYSROOTDEPS}"
+do_package_qa[vardeps] = "${@bb.utils.contains('ERROR_QA', 'empty-dirs', 'QA_EMPTY_DIRS', '', d)}"
 do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
 do_package_qa[rdeptask] = "do_packagedata"
 addtask do_package_qa after do_packagedata do_package before do_build

