Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C21C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.4686.1645478648029656637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ms50AvW+;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id q1so5325992plx.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f+yrujXchKBXDLif9amZDN1bP9shS+koOeijetu2aTE=;
        b=Ms50AvW+q7nVGxyXUB/KenOmkkFWK9Q+t9B1IotLCNI2XB0iFp8hRfndSWNWPN0r85
         LPtBCXJDDZpCsP+dVFdmf8pytTmYh2/rGZz6CkyASA+RHpDAaJb4McHglibMxS16xzOs
         +9UYy9aDccxy+n2jpdL6FqSRVST91T52Zx2eG4o5DrzcYybCmYoS+/agGYqi3oV4QdLJ
         4sWlN6iAUTeLR/Q9xy8+DMZYiY4pZxPGP9ChUVyR2qTkbGygzjmdkpCW36d7kAJSzfmR
         ivlPor57Xak5Td+Awp13D4ZQ+WNIwf0EjELx1NSUVxdpFlOiUOm0BmOfrWiUTT2zdPMk
         y8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+yrujXchKBXDLif9amZDN1bP9shS+koOeijetu2aTE=;
        b=t+lgKMuAoax9rBivu3hPg9sP+FXNoVKCk6yiJTnEPBkZAN48m5fYAy8961nG0HZJFs
         FGWuR0fy/THSfWOCkGoIO8gJA+pT4tENvGikjQduHKnmYk36kXoGzD5iu4Qs9oIIWNwU
         Q9yngAzwhKf4YL98NWVKASVk5uF8ygefkvehUkE2yz759DpykfZVfVQSdBgFKldh+w8B
         hkAT/78mrCaSqUZivBofcnaQ1L4fvKTwDdwhTvcmLDTyw+HlNcp7kInncLCYafjKKAZS
         /IqJFkp+bf75bl4eBS2tfQRxNh2LzzmzTMOGv7p2RFeUhFq0QoAH0KnKHQW31bvbGF4N
         TUHw==
X-Gm-Message-State: AOAM532td9Z1ULhHPeiMjAQysCwIPisUzzrncelCYsGwHDo2PxhNewtC
	B5yg2Gw+AvY37BNZ4D3E0MM5kQKX6NiUcg==
X-Google-Smtp-Source: 
 ABdhPJwTAcYGrHA9YI4E05j713PfhMuoWVi3g48VZF/QIQZka2ms2gdrFN7cEpzOEWfHMuMAcpWi+A==
X-Received: by 2002:a17:90b:3907:b0:1b8:c6d2:5376 with SMTP id
 ob7-20020a17090b390700b001b8c6d25376mr811485pjb.29.1645478646987;
        Mon, 21 Feb 2022 13:24:06 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 05/32] pip_install_wheel.bbclass: add helper class
Date: Mon, 21 Feb 2022 13:23:20 -0800
Message-Id: 
 <90dfa42cc21c4beec1e02d8efb1855bf4ee96c60.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162081

Provide a helper class to use pip to install wheels built by either
bdist_wheel or a PEP-517 backend.

Set pip install arguments via PIP_INSTALL_ARGS, which can be overriden
by recipes.

Pass --root and --prefix to ensure that pip installs things into the
proper place in sysroot.

By passing --no-deps and --no-index we avoid finicky dependency
checking (pip expects wheels in its cache) and avoid trying to fetch
wheels from pypi.org. This is basically the same behavior we have now,
the dependencies should be declared in the recipe.

pip install changes the python interpreter in scripts installed in
${bindir}, e.g. to #!/usr/bin/nativepython3, correct the behavior after
install to #!/usr/bin/env python3.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/pip_install_wheel.bbclass | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/classes/pip_install_wheel.bbclass

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
new file mode 100644
index 00000000000..c7b62c59ea8
--- /dev/null
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -0,0 +1,37 @@
+DEPENDS:append = " python3-pip-native"
+
+PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
+PIP_INSTALL_DIST_PATH ?= "${B}/dist"
+PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
+
+PIP_INSTALL_ARGS ?= "\
+    -vvvv \
+    --no-deps \
+    --no-index \
+    --root=${D} \
+    --prefix=${prefix} \
+"
+
+pip_install_wheel_do_install:prepend () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+}
+
+export PYPA_WHEEL
+
+PIP_INSTALL_PYTHON = "python3"
+PIP_INSTALL_PYTHON:class-native = "nativepython3"
+
+pip_install_wheel_do_install () {
+    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
+    bbfatal_log "Failed to pip install wheel. Check the logs."
+
+    for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+        if [ -f "$i" ]; then
+            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
+            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
+            sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
+        fi
+    done
+}
+
+EXPORT_FUNCTIONS do_install
-- 
2.30.2


