Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.2607.1602108591789571307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OnnCKjXx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 13so4096680wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mK+DMFnpn1rdayTSbCSx+17GiUGcy+K95Yv2LdWfViY=;
        b=OnnCKjXxwm2aXl5L3yG2BhEjLNQSXvfEGEnlMZvOkPUB6E3fV0zyBz1zqRERQ1msEU
         NStgiIqFxEZ/94RYMUndB8SXLni0bwZ9ZCQWxOeEkxu3hCf8D1c7BYzBHBbsvwqOrUfV
         As3XtLDjGw8SZ4G/cpFUeU1MLGH9EbsGYcflk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mK+DMFnpn1rdayTSbCSx+17GiUGcy+K95Yv2LdWfViY=;
        b=gEvYY7khRkUj9WHsG1ENdAZSzhpVGixGFo4g5Ri7Za5/mNL6Np4N192HYXytbXjtTv
         rSbq+3tfL7nLNRXKuyfHTkmx6MGh2KM2bNZBTvtoEd7hn9YMJhXRyruDmTAxxKlF1nl6
         Cwnk2XL4SVnoWNDOEgXFR9r4Hq/HNrz15k74Y/DsGjrg2JRAFgDWoWR6CBaCIKz3Z2vc
         CNNn8gHjOcwNrVkbVJpLmyvXb2oSB8HLnezu1/SH8JBg/uRWwiKhXPNwhAvJhzoyIMCT
         4OJNBBC85j9IdLPrsi94SPvSDJrD0i+Fv3k4bCRqBvNNnkDadteqffBWa4hG3LCktjsf
         C/+Q==
X-Gm-Message-State: AOAM533GdeO6T/SkqTnTj+FZCpXWx4mWg/EonwaucvWHfShxFKEtIAyB
	x6CkCN4P+R1NO+821bJIimwW72sVmrIsZw==
X-Google-Smtp-Source: ABdhPJyHVcLfjNX9WUQep0krWq29ZxCqty/k1v03qe2rJtR9aCaEvW3BvbQj77SowfdH46/waXQy2g==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr5656045wme.17.1602108590157;
        Wed, 07 Oct 2020 15:09:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id x21sm11579002wmi.3.2020.10.07.15.09.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 15:09:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
Date: Wed,  7 Oct 2020 23:09:49 +0100
Message-Id: <20201007220949.3195242-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unfortunately, .pyc files can be generated in meta/lib/oe which corrupt the pseudo
database so we need to extend the ignore list to cover this as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e0f46b09cf4..1b5cde2cbbd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

