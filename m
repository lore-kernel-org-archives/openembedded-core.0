Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65494CD5BAB
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7282.1779265268820972790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tL+Cdl4y;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-459bf19e87bso2695390f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265267; x=1779870067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5GDhobT8B/EDc4mPlLe1IN5iyLyz/EuGPsSCPb8xFA=;
        b=tL+Cdl4yEln3EyyRdEufuWdIZK0B8OPBO1ZabXv2lsiZylOvWj+/RBycxrMD98GUAH
         Rk+Tbf6i2JYrKx4+leB3kR3fDO2XbIHKRYFJTOoZpvheUBRY/3mbuXurtGZ5mQM/RTev
         Qzy3QNZH5B+m3//3DjRvwBh5jYz1LJEdlRrOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265267; x=1779870067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W5GDhobT8B/EDc4mPlLe1IN5iyLyz/EuGPsSCPb8xFA=;
        b=o5mKziu+jGRXlsUd3atrQGCAQwYqQB8N5pqWsD6kVWilK4wJ6M2hPikNF4d6IUYpn8
         17Na/kV/9OyLYkwcHz7q57r/9eC/R2R2TCCIRNJ+NfDj4CQP9anzO6VpsWmeeniXn+De
         k2QIEdbRyRk4ZR5tYcwL0o7aWqAIZ/C3A3szIfGqXPxNNvXjFpNo5xtXhB/R4CRxqE/6
         krb1LubN5B1Sfi8UPg/mabTiIMf2qb6hmN3zi89vKC/R36ls9CsrA6RDIqdGy4uuOBoK
         9vd7gI6fzOnzsLitdu59hnF93K6hkKNEKLSnbsvwkdy4vDGMMiURPhqiHN2yFflFoXjD
         Rnyw==
X-Gm-Message-State: AOJu0YycMF4hmAG0Jt8WyzbIX8NEMWUhQZT+PXyS72PtZm1/a+UON1o4
	9zf7uPhQD0dPEeY0hQxklzp3L06vvFqEqh2VGL+mOuEdXPDPqqpd+Dk5QvRQuvpxM/eo57IBfQG
	letVy
X-Gm-Gg: Acq92OH8iiFhAVm6nPfP9M/TnGRJJKOllhNupv8oq5Pv1WlfBFJnqOknhqRYEoJ7W0/
	2onMdQBSDCyM12sj0H4knhYHCqcHQ2Y2rXTWIB7MBlPx+iwT7GdGTTGWTvyywyZvO6uaL5/7/8u
	q1uEjChWlRE9745kkU/KtvXVnf0hkcGYR7aqBd3ZrV53mkWaQA9RzQ5IBPJepftFCrcD+LO/DSP
	FQibqzGiYRqeLp1wc+mcsxAslQgn8fahkfoqOEVo7UHbBOjAPKOeeBHeHHwHLSPD58VZ3X/DZLO
	wbkc6lea1XKqfumntMCJIeDcsFR8AcqOr+aHnCN0DxCNZpGNWrH0rl944O1QTX1CswMZMZwajVl
	juVzzs1EKBMwg+/AIzQi6Rn1KVHvOvtydDy0AS2chxbzb8buyDvGglCY4u8AGY+J4V3p0o+5zhx
	ILEPlJCHNdYYAZFPEBfPwjJugGiydhlHcl66n7ZXN7ak5b8BXkHkBwz+ju76KxsvJ8W5ieYeRPe
	5YHC/+QRDDQnuxRx/BP8dxDWRR1
X-Received: by 2002:a05:6000:1086:b0:45e:653a:40df with SMTP id ffacd0b85a97d-45e653a413bmr24940741f8f.41.1779265266895;
        Wed, 20 May 2026 01:21:06 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 13/28] libssh2: patch CVE-2026-7598
Date: Wed, 20 May 2026 10:20:14 +0200
Message-ID: <e7cdce79872caac90b07d7dfc3c329f403229b91.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237412

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in both NVD and Debian report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bc37ca4fd0ad000a85ba738e55c48bff0efaf9f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-7598.patch       | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
new file mode 100644
index 00000000000..314e6af3709
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
@@ -0,0 +1,56 @@
+From 256d04b60d80bf1190e96b0ad1e91b2174d744b1 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 13 Apr 2026 11:18:25 -0700
+Subject: [PATCH] userauth.c: username_len bounds checking (#1858)
+
+Return errors when username_len will exceed bounds, fix existing bounds
+check.
+
+Credit:
+[dapickle](https://github.com/dapickle)
+
+CVE: CVE-2026-7598
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/userauth.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/userauth.c b/src/userauth.c
+index f8e02651..43d9ab9b 100644
+--- a/src/userauth.c
++++ b/src/userauth.c
+@@ -80,6 +80,12 @@ static char *userauth_list(LIBSSH2_SESSION *session, const char *username,
+         memset(&session->userauth_list_packet_requirev_state, 0,
+                sizeof(session->userauth_list_packet_requirev_state));
+ 
++        if(username_len > UINT32_MAX - 27) {
++            _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                           "username_len out of bounds");
++            return NULL;
++        }
++
+         session->userauth_list_data_len = username_len + 27;
+ 
+         s = session->userauth_list_data =
+@@ -307,6 +313,11 @@ userauth_password(LIBSSH2_SESSION *session,
+          * 40 = packet_type(1) + username_len(4) + service_len(4) +
+          * service(14)"ssh-connection" + method_len(4) + method(8)"password" +
+          * chgpwdbool(1) + password_len(4) */
++        if(username_len > UINT32_MAX - 40) {
++            return _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                                  "username_len out of bounds");
++        }
++
+         session->userauth_pswd_data_len = username_len + 40;
+ 
+         session->userauth_pswd_data0 =
+@@ -447,7 +458,7 @@ password_response:
+                         }
+ 
+                         /* basic data_len + newpw_len(4) */
+-                        if(username_len + password_len + 44 <= UINT_MAX) {
++                        if(username_len <= UINT32_MAX - password_len - 44) {
+                             session->userauth_pswd_data_len =
+                                 username_len + password_len + 44;
+                             s = session->userauth_pswd_data =
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 0d1237852f5..e825c8c5bb8 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
+           file://CVE-2026-7598.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

