Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92745C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.11928.1651248101884084408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RV8Z+q9i;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so7713563pjf.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cdjWXUU/7qrwH6H1DV2+sJtUyWjJUKnaLuAPXTD9mKM=;
        b=RV8Z+q9i1FQzIcQMuR6H0IOjyQtP+9sHUEg88J9Se8iBRU69WnwKnZ4THnVeE68mC9
         kFsh1NwGBxI0fRRGaV6JP9htb7km6ULWRu5+gmWBwXWZowzkE8+BeazoGf3xNHqEm4bX
         hlF95y+We19zgBOUHO35q3Y85rtMRhkOjNAxIuubtwsxQ2mR3sIaRiZGO3ncZyZA99hy
         XnSoFYF7vgeoVE9B0njOahp4f/Jk4wyB1R3MhgdrfAFLrZn1MaSus5otcY1gwsH31dTI
         aVEXY09CgC6wwh3ASzYBK6zXvm7dW3cI8Ryxmiym4vRTL+6+1KwmOqxbvcXOmkgcBv9U
         lPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdjWXUU/7qrwH6H1DV2+sJtUyWjJUKnaLuAPXTD9mKM=;
        b=ToREY9Y2O19rGrx0F3iRxW785rUcsMWq0LWj9WuSWdEsobuOm/P3Z/iUmaMpVJ1csf
         04YOOVE2IQwNndc+H98lRkDvsFWDRNKuWlpGZmS45SwEpc/CiDISTGBe3pgM4wUaIBV5
         5JFfw1ZpDgm6jOJZ0xbbG5t5z3z5v0gsP+YbZmoIbklyKQ57/J8SrAAE2VBY/3eTWohX
         Kv+6L55oJM7Y9TuA+9xNlISJANcANawsCHItbtWgz/rdEvbvKu25Tvk0Qssx3uWJwxJs
         PXNwiBSMlJ4Wv/jesIicm4iXRPX3GEoKt21Qwa83WHJEmrmvNkVyqCEvnXOeD3CXmb1y
         18Cw==
X-Gm-Message-State: AOAM533qi+hMxG+7+m/j62D6bF/1Aq5mZ0Ry4DHLuZJwL1MmRcDZna98
	LMlxj7zpjT6F9akJrG8lZj3p83SFEvvjhOPYhmA=
X-Google-Smtp-Source: 
 ABdhPJxG2Nl1lfi4RhTktsMil9hlHsoXhOggN3Iolxwrvec6L7HbTPq7rApl8wE+BHWJDfexBH7n1w==
X-Received: by 2002:a17:90b:1e47:b0:1da:31f9:e5d1 with SMTP id
 pi7-20020a17090b1e4700b001da31f9e5d1mr4734938pjb.226.1651248100753;
        Fri, 29 Apr 2022 09:01:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/34] seatd: Disable overflow warning as error
 on ppc64/musl
Date: Fri, 29 Apr 2022 06:00:27 -1000
Message-Id: 
 <d97c8462b364946ac3172fc09a2398e8246a20b2.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165026

From: Khem Raj <raj.khem@gmail.com>

Disabling the warning is easier fix then trying to fix it
in musl which results in ABI breakage and disabling the Werror
gets us along by doing minimal change, also see [1]

[1] https://todo.sr.ht/~kennylevinsen/seatd/10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 381cf11b994d2bf40ac8781e18b5eac17b3b6cb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/seatd/seatd_0.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/seatd/seatd_0.6.4.bb b/meta/recipes-core/seatd/seatd_0.6.4.bb
index a38f8c2152..601736adef 100644
--- a/meta/recipes-core/seatd/seatd_0.6.4.bb
+++ b/meta/recipes-core/seatd/seatd_0.6.4.bb
@@ -13,6 +13,9 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
 
+# https://www.openwall.com/lists/musl/2020/01/20/3
+CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"
+
 PACKAGECONFIG ?= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	libseat-builtin \
-- 
2.25.1


