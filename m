Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9AAD59D74
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15364.1765554022187111175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TJP7za7S;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so1451954a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554021; x=1766158821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPlo2VjZe9bgSiSLYOg96yJpdDLa29KBpzjD2F6ZQ4g=;
        b=TJP7za7SflrHWHiN/cYfE7C8s28xr4ejkngDRgnsLxELiiSXo38nwYwkPTC0TGk9Fp
         SEYzhZUQ1LLQG0oGBJswCVQaK8lYePvY4oycALVMrksSfZLltbVYpAYcbpneu9bbFZTH
         NVnnXykXiEG8rDD9JTibASxhD+HwBM3sq3p1Im3HFQwbBRBpURAxBH/rGlfQtVXJO8+r
         cMukaepxjHgC3uQT5HqDm+KNi1WW4PLFh89BOPYogGAiIza6w0kbsIuxReCbeLljZ1bo
         GPWWaumpadZRcl2dBHFdEfimhLLbuulg8/NlH9UIN/Fo07l2AH5Z/44asvTSaFi4tUXM
         K2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554021; x=1766158821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BPlo2VjZe9bgSiSLYOg96yJpdDLa29KBpzjD2F6ZQ4g=;
        b=Ac7KfHVZQ5yjSYdxuFuIliNUiDzPHoEcyvOOMsYyJ4Avso9yR/Hpvql9ex59I3wfqX
         tMoZqZiQLsNG2HBSpi+9Zj3/3FfGKw1u8LduTMH/Lpl5Vun8/QTYtlkQmMj7ITt/c49a
         y/C2QSAxPDOUL8NQ6hqQOnbw9inrSG+SLk9AR2eAg7WbnkKstVa+YuSY5BZtEhYGmLeN
         LMbtiYpLs7iQcuJ0/z4aaUrHID/yQwNAtXPo0qb139Sga0/uq4pxWtb/zSIjbw2VS3Np
         qCOXXPLkmNeG2UziI8MZ55HVAOdg4eDzim5fGZVjtH18y42Atkza+OMQ/e5CYp/B0mPE
         ihjg==
X-Gm-Message-State: AOJu0Yz3eq5q1FHrJR39JtdGfJ4KHaCTkWqpbbiDu1glrfZ862FlDbkd
	6ybwpGnbsD1iXXRFQ8l+egRdr7vfBfT7PnEDWhvVYKUZhjwhxMKjiAK5CCFyRKUNNmI3GbZLlCE
	GfyUZ
X-Gm-Gg: AY/fxX55fsqf4/s/K7D+spnzMllwKFz60FMz3oVZQMsiT4VWlFJfev7J6GdYSHmMemw
	Bciur3iIMZf/svbBYIqSd/6q+Ig21YwwE9qyp/lmP4vBSXuAQCVZ5Bbuu4H12H8RN1QtLwKNlc+
	fzIO9mWmrN5UgNh4DELfp2hygd298EkW+lMihPoyt/w3fWf27yJKekynaffCJRc4Ws3QxsH5swn
	+5Z4z7qArBI93vORdDwK0hp2Q6g5EQXYqe05Ur9xQMjsoI7dHwrgmqeTBsOiUM0aQph4GHGAYQm
	H/dfUzww/Wva+Tw580GSN9vFZPKrBt9zC3sgUxAEqus3Dd+eHPlmsROAUe0hDdopBwhwZgSK/M7
	DFwC1PA764ig1ngL+KFrkqY+VJclCdXvNkLWk8GQMZagAOWqUl05P4uN26KZAhE5qGhZ3z9loA3
	us4g==
X-Google-Smtp-Source: AGHT+IGZEV61qCvEOvSiHn1b55rVQkhOQR++h16jEDzI/cZk9F55ZV/t1Vkcy/y0qfhzWr52yYI37Q==
X-Received: by 2002:a17:90a:fc4e:b0:343:688e:3252 with SMTP id 98e67ed59e1d1-34abd6d3572mr2802860a91.12.1765554021351;
        Fri, 12 Dec 2025 07:40:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/7] libssh2: fix regression in KEX method validation (GH-1553)
Date: Fri, 12 Dec 2025 07:39:59 -0800
Message-ID: <c348296ff0181921e8aa5a16d8d90db75f7b3e7c.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553842.git.steve@sakoman.com>
References: <cover.1765553842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227606

From: Vijay Anusuri <vanusuri@mvista.com>

Resolves: https://github.com/libssh2/libssh2/issues/1553

Regression caused by
https://github.com/libssh2/libssh2/commit/00e2a07e824db8798d94809156e9fb4e70a42f89

Backport fix
https://github.com/libssh2/libssh2/commit/4beed7245889ba149cc372f845d5969ce5103a5d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index fb63dea8b3..49da9698a3 100644
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


