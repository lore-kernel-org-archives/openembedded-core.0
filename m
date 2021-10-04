Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127B6C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:21 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.10130.1633357279854853651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jFMnCy2x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id m5so1895636pfk.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VTIssBwVCQGcLDQhgORWHTfXTunL8rF7/kZMy7A9c6I=;
        b=jFMnCy2xIMlcTJ7l2CGlLiHukJ5+Wg3a2wjiaiBVpv6PSoVAkF0P7I/qMfPkwJOefk
         IBHAwEcT8chNU6Cb1W4pPRSfADI3MqNG1njlm06EztisLtg7EuNghKPXXG+11J4goD9I
         RdooSQ2+Gx0n/O69yUqZf0y4hCuh54d0X8t1pI7eXFGNSHunF3Bv1htJEc1oNot0rIOH
         6V+/s1m6No1rczVtEw+dtEUcCewTIvoWeLg/XR8bNsBbSWwYrrxX8q3c4NNpQH8xMb+C
         pNh21dSF/gjS6K0g0wuVHMjNQ1K/97ITHNf/20M/xngCUR8Q8ZWNfBQSOG2QPnenmkA4
         EjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTIssBwVCQGcLDQhgORWHTfXTunL8rF7/kZMy7A9c6I=;
        b=Z5WeQxXP/eDrYFDHedAklHOGLdHpg/8BS4gkCgmuCt5QvtBFGy3zIa8cByTanUfjxy
         Zv5Ro/N+kBEJ7CwSz8qVdkiuJ2Yq7jvUINllJvc4FFsEg3iXQpBKiYUPf7AWtu8Berqx
         RC4f0Wur/wsZ3pkCR16B1SB1wC/ZspQbVHNvzg4B3lIed2RlMARYapaON8Fl8TAhLOio
         g1GG4D4mjbd5/KQhrnaWXRZsYYm1Db3gnmifFrJv8pf4Jg4PpLZWs+caPNKpuye9gI9h
         48mtpnbDPz3OUlbbupiTTzeb/qqlL/hoqswoLpBhXNW0Ya62c/XRMqpiEOMSmzoljqJe
         1POQ==
X-Gm-Message-State: AOAM532eEEdMScUlUlsowQB0SWWHd1A6CVPtqd5cZzC4YtyWBY5/77jF
	otNu0YoLUSMyv+mSo+C/CJCDrg5MLX3eoU6+Wgs=
X-Google-Smtp-Source: 
 ABdhPJy+WMjeQ4CSFACo7GNlt33IOeyPjUhuJZl4JL+W+Jxp9VNNVcu8hHAPJcCofbcuWpd0+k+NdQ==
X-Received: by 2002:a05:6a00:14d2:b0:44c:b33:984b with SMTP id
 w18-20020a056a0014d200b0044c0b33984bmr20747308pfu.23.1633357278870;
        Mon, 04 Oct 2021 07:21:18 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/15] pybootchart: Avoid divide by zero
Date: Mon,  4 Oct 2021 04:18:37 -1000
Message-Id: 
 <6b0e7d478bf23bcae774422160be51419c45c386.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156602

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid a rare divide by zero error if there isn't data point spread.

[YOCTO #14547]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7e36d01e87ddf89f76f164a0b7d98f597a53fa5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 29eb7505bc..fc708b55c3 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -267,7 +267,10 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
     # avoid divide by zero
     if max_y == 0:
         max_y = 1.0
-    xscale = float (chart_bounds[2]) / (max_x - x_shift)
+    if (max_x - x_shift):
+        xscale = float (chart_bounds[2]) / (max_x - x_shift)
+    else:
+        xscale = float (chart_bounds[2])
     # If data_range is given, scale the chart so that the value range in
     # data_range matches the chart bounds exactly.
     # Otherwise, scale so that the actual data matches the chart bounds.
-- 
2.25.1


