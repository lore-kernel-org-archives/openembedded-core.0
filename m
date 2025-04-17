Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BB9C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:29:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.601.1744860573798644976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 20:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gDDo9cRV;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso1822035e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744860572; x=1745465372; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9LNJukVFoiwnCY5wBsDyvksRZd+/pIMA5iXx8ySR08=;
        b=gDDo9cRVR4AzPQA0e/1zFutXcnphl9nQInLTuASG9aQwikbLhNU7tv9EtjSgBZHjdm
         GZo/KkUXEfc948Vmr+8SIxV7+/KZuZer5JSpVRLbRCFN2t9rWzDvP3688rZrb2YXKaOZ
         9iQ6pwF+phDtmwnnW6D2A8FbHRqdbQFc9QkTPwiV5CsMaOXS+spRHT7JpaPomhO4NApp
         MJ5GaYLwfcjuk7dmmPKe6Ii6Tg/EVQxq89tfSC+m7lxmq83hZr4YT0fFQ6lSYE1g2ozx
         ehWeeIxJ8giwaTwCla+fXBFe+IZh//AkD4UOA+yfHgt0sYPdvC0upZCVDld/6KUjIcyF
         BkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744860572; x=1745465372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9LNJukVFoiwnCY5wBsDyvksRZd+/pIMA5iXx8ySR08=;
        b=Nmr1niTdg/oxdXrm1fNeTlhmOvVj9DEajl7lT77eIgv0gWjkftjpBYk0+wm3DayqGK
         aV7SLtT81QARUiWi3qD1WsCD8DTJA/pa3JhaZkHLmZcZdCHPjTiaDyeQexYQIOCHpQwi
         lnioW6slzILl3xDjUq1gCJCyHBEZr4Mk/ri34b04fykoCzlXVnKhxLrz98JO8LxSS1E6
         N0xsGRB+icQIkh37TJ1MSyQq7e8SrZbcxIAxf7FzIkEMx0Kw+BlBc+RTsqd6YIScu5dN
         iQ6CWw2vNqyfhAxG8n0OGeXPB+z07PASfe05pqi85oY3FpI2YjRJMHvWNVG8Cf6vJGTs
         o07A==
X-Gm-Message-State: AOJu0YzIE8NNHEFpTJjHt9oFc0+kmMK7A0SowJSHtKQ7QJc3dGqYSTzy
	cg4Qf5yx44LzyHjVEzT7PomK/ek70MYVeUCM68SnrJWT+j4Aano9gj44hG/Q
X-Gm-Gg: ASbGncv4kGILqhdZB82PgCHC4wFPGGhrIDaT9mNkhjFjPs1hWQrjyuvz6qnsPHYQ331
	5bGZMYnreDnIOqWF0+iIaeYZaQXQyqLVkYUvSJzyZ1Ib1d7rIGlphiSfl7qldEru6iv1SWhBmIb
	pt0qKyY3hA5XjFXoFchLOwLhabVd+mgpx+SdzsR6SVs/liEz3IvFg7psdgJvkKddj/ZeyogJrDN
	A6IAHjWVHl39sbe4pT0Ll4pxUOziIl/rzkpI2lRBauC41zf/cMG4zh/APunhy3c0mLruv0jkt5U
	qsThKzdPCAZR+qZ9qSrwJIcdlvnwuZKUB68D8gZEpwy8wKUy6QGje3F/VKpCxZL3oI9AJXk7JP+
	iPA4t+hrL
X-Google-Smtp-Source: AGHT+IEtPYn/he4VXMP4jageDyxW8WJpVI0mLGbDHpp1vJR9JHUzXStcbvdJ8hXTadhebz1wktK2Fg==
X-Received: by 2002:a05:600c:8716:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-4405d6366a9mr44410015e9.18.1744860571876;
        Wed, 16 Apr 2025 20:29:31 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm18713620f8f.76.2025.04.16.20.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 20:29:30 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 17 Apr 2025 03:29:17 +0000
Subject: [PATCH OE-Core 4/5] connman: Mark iptables/nftables mutually
 incompatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-connman-fixes-v1-4-160b2b811116@gmail.com>
References: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
In-Reply-To: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215036

Only one of iptables or nftables can be specified, mark them mutually
incompatible. Drop the RDEPENDS on iptables from PACKAGECONFIG as its
libraries are automatically discovered on the main package, with only the
scripts required as part of iptables/ip6tables-test.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 3ee2b12b7ed98004acb8af89056409344e3351dc..306d54794fefb2142dbcc374940365076c48079c 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -69,8 +69,8 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,ppp,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
-PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
-PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat,iptables"
+PACKAGECONFIG[iptables] = "--with-firewall=iptables,,iptables,,,nftables"
 PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
 PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
 PACKAGECONFIG[wireguard] = "--enable-wireguard,--disable-wireguard,libmnl"
@@ -167,6 +167,7 @@ FILES:${PN}-tools = "${bindir}/wispr"
 RDEPENDS:${PN}-tools = "${PN}"
 
 FILES:${PN}-tests = "${bindir}/*-test"
+RDEPENDS:${PN}-tests = "${@bb.utils.contains('PACKAGECONFIG', 'iptables', 'iptables', '', d)}"
 
 FILES:${PN}-client = "${bindir}/connmanctl"
 RDEPENDS:${PN}-client = "${PN}"

-- 
2.46.1


