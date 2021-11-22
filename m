Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251B7C433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 22:28:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3324.1637620082988482235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I69qNqt5;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id y8so15373490plg.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g3ZfmO+EoJYvo/LyZFkPjC0J7buM4/EfcEuTGz5fJ5Q=;
        b=I69qNqt5h2tfjVsrCDXfElofkKGSkLd2A40gR42HIw93jcSDgAyqq34Yvv+CHt/Bbi
         hV+/Zby3ptoY3hHXsDfVxdPprd2x9IMTjhjmVVXPFzBd7rYEydjfFwWaqnDzsb9muqhr
         kBVup6RP2HWYa5smbFBOST4ETkSb1hGkEiahiIdx0K/deZcV6nSg9z2SXajCi1k0l6kX
         qvG7ztoc4kuKoE9ZdJBNLzQtuK+xm22Gc8q+T/NLd7LppfmMdNeEnjbwpUERKuwE5mpV
         gOBZQdmND9QgSXORFEtEfvXq8Q6Bs6h1UqocwrdpWha5OAwLrG1rQbSUi9sn6GysDGiM
         ZFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g3ZfmO+EoJYvo/LyZFkPjC0J7buM4/EfcEuTGz5fJ5Q=;
        b=W9SpvZVO0s0HUk5tA+Mhe61rk8ZpKjDBYHHQzYqvDCFKYniT9zkq7/ExEJf6d87Ov3
         Hh2nd3NOJab35bFfzMiPHVP06yGIa8ONmbJOfowTiCGB405jHkXNPoxUT0x054+9mDuA
         GiA+mhsXfbFw3+1R3t6wR4YPUublzJH0rC2qze3TfqdTBCD3r00cS4IZFon87eKKw+6k
         YkJA+KguJBv7neeHbqJTiptjG/tMvH9Prb/zyESb3gMVVFrAenIE4akR99Slu+n3qy4d
         jB3DaRWwJve5J0kkTLTdTKG0Rsc3P0q60Napi20FMLn5c7Os9rUI+EBCkeA7kaW/dv13
         sbCw==
X-Gm-Message-State: AOAM530K8pFtw7Q7jUpB+z90g1aTFZo48PH7xdg/7zv19WYWk+aj89Hy
	zN+vVuATfqN3EKc7XTV9pyqZLakVZeCryA==
X-Google-Smtp-Source: 
 ABdhPJzTzlICoPQwlIbsDIJf+oKWPfbbOKp+5Moet9C+aaVewn7JbwkQ0kxIt6LFCrTTcQH+0h18Dw==
X-Received: by 2002:a17:90a:4b47:: with SMTP id
 o7mr36035025pjl.92.1637620082215;
        Mon, 22 Nov 2021 14:28:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 x18sm10170656pfh.210.2021.11.22.14.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 14:28:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] image: Include psplash only when screen machine
 feature is enabled
Date: Mon, 22 Nov 2021 14:27:59 -0800
Message-Id: <20211122222759.783294-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122222759.783294-1-raj.khem@gmail.com>
References: <20211122222759.783294-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 22:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158591

base-image boots in degraded mode when using systems without display
system since there is no fb device detected and pslash service would
fail to start. Removing this image feature means that core-image-base is
complete for headless devices

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6c759fdf700..68f8ecfa962 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -53,7 +53,7 @@ FEATURE_INSTALL_OPTIONAL[vardepvalue] = "${FEATURE_INSTALL_OPTIONAL}"
 
 # Define some very basic feature package groups
 FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
-SPLASH ?= "psplash"
+SPLASH ?= "${@bb.utils.contains("MACHINE_FEATURES", "screen", "psplash", "0", d)}"
 FEATURE_PACKAGES_splash = "${SPLASH}"
 
 IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
-- 
2.34.0


