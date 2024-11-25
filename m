Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C28CD5806E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17087.1732536102017985522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gwxYJLS0;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso8818605e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536100; x=1733140900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ynq0nBeDWsMrDBlGc487kAq2CnWBfRt/2D6LN20UgKE=;
        b=gwxYJLS00mUy4jRF8JZUu4by8M7bJG71+G3+hTmHS8DBopqyRyy7YWA++bsDYETiVs
         gw/+nl5d7sZG0cZ5oTM62pO9rrE9kxBW49DOPZhZuzpyzi1KYDyiCQtbW90fuLANb0JU
         wtxe6snQLX4my6Q6YrR6LiHFPDehRBBAQ1CbScK8AvIjl8B3PI+zLE40m+uya+c0XiKL
         B6qhPqi5RBRTzZddtDrwA79Vc/Ib2lO0CsT7lMRoRL5U4o/JsN4TMY7QgxvlxZ0QOE7a
         np3oio5iASOLJCktZYujRi73HTc81YopN1VGwoX88+DeVCsq9VTq27FGhbv8Op0zyvvK
         WcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536100; x=1733140900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ynq0nBeDWsMrDBlGc487kAq2CnWBfRt/2D6LN20UgKE=;
        b=u8QxHiuuvlukKuHLnSDoQGG0HGfvGrrLYt45gu7cSMgG8Nd1kc9nJbt0RKDjtNWnj9
         Z7P88AChiVxbCazlTgNLqDoWJXVQ4gZLSJGj9srNwh88ygtUY+S3yN2ZbSlIEMNrdW+3
         Px5Ox4njvUnMVvhTt7M5XrGyOSe1Cp9G9TYDbcwiQi2Zz5mQyfp/DgrYr29mS1Xeo4KG
         6IfH9NJi4fbQ1uNUVqkqNAd7OUM6XjL0MPuS2WjCsgUFEmMDoCqMLJTHfUSDP73NtFMT
         0N7ILsyJywPg907T/zeCIXbxeIbIUhMt7yh74OYlY5djrx+dcfhq+B2YyYJvvEFZY0Mf
         yfbg==
X-Gm-Message-State: AOJu0YyUiqafzfsjgWAKp1/B8JFGJXXoFMFbKV/nzNMFpFxCZdJ9e2mr
	Ky3ii6S/s3FDQph9bwrPbOepoPKmmYSJuHpNXyye44uaZ3RUM7KgB9wgkw==
X-Gm-Gg: ASbGncu4iakE5aktTN3kf1vhDCEcd7WsmFnj5dYvQOD9866kzgi/7gBpt8Zy+x7Y/qM
	a/6SBlgx3EuUaG/qHr7EJgMhON9SxS1B/jCUW3jZCIK0yINtS+YPl5bDdi0diXZ7cG0bkocXVJZ
	KaLRhK1bpEoohs1tb40t+BVgngZnmQ73yVRQFo9x0ATuiMWRCC3qVr3bcL0oHr3YTjr3qWxK6/K
	4eGkSekWByQSR0Irh2/oORHaiKO+L4liQj17GExTGNgS3/jAWV2QRJPs/rYYR3lUfvo52E1A0nM
	m0JGtlcEjPU=
X-Google-Smtp-Source: AGHT+IFDJQfplTrPpTIkHlr4hhKAk/jxQDnM8IW2Hoiu6LPzWJS8lBEcfswcEcEf5W6PZ5/wyV1wOg==
X-Received: by 2002:a05:600c:3b12:b0:432:d875:c298 with SMTP id 5b1f17b1804b1-433ce426968mr107819845e9.14.1732536100211;
        Mon, 25 Nov 2024 04:01:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/35] liburi-perl: upgrade 5.28 -> 5.31
Date: Mon, 25 Nov 2024 13:01:06 +0100
Message-Id: <20241125120127.2205232-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207760

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch | 3 +--
 .../perl/{liburi-perl_5.28.bb => liburi-perl_5.31.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.28.bb => liburi-perl_5.31.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f9..c15c3be93a6 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From c424e6118d3bd836939ce39c70ee9e6bbd984028 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 17 Nov 2022 16:33:20 -0800
 Subject: [PATCH] Skip TODO test cases that fail
@@ -8,7 +8,6 @@ TODO cases report as "not ok" with ptest-runner
 Upstream-Status: Inappropriate [ptest-runner specific]
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
-
 ---
  t/escape-char.t | 20 ++++++++++----------
  t/iri.t         | 18 +++++++++---------
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.28.bb b/meta/recipes-devtools/perl/liburi-perl_5.31.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.28.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.31.bb
index 1fc0efd3e50..e23942b81e8 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.28.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.31.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
+SRC_URI[sha256sum] = "b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.39.5


