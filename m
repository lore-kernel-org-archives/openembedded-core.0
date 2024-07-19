Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED5AC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 17:49:46 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.24365.1721411377588276643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 10:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nZzza2bb;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso223454366b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721411376; x=1722016176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwdMbDHOoPRq2hldq4+NgwyMnYTaTPl/Xyc13aZywfE=;
        b=nZzza2bbW5Ug2I62NMXPmG+ZLoLE2h1Nqsjigsx51ne1ohyZpamTx1jXM7BJVLO0mv
         T25QdXPyki59U7jsmHwwO53PcWmnWq1/jmBLZLyxpDXiMk0pMI5DT9dUwiMW4JuxMP+l
         Y6QmDSHGI/MiAs0P/0fBjz4IwpIQESOVtWAKYnghcjp/Gf0ZmQORS9hCugroM49PX7rn
         Hk7caTbuAxb/zpcyUMDpXAa8meRrIHANwDdGXCgps8D8syz0XVKwQqvmu8hBdG8TdeBB
         K8RM4vwEMnp63X86x4kfSof0mn8OMJa9ud2L+nLzsdFGgzEWTAjOKmQWr3ZtGnv/9JwK
         S44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721411376; x=1722016176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwdMbDHOoPRq2hldq4+NgwyMnYTaTPl/Xyc13aZywfE=;
        b=n8rkkEg+8jFtG0x0wvlL2X8qVGhdJdSY+hnc7GKeSQBWp0flpV5U6qkE62/aeHywki
         +SYHwz40YKJyRPAQd6RJ5rxg8IOPI2Jsav2q+MY8275zgmR6+NWDhllSaEBtzMIszq1m
         wrTrfmGARzmGXUr5duwu47+Sqcy8JMAtp3+MOFSQ9UKWIsGBq8IUblVAb8fRADxa5mxw
         3y1M0E69ZgZ9L3CqqoZ8CsSiWIepDZMMiXPR58p1dLca/sAbbWFHNj3ltxhqZ/g8Cmjq
         hYkSS/O5sp5WYww34UwtIGIt/BzZgyM3RTLpFx1ZuZMUdKwof/dvppRN3WP15Dn1lK2r
         Q+9w==
X-Gm-Message-State: AOJu0Yyg76zzr7GW1mxCsS7A1KGN4g94o5qZzH9KjhWB89xes/XWnL4o
	xr90a/FlVWU8mQcuHgPchXHxQIzU1owcFwLLxhhywLvO2kLAJcqOs7urJfzj58WzQKsTUC6W2HD
	A
X-Google-Smtp-Source: AGHT+IH9XqyqA14/dfNEFgNK8NbjS27eOuDSHRG7fLyy+TbRr/C2AWDxvqZTF5ViUyrXa6S6NZwNiA==
X-Received: by 2002:a17:906:c010:b0:a79:7e8b:34c0 with SMTP id a640c23a62f3a-a7a0113148fmr634151766b.1.1721411375485;
        Fri, 19 Jul 2024 10:49:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c785db7sm60770166b.12.2024.07.19.10.49.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 10:49:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xserver-xorg: fix CVE-2023-5574 status
Date: Fri, 19 Jul 2024 20:49:34 +0300
Message-Id: <20240719174934.866987-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 17:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202269

If XvFB is enabled, the CVE_STATUS for CVE-2023-5574 should be
'unpatched' rather than the empty string. Otherwise SDPX checker
complains:

xserver-xorg-2_21.1.13-r0 do_create_spdx: Unknown CVE status

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 22f7d9a8adcb..e2754426cf1e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -176,4 +176,4 @@ python populate_packages:prepend() {
     d.appendVar("RPROVIDES:" + pn, " " + get_abi("video"))
 }
 
-CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', '', 'not-applicable-config: specific to Xvfb', d)}"
+CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
-- 
2.39.2


