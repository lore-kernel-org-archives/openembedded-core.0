Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273B8C44507
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139211.1783291371055993670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TzWRGeCu;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso2509486f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291369; x=1783896169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nM9PWtGdrbkAFhyte1+x1sNtj/WAITW/qGLOZGvf3lA=;
        b=TzWRGeCuiTgnEiz8hKzr5DvtquZZpvHJAhOx6j5/Z2jOljx3V0J/4rqx/acw0sH7CH
         aMYQKxjRrKez4g8lMqXO+sdKk4R/0oq3tmssdor/aSGZAyxKEfa0qU8IxLwDeW1ZKLfS
         4zLhb3WDfEiMyV1sW2ONwx3JuggTv3VurjHPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291369; x=1783896169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nM9PWtGdrbkAFhyte1+x1sNtj/WAITW/qGLOZGvf3lA=;
        b=rCtKnQ/eYRigeNcRyMstiFsJavQ8MOsCFt4/TD1fnB9/DKKZfFqOipeh53vKuK/xdw
         ZciLH94FcX8P4jKda7GV35ZbPHYOQ9B1xjaDZ9Rp2c3fMcbpg1yPQw2dbf/4i2SQgvkj
         Y7gqkyhe+XUj8Z9Tpshd59WEK9y3oJkPVxxNSSAIZ86BPUQduss9r6m88fUnjCBsMfHN
         4piU3QKe2Qwq2/abjzMxWXmp3ThfB8js5OCCZbjpcZ/Toap2Qaw1oNCdIXxEKUYReHXu
         fBg76qO/SZNqDTo0x7g/b5wa1SgjSLL+jyktgRkIf0bMGW6XINTdZSBzKsgJCE8Nv2JY
         ibYA==
X-Gm-Message-State: AOJu0YwTrZn1r1PrJoaIYV9L0MUZZEkYawlzOPRS6DE9FnMSmJojyzu/
	k5jEN+IWY8sgJ9+xv3ym/+GlehB63EXI3VovAK5DbVXSZL2TLkl1Tm9T7mASq29KBEK2qBkE0lH
	fohLCosc=
X-Gm-Gg: AfdE7ckOEpiwXmBHJOITUGtQgMiG7WngUWc5yv9hK3lm9bSSWLvDgRuGvq3FdE2GsAm
	//v+yA6qvx0iWYigMP5oNZxBnA4U3FZTmsukzHRjOVBzGp+FZZxpygo5zIWZeiaxTf4z113nWH9
	UCJ6e4SqDwGgyxcslBtYXss/MjfzUAwRQ+kXEv2jyKtan23t2QdwZcKWrvjqMlSguyZCPCZcHCs
	Bvg7OYSJbik1/yiiJbz82H7eh1mYckjSPeo8DGn/VPtzcydYRqDoGAsle0efizIhSfTP6lLf+Nt
	YDsF7WEuYnFGe2OfqNGZa56ctCA74s7nvv87XWrI8V5eSPzC1iBnkP9VTIPBaXEbUAtLMSOtRxF
	iQts2GYGV+InZDlA11zaptzeLbgyVEdqEG51JTJSpE4CNnNVVEqfgce6Bc2wRO/7oJ2/AOisemk
	EBzSZTQOwTseZmLCcnlfjQJOh9Nw==
X-Received: by 2002:a05:6000:4611:b0:470:6dc:848a with SMTP id ffacd0b85a97d-47aaa13ebc7mr9184833f8f.2.1783291369293;
        Sun, 05 Jul 2026 15:42:49 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/55] libssh2: fix CVE-2026-55200
Date: Mon,  6 Jul 2026 00:41:03 +0200
Message-ID: <c45b1b6af9088c5711c369dd9d20c8c54c4f32a3.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240167

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55200.
https://nvd.nist.gov/vuln/detail/CVE-2026-55200

Upstream fix:
  https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
(cherry picked from commit 42c8c6ec3066dc47b9eeeba0247ffa927193abff)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-55200.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
new file mode 100644
index 00000000000..9a71277cce4
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
@@ -0,0 +1,36 @@
+From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://github.com/TristanInSec)
+
+CVE: CVE-2026-55200
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index e1120656..d147505b 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session)
+                 total_num = 4;
+ 
+                 p->packet_length = _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+ 
+                 /* total_num may include size field, however due to existing
+                  * logic it needs to be removed after the entire packet is read
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index e825c8c5bb8..5ffc40b8fcf 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            file://CVE-2026-7598.patch \
+           file://CVE-2026-55200.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

