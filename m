Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D720C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.5144.1679003141642798362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FkJDyWMr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id d13so3088710pjh.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yui+zA39xyg61Yo1h7pkEKWqZ19kVosKBsvHkZ+S+wI=;
        b=FkJDyWMrLOUc1I6luoaAUtWOgQRqTbzGluRyIMHpWp+Ecg6c3uUJBAiDO43UVAXMlv
         ZFuai2RxQPB0x+EN6cN9SVzAL/m6YiibPYFURlF0PJpaB+cy4HiXYibAisj1vkMHKcR1
         er7+UjKLov3b7a4SIlMZ6UE1RenrMQ96bLY2qlkKMGCD+pmtxNKe5x5KwG51FMNh0dft
         8/jNEzCjNGQTEWkayoI7QeC5HoUZq5+mSoTvraTs9pDkSx+mn7A1AQgbV513ghCxW4GY
         08kAA8cheArEqcjw/JTD5nXvQgLJAlewWQhr4W3NAEBuP9/pyxWtRciA+kYk3nRHrtCG
         hLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yui+zA39xyg61Yo1h7pkEKWqZ19kVosKBsvHkZ+S+wI=;
        b=sHygcg18b39WwjJBKdDkIy3EYGA0/4SZKYI2kW8ZXBoPYAhrsL6X0BaUte7tTNDQVA
         OheJI5CB6gDvj/N2croAzx3FT/WuEOpc1H2z8S8nuSD8ttvyQHBCkVWA0fBpPEt2NWkF
         2B9uM04uFCNz1V4HrdWwfF3/Riekg0MxAW3PoJWMon5b29AmurEyTHAP1RK/Ob3FRRp5
         YsnsBBQUOrtfgvXXXR9/UNmbxsU5TIEZvn5oEWzDuIZc04IpH4gjCzTimBhLpAtC+Aq4
         PBLdpGE19jpdm+hg6IZJ7vowsumG+AKV02NKCPvCvN9CpcV9OKk2C8Mz+Gql0roDj6z9
         +lIQ==
X-Gm-Message-State: AO0yUKWGxzyGKV7N1LVu3Y7Q1EGZtb539uxqCVy19xC1g+4TVKC4hBqE
	SV8LzsYd/NP4zHoVjfaexlJG5wKhxS6353kIfJE=
X-Google-Smtp-Source: AK7set8o0sgInKeDYWvOwO3K5UtzRHhzndJQouft4WJ8rCvKcTxRzg/v3a75J+K1KG6pTI0obiJIvw==
X-Received: by 2002:a05:6a20:1445:b0:cd:c79:50e8 with SMTP id a5-20020a056a20144500b000cd0c7950e8mr6590549pzi.62.1679003140806;
        Thu, 16 Mar 2023 14:45:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/23] vim: set modified-by to the recipe MAINTAINER
Date: Thu, 16 Mar 2023 11:45:04 -1000
Message-Id: <9f328a42a289dd7d77bd6f08605b0ccb813b2056.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178718

From: Ross Burton <ross.burton@arm.com>

Clause II.3 of the Vim license states that any distribution of Vim that
has been extended or modified must _at least_ indicate in the :version
output that this is the case.

Handily, Vim has a --with-modified-by argument to add a line in that
text, so use MAINTAINER.  This is the distribution maintainer contact,
by default it is OE-Core Developers
<openembedded-core@lists.openembedded.org>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit acc007e23445aa53182e13902dd9509c39dd5645)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 40ad44486d..42a2ba46b8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -81,6 +81,7 @@ EXTRA_OECONF = " \
     --disable-netbeans \
     --disable-desktop-database-update \
     --with-tlib=ncurses \
+    --with-modified-by='${MAINTAINER}' \
     ac_cv_small_wchar_t=no \
     ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
-- 
2.34.1


