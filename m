Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0E4C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.5733.1645406891801762167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AwWtVYAs;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id v4so13648970pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+2yZqy1fr8VRrMm5t1aaeg8fe6/bYZp2vjxWfBh45BE=;
        b=AwWtVYAsP2emjXsgLtuXxelGO4UEkQPOTY6uR2iLs24FFZdV+j1m6X0Hj5wh61SD5v
         CDSadAUzTKehKmSZ8YvhgWDsBNUzrrAR9xwzujQLXW/esK2/0/2HioZn+CrNs93cx0PY
         02vGAFK5hPdK+QpaGXsyRPx7deDKdVfURgKBrKx93w1jNLb1LC7DMpctQwF64Mk4knMl
         wCpvoXxy8rQTBVeOcgwneVlom2GNKeE+dDHLsm46Z2gLtz1+wVybpbvvpSBpj8Z/sOut
         FG9sxaIyuHJlFmOt5X27vXyAHnGRVrypi3KOBOM2rhoVkkKS4iQW4ixFRMA5xM8T/GYx
         XE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2yZqy1fr8VRrMm5t1aaeg8fe6/bYZp2vjxWfBh45BE=;
        b=63nvfxn6xW4NNLUAG5dXHVRnFc9rRAOSJa9M0oFzor7Qhtq/gDsx/fa+FHpsAaN2E3
         PU73JIG08VjwxQAjYLmb355dNW1dKWqMaaryK6PaTYMiDG7G2hFP9jwhOb6qWYCknm5k
         pOswSb6UN3KQ8AgT9nYcD0r2924E/9Vs10uq7/dicWHUCncIQXkA3v6RqCL7ZdeaAGaF
         zC0SAhOYaTatouIpoSLetmjJIpSwifVwKh5ds2o3zJlOndM3rB28w4wivcJJBMKFHiOW
         4c6NB1ogFXQIuTcz76vN098P3T6tV/bCad++1aWtko7QRz8FY0YsteIfRcYMvmey+yOp
         Zlcw==
X-Gm-Message-State: AOAM5336frZGWDi6gqZCnG3MMTu0NtRH2adBYRzy8EX2XLpxXCCIRSbv
	C2fdeAF/hagrmEAnlr1HTyiBwluvvzHXGg==
X-Google-Smtp-Source: 
 ABdhPJxUiGtvyttALjFt28umQ/3SKmk0LIebxvsmpeLrq0EJvRjaQ9jvqU9qnk0td3lyf3QBEFzX2w==
X-Received: by 2002:a17:90a:67c9:b0:1b9:51d5:6c13 with SMTP id
 g9-20020a17090a67c900b001b951d56c13mr23239906pjm.216.1645406890865;
        Sun, 20 Feb 2022 17:28:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/19] python3-pip: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:37 -0800
Message-Id: 
 <ee64a07da5ab258f185a333fb2423a5105c29f13.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162000

Upstream provides a pyproject.toml which declares setuptools.build_meta
as the backend for PEP-517 packaging.

We bootstrap the -native installation by simply unzipping the wheel to
PYTHON_SITEPACKAGES_DIR, so that all other recipes can use pip to
install wheels (as intended by upstream).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pip_22.0.3.bb              | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 889a6bf8adc..482a210ee99 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -4,17 +4,32 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030"
 
+inherit pypi setuptools_build_meta
+
 DEPENDS += "python3 python3-setuptools-native"
 
-inherit pypi setuptools3
+# To avoid a dependency loop; we bootstrap -native
+DEPENDS:remove:class-native = "python3-pip-native"
+DEPENDS:append:class-native = " unzip-native"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
+PYPA_WHEEL ?= "${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
+
+do_install:class-native() {
+    # Bootstrap to prevent dependency loop in python3-pip-native
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
+    bbfatal_log "Failed to unzip wheel: ${PYPA_WHEEL}. Check the logs."
+}
+
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-    rm ${D}/${bindir}/pip
+    if [ -f ${D}/${bindir}/pip ]; then
+        rm ${D}/${bindir}/pip
+    fi
 }
 
 RDEPENDS:${PN} = "\
-- 
2.30.2


