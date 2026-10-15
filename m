Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46943CCA460
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32825.1792040633812814912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fo+4k98s;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso34994915e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040632; x=1792645432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KymkPiEtd6Nu97UFpAiZ9rssq5aRW4WudneBSOAbko0=;
        b=fo+4k98s/tx2GoxQSoRtiqv/LGvrbUfh8B/+jsIe5KXxlAp+dB+ijpGwY3w6JPOt2C
         2Hh5yHrPjQ03JCVF0T9zxNWMxPxaPaI+8ag7klR2Qu//srsA+wUeJ7eJ0HgCoNd1NTHl
         xIH6ZNStYkAUwEZTtTOr3gwSvYKC68uoKxD+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040632; x=1792645432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KymkPiEtd6Nu97UFpAiZ9rssq5aRW4WudneBSOAbko0=;
        b=VQim3b+n3wbwoeo+LWihbskVieN1TB8w13k9GKDF2tj8LLbdeluRulFMRaEt7rYN3X
         CZAY7vp/O/egWPo7nLHmvChMhk/7+8hW6SN27w/qnLpfVWjJvhJgUaUoaNHui72gJ9ks
         qrY6ymnG/oiawE6yr8fG4N5TsaHrBxSRKJeKX7I6TZvwiSvlki6kAxVGh596efNcZ+oA
         0C0v/SYjoYRmA5zrpOQB0mRNA/aT2ehlTyF6LpWG6L5Tc55nFA+OIHnJwjHhFgMkfQI3
         4McNyeK19FWbiG5CzZVS9aonz51dtiDjgPuo27AgIui7hdUwr/rIB3qw+hrTkHg3RVXi
         tXXw==
X-Gm-Message-State: AFq9FYLmK21lIVVpqiSEM6qdvWb3J1mEphs3jI8kfA1mwIJSlkUdfXM8
	ynjwFhww0YbhDmVGYk4SnaweoCzlKvEYCGmNDjIASPcaUFpdCUwz+uTwdZXvoDsUW+nUwJTB19e
	ofWDw+EU=
X-Gm-Gg: AYBFou00A9Lthphqvkbz8zhOWGmu5MHgjCGDKMQk58zxkmrCwkyNFjXrKlzNkNsIttx
	lcKb/UxXbGLT/TQfyTOl95ku7BtXnQCEtmzCMd0BxuzNnsYse4ukn8LNRU/sRRAOrVTuNXyTpjA
	TRNC++DI1pyxiLcAzu/tuV32cqG6Mq7Sjxi9fn/q6CKDeDkX4ZrspnGCfVUWZjj03FX/7BvYgwD
	6nEFeqwTN44fZIYUp6Q/AQwUEtCOBPv+CRQHBES3F8prEygqwualrlngADmG+u1VG9rvu0v6tuE
	mdQM7PaqkC350KtAAD9Gi8ljngQ4iq76p09yrib2KR++K7mq9/w6NiOFdOcMv1pokOsiR5FJp7h
	BsU/X4hdJWCxWQKkQBROdXVi1atJzvkJ+Ej9124l02q+zTYYUQR2eAkVXDyhl/XZofaGGF4Rwzc
	b2sQMSJluL4qM0jrj0McsApPRoYG/rB3uUZKNhpxsmJJUYgF+lPt1tompWW1PRrSh2ui2lgSmi0
	jFkLxZ7T58PTKoEv9BT+NCbR1MeKzEVwAEsbUQk3NOTcdjqvO2OgVQVcV9xaTtkp8sVOLt99g==
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1ac666396mr145350855e9.15.1792040631846;
        Wed, 14 Oct 2026 22:03:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/55] libsolv: patch CVE-2026-48863
Date: Thu, 15 Oct 2026 07:02:45 +0200
Message-ID: <28c807ab8de3d274b04c2dffb271e050fb8270cd.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247820

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-48863

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsolv/libsolv/CVE-2026-48863.patch      | 25 +++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch b/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
new file mode 100644
index 00000000000..131d035b408
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
@@ -0,0 +1,25 @@
+From 44f8c085045b1f771641091bbb2b810d12cff9e8 Mon Sep 17 00:00:00 2001
+From: Michael Schroeder <mls@suse.de>
+Date: Tue, 26 May 2026 10:30:31 +0200
+Subject: [PATCH] Fix wrong variable being used in solv_pgpvrfy
+
+CVE: CVE-2026-48863
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/44f8c085045b1f771641091bbb2b810d12cff9e8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/solv_pgpvrfy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/solv_pgpvrfy.c b/ext/solv_pgpvrfy.c
+index 9f1bd72e..9358558b 100644
+--- a/ext/solv_pgpvrfy.c
++++ b/ext/solv_pgpvrfy.c
+@@ -589,7 +589,7 @@ solv_pgpvrfy(const unsigned char *pub, int publ, const unsigned char *sig, int s
+ 	if (rlen)
+ 	  memcpy(sigdata + 32 - rlen, r, rlen);
+ 	if (slen)
+-	  memcpy(sigdata + 64 - slen, s, rlen);
++	  memcpy(sigdata + 64 - slen, s, slen);
+ 	res = mped25519(pub + 1 + 10 + 2 + 1, sigdata, sig + 2, hashl);
+ 	break;
+       }
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
index 4ad8a20e2f4..827b6210a69 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
            file://CVE-2026-9150.patch \
            file://CVE-2026-9149.patch \
+           file://CVE-2026-48863.patch \
 "
 
 SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"

