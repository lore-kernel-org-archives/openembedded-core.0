Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD95C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 13:27:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.31951.1654522022546251968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=rnTzH2ys;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso1820295wml.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y/xxl9me4PL+Xx+UQAZZBFFnnRWsO0308iqICbs7dFY=;
        b=rnTzH2ys15Jxj1pwPxRPqa4vPa5fL7EFDZtlPiwMXloN0it9pP4xOL6mZfi6YcmqAi
         D6hkyT1tJL6WIxpLOlS/W8i7UyKxJFXqP3ysBaZuCibVNcWOzWFtEsu82ElPUz3TpFdE
         LsNudbYj7nqjDNB2/WqAevVSnbR6RPw66LYfySDgSv2yKILZoPFliSbSMLY7+G8sSHoy
         BrZBCL9YVbahHHSGKBgKUjmvKtL5/1jHlwKUZ9d148a86psFOaXdQxCL0JGP9X7b/i9+
         uAdsYnu0WVeA9xbr56fM6ILbUnuGIBfQmB8O+D3MPLVgBscQ/J0WQmLC4GRrfIsjF3ZM
         QuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y/xxl9me4PL+Xx+UQAZZBFFnnRWsO0308iqICbs7dFY=;
        b=r624hIRIHwPM0cLRkg6nnpWv6ymSIOeCsSh+ViYIjh0QjrTqIye0bca/ioSnFIc9Ed
         2ojhjS6HoaqrQPUrbmUjou1PNV+gQNbpdqqzUtqqaoB2pJ1B5J1L8+lOPxBP7Zp9BKfi
         0XVBVnie5BJyfB8BO1cQ7NPRzHtAvL2zyIFQpe/EkIt4va5XcrUneRCD9qrDMUYXf5CP
         fUiJtaR90EHnLSXHwLDHGAnY2Ba1dky6MxaRtbhP6CYShGP9qA6Mx3WQ8F2OPLyUERMX
         gMmsa26WSfdVvQzZLmyJBC0nglxO4TvmGL0YS3vpzwF5kIEIiZP8njBZhSYG6m4bWCD6
         5TXQ==
X-Gm-Message-State: AOAM532tNksU1VJ+MvLyBGvLQ43RYG8lmULzYQOeX2a9/NLTyzT0AKFa
	UMmBogcGFlLO0Ygfd9HWvYYHCg==
X-Google-Smtp-Source: 
 ABdhPJxIJpUcgW3nOeI71fqEZk/YN0lKd/UUfkckFgwZQyuIEqT2wJvg4Rt1zUaoHJCWCus3Wv6Qxg==
X-Received: by 2002:a05:600c:4e16:b0:397:6d34:76a4 with SMTP id
 b22-20020a05600c4e1600b003976d3476a4mr23141071wmq.0.1654522021089;
        Mon, 06 Jun 2022 06:27:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:46fe:49d5:2ab9:ca49])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a1ca101000000b0039c4ff5e0a7sm2840911wme.38.2022.06.06.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:27:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [OE-core][PATCH 3/4] cargo: pass PACKAGECONFIG_CONFARGS to cargo
 build
Date: Mon,  6 Jun 2022 15:26:52 +0200
Message-Id: <20220606132653.60232-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606132653.60232-1-brgl@bgdev.pl>
References: <20220606132653.60232-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 13:27:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166630

In order to allow rust packages to define PACKAGECONFIG options, append
the contents of PACKAGECONFIG_CONFARGS to the build command.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta/classes/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 7cfd4a2666..2a62fda4a3 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -44,7 +44,7 @@ oe_cargo_build () {
 	bbnote "cargo = $(which ${CARGO})"
 	bbnote "rustc = $(which ${RUSTC})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
-	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"
-- 
2.34.1


