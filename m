Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2368CD44D6E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.45912.1730900994289316892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d4+LayMg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so4671045a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900993; x=1731505793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ccFKSBF3cAQeMF81oiQfZRHg4eLKlzIK4AITwof/u0=;
        b=d4+LayMgpWRn/Ge1K/NMmelYw2Q6O1Wq1fe99TDRRrnRL8WYP6COLXSXiLjrVjamV2
         QhQwiJh+c0YmYVx5na7P36tLdaEf/kOf4/+joB5NsuO81fPtkp4Vk1TaMIS1T/p1xeFG
         bO18AQE4i05Q1AtF65lb3CVr/NcMPjcfySHaIGzLvMRLd8b5CYNoiZQTW1xwACdK1zIv
         4iilW3uFqmjlAYyphuXBReYEQM/6JMG5J0Th3JKku8Qw4vpN4DUz8w6qQ9Y3d0Ex116J
         2LmnAJo+NoPImf3952lkfApTWQsbcJQ9TIkh41pwJUl8lMPBN2abp4e8GAZhXoq5EDnR
         VS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900993; x=1731505793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ccFKSBF3cAQeMF81oiQfZRHg4eLKlzIK4AITwof/u0=;
        b=MB5K2NIMn9q34dW7QA1YL3Yam9qEqzSCItrfJ+S8Ud4ui1WU3tVvjbiZiuJjh1eUJI
         VhKq1xdsZdVfwGeajow3OUsuX/kwGSvSx0lGQW841mebWcA767waDOGNhsNeOW+JXY47
         4/5cmINaoS2M5m4ZmU2y4O01CK7uaj6TmKkIACZsnZMrKpzTfDQKNptioXo18shhz022
         e23Q0dUqAmg8ptVyvd0BHsPTbO7As6shhxNQf2QBcpqzIVp5eVIggRizqPHGbwb7XiIa
         QTd9XS03JGDTb3kXPYQIIlB1V79jVxeelbnFSQ9bgF5S6MmwSSsqYRB5mEmzn8OchzuS
         zyMQ==
X-Gm-Message-State: AOJu0Yw+zuP4dN5Yty54g4mwWpBUSvw4OfLe5GFXJoRSjtStGzrJrMIF
	jaSPju46jIeSih8Pz9BlyTLZjhRrB6lW3miBnC4wlVBDhqGpDlnWIdZvYnOuTlX1tScgGafGl+0
	E
X-Google-Smtp-Source: AGHT+IHOqtPe2gFXFeED9ayQHmkt4nTtWx1flLE7qqaHhoc2PAgxT3WdtvOIXhGXnKcvNrL8VdEuYQ==
X-Received: by 2002:a17:90b:4a86:b0:2e1:ce7b:6069 with SMTP id 98e67ed59e1d1-2e94c529acamr29382188a91.33.1730900993500;
        Wed, 06 Nov 2024 05:49:53 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 6/7] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Wed,  6 Nov 2024 05:49:36 -0800
Message-Id: <0b0299415ec719bb4c3764dfa0740e4ff6cc0362.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206779

From: aszh07 <mail2szahir@gmail.com>

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9684eba5c543de229108008e29afd1dd021a9799)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index 3c66851b8d..bb6b71735c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -183,3 +183,5 @@ FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples = "${datadir}/${PN}/examples"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.34.1


