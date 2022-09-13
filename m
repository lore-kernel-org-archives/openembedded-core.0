Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E456C6FA90
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:30 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.5125.1663078703456983887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dVbhGvy4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id v4so11430653pgi.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=eu+F+Qk9VUvkhOUNJ/2OLpqYYlivFLy2nOatA512D7s=;
        b=dVbhGvy47UjwGluTpcdFhtVENPt2xuyG+KCVRN5gce+/JJnHr8r6JsvRfhbbU4ZHTN
         KA3c+Dc5arEvIIeLEM89q8WgbTcP4Oaj2ZzKg8oVtQbqp4p9iWqFT1hyi5tpsjQTj0xt
         y6UXvrg71iFASWNpx26LE1KwTuXeznSplrMhKNkv6+cby3phMpq32D7HtdYzB+z3PxU5
         scB/taCRORuXq5yVIN7qTZAhc/UzwZcOkswPG9D4QSzrzPNrOyxHsnX0L2brwrCUWbPn
         oaPplsfdE+sdK0JmLrYgvb1bep+qY9n+x40es6qD9AUC6Mlgo0f6qQQ07RzGV53o16vj
         iHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eu+F+Qk9VUvkhOUNJ/2OLpqYYlivFLy2nOatA512D7s=;
        b=ec+mcc5PGlmwvPf39Xqwln/XKLocLaQJnx577KyoqE0w0wLhfBf+zIXkmSOpuorhPf
         RkBRypuCuvdEfUti3koDJBZMK+hRGiB6DLrYgJPPrjVdH5JCzXmYCuBJzd6qC+es22pl
         iosnf4JAHx3ToXxW6p841qFTbgxpz1I7Isy1xYG14+khG/2yC/caWnMT9SDS5eBbru78
         cnAbxIsEs5JCdsrBKwGDOzEcFnDn45/jmmGXH4bsPyctI71HFir79nUub4Iq/8GqrF1d
         h2TWSI/BBbMWra6HI/IE7OiztbJGboL7u2Joup9cdXmIAdRQA8Sjz82Pmqtw7493t4RU
         3Rrg==
X-Gm-Message-State: ACgBeo2+HetZYVs//8RfQIuLdRM5E4ydTTbuAn1tiQSRH8cElb2fdHGy
	pilPxVmfXtl1b/chw54FYl3JnPoE+PEIERoq
X-Google-Smtp-Source: 
 AA6agR6yXgGlq5skVcA20nTVpYsgC/Fii2IDowBLtsAwprCAd4KdHfdNgEzjPoLM7jdF0pmTbv4dyQ==
X-Received: by 2002:a63:6909:0:b0:41c:9f4f:a63c with SMTP id
 e9-20020a636909000000b0041c9f4fa63cmr29178401pgc.76.1663078702379;
        Tue, 13 Sep 2022 07:18:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] gcc-multilib-config: Fix i686 toolchain
 relocation issues
Date: Tue, 13 Sep 2022 04:17:45 -1000
Message-Id: 
 <47f6d0da703a9d25fa7dd36793ba332ae8d7ee9e.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170583

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This code wasn't changing the linux.h on i686. Make the entry match that
for i586 which was correct.

This fixes problems where the wrong dynamic loader path was used by
nativesdk-gcc on i686 SDK targets by ensuring SYSTEMLIBS_DIR is replaced
by %r in the correct header files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d30eb681f41bf9e921f7f0d42747fff7a4be9229)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 26bfed9507..2dbbc23c94 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -154,7 +154,7 @@ python gcc_multilib_setup() {
     gcc_header_config_files = {
         'x86_64'    : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
         'i586'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
-        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux64.h'],
+        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'mips64'    : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
-- 
2.25.1


