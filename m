Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEDAC5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:12 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.605.1700498345837288712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uWMHbtMP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3479051a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498345; x=1701103145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt+6xK7m0HB0zR3TtULzv01e+CP+7D2CUDO0/QZuuDk=;
        b=uWMHbtMPGRjp3sMQVj+i2q9oqo+DzIUnSeZ1B1eh5xDlXPj4OigqE1YonqcBhYXTST
         XGsV2jVfC2jUh0vTFw2PFRe5z5eZTm3By0tQsyYyBo3ce71Pv/AP+Qail+2BQuYjTyND
         G8cC6oeFR8WbXGaxQ9++fgO1tq4Stf9SJetnCrFEZwFSu6l8KFI6cX0lXCL8P8PFyFSo
         zBZJEzEN1hxw7vP2cBUbNKx1NUxmb9sHUECZPD5gmlegAYsGfV+bLSSnqnbV7sy+eiyA
         eTa8/bklmUciCFH4kpCMi99VV+t/977fTQ66dBjOcqC7/qkVprA4ZOX/mLiWrzIvqjdB
         8W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498345; x=1701103145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dt+6xK7m0HB0zR3TtULzv01e+CP+7D2CUDO0/QZuuDk=;
        b=apeqEZerNZfl0UNzKF2if0QqwOM1otzbfN5fJU/22T3VYLKotS9lK+ef12gITSWDWc
         RtZeYiBwA+LBKul8q2e1fhc1mt7Z2mQXkwoHm5O2F/Apo+BnAsOAJmykivYUkCl7z1xQ
         blWk3meE77RC5jQxyPGYlFatMaDMX6yWCTdIVxAy/NpGaMoaZJ751cRGfibQwkjlrjOp
         FZIIc++QLGH1jojoTlZQ7M/zJleLzkU9i84FjMsowFeGwVmPo/gRq6piADtR0st+R9Rn
         zlIrqqoU2T8kTYrrh94i3k7n7cvYb8FMRKMSI1fegA9sdtGlW5F/6htYyg2vJAIcsLl6
         R7xA==
X-Gm-Message-State: AOJu0YxoXCzlsiJ8JlRPG2mvRBrgjTEbHUqyl2bpYWtVPz9R6W6VevpP
	fXDaZ1znorcYwzHQRbp8Tjtv5Oqnf9EMqQJT0FAWMA==
X-Google-Smtp-Source: AGHT+IFqRMokgdof1Pdorszxc3/Hpb9iktjeiZe6OkuNe0l6bbuHVPnUhpa50Sydxph6G7SHsenPHA==
X-Received: by 2002:a05:6a21:99a4:b0:140:f6c4:aa71 with SMTP id ve36-20020a056a2199a400b00140f6c4aa71mr10825663pzb.8.1700498344638;
        Mon, 20 Nov 2023 08:39:04 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/33] openssl: Upgrade 3.1.3 -> 3.1.4
Date: Mon, 20 Nov 2023 06:38:19 -1000
Message-Id: <de390034aecb23226a532dad56c821b4edee35bb.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190894

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-313-and-openssl-314-24-oct-2023

Major changes between OpenSSL 3.1.3 and OpenSSL 3.1.4 [24 Oct 2023]
* Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 104ba16de434a08b0c8ba4208be187f0ad1a2cf8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.4.bb
index cc9452c8ab..b1d5d8766f 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
+SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


