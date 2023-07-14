Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CECEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.817.1689374009561236951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cnXXwEXr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b8a44ee159so15172805ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374008; x=1691966008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ihfkTOU+o5aAfoh5rpJaGboYAIy+nAeadJMJ6IEiB4=;
        b=cnXXwEXr/P3RE7cJyr2wcAKeK4Ysaiq1fYd3OTvSPgPGPKLP7wut9ghttHhBCjP6GE
         dhUkYbFEq3yvM8A2pn7BRiKJfRlLx0ScyOUIDV2oVuhw0kPyyzLw2qezt/ngm3MtUHzh
         ZeKKSIWztIqsT9xN+2iaPvXuE4T5iXliKvumtuRsGCIP5EapcEvQwA5lvbS4cfeeESAN
         Qlh8z1rr+YVT5LYzpXDxgkQ9pnibp0p2WbxjJCqxzWe1lOsXJMfEpf89MNg5a7RZrcxF
         nk2AzYPGaxRukLFQz5IXqlGonf1bZuWat9kgh0g07CBW1/l6msqVxuXG7hYLEt+y+oXz
         xHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374008; x=1691966008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ihfkTOU+o5aAfoh5rpJaGboYAIy+nAeadJMJ6IEiB4=;
        b=cbjyhos42zit2HZ9mkvZ7vbe+RmY1yG8DSr0kc+VOeAiPG2ihB1CmnWmStRM/vQQG6
         tPwuc/sXMvc+fpZ/8kFHZOuLFjSMz70beqCG05BYsHj3Nq+2IxYMf5Jpo/e5w/YgWmXY
         BoPAoYGuwTUZnL5tXcsQZSEFgNglkfuUMzmHwLMD+zoRgbZX4VLosfDpzSvinu+WoAQn
         hF4bnMY5sPlDGjTysOkR9/cSi6B0qw6hfgRKOghkhvtfPZCeQrO7wOgqnjvttCO/OSze
         e+aboBECEgCFEX67OeF7qlPxv8G5xnzQSoiBHQKRaGxPrsiQBjbMWp+/fFlcb0CVQuh8
         J7Eg==
X-Gm-Message-State: ABy/qLYBfd5zu2w6Prr9DBmOBJqoAu4m0N3J+J7gMBaEiOFHMAZjfIZf
	57RDXVC7rFdTsX4wa6x6ZCT0FO0sSvv6Pg/41AE=
X-Google-Smtp-Source: APBJJlEzdTp7rjHSVgcSIFVnXPguvZkNVRpe83j57OlAqZy7uHvGVbyZzpvR51NeJGh7Mi/9WYZNRA==
X-Received: by 2002:a17:903:11c6:b0:1b8:a67f:1c0f with SMTP id q6-20020a17090311c600b001b8a67f1c0fmr6242270plh.39.1689374008499;
        Fri, 14 Jul 2023 15:33:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/26] libksba: upgrade 1.6.3 -> 1.6.4
Date: Fri, 14 Jul 2023 12:32:43 -1000
Message-Id: <319370ab4031454e9a026a5b7d582fc23882f139.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184291

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Correctly detect CMS write errors.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0296cf63007542c1cb209a4288be1c82aa2ba843)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/{libksba_1.6.3.bb => libksba_1.6.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.6.3.bb => libksba_1.6.4.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba_1.6.3.bb b/meta/recipes-support/libksba/libksba_1.6.4.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.3.bb
rename to meta/recipes-support/libksba/libksba_1.6.4.bb
index dc39693be4..f9636f9433 100644
--- a/meta/recipes-support/libksba/libksba_1.6.3.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.4.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c"
+SRC_URI[sha256sum] = "bbb43f032b9164d86c781ffe42213a83bf4f2fee91455edfa4654521b8b03b6b"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.34.1


