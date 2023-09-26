Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4129AE81815
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 03:09:47 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.10928.1695697784106465683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 20:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9L4o2FY;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a1d0fee86aso23965657b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 20:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695697783; x=1696302583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyyNBrnlqrfphMElMxwBD31CjPeN21n3nTQBDKv293k=;
        b=Z9L4o2FY93RYZ28B5uvKzc5w5gjeh8d1V3uxos8KUSn1HAcF0aWLvqz10wGkoeKNKZ
         jOrMY/nGhfS8V8H/qa+dkvgi0HT4Mbt89jnJ5J6zyp9YpyygCWU+OYf9OmMV/K/64y+o
         OcSbkToP+fiA7Ywi5xSIB9IZyQKQ9ZPhxgknsWjdA1sMhwd1UUFxG83+fFwxG3ofR+Mi
         Q2Byg0fP3/ZrPcYBtiC1ZAsyQSdY8dwzK/JjUrpXDSKL89WJnHTyYGJX4tW4IPQL/D62
         SZrXMyrTmFFbsL5YiSCjlxUl3uZDKKI9DP51xWsnvxkfDjjmAo+SkJRR8g3F8ZKDGD5Z
         bYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695697783; x=1696302583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyyNBrnlqrfphMElMxwBD31CjPeN21n3nTQBDKv293k=;
        b=Qf254sRWCYNiSyJdcw38kJ9OuN4P0tJ/axOHPhG0h68miRHdNY/7hhwMCEWtOzW7rP
         gSXZT5LL642kDowkMys6qCmOLtxbmuxCNhpuG5cRNtKXhbEYFfX+GvY94HxVWm3Q2TFO
         DDK9SDx2T+rb3unMsdYr+S3IxxNY/kzULRGQSX88TpZehtD0SK1EfJj2gIhpNoIgIPWR
         WR/YuFr/yieIwCuPESWV3HE4U3p0/fEiQB8VXEZ417B/RUKYUCiq3vVKp/2oUFUsjepK
         dRrlxrL6fb/ZQmu0Ug7UkxwoW8AzuI1qKPqjcWF+CGlknCmGFcLC2kDlZVh5SxYOCcDS
         waNg==
X-Gm-Message-State: AOJu0YzXpsSbr9i0dDoJ6ikHuMR0chwmIcQDiUKN446F4ZN1HFuPLqA7
	cIUj1FAj8dtHBdFHZBU+DgccHKo5YAt5dg==
X-Google-Smtp-Source: AGHT+IE/0RPf8IYmrB+LW9N0ekSCASYKiOzQj/Hz6FteXRIzKKchtbe8BvAj+I1MojPILgTLbq10wg==
X-Received: by 2002:a81:99d4:0:b0:59f:4f8b:fd2c with SMTP id q203-20020a8199d4000000b0059f4f8bfd2cmr7968839ywg.14.1695697783016;
        Mon, 25 Sep 2023 20:09:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a670100b00277724dbfc1sm1071419pjj.53.2023.09.25.20.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 20:09:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 17.0.2
Date: Mon, 25 Sep 2023 20:09:40 -0700
Message-ID: <20230926030940.1143050-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 03:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188214

* 481358974fb0 [GVN] Also remove phi nodes from VN table (PR65447)
* 9f77e96186be [GVN] Invalidate MDA when deduplicating phi nodes
* a13a89402f53 Bump version to 17.0.2
* 2c04bdb24677 [SVE] Ensure SVE call operands passed via memory are correctly initialised. (#66070)
* 701620d58cdf [SVE] Precommit test to show missing initialisation of call operand.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 611aacba147..934f842b908 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.1"
+PV = "17.0.2"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "e19b7dc36bc047b9eb72078d034596be766da350"
+SRCREV = "481358974fb0f732e33d503c224492a543f4d7bd"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.42.0


