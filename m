Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE0CC54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.71683.1724736257906750486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJscR8Tq;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a81bd549eso384968766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736256; x=1725341056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7yub/8+BlxeUD9Om6FqNyQGj5khhB28DVHVval2M/o=;
        b=IJscR8Tq3nDfTzgROgxU9NeUjC8a/e8xaLEwET81albxNOawOYZUATtydtvUbvsXA7
         MoFjPM/G/X8YciWxPu92knfWYscBkBhxCrb4MbrA0OEmie7zviqKxTsMVB89hab7fG75
         WXOnKjRcZKtab/ASuKF1kbv+knWHIP8RD9ufH+VIGCidtJqPKEpIX9guKdEruFdgSNuJ
         Oja+kH18IjOe1uIUQOi2OKhyPCABazhMrB3Aq4yWtXl+h16vtoDO2fjmKcTPvg2ECd6j
         7DYEQDc4t1LyYpAjVKB8egjOB8rckhXz0LmJm6UczIdmWF1R1Ps+H3Y3HhPWhIzfEayl
         tU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736256; x=1725341056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7yub/8+BlxeUD9Om6FqNyQGj5khhB28DVHVval2M/o=;
        b=DYnb4pWpmSiV3HpMV/DGCR854PygDJ/3FNt0hA4yVE/IEdzQ46G7Dl6zHyH8KtGuG0
         uCAzHRKjlxawRTvlRTROm1OvMyDlIbf2/9/rkyE2ownuzXaBytEnV+hygVdxTqW2IWA5
         MSuxascvVf3Tce2WCXaRG9Lrh3i1j2xqwZV3dwpOP0NlD39/wi8CNuJtQD2kn1w1eTNB
         fOZ8vaBQlrYwcwnLbczRBxV1UULiHF6Vu9m3O38Gwmbg7LrNAwbX1bkWYn1N71Cwr+As
         f4RtptilahUPZzfruFFSkgQHlQ8oLoSlf2MErxPtPC5FuNGlyUJev/Ht7lAtW59e8NlE
         bE6Q==
X-Gm-Message-State: AOJu0YxTMobNh0XRpM8d97cUJP/rXAflXX0Qj2zN/7eHsgKIe0iATTLm
	ryuGIaBJTYU4aBTMyCtQHsFY2OKLmq+nR0NQXjY8Te2UuXIFWX6rloXTEQ==
X-Google-Smtp-Source: AGHT+IEgcG1tU7bZ9MiqRncCjJuerr2fuRlKTgGTO5lTSQrSoZvmBMjga2vbezONR/1J8a0WVfKfng==
X-Received: by 2002:a17:906:6a14:b0:a86:78ef:d4ad with SMTP id a640c23a62f3a-a86a519338cmr808053466b.20.1724736255672;
        Mon, 26 Aug 2024 22:24:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/34] alsa-utils: upgrade 1.2.11 -> 1.2.12
Date: Tue, 27 Aug 2024 07:23:51 +0200
Message-Id: <20240827052354.1319810-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203807

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-utils_1.2.11.bb => alsa-utils_1.2.12.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.11.bb => alsa-utils_1.2.12.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
index e598fac9f88..380140861c7 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
            "
-SRC_URI[sha256sum] = "9ac6ca3a883f151e568dcf979b8d2e5cbecc51b819bb0e6bb8a2e9b34cc428a7"
+SRC_URI[sha256sum] = "98bc6677d0c0074006679051822324a0ab0879aea558a8f68b511780d30cd924"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -51,6 +51,7 @@ ALSA_UTILS_PKGS = "\
              alsa-utils-speakertest \
              alsa-utils-aseqnet \
              alsa-utils-aseqdump \
+             alsa-utils-aseqsend \
              alsa-utils-alsactl \
              alsa-utils-alsaloop \
              alsa-utils-alsaucm \
@@ -72,6 +73,7 @@ FILES:alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ $
 FILES:alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
 FILES:alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES:alsa-utils-aseqnet     = "${bindir}/aseqnet"
+FILES:alsa-utils-aseqsend    = "${bindir}/aseqsend"
 FILES:alsa-utils-iecset      = "${bindir}/iecset"
 FILES:alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES:alsa-utils-aseqdump    = "${bindir}/aseqdump"
-- 
2.39.2


