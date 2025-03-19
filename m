Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D1CC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.2951.1742372189593412732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdmfQ/tS;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225fbdfc17dso62540575ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372189; x=1742976989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=bdmfQ/tS/YRUuER+TIb8I3l0l71G1FwbMzikXLgSacjD7VJ3X9+qmkFRydsOTujKVh
         fFZo7pngj6lO8k9Thwsuyv0NvZb27IZDmqm58eDMF1KoByQF7KGDyluDk9cSLFXwMAQZ
         h6s0I4cLUYL8seQc8xNexGqlc/C3e3VmiOUZeEqiAjhRcPzjqC4YPgmIHJuODZuD/rxF
         4xPgWUoElz1MsOg2LEqtxm0aRa1AX2Sb7MmFPAXArOUCgUmwasxwzLNOHdcIVeB8LAVd
         fSZSkvJSXzouRv+CMTFPUh5kOwjrSd3om72VCbM4pSOTP7PKnL8YwrSDNni/uVaMfEnQ
         ojMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372189; x=1742976989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=KwwpgDx6zWEHoCQLnz/zvSLgvG0EuF6N4DyttKazk15yijqhVpBzO7BUZhBHc9mfw2
         sztUV7vumPJdpRBvqQCPAtm7KSAznJibUtNes02V8UBUftEgGyz0vWzu7tgipIgUtY15
         S64gcxwgWsa/49zZDz/LE/BgG531Qz4T3mxdktQHvYyZYgCOoQHhJlEGPMu6b5DYl/eG
         yhw72McwhyyeuMqn8BYPwAmkyhyfBrMnhfkrqpr7XzsFtP2PtF1z+pyGpnRw5h0sAz9T
         mQVhsbb7pHpdS8qCHUD9yIlDWWbgmDEF0iRZ0ZdwqutMuiyADw0ABseAkfoxufU1zonj
         44mg==
X-Gm-Message-State: AOJu0YxU6qFUCD2Eksdxaf28ERtiagGIEmfASq0v6LhWBZe66c8Bb4PY
	WxTEiZCFewn7TWTbS9PRUQnGACqF+6VL9bWxHCBUKuaNXFUmPsX6gZjLDjts
X-Gm-Gg: ASbGncsZixy9HubzH26OcPGYs1cMMcZ1CxwI6PAAsERH1t3pmzCkpWgLMCSveO6dq9f
	g24h2ptDnwDZUhzgKJWqp/t5pQXB2+3htDHFCkfpl8VZaEDfTa/T6R9wTp1augrdpUskpV2v1GM
	Dz8xaWs3JuWupdv8SutQ8FWHDr3i3/QkMInRT7HP6woNqLlUungmf8tunyLAD66Ll2UbHGUiso4
	1tP05ay7mTlG0/CqUoVEaKBkk30Nnp1FAfhVt24YvgDQMV5eM4MaGZEnPOjkSXVAl9dP8ivXKDU
	rMKb7P6Z6haeTYMQflooBE0VprdcZ2as6ADi
X-Google-Smtp-Source: AGHT+IEcqVgi/joyOcLRawI2L61xv+G+KWnKC3bgMF/S8lEnaATGizT1wajPESLVrBz4tcquLKmKHg==
X-Received: by 2002:a05:6a00:2e1f:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-7376d6cbaddmr2897127b3a.19.1742372188653;
        Wed, 19 Mar 2025 01:16:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 15/25] ppp: Fix build when shadow is enabled
Date: Wed, 19 Mar 2025 01:15:46 -0700
Message-ID: <20250319081610.3536475-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213284

GCC-15 patch is not sufficient when shadow is enabled, therefore fix
the remaining issues.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-session-Fixed-building-with-GCC-15.patch | 33 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
new file mode 100644
index 00000000000..d95c72e96ba
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 14:38:26 -0700
+Subject: [PATCH] pppd/session: Fixed building with GCC 15
+
+Fixed building with GCC 15 which defaults to C23
+and find conflicting declration of getspnam() here
+with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
+
+Fixes
+../../ppp-2.5.2/pppd/session.c: In function 'session_start':
+../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
+  185 |     struct spwd *getspnam();
+      |                  ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/session.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pppd/session.c b/pppd/session.c
+index f08d8e1..9cc7538 100644
+--- a/pppd/session.c
++++ b/pppd/session.c
+@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
+     char *cbuf;
+ #ifdef HAVE_SHADOW_H
+     struct spwd *spwd;
+-    struct spwd *getspnam();
+     long now = 0;
+ #endif /* #ifdef HAVE_SHADOW_H */
+ #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 5565ce51cff..602f98991dc 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
+           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"

