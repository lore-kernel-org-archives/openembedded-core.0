Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A63C433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 12:39:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.20232.1652013573001101393
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cI8q4JM7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id t6so15994378wra.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lQqIpDDpiJyCZEwSGsHTcNk7k3kuSiuWg+H9jVlljNA=;
        b=cI8q4JM7j7jw2RZjnqgjSZpk3mvlWk+n0bGVNDvohIiy4CsyTOrEvoNufybaBIz7Nr
         BYxckdBc1T0pm2xoVIAKLTAih6sy3FvfLyU7TE/tSt1jNjuuphcml59eS8Q3NfeJKJIU
         qtN2sBJSn6sZqQy85Rn805ogkkR6sB60PBbMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQqIpDDpiJyCZEwSGsHTcNk7k3kuSiuWg+H9jVlljNA=;
        b=t/sAUIGZmHs65MjE+hhCJxaZFGI4i3CbqfCYyy9rX6neI0Et6Yd+3KeN2IxphiFXjS
         oQBjRfbOaIL3dgJewmsXfLjwXCeL9ZFShpC+S7YYjfGtUYIlhwQa9nAc3zLpJepseS/f
         sQGZUOL1fpMkH7cUk8+uTNFIfInKKbTysgRtYM7lv2AsL9vol/sV/sv1xYOyMhS8FFLa
         Zj66sh5PJGwEwGVgGpcDkALDoYZjswBGw/jlfSwQoU1O40w9ORQGDJGFlJrjOIS4cJ0Z
         9H6QdVr16xDlDKk5XG5178/iy9RO3mGvLrqMIOEsYXAQfhgLAZqX40d9/SFDCT4oFCY2
         bNZA==
X-Gm-Message-State: AOAM5336KYgX2V5un27VLcmyPpaDiU39RphysPj9Deqg69z36UYRH+Sv
	3Sfc/vv60WGZmGhhxXb1yO3+i3WifCXDDiwk
X-Google-Smtp-Source: 
 ABdhPJy2T95W0wdhPrVenMDyEMpDdQi9HtQ5dH2k6ME+H+qBm1gnFGitPynj5+01vL/8izyZPQZOwg==
X-Received: by 2002:a5d:6a0f:0:b0:20a:ea3b:8d66 with SMTP id
 m15-20020a5d6a0f000000b0020aea3b8d66mr9492306wru.596.1652013571017;
        Sun, 08 May 2022 05:39:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7637:badc:40a6:4c9c])
        by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b0020ac8c19ecfsm8048472wrb.3.2022.05.08.05.39.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 05:39:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libgcrypt: Fix reproducibility issues in ptest
Date: Sun,  8 May 2022 13:39:29 +0100
Message-Id: <20220508123929.159466-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220508123929.159466-1-richard.purdie@linuxfoundation.org>
References: <20220508123929.159466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 12:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165373

The recent ptest addition was causing reproducibility tests to fail.
Remove the problematic files as they clearly aren't needed on target
to run the ptests. Hack the Makefile so that it doesn't try to rerun
configure and similar.

Also add a missing dependency on make.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
index f9dc52393f52..f7108013d349 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     "
 
 DEPENDS = "libgpg-error"
-RDEPENDS:${PN}-ptest = "bash"
+RDEPENDS:${PN}-ptest = "bash make"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
@@ -60,6 +60,12 @@ do_install_ptest() {
     cp -r --preserve=mode,links -v ${B} ${D}${PTEST_PATH}
     rm ${D}${PTEST_PATH}/build/cipher/gost-s-box
     rm ${D}${PTEST_PATH}/build/doc/yat2m
+    rm ${D}${PTEST_PATH}/build/libtool
+    rm ${D}${PTEST_PATH}/build/config.status
+    rm ${D}${PTEST_PATH}/build/config.log
+    rm ${D}${PTEST_PATH}/build/src/mpicalc
+    rm ${D}${PTEST_PATH}/${BP}/autom4te* -rf
+    sed -i -e 's/Makefile:.*/Makefile-disabled:/' ${D}${PTEST_PATH}/build/Makefile
     find ${D}/${PTEST_PATH}/build -name "*.cmake" -or -name "Makefile" \
     | xargs sed -e "s|${WORKDIR}|${PTEST_PATH}|g" -e "s|${WORKDIR}/recipe-sysroot-native||g" -i
 }
-- 
2.34.1


