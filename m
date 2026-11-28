Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5685.1795866872116717461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 03:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VO4dD61C;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261128115430c77be9114f000207d6-4px9zb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261128115430c77be9114f000207d6
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Nov 2026 12:54:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5y3kZDu0rtlX0L5283eLUtBcQKjy9e5Ec1OHuVnwPY4=;
 b=VO4dD61Chvv7eR3qhd3mdQcLsqZMqpWummbzRrxnIsi2Jzokci0+G/noyb+lzteYPgknTR
 LJ9+6VkGl9lBrYrf1YNDYzO5RJmgj2dGp+9kWpQZJ6rj3yBEuJ8nWlTx4CVJ/BAGfDjmvO6a
 8oDqZQrAqPJkpPdHjkwo+NGoBoPURboNq2udadsfvH7ehSklCH6UjXb3eLhGnfydSBxxGkFH
 jEqxB3Ke6gu40DzNspEl9dW8UQllmTzsaeqHUMC1g6LLj5CZo6n9XH4WcfmjfvcGA76SiHgV
 lABKDrubuW6cUaIju43bq+ZBXfcieWoNpkO5kC15flDIqSfLu4M4ymCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] gnutls: patch CVE-2026-127040
Date: Sat, 28 Nov 2026 12:53:46 +0100
Message-ID: <20261128115346.3079683-2-peter.marko@siemens.com>
In-Reply-To: <20261128115346.3079683-1-peter.marko@siemens.com>
References: <20261128115346.3079683-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 11:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251493
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnutls/gnutls/CVE-2026-127040.patch       | 33 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-127040.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-127040.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-127040.patch
new file mode 100644
index 00000000000..8733ce30f77
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-127040.patch
@@ -0,0 +1,33 @@
+From 8767518753a633e5ef59f112310db8dc9ff6771a Mon Sep 17 00:00:00 2001
+From: Zoltan Fridrich <zfridric@redhat.com>
+Date: Tue, 5 May 2026 14:51:00 +0200
+Subject: [PATCH] rsa_psk.c: add missing return
+
+Fixes: #1868
+Fixes: CVE-2026-127040
+Fixes: GNUTLS-SA-2026-11-18-2
+Severity: Low
+Introduced-in: f032324af70b8420f7b550f3277efd4a9cd2b2dd 3.7.7
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+
+CVE: CVE-2026-127040
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/8767518753a633e5ef59f112310db8dc9ff6771a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/auth/rsa_psk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index bf88cad0b..240558f55 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -298,7 +298,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 
+ 	ret = _gnutls_copy_psk_username(info, username);
+ 	if (ret < 0)
+-		gnutls_assert_val(ret);
++		return gnutls_assert_val(ret);
+ 
+ 	/* Adjust data so it points to EncryptedPreMasterSecret */
+ 	data += username.size + 2;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 4fd9106ca21..6cb085be036 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-5260_p1.patch \
            file://CVE-2026-5260_p2.patch \
            file://CVE-2026-127039.patch \
+           file://CVE-2026-127040.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
