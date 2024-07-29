Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3095C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.55946.1722258796385511769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l8IAN9xA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb585375f6so2393234a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258796; x=1722863596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqPUfjKelwl9eRHuhD0F4azLW+bvAZ/vzLPKGtzh2dw=;
        b=l8IAN9xAHa3VdDkYzrXVXH9OV9qnO4G/eyTLKjC5weqrzhgeSJp6Yn5c0OJxdjqAMS
         7siPL5OvRfhH+bUfAzMdSVHYw0TPJtnRXwOv8r3Bcw6n5Z7rgS5zIyhAcpIHpaeO32k0
         wGUJCCtcNTLg2xJwptkspRcqrhMJ0DpqMQ7wnOLznYcR+A7+osDXJt9I0YKkpZ8ZSULW
         Mn7BVDMZ2UAk5Jkik6JiAjeYFZroOkaRPgWJNR4iDEYJAa8I0aNcGbzwZI0e/aPmJxb/
         zQM6Kbi8+J/YNIti2T/3RdjJtLpLfl70ngjausK7UawuoKpN4k/wzs0WvCU5jx7v2SL6
         +p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258796; x=1722863596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqPUfjKelwl9eRHuhD0F4azLW+bvAZ/vzLPKGtzh2dw=;
        b=prsSfEpBdIao9mEHImh0I+ubmkdGotE9da8u/lLYJwd7xJkwCDLcpUdV5Q5UDAH8HK
         ovzU5iUDumBNrkc5z80caC6L73pobYpp1o4yML8b1MoOzru/nOvFfqF5twj1hpxPQr/K
         alJGlX03N7j4My7UhbDiDcTXQHAe20rT2NQfcm+Bn1iwXkMwhLxrrCibW9fQzRTNcXFr
         8mnWosSEOvoqqmA+oiZsfKNH8XBoRDpuDgR7WZvWFj8UO6LZTv/bTp9bQc7B2aJMChMM
         56xUe1+nI/FLwLHzdvLMWs9Xfbq5Q36YpburqmO3pf6oI52fkEKKTapkL6JhKe1rUEgH
         auXA==
X-Gm-Message-State: AOJu0YxHXwck2WfbfYsxoJU8HBgl7BUt1iRhjpL++CxeMcepqxRCsGGe
	3kUPeCHRUKTp0K3mgfbzR/ewsLfhRxOh9V3fc9riLxRo6Pgnm+QA/JV4oR6aurkGWa4vqhcC/dt
	9LuM+4A==
X-Google-Smtp-Source: AGHT+IFc13EhtMQmfolzmr1z9m7ozkRXttQy3Sj291wLkOFXfB/or9+Wv+e1GaUn+9xcfXlAQXuMGQ==
X-Received: by 2002:a17:90b:388a:b0:2cd:ba3e:38a5 with SMTP id 98e67ed59e1d1-2cf7e1facafmr8113219a91.21.1722258795636;
        Mon, 29 Jul 2024 06:13:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/37] iptables: fix save/restore symlinks with libnftnl PACKAGECONFIG enabled
Date: Mon, 29 Jul 2024 06:12:24 -0700
Message-Id: <2c0d03ed7bb9c17b1c3ccefd00bf3a4ede9e291f.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202628

From: Kirill Yatsenko <kiriyatsenko@gmail.com>

When the libnftnl PACKAGECONFIG is enabled, the "iptables" symlink is correctly
points to xtables-nft-multi, however the "iptables-save" and
"iptables-restore" are still point to the xtables-legacy-multi.

So, when the "iptables" command is used it's using the nftables backend
where is the "iptables-save/restore" are using the legacy backend.

This is not consistent with other distros (e.g. Ubuntu).

The issue was identified when testing the UFW firewall with nftables backend.

Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6579e4333b74232d8b576c399eab88e37da881ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/iptables/iptables_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index cd2f3bce0b..0070264844 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -75,6 +75,8 @@ do_install:append() {
     # if libnftnl is included, make the iptables symlink point to the nft-based binary by default
     if ${@bb.utils.contains('PACKAGECONFIG', 'libnftnl', 'true', 'false', d)} ; then
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables 
+        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-save
+        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-restore
     fi
 }
 
-- 
2.34.1


