Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5216.1795815552666656340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 13:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=S8Y9wjuW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261127213910bf4c8b95aa0002078a-w70jfk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261127213910bf4c8b95aa0002078a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Nov 2026 22:39:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=v1yQeiO7/elq4CHYNzr3iE749Jnzpm48NuK0e0zSAmk=;
 b=S8Y9wjuWtLZXlxy3biNybeKmGi9SfMe98LsjtNK/ObAwBmg/FSN8IRkMLQff46SvTegNX8
 y6caUD6wQ9Ff6sr/Q0WU4+djxH+0NPYd0EQNLmqPtlSt4kOtdQdtTYZKmI/RFzcewKYYhtSF
 CecU2AC7q0WDg4I4BES+i3mqh9AbTU/msBxRRQLJjUPLTucxXs9m6C98RMVw6XcOl4jy9h+J
 3MX3far+VZnael1tulx6LIFtlOlJy3IOAJOuNHMdJ5rX5hIem4MeegQ1X91nJcA0QPPCnXqL
 jC4sEU+u0nbZa40+U2EwWblQ90WdeW9iHHTj1iAjXvnnifQHm4ourbzw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] wpa-supplicant: set status for CVE-2026-137307
Date: Fri, 27 Nov 2026 22:31:19 +0100
Message-ID: <20261127213119.693664-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 21:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251461
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
 
