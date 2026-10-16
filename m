Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FF0CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6032.1792189490247582580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s5BIA70N;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso4330215e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189488; x=1792794288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r/3AN8XFMbB0Ow70zZiURM8u3wGZlLNQWU2Am4dFnUU=;
        b=s5BIA70N+9SR5I2ZYbeK92xDs581H2Xb1h7vxwJaArP7vRzQeRBWfNCTkDEQ7+yWlD
         HjGQDmr8H/tNmggJtuP6uwYpELZBL29H2vw3xnRo4IJn5ljOqYbbuBKAvhfSwAxNYTbJ
         Rs6lJYCC+jGHAEVcUL8gv+IChVWHQSPAy0n7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189488; x=1792794288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r/3AN8XFMbB0Ow70zZiURM8u3wGZlLNQWU2Am4dFnUU=;
        b=LaUXm1iDNL1QFU5ibNARditg1IWqQtue4LJgvADDA+ppSc8ZxPEj2JQ3xk8nV+VCcE
         crMcLld2wzGQe+gabKP8fTQTrv38lozO7G3XuqA3vaCGZ4suCOzvRqrSSlY4QGe7T5d/
         gCKfOYLzZpnO4WCQztI5ztfnwSDCK7SNn48pnQ9U2KETlHXsiDyWirv0+hT2kzqJPUvt
         w6qjWe9ZP+9NP71WkVuKnzqpAieYYZe2x38Gl3H4b9NF6RF4YibKJiLX9FPhggLy4FXY
         1K37I8PShiVFchXc8mAfiIF0dAvSSEfJOOL+IKDmRxL5oTpqjH5H7BN5cs2Nvhkazq4x
         xqpA==
X-Gm-Message-State: AFq9FYJjinFb+M+2n416dXwTicWqe5zc2w4814tb8UPM1oapojYU/R6c
	ttuctTprspL6+VJN7QU0RKROuvxWQ4YnWCGYnoYOUsNXijynwGDgUWahatwL11OlQ5TYYg2CXfk
	4mrZ1aR0=
X-Gm-Gg: AYBFou0jkS4qG/8JkrXSrVDy5v3QTZQkItw9QULHTq+eiPcjsIafJ5rbQvF8+a9tSbT
	zGRxueds2/9EB2gWxzVXlQL7PMVIZrzsmB1MAx0+RTcNu9kt6xY2pkNOLVEj6W4gHVIGqcOS3YV
	tcdxhBQRtCRbK/K2lDaEAMVwCUDqEFIykAbDqAFvx3Th5JHT0Rf4RKm/i+1shuP225lmZX0knGm
	ixxf9apbrSRvxgsFc4yC/861Kbe2LFNnMZTx6ogzzvlG1qOU6fywNpDWrBMQBYcPJdMKe/CJDwp
	zdJATO4MQ+2TJMBf36FMGJKYki1Y9kMqr9xpL6XktLtCtljwIddQmnFwTQnOwT2B8m9aiDJ5QdK
	2PzutWdc/8kkji8tw42e1gnRd4NCK4AEaCxkPvhrpSmu2TxSRAFsyXP39dCXSuChIzIgHehDnvt
	xCv49XvOq8hQzBoLhPcRcvYU9c9nXSb2SreiGTgNHtYwtEQOQRDyQw1WqO14+LAjZ76uZSf+XAJ
	yPwYIj7Zra2c8J08nyOWrAAMBgMtYI/BqvktKQUx4mKatvKvY+oLCZph6qkcrPK0tlfByCMHg==
X-Received: by 2002:a05:600c:6992:b0:4a1:d7c3:d3d with SMTP id 5b1f17b1804b1-4a1d7c30dd2mr22304735e9.10.1792189488401;
        Fri, 16 Oct 2026 15:24:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 14/17] nasm: fix CVE-2026-6067
Date: Sat, 17 Oct 2026 00:24:16 +0200
Message-ID: <6bd2d92ffa9b40c8ac97412fca893bd9b685c3d6.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248064

From: Kris Gavvala <kris.gavvala@windriver.com>

When using obj output format, specifying more than 256 segments in
the GROUP directive of the .asm file causes a heap-buffer-overflow.

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94
[2] https://github.com/netwide-assembler/nasm/issues/203
[3] https://nvd.nist.gov/vuln/detail/cve-2026-6067

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a81d85a8a23fc1a5c8396c8a7cb5cb59e97a9b2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../nasm/nasm/CVE-2026-6067.patch             | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.02.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
new file mode 100644
index 00000000000..e43aafc7ee2
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
@@ -0,0 +1,36 @@
+From cc006a1d57bebb6ea49db488539a1613014c062f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickclifton@github.com>
+Date: Mon, 29 Jun 2026 13:53:14 -0700
+Subject: [PATCH] outobj: fix buffer overflow when too many segments in a group
+
+The number of entries in a group was hard-coded, but not enforced.
+
+CVE: CVE-2026-6067
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/203
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ output/outobj.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/output/outobj.c b/output/outobj.c
+index 685c5933e..9d8bf83c5 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -1736,6 +1736,10 @@ obj_directive(enum directive directive, char *value)
+                      */
+                     continue;
+                 }
++		if (grp->nentries >= GROUP_MAX) {
++                    nasm_nonfatal("too many segments in a group");
++                    return DIRR_ERROR;
++                }
+                 for (seg = seghead; seg; seg = seg->next)
+                     if (!strcmp(seg->name, p))
+                         break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_3.02.bb b/meta/recipes-devtools/nasm/nasm_3.02.bb
index a7d598cf629..2d2778fd88f 100644
--- a/meta/recipes-devtools/nasm/nasm_3.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.02.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2026-6067.patch \
            "
 
 SRC_URI[sha256sum] = "ce7ed93281615379e4a9d4e76503c64a79c1d5ca696dbe148f16cf0b93e239af"

