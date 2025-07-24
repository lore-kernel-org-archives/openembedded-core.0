Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A3BC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:35:29 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.2557.1753385719328186018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qoyiok4a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3220c39cffso1484151a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753385718; x=1753990518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=niJQclX8kUxDrRoqMTxe7DvWlKO1Pso5rtEIIqBTVQw=;
        b=Qoyiok4agGo2MASYE1XkOexXrAcCUhGgRdWFXc7s8uXDoRpwU+hiv8KQbIzcdbi+0A
         XeYr4AeQegk3aATSu8BSBnNCye1JIctxxYWlmrLcIcRrjt9B1TpIQrXayySJGZYjb/Oq
         kkbSCuize7lQkCnkwADjxISO6Ed+Q2tpP7K38mtEO599oRJeH34GEiUocTHY9SpeFmPV
         oei31PKv9DxET17gkN2dFduz+qCscTpKIts4+HxyaQxUtVRH5lpo8MDDzHR8Sx+i8kY4
         Rlbf5Tk5zzPrQJtdWwc49J8/i89gpqmhCyDoUCJnADx6Mu9q3C1dkA5DD9Cm5LRObl40
         olLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385718; x=1753990518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niJQclX8kUxDrRoqMTxe7DvWlKO1Pso5rtEIIqBTVQw=;
        b=wiBD8jN6zV76JxFYMkU9iSSFdzsSsvYWEloHohDx3rIRiYXBMP9VjZmLnJqN6Gqgb2
         ilWyvtFYOL8mKya4g8kUcAk/jzooLlXzLkqLcLfUX4FtlslvnkSKw5QN7eEJMAgzURsn
         e+af8zC+baog2KUq00oEUhB7HrUtGF9wk040ttFelodEZkE/bHS3hEexBBtWxiheYImW
         2f3eQzckyKkicx9CyGiatAmHzHDeZmhYizeyqqxVcM/CPAnoZE4tGxx9BmEl6KeLKYna
         5OCTPeS42Hy50KAfwwcmkSa+GJNec0z/s7dXxWCu5V1voHSD0CjoPeOJN5JelorOCQPs
         2FYw==
X-Gm-Message-State: AOJu0Yy8FxbxnXOT7pvF3O/CAE0vqJxEG3vOw3kcPxWFcUx+ulAHFpr9
	hBa+sixE5VmL04TNQ/hfIm9fW768FqmI+pW6NlxsFgTFFCOgr/56iu6k5MKhmvZ9JQ8h1/Ekqlt
	Lr43j
X-Gm-Gg: ASbGnctQeFYLL/EPxQ++BaYiROhJSvLEiqkm2aVef+mu6Wlryh3GOmdYl6CR8iVVaix
	msHcX+krK12Ez16mnowJQiiF0RO1rs0lo93pZLVciO3V9ynsBcxOc2r1fODWZkpIU4TCtzyGRAn
	8dGe5VcywfjB5weAJjnR3dqCl5PRBmi134pWhbSbrpE9da88b0Ur1UxbRx/B6QRdu5vFTj/lqHU
	+btcX1Rt1OZ07vC9FZYBj82kqL4eE8DcfRm08XiZFNiwMPs1pgqyMD0KDBiHcGfcFMi0euUeEh4
	KxL9s7OeJbuad6zXUVxI03l3vyWcMYtFV5lhHLMRQliHP1Daz9dRl0FAoUa3T2u3zOoW0vi/luM
	w9NPnRjgAbxgE
X-Google-Smtp-Source: AGHT+IEpXeVG0wdTRFkr4MOpyc0/7/MwVj9FTwyDx+AGbCHpZ0rpBEXyl1Kfp1zL5jA+ard3bDQO7g==
X-Received: by 2002:a17:90b:5647:b0:31c:3669:3bd8 with SMTP id 98e67ed59e1d1-31e507c49a6mr12344177a91.21.1753385718095;
        Thu, 24 Jul 2025 12:35:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66267fa4sm1978524a91.5.2025.07.24.12.35.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:35:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/6] Patch review
Date: Thu, 24 Jul 2025 12:35:04 -0700
Message-ID: <cover.1753385563.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220859

Please review this set of changes for walnascar and have comments back by
end of day Tuesday, July 29

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2085

The following changes since commit cfd35327706a0fbebbab8bfffc72af0bfe385758:

  linux-yocto/6.12: update CVE exclusions (6.12.38) (2025-07-21 09:43:01 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Deepesh Varatharajan (1):
  glibc: stable 2.41 branch updates

Jinfeng Wang (1):
  mtools: upgrade 4.0.48 -> 4.0.49

Peter Marko (2):
  orc: set CVE_PRODUCT
  go: upgrade 1.24.4 -> 1.24.5

Vijay Anusuri (1):
  xserver-xorg: upgrade 21.1.6 -> 21.1.18

Yash Shinde (1):
  rust: Fix malformed hunk header in rustix patch

 meta/recipes-core/glibc/glibc-version.inc                   | 2 +-
 meta/recipes-devtools/go/{go-1.24.4.inc => go-1.24.5.inc}   | 2 +-
 ...o-binary-native_1.24.4.bb => go-binary-native_1.24.5.bb} | 6 +++---
 ...cross-canadian_1.24.4.bb => go-cross-canadian_1.24.5.bb} | 0
 .../go/{go-cross_1.24.4.bb => go-cross_1.24.5.bb}           | 0
 .../go/{go-crosssdk_1.24.4.bb => go-crosssdk_1.24.5.bb}     | 0
 .../go/{go-runtime_1.24.4.bb => go-runtime_1.24.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.4.bb => go_1.24.5.bb}     | 0
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}           | 2 +-
 meta/recipes-devtools/orc/orc_0.4.41.bb                     | 3 +++
 .../rust/files/rv32-cargo-rustix-0.38.38-fix.patch          | 4 ++--
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}    | 2 +-
 12 files changed, 12 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.4.inc => go-1.24.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.4.bb => go-binary-native_1.24.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.4.bb => go-cross-canadian_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.4.bb => go-cross_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.4.bb => go-crosssdk_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.4.bb => go-runtime_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.4.bb => go_1.24.5.bb} (100%)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)

-- 
2.43.0


