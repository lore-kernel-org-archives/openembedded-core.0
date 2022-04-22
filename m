Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12387C352A7
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.4682.1650600359080245770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 21:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XR6ri/CM;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id l127so6837042pfl.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 21:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aLiBjDOEv8vg6tq6F9NmuSruz/R1djvz3tJlhjoo3Pg=;
        b=XR6ri/CMHXiwo/wKC+fGYNCljQH0Ogv21SEvQIk3Q/UuRmWFOtBgD0axe5GdHP1Rl3
         PXmd6GqEVlleazcHaLEIeSJfJ4z41ng5fu0O8YtDJ1z3WoU6OH2E3TxxfOiQLIuFtUPG
         VR44rcsD4O+x89fnUscugJtN32qix+eojokLcOGMfsQr+FbBB3iAvJACM7ugdA3vr8m0
         kDFboWnvyks/dMs9jNdnYVVJFwa8U4JbcsKdmuHS7piKG9gtr6UnmIApcWAaFGuGE1Pu
         r/AABv5edVIaRnPK7/3QXCuG4D9iTD0PpQHhTbXcBmdEkpNC/oh1onGJ9Vv1qhqVtpXL
         3jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aLiBjDOEv8vg6tq6F9NmuSruz/R1djvz3tJlhjoo3Pg=;
        b=xPSZG+P9rzH1S6XKBcERLZqfzA3Ey4GJQjSfFNqPDfoki8I2+P/MG1B5+I7NA9aYbT
         3QvbE5eFXP/BqaWG11qqBst7SLD4CEaxtKLoBr4jJvhh0PA90PieoT+SmZS4ATZEVsKh
         9L6yPXCDvpud+m75AnPwuH6nxmcCuYNpfjg/y34zO/KaWy8KnJ3GJE73Xer3Gn0aauAN
         6uoVha7jiRoR7peLeR+sLaUdj8HEHcctujAIJlWJjP9YGGKjlxqsU4sdUX4A06B4MfAj
         PvqOVBh0TFjWAbMLuUyssjTAJoefggz8g7EtQWWjAi58tXuD5RqIZKWflSpYrNVCGbgD
         pUGw==
X-Gm-Message-State: AOAM531XOPdtkt+2q4k6HQSmsv4hwCBAYSw7FSJrBjU6Hs89VGi3k08O
	2B21b2W/Svg7r+vqZEQY0bnvhyPFvNLuYQ==
X-Google-Smtp-Source: 
 ABdhPJyAEh1SC8RyVUujd+09Vl90CrsqH6PNcbejFVqRVo+fdsUh1PB0k1E98sMOOOunlCefcXdenA==
X-Received: by 2002:a65:5181:0:b0:3aa:3668:26a9 with SMTP id
 h1-20020a655181000000b003aa366826a9mr2350540pgq.184.1650600358185;
        Thu, 21 Apr 2022 21:05:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001cd4989febcsm4399089pjb.8.2022.04.21.21.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 21:05:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcompat: Fix build when usrmerge distro feature is
 enabled
Date: Thu, 21 Apr 2022 21:05:52 -0700
Message-Id: <20220422040552.2528282-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220422040552.2528282-1-raj.khem@gmail.com>
References: <20220422040552.2528282-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164772

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/gcompat_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 962bcd8c75f..b051e43b6ce 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -37,14 +37,14 @@ do_compile () {
 }
 
 do_install () {
-	oe_runmake install 'DESTDIR=${D}'
+	oe_runmake install 'DESTDIR=${D}${root_prefix}'
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-		install -d ${D}/lib64
-		ln -rs ${D}${GLIBC_LDSO} ${D}/lib64/`basename ${GLIBC_LDSO}`
+		install -d ${D}${nonarch_base_libdir}${SITEINFO_BITS}
+		ln -rs ${D}${GLIBC_LDSO} ${D}${nonarch_base_libdir}${SITEINFO_BITS}/`basename ${GLIBC_LDSO}`
 	fi
 }
 
-FILES:${PN} += "/lib64"
+FILES:${PN} += "${nonarch_base_libdir}${SITEINFO_BITS}"
 
 INSANE_SKIP:${PN} = "libdir"
 
-- 
2.36.0


