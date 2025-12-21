Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C046CE67497
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68793.1766353060609701864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Dj9/Ib03;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso3746333b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353060; x=1766957860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNNg1TifsI5+LcgOq1NXZzFuT4vZnEm9B2V2JrR9lxA=;
        b=Dj9/Ib03ONuZRqsrxlwxqz2Rd6Zr+6Bd+ANTzFTXW1/xqh2drF4TkC+ylvP9+uVyU7
         dYaVInb3Oecd03TGYD+PcB2KPsG3D4AOsBmJimQLesjUDHtSvZBsonpV4UEetdylR0IJ
         BurafJ2ffMIJov98Ipz2uMCzqXn2abKktyAATSkDHmtw34eDxe0iYwr2Wx3zfsjMIRhT
         uPWENL20vdUWlVWGyBrXGcI3EBJz1Ji47qX272OUGB/jmXqeoQXY+CEGgolA06Edf/Yc
         ue5v+wLYtTw2tjC4hw28TbZigpu+OJpd3Zk2yRORCDh1WzY6M41Dp4xHxW29HgcuywGE
         hlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353060; x=1766957860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kNNg1TifsI5+LcgOq1NXZzFuT4vZnEm9B2V2JrR9lxA=;
        b=BlSoWHWgnBBv76a8ebMSPqqRoX2GM7nk2yd8zmWiZWdDfioMUIDjKGlTd2XKlDB76n
         WFuFtiFYixa3Dq2zei6wY7AM9yBZ7tIKVlwtCNXXv0i3vLtIlv4K+jtGQhJlb397Ys+5
         e8jRx1z3tr+C4sP/UWuRRbY52YwRJQRhvBY3sT7R5GYEHtXqi9Jy6F0JonRZZcK/DkxU
         VsBUEzN2BgZHyiLKxJykg62xecvNwAdON1e5SDn49CBkbfNU8lKmmX0frhxyqjwIOAZp
         HHPqRvXj1+af/4sIlG1ssaknER+l+Lw2IPeNrReFr59JS6fZA4dByqMdad88xJDVnoIt
         I/tg==
X-Gm-Message-State: AOJu0YzzQKeeklARdbBDwGWVYnMdTKzWuH0Cc2qPtb4sDy4wGNwEEy29
	P07FhBnHVtSchFDXRmtS/2mf83xBmDGO16C2dWdmnNLtmUd1laQuNfcF3jq2jjho287aK76c5Ui
	RmGZorC8=
X-Gm-Gg: AY/fxX5qTEDpG6DJRrnBJCAmHbfm8Rd7d2he9+ywxxO2KZFjzDik4MaOQA2zGvlaupk
	O+JJ6PSUSGUw6XMz9OUEU971tS+RjRWaVVImdGe7dAlNn29pBAsroOZBI3j6NDhc1Lc0hsqKzEo
	ybfaW+V0cA0ngPBCVXwvKGVOnFBiumexrEVXvS+HgmCq6F/QSHNJflU4qwsij+rV/a4Q5mb0Go5
	K2si8+Yw/qVpxwS4oHbfRo3Jvx+dN6c/DLBqIuvkUvYKvn1yGiw8l8j78QGU/Ug2A1z058s0Fyu
	L2RFfk7j4f5mB18WNKoLjPZipAsEYi0QRCkYprVdHAFg+OEu3u7MFstsyP0CzSwku44RTgOfYJJ
	d1wCQzvAVsU9Zm7u92qe7Z6JLivkAZkkfNjNnq3Z7wljiwEd0HusvvEczQ7CWNiMxlfHF3TrV6D
	Okt9nizxVVNAI=
X-Google-Smtp-Source: AGHT+IE1+bHmET1oeQM6FSUjmpWceFeKN/AdGhA2dTrKq3Q2WS+KoX/V9QmMuhT0kbhOTk2JeNG4mg==
X-Received: by 2002:a05:6a00:bb84:b0:7e8:4398:b363 with SMTP id d2e1a72fcca58-7ff66673079mr9038015b3a.54.1766353059837;
        Sun, 21 Dec 2025 13:37:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/18] libssh2: fix regression in KEX method validation (GH-1553)
Date: Sun, 21 Dec 2025 13:37:04 -0800
Message-ID: <04bc5b421b251b13908ebb15d96c6c3d43939890.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228269

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


