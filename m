Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D99C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 08:37:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.113064.1669624651530004758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 00:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJGrzTbt;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id g10so9453528plo.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXUtF850uwb5ma9hzLe1X1oEW6daAkq808xnNA5gVzU=;
        b=YJGrzTbtBR11Qxl7Zlh+FuadMLjQUGKPfWH/qQw3FD0ZI3uGu34jSGXnWNoMx5vxnw
         r5jtY/4r74aKJ/Q5dGVkhIcV5u+UpY/XlUvVMtGyy5kby8ZzwoE/pJIgUFEqDsUb1fwM
         MY6UXowbGiIjLPxPa6moELkZ8yu1t2wf+WzhrB+CAEoWt/lhbkTpkxA40XEQnS9SdgAx
         5vZZcXiPnV0aPNRdgGeQzUyJvyX3K0HVKXDZQK9CdE4mp/TO0XucY3TKhjG7bDEuntKE
         t+IhIOHscrEqzxa640NsI92RrfYOHQC4d1Akrz+Vq02m4yGWGyIjnTAWpL9/hqYscDkh
         IfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXUtF850uwb5ma9hzLe1X1oEW6daAkq808xnNA5gVzU=;
        b=KTi8XyqeK8KvKHD5xipRMlF3lPpDK0a4NQHfSF5FgfC/eHXb9PJ/fIsyl7xWNIV8Fr
         /FMpspEzYjPooc4XukX/tvN+cR4nJq0T+VAZZwWVeNRY4Z0qFQNqQDbygikm92w93Sai
         VF5Lmk9JrReZ0YjvH5EqdacBIAY05qekIlSy4yhKqwt9HeT59cMo/hWXYwMQ9x227D9s
         ZCbEDwQB5avFzKu8W7XHyEZj1ywf/wdryATdeeyE72rZOIstst2P69Mu5SmXTIRJmC5S
         akrOK8ErxPd0pGGojLUjc99kFVBnV/KtAMB/K1RdXzF5y2eZCT81bKHvkRbHIhRMVlO2
         ZF9Q==
X-Gm-Message-State: ANoB5plMgtHAWKgTokdRYnngv5JgG7NTCEdRbPqPCZ6CjzbZ9ZC7iwu4
	Cxc6Hcxb37NP4mTnSR8Q7N5GAID5Qno=
X-Google-Smtp-Source: AA0mqf7ZIJYJVpN9Gq35d0en5s45ZI4ct+Td9dnOk3S0HZs/TYdOGo2hM0I+qxopfKm8+SN+gjGm+Q==
X-Received: by 2002:a17:90a:d3c8:b0:213:c06e:348f with SMTP id d8-20020a17090ad3c800b00213c06e348fmr59349396pjw.5.1669624650379;
        Mon, 28 Nov 2022 00:37:30 -0800 (PST)
Received: from localhost.localdomain ([106.76.198.64])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b0017f48a9e2d6sm8121415pln.292.2022.11.28.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 00:37:30 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: akash.hadke@kpit.com,
	Ross Burton <ross.burton@arm.com>,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bhabu Bindu <bindu.bindu@kpit.com>
Subject: [OE-core][dunfell][PATCH] pixman: backport fix for CVE-2022-44638
Date: Mon, 28 Nov 2022 14:05:58 +0530
Message-Id: <20221128083558.9814-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 08:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173897

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: 1d2e131d9ba55626354264d454b2808e84751600)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 23df4760ebc153c484d467e51b414910c570a6f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37595eeddfb01110d8cdc628be76a8bf6bde483a)
Signed-off-by: Bhabu Bindu <bindu.bindu@kpit.com>
---
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 34 +++++++++++++++++++
 .../xorg-lib/pixman_0.38.4.bb                 |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
new file mode 100644
index 0000000000..d54ae16b33
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
@@ -0,0 +1,34 @@
+CVE: CVE-2022-44638
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by:Bhabu Bindu <bhabu.bindu@kpit.com>
+
+From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Wed, 2 Nov 2022 12:07:32 -0400
+Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
+
+Thanks to Maddie Stone and Google's Project Zero for discovering this
+issue, providing a proof-of-concept, and a great analysis.
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
+---
+ pixman/pixman-trap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
+index 91766fd..7560405 100644
+--- a/pixman/pixman-trap.c
++++ b/pixman/pixman-trap.c
+@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
+ 
+     if (f < Y_FRAC_FIRST (n))
+     {
+-	if (pixman_fixed_to_int (i) == 0x8000)
++	if (pixman_fixed_to_int (i) == 0xffff8000)
+ 	{
+ 	    f = 0; /* saturate */
+ 	}
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
index 22e19ba069..5873c19bab 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib"
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
            file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
+           file://CVE-2022-44638.patch \
            "
 SRC_URI[md5sum] = "267a7af290f93f643a1bc74490d9fdd1"
 SRC_URI[sha256sum] = "da66d6fd6e40aee70f7bd02e4f8f76fc3f006ec879d346bae6a723025cfbdde7"
-- 
2.17.1


