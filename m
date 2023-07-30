Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C14DC04FE0
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.77619.1690740064476970378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=r2pkR/Mu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68706b39c4cso1961236b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740063; x=1691344863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qgd46F1yqzqXng9UkgQIHomjEakQC+ymFzeNYDlx7S4=;
        b=r2pkR/Mumd1kzdZLep0kKAd2hS4Q0w9gKScAzrJROX7h6KZvWDjr2TDsX6MWCORYAp
         wTvU8GwIe6PxbYjYwIEe/wm9JxEOO/+7RhDfXHC7+TQe94nzQq8E1zNYvfJ5Jb6zmBqV
         wxMFS664GyE8mFCpFad2W4KgA/AgsCJOyvjaeYPBFcY6oy2suX1+zHzYpxcVIZ6ZsU0+
         YHq7a6lyP7fPz7xV0Tf9I0uVq7vIF08LYq7CK7+4VxMBjRzc9X78QVElgNxBUI1AgNv7
         N0XASArkdEM98kjbOD9QUZvENDmqgvSu8bc1rSoSfUd7j46X1DWEw8frtToS9A0cUKcb
         JXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740063; x=1691344863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgd46F1yqzqXng9UkgQIHomjEakQC+ymFzeNYDlx7S4=;
        b=fdo6+wmdrIucbJuhDWlV50Ku08MISA8uBw2uZT52ZXQ+xaUAsVi2029UzJ+Mgyp1Hk
         Pf7VsV5TQO4q1hlJCWVjh6b9rIotAsQNsjpyOp1ZWNMZcAFXr/l3cenvfFoplAQ5wgr4
         YZF8BeS+ywfBLoTs365wE3Otnlxyr6ijwM0hf49psHPOfmE52II0eCm7+i8Jkb4VLX5d
         bbbhuTkcsjPq94lomKctlz/gAK4DoKuRMQanzurVrAJLFL5bLm37rtngstXGo+wf82Bt
         oD+cZaJ8RjhGGd2n5yP7JBvb2CAK6ISw9taV0V44FpQXofz/BIrsC+AKw/pzTtOVldST
         pUDw==
X-Gm-Message-State: ABy/qLbm2afQf7JmzirN0HfA7nes4AAxw5IIzxN+rggWUdN2RauZygEU
	hhSm56PQrYhsSqsfUWgPjNTG4N2yOzhxZxydJM1vNw==
X-Google-Smtp-Source: APBJJlHfwiBlVjTcCbIgEn4+nOTEhNzGyi/Xp0pRobW3aMWEioume7hTkm2NAT4lSotbrTuZut9zoA==
X-Received: by 2002:a05:6a20:3ca2:b0:130:d5a:e40e with SMTP id b34-20020a056a203ca200b001300d5ae40emr8751375pzj.7.1690740063442;
        Sun, 30 Jul 2023 11:01:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/30] python3: ignore CVE-2023-36632
Date: Sun, 30 Jul 2023 08:00:25 -1000
Message-Id: <9665121fd9daf1174ec4045071b900de9195b11e.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185080

From: Peter Marko <peter.marko@siemens.com>

This CVE shouldn't have been filed as the "exploit" is described in the
documentation as how the library behaves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c652f094d86c4efb7ff99accba63b8169493ab18)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.9.bb b/meta/recipes-devtools/python/python3_3.10.9.bb
index 867958c0fb..4ecc7614bb 100644
--- a/meta/recipes-devtools/python/python3_3.10.9.bb
+++ b/meta/recipes-devtools/python/python3_3.10.9.bb
@@ -61,6 +61,8 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
 # The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_IGNORE += "CVE-2015-20107"
+# Not an issue, in fact expected behaviour
+CVE_CHECK_IGNORE += "CVE-2023-36632"
 
 PYTHON_MAJMIN = "3.10"
 
-- 
2.34.1


