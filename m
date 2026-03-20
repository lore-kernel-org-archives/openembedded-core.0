Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5981099B56
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1900.1774048048397779500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hGJJRYKu;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1857542f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048046; x=1774652846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V+OisQvw5Q2WIBuYxO6FTguRr4wpRQoVFXAAZUiWhs=;
        b=hGJJRYKuE3aKTLRFCUiCbmEjm1bQwvbv4OVc6gXSkq+KwuHLUtg8Pczq8VgohCSwrg
         PHvdWIM3nYlFCaI0DYtxKBZw/3VswQzoKp6UYU+df5ffecca6c6AXDSoWSmv0Tg39kyd
         Qx9lqXCTuj5wkoNLUQshRWpb8Udm27lWnHyoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048046; x=1774652846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6V+OisQvw5Q2WIBuYxO6FTguRr4wpRQoVFXAAZUiWhs=;
        b=EtAFTwOGmni4JCDo2mZURINwDTPN7Fg5cgUEAuXspRBtTZOHZwscGdIbwfzTyVV7XQ
         pKVhR6INGJFHEXldAP1J6ZLd+oQX8ErsLgwerMUEpqn/ncEdJM1g4nax0nb33N/INc0x
         BGBxXxeJjmoumsO9kBVOvQYCt0xD6IUZMKvCYfB4ybFEcNN82jTMtYBJXsnfp9yoJjzB
         xpe3aOwNdTiCa4f9kyHbmz7tZg+ZTmbUelivLcOANfGcH48CP5pBSRM3ZHXYHPyB5TEu
         vUfmQPNSZpbI0Krpo139IuhJyiQ3oRCfmfBjdUc4kIB9GfBt0A+vHsN1wKDMSh7SF4tV
         f2dg==
X-Gm-Message-State: AOJu0YwTzsEVMz/2VIQijWprzgobS7Vkp6WGgFf36fS3uPw5mPcKYBC8
	Uei7zAF7jJwpVbya40KXP9AMz3AxGysXS0wSPYZnKp3HUwCyEyV/K9DZBVuqakWtJdu/H+fpidr
	3zSqq
X-Gm-Gg: ATEYQzyj7lQoA57qBXHEmgacPx8L9KaGFuYOU53++sf6uU5IubHUlpZxr0TxQdFvUeK
	D/M6OngamptxNLdxWlOYY87Rw5t2I66k7JXDT/SOCkJaD5SL6mPcLuByXdXMdQK2jjg1rV+JdYE
	L6+lmFiqqkq131z1Z4Yqpv3TO/tkvKO8d1gTcgSWCYRP/zPa4vU130jwzecCM5TgHIgH4gCPyNs
	Gzg5DJVeLTqU7G+XfkyiSp3nG8cnWkDTtZaLsnFPUwdKAIuKuJO0odwFv3o+V22NYamT8uzgnEf
	oEKQ38mcFKqfxD+p/h5vnylxXYYQAr/uJE0siAYzRzyKoa3a2GE//m463tEkzqEnEH/JGh5x8/j
	E648dN1s2QIg5rYOfFDkNhzEMd0Ci0r2qtVBnzLzrjHOMV2oPsxhgIiVEv2VhJeDQr/h4KT2G1w
	wblgmrZ5Xgs7Bs+jjZ+FqtBsmjSIzsnCn9qk0dRDa1vtGi9pFX0h0zbz1CJBVkyxaemy41fROkx
	DHOvnG8nM2pbrJphzJlO9L9HZo=
X-Received: by 2002:a05:6000:2c0e:b0:43b:3e40:222c with SMTP id ffacd0b85a97d-43b6427d657mr8455299f8f.26.1774048046452;
        Fri, 20 Mar 2026 16:07:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 1/7] inetutils: Fix CVE-2026-32746
Date: Sat, 21 Mar 2026 00:07:16 +0100
Message-ID: <46a29a287dffe7ee624e15b6659235be1c58c5ce.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233637

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-32746
[2] https://lists.gnu.org/archive/html/bug-inetutils/2026-03/msg00031.html
[3] https://codeberg.org/inetutils/inetutils/pulls/17/files

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
new file mode 100644
index 00000000000..dfab82f01f2
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
@@ -0,0 +1,40 @@
+From 6864598a29b652a6b69a958f5cd1318aa2b258af Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Wed, 11 Mar 2026 23:06:46 -0700
+Subject: [PATCH] telnetd: fix stack buffer overflow processing SLC suboption triplets
+
+Previously a client could write past the end of an internal buffer using
+an SLC suboption with many triplets using function octets greater than
+18, possibly leading to remote code execution. Reported by Adiel Sol,
+Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg, Daniel Lubel at DREAM
+Security Research Team at:
+<https://lists.gnu.org/r/bug-inetutils/2026-03/msg00031.html>.
+
+* telnetd/slc.c (add_slc): Return early if writing the tuple would lead
+us to writing past the end of the buffer.
+* NEWS.md: Mention the fix.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af]
+CVE: CVE-2026-32746
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ telnetd/slc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/telnetd/slc.c b/telnetd/slc.c
+index be18782..3434829 100644
+--- a/telnetd/slc.c
++++ b/telnetd/slc.c
+@@ -162,6 +162,9 @@ get_slc_defaults (void)
+ void
+ add_slc (char func, char flag, cc_t val)
+ {
++  /* Do nothing if the entire triplet cannot fit in the buffer.  */
++  if (slcbuf + sizeof slcbuf - slcptr <= 6)
++    return;
+ 
+   if ((*slcptr++ = (unsigned char) func) == 0xff)
+     *slcptr++ = 0xff;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 29a40143a28..9892507ad9a 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
            file://CVE-2026-28372.patch \
+           file://CVE-2026-32746.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

