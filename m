Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC8BC28B26
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.6412.1741212687984970982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lwTavx9R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22382657540so93566055ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212687; x=1741817487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYXyDo1ZR4IO30ZrckVhdwe+/emlvfJZE68pQzSqjuo=;
        b=lwTavx9RBhthkL0LOuzQt0Fva7AD1UfH3FJBQCjIGL6xw8taJFImx7ebuDU/M0LSqF
         z+8eW+h/vndzY+2QvUdI7lPP8c93EiEO/5iiKJ3oICJfGfEANQ0V2VfxkbqvyorcKB6J
         W8/UzrhwnN6M4dgc1RBroC6dm0cR6AlwUC1WBp4x396s8wRJkr+ZHDRYgqWCAOmKLKlS
         GzeRmt7zpD2dAiMG+dRP5d0pRie8DV8XaISPfFsDA7dRshAB1zdr5HNOEj8UDy3uwngd
         aQo/c/6wkFaUmT7DdkfLiksBPPUxmr0y4Deg4k1FlMJdPbSeueCtLt+qaYn3bLRKCxgh
         QeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212687; x=1741817487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYXyDo1ZR4IO30ZrckVhdwe+/emlvfJZE68pQzSqjuo=;
        b=jRem08fBMc9exRcJJ6KYg6b3TmP1xuCPooVj65B4tGkaDgvXtYkzNlOu2qTt8EA9gs
         95ajo3J/byBXK/o8U2t5cS8LYJHki0/mJKB8dlzkTo+nqunoCTI5bttEunBv+4mMjMLq
         C4s8MnNNGHi40WPNoRP4lWcwTAyVFrNcWw7VQl8V7dh88rHwzxQRObz9onDtU3OUFNhG
         nQ8wMNVMwqe+1O+oXI5qeMvi4j3yQy98NQ6XJW5rRCCf5YFsk0kMPTTnixp2UP2yD4AV
         Yds9WB07OGdOid46+HAPSlv8y5Yx87OjhN0sicjcEojKF4iX+MqW+u69i77f87qmvG7/
         Ebig==
X-Gm-Message-State: AOJu0YwFGZw4f67vDp3cE2iXHm68pea8H6R+/59SzdsOOAMmx7427Vb1
	FoWyirnizlUumKsAqzWqaq46lE6fZQmWut88INrOlnf89+6M+yacsboHqgnzzCU8sAc0dwcQjU9
	Z
X-Gm-Gg: ASbGncv7qKCb/05qvcVUY9+CLz1mhy1aWuMvwayRDC5chJmh8x+5+mf19hegXKIra8r
	i5alyQVDSQt01iRJYLlLrefSJhF5SHPOWZVvTZ6ZrGphdAA/IEIXAW69hb7AhS+4Ed28skH/H1R
	F6y/WPGaYIFKZavoAYpwNcN7czQVBaDaRD0jj4KjmEHM22QwCB284oYr2Vm5Itp5f/TQyFqZYHa
	7yHFvk4CWJ4Q+LmDFQR2Ys1sPwIntizHfkNJoPG5pssjkPMe/56URsunlLs6npCg83stDdp8Aen
	yIlrDMtb+qNHX6jRXiYGyLVNVJo8ORe+2gY=
X-Google-Smtp-Source: AGHT+IH0FHneT04aOzA9Hnr4SRrDlkuXcEz4/RtCPA8m53fwYoNnuzf6k1t1B5BO1fJyws1YRsqzCQ==
X-Received: by 2002:a17:903:1984:b0:220:eade:d77e with SMTP id d9443c01a7336-223f1d20e5fmr81102825ad.40.1741212687287;
        Wed, 05 Mar 2025 14:11:27 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/16] curl: ignore CVE-2025-0725
Date: Wed,  5 Mar 2025 14:11:01 -0800
Message-ID: <8c3b4a604b40260e7ca9575715dd8017e17d35c0.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212352

From: Poonam Jadhav <poonam.jadhav@kpit.com>

CVE-2025-0725 can only trigger for curl when using a runtime
zlib version 1.2.0.3 or older and scarthgap supports
zlib 1.3.1 version, hence ignore cve for scarthgap
https://curl.se/docs/CVE-2025-0725.html

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 439fcb7881..ddd591dd96 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c65
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
+CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
+
 inherit autotools pkgconfig binconfig multilib_header ptest
 
 # Entropy source for random PACKAGECONFIG option
-- 
2.43.0


