Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.32534.1620657037031823586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i6RIt4Gq;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id w22so2079473oiw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5hSj6/2rz72d87+RzZ+F+TwbrY4f9Ndc+CkC8dggrkE=;
        b=i6RIt4Gq+iKUrdnN9HfxC0ZrPrAxH+jLrBPbVll8vBlU95sF2CFJ4O/q8fWHB7QqWO
         6xW5C81lCGV0zU5dRZxu0EQbN0EtFrTt98U3t4LFOct9pZ7N/PfJumgVY0hG7W/o/YbL
         Ex+NopNlF9H3ZPltmVgMielpXI3yppcZPVteGx+eIHmuce16l5uT/Q3YgIVBeWh8sxMQ
         h095/nRGKlWUnOpesNOpHnuaKiozVUpU93db9vvojtQIgs8g53NJeckhReabzvmEIODE
         B10pENAfx8DDYirkHE0UBnsBgpNWB0AOBfN/sxLO2ZN03ly/HepDFEqb3AxcMosKz25C
         4OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5hSj6/2rz72d87+RzZ+F+TwbrY4f9Ndc+CkC8dggrkE=;
        b=Wd5DaMSUBoUaapxamMfbPbJOF0Vi3tS6r+KrxAzsUaZsAdFKR+iUhmLJBXMdj2yfLd
         nUQKaVQlVeD+ZycO+Ceoo/9zV1IXj2A+rqiCJm4ErDhO+hmfpX4TD44P8JR6AIr/oZ1m
         54GgSfR648jOQLAeNPYqeErt+cdsBi8Y1hU7k9Yj5jCVaZOfgcjkU+sTQM89UfjLRXoQ
         MgO8BKeO0cAWXO/AVvVdIWRnHKHrRwx5C1QTEUSXZIfWIa92mfqwGMkrTnq9Eh6WVYsQ
         n236S/5VsNCiqcwASx/dqL/87jRrOv8978PeiAq6AK4blwWA2gbuDTY9FHnlonKXW57C
         DMog==
X-Gm-Message-State: AOAM531mXB1KprFGQxBOL8s7OiTKT9Pa3Z2cPcKkCWdO4zataqq0BgMl
	p9oRZzMHVSqmhSIKYVdAnkm6sNcw9cGyTasfHA8=
X-Google-Smtp-Source: ABdhPJxxqKTmRLVtDBSvRE2QuWT11gmP4a8wta9aLGW5NDDZsasDF6AnO7yxBtplS50k7tNI3zOM8g==
X-Received: by 2002:aca:bac2:: with SMTP id k185mr17863890oif.2.1620657035988;
        Mon, 10 May 2021 07:30:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/25] pybootchart/draw: Avoid divide by zero error
Date: Mon, 10 May 2021 04:28:52 -1000
Message-Id: <6c4355cd13ae47c327ddc5e9b66623e44ba5b118.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When disk stats don't run frequenctly enough, we see divide by zero
errors. The code already has a fallback path so ensure we use it
for this case too.

[YOCTO #14360]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b71d30aef5dc2c360432c0dd4147859dd303ea48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 53324b9f8b..29eb7505bc 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -271,7 +271,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
     # If data_range is given, scale the chart so that the value range in
     # data_range matches the chart bounds exactly.
     # Otherwise, scale so that the actual data matches the chart bounds.
-    if data_range:
+    if data_range and (data_range[1] - data_range[0]):
         yscale = float(chart_bounds[3]) / (data_range[1] - data_range[0])
         ybase = data_range[0]
     else:
-- 
2.25.1

