Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42494E6FE27
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:20:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1510.1725636046659984159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zog5MKoV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso3190445e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725636045; x=1726240845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViLb/r6dNMy2t2B9NsuYaS74aC35ADQdfQATiRuIH4k=;
        b=Zog5MKoVayKU0ELNInkyMgqjA2X4ukP/vInuJUSSKhe+JzVlxcNLScTxeu5UFKb+Dl
         +60tBJV/NGlZtHuRp68m17rGxSKR1Q/CPHg+Qc2UmA45QkdayThieC9a3ndRXH+1SKtc
         JqyESAWDpuWrZ4pQnUAai1GhjFty1dmP3wqaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725636045; x=1726240845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViLb/r6dNMy2t2B9NsuYaS74aC35ADQdfQATiRuIH4k=;
        b=Qdz8OhRVB/4FTarRyrhHBy/EcJIz7PzAEap1GWTxGeG8J4mswM+zkZFjudIFWuXC69
         3610Ojaru3VXh8boZkXfURduPqVAnmk0P/lI8E65c7/F/3i7sDQ69c5SMkvChvDqQdwi
         pxUzOQV9Qr+kyNsb12goV9uXuL+P7Q8J6Vv0uDlA2P7njbhd9SU7N7TGTefIYccz0SRt
         4MFPiYSsXkgWja47BHwZgRVdV0ZNAADfLpPYPw9KMa8PavSjDbPqFE8U713jOzwHiLRN
         Y28kvSh1emNdKYDbKgTQ0hEjVtxvITYEzUpjqSwNTOBDQubJzOl8Qw49ayGeexs094gR
         gUHw==
X-Gm-Message-State: AOJu0Yx07GhFYbsXWEFRww6rus0/KYsZC+US3EqxEDlNc+eb2ZgKx2H/
	KatkMFvr2lw/i9p1Pg38KzYpJ5jFpsmzMDke9+T/oPkSDeMkactcilWA3ev5gPvBzisnj59z2VA
	B
X-Google-Smtp-Source: AGHT+IGQLEoeb/ru+5WGLi5l5ZPncutdQPWyMLnwq1fCiRXgpeyeX6uC7zRpWIA2BEf3xcITfDZdgQ==
X-Received: by 2002:a05:600c:4f89:b0:428:f0fc:4e54 with SMTP id 5b1f17b1804b1-42c95bbe445mr62420375e9.11.1725636044462;
        Fri, 06 Sep 2024 08:20:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f86:8879:5d66:675c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05d8b4csm23956675e9.36.2024.09.06.08.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 08:20:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Drop scarthgap namespace from LAYERSERIES
Date: Fri,  6 Sep 2024 16:20:43 +0100
Message-ID: <20240906152043.2304360-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204275

As we move to release, drop the scarthgap namespace and prepare for
styhead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 65eb657fd93..0e54ad7eccd 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "scarthgap styhead"
+LAYERSERIES_CORENAMES = "styhead"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers

