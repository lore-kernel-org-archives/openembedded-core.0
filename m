Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D561C63703
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.21691.1650136510149266632
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lEEkEO0q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 125so11929999pgc.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ljdgFxOtRM5rrvMBrVS3wfqb0jc0dz3EZJNETiSBQmY=;
        b=lEEkEO0qunJdqY565nlsYe/lnMovOAoQxoqoJPyL7qG86UeZXjIQ6m3ICwHPtFl+sc
         RVsy12d2CC9Ppb4pMrNdyPR7waoCDIDUXLaCqEFen7YI2rKljTKkLD61Z9pbSkepnVVX
         RDz3liVMBHjSzHXxfBO6VbLldjQTFG0WxhyONJkSXC9vtX5BbGZSaTmtq/ERmISa0nOe
         JaUti4cHTwPp2udUYBHKVHMLkdUlAdRkZhtPghw6NWNa0Ot0f7r9oTpOJxMPN/35L/A+
         nwCaGcXy5S4825PqsYbUT+XVw/xcBm3mq1T12zHuulwPrsdHPPeqf+E+szBWQsylysJT
         fzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljdgFxOtRM5rrvMBrVS3wfqb0jc0dz3EZJNETiSBQmY=;
        b=na1fm9R4l/Uo0Rdg5bu2Jhub1M0RmCTD5y8lL+kNCdzm4ubEk9eJvRNK7L2duOFv9l
         GUZbqGd909R2M5ZEiYr7kw2hUEv886nzsyU2rSkPTZH59KXTF8y7x5toqfIWfSLwfxPW
         GThsk0XTKnO6GXSZ9bjj2wVk3FhB+Y6BYIKnkaV8eTGdnPWHiRde6EVLs15BDAIdhfmC
         GRffwazuZJj7HFWNoJ+6XeR/pMG+7Oyab9UYGhdH1IjPadHQ3gHNh7i65IfyUVPWMVzg
         +M1oVEUF1EY71oUzwcYhKGWAow2ED38BqjuQctpuH/I0SNbOOpGf6vEjK5jS+nUQp9MF
         Pauw==
X-Gm-Message-State: AOAM53385DODwg+q6pbtkZ8OFTb/8Iy5didYietUpnHPJO8ZZXhnvP1g
	rwRFX9zkG7hDl9HM6lHSZczezfx5hzySq6DdCu4=
X-Google-Smtp-Source: 
 ABdhPJwZJ4K90N7IID7WE+4ubww0DmidxQE6x9FbiYJQSpGnbopSYxbPRAYrnVOc0ahIKIJkyGPxJw==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr4701932pfh.60.1650136508945;
        Sat, 16 Apr 2022 12:15:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:15:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] apt: add -fno-strict-aliasing to CXXFLAGS to
 fix SHA256 bug
Date: Sat, 16 Apr 2022 09:14:27 -1000
Message-Id: 
 <b08ec0a0e0f160f9b67e2fabed03fb8fd174e0b5.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164555

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Recently we've begun seeing issues with apt SHA256 generation/checking on some
distros (fedora 35, alma 8). The version of apt in dunfell uses its own
SHA256 code, not a standard library.

Investigation reveals that the issue is related to -fstrict-aliasing enabled by
-O2 optimization, so turn it off with -fno-strict-aliasing

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index ba827848a7..251795eeca 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -37,5 +37,9 @@ do_configure_prepend() {
     rm -rf ${S}/buildlib/config.guess
 }
 
+# there are code generation issues with some compilers in the SHA256 implementation
+# turn off strict-aliasing to avoid these issues
+CXXFLAGS:append = " -fno-strict-aliasing"
+
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /nonexistent --shell /bin/false --user-group _apt"
-- 
2.25.1


