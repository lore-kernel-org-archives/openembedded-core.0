Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7349ECD4F3A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.16017.1695367496990670208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpDelQRP;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso30524031fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367495; x=1695972295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxCMZ0kf9JkZjJWsT6R8/SxTjutlDz/apuMs+bguExg=;
        b=WpDelQRPcrND05RWJZjFhsz7vUrNegXQulUYMqnI8cTjCsrGfB6We/F6IDNIySgzSr
         6QFhW2TYBSivf+C3wpfd4ymHBogBpCy4IMScGJEG2TqZYDNgeFiJBJP0RI30UuyCGQZa
         E/ISmB7l6bhFYzfjmgPobWbVppFcv35WbPvavCD7Mer3XfExOXyTWq4+p4ZhsCexNaL5
         LilmCLjga/ej/HvCpm9M4gG1WymOUcxNIe8AgsjVXSx9ad4iELXi2RyXVdK18V20+5Qu
         xSGYMQRkFg7CcVg6DHJ7UM41dxVHe5zIFfjH3pO0oHKMwn1hEzKk/wyD2VOF5UOzlH64
         SlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367495; x=1695972295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxCMZ0kf9JkZjJWsT6R8/SxTjutlDz/apuMs+bguExg=;
        b=g0wch7OMlabIBziKIl5CEZP4ZW+/1v9eKhY+twM9zKO7PjoHTSiM5pZ3mXgAGouQGB
         7g/J1ZSuP5C9gvMZ3PZhM92ttu2++q+jOsyuQE0GAmJ6mqGh7m1VpiLWXI0g15tIFHmY
         3la7hpC7UzA7bACn3G8YkbE/pX/6Dv1y82a2rbQkhbSPDuaEdgkJ8/tgNZNqWsfJWHtC
         +WEFf8xvm/pet+kp0eWYZNSIGNtjX1b+an6Tsx4aiIy/QfXzl8MBuYefjqi5HqQ9quxV
         bB4Z4y4L0dmi19mZbrb2W/o6oI5FYERraIT+UxEeQE1aKHnXTO2dum5M2a+K8chQPIro
         bVUw==
X-Gm-Message-State: AOJu0YynC0GQJwYAPHkTYsXGmDWnJToi44/i940/q4jh5Ni3XgWtMCj3
	nrQff9bnBn5ZypMwJCExterGQ89GAcQ=
X-Google-Smtp-Source: AGHT+IFOiJHAtYzfIO3thfe3PgIun3e+K96UXNFYbqQDquxx8J1mRQOtLZTnrevTSwJCL1056Y/xKw==
X-Received: by 2002:a2e:8898:0:b0:2bd:ddf:8aa6 with SMTP id k24-20020a2e8898000000b002bd0ddf8aa6mr6934225lji.23.1695367495150;
        Fri, 22 Sep 2023 00:24:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/40] python3-sphinx: upgrade 7.2.5 -> 7.2.6
Date: Fri, 22 Sep 2023 09:24:24 +0200
Message-Id: <20230922072431.1481743-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188075

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-sphinx_7.2.5.bb => python3-sphinx_7.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.2.5.bb => python3-sphinx_7.2.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb b/meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
index f55cc5a3ec7..f4ed0720ff6 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
-SRC_URI[sha256sum] = "1a9290001b75c497fd087e92b0334f1bbfa1a1ae7fddc084990c4b7bd1130b88"
+SRC_URI[sha256sum] = "9a5160e1ea90688d5963ba09a2dcd8bdd526620edbb65c328728f1b2228d5ab5"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.30.2


