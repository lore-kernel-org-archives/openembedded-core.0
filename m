Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91AAC44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:40 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14876.1783866579722415791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=KDD1Vx6p;
 spf=pass (domain: underview.tech, ip: 209.85.128.176, mailfrom: vince@underview.tech)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81e771226b0so33246587b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866579; x=1784471379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8Ra+c2c/+71vcH8FLpXN7E/gksKvCxuB6qKIJn3rOw=;
        b=KDD1Vx6pYQsYQEv5SyQoR4nXW8Mkjd3hlEPrtEuAtMQnkczphic3JIEKmrKlz4RKdT
         hhTgclNuXnqGkBciYOS9T8siGJlS25EcoHIkTw1NNB6m0JCBVJKeDsdH2hPVZT19lXnf
         ywYn60NRrQSYGMNW0Grkjrv80Lk5FYoFiKfIj7OV1rxfkSTd0ubFhKpAuyWx5V5rJy+J
         7xOhzNd67axs7YnpB2GH+M24Swl3841i6ICvTVVX45M8YrTNjA/0ZLON1SqVm+/l/tF7
         3aFdQnumXSZ7saT6vmdm8TgX0nmhepPyLcsqnxxDUgfUpcAEJPeCO4XA0H98Y/F3gT+m
         OPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866579; x=1784471379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8Ra+c2c/+71vcH8FLpXN7E/gksKvCxuB6qKIJn3rOw=;
        b=gutZnzDqSvYjONCY35k0fRXDXw5yMZFI53FCkPwbawmoce9rrgu6LEO8M4BfTXyces
         UZxYrXnIyL0PUbLv1x78CLxv8IQbqYQgGUAMBnoskRA4+5vdPndTy4osDADHUZnUfoXV
         J6YAvN+4ZhTspz2rdB2A0akzxpwJi+u8kLv2A033dVOuSvdTl+pz1ITfSyl026lcHwg4
         DMez4eMQyBnubWlswT5kSzj96LirND88o6t23xZkGcggzTZGiDHRE5yxGEs2Z9vu8u0k
         JUKoKY0yVcX1PlUpI2lZ+hMCPLcZPx+vgXbR4XAqPzZp6GLlMluNRM1fAwIqHkxwE8iC
         EAUQ==
X-Gm-Message-State: AOJu0Yxd3kqKwwiu0yZ/1WORhDpbg9LH5D5wtXF+vxKuhN+LekSQi73b
	it4pFFlvfb0I5+fm6+qC+54iHfvwtKATHhP0cLgvrkhKMGGq8zJAma5fC8D1PPSk94HlggetmYo
	1KPVQdMQ=
X-Gm-Gg: AfdE7clleX2wIB7dJ6kHRbc+hOsSFG8tE48C+6auyUio1uEEBPkwNvToHWDuWntI/8Z
	s/Op41jCjlgBzwwkPozLRe4DLXpdkQBu7hAo/dQV9SgPHgfRpTS0RHpofSk3+3zhIcGrp0WJy00
	M7SLrFxjbYuuETipVThldIQtohrtsZ3kaZ43BHzkFlYtpvBAsSIY05E7OsMjKJ9c5u0uyIRP2K3
	gdS9K+mGZUbfjllULfslOaF0n1VEfe2MSuxVANGm2/GiZ26n2CZ2BeEgJ490GItYOmPFi2FDoie
	skySjCMFiAFsjuB0s2d2/Zio3heiSP6eLkSwz3FPt3q2j6WDux+EViw8ylm7fpW46KHdTMrwM2D
	lU1abXMdnw0v4kvmjxP6jZ+ljqeeZ3isIPsK69qNI+haUfI5PkDbLT9iWQzV83Qrb820juGAAjX
	1kLzj/qheoABZ0pA==
X-Received: by 2002:a05:690c:360a:b0:81e:67e2:f75c with SMTP id 00721157ae682-81e900914bemr42582447b3.32.1783866578696;
        Sun, 12 Jul 2026 07:29:38 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:38 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 16/24] connman: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:08 -0400
Message-ID: <20260712142916.2573370-16-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240782

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


