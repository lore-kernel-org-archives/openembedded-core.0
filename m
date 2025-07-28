Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A5AC87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 10:07:26 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web10.77810.1753697238020690729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 03:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=e8OO40zQ;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=2978930ce=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1753697237; x=1785233237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U/FzDjhzJFaGctE0hx1eOrCcqgFI7DjnRFSuoyb+MyI=;
  b=e8OO40zQRc3tQfWZZ0Jmq0pFLh5cz2r75cMGOIaQiqhNkIFJ0tWDxZtc
   IeAXtb6LAOfel7wKnW/1KnT/wwj/NNiYGXzP2WIIxUGQO0QFwKaLldf0Y
   AkD7D3jYr5QHLUPqyngyBYDxNTuqgOXupZplRtOgUHYhBUoJ9VRtCxDS3
   4=;
X-CSE-ConnectionGUID: oRwh75rmTx2Ys2PQPcBpQw==
X-CSE-MsgGUID: LxoMvCpdRk2ieI1UVCIgIA==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw1.muc with
 ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb3.muc with ESMTP/TLS; 28 Jul 2025 12:07:15 +0200
Received: from marvin-ws (10.30.85.214) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Mon, 28 Jul 2025 12:07:14 +0200
X-CSE-ConnectionGUID: 38ych5vvRsihH6KfpZsexg==
X-CSE-MsgGUID: EIifXF9hR3GveVw7af6vdQ==
X-CSE-ConnectionGUID: mZZ4DipqTp2MuryUDEYO0A==
X-CSE-MsgGUID: QjbwjX9wQAKHPSUagNVjOg==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 2/4] setuptools3: Add missing call to exit_if_errors
Date: Mon, 28 Jul 2025 11:59:30 +0200
Message-ID: <20250728095936.1495441-3-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728095936.1495441-1-philip.lorenz@bmw.de>
References: <20250728095936.1495441-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220996

`exit_if_errors` must be called explicitly at the end of the task
execution to ensure that QA issues categorized as errors fail the task.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-recipe/setuptools3.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index 0adce5e2ece..c2f4b0287c7 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -23,6 +23,7 @@ python do_check_backend() {
             msg = f"inherits setuptools3 but has pyproject.toml with {match[1]}, use the correct class"
             if "pep517-backend" not in (d.getVar("INSANE_SKIP") or "").split():
                 oe.qa.handle_error("pep517-backend", msg, d)
+    oe.qa.exit_if_errors(d)
 }
 addtask check_backend after do_patch before do_configure
 

