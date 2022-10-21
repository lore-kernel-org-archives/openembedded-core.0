Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D974DC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:24:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9748.1666358646742446591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 06:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikJqyfqk;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id i3so2535681pfc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeYoyau86BMLCeGSfhig4JxpyD10wP6O0utVc5UnKXs=;
        b=ikJqyfqkX48o3og2LhuEQ7QATnFMddnrpq5CXKtguJBpkCH2EPkiwrk9f2YwRMpfdP
         VOegnnJx6Qn55lE1QTgz6ZyTZ8V7KYXRnopgT6iXv6IILJgkwWGYimGs16H2BmxjyEr5
         dDXv+36jTZrgHt561D02rgPjp4zq10vRr8i0W8Dpn9NSlyKOXX7Vsf5GT/URUh2IDzdT
         v+VOu+po2RKEsFNopPQ3Rblfqu+Fnx184LtbPfPTkjyT60KLT1E781e2iikArItrQdrc
         vHgwRaIpDoaWpAhFj8UnP0G9XU8UsWqDJTR0VgdcBGfImpWrDdWN8BPJwbWLQhIufIE1
         5wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeYoyau86BMLCeGSfhig4JxpyD10wP6O0utVc5UnKXs=;
        b=0V08H9Bv008PbbTAjqX4FdIbNBjyY6DQBEyVB0h68EPjGhgoe8myuCRpX0mc+LM48s
         45uBHMwt6+NM24Jdu+lkF6CsDDDOirMDQdn/LOXHgVF2dkHMMJwwWI1Uxkg9Vj4mrTqM
         IOP3KK+iFfIB54l3nYT+BolPfZVQ02DVY13gAqDMMmrjne2/h3VF+tBrj8sVYl7+CsrX
         toiT1EtNDCft1oCNb2mKnUCGMUPXSpyMtTwQ+AiYzrgR3N3EfGiLxo4ffQ5NNvZCR9x7
         rv3gVoPGdFeK+hXUuN3H+0n7PFQym2z7dSeLKxZWnjAR7D1O/zYijRuOlMWN9HuEOGhY
         arGg==
X-Gm-Message-State: ACrzQf1WflDa4futY21La0YlFs98Wkn07fkHrVu5k/YHeCDfnOG132c4
	3Xd6qTKR4STo/MaRgcwWD5W5RDAmx2aqIA==
X-Google-Smtp-Source: AMsMyM5gO8lbtdCScG9O0KUbARUm4hCe/xw+KnfOCGreTsflNnQRvFrDw9Qf6066BlrEJTgxZud4dw==
X-Received: by 2002:a63:ea4a:0:b0:439:4695:c0f8 with SMTP id l10-20020a63ea4a000000b004394695c0f8mr16058690pgk.440.1666358645844;
        Fri, 21 Oct 2022 06:24:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:4042:e1d:9e6c:89c4:b832:6284:e218])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709027c9000b0017e9b820a1asm14758340pll.100.2022.10.21.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:24:05 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	wangmy <wangmy@fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [OE-core][dunfell][PATCH 1/2] dbus: upgrade 1.12.20 -> 1.12.22
Date: Fri, 21 Oct 2022 18:53:55 +0530
Message-Id: <20221021132356.29507-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172018

From: wangmy <wangmy@fujitsu.com>

(From OE-Core rev: 1fb8ea03cf6c4df4d8c2cc9329dfe80c83a37e2d)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc98fba73aeac4d1e661475dfb4acfca94d6c8f8)
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.22.bb}        | 0
 meta/recipes-core/dbus/dbus.inc                                | 3 +--
 meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.22.bb}    | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.22.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.22.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.22.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.22.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index dcbcc0a9d6..8219f0875e 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,8 +10,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
-SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
+SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.22.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.20.bb
rename to meta/recipes-core/dbus/dbus_1.12.22.bb
-- 
2.17.1


