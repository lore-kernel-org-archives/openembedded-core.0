Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABF1CA0FEB
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:53:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13595.1725022379725805438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=On1LKeUy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201f2b7fe0dso15163035ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022379; x=1725627179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ne/Yf2oofs1SePTeshBCHmp7Un+3gaTFX5nx51f+/6o=;
        b=On1LKeUy/mi458V2k33sNu4bwq/y8miQ0+AQEkobPZukzGtJQuHPmYjWvVtNYwAF5q
         R87ikUtkqT3Z5rZCW43mk/2NEsyHe5a6CjGw5e+RtzabQKlJp6X+Z6rbUOU5+YmSfqu+
         qIOpFVtPXZV5XYTFfGXMIe07M6WBaKmF2PP4GHH87n1dPzXFRwQn9bJbMz70NE18QdGn
         Jy+JC/Ti06wAef8XfIneaS6/FykPWYiO0+YvStGXcM1AtsUjvH8jzMAQQtiuGaGmv5rt
         qhDe0Z3uh64TI+si+TpIB6VKEEjdRE/FcJ0K+f5dd3eN4XnlOoAM5HnPqg7enQCyWtV+
         nfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022379; x=1725627179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ne/Yf2oofs1SePTeshBCHmp7Un+3gaTFX5nx51f+/6o=;
        b=p9KmoOuLcSLzXQqkVyhMLCGRa38oGOj74J5i61JanfCgrY3OY/XIzA6/WtYI3gE5JP
         6bvE2i455eMgwCKWSRy8jlvVltj3GY4Llvf1t3lsULbSGLjQwBFQY75dB/kotFC4CTaU
         MJyzthz64mo/Z1a8hbIeguEHjTcg96spDdO9rEO4jMIoLjqXBaRFJvSugJKfeXResJfY
         +QGW6QYeXhi7Tu1EgJqNIJAQ0NAM67nL3RrB1/JPo/cDUZON4OgvUBrE1LmRF+7CR3Cr
         75bsDnPo8yCKhi6qEr2Qhy4uMhMzL1zjhGrUhNXU+CI6+bye7/M3NFbTn9Xwp/xbd8iZ
         v58g==
X-Gm-Message-State: AOJu0Yw4I00BxY/wU5DJynwg5CoL3v5/5zpc3HVj64ASRDNesuFo4Ze6
	H9psbecE3i9ijwbcv41CSNt+D16c6y78M1oRelncIM1NimbnDTMPUm9qKmr8h7+6axlJuhV4qwh
	V1y4=
X-Google-Smtp-Source: AGHT+IHxuqija9TmDup5T2oKi/kQQ7D3eJ2vG1oo31f/n1c/BlRmtMB+p6ugGqIMfhSVWoRUcsdy1A==
X-Received: by 2002:a17:902:dac5:b0:203:95eb:380 with SMTP id d9443c01a7336-2050c5255d5mr68188395ad.64.1725022378984;
        Fri, 30 Aug 2024 05:52:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:52:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] bind: Upgrade 9.18.24 -> 9.18.28
Date: Fri, 30 Aug 2024 05:52:45 -0700
Message-Id: <1f065d8358ab0fb6c08b2aad2145786c31294721.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203964

From: Divya Chellam <divya.chellam@windriver.com>

Includes security fixes for CVE-2024-4076, CVE-2024-1737,
CVE-2024-0760, CVE-2024-1975 and other bug fixes

Release Notes:
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-28
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-27
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-26
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html#notes-for-bind-9-18-25

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.24.bb => bind_9.18.28.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.28.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.24.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.24.bb
rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
index fbbebe89ad..67628a8650 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


