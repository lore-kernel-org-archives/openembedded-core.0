Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC07E6FE37
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108971.1766524967459194331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XMpBXuhX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d5c365ceso68134715ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524967; x=1767129767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbO35VawjlqVBJbM1+QliAj1gdWADzw9fxg0556y/ak=;
        b=XMpBXuhXDgisJMyi+X0h3Vpzq79U4mSQNb/2f36w+S3WbTegHujb7PDoyp+zLaaoLx
         2WpjnQNOptG09bCBIlj3wGRbJ/3cOzDAq8UoTg38MGRHu3Rer6g/pz0sCTEhQhBvFvOu
         EbJwtizNF5mkwIfG2Byb+zX7GwdDB9zNuR3RWsJKs27nX4rihnx6sEtObdXM6Iqu5BZA
         HP7TVF3p8B/F7zOoCwYqNoXBHKX/TPoKzlZX8Dr9ZmdZgOWTyg7h/5qutCa7YxHd8wN2
         x6g7gMh+Tkfs9+cXgyRZ+eKYLblPISBynthDDAk8H9rpZFhXU22K/AIpMput5O8McoSr
         07Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524967; x=1767129767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NbO35VawjlqVBJbM1+QliAj1gdWADzw9fxg0556y/ak=;
        b=rZ88JRTon3NUWCzYp4q5fESh6+bPxW7iMbhjU9Zod+7PD0NYeyFXG+654xgZ8CfrFr
         PyqrDMcxY1RklLGpm37sdUkFw3NSUaF24k5IQ+0UXTWMONO3oX35bw0vIR7fiqSQs11/
         q0qwcoCQMG2w9f709qQt0zkgyUsPaw9C2uuOik5VyUmk/NqrrxlFzcWgOn+FrlhI+HZE
         W1EuMqc8z/4K63mIKVZ2An2clso6tWtlmPrwnko4jT77tUP99PnPGY7opMKob6B24QbJ
         wLjFcOoJu/VRBypMYDxKucyuLTgTb688DIuwAF5fBcLWac+y3801rOraY85ALIZiy1rw
         PA/A==
X-Gm-Message-State: AOJu0Yzt6dF96Oc0r4VcN7eRynMRKAPb1q8GBarx8w9wXQUV7vlfHMB+
	yig+HgQ48EePQ7175n0bYATmiZQY3veKQCe2Hj21qHw04uwPQs5ELLshi2ieiCW3lszT9bGajPI
	DB8A2
X-Gm-Gg: AY/fxX7Cf1l8EMJTMg7bUtr6xsfItFxw9ayDQ4BuceBkFiobjl1oEWbAAmKAmHSgqQ3
	B5f0u45tFZf431JILWPFxHsszmRldBO4MIsaazlHQF9Bnv+V859R+0RHj/u0rfSlrSmit+OHTLt
	ZsnuoEVy1vOXt0yoIUtcWOd6yx6u8J2qqkLk8lnYjHKzpyY1n3ZypqM37NzikGh1f4rbm7isGuJ
	BLSwVqIqDrkVuyMjqZuytuouqUDpQtEL1T0jTFYT9+iYjA5EePHoVmJ8RGDKE/cMhQTNGQEVYmq
	S3UpdbOiakfQwnqV83B7eH7Rjtoi2MzonCstCfD4lxDSlaLq+0ShKHLBeLX2OOZVB/TBYfFSPqU
	e5JWQs8vTJ2aykcmiumo6X//AEX1vT4LkKd80g7mPeKho29PSJL5lH4kuulXG6xCSXAXRG0BfBR
	MySA==
X-Google-Smtp-Source: AGHT+IE3mE0wu8OmYvs1tSF4X0m8hOprCJQveg8RtxkjEndCUfHFNJ87d4ZDx8YwJG0PdreeKeaTpA==
X-Received: by 2002:a17:903:2301:b0:294:f6b4:9a42 with SMTP id d9443c01a7336-2a2f21fad06mr128665845ad.9.1766524966744;
        Tue, 23 Dec 2025 13:22:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/18] qemu: fix CVE-2025-12464
Date: Tue, 23 Dec 2025 13:22:10 -0800
Message-ID: <c3108b279bd5c49a3c0ea35880fe7fd4f5b75b96.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228478

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2025-12464 for qemu.

Reference: https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2025-12464.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 60d372fce0..dde3b0be13 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://CVE-2024-8354.patch \
+           file://CVE-2025-12464.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
new file mode 100644
index 0000000000..6099fc79cd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
@@ -0,0 +1,70 @@
+From a01344d9d78089e9e585faaeb19afccff2050abf Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 28 Oct 2025 16:00:42 +0000
+Subject: [PATCH] net: pad packets to minimum length in qemu_receive_packet()
+
+In commits like 969e50b61a28 ("net: Pad short frames to minimum size
+before sending from SLiRP/TAP") we switched away from requiring
+network devices to handle short frames to instead having the net core
+code do the padding of short frames out to the ETH_ZLEN minimum size.
+We then dropped the code for handling short frames from the network
+devices in a series of commits like 140eae9c8f7 ("hw/net: e1000:
+Remove the logic of padding short frames in the receive path").
+
+This missed one route where the device's receive code can still see a
+short frame: if the device is in loopback mode and it transmits a
+short frame via the qemu_receive_packet() function, this will be fed
+back into its own receive code without being padded.
+
+Add the padding logic to qemu_receive_packet().
+
+This fixes a buffer overrun which can be triggered in the
+e1000_receive_iov() logic via the loopback code path.
+
+Other devices that use qemu_receive_packet() to implement loopback
+are cadence_gem, dp8393x, lan9118, msf2-emac, pcnet, rtl8139
+and sungem.
+
+Cc: qemu-stable@nongnu.org
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3043
+Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2025-12464
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ net/net.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/net/net.c b/net/net.c
+index 27e0d27807..8aefdb3424 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -775,10 +775,20 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
+ 
+ ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size)
+ {
++    uint8_t min_pkt[ETH_ZLEN];
++    size_t min_pktsz = sizeof(min_pkt);
++
+     if (!qemu_can_receive_packet(nc)) {
+         return 0;
+     }
+ 
++    if (net_peer_needs_padding(nc)) {
++        if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
++            buf = min_pkt;
++            size = min_pktsz;
++        }
++    }
++
+     return qemu_net_queue_receive(nc->incoming_queue, buf, size);
+ }
+ 
+-- 
+2.47.1
+
-- 
2.43.0


