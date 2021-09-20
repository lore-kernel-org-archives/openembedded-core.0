Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.849.1632170533051423294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 13:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K7JyGUem;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id q11so33208626wrr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 13:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wYZJgXHOiSzJvAx/HJw+5sIUg9JbsS1QF9ex87qK5ws=;
        b=K7JyGUemY62nOsaQ3/JOO7YuoYRlJXWIcTRwUv8qEPUQW1G4Nzq08FrjhTKT0m2BQo
         X2w8maXpfkEiixmn2hQ295BVwe4e1rl714dl/mHYn1yW8RrpveA+pPaI48YosGLEmKcE
         58jwBhHWkH0MJk73cmPAqqXvX70mLZnZZlcJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wYZJgXHOiSzJvAx/HJw+5sIUg9JbsS1QF9ex87qK5ws=;
        b=78LTOBZf2XnasKyPcvjHZSjwrPigVwL285WsQl+avjEDrRmGjx1jUBsWTlFlQGC4ft
         38RY+cEGQ8x9wm95p7oKGl5yxoAB/Q8UYalqmFijugZiIYwBo3EnbIhfMztx5WSBPen5
         pFtRJIC4DX11iXELKuHpXy+9GULag+DkEgU7Zwj450r0CmnYZV6oEDeHONDIVqlaMB5H
         gt9/uZbJbZo2IsveluT5Z37fkYwP1zEaVs844jYGjJ+OZUvJCkXHOrwWOeGlmKwtp8hb
         mOZNQa2/FF1WQJPWal9Y3X+OF/A8BdsZPi/YE7WyYiJnrT65W7NOWA8CemZNmzug87mP
         9Hxg==
X-Gm-Message-State: AOAM532kfkKFyBX90BeO5Vn8G+9oVGOjqiUvLLfnsPGuQlhkfyYMBRq4
	6C2yE77kJ/HTR20bFOFA2ceTfeVoibeOVefL
X-Google-Smtp-Source: ABdhPJyYmkfnFKxC0WXhKKmFu0MN1DYwtNPdmzGOiBQtwNd7rBlD5dAyFaC/YoYCIQnGGr9D8bMFRg==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr948568wme.104.1632170531416;
        Mon, 20 Sep 2021 13:42:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:97b0:b8a0:39a5:2c93])
        by smtp.gmail.com with ESMTPSA id f1sm17200808wri.43.2021.09.20.13.42.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:42:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pybootchart: Avoid divide by zero
Date: Mon, 20 Sep 2021 21:42:10 +0100
Message-Id: <20210920204210.1590351-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid a rare divide by zero error if there isn't data point spread.

[YOCTO #14547]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 29eb7505bc2..6bac8015584 100644
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
2.32.0

