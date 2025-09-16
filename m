Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCE4CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:18:05 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.21271.1758032276598119185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1/FuQEgx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so5091927b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758032275; x=1758637075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGA1Lv2WKqwDf+vZiKb4SWv1rkAnWE8oM/PvMDdEMmk=;
        b=1/FuQEgxaAsZOSskLZvsq+Zol/fquRVTc2GfW+HSUO6JZiUZKwoS95WOf4BfKEHf4O
         eAVWp/erEBIcNxkEuQJaLg0eMokX5VbTp2SqDq8mkibCl2yyHlVpXnhq4C4U2ecpASfx
         /gkUmMnd6w6SDo9QUop8JQW0miKX4gfRLmu5r0ahjRza/D3Nwp9qYMfc/aE42e3PL1pL
         kzQb22KiKNbP4G2bzkRQOdAE5PdmgLhTq/9JdOp+j9HtAMb1fXM/RD+HQGDgD/APDDl5
         Bc+5FL1X13rb0xhE2tSjugjwWeOTaATaUqbeweFhe3xtWqxiORRbWNjcbQDTKU2draEd
         rNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032275; x=1758637075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGA1Lv2WKqwDf+vZiKb4SWv1rkAnWE8oM/PvMDdEMmk=;
        b=Ug1xMcI2VAlxTKCDQhMC2Jz8cuQ64U1eSijh4BQ/tyBhxdNUMBXsR29r9RiP3vx0zE
         Fy33CFkiUH2PBF5rkiIlsAT+Rhs25q3q7TVMk7TZ086Y7fgRFl5cS48f/m0zLCWZ8AEv
         f8p/phsLpkzj5TwNbCS1lu01VxpPF390HlYK99WUu2yYjnv203zAPI3VbyL8t4NIvuBZ
         /pIlyjUvYBduZu/bmHisTQ/7wqR6JJpZuk5ch9IGhhiFU/uOFjbPk8S5RKX/fRGmRv6p
         yCdsxYgXM+aGT5dSF/8wgLgD/V/wdTr5uyLgB0YrhA3NyHpFXo7oGlxjB/0S6KPBkD1f
         d1fg==
X-Gm-Message-State: AOJu0YzUUVECjGlJUO75pVOgJN8yGLJUQgpHm3Kh0Awsvj48ac0aLgLb
	Vi5E4dKyWlWaS+7Xg4ja+yPPiFGg2wYShQntAj66dLOhRmvEYiTfhs6ZFXoOJxcLjHd4+wQWjoY
	imCJy
X-Gm-Gg: ASbGncvy9tTCcU4fEvk30o7QsmBTGATU8XwTMyf2XJ98QgZNi0GaFHKAgEExtgYK9Ya
	Z6mJaARpK3z9DFgG3W3DpUvsuNLtATQAy6ncjURGacQX67FvOhPNq0tfHyzmByFbPgl2e9KVYUZ
	AhAxL/v/qfjBdJBVQnnD3UIeRKEX63gZch+Mb50wRPw/xJtRXMXIfPwmRYYACemaA2q233LdDQj
	5xhlWkVeuiM2I/YN6Mf8QXOKAqbSNTcTgwLR9xEs1F79JcyY6MR+SRB5kMieTEZLoXwYcT2cU69
	8awQgrxEIIp/CBpvF0TZ824uqbHzonCetxRoswZj9Fd5NfhNqc/c5QBeixvRw1A2/pLWKY35KNv
	vJo3q6Lb6zxx+hnexP5j5u9JO
X-Google-Smtp-Source: AGHT+IFu7mtg5/xjTxJRCUxc6DQMwtmbhuz2nDS6YPdnLhWf5gvIfHZqGfzoM9Pe6B151wlalzd1kg==
X-Received: by 2002:a05:6a20:6a13:b0:240:8d5:624d with SMTP id adf61e73a8af0-266f4bdfb83mr4212928637.15.1758032275477;
        Tue, 16 Sep 2025 07:17:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a7d1:d8f6:b364:5fab])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa47c0sm14534083a12.53.2025.09.16.07.17.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:17:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/3] go: ignore CVE-2024-24790
Date: Tue, 16 Sep 2025 07:17:46 -0700
Message-ID: <e304b139a8c43a88604ceb93aa933057b1e1748c.1758032126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758032126.git.steve@sakoman.com>
References: <cover.1758032126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223556

From: Hitendra Prajapati <hprajapati@mvista.com>

CVE-2024-24790:  net/netip module was introduced in go1.18beta1 via a59e33224e42d60a97fa720a45e1b74eb6aaa3d0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 36356349d2..b17853035b 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -70,7 +70,8 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
-CVE_CHECK_IGNORE += "CVE-2021-29923"
+# CVE-2024-24790:  net/netip module was introduced in go1.18beta1 via a59e33224e42d60a97fa720a45e1b74eb6aaa3d0
+CVE_CHECK_IGNORE += "CVE-2021-29923 CVE-2024-24790"
 
 # This are specific to Microsoft Windows
 CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284 CVE-2025-0913"
-- 
2.43.0


