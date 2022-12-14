Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28E1C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 03:20:41 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.94578.1670988033610000970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 19:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pas+5o25;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 21so3579494pfw.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 19:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BL9K7lgSAt/0YPPSzBgR/ur49Rh6pXvsx8t9K0d7l/k=;
        b=pas+5o25jvgZ7LOxYa32EkCxNQBnzUBNTVO2/8tRypBEtw/EMt6816wfJgFJryGzgZ
         OuZUnCW6Ikt2MYLDXumh6eDACEctmZDvSdRJQXxxrj/1BYQ7PjwoPgBnpEuaKoJaROEG
         Nv6QMCtaGlEWoJXT95mIqdsuGZsqQ7Acd6rfjwMmwX5s24aAZ7jzP5SN/mr4kYcjcUaE
         f37RByebrgEEIJiMe5uMqofpEgUB6EGTk7SS5050rak8hA8RueMIg5mxNjUX3Hk0Ac+k
         kQdrsVzT7ksfDrapZSBlpSn2OZt0TnfJcNYzq2TJnbdCLecU52YJILE5rCODFgExIStX
         Jhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL9K7lgSAt/0YPPSzBgR/ur49Rh6pXvsx8t9K0d7l/k=;
        b=yR+LUYJSVecGeG0dgENo7J0iQf166HB7t6p6C2cQ2nUUIWoy7yTTLHoPSIXlDdlhZX
         Gl+8Z2cVlaUrIp8y1r3Ntv4tXg1+k0vKN0PL4WHLUPtmupZ+WaZruwtzCDoo3IfxRE5Z
         gZHhqWMKurlkztgX8cgSarGefRv5STpqa50sIAEPeSAG1Vu0eimvddTZ3yoMQk1XFgPH
         4Q4HOrqpYx8xgQAT4yf3DouuXs9jr+iN1KMuDBuPaQZX5gCmV85kJh1H8LidbwPNBIWW
         kFP+7byftrNbvE5hAnVJinjhSKDisRRmSTsDLy52RaDbYqhc06FIVN9o3Z4kmalC33nH
         XWsA==
X-Gm-Message-State: ANoB5pma30wLWNpdhSGaktTOpzLzh6tHKv8scMMyHalFgPhy/e46frO3
	+96bhJI4KrMS9VG5iZBUfoyhhC2Czzk=
X-Google-Smtp-Source: AA0mqf7c+aAZwXRLP4iN/5AOSh+ChcEys7I3infwr395pK5fXFqAHJqbUGD3QlSDLfCRYBPh65k8mg==
X-Received: by 2002:a62:fb11:0:b0:56c:3696:ad68 with SMTP id x17-20020a62fb11000000b0056c3696ad68mr22851364pfm.8.1670988032602;
        Tue, 13 Dec 2022 19:20:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z7-20020aa79587000000b005769436a23dsm8299638pfj.218.2022.12.13.19.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 19:20:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] libpcre2: Upgrade to 10.42
Date: Tue, 13 Dec 2022 19:20:29 -0800
Message-Id: <20221214032029.660193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 03:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174549

10.41 regressed apps which were using pcre2posix.h without pcre2.h
mariadb is one such application in meta-oe which broke, this immediate
upgrade helps fixing these sort of apps. See [1] and [2]

[1] https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.42
[2] https://github.com/PCRE2Project/pcre2/commit/cd8dc40b901bdedf5bcc0b3acdd9eede16802f39

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../libpcre/{libpcre2_10.41.bb => libpcre2_10.42.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.41.bb => libpcre2_10.42.bb} (95%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.41.bb b/meta/recipes-support/libpcre/libpcre2_10.42.bb
similarity index 95%
rename from meta/recipes-support/libpcre/libpcre2_10.41.bb
rename to meta/recipes-support/libpcre/libpcre2_10.42.bb
index 2a50d07192..cd65493c48 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.41.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.42.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "0f78cebd3e28e346475fb92e95fe9999945b4cbaad5f3b42aca47b887fb53308"
+SRC_URI[sha256sum] = "8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.39.0


