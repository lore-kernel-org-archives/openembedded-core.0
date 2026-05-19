Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B56CD5BB6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.957.1779233435371872621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QmUFAwK6;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso34241925e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233433; x=1779838233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5GDhobT8B/EDc4mPlLe1IN5iyLyz/EuGPsSCPb8xFA=;
        b=QmUFAwK6CI1E7lQOhKrwqfv/G4zsqT6TMlYSZBiBZrl0DaBRPMJVNvZqxLtC42G75N
         Rc6eclFtiS5lr/gYRK0R+nR24OTlv2w4Iq4yuNx7Azg2+byu+no9N6AkraqFNEWVHI6c
         VMViPjbKin8xOtFZqj/d5zum909ZYP0jXun9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233433; x=1779838233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W5GDhobT8B/EDc4mPlLe1IN5iyLyz/EuGPsSCPb8xFA=;
        b=NK5SPpHCX4vONGjrtHfj/+McHWTVFhIeHQh3exWoS4h6tv+7UvlZeMm+8n3Dcf2mSL
         qPWOHT5r9jK1PYhhrEeKasUPl2x527GDIRlzJs60V8wNA/ERxPBKV4LjMYWICl+Ec/1f
         EeRxwkcbE6HN8MuE/Xbo0nEEhu7UNQhQBnantvRhJa920CQL88k3vikysPuIvKqUQJuK
         VokD90CTGuVz4uwI9KzlvHxt/I+Yu+hpgwvWTZW/i5QRiX3FCd61+HRkOxFnXo90EsXG
         NLmG3KE+uPVzI56wODDkANPa1930XIRdtk3iirlYpMZOq6ov/E0X/vVwyF8hMPVv2IDF
         jxDw==
X-Gm-Message-State: AOJu0Yyzv0eZTVjPbGkB99FZ7V99mPJ+HDlkNOHFySuEQgOaWAgv7WEm
	6obJe5ddCl+tX/HHbgGt9sd6+wqVNLsdVEqudKUjHRYVaZZJSeuZsfoWoaMb7B5DILw+RdH4ECq
	t7YGr
X-Gm-Gg: Acq92OFsJS828M76ks7qmPMaxUk/x+owGqYWJAJotv/XNYCK2sVhfHKBXPKeLgn86Id
	Vd6x0w/KVpYaOQH1MyJUBvWBevphGFiKPqAfa83OCQEqff2x8zKkS+4JVLk+pKYnSpLhlzXCvI2
	wJjXZBzdWAQK5GeyIcq8Z6219mnMukvoSHYjIeE1fy7XHPcKMZRlGyI5BsdxCvsVlELIBn4u1mb
	JSweOgCdCJIC0n0icX010fO5vHZ79mPymLJbSLLxfODE05vkKIPt5wSOAKLT5P52OkmzMjILU3I
	MFiwpLEQz26R/Tt3TblaMs0Fz3GeFzUTSjcMgVmKKCg8B+76MJOWXPO3q6C1SNoaHphIF9Jcw1W
	avUZlfCuu8r8e6D8HWWYNtDxbWqIIAMmmfyXOz9+B5raZraQHm0vT21GwR6pY3U0MSA8qp59NyB
	cTis68iCF5imn2Y1IVtPOgiYhQE76+Oy/0zH7cj8L65TRVpGHEaVg//kes0w7h1ML6TutwUcjgr
	LULjQj861RMIERZrC3o252zHZw=
X-Received: by 2002:a05:600c:4f8a:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48fe62f8c6bmr334048575e9.24.1779233433589;
        Tue, 19 May 2026 16:30:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/28] libssh2: patch CVE-2026-7598
Date: Wed, 20 May 2026 01:29:50 +0200
Message-ID: <c54344d410d327001f7ae9cfd6817205994c1b59.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237360

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

