Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.5693.1607516789461389671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 04:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WYXKTbws;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id g185so1464128wmf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 04:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jA9Pp2r+gk9s4dXbYsRWc8dr6X/Y1yNOScwsxA9UqG4=;
        b=WYXKTbwsOFwNVUekJk6UEYDquSY1xMHjvxPRUooJrdCX/ER3+wxK3Vu2TxrHDm7JuK
         NoKqjwcQAVUPsaAJfo2bHYJO7G70jz53higGprwBRbC0T04si9p6N+oAoo4nVvlwzgQI
         WBQJrc/aKy56UCiGfyGe9IAST/l/XE1kRnUaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jA9Pp2r+gk9s4dXbYsRWc8dr6X/Y1yNOScwsxA9UqG4=;
        b=r6O75eY/sIEK8++9waYAh4feeswKNuSmV3jg5agK1rgIR9rr9TTT7PHcUIwg1EwccN
         a6vGb7oQ8DsMxcjH7UH5sw+RRDok0+pEHJKKCla/2/VRA/+8FQoXcNMMeoTleFZ3XFtS
         rzANNpS15jCgl4rhxy196YIOQHyzR5asND/Gx4KJTFyaQ/i+WUntKvFufdpUZ5MqyBK0
         vpTVk3PLQS7XW9o85j14nWhVYEQdxY4exPVfHUV0LtK0ipX5Xy/aTjFeeOW6z7cL/3WS
         WYFlYpyjlznXOIhro50UKDj6o8FwfoO4aWFQqU3sKv1rXHQTO8l1gnnl8Hxe9Z44DZGi
         1igw==
X-Gm-Message-State: AOAM532Wynlf63nkwm+uGDERper7nLQ6qgUlORyFKRSZK8MIbjtV3/r5
	CAiizpDGs3lTzb8FssLqotgJ5GHOd6EFDg==
X-Google-Smtp-Source: ABdhPJwOrcnAXHP5gNvCi/JOSyTyEayQfcvCP2dMdkn8HMTtJFuXSQ9+es58LVHFFg1wNP7nNmeGjA==
X-Received: by 2002:a1c:309:: with SMTP id 9mr2504638wmd.80.1607516787671;
        Wed, 09 Dec 2020 04:26:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c0cc:57b6:514f:c89])
        by smtp.gmail.com with ESMTPSA id c9sm3401120wrn.65.2020.12.09.04.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 04:26:27 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] Revert "bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS"
Date: Wed,  9 Dec 2020 12:26:26 +0000
Message-Id: <20201209122626.3637550-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit cc30537bb4d0815c4d69f0b1a1a8a200085902d5.

There are issues with this change where the build directory may be included
within the paths included in BBLAYERS, which is particularly problematic
where people are using kas.

An alternative to this to handle the pyc file issue is being worked on but
revert this for now whilst that fix is developed.
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a353dc5d6b2..812cd051021 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

