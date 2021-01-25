Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.359.1611586375855790284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A7weQbvY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id p15so8550776pjv.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eamhaQH/ydmyUjTfply4BiaoO4rQaHNvUcvVL0ktRUg=;
        b=A7weQbvYtbnqmZQxjI7/7jvra5PQMl0NXz+1lEJWE3guRRGP0qyn04UCFIPcc2ZU6j
         WlFbASRjTOsPReuo62lA2ZoD1+Q+iovPrN8qw3FJeWPKC4pEUEOKY7m/eVFd94U4huWw
         uQnboHMPukNCct6RVYCVOrsVtf94HuZB26Asvi7l/gsoH8+q/9g27LQ/AOOJw1WI1YCN
         p0bX0qdG3gE1u4+jE6kb/LJukXSi9DUc8DLJu1/NN055fcRaKcitVjpgJ3Hts6DpM25X
         y/Las20MEgwJkPfQIsjAcBIkg7I8oFJD80Calk94PZNU6ALGxa0b4f9BzV631AXCf7wh
         7IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eamhaQH/ydmyUjTfply4BiaoO4rQaHNvUcvVL0ktRUg=;
        b=IDRSazabNHFAsHgA+G/8+143mTYhe+rOR8TLATOQ2/EgO3xtt7KT8T+dOQld9GZV5h
         J8rxW4VhuxSMB/E7Pctl7qqXVcCNbv3bYAXx7CWLowbJYKIgnFWgpPrt/Bv9Sc9BX83q
         Nz0/6dhWM2rmD7F05N5NfeG2scUz/nbWz/pMLO2I2XWhyF7ztEtPDbO2a6xxbHbpEYAP
         OtJQVb23jV4DmEHprgkHLk3cFNqh5Nm3NhUYNZaar+i1ryr875iNH245bH6VlKxCB9Qn
         Y6xczBylRZb67kvZGjbW7yWx9AVV4B9N/wMqbfThWDbPmcKlcHzhPTHWkZ20LPuLlm80
         WsMA==
X-Gm-Message-State: AOAM532t7r/cGB2ef5xW0IEdp48Il6A7opxGnhI86vcKKICqyN5Yqkns
	4RGBWgpAnZzwWnHFw/XK1cL3WC6Rv0/tgXEDr9Y=
X-Google-Smtp-Source: ABdhPJxjzM5kNNPosiZXOuSOBfVSRSWGtWTVv65AGrYxvTeho2Ldv45ShwtwRsb/khMdQoFNPjvZhA==
X-Received: by 2002:a17:90a:e006:: with SMTP id u6mr524481pjy.201.1611586375021;
        Mon, 25 Jan 2021 06:52:55 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/47] bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
Date: Mon, 25 Jan 2021 04:50:58 -1000
Message-Id: <7446b5c953bbecd08b3b88ba8622d7378f63c725.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

