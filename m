Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAC1D3B7E1
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 13:10:51 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7656.1765199442912953040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 05:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hthANo43;
 spf=pass (domain: mvista.com, ip: 74.125.82.44, mailfrom: vanusuri@mvista.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11beb0a7bd6so6099100c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 05:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1765199442; x=1765804242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeQdi0GQZfhFqB0sq4WMu76DRJs0YB64nkKlIxfKf8E=;
        b=hthANo43hf8ec41WD4bCp/zNvZKelwjzTWI4aoM43B6X3HFF9uzgWCJgVi2zbg84sQ
         VWnt7nF819u1CASKYC1ZAOo3BUNCdDpyWIEW1ihFp4HEWtwa0Loxf06kj7IJT6CLBMin
         BPBwcgkgr5zN4PbmcAVepjVl3IJjo/O5KlNu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765199442; x=1765804242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YeQdi0GQZfhFqB0sq4WMu76DRJs0YB64nkKlIxfKf8E=;
        b=n20MgoNdQBRAZA1o5vPNMY87vF7gkjTWrOXvUfBi2iLEfGjWCfUru8GLMfvlHomijS
         Ct66eh94SOlKlattt6OpPPumSas1U93rxzm5NmyMiL3Xfw3naUyP7uKBp7/1QMQMiFJN
         Mx6S1h6cZuHGVOykBg+e4Wt88GQnpnxA5VBdUZLCpVJ00CKTnB/KmNA6A+rSKNhUh8tE
         7H69+ezbw67DNefv1iyu0qKwXI0+OqXOiX3WUD0ohLVL79fS4T5vaU8yTfcOsJZnVD8K
         Nvlhq6ngSPpB3LSxDMwmPT7bV1e3V4P7SEjr/IWR8hllrWzD3bDYXKSSbi332q/Uz2dg
         HgRg==
X-Gm-Message-State: AOJu0Yw4DC06ZKpVj292n24phyXnLnEJ1SQ67WK3SO8lpr1QAb8rlQ0/
	QPkxJcVjBnZYc+LLw/ZOjomFL+upJKaM1N5Ug7cRKpU6pITTy0KbEhu8D0MPvowlV0HFbPtdA3d
	WTbDK
X-Gm-Gg: ASbGncs3SUHhs3GLPwBd23x2Y1Ctt0pF5cGiYf4TBadDn/apCJXTJw6Kzr53hsgRBOj
	xs6bmsnxDveBOuL94ip6tGi/FEeF6dtfzp5B/5EfO1HgSBCWieiY0bT3CCkR7uAHU9Mh8cAMz+w
	sC6RJiwSaJzLJ+JD3Uv+1RkpnbSBthTP6kUT/xo3cPyhvQjdLsyoKfjEr1twVVpqYro0Cjpeqar
	PKxItlLuWjukmeIn9ToBHVYHJ+yfA3pFZR3oysgP2+mh1e39Ng9Q6KOQUcGpVtDaug+9n7Bprj0
	4TfzUHlKrj97VAcZPmIqVeP4s00ZHxo/X7p54l7HXgai49SkzfT2EvoK0YQzo2D7Ar1IA1xjyUB
	a2CYHs7/onIwoc41zdB3ruKBuJ0VsjfmYW1y7LcSgoQ4deWBiFRldK47buKLv5fpf3LFmQworLQ
	sgWmzCZ4Y341A9JnZZVfmomg==
X-Google-Smtp-Source: AGHT+IGVdy5LHUAamJCJZaKLfp4JfHL96U/ojGDuvWv2IhSJafxWiZPXN6VcoINXicPRO7TrSh3h1w==
X-Received: by 2002:a05:7022:ef13:b0:11a:515c:e891 with SMTP id a92af1059eb24-11df5f1f896mr10139986c88.0.1765199441708;
        Mon, 08 Dec 2025 05:10:41 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:922:f769:b213:6c9f:8a30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ff44asm59725024c88.9.2025.12.08.05.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 05:10:41 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/2] libssh2: fix regression in KEX method validation (GH-1553)
Date: Mon,  8 Dec 2025 18:40:26 +0530
Message-ID: <20251208131026.2320727-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208131026.2320727-1-vanusuri@mvista.com>
References: <20251208131026.2320727-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 13:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227395

Resolves: https://github.com/libssh2/libssh2/issues/1553

Regression caused by
https://github.com/libssh2/libssh2/commit/00e2a07e824db8798d94809156e9fb4e70a42f89

Backport fix
https://github.com/libssh2/libssh2/commit/4beed7245889ba149cc372f845d5969ce5103a5d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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


