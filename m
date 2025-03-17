Return-Path: <makchrbiz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC54C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 06:27:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.46205.1742192818162079220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 23:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPPke/+O;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: makchrbiz@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391211ea598so2106525f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 23:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742192816; x=1742797616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag5ZVcAOapIyEwNvyNM0Rgse0tjFVebNAnxfb0aD5Kc=;
        b=LPPke/+OlnfozF8M3zLeT0xu8T6FcDVZfL1UupSLT7DP+Qe4v7iRGcCPAyanMTqR0j
         gA+j3IbgtgzLWGOnuYN6SJxtSMDEwrDMAi519dZfaZZ7Vp3y8m8KsFRivE4h4QTvqquN
         Lh+s+xFA7owaPgJTnDd6Jse9SYk+ZaY7aU5NjY0GXBoELVa8F32Iw9NnOUNhNnlopW9e
         YT0k4TxRu96QO7x2JdGWxroekedpNxKF8vyP8oijQOgtQLh5byV+OuTTgKP+5c+nB58C
         WZWua9PlwN7Jx3rXYT1nONGB+I/072Ltm2ABdEb2V6kDjTs66LLDScZwVqZ+GHIpl6ex
         aKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742192816; x=1742797616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ag5ZVcAOapIyEwNvyNM0Rgse0tjFVebNAnxfb0aD5Kc=;
        b=sQ9rue0V0/zK2c/n3cupUgdB5OL4Jui3cAELBhXUV0o00JcwHQJy89lVH3T9VO3MVU
         jrLFzVXh2amUB0/c4nX3pya/zIHQxO0YtXLsqYryjECS8C+sJA7sNtmFwe1r/00UoeO1
         X4xLOEGOVQcH5WV1/AdLGqk2Zw0ZJAEj0UlW6XAEV7r8qczc62mJLuUjM69W0789wb66
         JuX2TgwnbDWQ17J6sUxx+A3kP7RW4YohMekW3b5AcAAt4XMIbWarBB1tRoXLZrtIqe0L
         Qlgtj3P7nS4y6J3QPiw/q8KCeatBwSR1Rc6E45vqwWsusqhpu+mV8m4QpiFTWilZG7jm
         X7kA==
X-Gm-Message-State: AOJu0Yw0CMZpEqLdw9ARGhaYVO8DZypcRVyePU1puoD4Vivx4Gkkcn93
	ZWK6/pFicAyAShmzOD+ja8BIFScOc2QIoQRijRnUqLkJgae8HaimtRD1o2YA
X-Gm-Gg: ASbGnctNq6ZmNmA45+8Ywrx6T+3QGFXn82BLx5GEqhjSZjTJM2M+ONq19z5LOL+IWea
	nRspQlTOoUDqACflhIMzHEIRoC5OcWGATwICwyIN5Wd2+XWlt/qnxaAYy+AYp2j4DOJp8inFRvX
	YyfAqvy4QPIeBOBXwQ1YQ7xHAG/2qjr9MpHmGGJJIx3j/oIp+hAGbYF0An5IWeee7vV0XPn7+F3
	wtzVgFDbXQ5yvSwyV1ZbTgJOU8toV12+W2Di0//EtWJ1OdnVCzy2YXgS2qGstCFd2v3mjerUuT7
	O7lF9gdguPJo3AQYSaHzxDJc39kJitC1719x4YByZucDzIVzuIF0eDF7EMEoCt79ikuSokKRL6w
	ZI3HZEI12bA==
X-Google-Smtp-Source: AGHT+IGI6KJVCzayCucKjflX5YnfgzFPleBHLUa9DbnI7Cf5b8hXsKxG9RjWk1GXlhZMKduSvUkD7w==
X-Received: by 2002:a5d:5982:0:b0:391:4889:503e with SMTP id ffacd0b85a97d-3971fadd568mr15015571f8f.33.1742192816247;
        Sun, 16 Mar 2025 23:26:56 -0700 (PDT)
Received: from localhost.localdomain (ppp079167040036.access.hol.gr. [79.167.40.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebaf8sm14272251f8f.95.2025.03.16.23.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:26:56 -0700 (PDT)
From: Makarios Christakis <makchrbiz@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Makarios Christakis <makchrbiz@gmail.com>
Subject: [PATCH] icu: Adjust ICU_DATA_DIR path on big endian targets
Date: Mon, 17 Mar 2025 08:26:25 +0200
Message-Id: <20250317062625.431-2-makchrbiz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250317062625.431-1-makchrbiz@gmail.com>
References: <20250317062625.431-1-makchrbiz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213064

On big-endian systems the preprocessor define ICU_DATA_DIR
is currently being set to a path ending with the ${PV} of
the recipe.

The PV version string has changed to a '-' separator
since oe-core commit cebe8439cdc656d53355506a31a3782312bf03c5
whereas the build system installs the data files into a
path ending with the dot-separated version of ICU.

This causes the ICU data file to not be detected at runtime,
consequently breaking any dependant applications.

We therefore substitute ${PV} with the dot-separated version
string of ICU, as returned from the icu_install_folder function,
on the ICU_DATA_DIR define on big-endian targets.

Signed-off-by: Makarios Christakis <makchrbiz@gmail.com>
---
 meta/recipes-support/icu/icu_76-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index 08dabde3ae..f0890fc890 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF:class-native = "--disable-icu-config"
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
 
 ASNEEDED = ""
 

