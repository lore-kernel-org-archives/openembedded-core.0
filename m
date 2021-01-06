Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8985.1609944662417901808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 06:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eXoY0FnJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id y23so2861834wmi.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 06:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYxGKmSjpVe9hNXxgN/H2vtOCsB8lT/VN3vvLWLGD80=;
        b=eXoY0FnJ8UdqxnunA0GMxgXUFj8SD8/G3nfci3U9ySYy5l0JOT9zE384BxyPePT7W+
         dowXdYwiTRxidjPH2A9GiAbJfNcl3H/SYvGMWNGxrpT/n1GyGMofoRDUkiIXNdD6JOv3
         J7M/SawtjZ6UIZ2ky1qQHyI3yELcuEDcswMzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYxGKmSjpVe9hNXxgN/H2vtOCsB8lT/VN3vvLWLGD80=;
        b=R8zX4SYxGn30KyHeu/S9rWYUD52PcqVm1ChwMRf+/FawqAiGGgxjackvFIHuDsQ6Pq
         QOlM3kemxNXlaqcrUx2BpN30sNgw3E/nhuq0Tz45zcy3xHr00cAj7HtpsZ5jslfM+mKM
         vE0i057DnEYj0ioAqmBCd2hQfdSFCYWI+m4Vzm/Wn74yGXR8mkaD8eaqo2wXffGOStEa
         /fynTiurZAlESo7/0CxBp27irXMvQ/4B/ebRKQxIlsI9u/cr9/RaNa3tYM7xfmlMgIvr
         N6/w2wIXfjv52KYi2bWDkIfXT8eRhQfFAv6TojYbMW7zzkYLx0+vOnelDl2QyAXnNmU1
         WM/Q==
X-Gm-Message-State: AOAM530s7ZkzbYRQxzERfyU0OmC+jgoAGV5hEJ3iw71dhSxis0/olMRH
	5YsdSAgtC9opmaJ/j7PPhirSNX1a3O9N9Q==
X-Google-Smtp-Source: ABdhPJxne/Ig7aSi5jPg5MA7WuzjbC8fFL3k2C4ccLj/hCFykIelPqzxmhOXf2bJaIf18PnuN6baeQ==
X-Received: by 2002:a1c:356:: with SMTP id 83mr4140391wmd.31.1609944660849;
        Wed, 06 Jan 2021 06:51:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f056:12a7:edca:60f8])
        by smtp.gmail.com with ESMTPSA id t188sm3218425wmf.9.2021.01.06.06.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 06:51:00 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: Add /run/ to PSEUDO_IGNORE_PATHS
Date: Wed,  6 Jan 2021 14:50:58 +0000
Message-Id: <20210106145059.550500-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Builds were failing on WSL2 which turns out to be due to accesses to
/run/ on those systems. Add this to PSEUDO_IGNORE_PATHS to fix
builds on WSL2.

[YOCTO #14175]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a04005b0f57..be94b78eb15 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.27.0

