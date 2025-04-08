Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CCFC369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.6949.1744145476499337607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rHtHdhrm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2279915e06eso58146175ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145476; x=1744750276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rddtyJVGkagQHNe9f3a8JuT1BoUbRkWaa+uFiKj5Ya8=;
        b=rHtHdhrmKIVAj2eyAPA/HBiqj6LoXxsp6hRJq1957YDujYU/OwKpfuAmDsh7nO3wOo
         ALcmAwRgU1NsQ7UApZZwGdo0O8GLHOLtxcv+W01FWp9dve63OPv9AEIDomxfEft3qgtt
         hNSGnQrmPyUmb3s91Pi/52CT4Vos1dznmAlYa3S3zPqS22kE3WhhmSAw+7nMgjAf0Rch
         oBX/Jn6rFMyX8SHUTWdYzICeTtlbELg2Pbv/2fhK2TIQuKjtD9RZyU9OW9Ls15z101ut
         Jqn0dreJB7O173qHsNMLyx8sjlQ7m+ocO682KIM++KIrFtYloAeGnf+aqMcmwvd808pJ
         ZGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145476; x=1744750276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rddtyJVGkagQHNe9f3a8JuT1BoUbRkWaa+uFiKj5Ya8=;
        b=TsR7SKviw+KJnAhhHjLUyfgvo0v116MaNnSDxJySol87oDBrv/aB1A9Fs2v1MPJd0Y
         rdBOf44KSLGYcEWYZwN+PrwrlQUZT3g+dSGA/ewJNfOYbWzsJR2Wz6U+eaNAs0liYIqm
         cmLJQZPgm9NGR1PUes8FanixMu9elMKsFLbCpRinxjY7K9gSh8YWkxjspMJFa1fzXP7x
         e3zmw3/MAmKSlhK/Fpuyo+C03oJJGLjwMJ+KO1O8PYeRKj9Z5iOBMv/kdYQIiTvbjT0t
         CYz08F/ROoNYsulIoy2+6x+xKcUXnW4f0QKGjt4chnYE5qLIk7WKRtnTZWp+PqYcyDt3
         G8FA==
X-Gm-Message-State: AOJu0YzJizUoXOJZbeiJa5o1SUDqy1035YpKDCSoRrID5Wca7KGR4XmL
	1gofJfL/iozlyUf1djERaERf9WIEpOamhGyi+Z8OYIlP7gT+2u+LDNmBDK0NItdPjdQNy9WSewi
	z
X-Gm-Gg: ASbGnctXuVwX26HpvGdR+HHALUEYeStQzkJZfHbq3zn/EY32TpSI1I0xRPoZP0Cf4gs
	8Z6bdu74d2cFbxSPlEhQscHkk2JnGJE3ONNbtHs4AqPNs8ngHLMnxePtJ1pHRKRg6S75OigHg4h
	szwA+J59NBw65rFy2M1TSlJXf6xZvLNeEtIRqZv95ACyz2c3kkl4gNfciKa27jSOVtoD/GU+oHM
	c107stbm2d4cNR+1pVXX1mTahpSwepEMoZxOLzDhcWvr5/3hcUduC651b+WQDUm471oIayyXFOl
	d4yGj7hvMohj5L8khsgpjPABaJbI/pf7o+uFmooJVen6YgI=
X-Google-Smtp-Source: AGHT+IFJlWsYpFe5DxnRViaqCvAm/vvaiYVFgrdhUwRy1m0mm1FqxQNSa7QOWY3BoJmLy7eAXhPpPA==
X-Received: by 2002:a17:903:1450:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22ac3f2f26dmr2110295ad.9.1744145475726;
        Tue, 08 Apr 2025 13:51:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] curl: ignore CVE-2025-0725
Date: Tue,  8 Apr 2025 13:50:57 -0700
Message-ID: <9077246122b1284e8b6430384cccaf6f0b6c80c3.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214556

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2025-0725 can only trigger for curl when using a runtime
zlib version 1.2.0.3 or older and kirkstone supports
zlib 1.2.11 version, hence ignore cve for kirkstone.

Reference:
https://curl.se/docs/CVE-2025-0725.html
https://git.openembedded.org/openembedded-core/commit/?h=scarthgap&id=8c3b4a604b40260e7ca9575715dd8017e17d35c0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index cda42da4d3..748afc1235 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -73,6 +73,8 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_CHECK_IGNORE += "CVE-2023-42915"
 # ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack
 CVE_CHECK_IGNORE += "CVE-2024-32928"
+# ignored: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
+CVE_CHECK_IGNORE += "CVE-2025-0725"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.43.0


