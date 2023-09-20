Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EC1CD4933
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:44 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.3163.1695249102267982465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s8zkjfa4;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57b3b486f98so209342eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249101; x=1695853901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ8SBIXro/FC1L5KlE83tC6NRfSnhJpM/DH3L8U25YU=;
        b=s8zkjfa45mC7G9+c8Q6544mIYjv3Xf50i4pJ2L2n4qhhq3PWAGr0VSLTadTHyT/XfA
         jheTiLy8XS/Lk2tgYVCNFSTGWESEDTRUZcpWHlU++xJgotVDKJipdetbL/PpqCGu5J9M
         e7LhRRkyiUrKIfMNb855XRg1VAjJWD6VD6xCSZiDkSYrZF939DnpGdekfb2OrFnRDRVd
         yd0RnQkR1tm5MdBLBmP6lAIhGSZfelosCGjyKOFOKq0GOR1YcvayJOAu4Hq492Ryv8XL
         3CqnlGeyk3GGFmXH0FCyP+bRC7DAReTb46nptqu8a4JKESaMPCLdioC5/rtToRdFvNik
         2CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249101; x=1695853901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ8SBIXro/FC1L5KlE83tC6NRfSnhJpM/DH3L8U25YU=;
        b=WF6CNjYQsCQp57DsMPcifXoKnAlBYIJRlmIqf/r+svTbI6dlBQ8DVfQL3ddLdyx1Bw
         gtv+sf3nzkKYBzChghVtar//rEl/1HrZByKUnMieI+BFfiYSH8tWceIGL08V5yqoByqc
         o2O8FBYmfHDsQHbrBJ6tG3dE9q8gHTktAVTx/s6xY5Qir15c1AuTjsy2Q9iaHowhNWj5
         cruwJVyJpXTTyf5wpFGrBH5jv41O1ZdnB7wpKIAms5MdcBuwyGRvybkOCh/KN1oD7+BU
         fokpQlyW+i/27r6x3+Fg+GDyJ1p2hqWPj1fR5XlCelVs8ITFmfKhFTRT69R/q7cUAtI+
         pfbA==
X-Gm-Message-State: AOJu0YxFYR8+AjGfWCB3hL/+7IlTwVrJEbAqeXvk5ewleTxkTl0hxT5X
	cjiP393z2RczJnGQ4ER6Uz7o3U6Yb0g0UY9gSoA=
X-Google-Smtp-Source: AGHT+IF3Kv5nAeS+C4rlxe9PFWBx/rjvYxUp14ARKmCaTdu3xz2vcgESApwvQgEpFKYrbI478aQv6g==
X-Received: by 2002:a05:6358:e489:b0:135:499a:382b with SMTP id by9-20020a056358e48900b00135499a382bmr4768890rwb.7.1695249101178;
        Wed, 20 Sep 2023 15:31:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/20] cargo.bbclass: set up cargo environment in common do_compile
Date: Wed, 20 Sep 2023 12:30:57 -1000
Message-Id: <a3f566fcbfc02e0a3b3f6a676d6dde88a5b50506.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187968

From: Alexander Kanavin <alex.kanavin@gmail.com>

cargo_do_compile runs only if the recipe is built using cargo
as the top level tool. Some recipes hide usage of cargo inside setuptools
(or autoconf) and use do_compile definitions specific to those,
and so the environment isn't properly set up.

This was exposed by latest versions of python3-cryptography.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f4ff643a028d7f5670d80861f2ce19ca2d90faa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cargo.bbclass        | 1 -
 meta/classes/cargo_common.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 4a780a501f..6df3b19b00 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -49,7 +49,6 @@ oe_cargo_build () {
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"
 cargo_do_compile () {
-	oe_cargo_fix_env
 	oe_cargo_build
 }
 
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 1e9d284b5d..c1bc142d85 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -101,6 +101,10 @@ cargo_common_do_configure () {
 	EOF
 }
 
+do_compile:prepend () {
+        oe_cargo_fix_env
+}
+
 oe_cargo_fix_env () {
 	export CC="${RUST_TARGET_CC}"
 	export CXX="${RUST_TARGET_CXX}"
-- 
2.34.1


