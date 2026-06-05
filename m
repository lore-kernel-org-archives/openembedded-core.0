Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF901CD8C89
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6125.1780698856666820676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TkoDaKu7;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso23651855e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698855; x=1781303655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdVOObmFUlPt/MEVUe4jd2fc/5b72zzOjbc7XnhuZH0=;
        b=TkoDaKu7GDGYRNgMwNvA1f4xp35FjpHbcs1zBpk3l/WTyD7tDpR0onYYs1HeCaaQVv
         K+sAjeeJvViEJWF86983IrvK5eqEtGI1xL6xFDX8XF788DFY5y/FYTVBD2dM96U54UfU
         usE4UqXfDIock+eqCilpnjTAOPhBPr3KPUMbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698855; x=1781303655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdVOObmFUlPt/MEVUe4jd2fc/5b72zzOjbc7XnhuZH0=;
        b=T1XkTdtG4v6XSomEjlKGXU4TD7xdd+Kors3WLE86RuCeRnuMoOgiRiDyCQCTttNOGv
         Z6FTPrXTTXTkIPs72LSxLOgs/7QwBlqOtH/Z6LP9xufvr04ZUfPoRWO9fWT6ArUQ7QEB
         1CWtt2SlCbbGfmCC+wmzEDS5SF613YsXxTKm0b246Ss/Hu4LaGnVWXWIAL2X/XO3Esis
         caLjN05Qgz8U+GP5hEhmOpB4+YpmHagD28a0Wz+XJje1zrOvWXBjLqqEB758sk/zU9J6
         qJf5gEeoIlsGmW9gI4vpXJdsMuwgShnIQQiOBzBX0VlKV1TSkvji9INaI1yU5jsn8xuL
         lFuA==
X-Gm-Message-State: AOJu0YwrOdGWSS9xqYedwJxnd0LmLGnd6gicTD13RD4v6UJoiVJcJ7pc
	iBa6471E2XlV5DQ1N/6v20IQENyqBww2Kc3veJWHUDRqMKhIk6pN4hUAf1GphHHry6p98PDt/9t
	H8VbM
X-Gm-Gg: Acq92OGvyE/Lo/0aDTjAmQcOlTCrXmsYvlZ9L4ASNOAnN8Akszh9hqQ+FP9PuLMe8QF
	OXDJneYMtLloBwjia8F7ZI+oLyOwcURNyJv80PmoxR4Kn9a+TalVgu9z+/+RiKM8DBnX2CIICsY
	5bCeneUr8mz7FFpXK3ZeU+ugB4E/lYTWp5EHMHBiENiER/uZuGf2sjXCTjDSmhYAhh1BmNcDOV+
	KJXE2Xdf36tGvfuTr2JxrSKEMY2tpH3+Msq/7KJxpkDNBZNi8CFzBmGwhXKPg+Wb+Ox9fzplsUP
	+qLZd6W/04ssvUq8DvvWPB9IaMQr3i87tsqNGc1LF2kJ1Ym8ruqi0p73BQ0lUiLPeuYl8MkFeIy
	+alVv2eRRODy9LkEZMZ+szYyM6IzjU4Db+Ym0R1LCeAe8I9znPqBInYDUDts1xGvXryIvjDiWxY
	hwWgDq3BzrFukp4TbAKxygcPNWQRDngAhAvSaaQj2KrFG4AAyVh8qkpY2QUmWaTvdv/83xV3ury
	wzrdxpA61LroXnw6PsqX/jcZzJihmrp136UAZo=
X-Received: by 2002:a05:600c:4857:b0:490:55d9:149a with SMTP id 5b1f17b1804b1-490c2d235c8mr50427385e9.18.1780698855071;
        Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/25] libssh2: fix for CVE-2026-7598
Date: Sat,  6 Jun 2026 00:33:48 +0200
Message-ID: <84d6cca01c9d36ec112e5eb4104437f63ad2aee5.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238190

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-7598
[3] https://security-tracker.debian.org/tracker/CVE-2026-7598

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-7598.patch       | 60 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
new file mode 100644
index 00000000000..6b89cb71bad
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
@@ -0,0 +1,60 @@
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
+
+CVE: CVE-2026-7598
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/userauth.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/userauth.c b/src/userauth.c
+index 0040c3f..588b83f 100644
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
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 49da9698a32..2284d054b10 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
+           file://CVE-2026-7598.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

