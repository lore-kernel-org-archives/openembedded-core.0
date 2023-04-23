Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914C1C77B76
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 05:56:03 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.22797.1682229361924158711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 22:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=AKqPj2Zf;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b60366047so2831688b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682229361; x=1684821361;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF9BXFRTRJR5LQ3mAEY/FixtMK3Co+RDvwl4Rfrnupw=;
        b=AKqPj2ZfaLiBalmLu+H57qbYaKDsajTjl1lkiFhJOtNIHX9S5R7PHOPAj2Hu2Oq0pm
         i1AkERbmbbpPqzyqjL0jrhSBuIdL7P6KsQtDDf9GxNxpUAMJgGDpaUAlc5g/elDosp1Q
         /JhGM1LhUk3Kd+ntNDnOHLnSS838E8XkJ6Zpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682229361; x=1684821361;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF9BXFRTRJR5LQ3mAEY/FixtMK3Co+RDvwl4Rfrnupw=;
        b=KCTvl1CODL3nOseO0FHk4AspQWgr5hJPhmC8S16hMIJjTG6CEElzdc8eD/sHmoWPDZ
         ApCba01smWWyHqXgWMvakMUAi/j7hze+AYXuMfmJFa60no8Y9d5hzRwwqC3Ilu2q94QD
         kwcdHtWmFRoFi2ZMJJl+Y10udEeRd0ml0MdGYS36R3e6n4LDmscgxLyMzM2r6NvP+7Je
         D1INA552o4uNNF1GYxjGIzHtsB6CaJL4FxVIU3vjopBcOiS0XWqqs+W8nTCIgjC3Az9f
         3kT/uBqzfh0rDU4VqkZTzVunYLYuQHhkJeO8hYWyS0NNtH2D+C1+Bkzg0G2QtCYllUw1
         UkAA==
X-Gm-Message-State: AAQBX9f6p5q+kJ+75DjiB5XwhAMYU5QW76R8d85ahTDvnhTwhcTtC/+l
	YW3mjReOPHdoh+8oEE2jntuSod+7xdTmH0GYojs=
X-Google-Smtp-Source: AKy350bsblXR89xi4cdsVfyxAsK7KTio5/2m0LpzOhpTMtYj/NuxOSjcVeigHep8FFR+klMbf9b8EQ==
X-Received: by 2002:a05:6a20:a5a8:b0:d3:89a1:76d1 with SMTP id bc40-20020a056a20a5a800b000d389a176d1mr10554194pzb.11.1682229360686;
        Sat, 22 Apr 2023 22:56:00 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id p37-20020a056a000a2500b0063d37a45829sm5287486pfh.63.2023.04.22.22.55.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 22:56:00 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Ignore CVE-2022-1705
Date: Sun, 23 Apr 2023 11:25:44 +0530
Message-Id: <1682229344-3828-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 05:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180326

From: Shubham Kulkarni <skulkarni@mvista.com>

The vulnerability was introduced in go1.15beta1 with commit d5734d4.
Dunfell uses go1.14 version which does not contain the affected code.

Ref: https://security-tracker.debian.org/tracker/CVE-2022-1705

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 56f4f12..b1d7bc1 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -87,3 +87,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-30630"
 
 # This is specific to Microsoft Windows
 CVE_CHECK_WHITELIST += "CVE-2022-41716"
+
+# Issue introduced in go1.15beta1, does not exist in 1.14
+CVE_CHECK_WHITELIST += "CVE-2022-1705"
-- 
2.7.4


