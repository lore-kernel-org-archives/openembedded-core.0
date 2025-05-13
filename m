Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F66C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 07:43:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.70596.1747122179672392377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 00:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AMJ4ijCs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250513074256e0e103c958c375f666-qh_t6x@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250513074256e0e103c958c375f666
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 09:42:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wxFLsJj6G4bjNVuEiKJ56fO56Rnmb096o1ZQH2V2mWc=;
 b=AMJ4ijCsN0gkSvzHH8QxvfYh2tVF6Zd06f1pKpUcv/TYAOIBDUwBG8WUySgvSAwothT4e6
 DjulsnctbU3RGgTqUQwJUbbZm3PWWyji3Lk5RNFflc46kWVWGbiZsamWAE4xxGXz1iYSi0y8
 G8t+LcCuth0XuIhMDWw1IY7UuWKdvEQftGfDrfza97eP1i3EHhBUAl6zQ2Ed9EL7gfoqdkf6
 XrJpzfoCATJ74ybNqBLnh+5MySK9NMG/hNJpfN+/wUQ/MpRQS71xab9/mHTouMZZW1E5zFZi
 +zX5SDdngb0eKxxXjDtFPQhgxDkExrW7lRYqBDOpfS1rdTAvDg9LxCLg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] testimage: get real os-release file
Date: Tue, 13 May 2025 09:41:57 +0200
Message-Id: <20250513074157.14632-1-peter.marko@siemens.com>
In-Reply-To: <20250512155835.9159-1-peter.marko@siemens.com>
References: <20250512155835.9159-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 07:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216401

From: Peter Marko <peter.marko@siemens.com>

/etc/os-release is a symlink to /usr/lib.
Symlink is retrieved as a dead link which points to nowhere if also the
original file is not accompanying it.
Fetch the real file in addition to this link.

Alternative could be to use "tar -h" (supported also by busybox tar),
however that could lose some important information if links are relevant
for failure analysis.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index e090b1ef4b..847a6f18a8 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -26,7 +26,9 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${localstatedir}/volatile/log \
     ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
+    ${sysconfdir}/os-release \
+    ${nonarch_libdir}/os-release \
+"
 
 # If some ptests are run and fail, retrieve corresponding directories
 TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/*/ptest', '', d)}"

