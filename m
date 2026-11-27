Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5209.1795815536368139147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 13:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YnDYXxvm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261127213853117f97d71a000207cd-njvmac@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261127213853117f97d71a000207cd
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Nov 2026 22:38:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=v1yQeiO7/elq4CHYNzr3iE749Jnzpm48NuK0e0zSAmk=;
 b=YnDYXxvm1MsNI60PS+gP/ADUhjdY7qLgffme5IgETxSUGTGzI+LErFZj6uRDTRsd/4mHrJ
 rotlf3SeWfe4WZbqrawgHUmP+q4SBdFGmXnTAX2+ab4Z6vm3H3B2RdBwLy5zFDK9sVhQ4YIT
 9prYTkVQXIDwnN+VbHSdJuVhQsw+9eUaUhOI343RilSo742ErAdUsQ8Nbc/JnXsIejnnxPi1
 YY3liudGaRz1SFLziK1SamaX91/5YtQnLEkchz+FbO4zM1+zgfIh6VN+RhsrFewQhJ+8WF8S
 qHIr2z/VFlEhbBR5aWXbjcabsz+MHEkC9A/0Uoqi66MiXYl6vY93FBOQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] wpa-supplicant: set status for CVE-2026-137307
Date: Fri, 27 Nov 2026 22:31:11 +0100
Message-ID: <20261127213111.693625-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 21:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251460
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

The CVE description says:
wpa_supplicant 2.7 through 2.12 with the wolfSSL backend ...

So ignore the CVE unless somone would use wolfssl backend.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
index 516699df46d..73a3c5312fd 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
@@ -31,6 +31,7 @@ PACKAGECONFIG[mbo] = ",,"
 CVE_PRODUCT = "wpa_supplicant"
 
 CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant"
+CVE_STATUS[CVE-2026-137307] = "${@bb.utils.contains('DEPENDS', 'wolfssl', 'unpatched', 'not-applicable-config: applicable only with wolfssl backend', d)}"
 
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
