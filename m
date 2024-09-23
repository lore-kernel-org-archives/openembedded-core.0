Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C81CF9C77
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.36268.1727097249508826355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TtOYLHKW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718d704704aso3769441b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097249; x=1727702049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7okafwD+4Reob3oeJ5DUXS/6Ngpjbkcs5SArx6m6VMU=;
        b=TtOYLHKWTsnMj823VVwQ86QC4kDk00NbyS6EdjmdaQdjidk1YYTbCtVZhcTF3YX6o8
         a0CxtwNLPgi2O+VWlncMGnbbQgsx8XG5GYYNlptEXOFJV3gN9gM48kNQ7LewgMbH7lvs
         o9fmp+jgnv2PXuIY9ldVpizZuE96afGZy2Foij56q0ZaA9PrCihVw8V0TGD45rw0DKH9
         gGOStUP7uer2l0oIWbLvA9hlmBgq42F+bgGHFYLQTX6Fw5U4F4q3mQ2B4bhzowbjHT1d
         imc7rLMTYi6rwC0DJA6VqyEPiHSRNUOCCLFG3045Og4XR2LaIwMef/N9kknRtCO/zFkl
         8GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097249; x=1727702049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7okafwD+4Reob3oeJ5DUXS/6Ngpjbkcs5SArx6m6VMU=;
        b=R65NLoeY5c9biWtQV7ZJKjbXGC0umUhK0RgPgwn9TGIzdxeFr2p50QiBDSGbIVhilp
         +vrRDqOe5yF/J/jrdch3vT9QG31FK83g1Nm6SDQIjh4HIeFNwxmhSiEImvTPlBtn0Hb5
         UHw+1fCy8qe1bxzcg38SLXUjdRrN/s6j0jqU4ECiN7vIgnuCiA0rBFZ9mqduO6w6Hkdr
         N0aPPeLcSjhAFiuBKJ18tkLmZ6DT94IiBrBCe6WTpjES12t/UdtOqXvYG8aT4lvx/bO6
         Z029Lpa/DjUBYNe7H0NzbTF6ZnWlUeWsV0qxCCdiPElxXubDTTfO8MTB+cBLaLUp5QVZ
         iAVQ==
X-Gm-Message-State: AOJu0YwrPt3HJUrogE5mfyI54jcIEb7PUt0GwkrK9ka4fin7pdPpZrRa
	HiyLMqrz2e7xvjkaq+DdQVSBPx58Kq+F50v0CUyUR3aNEmNKmedafn3FJEHXNAPwArroCUoeGnF
	9hag=
X-Google-Smtp-Source: AGHT+IHawOSf5vfgKJ8mJBMbnxI9E4W8BOgThrpALeUuD8CVdT4M32GoRc1fIfRhSg0hWgF0bm+lzg==
X-Received: by 2002:a05:6a20:b40b:b0:1cf:5155:cb5c with SMTP id adf61e73a8af0-1d30a9be637mr18595480637.34.1727097248715;
        Mon, 23 Sep 2024 06:14:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] yocto-uninative: Update to 4.5 for gcc 14
Date: Mon, 23 Sep 2024 06:13:45 -0700
Message-Id: <082848466e5b78691a0bec983048bc1eee167b7b.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204810

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5638681cef7e250ac64832dbe791418d97f05ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 4ac66fd506..657c1032f9 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.4"
+UNINATIVE_VERSION = "4.5"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b61876130f494f75092f21086b4a64ea5fb064045769bf1d32e9cb6af17ea8ec"
-UNINATIVE_CHECKSUM[i686] ?= "9f28627828f0082cc0344eede4d9a861a9a064bfa8f36e072e46212f0fe45fcc"
-UNINATIVE_CHECKSUM[x86_64] ?= "d81c54284be2bb886931fc87281d58177a2cd381cf99d1981f8923039a72a302"
+UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
+UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
+UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
-- 
2.34.1


