Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280F5EE14BB
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4176.1694019403563462183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JZOqJyA3;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so531223366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019402; x=1694624202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sarSG6pw0uTq4SLl3N3pyqSEubzlPcx9KagMbS1JC0g=;
        b=JZOqJyA3IwA8P33R0JoZ7R98gOBYSDEyx+FM8R9BdZprA0f355UMdMDnRUvwm8JiLo
         jUiYpyEnmWMtgl4g6fUGeBaivadJnBNOD2tpJ11PicSyBd54opTMuc8NSQz5L3ESHZ/v
         44iMEXHUupU6lMSpbocTWrS95Y5vHfbWGmHbzPk2DVhYqwq6IBfk2z6qxyhyCJwpiFFl
         cKKpR+OlTjjK0BgXJYuU2ftWf+eLCFvjqvC8NOYu4M2KFcAazd65OO7W3hmMHcgWUHQ4
         yjRWRktRWEP5VzJ70TkVuxCX5QO7oB3TCjEY8UcXe9mv8PAJj0ys09aNrEReB/LOQtfN
         joSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019402; x=1694624202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sarSG6pw0uTq4SLl3N3pyqSEubzlPcx9KagMbS1JC0g=;
        b=AmVaZeTdpOwCIbuXBB7ScLEJpYNremxWmiDGQ/NYEHS/HcPPsAsUag/HPN1W8rBWUJ
         jrTWZ1yrSOmacFz3WeSApvk977WMtnx8s3IQk+Z4bD2ywKfb99IAMueWQQE4t/C7M1bZ
         L1GceXFtCaWIQhD+J4ZdX+LSMLPqTYK2FWkT8f7SUjQHVAFEtewTnFIFChc4Cr/u+y/T
         Wvq57Hh3WNebLFUMhPBV9U7BtYNrqWku39Wgct5wAhbp8KGHtJb2UFpQI87MEekVwBWU
         llDyhG1GDHNs9kzvDGzczXEKGpgWx5iwLPqwItk1Rt0CXpF+yFTZTPSQJp4rlChCKrFd
         YFLQ==
X-Gm-Message-State: AOJu0YzFpPhFub49vGJSsIZ3w1UiQQNR+TouOQ7jorHnv1DrbVViPOtw
	ipKdkYwknLIOQdKqfhdxYcale83JSVs=
X-Google-Smtp-Source: AGHT+IHN44OKI9MypWS2bOeVH4KS3h3Kl750Zyf198v8VQunB+zI15KhCsD7/Y3LVWTLw0b4NkMPsQ==
X-Received: by 2002:a17:906:7689:b0:9a1:e011:1a5b with SMTP id o9-20020a170906768900b009a1e0111a5bmr2812559ejm.54.1694019401846;
        Wed, 06 Sep 2023 09:56:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/17] perlcross: update 1.4.1 -> 1.5
Date: Wed,  6 Sep 2023 18:56:21 +0200
Message-Id: <20230906165633.2382629-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187327

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Makefile-check-the-file-if-patched-or-not.patch | 14 ++++++--------
 .../{perlcross_1.4.1.bb => perlcross_1.5.bb}       |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.4.1.bb => perlcross_1.5.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 8c8f3b717c8..4e9153ebf10 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -1,4 +1,4 @@
-From 24a3e0c48f9ebe473b5f1078663e275c27d0537f Mon Sep 17 00:00:00 2001
+From 3eb33dce6e3c93e1b3efcc9649f871100adada30 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
@@ -9,23 +9,21 @@ one time.
 Upstream-Status: Inappropriate (OE-specific)
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index f4a26f5..7bc748e 100644
+index c6d6042..d137976 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -61,7 +61,7 @@ miniperlmain$O: $(CROSSPATCHED)
+@@ -67,7 +67,7 @@ miniperlmain$O: $(CROSSPATCHED)
  # Original versions are not saved anymore; patch generally takes care of this,
  # and if that fails, reaching for the source tarball is the safest option.
  $(CROSSPATCHED): %.applied: %.patch
--	patch -p1 -i $< && touch $@
-+	test ! -f $@ && (patch -p1 -i $< && touch $@) || echo "$@ exist"
+-	$(cpatch) -p1 -i $< && touch $@
++	test ! -f $@ && ($(cpatch) -p1 -i $< && touch $@) || echo "$@ exist"
  
  # ---[ common ]-----------------------------------------------------------------
  
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.4.1.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.4.1.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.5.bb
index 6bf056cc159..d17945480ef 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.4.1.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "3e14bb4f28c83586c668c5f9f6b4e57b138b4ec2fae0271086e29d4e352670ca"
+SRC_URI[perl-cross.sha256sum] = "d744a390939e2ebb9a12f6725b4d9c19255a141d90031eff90ea183fdfcbf211"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.30.2


