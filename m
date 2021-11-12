Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D9BC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 21:03:52 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.1859.1636751031550871421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RauUSrSK;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 200so9076659pga.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lDU2oKDqOUBqEU4zWwQXvnDj9Joj/6xY68LFREnYZQQ=;
        b=RauUSrSKsIRqYBIVda1T5gyaqvkU42eucY8ikS+uEn6R0Ns8sZypKdICtK6keXsSiG
         rBGegAQcUlITiPs2zk4u/dXLmvCFQ1yzw8tjjhpP+iVCvEgJkZyfNdt7/+LBFOYECsHK
         aHqd7iPfhsbm4E2SzBdx7KXVas6vDcns8Xs/jzgtzw1FXmoGQhruWlIZfUUkUVbXBpvv
         uxuGwMhm7JGnQUAWubTJHWI0PD6A/EJ9EZVnaVbpwEtpOHuCv/sd9IkHNyOiORkPP9bo
         gzOzjNiIXUMVIAgYWm4Om1H1CdSW2a+/cNk9quVrTwhU6POBhIEpY7ULJV0CJWfdFeYC
         Bniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lDU2oKDqOUBqEU4zWwQXvnDj9Joj/6xY68LFREnYZQQ=;
        b=Xvlzl+Qe2tAfS+W5DB9o3lZjBs2A9eS8GiTPN/6Oeu54aGKm7p8a2wRvDXXCcJFCEN
         Lymp90FRkpKCw91RA1f091RnJgUTbiyVMbhX4JPz0QLhPQp3eZAFAbFLsKddKtAsCu1I
         CBhb2j83TVSJ0UZYeNBOOkDctQLuP2cj48b+rF81Yu4JgCqKL4B8JU1vpIesAlcERIiq
         AVCo05ygpIV5ov+pkQnJpY4T5k8JLvr/+i1XK2oqVxexnq2ICyjXPscQ8lwQVF+TMaZi
         I4ijsUXh51JK17Hjqajsq0leI3MSIs3gqd7mhGRipkPD0J5peRK8APQAgnZipklZJgGi
         pLUA==
X-Gm-Message-State: AOAM530F92fDPw2+cXmkR/USWiuXSfWrIBQx0sZRIzob7Vp5NvYDuio8
	r2R7+f3BDVS74HND6x3Evsdzh67zD8E=
X-Google-Smtp-Source: 
 ABdhPJwPqQnHN7UTzjuz96oQvB2OrRMbOru+QC/DXyLsTpdKJ/an0azDFsPeqsAH5oDx9XCzCwsvIA==
X-Received: by 2002:a05:6a00:1348:b0:481:179c:ce9b with SMTP id
 k8-20020a056a00134800b00481179cce9bmr16311910pfu.27.1636751030884;
        Fri, 12 Nov 2021 13:03:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 w24sm5705310pgi.81.2021.11.12.13.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 13:03:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] python3-pygobject: Do not add -Dintrospection
Date: Fri, 12 Nov 2021 13:03:46 -0800
Message-Id: <20211112210347.2004455-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112210347.2004455-1-raj.khem@gmail.com>
References: <20211112210347.2004455-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 21:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158234

meson 0.60 turns unknown options into them hard errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.42.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 461ddcfe319..b07969c5efb 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -6,6 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
+GIR_MESON_OPTION = ""
+
 inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
@@ -18,8 +20,6 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
 
-UNKNOWN_CONFIGURE_WHITELIST = "introspection"
-
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
-- 
2.33.1


