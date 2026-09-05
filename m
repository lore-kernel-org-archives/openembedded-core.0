Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B58C79FA1
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2482.1788641121731130944
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Zm7Vmwbl;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-485843aeab8so2346604f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641120; x=1789245920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GdblaBRcStVSPVGMVA49Pl395qgNwk97NwGXWp3CETI=;
        b=Zm7Vmwbl/SGOS08yYpI3jE17j2UyqSUlIsJ+YohMSg0TAWKki22PuqrzvQHcseWHtW
         uw3IUOgSokm0oQOKuTvnMFgR5k90XpKfAZei+39bk00OdvSzPwrsa6ZlgO2fiFrv+s9A
         joRzA27VGVF43uK+0TN6Xk/D4pmiARO/fwNoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641120; x=1789245920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GdblaBRcStVSPVGMVA49Pl395qgNwk97NwGXWp3CETI=;
        b=aefoVfDGw1PAWNlpuNxHJklp9OPOB7nVwuNNlXLjVed/zweQE5cHEVvoMFKMbTRWrU
         D0fajPWSwa5z3QmvcZdJKLvM5R2AruEEiQ9ZSitPtPtVzudm/vAjvMQBM8P4z9QH8zUa
         KY11bVv39IhNF5okJgisaXXnxY4fBFlMCT/wueBejrTAVKNWWgLBEq1PjRmE1YAZ786Y
         S7Wcos1XM6/7Wh+V1csNw7C/UTS5sPtH8RcFNJ9V/wHIoWhht5KeLRJ3XIxNBXMhTyVo
         PjvkOcrF9SueRO+/cPRUm7mukGENXkbkmsKKsFeKQYa8IaPrgpQ42X5XBURg0Pn2aaYs
         tT7w==
X-Gm-Message-State: AFuF++lwRwWRf/I+bBLQfSFaMDweU4GH57ogtXNF5YaBmnX6dtbtsP8N
	qoLE+NxQ8BT6kcQ2siz9bRqAuRN5YQdVhAuzgCln5tfQi8P/ZsXJo3E8/ioqNJO8vCeMjG14Oqe
	lfilbi7U=
X-Gm-Gg: AYBFou2UOGM9uXngkqi9drtNosP7LoxaGAZJkS2bxvlbtyvVJCf2EmQO7M/pNNMMgWi
	MCw9VV+Gob13sUDdy3kIVGLHkKgzpQazlJDQq6qvAlBF0Yb+jrY3mCT2GhorMxNzhYDY+8lHGFf
	y7+VngFzRqHd7ndQw1hPfKbZMwedIKo0EVNRw3BoxIxyl6hKSodTpR+z1Cl2DFTcynqReAU/07/
	ZlZFReFuO3a0KBhnY+dRL9e26uK9Qs6t83KX3lHmLu1EK/PA7BVQsn6UxrL9mCdayOKq37hVw06
	H53UHKZKNNmqYSKkNXA9509KowBjj3+b+DixvTkPSFYqbQJsYFPm9TOaXT+5IN5hq47URAHA0ih
	CnptrxEUqtnujsvF8yRNiVUy6ewv/3SHhu5KJ2/cRDypWsB5SyrimU/BEMqJ8DThoiXg2m9Gjks
	p1qoyRgE2TEV9JFwf6OEnYM3SiJ+H98sq6aCtyrF5DYeTSQuR1eGR2sSqD29OWbMeMZtd/5r2pu
	N+D+yuGFJegkA/ThDA0iX3NV3czSJoUNV5MxuL6LfiFVYzh4EIS7wiVDQEQ/Czo/A==
X-Received: by 2002:a05:6000:29c9:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-4858709b390mr23097541f8f.28.1788641119959;
        Sat, 05 Sep 2026 13:45:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/40] gnutls: fix CVE-2026-42010
Date: Sat,  5 Sep 2026 22:44:18 +0200
Message-ID: <efcdec89babe8c4acbd7329cafa43f71022ead1f.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245169

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42010.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42010

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291f52ca98d5

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42010.patch        | 41 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
new file mode 100644
index 00000000000..b94a32afffc
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
@@ -0,0 +1,41 @@
+From cb1833afd9b6309563211b1c0a7c291f52ca98d5 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 21 Apr 2026 19:26:10 +0200
+Subject: [PATCH] lib/auth/rsa_psk: fix binary PSK identity lookup
+
+A server looking up PSK username with a NUL-character in it
+was wrongfully matching username truncated at a NUL-character.
+Fix the check to compare up to the full username length.
+
+CVE: CVE-2026-42010
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291f52ca98d5]
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1850
+Fixes: CVE-2026-42010
+Fixes: GNUTLS-SA-2026-04-29-4
+CVSS: 7.1 High CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/auth/rsa_psk.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index cc92b4aa96..27caf18769 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -321,8 +321,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 	 * filled in if the key is not found.
+ 	 */
+ 	ret = _gnutls_psk_pwd_find_entry(session, info->username,
+-					 strlen(info->username), &pwd_psk,
+-					 NULL);
++					 info->username_len, &pwd_psk, NULL);
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index e9059a4bc16..51ef394dfcf 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-3833.patch \
            file://CVE-2026-42011_p1.patch \
            file://CVE-2026-42011_p2.patch \
+           file://CVE-2026-42010.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

