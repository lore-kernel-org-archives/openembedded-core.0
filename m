Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20ECCD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9486.1777739415549220346
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OkBpCD3d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfd832155so1708464f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739413; x=1778344213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jk7HYxWya6mDPlzTPOVM1p8y+XtLOHb0z+JOliVcN2M=;
        b=OkBpCD3dfycd7XYk8oPDVwH0LajQHtUtpDJcdlXgmF/DTJXtq3zJdEUpLcPebyP+eG
         KqncBBUdySy3AIodSTWlvgPDS7PzvNqst9CIVGixfBiJ7JNSyOjuy/aVe2inJYVXLiED
         B2ZrlpHNKo7rCrzI8K2vExx1vLxX1SqqW/C4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739413; x=1778344213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jk7HYxWya6mDPlzTPOVM1p8y+XtLOHb0z+JOliVcN2M=;
        b=YF2QZSJi0RN21jZmb7SQNxjK//F0FkmqMEQHSNCKvrL6zVe+IIWNvBCgbKflPMTre0
         cuoFYsNZspHi+GUQBEeemIGcCwsd7+Iu4Fx6S3SsQZ+8BUeymHX4YRJbl/V8xX6nCPTy
         Cpp0DfSuKp8J7tt/RSnrCTPkm1DuixgPk9DINx9Rlt4FUHxfLY99p7K2wqp+iGENpnj0
         lwvb2HrTy/xVgsZsvU/mzzIx4p5grkeR53/29A2YegQhiQcmvCHuybVvvUJauzj/68yQ
         bmn+dKWfwud9ZgZBR7ttI7N3vY1J2AGUecMcZACYQNu9sGhJZ8CbkC4qGqapfATGaMu/
         Cocw==
X-Gm-Message-State: AOJu0YzNl8RP/Q+hujbKbmH5T82fMXf7tdeh3xapyYtSWNBmGZu5MOrG
	7OTnBAnJW/HHr2R14+2m1sqbEPbYJxHVY8tq7DOJckZKKr6iD/ok5byso6DJMXJ751GV0BrHFQO
	IdAqh9jdjhXpG+Mz0p0KInElQP4/FPAXw6tBWa0JzloScPk5Q//+zfRT6CqYCuSSya1eAni5m7u
	0HECYwNVuIPPz3IE4=
X-Gm-Gg: AeBDieuujbCsqfpWt0DlBtJD9kdSt46W+dlcNHPrzBepKXDKXbEikkn+a3h6IACKEBo
	3ZSdoBLfKxHMnILyKUj/xDcYnfBWChVBrn+btPvTXtU+qurYFQKRroWeJO+cMmWKSZoRORQ/xfr
	hL1cEQUlHHvTsQYPYloxqVkPJp2VCfx9GhXwAROlPw9PWN5DlJEG5XYn3wKmcF27Kq/EG70qPny
	e0aHYJOr51rs8+LulzNAfnZJz8xPFb0MDpClAguBD98GnQu5dGpsyHh5Q+fTLuA3u6whFuJFRpj
	qCjZfYlS/qFRXbCyGNN79xhRspsBkiAsADB7blLr+Gv5eIdpM2Bdn9++fBz3AsNVrcBL4SBQI+r
	PXPJrS0EmQdnaburvd3ZkWw4YWLWVVprqHAj/UymLu3D9KnaXS23JzBfrTVDb27x0BdQZG2qzH6
	i9OnQFo0zMailRmvHvf2SsS2Ol8+EuHsb8UbUREKksUQqeVwpf0ZZVHmh0R+orOKM=
X-Received: by 2002:a05:600c:8287:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48a986526f4mr51111735e9.0.1777739413464;
        Sat, 02 May 2026 09:30:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/62] libxmlb: upgrade 0.3.25 -> 0.3.26
Date: Sat,  2 May 2026 17:28:43 +0100
Message-ID: <20260502162929.1377831-23-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236332

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.25.bb => libxmlb_0.3.26.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.25.bb => libxmlb_0.3.26.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 1c46f6fc1ea..96707c2b0f7 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 2dbc50d49e2048f7227c406931a69f747e0eb12c Mon Sep 17 00:00:00 2001
+From 463658f88ed0c3d0b41a5f9e546d00e574f44e79 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 76b2e12..c68c13a 100644
+index ce2ced7..aa60b6b 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2912,7 +2912,7 @@ xb_speed_func(void)
+@@ -2960,7 +2960,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
index 86874360522..b736346a8fb 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
+SRCREV = "f969b4dd491a7367f7500f55f576c810985363d7"
 
 DEPENDS = "glib-2.0 xz zstd"
 

