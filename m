Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD75C3DA41
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.17572.1687961598517652090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Leqsmi8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b7f92b764dso21122445ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961597; x=1690553597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmmogTFLL4oQS0DV6JnOIMSKXocWeCPp3enqdNjH7kc=;
        b=Leqsmi8VmkDXqFnklFVba2NUEJ47CJlJKtukUjFZo/owf/KMavr0LFWicLV1bIZs2u
         JMsGSVJaLKN32JPrdfKwwAaAl5p2sixZbmAvPvhu6xJPa2NaYiHzipuMckm2IoD5Cpli
         xRrB6F4VEzP9fzdsLrk+2vG2IavlzN3CVSc9b6NsiHnOkx56R9pMhrsQ1vqPKhTOTYx3
         tPiqIjDBu87f0rrkZsfCyIqH9+i1mAAcP8rGF5G/FXg7/9y5ucUerw4obkDQQ6MH6cEY
         8vbUYc8NbH7SU/CgNg3EcrIcz0i0uP5hwHsQuGdjuWs+OU1antE6YVzkfNNHeivYfP9q
         LtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961597; x=1690553597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmmogTFLL4oQS0DV6JnOIMSKXocWeCPp3enqdNjH7kc=;
        b=Tlei9aMPGF90vZ2UUM43uvRJYDCKS6txnQU3q4zC6w7tAkWxoxWRMBaDigWgMFM473
         b93VGz/w+MbWRtlPjX0ym3zKr0gAku2tqV9HX0xbHEeIbxUzzva4wkkYnz1yOge3skKa
         80bKn8YWHLYAmAKr3MsiuAjom/exhST6T760nHaeTlAuXOlQOn3MxAgxc9rQWTD4MRBL
         GsDqcTkOJVyRWmD6+u3dYEaIe+8Npn47X+o8k6gPGLyJwyGx7NYU/4nno15/XhIb1KFd
         3F3E1MozymHvlUYSa8iiVfeTf/hJa/kGHYiNumUZSp6pHw45IiK0jWDcyEB0jwMv0IBX
         fZuQ==
X-Gm-Message-State: AC+VfDxV99pKF3t1X8UHrRFfKNZ0Z7cAwEcfk4AARMGCqU1fTAmHFhGL
	3lJBJG0KnDV7AnDrbFNkNW2XmuaEFiNZfKkX4CAiaw==
X-Google-Smtp-Source: ACHHUZ4gCq/U9dep+F8kCI6ICCEW9SrKs1MHtsL8I8MqoTU5W3fSWzy9UAYXLv2zNDkEciwXlAYk2Q==
X-Received: by 2002:a17:903:48c:b0:1b6:b100:1cfe with SMTP id jj12-20020a170903048c00b001b6b1001cfemr7954488plb.1.1687961597596;
        Wed, 28 Jun 2023 07:13:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/29] mobile-broadband-provider-info: upgrade 20221107 -> 20230416
Date: Wed, 28 Jun 2023 04:12:35 -1000
Message-Id: <82cffbc90caeff76a8ebb7ff1527b69e21b8a967.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183565

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 125f72393c9b6fea02757cdc3a22696945e0f490)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index e802bcee18..a4030b7b32 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "22a5de3ef637990ce03141f786fbdb327e9c5a3f"
-PV = "20221107"
+SRCREV = "aae7c68671d225e6d35224613d5b98192b9b2ffe"
+PV = "20230416"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.34.1


