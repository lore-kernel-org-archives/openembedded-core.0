Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5629C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.3685.1668003654396130306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Vj8qtfz0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id b185so16815584pfb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PROXUBjmZHKgc2EoPWe4t872joOd+egODbKhkayjizU=;
        b=Vj8qtfz0rgh5ugdE1ppcjtVuzw/OZQMCoyGx4SyCLDYvIYK2C28B3hgCsQxloM4Dox
         bqEIGXQjqnLz6JJZovpXoks1VtrluH3eOBOmXkxcnOBsP5WAL7xI7DbkkE67416YIji5
         2PAFtbK7Ioj3qJJ09Xw6ELcBMD/gHul3sGMTWtsUrEGudhBpKSuBqUXIxURyexwH99Sm
         RTW2F9OQK4k4ZpOO769FHDT3qKD+6Xd8ZtVJ4yM+ZWNeBEjmHxvLCu7/67gSkqfs7Tw8
         v+r/+RcrVnQM5WaBMwJYootizI0e54ruWBCSKUXLVVAdQHtmySG5AEgFPPGx9kOc8HOG
         Ng/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PROXUBjmZHKgc2EoPWe4t872joOd+egODbKhkayjizU=;
        b=6NdtBXAU+oMPXt1u/QmyqoQKfbliaXRw+FFLtSqJp+KseiN7r4owwZAeso66Wki6CI
         MsIz5FBwSLNOdiQ0/Ln4iefT1eVzBFxakUQlfdd4ZDdYrjzqGjb7IMIkPn24icUnkzXQ
         ORFae2400Wyfsf8PJruZuPkrMTRnK41F2Xchnf6qaa+uBSwSx7EVxOHUG+4o2zFsQDXO
         vbHYWu0KN2o+GHpP3zT4ITSzOvijyqQqPWmg4iUt19ohnjixUCpqrLLFgfassWCWmO/T
         GS6PpED6Kn55tTur3eYkCpc2U7GqgWAKhN0B76t0N6FVIbWN+ckoFmM06IOX92WWGWU/
         jE+w==
X-Gm-Message-State: ACrzQf1OblHDesBjUdEEddohTq+53gVBXnwHDTrQouEnyjYu3q0cM560
	++KLXcab/3JUZVDE4XR5FWHvaaz4ur/hoMBX
X-Google-Smtp-Source: AMsMyM59SoxBg4QKeOc+ZA/z2pJPMHuF4vh4UEU11pwodoPuz8gYAm/CF6S29iXDwexmdtWU6rFp+A==
X-Received: by 2002:a65:6404:0:b0:46f:a711:c481 with SMTP id a4-20020a656404000000b0046fa711c481mr46862876pgv.262.1668003653331;
        Wed, 09 Nov 2022 06:20:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.20.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:20:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/10] pixman: backport fix for CVE-2022-44638
Date: Wed,  9 Nov 2022 04:20:32 -1000
Message-Id: <23df4760ebc153c484d467e51b414910c570a6f8.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173021

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 33 +++++++++++++++++++
 .../xorg-lib/pixman_0.40.0.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
new file mode 100644
index 0000000000..d226766d49
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-44638
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
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
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index ccfe277746..c56733eefd 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+           file://CVE-2022-44638.patch \
            "
 SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
 SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
-- 
2.25.1


