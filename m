Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757C7C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 17:18:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.22359.1749057481037943611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 10:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JEbOKdWf;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so1512728a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057479; x=1749662279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk5YjMgYTrbYUcixcmUUr5aVZciSqmonEuU4JkLOrxM=;
        b=JEbOKdWfkxI6HDuEA/MuCp7+V1wtxg2xAFqRMEEqptPcpWj1hnHLYHKhQgJdxj9D2d
         vm6G8ouhdR1wUpKhuS4+0C5JNZwQKj8bbtX8ynyfe6HWDhVFl66SN/lGV978ISWom56r
         MohUfg0vAcZhfi80RGHk9/5A9tWSRa/o4awXYdzE+HK6mg2hK0IcD/zDZ+qliv24J+YJ
         h7MBJU6+/+CHzFYWL6BNZO6DPhqO23nT3vQg5Co8kV03D0u4ttqX2ru1YuztCT7ZSbIs
         FiuKsiaPxcU3k4Vk6PucsXq0kES3j/jfOzlLeM9umevuB1DdkkxWqEMeNHtuqvob4ve6
         BgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057479; x=1749662279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk5YjMgYTrbYUcixcmUUr5aVZciSqmonEuU4JkLOrxM=;
        b=uS5POryRC6gdLmG49b1G2YCuYvkuw5D+/3hCTUu0X730PTolSYVqFoIOckgoz3rElQ
         1uX+6G18Oxnxz9BFpHOV1FAlmvLrYhBYX3IP7ltiJJXNL/3Y6s7D8++SIoC4onF0IPLx
         0dpZ7dg/JJP5bzepjw02iSTWT/r+H812tcutK8EZmrdYa10WmsFdibZYaiGSS7rAtFAf
         0WQ/sY+AviA0cY6ouSYApXXjRvwywuedLNuOQrmq3Q6D/qO+ExQ6Hik+eFAYanjekaRO
         Smk8ZynHpLHzalh2bjvwYRcwbwbtfJN2h4V5O0FK0s4LODYXELz3OnrT+SJ5m6cZhIMw
         23bQ==
X-Gm-Message-State: AOJu0YxmpFPa+HMPI/UgngeKl2Ipb6qBmFPphInwMsfZkte5Cr/J6U1o
	W4bjwVkEuVEmD5/ncHm5PGhGmBNTkD6/YYHPRD344OlHxh7n46TMw1WJMu/ooIp+
X-Gm-Gg: ASbGncu7Rpim31SHzp2LYLW2ECk0ffpjvgak2uciCMZ2kP4RTcaQyLOReMJe7xLU56g
	+eeJ4neWIQ87GeKxVSp/GBHfmdI20noCEWt+4Mvn5Xwk9n+ogEIXDsaf1Ko7kZ6Brvt/bo6Q12F
	Trk953ANFGx+I0K6WrsthOsWTKy0wXRAu4f2mLpLakiYC6R1hgco0L5IhdEhbjEfmiq6MEDNdG1
	QNN8xIupJB9FFuTCiD65oQf31FVvYL7X5gNUsMUhXwncTj5IpmqV/Spo/+xYiSD0g7LGEQfUJ5G
	H1nzSwGt0JujfQitpXvDmr6v6cCeGUTcyYNfXMznG8ZuROy+CtBZjO/xUphLElGLdo0=
X-Google-Smtp-Source: AGHT+IGZdDqccpXLw2+kxZd4JsD/OsAUZOeK45xVETwsNAtVt1QAVimlfuQd9w5SEaeO51GHHBwK2w==
X-Received: by 2002:a17:907:868f:b0:ad5:42bd:dfab with SMTP id a640c23a62f3a-addf8e3f4d0mr353954466b.30.1749057478990;
        Wed, 04 Jun 2025 10:17:58 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed53sm1122441566b.27.2025.06.04.10.17.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-uritools: upgrade 4.0.3 -> 5.0.0
Date: Wed,  4 Jun 2025 19:17:56 +0200
Message-ID: <20250604171757.689102-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 17:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217959

Changelog:
 -Require Python 3.9 or later (breaking change).
 -Update CI environment.

License-Update: update copyright year

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-uritools_4.0.3.bb => python3-uritools_5.0.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_4.0.3.bb => python3-uritools_5.0.0.bb} (57%)

diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.3.bb b/meta/recipes-devtools/python/python3-uritools_5.0.0.bb
similarity index 57%
rename from meta/recipes-devtools/python/python3-uritools_4.0.3.bb
rename to meta/recipes-devtools/python/python3-uritools_5.0.0.bb
index 4210407e00..35a8f2a0d9 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_5.0.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "URI parsing, classification and composition"
 HOMEPAGE = "https://github.com/tkem/uritools/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
-SRC_URI[sha256sum] = "ee06a182a9c849464ce9d5fa917539aacc8edd2a4924d1b7aabeeecabcae3bc2"
+SRC_URI[sha256sum] = "68180cad154062bd5b5d9ffcdd464f8de6934414b25462ae807b00b8df9345de"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

