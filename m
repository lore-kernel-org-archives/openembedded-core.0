Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51AFC00528
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.78391.1690740082525614785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nKtHRy9J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686f19b6dd2so2405920b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740081; x=1691344881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ihfkTOU+o5aAfoh5rpJaGboYAIy+nAeadJMJ6IEiB4=;
        b=nKtHRy9JBBSoVXRk/z6toIzOLWq+nC7FpWPxiSJnRhYJKp4Tg495C8tAh+J5o8yMtD
         kA2lFZg4NDAY9ZREGOfAG0/Ld7+J7ZqqfdS7MV2MAMNMQDM0BZLpTmPxrdLO67ti4EoM
         3z8ZtWsIFYd8l5Jln3SgsKGNKkc9URH8mLY7Cz5Ek0i88Pjye5g3wxL9oHP6mjjPQMrT
         4SBQq/IlaQo6Y6j9pYWt+IAcsUAtIA5DoNUfUfG8qa+sMdNLLbI+AEN+OG8Zjtp7kSBg
         BhY9+QV6qvREDsdHbuS4BrNCJR9eiY6JgLM6HIH3k0xA0C4gJG9xdnH4G9PoYIQmpIjK
         nQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740081; x=1691344881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ihfkTOU+o5aAfoh5rpJaGboYAIy+nAeadJMJ6IEiB4=;
        b=HuSQSbuNVFpyuKAH/TA5XbHjhmOS1f7L60u/PfTxQ64Pw/B3WHWUluunC8cZlpkQHE
         wJPqG5pMzUfaJsaztgpYu/kbT+P7e+3aiR0pTXDpkOYfqndqvluHKwZlJ8gUFjor0wI0
         XmjiOrFRmw3ZT0pmDs7XuPHYGotO2m3XHGIBEHyTl7V+5YrcI8MklL9vzpUfIebfjEId
         zH3EgTnSVaHPHSIfwI9xkdpc4OIpFIPu4R/JDdsb1bK3pUQg9fwGVBzHSw/MEUAOqsJp
         d4nktUJBCO5QbhJmhoRkLa2W5SIoEDjtmTEyQqCltNKpksov7YpK88r5nVn0NYsYzT1p
         3bSg==
X-Gm-Message-State: ABy/qLZcFkkr8rUXMyd5kxqPd8VQwP42EmU4dTI9EdCOyNMxNnnx3IUh
	d6/X4IrAjBWDovAuv2dCvF4bZaoOuAdKOt2nOnV59A==
X-Google-Smtp-Source: APBJJlFlzu5LP5okSmeuLhAHC0ycbNmfCM3KD1f9acVyOfrQ0EAVbditkJ6KRoNBF9YVnbBnGRUrcA==
X-Received: by 2002:a05:6a00:2487:b0:666:8cbb:6e0f with SMTP id c7-20020a056a00248700b006668cbb6e0fmr8318252pfv.3.1690740081578;
        Sun, 30 Jul 2023 11:01:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/30] libksba: upgrade 1.6.3 -> 1.6.4
Date: Sun, 30 Jul 2023 08:00:35 -1000
Message-Id: <4bc2f5c3a46b76d152fda326f7c8227fe938b97e.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185090

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


