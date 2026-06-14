Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA125CD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105043.1781424226790794826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d6qhZrvL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49222b6e871so8322965e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424225; x=1782029025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpqghOKD6Zb3LL8pViY2NMoteTLeV7gex/qh8j6VapI=;
        b=d6qhZrvL67IqxBY7Zx4ptPTj6kIVqXbylldmVBBJ6NohxVlYZdSjYMsKaajkLPZohl
         NgIUuNtTPVfRNXiwSKSDqBONjNLsVtZXKAqprxlrWFHbmswJXM5Ua18XhEixlUgMfqOi
         wBb6gvoSG3KvJzcdgtMT0vwfPFln9Y4rxuR7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424225; x=1782029025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpqghOKD6Zb3LL8pViY2NMoteTLeV7gex/qh8j6VapI=;
        b=SnENIgi+HMBjoYUIyAAN+RZjaKKJC3Xo3KFMosSdWQzBmSM06OuyMqaGHIZCnVO2Cl
         wTBnzs02RLIO2njhHzmiI2uq2ECQn//FqSP3OFpokD1Cz9UQgMWEROvpy5IAS37tMM3H
         klTA34dsnY/BhF+oPoEZdDgjRYLt14YPKLguA0CG9kCJdrzqae3djMQ2jOVZe+cRF3f9
         SeLtNMhSDh3zQTvwg2QBLExuFA8y61dJavgV5BzhP290zuEkAFN+UpE/51VqkpveVLX9
         VC9Gkk9yIMymu0a+GP/yRVck8l/v7op0boqSwb3n+/c/up7yEOKERyfjFs1lFLefUyUm
         Z/FA==
X-Gm-Message-State: AOJu0Yx22G4U9AnFX+s6hr0iNsLfkwkzaiBJS8AIfTGVnCtdN3e3/XtZ
	CJCrPLl4urYBbKPCXQwdGBneHHEjb/U6JPCgu8JO58MO4KVKoa25otYmMgf2aMDnN1Ll9q7IU45
	/5/K2
X-Gm-Gg: Acq92OEg1oTapvSyPZeahStXogGHxkikRNcUs/oqprgFFJTq6GlsaBwj4/H/6WkcVWJ
	7SOrpb9cklynoj/1r63w9X7BPcRvAO4frsXMKv9yO49EgxOluDfhEo3AaYBqGIStAA0xaFKTQrN
	5iOPQhQgpLC4upRItwJ+CCdIzO07LBYlAO2wovxP5RNvSw0Ueuwxm8at63/od8WBaLul4PegE3p
	PORNISMuAqMzHMxQ9yPpS8mvrOdTIFVoMIth7cSFfRPpxVAkaMxk/JAB08z41NfrcWBQjizFUKC
	loc1ygfJ+YCoJ7v9dwZuBGCUFaxLI0RL1nCJNx0WllbUMBq+nv74idv/MDALfCiFvuwfQ8Gutdo
	XEzrvbs//PZuwPJLCpPEiJp9N8gwNb+ltdBh/0F7y088ltkagu/8dOrsOUx4JOPz3w/SnlMz5Sm
	AVz4QfjHzFRlTvqlsErP4RNt1jyVfhgILf+tdena+trSb6jm2vRXCEpVBfOkhjaZ4=
X-Received: by 2002:a05:600c:5020:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49189c25ae6mr106012505e9.30.1781424225002;
        Sun, 14 Jun 2026 01:03:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/56] libxmlb: upgrade 0.3.26 -> 0.3.27
Date: Sun, 14 Jun 2026 09:02:33 +0100
Message-ID: <20260614080307.4017177-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238706

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.26.bb => libxmlb_0.3.27.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.26.bb => libxmlb_0.3.27.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 96707c2b0f7..2dd4a6727b6 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 463658f88ed0c3d0b41a5f9e546d00e574f44e79 Mon Sep 17 00:00:00 2001
+From 14e62a2eb40fdd1c78b82b4855541686608c3d45 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index ce2ced7..aa60b6b 100644
+index 043db65..be86a38 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2960,7 +2960,7 @@ xb_speed_func(void)
+@@ -3304,7 +3304,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
index b736346a8fb..c68f375aa32 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "f969b4dd491a7367f7500f55f576c810985363d7"
+SRCREV = "2320a66cd267a82bfd41db90e35cd33e1f71bd8b"
 
 DEPENDS = "glib-2.0 xz zstd"
 

