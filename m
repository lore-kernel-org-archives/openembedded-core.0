Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.13617.1619905821382177823
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 14:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FO/SAo9N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so1246596wmh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FxSlqAkZOEAylcKDDChUbGcLm//PEyCvnf4vYZZr2+s=;
        b=FO/SAo9NTkmkg0gSw+7qKV30Kxzr87YcT95HqXMiJXkyLj84X5D5YDoaEmqVdcdeEK
         C2s8mfHKubfvzFm4rzNpfOrfEqeGhqR6mQQa4QZpJFk0jLyxExO/1iTtSGm0/+zs8WOk
         ad4K1hSKZZ8MCZwWwcYwWTQ7hW1SAE4eRdNaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FxSlqAkZOEAylcKDDChUbGcLm//PEyCvnf4vYZZr2+s=;
        b=s93Mmv5XfqCEjeeAe48cxIGiOseEXMBW8yOkPXxzpL2uUlNACDCdljwgmyagF0ni09
         CkwkyNzvgc2/jCl5rxPru2+k/nmBY0dPyQrGmKSR4M1tqGfaq10UVqoRBj9VKLtfbug9
         zoeYsMyyNllEBmMjBpTpzageU81U69btwxvljjiRkJclJVOhdMRBqHmfpaTSzlmkcp3w
         IZOJbGYQXkcZuS9dSvEF35I3S7tyXNqihcv++Yjg3t4kIEcienmrHoZVI8EGQBDH3Y8Q
         Hd/PdJvsE+FGXpvgM03gJOJrzKxhA9a+0mxIEJiMjfGAnjcrJVASlU+zXKaScZcLVWvT
         e6ug==
X-Gm-Message-State: AOAM531VeqLZ6+sygNdh6/Werp0WFjWrmUs1Pd3fgvdCyLfUtce3KXl6
	lD487HhEFm3cTfJY9/OHj9URR1Uxq1hKXQ==
X-Google-Smtp-Source: ABdhPJzwcI2Xk9u7GeVazuiVkKmWVYrdi5ikQMEFrGhQCwkMBVdzTCfcW7EdYH7THfwsfr3WI+xIDQ==
X-Received: by 2002:a1c:193:: with SMTP id 141mr4759212wmb.99.1619905819475;
        Sat, 01 May 2021 14:50:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:39b1:e747:d5d0:81c2])
        by smtp.gmail.com with ESMTPSA id x64sm6650353wmg.46.2021.05.01.14.50.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 14:50:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pybootchart/draw: Avoid divide by zero error
Date: Sat,  1 May 2021 22:50:17 +0100
Message-Id: <20210501215017.1849364-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When disk stats don't run frequenctly enough, we see divide by zero
errors. The code already has a fallback path so ensure we use it
for this case too.

[YOCTO #14360]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 53324b9f8bf..29eb7505bc2 100644
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
2.30.2

