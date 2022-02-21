Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D8BC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.4701.1645478692467393924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAkfGqKs;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id z2so5242175plg.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hj6hSOKPX2DElqItnNa5+99vodX3FnC8yHLq7s+Kkbo=;
        b=TAkfGqKsANUe5g26IS3Wbk2scUsvqCm/sZ9ujAQDVo9tL2nYBe7Svs0+5ID+TkRBmf
         Ac0et/3E6KOOooi60qr9IoFgfmzXaULhv+ZHIAmQhssD5veySNARVR0FmL8aLsKD4u4u
         4ragYGnRfpaSbTpldoPVBWTx7Sg4/OkQ2tqXrxXD54g0joYRjEVSmWAROfMDT/7mljQS
         pdi/tCMoKbvb+w7pTME5cbuTxGC/ui+prYZ1XRsXpr2FawsQ3vKq9PXs9XjpZKAaQueS
         aDVr3EeYEkDXZwIetlFnZ+l7r8KkHymHS3N5i60SBrt6AjoUtTRH9lStpJDDaiLgtgg0
         aaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hj6hSOKPX2DElqItnNa5+99vodX3FnC8yHLq7s+Kkbo=;
        b=l6zvA/NTvWa4s9xbfk8ngD8eOgSbqRgEtgW2WgNSjkb/8r1q/Jhlc8NtaJyj8YoBWq
         E2VBzbbHVQuvcE785grUExS47VJbSjsJmQgbsZr2wGE9WN9Q6snd/hT0+R12eh5nzUEz
         TsQD27jMeJBxjMW/cb4AVETvCbLmaFn7+2GnYAerfTnT/1LnA36SoctRS5NMnrA2T7WU
         BNoZ5rmJalqmJeyrOJZiXVXcYoG2Kv7MLnScklkgG1P0hSnNQsQZYPo/uGvkhqCEpyMv
         oxUFRdJiFTUbNdF9X9PjCFrTCgjwXoVrw8yQDijRe5XDN2u1SKlUsbgu1FyZz1UKQKeG
         blFg==
X-Gm-Message-State: AOAM533gkfnqwhaBdtOwb0OLcs1zmQqFNxMa9XBYr1yti5qn+wMuzcfU
	LJsG9sYagPQ4u93tpjIc/eTrCbmhZg2OeQ==
X-Google-Smtp-Source: 
 ABdhPJw6dg2cMmESrFFP87wppXXcZe0R86a1kMPtmnqHUapKFMB9Hj5t4bJmsY+a8bUAPVaj55P2TA==
X-Received: by 2002:a17:902:8ec7:b0:14a:c442:8ca2 with SMTP id
 x7-20020a1709028ec700b0014ac4428ca2mr20525068plo.12.1645478691584;
        Mon, 21 Feb 2022 13:24:51 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:51 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 30/32] python3-mako: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:45 -0800
Message-Id: 
 <eda1841cadf3c7b4393b89cc4e6ce274440690fc.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162106

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-mako_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
index ec8c9cc12a8..23e13cff948 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
 
 PYPI_PACKAGE = "Mako"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
 
-- 
2.30.2


