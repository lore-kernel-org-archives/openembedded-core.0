Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.780.1589820539506250014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mo02W8jh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id x2so5210410pfx.7
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gSC5Hji9lajyBPnYtoo6ANlcyo1DfMtN4XLdaj0UM3s=;
        b=mo02W8jh2+L7MmdlWc50swNBPEo5CS/wyyC4AqTqtTxpuA/oxDbDVDkJOIGQvl0rfT
         J7YzySpthpY6BFySN++EdqSuaNwps64+m1MiH+7eWk/qcWqt8RM/S/EgAJlFc03JKCjd
         dOja4SCxwgGRn6D8FfoRgJW4y+LEOiuoYHnOzCi4P6m7KuOYR2fcKid/kfcbLPYbic8R
         chQq17PsDydPxRJ7L/FgESMu3nU2kEkuPrAQS8WgW5EiekjhCry8V8f606wUok2Bjb35
         gm/3f+qeBdY1i03U80xantCrGGjVXy0LaNdqqeYqogmy0Yd+DQLEeZYj31j73k8Uh62w
         T9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gSC5Hji9lajyBPnYtoo6ANlcyo1DfMtN4XLdaj0UM3s=;
        b=ZVYdT1I4h3KKRFIPbIesVMgiAZNdk8kfvGHzJ0OTEx7QfqPZB5yeKszuhsyeK1HJZB
         Rl2wtZy34O58iowBPSluJb4HdqpqoaTDtnCeLdv0iAuS0jvCqjXALfpUlk2hWABQsByA
         /itzKauM1vbhFItNywypkPiGav34gvPfM2MtfvD4dNQhGQNYYiU3MpcmKtxqa0PbWgjG
         J2worWK9LitqEYMpARn8tkljSi2rfolve5SYChIQZb8CZqCcvr/gez2wq+ph0NquSNxO
         VcynSzdRk0snlPLrUlC1vyF2od/ijquRoisuMmry1x3n9fAU73Ej/Z3lQtx3Uqw+45jq
         QNQQ==
X-Gm-Message-State: AOAM532QX7jeb5xX2QCGPo6MQgaZA4GgNmf2Yooorg9a3F9FhhsUDDdR
	IDlBE/ku4Yks5xoo1RR0EEav+PFPuqmocQ==
X-Google-Smtp-Source: ABdhPJyYyDBWu1H2cR7c08gwcvz1mHGWWMFArhpk1WLOSRLlSIw0ft+CjLUpDKHHmhnYx8XiiiLAlQ==
X-Received: by 2002:a63:564e:: with SMTP id g14mr16209039pgm.63.1589820538468;
        Mon, 18 May 2020 09:48:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.48.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:48:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/19] meson: fix upstream version check
Date: Mon, 18 May 2020 06:48:20 -1000
Message-Id: <6cfa86069dd2189782a3505ffdacc489ea5cc3f1.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/meson/meson.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 50fb41ac98..0a58c971ae 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -26,6 +26,7 @@ SRC_URI_append_class-native = " \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
+UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit setuptools3
 
-- 
2.17.1

