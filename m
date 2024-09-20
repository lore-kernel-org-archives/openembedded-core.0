Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA5CC78850
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:50 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.18283.1726839587793327400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JzLdHDRM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso1532578a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839587; x=1727444387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKLbxdNbjzmsujrZaQbgrD+hD+Ssv0kYBG/XvjvuJj0=;
        b=JzLdHDRMUrQKq6yyJywSIwgobAxLlgZ0Ozh9bzbgYvMVBPoHLUas0nz7dBuHliYUW3
         Mh7TXsZMLjJxHsxp7v/m/eC45QWNOZE/QFg+ZmM9Ywor4fftA/78gUxKbm2SZBn4LBcP
         NwfmI4wc9aGSNSMddSSUS5bX7oaivGTPKe9xXN1jBM8kzBFxrFdC0wIpFbMQh3EBFhhe
         w0QzPdmZTxOYcG9CEReVz4myY0LNyZLwnQoJ2O9+LQL3t7NOFJyoBIvGSgWD7B3r0LEP
         1lNfjMQyhiDvkeLa7tFQn7l+UDvjgyWdcSQksOxg94Uwd+333dDViVEMVOLVpYd+476x
         nAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839587; x=1727444387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKLbxdNbjzmsujrZaQbgrD+hD+Ssv0kYBG/XvjvuJj0=;
        b=pHVdyjMRVN0Xn84Z5ec811OoAER1ZZAdHVH5sr0JItER69bZm6E8SfLZVrebfE8WQn
         Z522+C0JpFld2rl0ZkgPwxYrtb/91IIeGmulskHdUAERLLwqdR/F4OaBMGP6W+WfeT/9
         0JNdW2OTwniLuhhXXyE9jJfP81w595jrc3fd771RtB0Lxq4ZsCYjh2U6QEQUrYdm4hnQ
         nuWmfr8oY1x3y7tPlAv0aUq91+4AiemIfo/+5ZR4ey4uqoG9vy9QXOQ/zQm6aPffefsp
         N7YLlqiO66V09sHglH3de6+Q2U8Y1lSSnrXbJSz0G8SVnTM6pQebw8THStw8eKmmAyow
         LNGg==
X-Gm-Message-State: AOJu0Yxq9y9R2IhCQkhc8Fxgju7WX9s7Tma2JrDtrOjLBKzCnff7zFKX
	rz6cl8s3oORlDT/MDHYE0i3BfVoDWwarnxNzXhXm06QrgDZPyiw4yM6DUTxAxNa4cKVnbNI4AUP
	l
X-Google-Smtp-Source: AGHT+IH0PWStZkdgIswezkCYIWw3FHnnjxX0xmeO8noDj/ORSD+4ZNpiePcE+WMwxUOiN/7iOgpNEA==
X-Received: by 2002:a05:6a21:3389:b0:1d3:edb:d5cd with SMTP id adf61e73a8af0-1d30edbd6e4mr3333168637.16.1726839587050;
        Fri, 20 Sep 2024 06:39:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/16] bind: Fix build with the `httpstats` package config enabled
Date: Fri, 20 Sep 2024 06:39:14 -0700
Message-Id: <b87811febbb1a33182d8a3eb8c0f671548ae999a.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204755

From: Alban Bedel <alban.bedel@aerq.com>

------C65ED3E1A5DE826CA595746785F6AF6F
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] bind: Fix build with the `httpstats` package config enabled
Date: Wed, 11 Sep 2024 08:26:47 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

When the `httpstats` package config is enabled configure fails with
the error:

> configure: error: Specifying libxml2 installation path is not
> supported, adjust PKG_CONFIG_PATH instead

Drop the explicit path from `--with-libxml2` to solve this issue.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b076fa51f5e6fd685066fb817c47239960778e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bind/bind_9.18.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
index ca2aef233b..4b0948298e 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.28.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -34,7 +34,7 @@ inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-a
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
 PACKAGECONFIG ?= "readline"
-PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
+PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
 PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
-- 
2.34.1


