Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E83C531D2
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5468.1784741049954866984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bUPjPaJl;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495590dde14so38695105e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741048; x=1785345848; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqy5oXj0/qKDqh8r/KhL33pNnTyv4YSibRwVAx/19QU=;
        b=bUPjPaJl3KwXXWDalfop9ndiEv8C9dTke4WFhk6qysynCbvh6yiGohaPXxhPBqUrHz
         cdy87kdwj3aVZY7yzbHUw6Fn3jsBuoS2TjPO1P5lhTmQ52EOW5SqWA9y97YLrhw0paKe
         ystib9PMQsQUMsymEnlN3KEAdJRuC2Vzrm1P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741048; x=1785345848;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqy5oXj0/qKDqh8r/KhL33pNnTyv4YSibRwVAx/19QU=;
        b=fZCA4YDBNKfosZ4dfdFp5jwvYMpTWC6baruGrWGEaxI4u0jHG5dovHOQ8xe60T6qK7
         FEkSiQ2O20i40CtGEmOJZHYVeQL4RpuLm2kUv9KcLTNATx7BU3Q2H6BLj/eQ/Pa7SCrA
         a+rjcnUeUcGRXvPSIiNJ4oy5Ba4YSDtAUPEYF+g8ncmmQoKbSJHcYbN/auH01mVjXy+A
         GittT2ruXlPwEAR5KF6Aq/CUvbE0uPpe9rMLEQitEw+TPEQDhh1f6sieJSl99fVeCoo/
         epPJzH5fMflv+U54lGVyj3whm3q8U6ftBSnejG9UDoV5JCfmandKON+kImNbGvFJrxIX
         NCpQ==
X-Gm-Message-State: AOJu0YysG0FDIWlVkYYvY9sN91kh2e5Up3JfCNMIrOkd0MtDgJ0631nz
	Njet50VdfV5/7OWbrWyFXlz70xdoTnNrhwu0Uq4fGVbmY9IPPeEERzVUeK+bhwqWWOk4A1W9mFM
	Rjn4DAEI=
X-Gm-Gg: AR+sD114GdU8MJMnlpug7Ov7m12PZ75eKeoSH77Tp7lP7L4VVHs78ENRSFNqCZ/JOoe
	s9U4IS2kf8WvLHGzkLFDXwGmQNVaDTDaJyByJHkbfcw/P8fGLoCbEUb0ihU9wPi7loAtflSVRmh
	diSPjFKAnyWI18HpDKre9wxE9iqwKNkPqyRWissExjIXMZQEC4vrbIXlF+mK5GquRoofg+NquSF
	tWjbeUkjtFImSayTqd7gxGhV7UDU+7tynD6PHDbKHQF5HnLmi79SHtkRSrZSxdgUJl0N8qqb7TF
	kfP9NkqBtb7Ag+fb8RC487BIOK3ZGIjEDFXwfemq32S3iUcodVM9B9hbLkgVctoVWdBASmkKcKV
	R8u5cEGhJS3jDK84HIHY2LNi/d4OWMuzuskC06+QtGj+a5V3wC2QjJ7KylRynCG44Ur+jnBAwV4
	sPon5cgKVwEAj47G12o5VAW3XtBwj8nL8WkgTd3s7il3MoXGisHLmwaJcsaOIlVqt0v294CPYE/
	kaSwQ9Rm+BLgZs9KAM5J+yEMsxI3mLZYw==
X-Received: by 2002:a05:600c:4e8d:b0:495:54e9:c080 with SMTP id 5b1f17b1804b1-49554e9c2bbmr86835825e9.31.1784741048005;
        Wed, 22 Jul 2026 10:24:08 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/27] libssh2: Fix CVE-2025-15661
Date: Wed, 22 Jul 2026 19:23:31 +0200
Message-ID: <525ecf7f753566bcf8f9918ca7dd56b1fc946b0a.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241728

From: David Nyström <david.nystrom@est.tech>

Fix CVE-2025-15661[1] similiar to debian[2], two first commits identical,
third commit fixes a return code regression introduced by CVE fix commit.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-15661
[2] https://sources.debian.org/patches/libssh2/1.11.1-4/

Signed-off-by: David Nyström <david.nystrom@est.tech>
[YC: fixed stray whitespaces at EOL]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2025-15661-1.patch    |  45 ++++++
 .../libssh2/libssh2/CVE-2025-15661-2.patch    | 131 ++++++++++++++++++
 .../libssh2/libssh2/CVE-2025-15661-3.patch    |  57 ++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   3 +
 4 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
new file mode 100644
index 00000000000..93a9e6eb596
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
@@ -0,0 +1,45 @@
+From 95028b06d1875e07c99918145234a473e5e8521f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
+Date: Thu, 9 Jul 2026 12:36:24 +0000
+Subject: [PATCH 1/3] sftp: add LIBSSH2_UNCONST() macro needed by
+ CVE-2025-15661 fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Needed by the fix for CVE-2025-15661.
+
+Extracted from upstream commit 606c102e52f8447de2b745dd6c5ddf418defc519
+(build: enable -Wcast-qual, fix fallouts) by Viktor Szakats.
+Only the LIBSSH2_UNCONST() macro definition in libssh2_priv.h is
+included; the remainder of that commit is not applicable to this
+stable branch.
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/606c102e52f8447de2b745dd6c5ddf418defc519]
+Signed-off-by: David Nyström <david.nystrom@est.tech>
+---
+ src/libssh2_priv.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
+index 9b8866dc..bb1f8ad3 100644
+--- a/src/libssh2_priv.h
++++ b/src/libssh2_priv.h
+@@ -117,6 +117,14 @@
+ #define UINT32_MAX 0xffffffffU
+ #endif
+ 
++#ifdef _WIN64
++#define LIBSSH2_UNCONST(p)  ((void *)(libssh2_uint64_t)(const void *)(p))
++#elif defined(_MSC_VER)
++#define LIBSSH2_UNCONST(p)  ((void *)(unsigned int)(const void *)(p))
++#else
++#define LIBSSH2_UNCONST(p)  ((void *)(uintptr_t)(const void *)(p))
++#endif
++
+ #if (defined(__GNUC__) || defined(__clang__)) && \
+     defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 199901L) && \
+     !defined(LIBSSH2_NO_FMT_CHECKS)
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
new file mode 100644
index 00000000000..40096d3318d
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
@@ -0,0 +1,131 @@
+From 72e8f8dd812503e07fecd775e7f88183e005d9ae Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 10 Oct 2025 08:26:20 -0700
+Subject: [PATCH 2/3] Update sftp_symlink to avoid out of bounds read on
+ malformed packet #1705 (#1717)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use buffer struct to guard against out of bounds reads and invalid packets.
+
+Discovery Credit:
+Joshua Rogers
+
+CVE: CVE-2025-15661
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/2dae3024897e1898d389835151f4e9606227721d]
+Signed-off-by: David Nyström <david.nystrom@est.tech>
+---
+ src/sftp.c | 66 ++++++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 47 insertions(+), 19 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 6ede3111..43b6ff90 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -3795,15 +3795,19 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+ {
+     LIBSSH2_CHANNEL *channel = sftp->channel;
+     LIBSSH2_SESSION *session = channel->session;
+-    size_t data_len = 0, link_len;
++    size_t data_len = 0, lk_len;
+     /* 13 = packet_len(4) + packet_type(1) + request_id(4) + path_len(4) */
+     ssize_t packet_len =
+         path_len + 13 +
+         ((link_type == LIBSSH2_SFTP_SYMLINK) ? (4 + target_len) : 0);
+     unsigned char *s, *data = NULL;
++    struct string_buf buf;
+     static const unsigned char link_responses[2] =
+         { SSH_FXP_NAME, SSH_FXP_STATUS };
+     int retcode;
++    unsigned char packet_type;
++    uint32_t tmp_u32;
++    unsigned char *lk_target;
+ 
+     if(sftp->symlink_state == libssh2_NB_state_idle) {
+         sftp->last_errno = LIBSSH2_FX_OK;
+@@ -3891,8 +3895,25 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+ 
+     sftp->symlink_state = libssh2_NB_state_idle;
+ 
+-    if(data[0] == SSH_FXP_STATUS) {
+-        retcode = _libssh2_ntohu32(data + 5);
++    buf.data = (unsigned char *)LIBSSH2_UNCONST(data);
++    buf.dataptr = buf.data;
++    buf.len = data_len;
++
++    if(_libssh2_get_byte(&buf, &packet_type)) {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (type)");
++    }
++
++    if(packet_type == SSH_FXP_STATUS) {
++        if(_libssh2_get_u32(&buf, &tmp_u32)) {
++            LIBSSH2_FREE(session, data);
++            return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                                  "SFTP Protocol Error (code)");
++        }
++
++        retcode = (int)tmp_u32;
++
+         LIBSSH2_FREE(session, data);
+         if(retcode == LIBSSH2_FX_OK)
+             return LIBSSH2_ERROR_NONE;
+@@ -3903,30 +3924,37 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+         }
+     }
+ 
+-    if(_libssh2_ntohu32(data + 5) < 1) {
++    /* advance past id */
++    if(_libssh2_get_u32(&buf, &tmp_u32)) {
+         LIBSSH2_FREE(session, data);
+         return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "Invalid READLINK/REALPATH response, "
+-                              "no name entries");
++                              "SFTP Protocol Error (id)");
+     }
+ 
+-    if(data_len < 13) {
+-        if(data_len > 0) {
+-            LIBSSH2_FREE(session, data);
+-        }
++    /* look for at least one link */
++    if(_libssh2_get_u32(&buf, &tmp_u32) || tmp_u32 < 1) {
++        LIBSSH2_FREE(session, data);
+         return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "SFTP stat packet too short");
++                                     "Invalid READLINK/REALPATH response, "
++                                     "no name entries");
+     }
+ 
+-    /* this reads a u32 and stores it into a signed 32bit value */
+-    link_len = _libssh2_ntohu32(data + 9);
+-    if(link_len < target_len) {
+-        memcpy(target, data + 13, link_len);
+-        target[link_len] = 0;
+-        retcode = (int)link_len;
++    if(_libssh2_get_string(&buf, &lk_target, &lk_len) == LIBSSH2_ERROR_NONE) {
++        if(lk_len < target_len) {
++            memcpy(target, lk_target, lk_len);
++            target[lk_len] = '\0';
++            retcode = (int)lk_len;
++        }
++        else {
++            retcode = LIBSSH2_ERROR_BUFFER_TOO_SMALL;
++        }
+     }
+-    else
+-        retcode = LIBSSH2_ERROR_BUFFER_TOO_SMALL;
++    else {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (filename)");
++    }
++
+     LIBSSH2_FREE(session, data);
+ 
+     return retcode;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch
new file mode 100644
index 00000000000..f34a8778080
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch
@@ -0,0 +1,57 @@
+From 09a4a795b051c8c39957a85b36abba5d8dbd7230 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 20 Oct 2025 14:04:52 -0700
+Subject: [PATCH 3/3] Fix sftp_symlink when getting SSH_FXP_STATUS response
+ (#1731)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Move advancing past packet ID before reading the FXP_STATUS response.
+
+Note:
+Fixes return code regression introduced by:
+"Update sftp_symlink to avoid out of bounds read on malformed packet #1705 (#1717)"
+
+CVE: CVE-2025-15661
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/4ed26f5740bdd409269ed9fb48a28bf8f565b681]
+Signed-off-by: David Nyström <david.nystrom@est.tech>
+---
+ src/sftp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 43b6ff90..0a6d15de 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -3905,6 +3905,13 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+                               "SFTP Protocol Error (type)");
+     }
+ 
++    /* advance past id */
++    if(_libssh2_get_u32(&buf, &tmp_u32)) {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (id)");
++    }
++
+     if(packet_type == SSH_FXP_STATUS) {
+         if(_libssh2_get_u32(&buf, &tmp_u32)) {
+             LIBSSH2_FREE(session, data);
+@@ -3924,13 +3931,6 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const char *path,
+         }
+     }
+ 
+-    /* advance past id */
+-    if(_libssh2_get_u32(&buf, &tmp_u32)) {
+-        LIBSSH2_FREE(session, data);
+-        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "SFTP Protocol Error (id)");
+-    }
+-
+     /* look for at least one link */
+     if(_libssh2_get_u32(&buf, &tmp_u32) || tmp_u32 < 1) {
+         LIBSSH2_FREE(session, data);
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 2407ed34d94..32e1ad6c16c 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,9 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+           file://CVE-2025-15661-1.patch \
+           file://CVE-2025-15661-2.patch \
+           file://CVE-2025-15661-3.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

