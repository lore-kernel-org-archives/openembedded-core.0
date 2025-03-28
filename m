Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5803C36013
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 22:14:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.207.1743200033630018561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 15:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VZWSFJT9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so24736975e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200031; x=1743804831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jj6nVLQLlVAakCo01/lBt94nHwwcJkZsFqVK9xSeZI=;
        b=VZWSFJT9CeUFLdNl6sB4/JxFbnG0GX4mya/oiviZVuwP7XP9KdBK3glOlXs8n1ZhcK
         kxApfhcCF4nyP6gZAi+D+w/kja/JCR/ppCfS3R2PEj0z12doTstmKl2wv/Y1NUokEFaz
         fBWHpaiB5RdY9EY2NXW9SjuFjkIp69ow0oIS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200031; x=1743804831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jj6nVLQLlVAakCo01/lBt94nHwwcJkZsFqVK9xSeZI=;
        b=A7T4PqHZq6IeZWCj2dh6/XBbdEFr8Ch7Mhc6kRr/GFEEAlMfrWBHnHX8Is+BP7no1Q
         FbhhKCMNO1PeiXAU8XjtC+IYT8bnt8PVfSczUPZ9K7MP5tL3di20IpM+rYi00jabD3sK
         ZeH57T4dJ5h3CGuO0EIv/4hV4ehgYzAAA4McSWQWyAD/t5TkW8B0PEE9lcttUtk5w57F
         gR/ces45joWI5cIvqHDwM+JCkPErCIKX6bEmu7xEJ/Yf/XjR+JENXdXKENvdlburxjnt
         zD3kidWey+JgfJw9EM2fgATDF4HiDduR+05iJOW9aIK4t/bak84OOw1ri2vnTbFgvLdZ
         X6gg==
X-Gm-Message-State: AOJu0YzR2HlM2icON1uh9tabT2ve5WeTSiUm8/kSNUG0/Vf420lfJQDJ
	fdjA2grxIyWd5j+Dh9LULgLfsyFo+9PhqlDzTEgeQDvIB33ezykBh5XUKJQaqXy9eGOT+8UbDDf
	u
X-Gm-Gg: ASbGnctmQhFTz+gbKPMM7G8eBTwdKP9Kw7v9bjJYnoxq5LWWklFHfqkNfJ0KrkVQGoR
	7N/IekWH0iqUQh3JlDj0gOHB9hpwiIPajhECrEpxSWKJkmMTLVgC74/qRf+78FMsCyM3IjlQOIQ
	tY0VFkABaq2WxpL6spBZ0g+XYGQ/99D+0u5v3FcuU0wtUNrRjAx/QdRT9Ki5MDCoQDdQBR9oeQX
	QEGuO58MOT1JblBlg+ARQvErEgxeS0jptfQz9+wFz+++xUdU8be5lophGz8FJ4McZzdOATqWNja
	Qg0USJfVBBxaDBx4OBRshWCrX4Xcc+Y0taSjXxMJerh6uuiVkWOcx/gxYNVYRvA7rp36Wao3pA=
	=
X-Google-Smtp-Source: AGHT+IEDDzdiWoKh0czkfq5dsMfTQRooiUVm1MCl8sVCQ/tIkUQCQdOTDQ/eYUXK2Doe9pyeEviB5Q==
X-Received: by 2002:a05:600c:5494:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43db6252fa8mr11099315e9.18.1743200030691;
        Fri, 28 Mar 2025 15:13:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6247:e15f:3651:1c16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66277dsm3838427f8f.24.2025.03.28.15.13.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 15:13:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] buildperf: Avoid step usage in performance line graphs
Date: Fri, 28 Mar 2025 22:13:44 +0000
Message-ID: <20250328221345.1462122-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 22:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213874

When using steps in the line chart, you have to look long and hard
to understand if the data is the lower or upper point on the step.

Whilst not as pretty, the sloped line charts are more accurate so
switch to those as the transition points are important and the main
reason for the charts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/build_perf/html/measurement_chart.html | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 3cd713a2ee5..5e4f4be336f 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -82,7 +82,6 @@
       {
         name: '{{ measurement.value_type.quantity }}',
         type: 'line',
-        step: 'start',
         symbol: 'none',
         data: data
       }
@@ -137,7 +136,6 @@
       {
         name: '{{ measurement.value_type.quantity }}',
         type: 'line',
-        step: 'start',
         symbol: 'none',
         data: commitCountData
       }

