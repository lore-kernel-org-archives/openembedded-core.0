Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E027FC636BC
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 21:28:20 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22191.1771795698892188597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 13:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MSklhPUS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202602222128153767c8b1060002077f-gqeozk@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202602222128153767c8b1060002077f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Feb 2026 22:28:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+JlgERy068LgWpMXcascEqzslbGW4i9z2zFc7zLStOM=;
 b=MSklhPUSFxpjFHeJ4cl4enVHKsYEPz0GkvjFa3Ow95TZkKy/8vi7e0LQxcA477S1z7bWyj
 aASMDfz9mrdtXwccbU5ZXg/ZFc88DjtmbiIVf0jwAdZuPRWhHUK0n7X7Pj8enbldcmD2YsoV
 Qhf+KtTxEF3jZv1b+K+mjp4Y+CwatRfdgBiw41DIaYk3f/RnW3Iaa9sXKtzrJhxRIdvEBbH+
 G+8djfy1y47KOgry82MiHZG6L7u3NLTVr4G2/jxmDoNzNwMxblatzEunaykzJONI+Yl61vmB
 LcurDgKBo6R4rNQ+RMmsi1jm2rbXXzu6vG3/Wn+/T+1afaPowgwxxDTQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] harfbuzz: ignore CVE-2026-22693
Date: Sun, 22 Feb 2026 22:28:07 +0100
Message-Id: <20260222212807.3128135-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 21:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231639

From: Peter Marko <peter.marko@siemens.com>

Patch [1] linked in NVD report fixes issue in cache code introduced only
in v6.0.0 (as can be seen in tags containind that commit).

[1] https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae
[2] https://github.com/harfbuzz/harfbuzz/commit/7a004a7ac27da776b623c0892ebced3d12213c39

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index f7dc61ebd56..f4e90799228 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -50,3 +50,6 @@ FILES:${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
 FILES:${PN}-subset = "${libdir}/libharfbuzz-subset.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# fixed-version: vulnerability was introduced in v6.0.0
+CVE_CHECK_IGNORE += "CVE-2026-22693"

