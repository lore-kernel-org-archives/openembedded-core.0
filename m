Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7962C83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:26 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.10498.1693064366648491775
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ksAt2jXs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68c0d886ea0so1058614b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064366; x=1693669166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwJoO2EZyin7YDsYRHesJzfy7OjLeuM5W0jBfkOugf0=;
        b=ksAt2jXs3RN2Bp7kKroTZxXWPYcQZ8OcKxSV6jrnJuQ9n11ZqhpoKjwgpgmVkvsIc6
         fq1lgiXUoBsN/hlEunbFTuroiN/S+KJDCaAnp23wlUmSfdRHA7X2RAhWj+jmR8/ryaOw
         vHW4t9xM2OjZ/79j5KIbMj3G4h4rDdUSpy135SaAHDa609l/9qAwiOfymrgrQSjx/mLR
         XXddMQM8UcxxNiB8ere1WRomoRgyQftEO+Q72E52wOe7VZcQSbd8ZoLW54s+qNQNe429
         FZpdaMU4iSfdQfybEX3p2Um0YD/v74LLJ3KssPaRqxGlMNWFOMjdoE0Md2fHXKHHeQ8i
         5a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064366; x=1693669166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwJoO2EZyin7YDsYRHesJzfy7OjLeuM5W0jBfkOugf0=;
        b=Z5n/wHLMOsnanNDF0kWHunY5NYa+E/mspo7shIHYlicArgSpiQA+LQeGcJ49F3hdUk
         +c0CUX6z98GPs6QiO4/wfMbPvAumLt66dEc7CT177VfcWeEpx/rb7GdVKRFzSg4K2hHW
         bxRWDXOr4sNPodkn/re1xxjGZjVS9FoVln/XtbI9gKJ4Sq7RDrBzsfjlg/6/IFoYFcNd
         HYmavAxxBUO7menF7ek0m0Nlpr0C0wC7JLI/5/BwjdV2Xx1usMgKzrB0q1Yvq+Z3TDpC
         j9GhFv+zqdJQ4aiYeyJMJnjMvkYCdmvKYwOw/S2/hUYdTMbqvp5IzNfni5YcEVkCq9pI
         BqYw==
X-Gm-Message-State: AOJu0YyB1zHv6ohlspg0vLcajlP6VYO+heq6bOk/k0x1BDQsykZDrUWM
	ycpyD8GOtHYuXzje3YVRDPQqoUw8gcU9ITYFZP4=
X-Google-Smtp-Source: AGHT+IFJ4xF5la9EayA7tLg+Hzb0Op2EpyzzC4DXwjitOhquV6Jqm+wlu1rdvSt647t/rkYHSQaCuw==
X-Received: by 2002:a05:6a00:248b:b0:68b:c423:fb1f with SMTP id c11-20020a056a00248b00b0068bc423fb1fmr12236213pfv.17.1693064365625;
        Sat, 26 Aug 2023 08:39:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/20] gnupg: Fix reproducibility failure
Date: Sat, 26 Aug 2023 05:38:47 -1000
Message-Id: <8224e8cf402966a1108fe7035da9ed463f3d976a.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186760

From: Richard Purdie <richard.purdie@linuxfoundation.org>

yat2m can be found within the build or from the recipe-sysroot-native if
runtime dependencies are present. The sysroot version has version differences
to the in tree copy. Specify the one we want to make the build determinstic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1feb5274db6e985e10f58359b148dabb4076917a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.2.bb b/meta/recipes-support/gnupg/gnupg_2.4.2.bb
index 580782037e..631df8ac9d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.2.bb
@@ -33,6 +33,8 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
                "
+# yat2m can be found from recipe-sysroot-native non-deterministically with different versioning otherwise
+CACHED_CONFIGUREVARS += "ac_cv_path_YAT2M=./yat2m"
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
 PACKAGES =+ "${PN}-gpg"
-- 
2.34.1


