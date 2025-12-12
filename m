Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8D6D59D67
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:36:56 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15430.1765553809307084189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Yg27E4ty;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso734201a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765553808; x=1766158608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNNg1TifsI5+LcgOq1NXZzFuT4vZnEm9B2V2JrR9lxA=;
        b=Yg27E4ty7Yr73r3jmXQCOaSz3oc5Q+UfvRkBrgNfqt3JWPy0mKs39ul6gdwnneiXZn
         8b6xXLAPf9/PLkeUrQSp2FlRDzXzV1MFEX98+aCR2hqaY9Pdf7RdZg7KIxbZ3k98k4wn
         pevYqkFeAZBL36jmXRqZHs3/eyDYSD2VmMQHLgR11wge13QSVJN4HLkgy7io5ipSQzgC
         Re0hDQW+q6FFZnizI78M6dFrSgVgwviTkT3NR2tv//vb9moH+Q13aowe4Cm634dzzQb2
         sG7o8bAllosTkxBfm6d/PhI74vunO1Bft0gf+ZoZgjj/erRU37NvGo5PsLuwOVkra3O7
         PWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553808; x=1766158608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kNNg1TifsI5+LcgOq1NXZzFuT4vZnEm9B2V2JrR9lxA=;
        b=b6ZoQfU8JlLr/8UPuApD2ofFn2a/z5//9XRbXJKP8hRVfqvapoqNAsZXriCam9NBSM
         W4yZOiHfuKt/ehJMMeT1ylctoGowhXEZR5xtGfAbfD6h79MxAWcV8uZ6drVVtQG8dx8u
         dmi4wN64BIQLnAVHofVh9dPxN/MK1qbwszIyd2DYCrgNBc9F8b0p17yfmFxdXeqvnzSb
         2rzXDuU/FBrqiby8sMwJroQRN0XFpGaLYvAbwGXzqp2Y4PmadSCSyRv1IY3BTYwOniaI
         imPBnCiNfAEgv33sAIpxGdG3UleTgfcg1ycilmwwGydEvlbOvTwN+KNVgnG4nF56b5bE
         kYSg==
X-Gm-Message-State: AOJu0Yyn7i2EkFUUat8LsPKNUJCH8Xh2LKJ2r0yAZe0n76iSL74+YV0Q
	av0VDARhF8gh//rvYLpyOaczLmHSAYUJwJ0TZ/IXxyOLYc3kZVK7XPAmXB9d8jUq0kZg1q3+1hz
	quTXe
X-Gm-Gg: AY/fxX4lcdOFF+Spd5zkEF2AEpGVa5SM4pCiX5O9Mkx2LoJeXJ8lti4zGZhwPZp8z5G
	egvgXC66upqTyDWb0a/4+dG/hYKKqA2Ho5FSx3049n/3mSwbMOuerhAEFYQG/iG6RJPNsNsBrog
	aTxfitYddIn21PnB85jf22/4pJMafuPDW7A9wJjFg5XLfX1zNPKvLkai5TKLS3rvTQl/Oiv7B63
	ChF8drJGphKpsBbK43HfAMPXRKHKYV0lSZKuZowH7NpEwryPF45ptM8c1kugu/HqTPTG9IFrvOy
	WgL3bwq9/vnwJrIpCHMmbDxnCHlwjLqp2CfEqPaKtRPYRa7RFxEqaqj7SQGITbRqpk5TLse0kGm
	3HhJytFSUWF042gaKKgezZHpLpuJxRgFbfhttvV68b1/RdwKgbQ+Su8HiH2QvoT2b4ePiNvgaGi
	h5nwvJy7C491zD
X-Google-Smtp-Source: AGHT+IG7L7K4ZPYLMec2Mc4eVm5bj7f64XR6TS6wD7erW0FintXaceclQNSMUFWr8951PPCRHxYjBw==
X-Received: by 2002:a17:90b:2e4b:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-34abe937547mr1958375a91.8.1765553808412;
        Fri, 12 Dec 2025 07:36:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2948d1sm2297797a91.9.2025.12.12.07.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:36:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter] libssh2: fix regression in KEX method validation (GH-1553)
Date: Fri, 12 Dec 2025 07:36:43 -0800
Message-ID: <ae4b5fe1f13edfb026c02693e453402caf137b4e.1765553691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553691.git.steve@sakoman.com>
References: <cover.1765553691.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227598

From: Vijay Anusuri <vanusuri@mvista.com>

Resolves: https://github.com/libssh2/libssh2/issues/1553

Regression caused by
https://github.com/libssh2/libssh2/commit/00e2a07e824db8798d94809156e9fb4e70a42f89

Backport fix
https://github.com/libssh2/libssh2/commit/4beed7245889ba149cc372f845d5969ce5103a5d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a7e83123e985c1c27036503203fa7d839964271)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rror-if-user-KEX-methods-are-invalid.patch | 73 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch

diff --git a/meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch b/meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch
new file mode 100644
index 0000000000..9e7bb9a905
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch
@@ -0,0 +1,73 @@
+From 4beed7245889ba149cc372f845d5969ce5103a5d Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 28 Feb 2025 09:32:30 -0800
+Subject: [PATCH] Return error if user KEX methods are invalid #1553 (#1554)
+
+Notes:
+Fixes #1553. Restores error case if user passes in invalid KEX method value to libssh2_session_method_pref.
+
+Credit:
+Amy Lin
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/4beed7245889ba149cc372f845d5969ce5103a5d]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/kex.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index ebee54f987..bafda0e611 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -4196,23 +4196,11 @@ libssh2_session_method_pref(LIBSSH2_SESSION * session, int method_type,
+     char *tmpprefs = NULL;
+     size_t prefs_len = strlen(prefs);
+     const LIBSSH2_COMMON_METHOD **mlist;
+-    const char *kex_extensions = "ext-info-c,kex-strict-c-v00@openssh.com,";
+-    size_t kex_extensions_len = strlen(kex_extensions);
+ 
+     switch(method_type) {
+     case LIBSSH2_METHOD_KEX:
+         prefvar = &session->kex_prefs;
+         mlist = (const LIBSSH2_COMMON_METHOD **)libssh2_kex_methods;
+-        tmpprefs = LIBSSH2_ALLOC(session, kex_extensions_len + prefs_len + 1);
+-        if(!tmpprefs) {
+-            return _libssh2_error(session, LIBSSH2_ERROR_ALLOC,
+-                                  "Error allocated space for kex method"
+-                                  " preferences");
+-        }
+-        memcpy(tmpprefs, kex_extensions, kex_extensions_len);
+-        memcpy(tmpprefs + kex_extensions_len, prefs, prefs_len + 1);
+-        prefs = tmpprefs;
+-        prefs_len = strlen(prefs);
+         break;
+ 
+     case LIBSSH2_METHOD_HOSTKEY:
+@@ -4314,6 +4302,27 @@ libssh2_session_method_pref(LIBSSH2_SESSION * session, int method_type,
+                               "supported");
+     }
+ 
++    /* add method kex extension to the start of the user list */
++    if(method_type == LIBSSH2_METHOD_KEX) {
++        const char *kex_extensions =
++                    "ext-info-c,kex-strict-c-v00@openssh.com,";
++        size_t kex_extensions_len = strlen(kex_extensions);
++        size_t tmp_len = kex_extensions_len + strlen(newprefs);
++        tmpprefs = LIBSSH2_ALLOC(session, tmp_len + 1);
++        if(!tmpprefs) {
++            return _libssh2_error(session, LIBSSH2_ERROR_ALLOC,
++                                  "Error allocated space for kex method"
++                                  " preferences");
++        }
++
++        memcpy(tmpprefs, kex_extensions, kex_extensions_len);
++        memcpy(tmpprefs + kex_extensions_len, newprefs, strlen(newprefs));
++        tmpprefs[tmp_len] = '\0';
++
++        LIBSSH2_FREE(session, newprefs);
++        newprefs = tmpprefs;
++    }
++
+     if(*prefvar) {
+         LIBSSH2_FREE(session, *prefvar);
+     }
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 6d2580072b..11d7448687 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
+           file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.43.0


