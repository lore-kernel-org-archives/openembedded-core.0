Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D383C47258
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 00:30:14 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.4081.1705537806845473829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 16:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CGbBt/yv;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: petr.vorel@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a02948940so157894a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705537805; x=1706142605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUDGgRy6g3oKegtni/QD2wL/uDy2zk8D4BKbq7BxB7Q=;
        b=CGbBt/yvX7ZLk/7HgTSp2inibHs8JHniiGpNVspl1UanMKf6VKxFo7JOoKdWp/CyTm
         a3P4kQlAY3ihKPkg7+bYtYe+a/Lqug6Bq/V3BGviKKSEQcjc8V6BTafS4ibNRkXxIrzR
         jVpwfyPLIpUamviiU+ByNy6tHkTduXnX3Co2R0gMbRbArGam0UjKXIPMNTMrtB/YKXFr
         pCJGJtQzZuwq+F78AJJqPq0zWu5OTCBsIzthzYkbrGhsdABE5Jc1/3DEB5o5/cdiNob8
         W3Ps2pL1IF2inznAHlOkDF7tf203fweT7iVNbshhA/2fN9pE6dKJ++GJZ4hykwwtVf8p
         0WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705537805; x=1706142605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUDGgRy6g3oKegtni/QD2wL/uDy2zk8D4BKbq7BxB7Q=;
        b=TvW0QeM9KD65bCLgg4ECirTtR6TPU9mXBaraNXpLG9y/nnz/a5lrnJKa01/KU88zWL
         xbb3eYp/3K4XbusA73nxnO/iPMSnvVfFtQTz3n5Dnf3LaDP52V6k1L5gwrQCDEZvzAqL
         aug0guNExZgm2IEcHtQ/mVFFuTc8YXi+UTWHzh3NRpjsZqDunefZvTz1j3hD/ltHghyO
         iJviIfJEt86Kf3WvjSGN254nB+m+ez9Usa3YIAo5exQvVE1XUGTHCR1ep/kwaCWm1whK
         J1Hnq/jp3ez5HDesQX3Al++m5JZSPHF+6xfFb9TBGjIzaWkfBYoaLRiXmdsmKdQsuhr/
         MzXw==
X-Gm-Message-State: AOJu0YzjwPPnJOqotSSPfdDdhGu8SaFN6f0lRJd+MmakTigvDKD/ko1A
	cXOgAyoh0yvL7YlNxjxPUbYmPfi+D4+Sz3YmkWnFqnIbdNg/nY5Exl16pm8+
X-Google-Smtp-Source: AGHT+IHlOUjwXiiecGe8w3a9laeOxKAKhkvnp5MFNA7xovVQSVZ5xgdacAkuKdUKFGj1PAOuYe/ftQ==
X-Received: by 2002:a17:906:2288:b0:a2c:551e:6278 with SMTP id p8-20020a170906228800b00a2c551e6278mr8973eja.9.1705537803774;
        Wed, 17 Jan 2024 16:30:03 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ks19-20020a170906f85300b00a2b086c29e1sm8401524ejb.127.2024.01.17.16.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 16:30:03 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 1/1] iputils: update to 20240117
Date: Thu, 18 Jan 2024 01:29:47 +0100
Message-ID: <20240118002947.2734625-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 00:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193952

Changelog:

* ping
- fix: Restore -i0 (commit: 7a51494, PR: #519, regression from 2a63b94)

* localization
- Updated Turkish and Indonesian
- 100% translated: Chinese (Simplified), Czech, French, Georgian, German,
  Korean, Portuguese (Brazil), Turkish, Ukrainian
- > 90% translated: Finnish, Indonesian, Japanese

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../iputils/{iputils_20231222.bb => iputils_20240117.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iputils/{iputils_20231222.bb => iputils_20240117.bb} (97%)

diff --git a/meta/recipes-extended/iputils/iputils_20231222.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
similarity index 97%
rename from meta/recipes-extended/iputils/iputils_20231222.bb
rename to meta/recipes-extended/iputils/iputils_20240117.bb
index e919febd12..5a5e15528e 100644
--- a/meta/recipes-extended/iputils/iputils_20231222.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
-SRCREV = "84cdf26908b4a03b917a5429a6339b7374fcc38b"
+SRCREV = "8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


