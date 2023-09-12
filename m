Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEA1CA0EFD
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:20:12 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.230.1694539203554245548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=eHAmkv3F;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-770ef0f51ccso250499385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694539202; x=1695144002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fJPDyVO1WteoYHUQfhEUD+bZIVlckBnayji1SRxeLM=;
        b=eHAmkv3FmdnbUy3Yk/VKkd4PbUamVxXRKnHrV6mKnZgmnLb9rFbcc8I2zQs6+eBINM
         MpMjNY2H/ArDdhbkxBFPpBbgeRVS3SGrN87nk77JSqkRpG7GR2CucaXNHWDh2ZT/srNq
         AEJjG78Kf9P7zbuxSe3v9J3qPBMyNT9YH0OhTeyIfvWo0oATzWGE2jxojf9X7m22M36M
         ljNFEJRGGNvqeYc/P1vh9ElLkugjhSGzdRySlXAc3KvG3GOnD389j2oKBmnqWUvrXeOo
         H2KV/o8s/fNRg+N35j8EdXf/UHoQHt9aupXrO9Vw4llptuvW+HM+l2XK5BYeh1aP3zWp
         FnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694539202; x=1695144002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fJPDyVO1WteoYHUQfhEUD+bZIVlckBnayji1SRxeLM=;
        b=dMzg16ecsZy28yPf5U8P7AQ9Qea1ykxZVPMgfHfSdLlYDbMnXW8rd2OL6Al2nX4DFR
         fWuyzY0kbhn1bSMypvjN01h2C4BU/BfMaQsWQ4e0dPnssgxfGHikD+AdfR5sokjxUH7V
         /soen+YWA50r76snNV/WZ/QEKvmaMZ/EDIIJnVFm4t5mNRM9I1kc+31eYkdzzJ1b5zPG
         nEQFC5K9Kk8o7QFaUHLh4xJilOMwUY0cXC2XttAI9Hdaw8C40ejZcfmVBH5o/P7T/zDb
         xDgFNKbEWS8+P3DXGEIC9xXFWk8CRH/dklfsbzmbYqt/gV2CoxjrLu8PERw5y87dy/xB
         Tw1A==
X-Gm-Message-State: AOJu0YzisFfM7A4MDeUWWQiHn/tusipYjFX6UljQAVnDTBLRqoReLB2Z
	TgErNcs/li4PJMoKUaDY4NcfvDYe4u8FXLak0lGd8A==
X-Google-Smtp-Source: AGHT+IHGJXCfnIioCGWiMH13OUIBR37/vk2DRz7wc/q6u6iQaRjJn7VP9DbKQFENufICjmz/+fUHRw==
X-Received: by 2002:a05:620a:4010:b0:76c:9ea2:545e with SMTP id h16-20020a05620a401000b0076c9ea2545emr102837qko.3.1694539202573;
        Tue, 12 Sep 2023 10:20:02 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id n3-20020ae9c303000000b0076d25b11b62sm3356726qkg.38.2023.09.12.10.20.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:20:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] patchtest: add requirements.txt
Date: Tue, 12 Sep 2023 13:19:57 -0400
Message-ID: <20230912171958.1575518-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912171958.1575518-1-tgamblin@baylibre.com>
References: <20230912171958.1575518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 17:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187537

Add a requirements.txt file with the Python modules needed for Patchtest
to run.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/requirements.txt | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta/lib/patchtest/requirements.txt

diff --git a/meta/lib/patchtest/requirements.txt b/meta/lib/patchtest/requirements.txt
new file mode 100644
index 0000000000..785aa469f6
--- /dev/null
+++ b/meta/lib/patchtest/requirements.txt
@@ -0,0 +1,4 @@
+jinja2
+pylint
+pyparsing>=3.0.9
+unidiff
-- 
2.41.0


