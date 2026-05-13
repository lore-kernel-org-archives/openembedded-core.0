Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B936CCD4F35
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 11:10:00 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4971.1778670597656564620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 04:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KmaxKB8y;
 spf=pass (domain: mvista.com, ip: 74.125.82.52, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-133466cf955so666702c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778670597; x=1779275397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEprWPOxJIR9sABZHCS8P10QTCklYbbIZ00n59bvcJI=;
        b=KmaxKB8ySCkepkDNgj64IqR3YGgw/LJrsZ4tRtW5+YFV+VQjBujXtgffRTiR2r5gmA
         dMxvzu5sg6vOHgXy8FGvXzWbxsztKXVPXqI5DvxXEhYbpgOVeGz2xLww6rkCbpz1Ph96
         bclv0FIWezpoh3EJuqtuwMp5d+LRKHdWajdJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670597; x=1779275397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEprWPOxJIR9sABZHCS8P10QTCklYbbIZ00n59bvcJI=;
        b=HKZ0FRNGQ84E5BRlblT+V87lX4swCYYKL2OMXS3jD3CsmmcWgr0J/++TfrR/eKP/64
         ZuAdBA9RK7VUEku2TELIz0Uv5qT23x7IW45ynH0tLClJ8pTbjvaVOFDRYpWlJnMHELm5
         m2DisDbsOLBW5zioQAT2FG+LbOEhhr8lIFU00xjXEbSPSmlWZ3+t+XCzHdpNXbahxbjH
         T7961qN+f/6TWQ2s/Bp2Hj1+0hMXQcQMXLu71LnO2e0Ne1ziXc/b3T3gPczkFIkTYz/t
         Uj3lrxiJZRCH9LBGuNonFnC7eZWWlPVpkk6mxZjVeyAD1usDyOMs6yxw1wLxxwzQScJh
         LOKg==
X-Gm-Message-State: AOJu0YyTjmH36/veyGZaaBtZqY3fLiSgL+k/Tv4sxtXKtLrn8csL2JjW
	sffFoxH5rjsOJUcN9zO4YeLvRMsBQYVNF4LIYIBFcpB5x1AdvAcBA/WYzpk9hnodimzDp5zUeOE
	L3Ng8UHc=
X-Gm-Gg: Acq92OGBYexYEUaf2QdiXhQZqjix3Rjkw/yXXY63LmgV5dyII+J017A9TSjt7p1n49q
	+poX/VTIuXUwvTUVdFzOF2umwWIHgnel5NPn0VDPIVq4V+CEtzzaUjpClZ3fu3mK9/zGdAZIr36
	ovxs7LFgm5zNDYzSb0ilIlO0yJcuUc3hheTOA0kzre3Mpe+sD+bokHuWAzhiE79unyaTdYKmK9u
	EDqFyJyGOrDtR/hEpOys+GzHb3u5btCrLGTxSiByTk+rZ9BHNSTPSVF1yYFwPJWvCsyalFvoGiw
	kyREEtDj5hIwqHpaw6UcVr5yuQon3yuhJ9GHYYy8TS5dH/Vt2TlG7k4mqXyI77q0IS49relZfY9
	awbhtrsCwixcpoxiVgcq0bwF6fcnrcnMksJGTKj5zGUpGVjrHy6XpUpVHkTHzeE6MdO7fjveDKt
	yWBXppVS8cEIeeZXa5JB8gzCOBWmhIXYbc/uaQ
X-Received: by 2002:a05:7022:1b08:b0:130:6c8f:5a87 with SMTP id a92af1059eb24-1342ef445admr1676115c88.13.1778670596759;
        Wed, 13 May 2026 04:09:56 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ffb9sm30910332c88.2.2026.05.13.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:09:56 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libssh2: fix for CVE-2026-7598
Date: Wed, 13 May 2026 16:39:47 +0530
Message-ID: <20260513110948.195740-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 11:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236962

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-7598
[3] https://security-tracker.debian.org/tracker/CVE-2026-7598

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh2/libssh2/CVE-2026-7598.patch       | 60 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
new file mode 100644
index 0000000000..6b89cb71ba
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
index 49da9698a3..2284d054b1 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
+           file://CVE-2026-7598.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.50.1


