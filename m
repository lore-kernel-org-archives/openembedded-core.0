Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889BEC433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:44 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9342.1642084663786424808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=prTOQeAU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id c6so1792609plh.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D0s3LzI2G0y+8p/NWjwmwtm1hMsN00A7WjxeXac0yTI=;
        b=prTOQeAU2IbZ68Ao5RXUa8qPLA9+fiLJhyKJNamoE8QbCVcCaqGy/MlsbdXeNMpfkZ
         TbHn9f2vbqj7GLkPboOsIJ1V4iEwHQ5yptmczufgBw/QPyO2i2COD+SwGjXsYWHUCm+z
         n4FC1OTbIewdYOGF/FpgpTh6lwAPsFfOF1DTFQ/wGtLfcffCxQ7lBRW708qr6ADdptCH
         v3oCzSDY/CC4Adrel9wDhmG+0nh14X3ZP6Rqf/AsbMa7nLCs9L1fg7OrH/jW/GpDEt4L
         Rp0a2vptKKo8ImXyaa35Y74V6jwG4MwhKjARqmtuxtPXKn8oj4cB8GSgw9bNvJqaEmm1
         N5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D0s3LzI2G0y+8p/NWjwmwtm1hMsN00A7WjxeXac0yTI=;
        b=r6ntGgAiSZn8AeNmB44Q1wxpo+RmlMrtxFb6Pmk5WlGSum5LydFp7LqT1/Nz9JFaNh
         0LZGSIH73w6aOfba0JaaH4cFeAsguSljeIqxWgb5h+ALvS+MWGePxSL5kbbJLJvFb/Mo
         rDfjXSUM3O+/iU/ailfem3SnBhqwQrzDyicq6RIxG6SIQaPSVzenSPMBE4H0VZqKYOGq
         FZJpOmzbIIV7J1tmOmcRRpcVGB5z5WRGN+pDVU4IlFwGFiTXPElFzdTKMVH4Sf9we+iJ
         mnyvQ0KC9+k+zWP7Y9x107MuKSZzZx1nadSzQ8WZgRnjq7WEkkPFMsJrt8+B8g2yZfSf
         BqtA==
X-Gm-Message-State: AOAM530F5uB5d8jN6s9ss8+h/KdiWeGp4fWlRgYomkS8DLe/WoHVdeoP
	S0xqSsHII3G6m+NDmBqxZ9XKCpvOJDXLgH43kk8=
X-Google-Smtp-Source: 
 ABdhPJwcHBuI2XOFhF6xo+kg8w2cQGY8JZoduZgc3ihCq4dmKa+Vu8reDXGyamYrSvTEv0mttfF0gQ==
X-Received: by 2002:a17:902:c40c:b0:149:7d72:15c5 with SMTP id
 k12-20020a170902c40c00b001497d7215c5mr4698903plk.133.1642084662897;
        Thu, 13 Jan 2022 06:37:42 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] cve-check: add lockfile to task
Date: Thu, 13 Jan 2022 04:37:08 -1000
Message-Id: 
 <3c69e4eb08701516150c78cf8b48f3e90d197b2b.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160515

From: Konrad Weihmann <kweihmann@outlook.com>

this should prevent running into the very rare error
sqlite3.OperationalError: attempt to write a readonly database

As highlighted by https://www.sqlite.org/faq.html#q5
it is likely that the adapter won't allow use multiple exec calls
at the same time.

So it's best to prevent multiple accesses at a time, by reusing
the already in place CVE_CHECK_DB_FILE_LOCK

YOCTO #14110

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 677f5741bd265be49d4a5bb933b3e8d8c4eec653)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 97cbc63d1d..6eecbdbf13 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -110,6 +110,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build after do_fetch
+do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.25.1


