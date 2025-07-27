Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9112C87FCF
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 15:28:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.62118.1753630076327309961
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 08:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WpDDN/zM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250727152759138fb900f046cbae5d-snucgw@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250727152759138fb900f046cbae5d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Jul 2025 17:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uLHblDWRMJ3DW2qH4mbY9uVQ05ao5d7EoHzZ9jayKFs=;
 b=WpDDN/zMY6CnR9PAFVGKkIeOFFgBSkypREvJi7qHp2JxsZBch9Q98M9wU0TvK7QvRi2uDU
 Bt65t3lrbAKCwd13rFXO8U7ljfqgcMr1uXFhdXWgsOz1XDI+C5O28B7BVdHJDLGcfa4LLbtq
 ZgZYvlAJlh1Pzp61kXjVGVjk3xSWiNpXA5Ks9ywwEKDzLM29iZHZduv1W3R1FuPaZFnEEp6S
 9yKSH4f3Z4AV3x6i3dxsHH45hLPiF63lY+ElowHPsaZn58izzGQJI+8RmKoN2ZBJdRPpLvjP
 vztMcADqda95R2+wiMrBLu2pbIDfhWcole+aWhcm6SWJ1LIJftAAQ0Uw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/6] gnutls: patch reject zero-length version in certificate request
Date: Sun, 27 Jul 2025 17:26:55 +0200
Message-Id: <20250727152658.3852964-3-peter.marko@siemens.com>
In-Reply-To: <20250727152658.3852964-1-peter.marko@siemens.com>
References: <20250727152658.3852964-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 15:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220949

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].
The MR contains referece to undiscoled issue, so any security relevant
patch should be picked.

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-length-version-in-certificate-reque.patch |  37 ++++++++++++++++++
 .../3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2  | Bin 0 -> 830 bytes
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   5 ++-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2

diff --git a/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch b/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
new file mode 100644
index 0000000000..5cecbdfccd
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
@@ -0,0 +1,37 @@
+From 61c0505634a6faacf9fa0723843408aa0d3fb90a Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:35:54 +0900
+Subject: [PATCH] x509: reject zero-length version in certificate request
+
+Ensure zero size asn1 values are considered invalid in
+gnutls_x509_crq_get_version, this ensures crq version is not used
+uninitialized. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42536706
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/61c0505634a6faacf9fa0723843408aa0d3fb90a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/x509/crq.c                                    |   7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/x509/crq.c b/lib/x509/crq.c
+index 19e13623c..9e9801d2b 100644
+--- a/lib/x509/crq.c
++++ b/lib/x509/crq.c
+@@ -615,6 +615,13 @@ int gnutls_x509_crq_get_version(gnutls_x509_crq_t crq)
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
++	/* Note that asn1_read_value can return success with */
++	/* len set to zero (without setting the data) in some */
++	/* conditions. */
++	if (unlikely(len <= 0)) {
++		return gnutls_assert_val(GNUTLS_E_ASN1_VALUE_NOT_VALID);
++	}
++
+ 	return (int)version[0] + 1;
+ }
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 b/meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2
new file mode 100644
index 0000000000000000000000000000000000000000..23ff09c4be5ece2b2aae278f48b3a24543256e8e
GIT binary patch
literal 830
zcmXqLVzx49Vp`19$Y4-yC~6?g#;gDYJRkxF48;vZA;NqxAqZ_KWFP>M;Dk#U@*D6%
z#Mq#UxD7ZV0!#`DV57L;iWL;tp=^W3`9OULV-y&e8+(z|4Lox}6JxDG6JsTkBMqAv
zvxsmQ(BDLW7_gfE|Nj%AmUJaSq-!ClgBPy~G=HFR!CFzpKs@B6!4EYarV1l{G~%_N
LG)b5xr0D_xkf?K@

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 973f81719a..2a73a1e3d8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -28,6 +28,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
            file://0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch \
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
+           file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
+           file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
@@ -68,9 +70,10 @@ do_configure:prepend() {
 	done
 
     # binary files cannot be delivered as diff
-    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/ ${S}/fuzz/gnutls_x509_crq_parser_fuzzer.repro/
     cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
     cp ${WORKDIR}/5477db1bb507a35e8833c758ce344f4b5b246d8e ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
+    cp ${WORKDIR}/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 ${S}/fuzz/gnutls_x509_crq_parser_fuzzer.repro/
 }
 
 do_compile_ptest() {

