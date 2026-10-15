Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8ACCC6B35
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32842.1792040647465381194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=129erlRy;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so43564175e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040646; x=1792645446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wT1nsHvQMAUBfgqZmm8Dhh3i0eGX6wmoe79WdUGokts=;
        b=129erlRyIdbNS86n8yYKXJXTdzuz9yNxATVGmAngCBIHcBFdUPS5oA3p51GA5GBo2M
         siA0+RJhsERRaxoYhDjHzPTdlbz/ArfSigfuVe11GHSA1e4qS8oNVSNQJzNmorakev2w
         pVMMaWpoxHKM3A73URxpcIRruNQ5GXfkFKsGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040646; x=1792645446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wT1nsHvQMAUBfgqZmm8Dhh3i0eGX6wmoe79WdUGokts=;
        b=ypA3kzg00ZE8a4zf6dwG/cNM9Ohyq0e/WdvqCD35FE7zQgmElsOedO456MJnOpRnbg
         Kx2HCUWErB8jkjnHKHkaHqJcMHCOpslg0rOgM0RoyJd9r15zhDlI8o9KxdRk6KShHqCH
         7ZXK7pGNr36SIxhoAu23LTDby5JEeh9Ciq1WZdOLgfXord+AHvZleRXH31jgvDETq4ho
         E2bh302JSyH9GmOXMoYgdS2R3QDEWU5rSdCxdS/c3joSu7r/SqLlGEwA/Ow4gbK5U+OJ
         hFsYMyVn0DKsWd3rs/uJIoKpIB4MJxmGcoVoezEf4jonbFiTuu16rAJLUKovk4qDnjbN
         qauw==
X-Gm-Message-State: AFq9FYIAdBcObLVMrgDcR5fpDEzmxjVxXyanZ5vuzjXUrnPWCaSi82PT
	amyj2OQfThBaEyBnKCnoQrCinQ4Xr1ov3+X9hTUZ3OciwEIGg5vZjM24zKQDBqd1Qvcs/M2iUNB
	/QObM488=
X-Gm-Gg: AYBFou124e8Eaz7bnhCQn94g7KJR33xLYO7++3Z2YCS586UqMZRI4oEqWZgzk9in7ow
	OVM1XZwsaEDp+ROP9PSD2smbQA5IvZKxHt8WmUJ2TkpPg873xmV3WP2HOzoo/KHj0hkNHIdF7jG
	XHPcaBMjbVIt/z+c7zL1sA2PAIhheHAjr5Q9glxhoFUcr2p5X+jwKm/OfVM0lV6D3iKgUSXqEcR
	Vr7bS1e20rX+SU9t6eM/DXij2BVrtyOS0KOjs/p75PLgmB8c5kEu9ks57CPlMRO2viFRVDG5gO1
	BBXLEJOWOqROEX6H2jjWiYYTd3eFnnSp/nbKPSRqf1nSI//mbRCoGeB+dfyc/6LZuczoK2rXdgI
	28meOcKSthcDu470s8aEEjTxjzBJfLuvNngeH/kqteXL2xwQWiHWadi0E/A/0Lzuv8GlRZo5PG8
	aLaMrw42FsoDTB5eQA8CFjS8vLuECyJ59VnrePQmnnOfY9jnJJvdojn8COh+vhzOvSHFRtFAL7W
	h7r99dCpFpyxqlW8Vh8rMRDViZY8KPc4zdvylzCX2g6m/6nSsLnQtN06sJW6z6hklBwkhnNrTL7
	Drh11qmO
X-Received: by 2002:a05:600c:548f:b0:4a1:a39b:e71e with SMTP id 5b1f17b1804b1-4a1a39becefmr211205525e9.5.1792040645631;
        Wed, 14 Oct 2026 22:04:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 41/55] alsa-lib: patch CVE-2026-90781
Date: Thu, 15 Oct 2026 07:03:04 +0200
Message-ID: <ebfe16a8edffc0c2a58b4d0bff831284fb7fcdd5.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247839

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-90781

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37d0e17fbb7848340169ba00ca8dee2567a68462)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-90781.patch        | 41 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.11.bb                   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
new file mode 100644
index 00000000000..b2b2ce84cff
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
@@ -0,0 +1,41 @@
+From f84cd4ced7b36fddb8e4ee24404cf7c091d27020 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sun, 30 Aug 2026 20:20:30 +0200
+Subject: [PATCH] control: ctlparse - another fix for one-byte overrrun in
+ __snd_ctl_ascii_elem_id_parse
+
+Follows 1e27d63ef6d1dcf7d1f1a1e1eca3ea779e7de377 .
+
+Link: https://lore.kernel.org/alsa-devel/CACBQ=P2FhO3M6dkv3cWuKb6Qhs92ouV+FJ3SJZ_PVBSSdJWRAQ@mail.gmail.com/
+Reported-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-90781
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f84cd4ced7b36fddb8e4ee24404cf7c091d27020]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/control/ctlparse.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/control/ctlparse.c b/src/control/ctlparse.c
+index c40de2bd..7132210e 100644
+--- a/src/control/ctlparse.c
++++ b/src/control/ctlparse.c
+@@ -207,7 +207,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 			if (*str == '\'' || *str == '\"') {
+ 				c = *str++;
+ 				while (*str && *str != c) {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
+@@ -217,7 +217,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 					str++;
+ 			} else {
+ 				while (*str && *str != ',') {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
index 068a727c67a..5b67d1cc426 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://0001-topology-correct-version-script-path.patch \
            file://CVE-2026-25068.patch \
            file://CVE-2026-56109.patch \
+           file://CVE-2026-90781.patch \
            "
 SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
 

