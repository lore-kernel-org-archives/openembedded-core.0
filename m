Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE577C0018C
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.41006.1698951786326820868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lte/afMU;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso1270372b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951785; x=1699556585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAQrsaFUGI3IWvC0smNzDL/vmY4EiNEPo5Gbe+sn33M=;
        b=lte/afMUOkCnuw/qiAGHWT6NVcI5vsW/LOfq+MUXeIyN6SaHkpku+0ObZtuAe2DRPz
         yMKIiRkRQa84U/XFr02lBtrtHKzLk4chBxDRbaS+4PsEog5Zg7DJ2xcKv/PrS2rRRBcp
         21wuq4M7ItiA1dXM+NitNv3hVcluCvBKVDCeoamQmOqei5tsTnY3s0Kbmk7SWxEuBlQr
         IwAUQ/jmfNzCIQlrAryxFBiOgN1TAFYBL9NcYXUDqvMXA4fGZce99jIjcuWGtqnnsqmi
         FTcIiXi9+Nue1V3Fx5qTwc0o2rfM+xCMZH8cDplYj5cUYoABwv24V2IX1IRUukLec5Wy
         ENyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951785; x=1699556585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAQrsaFUGI3IWvC0smNzDL/vmY4EiNEPo5Gbe+sn33M=;
        b=w+J0WmNjeyHNQpsrLmAG32Fwj92EAz7H7w+OFwzHpgEi7k0tHiOJU6gWLxDx91clQS
         69/aKzNx/CLcU3Add8x+kGFzOTbO7+DlbTWkOKuhjdncu10mBOa1bM4i2wo2xXB2fHZA
         JIj5dv1dQwggaKKcDHedLd3o55ZRZwGoU9atDMyZ9wfZQIf8eV+8/7etMouu5zvtjbC7
         nQR5Dat0HhCX2HFJpIEOdb7Ug4mX5ZyraXL7YUfR4cLkkUmMis4LUqKtxRHYZyTqUFA0
         uas3PQ7r3EUay7WjlV3Yq4o1YOXI1oadbpPig/JHt2qnONNvZizo1iWhD/gYR+ulnEUF
         n8xQ==
X-Gm-Message-State: AOJu0YwFQXX6TMbOP/ignXsCzMD608viWzqSVYyWsPf3wqCOExBwQSAR
	Sl3WyoYy6WqW9M1qjHIZqO+mBHXqgN0WkA==
X-Google-Smtp-Source: AGHT+IGQ2/w7if5KcDGtq7H8p4QugzRhUT8Zffi93WEeOcSKzqzDWPuAsMw2p82QtsjxoyouVXaF5g==
X-Received: by 2002:a05:6a21:3e14:b0:180:d76f:3d74 with SMTP id bk20-20020a056a213e1400b00180d76f3d74mr8505907pzc.30.1698951785344;
        Thu, 02 Nov 2023 12:03:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] machine-sdk: Add SDK_ARCH for riscv64
Date: Thu,  2 Nov 2023 12:02:54 -0700
Message-ID: <d87bca9dcbdf2542f04781dae33febba34b11d3e.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1698951553.git.raj.khem@gmail.com>
References: <cover.1698951553.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190094

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine-sdk/riscv64.conf | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/conf/machine-sdk/riscv64.conf

diff --git a/meta/conf/machine-sdk/riscv64.conf b/meta/conf/machine-sdk/riscv64.conf
new file mode 100644
index 00000000000..3f4a5af0af7
--- /dev/null
+++ b/meta/conf/machine-sdk/riscv64.conf
@@ -0,0 +1,2 @@
+SDK_ARCH = "riscv64"
+ABIEXTENSION:class-nativesdk = ""
-- 
2.42.0


