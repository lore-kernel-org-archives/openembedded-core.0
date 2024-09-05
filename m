Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD98CD5BBF
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8186.1725540081094097231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mJ0FMSTL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2053525bd90so7145155ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725540080; x=1726144880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZIAXRx5pEh2wU8lQRQ2d2P1fhhOzTLFhVrZtYFclNg=;
        b=mJ0FMSTLbTuy9V0a/fhbY5pz3mmxFwFbc0xumpy/mFZz/YYu3I2XobY/NKXvT14Pru
         p9ujPW6HGRkDzofjUslq0S4YaBmYk5EY1oZLifuX2BWVYDez4/3gNvNy0T/xWvjbb6yu
         +yQfcL935SK5/qNNMJXt/nelCgacC1sDvesSotPyU8m0p5ozwjw/zZzFH0qq3hjuMlZY
         CKsTxmYzukq072RM76qm4OYBYsJvYZDrM2IZTWMFw+aFtEHpX8Kk9PH/Go7s3K50rEm2
         nKGRMZUWV0ReeDi92uHn4xBtt1C6ie+AUmT9jI5E1YfDB9V8R4ZD/tUWI34iB2RDK7ws
         v2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540080; x=1726144880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZIAXRx5pEh2wU8lQRQ2d2P1fhhOzTLFhVrZtYFclNg=;
        b=GLC9fvIEUE/DEaI71FNjK2YTsPrIKQoT9/zCl+crHqeFk47ZUHGgnH05zF+71oQ1ai
         ra7L7CCfn0tgJ1OkAEndK0+bRW+CQnkmyT0i0b5D9/2+9e7FhYTvEdxpYEn1Oso0rVem
         BntUo397Z5zVK1z1W5qqghNzQAhA+a/xwYKEJ0BnvBUxa19sqIC2O6NhhN0BDNMrxhK5
         Wu/NBV73PrrJWVPcJkkgJW3UQxUtAY94wbEC1QYBaFGHnvasJDgWFh1EW1nKJg7RUVwo
         CzR32hJZCNllQ2ag6S2jGmBTIvF7w7SXhbf4Hqs9BipbKwWXuGB9eIJabeEgpXExzwgY
         r20Q==
X-Gm-Message-State: AOJu0YzEQjbI+nkglepJoATsDrQQZ+R8YzWztg85nvMJhPrqJ064jSfm
	77vsOra3/zTC8zcRDpgqDJ2RboeEjY14Z9wXLrsYPFiwmQeGjLCl9zBo+1ptJaTav0h74RC2v1g
	aD+U=
X-Google-Smtp-Source: AGHT+IF5sTdJZfW85lqqHVUFYXqIhiuw4WXjjrmI73jU5qkZvESO0yxH94FQLUflN08BNNOEvJAeNw==
X-Received: by 2002:a17:902:f601:b0:1fb:2bed:6418 with SMTP id d9443c01a7336-2054ca754e7mr189890685ad.57.1725540080305;
        Thu, 05 Sep 2024 05:41:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm28107265ad.151.2024.09.05.05.41.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] wireless-regdb: upgrade 2024.05.08 -> 2024.07.04
Date: Thu,  5 Sep 2024 05:41:02 -0700
Message-Id: <f1dc8f8b95aeba1edb92d960074538239d9f643d.1725539924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725539924.git.steve@sakoman.com>
References: <cover.1725539924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204237

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b460d2d55a35450564ea04255153b0a3bf715530)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
index 95e33d9fb1..daf5e6dfcd 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
+SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
 
 inherit bin_package allarch
 
-- 
2.34.1


