Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00676C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:49 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9506.1783835505240795225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=AgDeX8kM;
 spf=pass (domain: underview.tech, ip: 74.125.224.52, mailfrom: vince@underview.tech)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664cdeab266so3503729d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835504; x=1784440304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8Ra+c2c/+71vcH8FLpXN7E/gksKvCxuB6qKIJn3rOw=;
        b=AgDeX8kMTDZZJFPoSZhRVYy3JrvpDKTT8GVBSsEa0oyqbDWHAY84nve7Iv6TvbStS3
         9GdJw3yeF/WAb1yKAgKs2Gb+NkrHVcHvCzAzMmPxLS2TfZFHssnTlnTH1So13SrincEb
         GvnuuGRuNqyFRphTlIqX5Cijnb0gmpeNy6UVUjjW6icIV1F0XjVCEn7ek2UfiKCJwMHn
         PNOSLt0fbD5OPcmB696+kbJFRqGb42rNkfFXoDJbrQ+4Zwk2fI4KdpAxDsbeczjnBWzR
         8LQW913ZolTNxhO2FSHleRn3xzLPjYXR67TEpU0mhWrI7WkckX2NMhU9Swr/gsStMLAr
         4Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835504; x=1784440304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8Ra+c2c/+71vcH8FLpXN7E/gksKvCxuB6qKIJn3rOw=;
        b=FhnbZRB2n5OEV3yZkJYr6jcf4aJvq7NK+Zqc4Avd0V44r4WxIkYNwHEJkrZc+sPjOF
         FnDcPyTEMo9MMV59y7zWdJqo0Cu0EnW3DGwl2bJ1Q/O5+Gv2UFmi7lD6Yf8qTY6Idfzr
         tIA2W9+IeFbiyTMpPm/Mmrt9JdoQDwvSUNB86WEvnpn1vzDTF2dOo7xAUwAHEhJAeTp7
         v6FPgRRKDMoc5uVHr4IDuEjnfcyXqqhzkytBvVizeovJ1neXmmXQyU/FJ/pFt/cfuKdj
         1dcocEcva3JhqVuMb457Sno30KgSyoFRY21RMuDQ7AXv5NU/1InaW48svHShSBvF12sc
         o/vw==
X-Gm-Message-State: AOJu0YzGS4122+8bT6/Qd3meiVzznp7dkMOU4NnD0PsFMnHJ9cqMDs/j
	9q7q9txtodzVBO6KE+hgwi0vSr1Agtq61DS8idfoFTIJSyxF7kcl6P24xAi8799T/cJbj1zgP+r
	2QIVKrwM=
X-Gm-Gg: AfdE7clau0hkl7uuN3rEheunNoepWTUe6j9YW+ZDTazVSZSUfn15thB4fTvwu2N4+MI
	61e0SZEnmnQOXrf+h2xseQu4P7CmAk7DYLhUYNEVpOCK4cnpIto+FojS9ddeXIjwTd46Eux2a02
	anKkYNQ2VtnvC2AtXPNEzRDsCvoSI/ig8I945ZDnsx8FSZDVYtE/FdBJwMoNVaDDmkp6ehMy/i4
	ajgL4AY1b4Y3H3XEgCGGFVdZJZnRTFv5S0iXJqepEb1vly8XvZnpAuJxoNLVBIiKo+Gfyjmdddy
	42OaKaZdJg7omKT5T4gZ5v+3J2Rggwcid/AzlYWUIkevfqY2LwXXCOc/lOZAQLs6y/x8YMmXJZj
	Wi6HtEeJvMgu69YlRHnE2DU8AencazWuQXPf5npL8mrNE3itX368dz/aoxITmCr4/h9POz2tCnD
	31rppPMHhUeEw7JQ==
X-Received: by 2002:a05:690e:d48:b0:664:d494:f9eb with SMTP id 956f58d0204a3-667d7c5420emr2904549d50.65.1783835504267;
        Sat, 11 Jul 2026 22:51:44 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:43 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 16/26] connman: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:44 -0400
Message-ID: <20260712054954.4063745-16-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240741

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


