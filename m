Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EC3C44509
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:54 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1286.1783747485921792491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=MyJTRZU7;
 spf=pass (domain: underview.tech, ip: 74.125.224.45, mailfrom: vince@underview.tech)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664c535f1a0so2787534d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747485; x=1784352285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDRjw1RIhuL8fBNdhtSnuhg1jIVlDPax8hHttcHLPUc=;
        b=MyJTRZU7AEWzOS/KEH6AyX4AK2DdURnTh450e/wG3CiIEvbot6o2GsTfGEdWUD8hdb
         cjNr2I/KYemHHbCElzAtXthD9jmTHbNZnIBxqnP2U6ODEzGskSn/Awn/CPB+sMQmc78A
         PNXp8CmMQa7/+nQaRPlEn70R7oTE+6SctA/oVR7qI/iWATS5u+H5evrXQlS7FbXtXLal
         oH9P5cQIf2+yvbm36UBxs1CCR+jHA+ySoNxgmoRlMk68/0afDpk9ZDZT3RZMmg+/JqW9
         c7jpeFVm/wdpNUH9Atym7LMWKgGKGo1EGbHnNDDzEb1f4jRyTgtTAjETQ5zbuNYuqFyh
         GoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747485; x=1784352285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDRjw1RIhuL8fBNdhtSnuhg1jIVlDPax8hHttcHLPUc=;
        b=q0YpynqRxUMfzk8mGCrNsm/tja/qWaa2Cznfd76+NKSYYRrybszRMAr5u3mvbx6g7u
         e5rWyn37aDRKLZVjRel5yM9bvIvLgjrnwB8ttFh9DTGletKBzwDN5Yrsy0T34zwffK7W
         1l4fx1irVOEy3HWT72OuhbyTnmiKLCrA8WA1JgQvPrRaYIGmBWDKsuLpSdYkecqkzB1l
         8d7G0xNNS9KOEV1AUqTvLL2pnLlBkeKvYdfhGZlBumLiATl7REVPyVryv/Wcg2FLhEEz
         I4RJ9XIvjGQqrRGj8aXC8iB7bbMe9b3D9B/kGgB08Gb6mS5hm4ydjPSgtvdl6xH+2Qq2
         f0zQ==
X-Gm-Message-State: AOJu0YwohANRp1V2tYzOGdjkbJIwZP9qXVIDiYm1PkplC0RdXPOoqO52
	JyYjAK5ryugupxpSZnKUgMp5mRxhnMP/Sh1dSbW5+lj7JYNqezq+9YMO0wObbMRZunUgrkOrrgz
	4H0caMSs=
X-Gm-Gg: AfdE7cnDLO67i+3+o29+ULD9X94gn3zCuYgMLjoKY+xl99rTarqaJnscLZl09Ecs4Ya
	xiM9qnvmx7nASw/U9RS+7LJQJNSdpTC/H8+MKrfg3U0XgoqLG7prW6HRQQVjqsUweuzTBFDOi9x
	OukIQzcTHU40CufrOViUZYgIT8kWoWGiH79QACBWdvbnS4nKY+5EZTfkbTV/jKaH/9O0kyV7ln6
	IPpvzpeSEArf56Wj3Qf1fGEnQwGO/fSa76ENVJJiGUeXks37rKpikiZkLwkbaJVJjlW7i6n8lmT
	jmqVW9vE803an9Lz0eLYcADo58/B7PTU6L7DQqyAr6WlIzL6CEQJw+o1RfJVJkHXunRQayYnEOF
	IYBQon0tPy6ADRzknzBOhuqbQUtvZ5il6apTqGlE87crqWjwrFVt2eELfzeJWcd/18I0KmEYfHp
	DAfaX7u5x6U8bsSFXBLSdOdwYy
X-Received: by 2002:a05:690e:251a:10b0:667:8b90:2ef2 with SMTP id 956f58d0204a3-667d7f39d7emr1252754d50.109.1783747484997;
        Fri, 10 Jul 2026 22:24:44 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 13/19] connman: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:57 -0400
Message-ID: <20260711052403.1292286-13-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240694

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/connman/connman_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
index e9873f3163..4f60e089e5 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -12,7 +12,7 @@ LICENSE  = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
-inherit autotools pkgconfig systemd update-rc.d update-alternatives
+inherit autotools pkgconfig systemd update-rc.d update-alternatives kernel-vars
 
 CVE_PRODUCT = "connman connection_manager"
 
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


