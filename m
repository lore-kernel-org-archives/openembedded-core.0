Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DDECD98F8
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10391.1781682334058037379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nrjevAQW;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4629051c9d1so297271f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682332; x=1782287132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phIcAsmxbnn0+TcYAcXNEFv9Q6xqfKlq+Q7VmI16k3w=;
        b=nrjevAQWU6ufe1jBSnNWBOQeDlB7LRsV5WOX5RxfHyjVNQLA1HQkjrlbqHU9NR0lCF
         KO4Ibw7xR+GjuNp27HmpT8yz0T3tGqrDyK30o0ZWnXZOGasqzMwPbwU6GBx5NvZAjnOB
         Xu3/32FSpeRTQEv4bU5g4aBuNoRV05Smz9uSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682332; x=1782287132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phIcAsmxbnn0+TcYAcXNEFv9Q6xqfKlq+Q7VmI16k3w=;
        b=g8eXwiCHA2nGwbGncoYCCNfxu5sMXHQSludV9s4i6xD3eSbeLT+gMyJ3Nko269zwkA
         z8Jtsp0sY3XBFa6jYRc+og5KYLTnJ6w5MsFvZFcXzs+6vMwjc3SH+x5EOtIRKqbWJ4vQ
         0ngP3eDpAU3evZOzv0qkQxFH9ngvFoNDK0R1d/dCg2bGxlpS8GNTsmGCwFMmFMutZmM3
         egi8cEiF5JIFw8zgmJUoPHjrptk3Je/nY9qSlvc2q5vymF5/0BqyzWAh81RuIyXvgKwU
         0CcxCYm3LziBa3V2LdUVYfoeskBJ35ept+ZNpfPev8WgUvd+tiiWQUL9VaIkJaXyLyVn
         MlGg==
X-Gm-Message-State: AOJu0Yy91VQH6cJVliKVV8OB9Or4anTWN10v0IMuCygiC+kr4TbqOzxJ
	6Uoaw+cz30CYq1IUn4hQ3w7Ng8fbiWSZYtVQ6S/rcK7B6/rpMkyKNPzOH7ALRUT4ROYG2PdDlC4
	/p0y/
X-Gm-Gg: AfdE7ckDt9uUCB6OXOwV5fldYNyUfWYnfL3Zidc3tTyN6xdT810IY4QaoLHlbIB4J0E
	l+3m8JH8sBIGU6VU+Ouj2dvJaHwYjxr7TZEq75aCwCDOp66Zl2InJkYKxlCjnO8gs5QZQ6SGOZy
	ZrSsEGiYDJIXKeHQOI/99zM3Ou5BoNYA3ptiHfCee0qdFcdSQi0KhaY3adxMj2r1p/Sgm9uEcVP
	PeqKnSztavdv5Ji85GRNMn7mKYd+RAjQSYygZdLzNQQFlm2llUur1SfbfOgI3K7FWcct5GXblzB
	iIoA9gYER2F+z0PI9ZynlfV4SRmGeRx/ZWjFdeUHXZMn7nFt0kddFzzPJ5YdzFe9fSKS2eSYxd4
	IvmkuCmUEmKZpAHWP1pbl363oK9CGQqgAziOYnXWYQejo2PLD+FE1lTxE5SfrLSPvxmS3cB/JkL
	RBt0e/2icr8+Ya+edBCo7gRMdV85ZyzxenWMPuMRztocklR1yWGvO4I9kqoJ3RWdHA3m2zrkxoD
	THEKGkorB+M+sgj4g==
X-Received: by 2002:a05:6000:290a:b0:461:a1c5:8348 with SMTP id ffacd0b85a97d-46238cb6485mr4612652f8f.42.1781682332329;
        Wed, 17 Jun 2026 00:45:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/30] xserver-xorg: Fix CVE-2026-33999
Date: Wed, 17 Jun 2026 09:44:45 +0200
Message-ID: <b66a3f975666d9074f0e377ccece1aad2c347da8.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238992

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-33999

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xserver-xorg/CVE-2026-33999.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
new file mode 100644
index 00000000000..cd3bf47397d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 7f6197a0b41..ef7f5c5bdb9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch \
             file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
             file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
+            file://CVE-2026-33999.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 

