Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E3CEE4997
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 19:13:30 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.2908.1692386007410453331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 12:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=OVGmx4aK;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76d83954c40so79606385a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692386006; x=1692990806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/QFdnW9VCOG5q4t3VSW/rqnH0a/eHtkUl5bgmeiDsY=;
        b=OVGmx4aKmY0rJqYQhAPCiQ6SmYURmMBhdXd7x7GhW2pKnNFBE6Ly6rvIVbzXnb+xjk
         r7UYN3+lpRDwMTwJRqSQ3CFq0UPRmXdPVAG+iyFk3dCLvxpL7jOl3KcFKg5A8njb8S7p
         jhaH0F8+klhHaifIDMol35vzccucYNM64Kw0MImU08lKZnpuktPm/Coi9un0x0z/oONn
         PizZCt9LKnLpFljJ5THnOOfBYpTL3kNtKf62R0ezNXJj9fep+Mr14QMzBmmP+RImvJIL
         vtiswwTew34vHk+yqBc050phW+nfUcqSdx/Lj/kFjM8CwNEHgqf9yHrbYkXJLLyuhPoF
         zKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692386006; x=1692990806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/QFdnW9VCOG5q4t3VSW/rqnH0a/eHtkUl5bgmeiDsY=;
        b=W37hNjGiDcYdbDVK+3HGO0pfHtY50niDcskj3GC+hstiwzvejCjczOA9dH7cL+fh3M
         IVrL8DpLz3Zfnb0g1q2GNDwRNuTJgm8aIy2l4zCfGXEqOyCk3+yiPcBi06NTF+rWG1rx
         6l5R4DVZHUWIf9Vgh3Lr+kqjD5OkLsw4nlru5IbObNGUgO1RQr4eTJVwTG9itx25S9eQ
         nGGpTMR3DfD4NVShJ9QOL8SpHSBt3TmZMMBzTiMKLPM6yNEST0bUTrdqXFWQE5v09zPe
         dSUoc+sUMtwcU88ZcRXQwpeeKF8tsWUpzoWWl6cNg8BD8xu6nUxBXBTPJlDaxECjv/Jz
         ydRQ==
X-Gm-Message-State: AOJu0YxzFaqZvU2xFcce5dgJrOFuI4H1IFr/StufcLheis0AVj6fHPKq
	RNjOP2LZvnONQjzFCYK7ce7oadoK/8fQaEc2Cf0=
X-Google-Smtp-Source: AGHT+IGXnC3iOgcL38p8rlDoT2wdb/oRQa8TanWgEoCHoMigOMRCYvClBjALSTVv6lWSc4WFEh1J7Q==
X-Received: by 2002:a05:620a:22f0:b0:76d:97a2:94ff with SMTP id p16-20020a05620a22f000b0076d97a294ffmr63183qki.71.1692386005971;
        Fri, 18 Aug 2023 12:13:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cx18-20020a05620a51d200b0076cb0ed2d7asm720732qkb.24.2023.08.18.12.13.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:13:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/5] python3-hypothesis: upgrade 6.82.0 -> 6.82.5
Date: Fri, 18 Aug 2023 15:13:20 -0400
Message-ID: <20230818191324.1959527-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 19:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186393

Changelog: https://github.com/HypothesisWorks/hypothesis/blob/master/hypothesis-python/docs/changes.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-hypothesis_6.82.0.bb => python3-hypothesis_6.82.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.82.0.bb => python3-hypothesis_6.82.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
index 0aeeae1019..89efeff633 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ffece8e40a34329e7112f7408f2c45fe587761978fdbc6f4f91bf0d683a7d4d9"
+SRC_URI[sha256sum] = "41e78b4cbc0a36b38729a761e31b92d81d87a60a297994c03f2ccb2c946f5ebd"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.41.0


