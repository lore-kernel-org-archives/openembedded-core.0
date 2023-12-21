Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE95C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:36 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.42659.1703124567029936423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PSeWn2NW;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.51, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so188969fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124565; x=1703729365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flepK1GccOcpR44IQF/8j4HdRv8CjOBzpT8UaBpq5uI=;
        b=PSeWn2NWe51PIjw0Agg7+Xphfr6Rsr24vSDtzsFoKkrR68qxRY69o8IBavPGMECMq7
         AvJU2gIUDXoKEevaD0Ws/xVLbrwSAP0RiGMdfL0mFYIrfnu6zxOVaLWuU3bdJVdRXEWs
         pvLKcO75TtI43OJQmdHDa64qWdfi8Oox7VTyQoccSXOR7ct5qASa9w37gtjCdR4f+dMJ
         bLr+B0vmgbwVSqiXujuex/H6qYtG4JgjptAfrLNm2JrsROTldlpo/ffsWyetKwkP3QoV
         4AwcjZHSZcDrTDoms9ER9Zqlw8Sp4b7j6Rsu3CwhcLPpNL4wtKiIR7bsSwgNXoA7+LKl
         rPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124565; x=1703729365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flepK1GccOcpR44IQF/8j4HdRv8CjOBzpT8UaBpq5uI=;
        b=MQ7EOfI8LcKA3LH/zEa6e9NsNaNQAr+coKfVQOujul9XH55JSoN2kTEDIBI6uwh9wJ
         +eUDYFm90g7ARYEVd9usJNgZ32MormyJYweEw27CPMi1xA64Q+6qe4+HSNTJkQ998txW
         CNqxDzlU+EbCOonF07ZYX7u6WUrIinXaAMZeRFK2d6Q5dbQn5b4ui2kbWtipghvgV7y1
         4J+qssOq9F75YFtzzDDOUExCO4aw7SfdhKatdE5bIe8sbaXXhsTXEUY3XgqVJLkmEza1
         UDYw1Ba0Ts34FSOZiktO6HylYNEE8YRbLSWCgby+cEjcRrJrMXxESG3TydQE8u7/+lKv
         iCYg==
X-Gm-Message-State: AOJu0YyHAlng2uoiTqAHg+vsnHdb17sOuYPCMlFml7VyJKJOIwiGcYKn
	6ZZ2NhbAuNI3QJn833Znu0UQV8N5sTTKehW1+RlrUQ==
X-Google-Smtp-Source: AGHT+IEA+mIfpt3jqsH8JLz8ryw49pNamQ30CAJAdC4w+3FD4kCB5JWNaUgtAceNGyM8Z86DzDxSEQ==
X-Received: by 2002:a05:6870:71d1:b0:203:7ccc:b6e8 with SMTP id p17-20020a05687071d100b002037cccb6e8mr889966oag.25.1703124565582;
        Wed, 20 Dec 2023 18:09:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/11] ffmpeg: fix for CVE-2022-3965
Date: Wed, 20 Dec 2023 16:09:05 -1000
Message-Id: <afc21d7fe86d26bf62e56fc611750f89fe73aa1a.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192817

From: "mark.yang" <mark.yang@lge.com>

Without a CVE tag, It will be recognised as Unpatched by cve_check task.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
index 6e237fdd52..8ebf1f69c4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
 
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd]
 
+CVE: CVE-2022-3965
 Signed-off-by: <narpat.mali@windriver.com>
 
 ---
-- 
2.34.1


