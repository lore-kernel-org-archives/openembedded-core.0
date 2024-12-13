Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95E9E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 12:34:12 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.14205.1734093245285403104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 04:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Detcjutn;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso18915351fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 04:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734093243; x=1734698043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IP8V3RpQXy/+EPa1EvJ2NPLMgms9nARxLJGSsq374/Q=;
        b=DetcjutnWTc9U8AivlYsK3/74ox4qFCeo4aRHjbzOA++ihBe0PS0HJGRBAjeuWEHtS
         QOO4LfPJ9OgeIa7SlLUumUzHHwK4TBcMyza3IPAMxy84BxL4BF8RebSnWb7nPAkc/v/7
         Q1H9ufj60SAcQ943rStOGIMytHbV06KYIHHTOhRGJk+iIZd4gOIAZnbZtOFeuIQse4MX
         cv5H8QeLaarRviDHfX+tYiN2vLzW5P6TJ2Yk+Nwlh8sHloHM0lVsJEgtU+5Qu4mbXjyR
         fZyfxVaJz7hKoLoiA0f5iR5s9jY5/q6m08nYkhovFcTkEZEpPnxG8l1/q9HFolZlHffw
         RhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093243; x=1734698043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IP8V3RpQXy/+EPa1EvJ2NPLMgms9nARxLJGSsq374/Q=;
        b=WNcOGhkOnk4E+Zg5fnYELMmUhpa4U7gEt25J4O/Rw7rFEq1H0D153GcBzxlWRxFqcG
         lglBsoxzNjCiX8LLctlcF1mVgbDe4K1eTzegv5HFBpHr2JYilhl9PeHzjqKgIi3HMJeo
         ewjuec0IRqEucTNDB4PPcI5RjgbwFbGA2Q51cVM6xnBURQwsMrNphalKxmNe7eMae84A
         opttmmLwbDZKkU80tqvryF4XMLRW/wr+/pc7kXCvpsVz8ajGW8Rf3BSmNkdbq/M8RP5X
         8e3b8V7yhVPIGOapL9MUGLuFJlfU8MEjzZ6EVTN7iKbIWujiXQ3ihn36WVN2GMXO3eWS
         xnqA==
X-Gm-Message-State: AOJu0YwMa6wa4FJLPD2Qn5E3wEUFugZy7Wo1UVKRtxBhaABQPsNngYhw
	1zzl+7lSvUn9im3l7Qb2k5krDU2xRVzmzZfUxAvtCkxE+o9Fze2o+SoWE6ETj5iOxpmFIXs7LX9
	1KW8=
X-Gm-Gg: ASbGncv1aCMR3Ro+S8cXiEmfGUkFgDdh9SKLmridx8MztuczgzwI9w+ywZYKAkozzGC
	QgiaCPHmPQ07wRN6IvFIkUc4OKOy73eggNbiB5FtrAxVt+Jwdkv+mRjuGRPyMWq0vfwRhaM7sUT
	RzIiNmnsdroraqzn+vPrHvYakvW7xodKplqS7JwMVXZP8fkRL38J0cHMGSJHM0yTvl2wx4bq2qJ
	zSCkZ2KCnhIqA+aYJC6iYO1cAt+CY7tFbT2kIxqmDHwlxpV7Cg3Hh5Pnp/AbmU9x66cWL8bYcqW
	Hq+UNCuurO+XYgk/6+KwILwelKCFLg==
X-Google-Smtp-Source: AGHT+IFTzzK26PJp5uJVza6wlIHjVGgSguMpofVIpmjwamjigCrKA8GT/VuNwujULAMBxO1RWCuqcA==
X-Received: by 2002:a05:651c:542:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-30254566684mr7490601fa.4.1734093243421;
        Fri, 13 Dec 2024 04:34:03 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-4f4-2a00--193.rev.dnainternet.fi. [2001:14ba:4f4:2a00::193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3003ea2d232sm20008681fa.45.2024.12.13.04.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 04:34:01 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] systemd: set CVE_PRODUCT
Date: Fri, 13 Dec 2024 14:33:29 +0200
Message-ID: <20241213123329.707939-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 12:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208683

systemd.inc is used by systemd, systemd-boot and
systemd-tools-native recipes so make sure all
match to "systemd" product in CVE database. The
split between systemd, systemd-boot and
systemd-tools-native is specific to oe-core and
upstream just refers to systemd. Not limiting
to "systemd_project" vendor since multiple
vendor names have been used in the past.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 989ca667b7..f771058141 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -20,3 +20,5 @@ SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
+
+CVE_PRODUCT = "systemd"
-- 
2.43.0


