Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D967DC87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 15:28:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.61915.1753630076480622914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 08:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SJQ7DwcA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025072715275371f4c88a44441f7eaa-bxrqxb@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025072715275371f4c88a44441f7eaa
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Jul 2025 17:27:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ei9QfE4txithV0tUv9hAW1ozk8oWtwuD59SS4aYhH6Q=;
 b=SJQ7DwcAEWN37ZurLsx/q0XFodaKStHbYA+gchnBVXLslAyFm4fRhU1LddZD0hTvOP/VlZ
 zWGhOdXZGY+8iJ2Hb25YQv0EXO/8kD/LLO9nVifaLqIGp0VKBFQxjpQ/iBN/edWBvBNdMNDK
 2tpUQTFDyn/ndlKkNX0xILgP1NKOYTVjprR5zXMFsROfyu0vrKRtYvAU8AiWKRYF+v4BmRGo
 PGyBtpkfe1Jga54OeQ7Zgbm/cnzYrnSbFNj5uzvU9NXMzu/UHmCT5fDQu9gNSFB3T535gKiJ
 iYRT1eClE02DQJCav9TWf1TEUHhTasoRQ3YYjuij+B6G48ugnsPwRWmQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/6] gnutls: patch read buffer overrun in the "pre_shared_key" extension
Date: Sun, 27 Jul 2025 17:26:54 +0200
Message-Id: <20250727152658.3852964-2-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220948

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].
The ME contains referece to undiscoled issue, so any security relevant
patch should be picked.

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...fer-overrun-in-the-pre_shared_key-ex.patch |  34 ++++++++++++++++++
 .../5477db1bb507a35e8833c758ce344f4b5b246d8e  | Bin 0 -> 111 bytes
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   5 ++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e

diff --git a/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch b/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
new file mode 100644
index 0000000000..e3dc286328
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
@@ -0,0 +1,34 @@
+From 208c6478d5c20b9d8a9f0a293e3808aa16ee091f Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:31:55 +0900
+Subject: [PATCH] psk: fix read buffer overrun in the "pre_shared_key"
+ extension
+
+While processing the "pre_shared_key" extension in TLS 1.3, if there
+are certain malformed data in the extension headers, then the code may
+read uninitialized memory (2 bytes) beyond the received TLS extension
+buffer. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42513990
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/208c6478d5c20b9d8a9f0a293e3808aa16ee091f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/ext/pre_shared_key.c                          |   2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ext/pre_shared_key.c b/lib/ext/pre_shared_key.c
+index 51c4891d5..2cb83e670 100644
+--- a/lib/ext/pre_shared_key.c
++++ b/lib/ext/pre_shared_key.c
+@@ -1170,6 +1170,8 @@ static int _gnutls_psk_recv_params(gnutls_session_t session,
+ 
+ 	if (session->security_parameters.entity == GNUTLS_CLIENT) {
+ 		if (session->internals.hsk_flags & HSK_PSK_KE_MODES_SENT) {
++			DECR_LEN(len, 2);
++
+ 			uint16_t selected_identity = _gnutls_read_uint16(data);
+ 
+ 			for (i = 0; i < sizeof(session->key.binders) /
diff --git a/meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e b/meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e
new file mode 100644
index 0000000000000000000000000000000000000000..009d44c394fd08c5400fb63f837e468f1738522d
GIT binary patch
literal 111
zcmWe*R$$0tVqi#PW>$cL{|f(MOa+Di2(|!16v7f_VPMc>&}Lv_W>HXJK$nH+{f{t!
IL6d<203r_)`v3p{

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 367872d47e..973f81719a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2024-12243.patch \
            file://CVE-2025-32989.patch \
            file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
+           file://0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch \
+           file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
@@ -66,8 +68,9 @@ do_configure:prepend() {
 	done
 
     # binary files cannot be delivered as diff
-    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
     cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    cp ${WORKDIR}/5477db1bb507a35e8833c758ce344f4b5b246d8e ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
 }
 
 do_compile_ptest() {

