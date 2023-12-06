Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B51C10F05
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.32045.1701870964732897707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0F/Ormt+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6cea0fd9b53so84875b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870964; x=1702475764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttA82dQ7lpNbcGKR1jlQMct0EGqxzAgN2sSBKVSCmNE=;
        b=0F/Ormt+Vo5JNLYOHyJbO4nyTbaW9xhbLSxvUwaUKvFzJFVxoRNP0mAVomfMgvdSDL
         zL2MpyCLALbv1K+dDsCWTdSJlv7W+LBFmAawIvflY4lGVWJJhqqd7EzJa++7ALZm/onr
         zgqG7pzUyMK9LsZMctUzhKTXXWkrveS78nHJR7G+cLXHXukYuPLBfsFputajRuvzPW1q
         Go15MY7EWKHshiV4AkJjW4i53mn7Q65JPB1qes40vzACu7dbiT6fpKvOfSArQKia/TWs
         H4uZ5Wa9mom2CZADvKrHkdzJFKqoOwODYwxow6rYThH22VfWj/Y5PHi9fgGhxGBgF1px
         7/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870964; x=1702475764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttA82dQ7lpNbcGKR1jlQMct0EGqxzAgN2sSBKVSCmNE=;
        b=Ll9oU8/icw5wHHy9X30KfSvAglRyDjs5YPw29m+G6l4DJQ5PfKJ7PdSlbhR5brPfnp
         yfVTc2H4Qbqz/OU8UXaDDeBopa9I2GY/kd4K/KMBejFxqVPlUELSyT42D592jSlsXHeM
         QBeRPoN+luGetc5Hx10YWrfgIFWijtekYZWP3U2FgOxuq4mxKitLtmRxMBiShpvgzrEt
         1jyzy86LDdTzckv9OV3Xq9b4lwm68CQMHUnzJf/eWsY1/lU6WCj71HF6LWMWxV0ry2Us
         8JpFCyypzWc02wgr1WgfFVMF9d4EG+PTHXg+eQJXo8J0wDUt70WEsSyulREEk8155nfo
         mKyQ==
X-Gm-Message-State: AOJu0YzxtKcXiPtU0JCEC+p7DXrVbkZZmHskm+uHjq/8wUGbAmswhJ6I
	0ZiuMHrQB4RvmLq+7CUKfCs/YsniNlu+ZVixBDY=
X-Google-Smtp-Source: AGHT+IGmkS8KrC+vnK1vLxzpEtZMtDQ7FLjD4E5GFMCV5dgElAmMArvgv/RnGhTUWjjIWMXxoGmjNg==
X-Received: by 2002:a05:6a20:1605:b0:18f:97c:8259 with SMTP id l5-20020a056a20160500b0018f097c8259mr812197pzj.99.1701870963774;
        Wed, 06 Dec 2023 05:56:03 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] binutils: Mark CVE-2022-47696 as patched
Date: Wed,  6 Dec 2023 03:55:45 -1000
Message-Id: <a2af1a2b05e3046995f48e4d823c9dfc97b95529.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191888

From: poojitha adireddy <pooadire@cisco.com>

CVE-2022-47696 and CVE-2023-25588 are representing similar kind
of vulnerability.

Reference:
https://ubuntu.com/security/CVE-2022-47696
https://sourceware.org/bugzilla/show_bug.cgi?id=29677

Signed-off-by: poojitha adireddy <pooadire@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
index 065d8e47f0..aa5ce5f3ff 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
@@ -13,7 +13,10 @@ anyway, so get rid of them.  Also, simplify and correct sanity checks.
 ---
 Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
 CVE: CVE-2023-25588
+CVE: CVE-2022-47696
+
 Signed-off-by: Ashish Sharma <asharma@mvista.com>
+Signed-off-by: poojitha adireddy <pooadire@cisco.com>
 
  bfd/mach-o.c | 72 ++++++++++++++++++++++------------------------------
  1 file changed, 31 insertions(+), 41 deletions(-)
-- 
2.34.1


