Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA2CA9ED8
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23441.1791708077383997662
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KlXaPDpn;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afe75f055so928553f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708076; x=1792312876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=veVcv8nywW2rVWrIQALXP0Hb45wdQ7fTuaDGZrLMAxw=;
        b=KlXaPDpnUlXAafwkbr5BhgXYl9ZmvZveEn3kbOMeqEAwKsM8bOXooG+2AmpGvzT3ik
         71MjhMz2Z2L7pgCY7Ya1o+NgXkmLmpV35HZ/2B6BVP+GkvdLew9J/iOmTfL7TWkrXVz/
         nhRN2p6Bj6U/ilRk1qoRF1RUQy1mhg4SOlaYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708076; x=1792312876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=veVcv8nywW2rVWrIQALXP0Hb45wdQ7fTuaDGZrLMAxw=;
        b=fSfI9pJksVcgDCnFYpJUuP9c03qa/a5IfWVbplf9xmxqDDQIH2dfbOcrm4vOMhQ6Hi
         XaP3TVLZrhHj3TtIOHD3DG8qDaaBvEG0pGnLoKz6VExEn1UX6j435dd39ygi3r14oEHc
         VpZuIdmFWsERnoLhuVmQ07B+RLcoegZXQEzbcib2pWRG3UwhmzPqnwCGTIZ9YYPL5kYf
         jNvzLV+Nb8Hqx3Fcnb1lYU+ggEUe+IvBVVk/zHFSspjHB42Nd5xRnJ4Bn14FyrXIlG48
         l1ISV1+nxbgZBAPNcZ1uCg+jKBEnPejqjuHzekk6IpKN9ikEY801rbrSouaxz2Anu5B7
         QX2g==
X-Gm-Message-State: AFq9FYLfYMOeGcsmBPijZp9qQiOP0FzA4MVtPcECDFkKGnVYBQhTF3+W
	k8Rs0PhWEZZxpOcTqYSZ7oe4x3WyoneFmUe9cL5YbV7RDntlCLfowdtXRFNPcK9a4KaAzI4e83m
	mmLQqBww=
X-Gm-Gg: AYBFou1ECK+sOIPPHZh6h0Xjhx3UBG+cWOPg0BEDT1xYTEdZlITWffi3ijQBSomoeTr
	oixIH/1IK0tLXpR0H46S+BTBJe5QO9YqCH0leSsrnq4h9+WpkkdyK82ds2cTIuG85+YiuTMpeMJ
	f90WjXKCzlvwU27QtMJzS9FO8kYSeunWZ1HRUIJUXYFdm3gfP2rwp5/TH7uaE2RbroySkhOwqDs
	mA/yCnKMgculDAZn7A9PVYwA4BCN7q5kbnJMj683yNPs1AnTkQqmw1GoG04+/4ZDVsY0QDgIf7M
	2urcNYIlF83r1rdUBAzlQEBOl0swvBVRYIQ0a+JM3FYpk9eyfKAvnCysPNT+2HZjt1FSCOqyWH0
	XK9Mi4Zjw3V1khBAA7bCkLNN6homn1Cj4S3g2i9pbDcVaIEUbzceghyGmqYBjmnYltkEexIYAs6
	hfX26iGMrHB/MrMcjvFYXlowbu9zRjG5Bh2tcw8fIzKI179L8+ur5XD8cAMFQEMu/OMbje+48xt
	k5evFy5peDXD3sfRnBV++nFH3imnScP3VQi1xf+2D/yRx+FpNvlwYXhvMMnaIwkeTqYP4+ewg==
X-Received: by 2002:a05:6000:420b:b0:48c:a08:5858 with SMTP id ffacd0b85a97d-48dbaae6fa0mr10554818f8f.23.1791708075534;
        Sun, 11 Oct 2026 01:41:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/60] gnutls: fix CVE-2026-42014
Date: Sun, 11 Oct 2026 10:39:57 +0200
Message-ID: <0442eedb5e359e2a6de0006274c96a772a18fd3f.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247533

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42014.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42014

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b3827f5cef701

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42014.patch        | 60 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
new file mode 100644
index 00000000000..776733829ad
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
@@ -0,0 +1,60 @@
+From 3957f136e2ed23caf176a594b54b3827f5cef701 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 18 Mar 2026 18:19:06 +0100
+Subject: [PATCH] pkcs11_write: fix UAF and leak in gnutls_pkcs11_token_set_pin
+
+Changing Security Officer PIN with gnutls_pkcs11_token_set_pin() with
+oldpin == NULL for a token that lacks a protected authentication path
+led to a use-after-free.
+
+Reported-by: Luigino Camastra and Joshua Rogers of AISLE Research Team
+Fixes: #1766
+Fixes: #1809
+Fixes: CVE-2026-42014
+Fixes: GNUTLS-SA-2026-04-29-9
+CVSS: 4.0 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-42014
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/3957f136e2ed23caf176a594b54b3827f5cef701]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c
+index 64b85a2..1dff578 100644
+--- a/lib/pkcs11_write.c
++++ b/lib/pkcs11_write.c
+@@ -1266,10 +1266,9 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 		ses_flags = SESSION_WRITE | SESSION_LOGIN;
+ 
+ 	ret = pkcs11_open_session(&sinfo, NULL, info, ses_flags);
+-	p11_kit_uri_free(info);
+-
+ 	if (ret < 0) {
+ 		gnutls_assert();
++		p11_kit_uri_free(info);
+ 		return ret;
+ 	}
+ 
+@@ -1290,9 +1289,11 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 		oldpin_size = L(oldpin);
+ 
+ 		if (!(sinfo.tinfo.flags & CKF_PROTECTED_AUTHENTICATION_PATH)) {
+-			if (newpin == NULL)
+-				return gnutls_assert_val(
++			if (newpin == NULL) {
++				ret = gnutls_assert_val(
+ 					GNUTLS_E_INVALID_REQUEST);
++				goto finish;
++			}
+ 
+ 			if (oldpin == NULL) {
+ 				struct pin_info_st pin_info;
+@@ -1324,6 +1325,7 @@ int gnutls_pkcs11_token_set_pin(const char *token_url, const char *oldpin,
+ 	ret = 0;
+ 
+ finish:
++	p11_kit_uri_free(info);
+ 	pkcs11_close_session(&sinfo);
+ 	return ret;
+ }
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index b5b3736a773..f0fec16d039 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42012.patch \
            file://CVE-2026-42013-pre1.patch \
            file://CVE-2026-42013.patch \
+           file://CVE-2026-42014.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

