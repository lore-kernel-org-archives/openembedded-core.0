Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4639CCD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105064.1781424270057529530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nhl/PqxX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ac357c55so21330045e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424268; x=1782029068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsNWuvclT/vz486afszYaB5UXSVCOlGYQqJBtCetQdQ=;
        b=Nhl/PqxXGSFEXTP10cUptqP9UIwnDe4LveDubR/12jd0S06O6lFIIVqnZ8+5JQZsiu
         PfmZrXiaOyQ3i89N+HJalgUw0+QcCPaouqMqldvTjwMSFH91iKzObPZCO5dFgPc1UwCL
         ZfqcGFwxmqaZOUvNZHfzgusBEDjDLbEmQVucM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424268; x=1782029068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsNWuvclT/vz486afszYaB5UXSVCOlGYQqJBtCetQdQ=;
        b=UNOT1Vp4vWFW1tDBQRJUBwQruOjgBrScZ8LOhgpr6lxHD+9VXBK332xAE5KBoY+1Pz
         S0I62mJr5FAOG39dykTx1y/UFsfaxTNyRD+SdAdXQeCcWz0Oz3J6AeIgIXM7blssvMVf
         Yx60uj9eVeyrW2iCje9yE4+pDNuUb+SWIkuLj3fXa07PT4qAeE9/zrt97Un4ILLrlY0o
         7VxGPKLWWAlqYOKSnUuORWjVwVXbL1kss/4SRL3gjGS5tW51z0W5wTsAzHkdYgNoWzk+
         K9UPSI5xKqdOvhtCQpMG9QSVNWda3w5l2BXMUl8wtPwwuBifjIr0IDK5hRWgD1xT34Sp
         a8hg==
X-Gm-Message-State: AOJu0YxgDT9L25DN2Lr+sClmm7i4ktiOmH9nPL6clADeVPTQ8cmQSmGT
	Bz9LCfOmTS+IczlxybEUG2EIOlb15ZT8rre4fAXzybwlVBZUkAVqsDAFRNApKXtv6N4U7Y5gliT
	/yKz6
X-Gm-Gg: Acq92OHdrFaQfjyWrKd1IjSDaudXZgF2KDapfF9K8VLOG51m9IEWqAAMQIv/qtfoYh4
	wIEhmg9bnMNNBc5moiPB73TgdS4UegiMTySgG0VNELM/SDiJ1YjlRMI6wmgrDEveHMptmsWFsmb
	fmpbXC+iQKebOe0R8TVlQXXtvwIvCR0Ebo/ZuivMXpxpkdyerzwbCHxK0U9bToo1v9D7El4h5oT
	qU32cXP9MpYgoOVE4DWjsGh0fXG4xcMh5QhGgqlTLLE4jBv1kcd7d9v73EtpFZ9pUYm3GgZNeQs
	RmkwlX8TD6BHmt54yoDiGE/1rvh7wY2bIWVWqrjtFGBLLzkjvH0le9+hlIU9PTfe+F0JiCKR4UX
	acLhzgXmZxf1pb/+zUqmJL/FDbQCZDz8gAXM6gmKnUsXO0I50Gnt/bFK6+GZ78m/IBz0q2zJqiq
	WcXxfOx9aG+fK23jJKM4fuN4nBp26lxoarb2qoe5ckLR8vWXE/sSko
X-Received: by 2002:a05:600c:64c8:b0:492:1e36:552b with SMTP id 5b1f17b1804b1-4921e36557dmr86869145e9.36.1781424268212;
        Sun, 14 Jun 2026 01:04:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 52/56] vulkan-headers: upgrade 1.4.341.0 -> 1.4.350.0
Date: Sun, 14 Jun 2026 09:03:03 +0100
Message-ID: <20260614080307.4017177-52-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238736

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{vulkan-headers_1.4.341.0.bb => vulkan-headers_1.4.350.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.341.0.bb => vulkan-headers_1.4.350.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
index 6dbb069325f..ff5108e013d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "b5c8f996196ba4aa6d8f97e52b5d3b6e70f7e4e2"
+SRCREV = "8864cdc896bbc2a9b6eb36b3218fc9ef57908d77"
 
 inherit cmake
 

