Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.11327.1607008190226666292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tskiaQEz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id f17so1569231pge.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/Dk2CxziHB2IfVSDcDspWr+VoEQgNcm2eaFE+KQLFs0=;
        b=tskiaQEzQSEJVP0YfkkI3PMoCtF+YzrF6tqDLzlZLik2RIVElA/zX+em3wW/fO7YJa
         2mxK015spbgdQkX5VG3ErpTXLVroZ8uuD70mmnSTZJD8j3pIi648gIUYBn0G7nvkShxI
         LVgHQk4F0AOzUR2bJsSUjOLlFgdmbridlj7/I9HrkaGFUEX1jGVNC2UvAcDtZviHYRoh
         AbEu/YntnfObKurHJmEoqQOHoaWIqEeYENGbdN3q0AF7USQg0/B1IOG3LhHOK/oibile
         I5xcpqyyBravoFtIKmlr6ZxwwFMBB0Rtn9O/0peo5hj1AY1J15P7HtExdIDeDvu2Rk9B
         1GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/Dk2CxziHB2IfVSDcDspWr+VoEQgNcm2eaFE+KQLFs0=;
        b=VmcqIVqHV1+s7Gtmlg8is5Dm9mo8nv+Ad45iPXKGEY5Xf/OKfLRf1mTnpqzAIdPgl8
         61tqVrA2SB/WgNR0KKFGFdxm7/PsQjQqlo+ajtdKdc4yKOb7RhWLFLNG9xRE1zuHJHBG
         kUxaVkzFtu4XquxppfaQgOqDPkAJAjd3qcTeb/G3mj8VGbRCzmDX22aFUfPR48Fn4gX6
         nhKB9FAyyTNEHDqHfuLEesbZq+dGKyR7lIctIISbLQ/akYBcj0ZTIG7IJ4O43zJwddOI
         wv1zY/QoZx4jKdwCGyysc9HHbo/ajRjT4XYkcjjkNqtt/rxiuOFGHgWnGha2cB/rneeI
         2RmA==
X-Gm-Message-State: AOAM531pEfFWyqdg7NUmu/X8HuyyOyz65ff39TyUQbcTkh16mdaJ1NS7
	c7QCZAsLMdahFqDFzlGPI5ube5bq/hX8W8hL
X-Google-Smtp-Source: ABdhPJzyM0OLVvwOqHhgvefud38UdZoeT4nK3tYOUvHj/nex4DiCyEv0zxo6y0BcgW5VG7iIfAsD6g==
X-Received: by 2002:a63:48f:: with SMTP id 137mr3395339pge.172.1607008189211;
        Thu, 03 Dec 2020 07:09:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/28] bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
Date: Thu,  3 Dec 2020 05:08:17 -1000
Message-Id: <40ec12e35c8184d984a17c3545ed5ea6e6e4af01.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

When ccache enabled as below:
INHERIT += "ccache"
CCACHE_DIR = "/path/build/ccache"

There comes do_install failure for some recipes randomly, take
linux-libc-headerswhen as example.
 $ cat /path/build/tmp/work/corei7-64-wrs-linux/linux-libc-headers/5.8-r0/pseudo/pseudo.log
 [snip]
 path mismatch [1 link]: ino 243004209 db '/path/build/ccache/6/stats' req '/path/build/ccache/7/stats.lock'.
 [snip]

Exclude ${CCACHE_DIR} from pseudo database to fix the potential
do_install failure.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b65e5280bf9e7f1f9c8e6acabab79bcf209e5342)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 922972967f..6615dee760 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.17.1

