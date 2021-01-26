Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.13176.1611672202415814850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yHbs4qFq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id b21so4730462pgk.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x2Fz/ZsbxY80eJvi/+zbHLDPYC0fOLewfZaNrj+L89A=;
        b=yHbs4qFqVkOBcRYGV+6RSRlZoCPpYR7WaeFsCSoJF7gzAzWUD1k5vdWF03yuVEcXdA
         qiHyWTviCECi2mcNUl7+gu8G4gq2himdFYcwMEvKwHz/Z8buvPek1aSHkizkba7KGHH4
         pdrzUJeZuEk5fmLU/KPQLjd3yYHmXaF49Y3qco3l+ilD/25nH/N+pVukyQaDSW4lVQvD
         1dkPGuBzb6LnmoMC2r3uuDNiQasik7SSmpNSC/+OTVoV6ST09pFMwCLSz78CnEKQDo6d
         ojdfvYqKAXLbuZeBkAeY3GBZWEpucJaJfj1jE1Z78OM+tezRavKTTikLmdz6PdS9Ik2N
         h3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x2Fz/ZsbxY80eJvi/+zbHLDPYC0fOLewfZaNrj+L89A=;
        b=lIVrSZfG6WndqJvOBzPsIttEsRDIxLvXO1Qik53dumr36pOg7JcIbXKiSfza5m7AwZ
         2J0i4SdT+SJsXX8QGiq5ThJDZBJRANtWVs6D3WEo3e6K1672evVh23/Ok9x9mPmqYZLv
         gPTlXi5tcq4Fr44k1K0ljb/7j0OOFpcLLJ04rtF6rUUMG+ywMUrzVl/XFkA4dZJ4CnLd
         OOgTFS/K5slcJRkSXmpu7lEqRr/WUjLzxQpv0dMzZlL869uLl5FjYnao2DfOfDjmH+JX
         VYW21oJxl9Dx+jwl5EOex67GsdK07jXNl9hArEwe8OBGAQNOW796VUcioMof0C3JfRNA
         eSQA==
X-Gm-Message-State: AOAM530kGn5glqCdTifZ9ERPXRP9DcfTZ4SIdr4Nqcs2U89AhVI/M/1l
	2kAHj+xLXdZH56pFZ67+noDKTFiUyRPa78cm310=
X-Google-Smtp-Source: ABdhPJyjswL8/T68UhyEZIzRDRoFAxyY7MfpvsWl80rlf9umQvCUGnKSt0K32/5aGZgzx6vk6x8ZWA==
X-Received: by 2002:a63:6686:: with SMTP id a128mr5858375pgc.109.1611672201499;
        Tue, 26 Jan 2021 06:43:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 25/46] bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
Date: Tue, 26 Jan 2021 04:41:36 -1000
Message-Id: <c7962179c621f090a1bea7292d3f3d3fff2ecab3.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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
index a2fb9e2c6f..38ee6aa277 100644
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

