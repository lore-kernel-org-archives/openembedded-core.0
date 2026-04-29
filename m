Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564F5CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:22 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4550.1777491437162002096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jpTRxCHo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260429193715ae95c5e78e0002075f-zw2lve@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260429193715ae95c5e78e0002075f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cs3cBzvJCnwWvJHvqtopa0GMiaKx6ExjpxAYuvCm3xY=;
 b=jpTRxCHoNySuNJGS8alVaiWilESR1rTBzdMxR4ke49e8lrfrXZ14uzhNNUStwidqwUploa
 8bp2b851uxKp7t2RyzXo46Ba36/aD+y/YgARCR0g2tlXNXdZsREHl79488V2HhkH/W8atu79
 OSluZAHBRN3VG2i55KwS4nt8fNn7Lu24an0aIFGB0/ARHdBrqaJr8iXB0WWWpydzgTE0i5/j
 U2C3L6SHy3cbBfd7xyPWfQGm0k2lsD56938R6iuwmH2WQK1uey7mmp1viYgHANozagmBIiEe
 dCZNIIhkv86opPOU9ZPhTTdQFJsmusgpqS18inYG3O6WAGiYR7uTzbOA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/7] libsdl2: set status for CVE-2026-35444
Date: Wed, 29 Apr 2026 21:36:44 +0200
Message-ID: <20260429193647.3090502-4-peter.marko@siemens.com>
In-Reply-To: <20260429193647.3090502-1-peter.marko@siemens.com>
References: <20260429193647.3090502-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236134

From: Peter Marko <peter.marko@siemens.com>

This CVE is for SDL_IMAGE, not SDL.

Mapping in sbom-cve-check tool seems to be wrong at [1].
It maps both SDL and SDL_IMAGE to the same CPE.

[1] https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_check/products/products.toml#L1608

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 834cf096b9..2b583448ef 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -85,3 +85,5 @@ CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 FILES:${PN} += "${datadir}/licenses/SDL2/LICENSE.txt"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-35444] = "cpe-incorrect: this CVE is for sdl_image"

