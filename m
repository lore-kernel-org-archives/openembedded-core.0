Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697A6C47079
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:03:36 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.23978.1704463412173838447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cwVujdSS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9cdd0a5e6so1016830b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463411; x=1705068211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgJH0pT4Y4yKMHqfoWpRea8etN5/sbtBC/CQqp+SYh0=;
        b=cwVujdSSt5+Lgklf84UlOChv1gjRpN4stuRofjZicT8Nc9SxYVEMaI2vSXlTkqudB4
         tcTEd+actcO3ZBfFeMf0jKFskPHuUfkJS0majkCKuby9soj4nYyH2l/xke+S/JA5YAap
         /W4LIqiW7/LtHYoUOrAiCk0B0Bg2dsgR7u0dTcRSBQEYWfNiYWpBBgDXcdNFu2YV3SqW
         jrm4t1hACLpSsWpSpeYN+diqab3buLrzJEmRMEOEF5obq9sDSaQlvwFYPOe6PcttX6qf
         vRQytqkbtW9JcGr1/stMEX43hE+rsV1fDy2hDydxzCMOAktNAMe3yQB0W9jBwlfzWgri
         eJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463411; x=1705068211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgJH0pT4Y4yKMHqfoWpRea8etN5/sbtBC/CQqp+SYh0=;
        b=XKEpDxOZzoNheuJTbcV+m6utAzuXnC9AiqM1eNyW+7jn/CmEd5sllGFDQncppdSHhC
         A77wyMsONqT0TyQ4b73LZiaPpDZXFseV0WgeuEY9Um3fpkWAcTRSJEadTZb246Dd21+J
         8BRkDJ2OOZ+L3nU4FPFE9XBzSqqH4W+LdKi3DPqqPeTZF0Tk4m8zPtreAE3eHxnekXFf
         gXy8dyg5MSG4xNyiRxCIUAvgf7rxrsYAA/RJeFI6ffKEA0gHX4J0z3YOo8c9aiBk2iNv
         v/0mE9N4DwgwNnTxyamTLTKeLvIsGZLzKbOJORzWH67th/0lWR3rCmWnvS2H3nwIJLRd
         uWHg==
X-Gm-Message-State: AOJu0YxtQKLCOYtddLpl3qBo9bm6fppuzLXVDym+Le2wjv1+RkNVuwkM
	FxjUbwsOE5VBH4TZ15QuFsTWK0j7mod++X6mb9RJsVIcRwamVw==
X-Google-Smtp-Source: AGHT+IHDNcY2mvGKm7bFKbh5uZST/BOnYj1QWv5xrt5k+DWW3DOOa05pA17ezoxwp8bB+7tP9oct9g==
X-Received: by 2002:a05:6a20:2a23:b0:194:f4f:f538 with SMTP id e35-20020a056a202a2300b001940f4ff538mr1707057pzh.109.1704463411173;
        Fri, 05 Jan 2024 06:03:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm1430097pfq.194.2024.01.05.06.03.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:03:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] linux-firmware: upgrade 20230804 -> 20231030
Date: Fri,  5 Jan 2024 04:03:08 -1000
Message-Id: <b3dd6852c0d6b8aa9b36377d7024ac95062e8098.1704463208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704463208.git.steve@sakoman.com>
References: <cover.1704463208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193365

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7c725d1f2ed9a271d39d899ac2534558c2d103fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230804.bb => linux-firmware_20231030.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 507a003224..65cbca798e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
+WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
 
 inherit allarch
 
-- 
2.34.1


