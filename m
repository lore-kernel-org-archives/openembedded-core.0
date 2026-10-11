Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A61CA9EC7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23440.1791708077042498508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pl6iApY7;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af27fe287so818846f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708075; x=1792312875; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V23RtXl4Lyyx7QLRvMbNj5+7rsZN7u++iwDpLKOTgic=;
        b=Pl6iApY7rEbVlzmYhgOZN7Kt+4UOu+TcJ6/NfI9apzL7KfuSrt9EBgtWegZLOl4hRO
         AFF+uEMHkQ+EZ+9hRbc4EjIizIClsr8TQaZ8n91VodT1Oljnv+PEYqBDCmLswCa/RD3g
         WvwtuxljZeahJfFkNEcZwisaeiCO9dmblArYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708075; x=1792312875;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V23RtXl4Lyyx7QLRvMbNj5+7rsZN7u++iwDpLKOTgic=;
        b=0ZOkak4LpCnpkRVy66p/FW4x2IoK7qsnLU4R7RrZUlcEM8R9OSZnX7SVSixB2RTuzW
         KfT2ujVK6DjGO/iV8ezgMIryKpkZrkEk92GGJu9Kf2dLbTJ5APtBjFyv6U1ucTm+tnJ8
         GkLksJtKrz4FY5rBwTAFuu5+sCm+oZJ5RgqHx2wZ8LIB41kiZ2rK2GALxfN3Bh99WqoY
         t4g/2oC4S+RhpPq5Zlu+YSj05dzsvzNdpngAE6Fu4VXfaiteqzkGObGoEo4osKRZzupl
         a0c6c3J38MdhQxMfqBKeLcBjz9FyzHDR3D4+IcXvTcL3GaAtmRTql4TTbQC55PqaRoh5
         I2Tg==
X-Gm-Message-State: AFq9FYKhRMvq8UxOLHO9FI/pKHub6dk/i7xk+x89wclPp0ncBoAucSkj
	YakcjlpdumOAWOA5gYjWeTuP/nWhNqV0Od/81ldb2tGt7SBQSR5o/f9aLj8fVQTknuqtDcIdaCA
	IhWXiH54=
X-Gm-Gg: AYBFou1//fjmP4RfhYavf8HtnzJpaZVkkyYFVZO8RVK3T71SV5Sd74z9IO0J5RrKyvO
	O8lGHA0OSkJxXhhoBLlVf6loIfOfhW86LbP18y0T9ig3wefGzC6NzmYRo1Cjgw7zfk5KOVazByj
	1+GBEhbZdlvDDYnwuyapiJVIiJolA7BSi41cGpNJOsf9r4GOf2AolFkRYHgWsNUoGOXh1APq/X1
	YRXWPOGZKjQavgtkaRRhxI9GPsE8Qr5j67EONDxJu5624SD/JPOUSr+jxr/jIlm9I+v2TozuJKr
	NXICG7n24GVS6xwpx66K2trH+wNrxOcY0enDasGKID43bLMr6+TAVQPA8jLYt0LMHJgOohSMdPq
	bZt7bl63gJ4O/1YFgWtOLhpOAlWA16DYPvYtwVqA1oeO2gZ0NxZwjdyj3Zx+j/Si5OI3LiRu/QB
	OCWM/ZN+Sh+6cS1zb7uP+K2hqXg7pcHlIKf/qSBu+Uw39g+NBBMctIWiMOYVw7MiTW2nAOJXXMY
	hWxBkpZVZXWr7yTAt8aGrHr3nBoXoqsNxIIaCNW8NAs/hxVnKr4X4PCvxGLhP09IrTDT+heSsJh
	0+E5ZXGj
X-Received: by 2002:a5d:59c3:0:b0:48c:7082:ebb with SMTP id ffacd0b85a97d-48dbaaef693mr11624304f8f.42.1791708075064;
        Sun, 11 Oct 2026 01:41:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/60] gnutls: fix CVE-2026-42013
Date: Sun, 11 Oct 2026 10:39:56 +0200
Message-ID: <7bb61fbec24285a15d6f43d4fe3fa21d2e93ae75.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247532

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42013.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42013

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/29801bef00ecc0f23c0bac4cd333b269cd2c1af4

Tested with ptest
Pre patch taken from upstream so CVE fix will land cleanly

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42013-pre1.patch   | 56 ++++++++++++++
 .../gnutls/gnutls/CVE-2026-42013.patch        | 74 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  2 +
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42013-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42013.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42013-pre1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42013-pre1.patch
new file mode 100644
index 00000000000..53687cb53b9
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42013-pre1.patch
@@ -0,0 +1,56 @@
+From 3ee2cb707002f755e4bda3f75285caa0cb36c214 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 15 Apr 2026 15:35:59 +0200
+Subject: [PATCH] x509/email-verify: call fallback DN fallback
+
+A comment was inaccurately referring to DN email field fallback
+as CN fallback.
+Rename a few things as well to match x509/hostname-verify more closely.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+CVE: CVE-2026-42013
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/3ee2cb707002f755e4bda3f75285caa0cb36c214]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/x509/email-verify.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/lib/x509/email-verify.c b/lib/x509/email-verify.c
+index dbef0bb86e..3c22ffed37 100644
+--- a/lib/x509/email-verify.c
++++ b/lib/x509/email-verify.c
+@@ -42,7 +42,7 @@ unsigned gnutls_x509_crt_check_email(gnutls_x509_crt_t cert, const char *email,
+ {
+ 	char rfc822name[MAX_CN];
+ 	size_t rfc822namesize;
+-	int found_rfc822name = 0;
++	bool dn_fallback_allowed = true;
+ 	int ret = 0;
+ 	int i = 0;
+ 	char *a_email;
+@@ -76,7 +76,7 @@ unsigned gnutls_x509_crt_check_email(gnutls_x509_crt_t cert, const char *email,
+ 			cert, i, rfc822name, &rfc822namesize, NULL);
+ 
+ 		if (ret == GNUTLS_SAN_RFC822NAME) {
+-			found_rfc822name = 1;
++			dn_fallback_allowed = false;
+ 
+ 			if (memchr(rfc822name, '\0', rfc822namesize)) {
+ 				_gnutls_debug_log(
+@@ -102,12 +102,10 @@ unsigned gnutls_x509_crt_check_email(gnutls_x509_crt_t cert, const char *email,
+ 		}
+ 	}
+ 
+-	if (!found_rfc822name) {
+-		/* did not get the necessary extension, use CN instead
+-		 */
++	if (dn_fallback_allowed) {
++		/* did not get the necessary extension, use DN email instead */
+ 
+-		/* enforce the RFC6125 (§1.8) requirement that only
+-		 * a single CN must be present */
++		/* only a single one must be present */
+ 		rfc822namesize = sizeof(rfc822name);
+ 		ret = gnutls_x509_crt_get_dn_by_oid(cert,
+ 						    GNUTLS_OID_PKCS9_EMAIL, 1,
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42013.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42013.patch
new file mode 100644
index 00000000000..c63e4d7039d
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42013.patch
@@ -0,0 +1,74 @@
+From 29801bef00ecc0f23c0bac4cd333b269cd2c1af4 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 15 Apr 2026 16:02:19 +0200
+Subject: [PATCH] x509: prevent fallback on oversized SAN
+
+Passing oversized SAN did not preclude CN (or DN email) fallback
+during verification, which is an RFC 6125 6.4.4 violation.
+
+Now oversized SAN are skipped over,
+but prevent the fallback from happening.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1825
+Fixes: #1849
+Fixes: CVE-2026-42013
+Fixes: GNUTLS-SA-2026-04-27-8
+CVSS: 6.5 Moderate CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:H/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+CVE: CVE-2026-42013
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/29801bef00ecc0f23c0bac4cd333b269cd2c1af4]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/x509/email-verify.c    | 14 ++++++++++++++
+ lib/x509/hostname-verify.c | 14 ++++++++++++++
+ 2 files changed, 28 insertions(+)
+
+--- a/lib/x509/email-verify.c
++++ b/lib/x509/email-verify.c
+@@ -75,6 +75,20 @@ unsigned gnutls_x509_crt_check_email(gnu
+ 		ret = gnutls_x509_crt_get_subject_alt_name(
+ 			cert, i, rfc822name, &rfc822namesize, NULL);
+ 
++		if (ret < 0) {
++			if (ret == GNUTLS_E_SHORT_MEMORY_BUFFER) {
++				/* oversized SAN; proceed without DN fallback */
++				_gnutls_debug_log("oversized SAN ignored, "
++						  "disabling DN fallback\n");
++				dn_fallback_allowed = false;
++				ret = 0;
++				continue;
++			}
++			if (ret != GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE)
++				gnutls_assert();
++			break;
++		}
++
+ 		if (ret == GNUTLS_SAN_RFC822NAME) {
+ 			dn_fallback_allowed = false;
+ 
+--- a/lib/x509/hostname-verify.c
++++ b/lib/x509/hostname-verify.c
+@@ -213,6 +213,20 @@ hostname_fallback:
+ 		ret = gnutls_x509_crt_get_subject_alt_name(cert, i, dnsname,
+ 							   &dnsnamesize, NULL);
+ 
++		if (ret < 0) {
++			if (ret == GNUTLS_E_SHORT_MEMORY_BUFFER) {
++				/* oversized SAN; proceed without CN fallback */
++				_gnutls_debug_log("oversized SAN ignored, "
++						  "disabling CN fallback\n");
++				cn_fallback_allowed = false;
++				ret = 0;
++				continue;
++			}
++			if (ret != GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE)
++				gnutls_assert();
++			break;
++		}
++
+ 		if (PRECLUDES_CN_FALLBACK(ret))
+ 			cn_fallback_allowed = false;
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index fd332ee8c55..b5b3736a773 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -45,6 +45,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42012-pre1.patch \
            file://CVE-2026-42012-pre2.patch \
            file://CVE-2026-42012.patch \
+           file://CVE-2026-42013-pre1.patch \
+           file://CVE-2026-42013.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

