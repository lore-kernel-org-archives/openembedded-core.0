Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC26AC4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.943.1783881812352696955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=PlM5Iv5u;
 spf=pass (domain: underview.tech, ip: 74.125.224.44, mailfrom: vince@underview.tech)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-667627ae83aso3530533d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881811; x=1784486611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8Ra+c2c/+71vcH8FLpXN7E/gksKvCxuB6qKIJn3rOw=;
        b=PlM5Iv5uGiaUUyqvfg+2Ly1LYmqr7H4awmBwSpxuHQWcEaKHv2xY3ak7OvUFuNQ3b/
         PCfP8fia++lJT7TSCirBIUHLAK96eviWXmFMzUVxeO3KIiTlSI3pGCHOLH+qoEc0rvnf
         RNDGnWNbkdUu4LS9nF3jYLxiWJ7I7PgKwIRymxxDF8oK9zS2zBluqt4mfDZKwmKl776o
         GzuS/rU6L+RAL1I4HiPtTgs2FnNL6ufWLv586bzbdUYJcZqv2xZf9gH8LoJ03MgVQiSu
         /o/F/gFC4YtZBFWAWktcvKHa6FXuBXzr1yg+3U0xXkjQs72EpjD9lFSYKcOWWqwKyb3P
         j1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881811; x=1784486611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8Ra+c2c/+71vcH8FLpXN7E/gksKvCxuB6qKIJn3rOw=;
        b=PrjNRyxTAjOEVHdTo/ysa56mkJ+uORdM6O1VUEDSbwzaDmBxc1hHlxwE6jMiEV6yfH
         7ep/JzJ5uk3DTnHnKOy45nxrer/ON6W+FDuMUXVU2XgrDUOj8M1zkZTdzY6Pb2MhZLRR
         to1/FDzXDZcyp2TNVFq8rnvkSMjOmtA0Uu+ZnVXhrPHbz9Vqd3n4ILoues6hdqVxRYzZ
         u1zN0Ma6CPXJjZs67zFDtJjwE50qOAmJcE1z5qSySZJM99HX/zGFL+yMgemle+yDxXvp
         R5soIfbKCT0j52c/fD7y9GgjGu48787XL09pZnsF7kBi3ZhngAtvJ5lk88oUSRx3CeVV
         KtDQ==
X-Gm-Message-State: AOJu0YxJZrvBI1Xoi/G2fssUY0Ar8nMy6qNE0i1BvXcIRXN/Ucbv9N5i
	3mFPmF30jzg5Mxx8ypcUNMkhyIuF4IqLWUYbEoPI8gtJQwCir0TYEhmmJZtIke7FQ1x2e/zI16U
	urAhclGo=
X-Gm-Gg: AfdE7ckFb8tOvwTCPhj88hPd/nR4lyxOj8NflZJXsnobXMmlg7eOd0CXVI3zw2yc+0F
	rXRUe9rxvzCgKiI7Wxky4fGg5gy0zcnJ/X+rJ5kEI3qMZUcQCbe+HmrqfqlKm0Wy8ZmRNXlgmGQ
	QgtUdKIEv+9pQmEmmCAnArccVY7Mw9ODyYnPjzj7jsX6OHMCD7sMLv1Xqn78ZZN6UlnWDNikrzu
	xcAIqFuoeVTA6V1iPL0stfm+VCecjFg1VQel32OP1GzS0jrP94PZLohdxN0ZKhprGZ5H+dm1aCj
	Vcf6qBBR0OpT5M4qNrF8O1eC8avFOYh8eimlSMZ5V5PLlbboj201vn2ApdPqwTNGjaEF+I+JZWX
	h337vTFflDHv9LEWkBw2RCfMNoGSx/vgvZ07flK2jKE+2lti+pHJUyyIziOuckBs9Dcq24ESKt+
	hl3erwK581LLJbhg==
X-Received: by 2002:a05:690e:4395:b0:667:9010:2afd with SMTP id 956f58d0204a3-667d7adb9dcmr2655885d50.38.1783881811414;
        Sun, 12 Jul 2026 11:43:31 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:30 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 16/27] connman: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:56 -0400
Message-ID: <20260712184307.3259642-16-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240806

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/connman/connman_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
index e9873f3163..9c50d2b0b1 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -71,7 +71,7 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,ppp,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
-PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat,iptables"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,${KERNEL_PACKAGE_NAME}-module-nf-tables ${KERNEL_PACKAGE_NAME}-module-nft-chain-nat-ipv4 ${KERNEL_PACKAGE_NAME}-module-nft-chain-route-ipv4 ${KERNEL_PACKAGE_NAME}-module-nft-masq-ipv4 ${KERNEL_PACKAGE_NAME}-module-nft-nat,iptables"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables,,iptables,,,nftables"
 PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
 PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
-- 
2.43.0


