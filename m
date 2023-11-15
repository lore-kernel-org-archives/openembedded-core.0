Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89133C47071
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4883.1700018290496096712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pvyOpMoh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc2575dfc7so47771675ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018289; x=1700623089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMlAktUYcjXpOXky8zYCqIKRSIKAPiKh83MyGltZ5JY=;
        b=pvyOpMohRQjk3zp5UViiDIleFkF6VIAaK44iTU2NNQrC7lMz5MvR7FQjqWy/36v5mY
         DJvOGevPha7s3XBtzYVBGrOdQI/H9AtnLIk0bse88RvgvrTdQGLAsSwIIk1+PzT476vt
         BkIbu6//HxrdhmLmhcr7lNHmzKTo3/XdTPNS5zIML4ywCBzynk+1PN/y/ryhjaZeDtMX
         KjVWczQtc1RyMOzCKyWWgfR96D6VNnnCL/P/we00qqws9+CrEF1Ozh/jMhQxpTnDL8ON
         6oxoHdPufpK0ash7aW5Y9mzJOCuzo/U1Cl2PalNgR1Jewcq0ByZ2mPrfXWiPCsA5ApUo
         EZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018289; x=1700623089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMlAktUYcjXpOXky8zYCqIKRSIKAPiKh83MyGltZ5JY=;
        b=Y+GWMArAhfdXLa14boKX2g4YG+xOqSN0vPxJp9w1DMbYZwjd3u4PhPsW0p5BhIvCN/
         ESIhf9WCmSZ0bpHgkWQZ6o+WOJfp2Fz0DAlYrJfmkJmIelDxlNX6aELIYyelCx15u3ez
         oNcBpymITvOwUmr8z8zs0zqlnqZX9xIWiVwM6p6cVOy0MRdBbEyILVmoI2Oh6yKuxKhx
         jWqpQq3clsJWltKJYGgwpNSMy2tVtRLcD6XvFr5ajq4KZZPBOZxUqw1olHdoBuZkUlzk
         xCnZTbKMIh3GWMad54lFTeqvIcUEvqtNytMycbFPm1LnMfgGdoMPNhPDCPacsqSZP2I0
         edxA==
X-Gm-Message-State: AOJu0YwzaeyUxm44szHWGR6SzbtpVEuIsC2c5GZgbAVREsFdIKKD2Z0A
	6s6o3ej4iKZBvdhzmaj5LxD0QMbpZ0kOk6DvezWnOw==
X-Google-Smtp-Source: AGHT+IFtZyHXlBXqIOnGAX9c3uj1hcaC5VTwpuiToPuB1qN2ZncJS+9uuOgkEbgNh2GC4XvpqVkomw==
X-Received: by 2002:a17:903:22c3:b0:1cc:361b:7b10 with SMTP id y3-20020a17090322c300b001cc361b7b10mr4664216plg.24.1700018289254;
        Tue, 14 Nov 2023 19:18:09 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.18.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/17] lz4: Update sstate/equiv versions to clean cache
Date: Tue, 14 Nov 2023 17:17:33 -1000
Message-Id: <f398c84405913bd8038c007f43f991f54d136571.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190546

There are cached reproducibility issues on the autobuilder due to CFLAGS
issues, flush the bad data out the system by bumping the versions.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index c2e24b518c..bc11a57eb5 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -12,6 +12,10 @@ PE = "1"
 
 SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 SRC_URI = "git://github.com/lz4/lz4.git;branch=dev;protocol=https \
            file://run-ptest \
            file://CVE-2021-3520.patch \
-- 
2.34.1


