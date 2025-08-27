Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CE8C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 07:37:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.9701.1756280245901267303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 00:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTGM6E4L;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32326789e06so5218619a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756280245; x=1756885045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUd6GoSJ4mrXJzDljZWVLX+LtdBHGPkV4aYWBYz90Nk=;
        b=LTGM6E4LuKGsnhAcHLXCK2eSVxA6in5dRS2Anxpnk1IsdBZHCs+cQVxajYqU907Bxv
         PbdfYJSAOWGS+ZG2QNctHHj9c2p8yRdwFlwcph0G0dwi1H+4TSFyaUElx2j0HZk8IjYh
         qq10wN5Nh+512w515Bzth7+zOqy0zcL+sQl11rWNkHEjAv5RJA2/Vh7RzeYLqWqN8mLg
         9nYPzXreIPhDrwPQGodWIQJLfqwhENNNNyeXfnUstayGQjGJ7yjZ17FYyb4i3iPj1p4R
         qLQPDehSUbclEzML0b9P8h1bDtLBCYlmYtmwpXgKj1gRcY7Qq7RWozAXwmsNvMf7Sc3d
         IaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756280245; x=1756885045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUd6GoSJ4mrXJzDljZWVLX+LtdBHGPkV4aYWBYz90Nk=;
        b=SlDJ6xtuIaMnxUWi+U6AIjackLfKWS779noSBOJeM1rMkjzkpZbkOJXAxTXlffWdql
         HnrgSAyfDdAZft7WRxnO/Kb7qFIDYufrTf4bLp8d4R7xaXg7hTwZqfLL97gGsmtGgSjN
         jG7d1OqMSvy3rl1MCIyNAguCHA9cmJiBXkmfAZlTXYYQbO45YtcaBhtkSNNd3WsKms0U
         ldXlTxS5nfh84exR6cFNa0ASTqDeYzX2BWwGYbHoNorex7H2DEFbu1vTnX8SMIS8tWvM
         MSwy92gm9F5pVpBkeobwJoH3PZH3+Glr8txPp+CvPovth+sZGpOKGi958iE2JpYSHdbm
         CrMQ==
X-Gm-Message-State: AOJu0YwNgSy/kMoSUvdYDytZSLHYf0JQMmREQejoc4UsgAJQQIDGJIpX
	sFv6vH54iBEuBUvjw9lynHhQE6hSnS7uUb/TX40Fl0rm7+qnzX+y1OlE6ccFt4Cz
X-Gm-Gg: ASbGncs27Eb5pbNPvh8q7LCT6BTvJZ8k2Fxzdaext8oKUV6oqUNWDkCwhx/961krDF2
	lzLKEGYewdLsjJCfuvvmd4VoUmqmVbPDMcLkLFQrr52yT5MNZNCzfLpDeNDuq74PCpWbV62eug5
	YhgPpEvoQ5m+pb0uZ7QilZ/bhgtNQMg/cYFIUqGdbNBCF6idoE2pZKi3Pe46RSUzT4kbmjb4+kL
	ue3FvTSsTEQn44EsL9gCuamhDMOR2a25qLwOFirgFt1vn/KR36Lk0onrIlJ9dpOtjOKV05P5VHr
	t4JJiOJ4gnz+/GQNpqiYLAStAk0qhRecccNNntCKlqOEVOM2TEeGU2hGHiKupfxjUnfWlac/p+q
	hTTv/5qvNgAiuxKDdYtSgrtGm4xrFYn7FQsOhXnLRJ7yZbe+0JlImEpjBFiUiVUURJutEvvIiFw
	HX6tJavMoBzrBKaHNfeunjMbBB9CD5FKwP680daCzqByUwpTbcXLY=
X-Google-Smtp-Source: AGHT+IH+aO604bFIB36q4ylGjj279x7oYt4DzXXaG6Jmr1JwlohsIC6Jk50QfSr5zD33Egc98BvYcg==
X-Received: by 2002:a17:90b:258c:b0:323:265e:d9d6 with SMTP id 98e67ed59e1d1-32515edd530mr25140495a91.6.1756280244884;
        Wed, 27 Aug 2025 00:37:24 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fbca8d4sm1248024a91.28.2025.08.27.00.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 00:37:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] spirv-llvm-translator: Upgrade to 21.1.0
Date: Wed, 27 Aug 2025 00:37:22 -0700
Message-ID: <20250827073722.921830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 07:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222498

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add tag parmaeter back in SRC_URI

 ...vm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} (91%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
similarity index 91%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
index 64a73ce55aa..63fae47377e 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
+SRCREV = "acb023b63a4bafd53d0ba6a1a452b1f0e5671458"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
@@ -20,6 +20,7 @@ inherit cmake pkgconfig python3native
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 # for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
 EXTRA_OECMAKE = "\
+    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
     -DBUILD_SHARED_LIBS=ON \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_POSITION_INDEPENDENT_CODE=ON \

