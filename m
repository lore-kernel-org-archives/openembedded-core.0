Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5217.1795815559649484862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 13:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=P3k1he5x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261127213918b27748507300020748-ba4pi5@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261127213918b27748507300020748
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Nov 2026 22:39:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oSwSGWBYzVy/qGNvTznJATRZ4ZK1I8p0omYiCdcDaaU=;
 b=P3k1he5xLqVHdQdzjHLDfGMCrjpMmDKPHEiQLrLGaNyfDFF9xiNIQovNPLF4DeTNDiZ3vJ
 Q3XOugYOy9dnNIL2j9NDvS7mWWYnErSd89l6MgXJG3LSFHim5biGDEM+NHE8k1O1SxTmmm7f
 Jrhs6emQ0sA0aPDVKgZtIab7Dx2qZBKgA5pWGtb3gehs9Bkwu+IrDb2KXAe+lv85ycS0x7gV
 IsvJGGrwe2S6ygVj2kQasbbRg5xVMAdgUEgCeeYQtaUcbJACgFhGxX7MqwlxHy/vf2j3UeA+
 zZ5frcGBkpmdREfU+Uj0TmGPStkWJwPUt/44+Xp0vfDMNHCHS+dLkUDQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] wpa-supplicant: set status for CVE-2026-137307
Date: Fri, 27 Nov 2026 22:31:27 +0100
Message-ID: <20261127213127.693703-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 21:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251462
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

The CVE description says:
wpa_supplicant 2.7 through 2.12 with the wolfSSL backend ...

So ignore the CVE unless somone would use wolfssl backend.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7d1f9ffc6d..592334f96b 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -40,6 +40,7 @@ PACKAGECONFIG[openssl] = ",,openssl"
 CVE_PRODUCT = "wpa_supplicant"
 
 CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant"
+CVE_STATUS[CVE-2026-137307] = "${@bb.utils.contains('DEPENDS', 'wolfssl', 'unpatched', 'not-applicable-config: applicable only with wolfssl backend', d)}"
 
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
