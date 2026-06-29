Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA676C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38591.1782742834383282674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RGpJ67Lo;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-474560436c3so608307f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742833; x=1783347633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLqkdBSxCWMYmpZKzc6HznGsYpXCy3Y5Zle6Y9FmyL4=;
        b=RGpJ67LoYGVH4CDOvhCRPO8pmUaonIssl5PAYwhfhp+0OyVo/ccKLdYnSmDGTR1tsA
         PDKgmbx1nFMRtRnKAeKdFWb0w7rGvRCqF/jZxgdjXqRNP0z5UiUQ8A4pEQuGaFUT7cxP
         7OMH4uhCj15hZQivi3DMG9ywQize3M888hJek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742833; x=1783347633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLqkdBSxCWMYmpZKzc6HznGsYpXCy3Y5Zle6Y9FmyL4=;
        b=CiAAxa4W+75MxfGBHLTvqToxL2s+s/9fNSYk9ZkPJbR2TcFCMh6BYZZ7iW3xxkRYzf
         raMU0iLYgYevWsn3OuqTeoVY2sSsNpwy1r4Feao/ngZ/1jotsrUvh47ih8LtgWrcrje0
         qOlvPv44mevzVIO6lvOlol41HNPTlolmpTpNybZwU7wcdBcoqOmqyFbtw/ey8Y8wkqbW
         bHbcT/NqkV68CfKhfzCu+a0U2lhSdK2SpbItks4yJcLmKVxD6ga6ONIng24Gl96W5/8g
         8b5XCyd0EkBWqSjDRK0QFImHX39KbAz0eU9gH6hWZKqcH0+gCfZBmFQADYNGQe4X4p2q
         L3cg==
X-Gm-Message-State: AOJu0Yz7IIgbWR19auULaPFzluGCuJfhgcA9M+XhHW1Q//s85vNcFsyj
	e/adff+FmHCMtxkUORRKf0vfft9G3OGOGnm/ICvGX19LH0dpsaiTGGiIP8xnb+Wz2dMFllGnORC
	+m+GiBGE=
X-Gm-Gg: AfdE7cnUnt0PkD29/yrlitPtgLxJeC33VJ7BnWUZ5QdrtbOROavsEsLbFTUzN5mpwTJ
	BqPKOLHI7rCWUyvryDKNOZNEOB9lUWoBHNSapDvgv7mevFW6axBeUBa3rVCqVG9D/9U/Dgh7QN1
	ncLhO/NJSGTXZthR05s2Fdnc9d50vfAYAJTEg67l3TR9Z8ceVShq7oZlkDT5MApIEb4eBw/tVWg
	6UVAVvknKPvQOtS7+VMzVrP9FZojXGKwIZXKd0m3IB0+cPQCRKcFFOOY+0NvkpEx3e6BjvrmiyG
	bsCXYXiabdFjENaAY/eNo6Ei4Me1iQ0UhGs0Emk4gCKykmnIUVdXx7rylXaiLZx09hIM9puK5XA
	CKYbvzYSLavzepwgZIhbY2JewJ1MpKumiz2otWs3ri9fB8ErYR2zG4rZ9Os1P1FTeKIeLBMrGhM
	HVkcEcsQ1SS3Aa/85qWI2iMpEdeWNUSYKwGB148aFl4kfcADQOOINWOXcXoNZhcgLnjSYDeG0fB
	sSffNWDdQkU25JmrSGTHMg=
X-Received: by 2002:a05:6000:26c1:b0:473:f4c3:4d51 with SMTP id ffacd0b85a97d-473f4c34e14mr5233228f8f.43.1782742832520;
        Mon, 29 Jun 2026 07:20:32 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/19] xwayland: Fix CVE-2026-33999
Date: Mon, 29 Jun 2026 16:19:54 +0200
Message-ID: <c9073640be59ffa853af3c17987cde9ebd421699.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239797

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-33999

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/xwayland/CVE-2026-33999.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch
new file mode 100644
index 00000000000..cd3bf47397d
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch
@@ -0,0 +1,49 @@
+From b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b Mon Sep 17 00:00:00 2001
+From: Peter Harris <pharris2@rocketsoftware.com>
+Date: Thu, 15 Jan 2026 15:54:09 -0500
+Subject: [PATCH] xkb: fix buffer re-use in _XkbSetCompatMap
+
+If the "compat" buffer has previously been truncated, there will be
+unused space in the buffer. The code uses this space, but does not
+update the number of valid entries in the buffer.
+
+In the best case, this leads to the new compat entries being ignored. In the
+worst case, if there are any "skipped" compat entries, the number of
+valid entries will be corrupted, potentially leading to a buffer read
+overrun when processing a future request.
+
+Set the number of used "compat" entries when re-using previously
+allocated space in the buffer.
+
+CVE-2026-33999, ZDI-CAN-28593
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with TrendAI Zero Day Initiative
+
+Signed-off-by: Peter Harris <pharris2@rocketsoftware.com>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b]
+CVE: CVE-2026-33999
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 137d70d..2b9004a 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -3004,7 +3004,7 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+                 return BadAlloc;
+             }
+         }
+-        else if (req->truncateSI) {
++        else if (req->truncateSI || req->firstSI + req->nSI > compat->num_si) {
+             compat->num_si = req->firstSI + req->nSI;
+         }
+         sym = &compat->sym_interpret[req->firstSI];
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 362b110a0bb..65f1ed2ae07 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62230-0001.patch \
            file://CVE-2025-62230-0002.patch \
            file://CVE-2025-62231.patch \
+           file://CVE-2026-33999.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 

