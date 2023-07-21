Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2423DEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 16:07:51 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.11014.1689955664205729566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 09:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=D4PhB+BU;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-635decc135eso16007636d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689955663; x=1690560463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlRXrF/iovlRwnDMWk4SNxIWkckdNk2kSX4oe02oumA=;
        b=D4PhB+BUMgnDjDu09QLHbHgyADwCel0kWVRatiMYTTH3Bt3ewR+WA9CI98BZSEpZP/
         FishrZjNxb01Bg7BBlmdUYBY1jvIagvMIuhaIYMvXx/nK4iIrBwIuUOjDg/65+KJUq1X
         gg1NqDWqx1g4mvF9/A5mIAWpY5/gQVFQ+NwQ5W6G65/e/kEh+sL6mdfS1TCIGGvEPODD
         8f37WIDxYHT+oHL2XjLK+hmzfCvE8ETNDeb1aplxD1KGGpuM5TIxJgiwWg92KeQDtzzk
         O9Jg8kLGcAD1ihCyLTS+Awa8kvrZTl7RWrsg77ZMmg4v0O+xhmuzLwP0dzzALVuwBmet
         vhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689955663; x=1690560463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlRXrF/iovlRwnDMWk4SNxIWkckdNk2kSX4oe02oumA=;
        b=g0cQ/yd9gdhvH5GtsacLoolykqqyi38lL4GSSlX8TSWQn3CZ4LqWwJe4FQZRE1X2vZ
         QdIfOIipkxCeWmec6MqD6eNgg+JjOt8c0sybeGuzJJkB/seT50GOLLh+hzdhza5kUecb
         xFI+xseHRTUqrdrBdzjb9VPoPFvTXet+WkPdNHcvFwzks2BqFKplzyFRY7yaB7sEa24E
         L3zzDdAqWZK/IGRG21dtg+4tov9pj8LocdN5al/NJty1r+TnfYcpayaCFXv92+7qkZ+I
         MMEOuoPxgJWhys/xfQV+uXObhVuXLgcxmBi8qca1D6eDFVGDyX2jfdm99RFL/PdLz2gg
         tkzw==
X-Gm-Message-State: ABy/qLbuPvmWgJrhxOljRA8fgpt1w9vvkQvtte1R5q/I0qn6TIs8KHNY
	6nFZhNmQ4T+QHbkohQmgUVEya8GS3/qwVXgG7yg=
X-Google-Smtp-Source: APBJJlEDiN86jSURoXsVFaTDrdIIAMJlMuxriM+4EbjhZWTfTmeJcU0aFKbvly8SN55nhsjqzJgVJg==
X-Received: by 2002:a0c:f513:0:b0:635:e286:d4b with SMTP id j19-20020a0cf513000000b00635e2860d4bmr456739qvm.18.1689955662935;
        Fri, 21 Jul 2023 09:07:42 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id c1-20020a0ca9c1000000b006301d31e315sm1391956qvb.10.2023.07.21.09.07.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 09:07:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] git: upgrade 2.39.3 -> 2.41.0
Date: Fri, 21 Jul 2023 12:07:41 -0400
Message-ID: <20230721160741.1374573-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 16:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184705

Changelog for 2.41.0: https://github.com/git/git/blob/master/Documentation/RelNotes/2.41.0.txt
Changelog for 2.40.0: https://github.com/git/git/blob/master/Documentation/RelNotes/2.40.0.txt

git-add--interactive was removed in 2.40.0 in favor of git add -i, which
caused the AUH upgrade failure as that PERLTOOLS entry was no longer
relevant.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/git/{git_2.39.3.bb => git_2.41.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.39.3.bb => git_2.41.0.bb} (97%)

diff --git a/meta/recipes-devtools/git/git_2.39.3.bb b/meta/recipes-devtools/git/git_2.41.0.bb
similarity index 97%
rename from meta/recipes-devtools/git/git_2.39.3.bb
rename to meta/recipes-devtools/git/git_2.41.0.bb
index 3393550c85..b84be24b94 100644
--- a/meta/recipes-devtools/git/git_2.39.3.bb
+++ b/meta/recipes-devtools/git/git_2.41.0.bb
@@ -117,7 +117,6 @@ FILES:${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
 
 PERLTOOLS = " \
     ${bindir}/git-cvsserver \
-    ${libexecdir}/git-core/git-add--interactive \
     ${libexecdir}/git-core/git-archimport \
     ${libexecdir}/git-core/git-cvsexportcommit \
     ${libexecdir}/git-core/git-cvsimport \
@@ -161,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "2f9aa93c548941cc5aff641cedc24add15b912ad8c9b36ff5a41b1a9dcad783e"
+SRC_URI[tarball.sha256sum] = "c4a6a3dd1827895a80cbd824e14d94811796ae54037549e0da93f7b84cb45b9f"
-- 
2.41.0


