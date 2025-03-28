Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CF1C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 22:14:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.208.1743200036147553779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 15:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZSDEM0EX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso20870405e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200034; x=1743804834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI8Uvj0ybBPRg8ySMmEpLbsLWOCteDeOEmLnl6aUZs4=;
        b=ZSDEM0EXJU4n2txdoKqGjyPUGP5OS+Y3yfnyyHEkAbAVCaZuwiUZx6wEhurjruc6zR
         uDGw7WBhHNwl3INaKzKEZ8YnPZkU5q4LrcvyacW7kBAdiRsT1cTKcn10ZPsl0oi7Hzn6
         JKoWc+DbEiPoslz9ojn1D8s5VHQSKN7E8zYdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200034; x=1743804834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI8Uvj0ybBPRg8ySMmEpLbsLWOCteDeOEmLnl6aUZs4=;
        b=TK42rAUCt9AwcAI1ZGEbpWMhISG7+kINFdB3LW6qwoCnI9zZrzsnSvfDPgc7KqrNM4
         s2KiJ7sydSkXK/NEspf2pJunL5UmtTlKf6UNi20LAa1hKgqFdOqswJ0x3HsuiCdPei9s
         eJX49NTrP4Ll4Syt19OABMv7IFfFrk1sq/TOIF9Fd3ggfedq6u/wdlGoWbzyLXyUESX0
         deyLhsJq9Zp34NQvuUX++Rg45gyaFQTWVIQLzws5T5e6W8X9Rc/JZoh9q7KOU1z9Qb87
         xLEacOVa2NV6HWdMa5oGmutFdOwc6o4RdM47kIrV9R0BTODur9tShfd+Uq25hHO2dbAN
         LEnw==
X-Gm-Message-State: AOJu0YxlaffE08Qx2cXg6zAwd3t9Yqan47jNxTNly49let+qiwDfB6jL
	i2eoZfvFK+dAWX2/4AmzdiamEbIYl9tLOCNaBYLzJ3xmff8ySChxZmCgCC13+blj3TYOsF/ErdZ
	9
X-Gm-Gg: ASbGncul+GZaeMx251P7kJS3ZMwHv8GzByctA/a5ilcU+blBSTqScmoNct2M8eeJJoX
	zO9bBCCgUfionfoTQQWHElkaZYM9O7OHPcki5fFGXxqY3aXNQX4Qw27sft1AUYEcShb7SVdPwF3
	hTpaL68w5Kq5IliOUPahuScWuB1xctzN/3RCiKKVeqNUh2nL4cHbFjZ5gK2E4/dMOwyQ/PrGcOj
	VXEqLmmDxXLLpZm6y9jMkHt4XvLiEObCEWjD8Qh1+Ynntqd0IYDlsXBJnEk7n55E3b24HepLCVC
	vi0JSZltgYgOlJAK723bQWZGCCBked/CwROXJtjEebQaE+dme0CoFrSp3Q0aADctiKaUiMl9uCs
	/az5M5N6C
X-Google-Smtp-Source: AGHT+IEJsdtuZTZmJ5G1mPxQyfUvWzqjukjXET04FG+h8o0P3lVOA4chype1YAUxqIaRWoqn7MSzdg==
X-Received: by 2002:a05:6000:2913:b0:390:de66:cc0c with SMTP id ffacd0b85a97d-39c1211d008mr521704f8f.46.1743200033662;
        Fri, 28 Mar 2025 15:13:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6247:e15f:3651:1c16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66277dsm3838427f8f.24.2025.03.28.15.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 15:13:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildperf: Tweak tooltip positioning for usability
Date: Fri, 28 Mar 2025 22:13:45 +0000
Message-ID: <20250328221345.1462122-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328221345.1462122-1-richard.purdie@linuxfoundation.org>
References: <20250328221345.1462122-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 22:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213875

The tooltop contains a key hyperlink to make the graphs usable. Make
it easier to click on the link by removing the space between the data
point and the tooltip.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/build_perf/html/measurement_chart.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 5e4f4be336f..86435273cf7 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -40,7 +40,7 @@
       trigger: 'axis',
       enterable: true,
       position: function (point, params, dom, rect, size) {
-        return [point[0]+20, '10%'];
+        return [point[0], '0%'];
       },
       formatter: function (param) {
         const value = param[0].value[1]
@@ -93,7 +93,7 @@
       trigger: 'axis',
       enterable: true,
       position: function (point, params, dom, rect, size) {
-        return [point[0]+20, '10%'];
+        return [point[0], '0%'];
       },
       formatter: function (param) {
         const value = param[0].value

