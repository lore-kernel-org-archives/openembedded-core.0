Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895B4EF48E5
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67227.1770970229249519104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gdhPS5U8;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359108fd24so390466f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970227; x=1771575027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO6nYUpk1ITMs9rmMtYmxpGzGQDPqzHHgBbZbHwanRs=;
        b=gdhPS5U8YNWp+p6CT35uRU1oj7Ndjza6NnfTfygXAgHkDp6vikGGr43wd6lzpVtD++
         or3b20Yc+ujz0MG0ncV3IszTEqionanaAnYGFncfL2e7poIztCSDDb7j29W0MT73zq8d
         ebJUSbijq03GKEasT6MeCzcbcs3nC/MZtX5pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970227; x=1771575027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xO6nYUpk1ITMs9rmMtYmxpGzGQDPqzHHgBbZbHwanRs=;
        b=shJOoG2gYp/vJLPp9LIvbefKdaz0TsW6nKLJeKkcegTFOfTrqymcgGU0iIUewU7KNe
         7PHVsgZbqV3M0jvY0Pr3jm2PP7gJrwD3jyCEuF2pWScYEoDVx7zdh5r6hfPO/I3C0Fnm
         hJxgx3vPYoqPXbE28ll9tPRc9Px6c0OjzeE6Bv1BTqcsbI0tuP1RGdrnPAr06CEQiOJc
         iw+PZpoRZJqktZ6M4YnqS0atZrIenw7fLF3D/6D+xCnaDzRW0iW6/GWGEoqEMF/6Xv3/
         N3pyL1cb0GFn/6QDwlHA15WbVEhQycV7inYB2Jp3vbauhdDivUubbcB9IulJrT/nnxV2
         L0kQ==
X-Gm-Message-State: AOJu0Yz//zxGP7JO984s6abqXuS0eJxGZ8YKkq3pdVsmbuzN5xevdl3x
	6X+lpP/eEhEPBdwo1xUy9tYbFzdawj/CKR5tNBs4p3JbSH3W4LKEoU8RnjCjhy4FUxvnuR0G0HL
	dx+zD
X-Gm-Gg: AZuq6aKVDp0Ocb/3XI5J679HACnFaFn9xbCf0ha0UCIiCUsOsypF9xgIBq3Tc1Obaps
	Esogb9suzMLR27YxUnyG0luMzBCld6T2bqC45C9n5H2bsyoAFrsxLjxxAEgNJ3EXg6EIYfciDpZ
	8fDy+Vzqq0CCjzIJpvsHIsOnBwuNQD7Pzs7sd33ISvFWQrXC/wbBYH4hgLdStXvMuEYV92ZJaM2
	rRnEkyrru37L56gR4654V6g4PSvSt4GMQ/hWc7D2wC8f4PkB7rd2l6rhmZ1zyskdBl/XnTY6yWm
	ieciRPaq8hWq54dd2LP/RfMcAbv2A5wZQrgfyAr1UCx2zbtQnpBODAXRqUYmMY4KJiXe6+4NeE/
	Ik1NQBrXp6Z9hUKP/cbgaN8MyPRUhQoJEq+ihtTiGqqQcycb2YRCy/hjqZZSOpPkqbKVzDWlGy6
	L2+6SbCozvu1kmuGDHlYPB8+/qQMQ3/THo2cCwwDsus8Qun7DTpX7lDkrF4nmzBcatVJnPhU2/l
	a4BLZ4/S2FJaXZ3tVi1JsUSHh0=
X-Received: by 2002:a5d:5f54:0:b0:437:70d3:44e7 with SMTP id ffacd0b85a97d-4379790e686mr1653231f8f.30.1770970227247;
        Fri, 13 Feb 2026 00:10:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 14/19] avahi: patch CVE-2025-68471
Date: Fri, 13 Feb 2026 09:08:32 +0100
Message-ID: <cc06c4ca77a8e3abfcae21fb498570dac91691d0.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231097

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
(cherry picked from commit 5ec4156330c765bc52dbce28dbba6def9868d30f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 0a1137ba433..9fa2ad1e780 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
+           file://CVE-2025-68471.patch \
            file://CVE-2026-24401.patch \
            "
 
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
new file mode 100644
index 00000000000..210565cdd61
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
@@ -0,0 +1,36 @@
+From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e57..86e4432 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+ 
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) != !(l->flags & AVAHI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+ 
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+ 
+-- 
+2.43.0
+

