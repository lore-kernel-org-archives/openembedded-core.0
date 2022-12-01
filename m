Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A6BC47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.46683.1669908337895714543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TnrwZvp8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso4368930pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kg3+v19znbO28+g/pFzy4If2kfBicC0jh1kPXmKgeE=;
        b=TnrwZvp8/wRSJh02x0Hv0b730apr3VE/kjEWvYJMMFAL+BrqJusB07jFePKxodifdt
         5tEReGZLoQRdRrp0BuduhNWnNCWLa6YzcBc+A600Ne6BiMTdbQyaYSLCMAEPgCv9dfih
         7kG56HPwvnXnXKuGmaoxfwNAHSNQC41Z0GVavepMWjVwNb7ub3/BPP5xL6hPt+7BvnZL
         tTOH8IPpM4EPw48sg/FkK+39iToqi1YmL6GIPqF0j0wrlACBpwy4ua0oTjmJCGYkx8pw
         LEly3rNvDTtz0E53RPZ++sREU7GIctotfkYua23aZoUCkYoWD6FmGXWKrviKQr00ObYk
         x9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kg3+v19znbO28+g/pFzy4If2kfBicC0jh1kPXmKgeE=;
        b=RAWdwIUc7r2j4eJkZvJkvZnXZv/Ff21SX/TN3GgGUEV2W9Xij6s3suhdxpn0mbq2Bq
         HJDhfNbV2ZgpnTQWQiO6WcqpS3TAqLSzMrYaPGma3Sm5DMihubJKn2Ax7KzKfZ9Cum25
         hKptER8vQyqx2Ej0PTpjDoZ2M1kesNwO8is1K0dYFiQTgARfTlFGR0/c11Rj6meIWzhg
         veB+enTGXucGSZLcWE8y7HeFIu2ewudgnXHubaiyU/MOIu5/YEwL6B7sYntlM2ntDUVU
         69w35uhJZS3qDxosWNZLopkvLJa05BMr8nEal/cp0G5oadWMyrHeJvnnuCWzE5HmnB9U
         NTUg==
X-Gm-Message-State: ANoB5pkkdsZrGUNhi0XcyDE0LeEEK7Zo0h2WW0wDkAKSBqsmRYfiHGo/
	vJ6DsMgT7ZalodBmORvl6AgRf5NL7NnR2vRIfC4=
X-Google-Smtp-Source: AA0mqf6PrDIcT22PUjpfkLORBNf2RGejSB77pe5PKCtENB5WoSn0Cd/XCkC4pRWQbOILlbewlfZjow==
X-Received: by 2002:a17:902:d349:b0:189:324:27cc with SMTP id l9-20020a170902d34900b00189032427ccmr47550477plk.70.1669908336672;
        Thu, 01 Dec 2022 07:25:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] pixman: backport fix for CVE-2022-44638
Date: Thu,  1 Dec 2022 05:25:15 -1000
Message-Id: <fe5a5009939f056ff4d9d3426832d0b67a668ed6.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174114

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: 1d2e131d9ba55626354264d454b2808e84751600)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 23df4760ebc153c484d467e51b414910c570a6f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37595eeddfb01110d8cdc628be76a8bf6bde483a)
Signed-off-by: Bhabu Bindu <bindu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


