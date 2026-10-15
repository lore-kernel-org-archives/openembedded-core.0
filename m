Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2770ECC6B3E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32815.1792040620339474105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S34qqyXR;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2872227f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040618; x=1792645418; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhUg5JeXtSlF0vS+Fv0VzyR6D3TT1mk/tBVDuxp7Cso=;
        b=S34qqyXRuHquUyKChN0Dj8IGD4L4FsbNICreeNYsoRf1+cSIYavN8v4+hMi5PeBBtl
         LLWgJGfU5PQDKaNq4niMWHLFdQ0dh7CBd3nK/cmH0SKPALAEDblIDOF9Z+/33eoDEs0V
         HdrOCCKqSewjdbjM6uAz6MlEyHbCHiob/K6So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040618; x=1792645418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhUg5JeXtSlF0vS+Fv0VzyR6D3TT1mk/tBVDuxp7Cso=;
        b=wAZE0X1SKjawEyDCejDUWk3ZcI7N+5EMQXjIVSXH41nMZuEDFc2+doHXyjrOnCNn9R
         mpui6OyRpl6aYUwtysEbE9Jno3BQCVvU8jFD4vXxeY9mx2vVWaGGw6SZEMNK3ul1OHFD
         6BJZHhqUPwlDWN3J2reYIFeYB3AUBHYKyFGnGofbqEiXoC8zakVKwN9UmvVQHskkUps1
         uaFkoQYmIPyDs4VMGSYS0kCTo1Oo0biP91/LCR2TMeP699na76IxBpYuGWTaa37Xwajk
         BvWW+ePq2mGKcR9dB4e2Fg/sn0mc4o9jsw8vVFMwBEtG5XnIgeNyloTj3Z8ke9swZxwP
         EbEA==
X-Gm-Message-State: AFq9FYISIlLjSLAfgja3lM2WlOvNiG5WMvrb2L7fRdWfmZf1rvMCYqr1
	seNoUvk3aTV3YYe2/BtwU1qsam5ZsoqQ+c84TzhT1bG9UwB8+93d3gWD98fF91eWZoM6jSPGN1X
	61/Zbg3A=
X-Gm-Gg: AYBFou3VjRUtZrBCnxkt40cYFX6pqYRXtP5DqbYr/4O/dk3CaL0yO/4A2U5U9/SsBya
	FZC1+okJw6cy/TbO7h3jbKbchNXH4xMZO59KJ+Ui8hmh23RDWdmk4Hg6PdMFIau0O1An3PHfu0q
	zoK3S0bVcmgmI9VS5PgFPBFQaxwgznEr0jW4H/FLjaskW7GgoMSalFzsCxFIRzvmxgPvPqkVSuJ
	7vEhSrmNRYKF5sbMDN25Tm+aAoejNpanATuRVD2s5w1JjOjjsY+dkKyPLRPXJachGue58H8t7J/
	b18g39cJ8bq7wXPxlTHrTn6l0hPIAHgm00ULUQLqNqr7tbYzLuIpSrd+3Dt+mEciw7HW9H6vEdV
	hXvtoxavDhny1gnxYwcnerIsylvvMBMvmTVEBFuPSpQbS2GVV083H2Srk/l+WgxcniNctfqKlN0
	TlfVKnSzvJEDUVRKsH6LFr222adPNibdFsauByh4iafWJmYL8ujQxQ+nkGocpcaD0msfcxWak6X
	hYtKpSUpadBtFyiR86CqZ0RKX7ahLxnOxoX1Jj6UM9V3gOfLsQrGX+ud3sNdPfLv0ufdBJ71mFR
	6AGv5pGp
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a18e4d55a2mr346683785e9.35.1792040618530;
        Wed, 14 Oct 2026 22:03:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/55] gnutls: fix CVE-2026-42013
Date: Thu, 15 Oct 2026 07:02:26 +0200
Message-ID: <aa901f65306145be382b2ac96a3383ed7a236ff0.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247801

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
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 646cc350d9d..f85feb7dd2e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -56,6 +56,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42012-pre2.patch \
            file://CVE-2026-42012-pre3.patch \
            file://CVE-2026-42012.patch \
+           file://CVE-2026-42013-pre1.patch \
+           file://CVE-2026-42013.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

