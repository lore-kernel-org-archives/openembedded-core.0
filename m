Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9259C83F1C
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:32:54 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.15184.1724938369012306736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wDsJFwWC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c1324be8easo1194994a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938368; x=1725543168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZgQWOoher3XAHgiU6dx4l8Vf0hwsNy4ttJZZYTnmnM=;
        b=wDsJFwWCMopu1yX2MRYuZu6F+1ZuY/lPBRQiqBu7bDx8dY6IYGvHhUC8X9kJpciLRj
         HEazoDtDxEwZgOjJkmzvlnGYzZ+R5/rslAOmpokvQgWXxGLPIAWnqCXdkxrEix85XQs/
         ALsCcHVo65Zq8beR6lyhuq7pvvOWI8/I/darLypgAfra87pCHQEyK8JbMSTuowqr09gJ
         lMzy+2JzB9i16Iw7rGjqYiadFBu0nC11GUAyhXEoqkU1dmsvL93bwKlezrVmoPQMrnO5
         Gp1O8wV5GF4iSX7Wx0oYbsosA5aNnIBn3lVmLR3tgQPqk0WiNbYQNjfZ4Q7m86W64uUT
         vf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938368; x=1725543168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZgQWOoher3XAHgiU6dx4l8Vf0hwsNy4ttJZZYTnmnM=;
        b=MFXPBoxufGt1RgCLRKnEN1TowmlMG4bDi2mMiex/AD7Frg/BpOnTBE2VVj1Fu6tx9R
         fGJgm6oCIbXpfswTqMXt+odNeg4QBjyZS+FOq23elyh6YyvWpdivFwC1hfTovukdRyD9
         MsN0E+yXhqiALw8QqsVm3VM1mKrv/vpAoXBP6oM3oUS357fNWKgxwWQMrvb3DXeS1aQY
         NEaL70MQdf8dQoAkIXZAPECAITOiszLpJIMN6F0UYMer8132oLivf8aPpzMYK+1cn3Lz
         1A7viqapb6iMhTrrQ25n6f0HUAnP0AERU2ylZCYuWsmE1jE46c2JKr1L/jt2CLgcD+F5
         Ervg==
X-Gm-Message-State: AOJu0YyTM68YOitDw5+y7AB0B5/OU8jXqez6tu26/HZiUeJL8adn5v2F
	fkMwfILvLzydqNggaf7EVNCXCKIIuKEoJ+AMrFEVZVE0S2SCIQTB+3zjuS9Yg6NSVl7wArpMr3X
	NAw4=
X-Google-Smtp-Source: AGHT+IGpnrh+TI6RpS6G5xnH7x+55xerv9bVLzgci+r4MYBBL1iHZiK1mrBeU2AA7OjwLSXrbu3dtQ==
X-Received: by 2002:a17:902:cece:b0:202:4bd9:aea5 with SMTP id d9443c01a7336-2050e98309emr40218075ad.14.1724938368184;
        Thu, 29 Aug 2024 06:32:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] curl: Ignore CVE-2024-32928
Date: Thu, 29 Aug 2024 06:32:27 -0700
Message-Id: <d8aeaaf2d2ac3308af1ec442795e9714f0e6fc8c.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203924

From: Simone Weiß <simone.p.weiss@posteo.com>

This CVE affects google cloud services that utilize libcurl wrongly.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27ac7879711e7119b4ec8b190b0a9da5b3ede269)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index a2cee8ba23..5442d8d4fd 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -23,6 +23,7 @@ SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c65
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
+CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.34.1


