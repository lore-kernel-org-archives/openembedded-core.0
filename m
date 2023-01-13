Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10477C61DB3
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 11:53:45 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.84247.1673610816138572344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 03:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KyWd8FOr;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id vm8so51752438ejc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTm73dVLGDFGXk9rnUDS5qOEcUbgsB7lGCBoStTjFBQ=;
        b=KyWd8FOrTkG5PuYAJMjuIb51PiMZl5VqLLS3HyedAC5gtJxV2DOmyFmG4H/S6EbNJz
         DfUUxsNLQEx90JLY2ut4y5s9CA9crsZE3cAkH66qcc13+1rjgSKpph1JDrXXm2eE480c
         BSXgD/VCmmcbuDw29khQFa+mlAittOvs+6pWh8CPLOzvQ4rRpS87KfA4Mq8HynBu6CDT
         Zp7eEXvlfo8kAqAbD3bfMB9mC1Td0Aywl7bDWqQPDutUSp5tfRq9J7Sy53lFzfTAM3wm
         Gr3J8tGU+O9N7OOY+DUK1KIhJQN9Oi2p+tU7HCO8dE5JPXTsxP9zATFjqtRkxghSS54F
         dUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTm73dVLGDFGXk9rnUDS5qOEcUbgsB7lGCBoStTjFBQ=;
        b=I0h+3SVzTMzGNFmHtPLk9pqo7FB25mRXeV+8eP+RivI8UZTo6fK9qzK/q7LXNMXDgS
         0zI9zI1tSdjfcA+tvC5fFvuHBEz6qsECU0yKq8vJ2khx1dZ2DKKVWl5qD+G8kCLaZ4vB
         VGcgv1mCZ44yg7vGjhzkR+hhYoPg8y7WaUcgc44E4BbMprnLYujLjplzuxktt+bL3cBy
         VFRFf344qLm0m0ZWmCZ6z8cgjnK0J561ztkNoJCiblYHSAlq8NGoZog0B6aNR9qLJ1IP
         cd7T/P1RPfvPeB1jYGrUlxchUBOIxwBDx5cbI02RuSxbd/fEgUOPQ678KJ/ten+isp5u
         V0mg==
X-Gm-Message-State: AFqh2kokuOvCffMG/J5ZbjuMj0/CF/UkhO5qWwVKyho+v9EURPA1xIAd
	tqWvNnjNV1y1C8/kSW8XmdLTStRepKU=
X-Google-Smtp-Source: AMrXdXuFe8vLa1Xdp+s87bDIyBDTAXjKuytXbv0tBOJlBRdJS+Arn9kb41wXHTzoKiUR+crr7w0ZAQ==
X-Received: by 2002:a17:906:71b:b0:7c1:9462:2dd3 with SMTP id y27-20020a170906071b00b007c194622dd3mr67394056ejb.70.1673610814497;
        Fri, 13 Jan 2023 03:53:34 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b0084c4b87a69csm8431086ejc.153.2023.01.13.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 03:53:34 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/2] rust: Remove CARGO_VERSION
Date: Fri, 13 Jan 2023 11:53:19 +0000
Message-Id: <20230113115319.20746-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113115319.20746-1-alex.kiernan@gmail.com>
References: <20230113115319.20746-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 11:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175822

CARGO_VERSION isn't broken out in rust/src/stage0.json, there's only one
snapshot version, so just use that.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/rust-snapshot.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 6420bcff55ad..25192c9f7666 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -7,7 +7,6 @@
 ##       earlier SRC_URI.
 
 SNAPSHOT_VERSION = "1.65.0"
-CARGO_VERSION = "1.65.0"
 
 # TODO: Add hashes for other architecture toolchains as well. Make a script?
 SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "2b588cd2d49688c0c33b7466614123e8fe4c910f4d802fc0ff0662b1772816a9"
@@ -30,4 +29,4 @@ SRC_URI += " \
 
 RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-CARGO_SNAPSHOT = "cargo-${CARGO_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-- 
2.39.0


