Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEFBCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:22:55 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.987.1756999368724945946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=19hU2c9Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b471737b347so740775a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999368; x=1757604168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRboKLJgHFLlrrQh+UXzy89E0KQk+HUx+bKoFcAztS0=;
        b=19hU2c9Zhy0YaT7jZmNR0Lvic+SiiONMty+FOPe9HseAgx6v1d6wboXTx7k+t3sKEv
         jfg2mRIyrdpyQ08BNO/uhXOESq8tM8z0tdtXnMkfUYWG3Zq8eRauXAGJ7Rk/hhWESM3x
         hdssbkdqw+/BJXt+E9TP3eRrrwzC//B3O6qP4/34eww10ITRC6hU10jbqsarhtysA3Xd
         KgDPHXc49Bmv5TcYoWfyUm1YCN7p/1V9tSyAz6kxgOvDhwYxzCz340l4TphPgyRP7b2r
         1NHDjO1dQphh+sIGodRPM4DTEPdyJcKw3dwqvnsmCNm+He2dj/4WztrOilyAaykTAtHV
         n+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999368; x=1757604168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRboKLJgHFLlrrQh+UXzy89E0KQk+HUx+bKoFcAztS0=;
        b=FA49YBC8L0w4V3PemIyxgXLpDsajuLVioIv/5Phi1McyPOMwe74rmlno9txe63fves
         soElOlNodZNLUiTGHOh+YfjQCUIanSHepV1HaUjhN59RkmkWjuNM0a+gD1GqhZKxNeCb
         sVIQfh9iSYac7bTlsY+0/6O/1LRKeAU7icugxycvMJtmz28Iq0vzW00F9MaXPpwwr2Y2
         CL+w/JrYMzJAr8bzz6XF3zAm+x41Hr8Urir/WLI1q9Owio2bBjYWNXGB0YxY6lhntLuH
         5QYvY+g1+eOs7WKKA6qS6Jp3IN7ZxhDYT0xjUgmrn0xfUdt2JQYd88cJUI/mzaVAmVb5
         aUXQ==
X-Gm-Message-State: AOJu0YwvSkjPUMqaHyiq8uFNx9LhMIEJ6jYxYx9Njv2Y91oTLMuoBU2S
	SOtS65pBAw44zLQyYF9zY97hKchQcj/vtA0NCRI5K0Q1jsoMy8oGFT8QMnpBduWzqQiU+Puqtio
	azbR8
X-Gm-Gg: ASbGnctfBMrEJxkXeGouT3LZoAFFPh6R96tORbBwIo0iFYG+J7K4g99XAPhj5MIFQEs
	D/0VXq8eh0jZE/ycAL36uX+kybOgLa6gsShuLawjo7OhXp8NM4WTtmtn0T0ZIDIEiThsyelmkDl
	9TBIlimuTRzkZz9KygiiXgR7r9v/EJZybMlEpKIT56FUtLOs/vT+gsvSQwkfsdB8UKSZm0kX97L
	aMqaRxwLMvhf+ThVCYkJblsol7MCjb7Od5qkrP7kh1Yu3NqbUDdTeUn5KIiuzVcLlErmVfDiy9R
	tiL4HsDiAb4rv+ZiXAVEYXD5GOR2ChPvoDI6+ey5DIKs+uqBEsFSqSCKmUSXug0zIvhgMLPVrMR
	Kb+u91qHuF1fW9UmOTshe7yTw
X-Google-Smtp-Source: AGHT+IFEyEMBvki6wZ4xud7dZ21/H1ubeBUm1gcjvLou9QuOWUR0a5MSjCPTItn69wDrwUn+xPQ95g==
X-Received: by 2002:a17:903:284:b0:24c:a269:b6e5 with SMTP id d9443c01a7336-24ca269ba4cmr67586675ad.14.1756999367882;
        Thu, 04 Sep 2025 08:22:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm82528085ad.54.2025.09.04.08.22.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:22:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/5] curl: update CVE_STATUS for CVE-2025-5025
Date: Thu,  4 Sep 2025 08:22:33 -0700
Message-ID: <fddc4dcc89a9491abdf8f5d0ea4df9a6526b1538.1756999195.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756999195.git.steve@sakoman.com>
References: <cover.1756999195.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222956

From: Vrushti Dabhi <vdabhi@cisco.com>

This CVE applies only when curl is built with wolfSSL support.
Revised CVE_STATUS description to align with CVE details.

Reference: https://github.com/openembedded/openembedded-core/commit/93ae0758ef35

Signed-off-by: Vrushti Dabhi <vdabhi@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index a21a086f40..6845a43cd2 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -37,7 +37,7 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
-CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: build with openssl','unpatched',d)}"
+CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.43.0


