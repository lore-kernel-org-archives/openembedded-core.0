Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3BDCCF2C6
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4399.1792184155417043981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nTf3j7Ch;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: oo.hehir@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so405920a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184153; x=1792788953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFDSI5MWwc1WiEvgx1yW8wnz9bkGttMHMHTyDy6i7mU=;
        b=nTf3j7ChDqinhZb5WZidlxyCpFdJxteM8be5yNAgiWbBgRxqs03tgDgBzz/ggm+UUs
         HmuYStPcREJxumKKRE3CoLPlax8Al8U1vFSzXvqDPI/tjems2OFnej1FaUL3Al3/JxMI
         o12GU57iQolu9q8K1UMSbFcgq1NNPtHp/Nqm/e4M67UU1RFfz4OgcgLCCliuClkXJM8B
         m48K/AYggaI9w5eqO9UVCqKwtrjatxIHUTT+Y6bNR2OswajjiJqwI3yWkO5kaUoAm/7g
         5vTw+l3ZJIgEXLUSKdbQFJoyBGaaO9caaXobY0XIxnZ31s4j/2eY16NukGHr5kIHgXy8
         HxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184153; x=1792788953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFDSI5MWwc1WiEvgx1yW8wnz9bkGttMHMHTyDy6i7mU=;
        b=ygu8YjDAL1r5LXkiLLtVt9l2cPaDhVzNjH5OIuSL9icXMC4jBSEx75riKJqPLwDKt9
         jQylLwjcfpLAoUX3aXzJXmxTl7yoayfEbtzh8tm43OhRa0ppK+GgNlTbRTtt8+X4lvOS
         WNwox1m2vsPfbLWH2cMpI9Hw6oAk+/ADUdpEtmrzj5dXWfsCHN5V8fgpxNJpBXaaQlrT
         G7nls0MtDvv+0S4CQ6DQg4Ku1zh2u2Y4LhICXDD6+bV1HVOQ54RLAtDfjnl8dpebikQW
         BT9I0susaLaRRip9CqIUxWis8LsAtZOTNACRklxOVs9mbAfaMF1ZaITx03Ax7rYXc9uQ
         1iYg==
X-Gm-Message-State: AFq9FYI1oGuSKRX9gzzSfzWmWigO/QJoPs1rUPCRX75pB7EwTz6SL2x7
	3Cs37jL0N61Tlv1D4dQ9OjhEC4OkdydpB+sdNUIi2q9PJcordqfMVgBIWqVuOQ==
X-Gm-Gg: AYBFou0qnjSr7ivRAEeNJH+m36T2kqyZtqC8XLH8f33+rnkDxljEFCqxNRes5HFmCCK
	4OqdhtwjqBT5l9VrP2A1cDXfvNJ+7oV3hb24P/VJwjIcAg/uAARD68klSqUyyJ4ZF+zV0LLFzyx
	dv5CZGzz2fWsNnd6cU2z87Dapnv2awbsDvnq0HVyzvCQfnLCISrl2o+0fBPiCyg5xF9HLv1pAD9
	DxvlLdi5PvTchxrBuKia2qHfKibDiez9XYGPJe3xv535Bjsm6UJ46H+wQiCFDaUGtDfN4vXRwTS
	DTFbs2x0d2BotXDy1ZpaWRCO9zAHtg32smAfLlswYZdd5XJhLMbVSjCtUcu5v7NgvYu4UR/gf4K
	/hZYFpTrOYEwdPMECCGl9z1Oyn0tkn4SngeL3m/C6Cb6RaD29+gVFX9aXnQ4v/MtDz8iWz4Rwoh
	zGH3SQJIqhoD98fwJmACFUMg9+eRDRbHDCrM8/o4eZXOSSAQtDU6TWWzY3zvCbWp269dF6v2jUq
	l8=
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr18880805e9.20.1792183656499;
        Fri, 16 Oct 2026 13:47:36 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:35 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 2/7] ptest-packagelists.inc: re-enable strace for riscv64
Date: Fri, 16 Oct 2026 21:45:31 +0100
Message-ID: <20261016204547.2328847-3-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248049

strace was parked with the other failing riscv64 ptests in 22736c5281 &
passes now. core-image-ptest-strace on qemuriscv64, with the previous
commit: 1081 pass, 0 fail, in 24 min. On a VisionFive 2 (JH7110): 1212
pass, 0 fail.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2bd11b1706..5e99b59d4a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -167,8 +167,8 @@ PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
-PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
 
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"
-- 
2.43.0


