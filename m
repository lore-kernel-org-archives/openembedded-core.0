Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D8EC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:16:58 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.26589.1647267417033193989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=aSHM3Ie8;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647267417;
  x=1678803417;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CgmF6Nk/0ApyFtt3hK7kQBlyC6iRZF+Wpkig+Vp1Ps8=;
  b=aSHM3Ie8D1ZLBEmR2yEI86xuwx9A40bsO5YyiSBZ7EejGOMVAR6nLdRj
   VFfP37HKE4+mWkVbcDiINYGe+npWmgkzNMqU0j31WYuHVEUkL1hzIsoQh
   wSZKNDOGntwIRJq13EvQ2zro+WADO9GXcXDa5RuR4bxvtKRv0Mouzw+8v
   KvWVpk65+VXPvnixrBjPjshviBNp4KrKacqn/33zS3JNumtD40GVskLN9
   CPhZ4LLDJSNnKIyf70j+teSbvlgbYCXPFnA86WQm64xJnxQlEvUd4rI0p
   WkorHvq6uNNPhzIHwn8CWTC8yfgp3Nq9x58KAWpOfylXWaNvpvq56D+KA
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] package.bbclass: Remove an unnecessary path from
 do_package[dirs]
Date: Mon, 14 Mar 2022 15:16:46 +0100
Message-ID: <20220314141647.14807-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220314141647.14807-1-pkj@axis.com>
References: <20220314141647.14807-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:16:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163145

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is no reason to include a path in foo[dirs] if it is also in
foo[cleandirs] (except if it is the last path in foo[dirs]).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f822258150..e71daafe94 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2464,7 +2464,7 @@ python do_package () {
     oe.qa.exit_if_errors(d)
 }
 
-do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
+do_package[dirs] = "${SHLIBSWORKDIR} ${D}"
 do_package[vardeps] += "${PACKAGEBUILDPKGD} ${PACKAGESPLITFUNCS} ${PACKAGEFUNCS} ${@gen_packagevar(d)}"
 addtask package after do_install
 

