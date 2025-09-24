Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37981CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 11:32:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.10277.1758713572814196638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 04:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nn9T1Z6Z;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57e03279bfeso1129014e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758713571; x=1759318371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cwmi+XMhau/+2Q8lUd4QNDlDrNn5reje4ONxLcUFtYk=;
        b=nn9T1Z6ZoT2P4JtRiUa7kz894nGThcuf/a9XDSTNE9WhccXZ1OhJJ/LBq/gGBArVDE
         u4hSmWjmA718SHN4kAOuINrJWALjPc701K2u1WmczE7lWR1wKb7u3P+z6l74a49uhEoQ
         mAY14gLmgSlCJ+sU2ZMpg5iJRMNwbIXCi7HmGuEIGq0ZzUmCDFu76iKeHU6uvXjoB1qL
         JervYhgmB6W7Hf3brLgB0f72ol7d7+U4k7dyCG66eS0l+PeEjYjLBgsREQcL4Z6lNhQX
         5GF2vcplOEGAbD7VFMUV78pZgC99EPaOVBh+cftuJ/CGnI88dJ5PRooGsuzaz4OTdUt8
         fOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758713571; x=1759318371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cwmi+XMhau/+2Q8lUd4QNDlDrNn5reje4ONxLcUFtYk=;
        b=s7oaMC7kkQR7y8FLbGvNJBmbNGV4hzwQSHMEK/hqUzwr7TdyuMX0yWd5sgPkKY0ZJx
         MMLiSIVzkxwd5yK9+UNaMicahVewKu8kPrGvLntotzrfeXelDY/0dHIr+QoWXx9jrBAQ
         /G6oeQI2RTpLeKK9cbXLXHbA8cZYIi8Fyeaa4ide/TRbq6I9POzpsPA898ZnYjnjgiO2
         10pQ7yydTVDi9nNYtkXN0dYyPf9vu/lA6dctgzYxy1oDVdf8+ShJ/TzI5GTXdQhPonls
         6S6AqxJb8HSC5pxVhrozU7SSt0T3B0XsyBbHtJZkzCCoWIK1c0tbCFepQHAaH2jrPYP4
         lvJw==
X-Gm-Message-State: AOJu0YwYBJlAQ5gtqMJrjWLr4slzHFmvDrFpJWEj3W9CCDnEA//X4JdH
	ufk9sCgICyYuxM0UcgoiV5MfOCbivZ/L25I4Fwywmwvt7mRZsupRWAXtqicEBW4iNtP2fPxh3BY
	VXmxbJnI=
X-Gm-Gg: ASbGncv/upkI37s9H0U3RP1bxMDwLKJ2u+fI/ZL9BRqH3IrJGZjygrpoTQ2t2FtNbAT
	ZingHqmgdhHsej/HwIP7Mf2t2tTgCvMV+z0Tuctpm9cmNG3dUFe8lWreC17k5kVhUSGAchFJiCu
	bQQalMgHsVEGHDNZdnvS1lRTKo1IUA3kTnnfuBZG/kYR5mLwwkd6yE1vZMNa2QBr/z6HfB2weNj
	9SZNmSmsx8tWH6jRdHQmXvtgyNoFylfjaB6ipw5crlD0qJ4S2IxcB4OgQMphXrIDEG2J63XXctI
	3He+IdN5Rl0dwzkqBe/r2VtKSiQv/O/3zk5659MTjTX0tuA6jXUfVAa8Fk0I/oJHFpR4CC6HRqy
	wZ7kn6Sx329tM0G3QyntaYM1snz1c5MM80FQz/TSkT9hL88Ujk2A5LunI
X-Google-Smtp-Source: AGHT+IEJ5OHjODQXTTbv1yDeKBbZR1lN4IL0uvkueSUFARNWzOnJVjZNqzv+LF0+z1AkSk9hTF7Rgw==
X-Received: by 2002:a05:6512:3f02:b0:57a:8eb7:1ea2 with SMTP id 2adb3069b0e04-581c579814amr881465e87.27.1758713570728;
        Wed, 24 Sep 2025 04:32:50 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e80683e89sm2599668e87.95.2025.09.24.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:32:50 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] fontconfig: disable tests
Date: Wed, 24 Sep 2025 14:32:14 +0300
Message-ID: <20250924113214.122362-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 11:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223961

The tests require json-c library which is not explicit in build
dependencies:

../sources/fontconfig-2.17.1/test/test-conf.c:27:10: fatal error:
json.h: No such file or directory
   27 | #include <json.h>

The tests are not used so just disable them.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

v2: disabled tests completely as suggested by Alex

v1: https://lists.openembedded.org/g/openembedded-core/topic/patch_fontconfig_disable/115409591

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index 22bdfb139c..de2642bdd1 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -65,6 +65,12 @@ FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 # /usr/share/fonts is already included by default (you can change it with --with-default-fonts)
 FONTCONFIG_FONT_DIRS ?= "no"
 
-EXTRA_OEMESON = " -Ddoc=disabled -Ddefault-fonts-dirs=${datadir}/fonts -Dcache-dir=${FONTCONFIG_CACHE_DIR} -Dadditional-fonts-dirs=${FONTCONFIG_FONT_DIRS}"
+EXTRA_OEMESON = "\
+    -Dadditional-fonts-dirs=${FONTCONFIG_FONT_DIRS} \
+    -Dcache-dir=${FONTCONFIG_CACHE_DIR} \
+    -Ddefault-fonts-dirs=${datadir}/fonts \
+    -Ddoc=disabled \
+    -Dtests=disabled \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


