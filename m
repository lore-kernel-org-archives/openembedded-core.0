Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0E2E77173
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8156.1733294987494153978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZ6EFLM9;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a766b475so58587905e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294986; x=1733899786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo9bwAHfuvNnz7ZVS9GKGRrcvaNMKgZ9C9SPqlVSWaE=;
        b=ZZ6EFLM9deqs8gY89HNYc5yC3PUgPfocTQM5AW2Z58zYvpic4RKW1HVxONq9+1a0CL
         abIsoj6T3kHUci02DrakniJdv6MWOpjwOubG+MhR07vTOnxgyLKg0vjQMcF0FOjUk2tu
         uvZUXrAiOoT2pLlmpsvDhjlrl5jmNdIaMxrvO4+Ue9I59vV/RTNuTKInPvdd61EIioLR
         dJo40J4hdS4EXR+yz+t6ulcyHUzxVMB1jem6WLMl4tApz1QvqHP0Ts4wGRWjk5wAxQ4x
         A3jKSB9wjw2v1xm2sNJULTAt9cV1c10dQfH4zRe8Iw6Sj1WP8NoegPJhNY5RMs4hhqWs
         42LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294986; x=1733899786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lo9bwAHfuvNnz7ZVS9GKGRrcvaNMKgZ9C9SPqlVSWaE=;
        b=u3NrLzzpPBf0ZOYU6oqbs7WM22KN6gZSGfTLy/PV0zXk5NR6xVOZeitmaQXSkVWEwX
         09I8MySmg7teVcFMpJIXuMGpW8H5ympFLN+G4zpMUxiznsOtIxsAdir5s/CIWq9Gdqid
         YM3aJ+wAJE+cd0tcsAqL8dTqi3Rri2UiFU1IAqja1AgHeJo7LZGejLHSky+isYxQAMXU
         k0XXlqSWrrrNkOS7U/BtvKe6JrgbfPoHOyVYf+l4XTCBSjUQDUvvj6y+eE1yqVk7jVyw
         d9518c2EqAtnwaiO9qsdQ7JWgFNAc0QX6qImZM10jS5kCum2iP0+Z6pffaTr+NpUZucr
         um3A==
X-Gm-Message-State: AOJu0YwfoQiy7P3K6cW7C7bkscOHchdudN6Vim7dtoFDpqPr8ZKUb+gy
	GfwOeZ2TNSXGaLA9mztHw23RzVMBAUrNt1QeV1aH3gCY0//BkyNYqcMAUA==
X-Gm-Gg: ASbGncvr23f5Uy+20Zt8dpp8cPrelBCSi7hU6yfn/nSbnJMjY//V5Jb77ntHVm2T715
	DZSl8F1HIOZHRIlgbOGRKT3FKEBfY/B0nkcPmlNLV9VTA/WOi7u+YQp84AA4HVGRf+O+7EToibx
	BQ/SU1hOnznYI6d0UPgELuEImYWRXQKKvd62tVAi+7hM5Xx4qPkvxmw1ql/k2BUnNqlsDFBCtl5
	3pEZS+1jEpVaVroS9eFz8nTJAHX1PkBY63yFd8PnFy41kyu4A0dC1AV9cDkcP2FmFlC9LQpK/YX
	MwI1ow+qg74=
X-Google-Smtp-Source: AGHT+IGba3jhvVgIHph0HNLYNUMRB8s93oW+6t+PIyD9KHaVOf1v1XNqS+ij9TU0jrwIfADG3EWrlw==
X-Received: by 2002:a05:600c:a03:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-434d09d02dfmr47160405e9.16.1733294985635;
        Tue, 03 Dec 2024 22:49:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/37] swig: upgrade 4.2.1 -> 4.3.0
Date: Wed,  4 Dec 2024 07:48:59 +0100
Message-Id: <20241204064920.817016-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208245

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/swig/swig/determinism.patch         | 8 ++++----
 .../swig/{swig_4.2.1.bb => swig_4.3.0.bb}                 | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.2.1.bb => swig_4.3.0.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 9c49414ad7a..4359281bbbe 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 28648b3873d83e26bd19b64ce2c0a41ced9292d3 Mon Sep 17 00:00:00 2001
+From 1cd6f0cc21fc977a710e8d30c3d2ebfee3c72dc0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
@@ -13,12 +13,12 @@ RP 2021/3/1
  1 file changed, 1 deletion(-)
 
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index de0a512..ac9e825 100644
+index f68b609..0c2aba3 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -638,7 +638,6 @@ static void getoptions(int argc, char *argv[]) {
+@@ -633,7 +633,6 @@ static void getoptions(int argc, char *argv[]) {
  	}
-       } else if (strcmp(argv[i], "-version") == 0) {
+       } else if (strcmp(argv[i], "-version") == 0 || strcmp(argv[1], "--version") == 0) {
  	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
 -	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
  	fprintf(stdout, "\nConfigured options: %cpcre\n",
diff --git a/meta/recipes-devtools/swig/swig_4.2.1.bb b/meta/recipes-devtools/swig/swig_4.3.0.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.2.1.bb
rename to meta/recipes-devtools/swig/swig_4.3.0.bb
index b564be9b36d..a31ca68444f 100644
--- a/meta/recipes-devtools/swig/swig_4.2.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.3.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8"
+SRC_URI[sha256sum] = "f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.5


