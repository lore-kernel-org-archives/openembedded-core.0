Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71F0C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 15:31:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12853.1743262269101514724
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 08:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SfqyGLqk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948021a45so30629845e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743262267; x=1743867067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1JO8GazeTfbFYutCae0ZsaPUMHJBa5K3NFC4Bf9UJo=;
        b=SfqyGLqkeetST9pV03EiVMeUmT4xMiuzV95S81Hd6fyxSipVxWChMbq8ydG4lvbDdW
         gxjLKm1YuDluszPxzfIPgMpCAHjjUFea/LJ1z8K3Ji3bScNPu7q/cevMpKZ80bbKTvaQ
         PrqSzCC15c14B8N1k1a78T7MydFE1Q0sat0E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743262267; x=1743867067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1JO8GazeTfbFYutCae0ZsaPUMHJBa5K3NFC4Bf9UJo=;
        b=RliMW6qAxmW9POEmLGB9x/GH1n0visxtvUwUdYgpVxhbeXHYqRO39nXqJearlkeB8i
         SF5NooS9WZ8if72sTopLwXaKPWJXX5n6oI30PJlzeEhJcJtqBFf39nIQwFzJKpeInqOH
         92r6H9yEcXk//tl2XmM4/Xj24uzQ2Z0FGkarf6brGv7NNw8KmRyFpsZeX3yggBegxduz
         bc1Xc3HxPtnT0XmlBH0IxzEQ5k5+/trcrzbAZ75SCuTmkTAgEVLS+Z02/gxCkGKAcdmc
         rGtfO2gd0mq5HHBuOCNoWPORxsrcLoiXwyYbrWXjP4cRz3DfmN1DBtC9MU3OYg3FDD5N
         RrRw==
X-Gm-Message-State: AOJu0YxRbvQR9IfFSkckkw9lwerpFtO2YMnjDovQ04txr+SM7xa6WOXD
	WwGnxD0nwK06FirhgaChy0YNbZ4aL/xwcwCL+caWX+UmBw4miAstGs33LvutB0NTeokZGYIMZkr
	q
X-Gm-Gg: ASbGncvZuVovEKe9VOztA1NbPQpbM5HyHkV+MKHrxK4hLtQagf0Qpjy2EvfamhJszY3
	VZPtv6jxd+3/EJ1YNHD2EIeAZXSx2Gwy6eIL5bY41QT9G9VTc2U08awjl5LZzVr06OxmoWSYtUO
	n5H7YWRDd6kzINbX/q0OVmxq8S3eoFwGBat3gVK0ogKg1+O40K7TnljDAvIcw8bvmxJMN6QLGVI
	7UauHOrYSLBjhTtHtZKH+6G+JI+2DN+R7MQKhUON27gDfGTGSm+iPETTCL+ct6Viu3DN/q2WZs8
	gNmgL711YWnC53Souiuo092MZ1ZwXgMsbGTz8bbzvSxkCZ3b5G0tX56NG7SRgiGDAYAIqnI=
X-Google-Smtp-Source: AGHT+IHtoQILkPRMS8FThtviFhPEPzhhNZH5LjBlGgFKMBYjd7lyB0QAVN4CvvqqL0ePPMX06dnM/Q==
X-Received: by 2002:a05:600c:474a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-43db622a023mr30290795e9.12.1743262266719;
        Sat, 29 Mar 2025 08:31:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aa52:226c:d1da:79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ae8bsm6099263f8f.55.2025.03.29.08.31.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:31:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] layer.conf: Update layer series name for release
Date: Sat, 29 Mar 2025 15:31:02 +0000
Message-ID: <20250329153102.1612894-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250329153102.1612894-1-richard.purdie@linuxfoundation.org>
References: <20250329153102.1612894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 15:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213884

Drop styhead from the layer series name ready for release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index f475de386cb..6a70cb63a58 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "styhead walnascar"
+LAYERSERIES_CORENAMES = "walnascar"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers

