Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A456CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9382.1777739421925875119
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qtc1JX+p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-445795cf6f1so1649335f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739420; x=1778344220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sJc/CaMYQQuvy4ScZziEofsKqqlwTOw4Gos3EhHMZU=;
        b=Qtc1JX+pYhrLxyb/mKQSifoBBjLxYjKwMva8DJVIJnQmBK60o2ywttscHMIjL9qS7R
         Ia2O5XhfP79qS7JO5krSvfoqvp94jApChXIDJGrtHzu6vFwmE5Y6o2YYXifOL8w6mQ7H
         IrPBG8thCQE4Lbc8OrdHq+gt15PHux2pEuD8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739420; x=1778344220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sJc/CaMYQQuvy4ScZziEofsKqqlwTOw4Gos3EhHMZU=;
        b=b1CtD1eq6NCzU0QPNhrJYY72qooGvXKBO78dvN+fEYW2XafGMaonzGfXoH1OHrS0Lm
         ietKmcLsYqeH26EoUUKghMe6CGgc+E4dx84jBmX7YoCLBJRVppNw6pH/Jr8ZKpyiD7++
         99B/DECGNoWZkTWMKtmpCeTYZaf881saCSeBXnjOV5kjCihCZEcimtn/mi8d5uw7nFcc
         lKO3jF4BQeIZXlL6Bw6dz6UrWCMSX0+KEsxoKD1UwZZDfUF49BIl7ICLQ2cXyBc2q1dv
         nMNjP/oWK0G87Ml649eDq40VhfZlhS+0HZY3s5W5eDgf+3pWuuurm4NWmNr4fLuF2Bi1
         LFGg==
X-Gm-Message-State: AOJu0YwwXo2ZAPY7SUOruaWjKy6mp0jZovnuqg08ot5ro8wCwFI8GsuU
	lZPi+UeWLcIFlKfHB0U8O/0hGexWdHUUjBwqtCEbAt4IJi6pQlEExc/PE9sFTDMbh+HJKMy5Ppm
	ku0hLabUL0kFq9on8IqV6w6KszoyY2Dc3+S+ehmhEVJ8wkGdA6C0cFEPMlXvOyJ+W5n6kEI1GsL
	MqSAv3O1899BI9Z2g=
X-Gm-Gg: AeBDievVp6LwMvpIQDYO3/tTuL+Q1YdiIOsW9LAhLGfi+tYTL7+x6i31VZffew3COiV
	anCGGWwPKvCMwDJ340Dpea0G96Wd84SRgUiCkKfPhC2moJcGOH4uzPqfmC7KH2gfUFTTT8Fmo51
	7OqZJ0W0mGwprL4Buc4SoHC3aPkxU2Ob6dmOMIBvZDeSDjhF5x9mTGoDD8uZkyXL7u/XwXGfvOG
	e3iXyDl2dR8tXBzZbeByKIOj5z6oeDxaF/i7kxjnDDZUguLb9NFjf4s+Wjkz3lcnYfC6ZriFnYe
	tHC6Bq5fh5M7yAJ3++TK66NTgNH2zFaRM9nif46zIQ5VLJ3OUvFNhppf2jLlORJ87LWOa2F2RNk
	xgnwR7pkMnKvQicHcn01oJSc3HYNRwfKOdDByP5LKHj/AfqzEbE3jCkIkYLpys1kg9K8FEmxZjh
	NEwbiiImB+fvGq+bw2sZuFvf3a/Mbl46nGiHmFde0uhiJwhvbg58EcTx9at1bS2kE=
X-Received: by 2002:a5d:5d02:0:b0:43d:75ec:26f7 with SMTP id ffacd0b85a97d-44bb59629f8mr5846289f8f.29.1777739419896;
        Sat, 02 May 2026 09:30:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/62] mesa, mesa-tools-native: Upgrade 26.0.5 -> 26.0.6
Date: Sat,  2 May 2026 17:28:46 +0100
Message-ID: <20260502162929.1377831-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236335

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...01-freedreno-don-t-encode-build-path-into-binaries.patch | 6 +++---
 .../0001-gallivm-Fix-armhf-build-against-LLVM-22.patch      | 5 +----
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 meta/recipes-graphics/mesa/mesa-tools-native.bb             | 1 +
 meta/recipes-graphics/mesa/mesa.inc                         | 4 ++--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 4d36e68a58d..e976b3399f4 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 8299fe0615638dc88694f08b95a62e9dd3943a6f Mon Sep 17 00:00:00 2001
+From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index a4bfd337179..330b6468d01 100644
+index a4bfd33..330b646 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
@@ -42,7 +42,7 @@ index a4bfd337179..330b6468d01 100644
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false, disabler : true)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
 diff --git a/src/freedreno/registers/meson.build b/src/freedreno/registers/meson.build
-index f4be68117c3..cd0caafa431 100644
+index f4be681..cd0caaf 100644
 --- a/src/freedreno/registers/meson.build
 +++ b/src/freedreno/registers/meson.build
 @@ -43,4 +43,6 @@ if install_fd_decode_tools
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
index dfa2e865680..065dd373a7b 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 973dc32026c164d0c13f7f5bef36c8d1c2375973 Mon Sep 17 00:00:00 2001
+From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
 From: Alessandro Astone <ales.astone@gmail.com>
 Date: Sun, 1 Mar 2026 18:14:09 +0100
 Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
@@ -25,6 +25,3 @@ index d3ad342..c95d86e 100644
          f != features.end();
          ++f) {
        MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
--- 
-2.53.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46b..b039ac213ea 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 0fff6ef1dde..20207450bf2 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -17,3 +17,4 @@ EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
     -Dprecomp-compiler=enabled -Dinstall-precomp-compiler=true \
 "
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 01f7e3bcea0..15dad6eedd3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368"
-PV = "26.0.5"
+SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
+PV = "26.0.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

