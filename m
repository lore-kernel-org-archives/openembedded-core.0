Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1664AC61DE0
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:42:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16641.1771663357317323909
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CPBVJtd9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2164280f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771663355; x=1772268155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRzeeR7+a4x/wUwlrZxIEEZsZja3/u6jDx5CRZeqlAM=;
        b=CPBVJtd9d6TCX/BMxXL6MEpv9KK8aAGyj8n011mfkp/KEm8qhTmy0cRZjCLRt8+0rf
         C9GIdkrq2rFHC5TAWHAB1eRhi/YsU3CdXKvASZmHOjtSICKXMV3OD+qSsAxKUHzXCtdg
         f2mblzvGjHtKoqdvXh1jfdqxiAhTDIUanTKOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663355; x=1772268155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rRzeeR7+a4x/wUwlrZxIEEZsZja3/u6jDx5CRZeqlAM=;
        b=WPCeMNFfFqQdctcOs1UQ1gQT2EL18Z1Aqk/P+RrBEriuk4KoqOmvFqVN5eLLUBa4ZV
         8g2UapdMm73p/VZolTkmZJ0/PnDhFBqYaZ37+onFGM3UAklgsOI2RIaaBpU0yzHA7YX0
         gzokVLJcIUpLEIncaEjR1L5dvpqglhFJFnv9lQxfC4O6zyV6d0LCoQk2pByBIYcyX78I
         SYRNhqLfMTy9Sqo+iaozsl4UwvnF/8bAiOAt/yA3I696qyZw3v7DRT+oB7D7tB47BjfO
         54b/YQHtOxkcvESRxemPMY7RyM08ORD2omtXCoy5bHYBQw6kL1wZdKDQh9auS4SGFFtv
         99rw==
X-Gm-Message-State: AOJu0YygaWMXZRSiAQgbIs/pI40DRHvRr6tZnCGvmS9vGEIxbHvHLpYO
	aneKTdSw7IX43/h9CbM6cgMAYGOPmwZTOb9m2M2iWAszFH62lOo3XGtnxtwhonQNvUKywSUJ93g
	awQx+1Bo=
X-Gm-Gg: AZuq6aKTHdLOqWMzulxZKQNRmAv1TIwUUSD8492v/TD2Vstty89Xk/HXkR+S6QEaLxD
	Rh9uLKJVUhZYWEfpXr/FprPxopbB1cW/2LdbeHU3oRzdmMmV7VQdUDfdiaE0N8X4FkFp3UAGs46
	M9I50cs2xGpMy2LZ0swk4URwZz2qDtlUOehcCgAQLNksXLYktRnJBL7Fq13+b0EgF5OEy6ShL7J
	HJkSwrbfJndxEX3D2XurRl37oTPCQYgUwWSlPr2GyYgqGfwEUjrFFa8+GF5DuUXBf+SSmi6D00R
	4dxP45zwVZfPO/cXFFYSor15kzZ0LT6DAE+MHVzB07e7DuULd8ENaPpUMuXc6tjEnNfUHDYb0Ua
	BJ8K09v5R4Jp9dBHyzEJLO39HtXp8chvLc/pvSe/HMolJf676iWo0PU9R0LQDpUqfruqE3OO/eL
	8R5m7uclZbYOxwuZsET5aQCWJ9RE8HrJ5ruPZ1lMnTTgVFbEb08Do=
X-Received: by 2002:a05:600c:8b2a:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-483a96148a7mr32888335e9.34.1771663355197;
        Sat, 21 Feb 2026 00:42:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm205898295e9.1.2026.02.21.00.42.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:42:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] distro/defaultsetup: Enable no-static-libs by default
Date: Sat, 21 Feb 2026 08:42:28 +0000
Message-ID: <20260221084230.3219379-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231611

In general, few people use statlic libraries. They are however large and take up a lot
of space on disk as well as taking time to compress/decompress and tranfser in sstate
objects.

This change disables most of them by default for disk space and speed/size performance
benefits.

This change has been tested in poky for a long time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index f4a2d004a36..e8f5439a8d9 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -5,6 +5,8 @@ include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
+require conf/distro/include/no-static-libs.inc
+
 require conf/distro/include/uninative-flags.inc
 require conf/distro/include/yocto-uninative.inc
 

