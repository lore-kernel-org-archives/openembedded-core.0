Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C629C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 19:39:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.27147.1691696379748221596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 12:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CAfADuJD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe82a78740so3607995e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691696378; x=1692301178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=82URug4nIl5xdtOzdcF5kAt2KEXJCUIl3JtAkqXcd5o=;
        b=CAfADuJD0tMn3ehACZ6VDIOWF9Wd69T+QxVXFRIfD8Gz2FgdtVUgtSRohklr6/rW8M
         MKCTAlMVYnE5wsTKBaDGmkY1ayA7gSaoNPbxDDRijTk6DiyZSZRREkplPFAtSBvgQa8q
         nJO3AaJOBfVpmJH0rPKAmwG2A0WKpaSkiR9Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691696378; x=1692301178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82URug4nIl5xdtOzdcF5kAt2KEXJCUIl3JtAkqXcd5o=;
        b=UCfHvDqboPmSVKtND+ImV7QbiFeG7QlPJErFLEkj+kFvnxTvrQd4z1HvtsNfq84LDw
         joYE2N54oTxYPkji/XKQjEV6Wic8hqo9u9HhUzCptt3oFxWo59rVvyhOZca1ZNzqYNf6
         tjaa4HhpPFs3jHKoIsGOs4F9Ci8bvTip2uu8yG6wAxIP9J9G3afILxuCmf9/jw2NgZOE
         DjP2p4AHKBe8YU8Z5pvVyNZVCWNdHdTJiIx4upPuYOYtZwmxDmGtEPZOrjRCmildZZL6
         4Qzv3UDHT8xsELi0yS05SX+eXd1TBMOqFJ3vPHt1wcXdmc+gcRZgn+DVayq31knQPe2O
         PygQ==
X-Gm-Message-State: AOJu0YwZakuU+Nx+NkH2WHz8Ttm+ZNPf9w5GM8FuHJfbNaeh//s5P6rr
	S5U985TzEOXPXJkMuaH4cyAkmvR0IMUF1x16SdM=
X-Google-Smtp-Source: AGHT+IGfFHRQ4KC6bVTkDAjW/ZN15zvrpkdT2t1Tu90euNhBZuZ1ZmZfxyb11kwBa6gYYnChXnd0OA==
X-Received: by 2002:a05:600c:b41:b0:3fe:1f80:7d92 with SMTP id k1-20020a05600c0b4100b003fe1f807d92mr2815758wmr.8.1691696377769;
        Thu, 10 Aug 2023 12:39:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1e7:9ff1:d8f3:9443])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d5106000000b003141a3c4353sm3082628wrt.30.2023.08.10.12.39.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:39:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gnupg: Fix reproducibility failure
Date: Thu, 10 Aug 2023 20:39:36 +0100
Message-Id: <20230810193936.274620-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 19:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185823

yat2m can be found within the build or from the recipe-sysroot-native if
runtime dependencies are present. The sysroot version has version differences
to the in tree copy. Specify the one we want to make the build determinstic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/gnupg/gnupg_2.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.2.bb b/meta/recipes-support/gnupg/gnupg_2.4.2.bb
index 580782037e4..a3217b2a514 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.2.bb
@@ -33,6 +33,8 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
                "
+# yat2m can be found from recipe-sysroot-native non-deterministically with different versioning otherwise
+CACHED_CONFIGUREVARS += "ac_cv_path_yat2m=./yat2m"
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
 PACKAGES =+ "${PN}-gpg"
-- 
2.39.2


