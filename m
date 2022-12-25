Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1738C53210
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.125286.1672005579800743319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ocRRTnVG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id s5so13713756edc.12
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3GtQyc6Lh4Tw4j3SINGoIg2WE4+LTNpiZIRU9HoB0U=;
        b=ocRRTnVGPqKvaigzkpodgNeh52IRK3apGLRNyXr0d+KehWsBLw+ymXa0mPDnDRyzc/
         3XhZXlukpAs1MU07T8m3YQK8ibH/qvLEAZruxKbno1prV5Y5Hr8YPiTAeQJUzkqwWwcr
         M0cS0B8ybXKnrncmddKhH8Zv8rqoqc0r9FOVZSmT4FP33DWmG0/7ws8T+h1EPSwERXOp
         vxxsPzXvUmHRwZZ8DUARLDPa7vbADQJm9L0xfB2f3juytdiTN+Trkhi+9KuPs6+TM97L
         L6e0qjz5BBNcg+bQjJuPxYphYXQvb0pqBzEgjHIU8W1Pk97YZd0sv5nKIc3/cRKHjSYY
         yoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3GtQyc6Lh4Tw4j3SINGoIg2WE4+LTNpiZIRU9HoB0U=;
        b=v3bfGCTwgt70OQ6qervjinBvrmft03I6O5YLyq9jgGbQrPwDsH9cr3GdTRUzYkwXTM
         5IHo39A/8G/g81Y9nTJ0ZmuLuev8/rLy0KNfaDmwji/Gjr1iFCPcLYEScPc2Yoz31NpV
         AYOmCbELClvnYbAGA56V0MhrluqC7RsXscSV+jI0olzmguaHJPCyYYX5I8ZHgfotfc9T
         zR+IMyGZEY6namTxf+MQYlNFVyPuMmTRiv6U+cxdtu7fZagBj++QPUxEcbti1i5U4xfI
         W99O0cuiefVx5uRH9Y/gStloFzKS1NZfgBQ1aGBzzbuS1Kx48FTKUI8V7pDDO5a4E/zs
         wHaA==
X-Gm-Message-State: AFqh2ko5baVOg+uJldCntp9NGp3pRw4il/EpTuz1QtqyAYpZ5IG1Mi5Y
	lPx/vATgsr5KrViPVOKwiTCdPxnAfPI=
X-Google-Smtp-Source: AMrXdXvWx5DHSQ/mTDWaMfpoKzSr7cGWaX5IBFwl9lAQZWEaMnLxOQy6c1C/kkfrE3MjuEaoolSsqQ==
X-Received: by 2002:aa7:da42:0:b0:46c:2034:f481 with SMTP id w2-20020aa7da42000000b0046c2034f481mr16917805eds.8.1672005578110;
        Sun, 25 Dec 2022 13:59:38 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 08/11] rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
Date: Sun, 25 Dec 2022 21:59:18 +0000
Message-Id: <20221225215921.12868-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175003

Any consumer of rust-source (potentially) needs this, so move to
rust-source.inc

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v4:
- Fixup `__stack_chk_fail_local` in musl-x86

 meta/recipes-devtools/rust/rust-source.inc | 5 +++++
 meta/recipes-devtools/rust/rust_1.66.0.bb  | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 91a6c5a942ae..b63e18ac95d2 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,3 +11,8 @@ RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
+
+# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
+# when building MACHINE=qemux86 for musl
+WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
diff --git a/meta/recipes-devtools/rust/rust_1.66.0.bb b/meta/recipes-devtools/rust/rust_1.66.0.bb
index 5192ec2ee11a..f1ec769aef48 100644
--- a/meta/recipes-devtools/rust/rust_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.66.0.bb
@@ -292,11 +292,6 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/manifest*
 }
 
-# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
-# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
-# when building MACHINE=qemux86 for musl
-WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
-
 RUSTLIB_DEP:class-nativesdk = ""
 
 # musl builds include libunwind.a
-- 
2.39.0


