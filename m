Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61072C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 15:57:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.1157.1685462247200220184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 08:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=coVdcnzD;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f805d07040so22490481cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685462245; x=1688054245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndlmRoeYajupvd/HxBtCyrTntiEZU21/Sv/m3JKPZy8=;
        b=coVdcnzD/Vo3r5tS8VTWui3cYvuq79y6SizBxDjyXl5YDwdPGpIQCdqO1VkVeya4B/
         LzauFgO0w85lM9mEfjm84YtFhW4hzfMU5BOzQceQKZZjZ3U1SsegQqAMkt+37lvproem
         b8f1gzO9PdoTRmiMfbDOcEwGpG3KQAijvCBz0MIEPG1/MXLbodKPLrumzzXgKkmQtHDY
         AnIft3DtRpKr+QCTw8bu4wEr6vJykLFKPXzGG7/hIeLVzmYGcu1+7Hs8/fn0A6AReDJM
         9Yi+0qguauFkWVjDPTMazUoxwZwndHr+rHrfnnhOXGJtNUYSwMAQAWdg9vc5KvbH4rag
         a3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462246; x=1688054246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndlmRoeYajupvd/HxBtCyrTntiEZU21/Sv/m3JKPZy8=;
        b=DKpnF/72sXhdcjPzm4BJQncpAu+pAUyuN52GM8cAJ1/U4TtTmTeKcWe79hcCNDMQ0C
         khPvYn8tenR9nXlYeABlstbkbmUilYCgAn74g9ddpW6TSW1wiXkWkvd6d9Z4OYYSxIta
         lvMV044xL3fkyTeCx+/RAw+8WNaoz9PwjHvRxTRPcMCgvh8bKGpdcQAVv5qCvpQEpzlz
         Ruy62Grx0XGZmEz3Kgq8kT9lohTgsS0wK2UWdeRnAPVyQTuowC1Js7fYsLB8Rsz/fdvo
         Arw4B1TS67Rg3voWEtULC/ay7Z1S6E/IYvi2OVQUdVBVCT5l2ECVhxI1KmFeO3jNB4rP
         8aIQ==
X-Gm-Message-State: AC+VfDwvkd75cq3m9sKshNiA+9wZm0XcMJm3PwqX1bvoSlqBzgFhD0+0
	IeiGA32TW8QexROED2VNdvlJOLtfgJGr7r6tjNA=
X-Google-Smtp-Source: ACHHUZ7UI/8c2Ux8P6/i7CPNATIM/tv3xTH8tYQ8uDhkMn2u/N1jVOYBeK4vYphb03qNmAw/4obFHA==
X-Received: by 2002:a05:622a:28d:b0:3f6:b823:f2c5 with SMTP id z13-20020a05622a028d00b003f6b823f2c5mr2710325qtw.10.1685462245733;
        Tue, 30 May 2023 08:57:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:4839:d997:f6ce:5f02])
        by smtp.gmail.com with ESMTPSA id l13-20020ac8724d000000b003f4ed0ca698sm4768313qtp.49.2023.05.30.08.57.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 08:57:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] vim: upgrade 9.0.1527 -> 9.0.1592
Date: Tue, 30 May 2023 11:57:19 -0400
Message-Id: <20230530155719.1181384-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181937

Fixes:

https://nvd.nist.gov/vuln/detail/CVE-2023-2609
d1ae836 patch 9.0.1531: crash when register contents ends up being invalid
https://nvd.nist.gov/vuln/detail/CVE-2023-2610
ab9a2d8 patch 9.0.1532: crash when expanding "~" in substitute causes very long text

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e1d2563316..33ae0d8079 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1527"
-SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
+PV .= ".1592"
+SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.40.1


