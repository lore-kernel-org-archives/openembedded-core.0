Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4080CC41535
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.52970.1699715012200770790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zRlLCW/O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc0d0a0355so23990575ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715011; x=1700319811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POKhWiqkmQntmZSVMEM5kZYSfSHrbNcT8JeTiFntHs8=;
        b=zRlLCW/Of1lsfWDUDP/2Bx+YaK7/zq4bEZ2ZJNPJWjrcCeNZ9hbUihNTa0IF12JsI6
         CCPE6Smz1maRiKc/C16ZELJvRcHKlnqdT0lzeWqItmvEiUbyfESdJn5EvvFjQOh6Itg6
         Uc9BB6HsBidt7hjAqfdviok38arDQv/ZhNVDJCo3Kh2XvpK9ZYe3TfyI6rFnAAKguavN
         LREAu42AAxeOyXXssyWc2wQOhdd2+F6M0n8ktLuFEvxwyz68GM5K6SXxg4hc/7TJg984
         zHyXk/Y5d3m7ylBgSdBvvnnRNX41SnfmLXa5gT7CCe3MYduEI3Q0RbRhHP5uM1l+T/65
         /vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715011; x=1700319811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POKhWiqkmQntmZSVMEM5kZYSfSHrbNcT8JeTiFntHs8=;
        b=MQvEVbZ0aHj5UMa/3M/TFASQxHmGFb6sNopsqiDOmYqfY9pcvlFwi1uTe+rXyAjP4n
         2zX+cyPnbmPHhh159evt5m2YIim4s+QDTK5wFYxyqS1of3vjr5MCCR3g7gNvJ8RRk33S
         Rn27sSbaeG9mAQa3Yg5oVd7IpnTWSZkZkEgb/EJcy3RqiNHhhR/ygIbGNKU2Ag7qj//1
         D98Q7fP15N5U+X5p8zxdvWvw7QPn9XU/57c96en+n1CjX7f6kFChPZ4M+AXFZSLig1fn
         ias9I2N0FKcRYTZxAE/yVUC39EQx0YpxrsBoew29M6ai1tYS6kli5EAaPyMwZFm0wtVo
         edsg==
X-Gm-Message-State: AOJu0YxLZZlRTZkC0MHSVFW1ktPPmooVnZ2bhV+1ZWg925iB69t7DJL9
	ZNYbSpyc5K/mCSIDdebPaljD1tM/MQJDLq3RirQpSA==
X-Google-Smtp-Source: AGHT+IFqfLOwA2vnZkz5Xk/fW34qc5N+WjMRwYr1v/cBNwbvSIYXKDw72Ix+n96JGxxtn/xlQMMtHg==
X-Received: by 2002:a17:902:6903:b0:1cc:2091:150f with SMTP id j3-20020a170902690300b001cc2091150fmr1563507plk.1.1699715010988;
        Sat, 11 Nov 2023 07:03:30 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/15] cve-check: slightly more verbose warning when adding the same package twice
Date: Sat, 11 Nov 2023 05:02:59 -1000
Message-Id: <ef6b9c84a786974cb3b24706d8afd9ae809a6f8d.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190425

From: Ross Burton <ross.burton@arm.com>

Occasionally the cve-check tool will warn that it is adding the same
package twice.  Knowing what this package is might be the first step
towards understanding where this message comes from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1179faec8583a8b7df192cf1cbf221f0e3001fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index c508865738..a91d691c30 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -75,7 +75,7 @@ def cve_check_merge_jsons(output, data):
 
     for product in output["package"]:
         if product["name"] == data["package"][0]["name"]:
-            bb.error("Error adding the same package twice")
+            bb.error("Error adding the same package %s twice" % product["name"])
             return
 
     output["package"].append(data["package"][0])
-- 
2.34.1


