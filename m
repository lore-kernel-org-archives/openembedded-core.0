Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE375D4978D
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 18:54:33 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.157775.1733079271489778542
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 10:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FY4PMZQq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202412011854274c0067eb918d26a60d-acwsri@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202412011854274c0067eb918d26a60d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 01 Dec 2024 19:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2q47q35Jz2HxFcGdZ4au34xn6L/v63CKSfhKbO1j5Jg=;
 b=FY4PMZQqVewRWciEmoeRYOr6Jc/U/1Y+yWvtog73J8j3ojeSTzKQeS0Ex4X5U+LSBZO407
 YQVNtQDZGI4+Sc0mauaopIvaTqOCI1BAnlWBqJKJJj3fJCHN6ELNPs3tjxZIshP1D38C/hbL
 cUh+zp4TfV/ARtENz6XLF4BbB1gQ0IwfuphImWPATzX5I2w/U8XSoY83bmqn1ZZZyORK5JjM
 y2QxuznC6fbRSBzgc348K9dkT0cdwxqw/Id72YmEtcUW3fsd4paB+F3arW2ZmgXz+IiAb2+D
 zT+naWh5HBCIDP2o4MlnJ40HCHzmfTRtfmmoGyNOnsPl3L+MCiOp1cNQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 5/5] pixman: ignore CVE-2023-37769
Date: Sun,  1 Dec 2024 19:53:37 +0100
Message-Id: <20241201185337.2675566-6-peter.marko@siemens.com>
In-Reply-To: <20241201185337.2675566-1-peter.marko@siemens.com>
References: <20241201185337.2675566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 18:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208119

From: Peter Marko <peter.marko@siemens.com>

Same was done in newer Yocto releases.
See commit 72f2d4cf44b795f766ecdee0b8362c7e162c5efc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index 63fd6d2978..51728078fb 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -40,3 +40,6 @@ EXTRA_OEMESON:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATU
 EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# not-applicable-config: stress-test is an uninstalled test
+CVE_CHECK_IGNORE += "CVE-2023-37769"
-- 
2.30.2


