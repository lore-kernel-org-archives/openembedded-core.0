Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4F6C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.4679.1645478651369056250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U1n4Lz0z;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id c3so4240195plh.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+2yZqy1fr8VRrMm5t1aaeg8fe6/bYZp2vjxWfBh45BE=;
        b=U1n4Lz0zuvmzcekccZIsFo0kPdQD9jcWrna+E5yX2Xm/Y90DebNchA4SB63RtAz/DV
         1T1R+ILcudPxH+lqBhQCZTcXfg+jIHgB81rDAjfi7jCmzfIy9XCqzA0I48bsS3hqx1M3
         dOHGQCFUIjSty2MdkOH0+5i7fTGyCeuZ2HylgxFNjiX8qXHkyj+8b+wHipnGyV4x5ZoW
         xUAM7n+5JFGlpYkYFnmxr8eGk6kgO5EdCrM5TTIkzm18OxZzBRSRi7cAbL07PTcRpFOy
         0nft5fZzBkFvAOe/OTETDMzlX+Ven3/EHRA9+h4VHXCyOE+JDU83wWY2nMnRiDBkOt+I
         l9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2yZqy1fr8VRrMm5t1aaeg8fe6/bYZp2vjxWfBh45BE=;
        b=Tfx2CEn9A5HZJ2FIeprg279s+8rQJJUWCc9itAM6chrPEFytvyNdWRw+fe7w/9rkzi
         KTuHXUKNewhPobTLbnt2AA5yqtGx3TqFPoC84mgRP8G0eJtNzBO9PkZfU30JClU9W4Kp
         wrlZTLORHAiLvn2qqXfd3QdNtsSOTV3WbVyyJjKOW3zaJ2vNKqjvXszhIIGsmm+ot4/S
         c70ZQHn8DtcXmczAW/cvBBoLln2vhN6w/FU6A9ZWkl21QUsI9PXUE2Q5g49AG9nwr/wH
         zpTYI2wws3HCzwNXyW0GUzcCuT8PZDUhhv+Fcp5cdT38m1CSvmc5pzIAVSx4oN5H603y
         JYUw==
X-Gm-Message-State: AOAM5330qSeq3TE+qsqfCEJngGdXL+chRVXFDXPo1X7+uRuN0k1gdCOz
	fR9W3ATx5DZBXoFx/m4PRprWJlOvZTZvEQ==
X-Google-Smtp-Source: 
 ABdhPJyOb+4gyCRBJl6NruzoYmzQU0xGjVvmd2M2Ib1XItz+JqOspGXwHn+PgjCZs4Fmuwfhjls+Cw==
X-Received: by 2002:a17:90a:1202:b0:1b9:b7e7:1652 with SMTP id
 f2-20020a17090a120200b001b9b7e71652mr825227pja.1.1645478650511;
        Mon, 21 Feb 2022 13:24:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 07/32] python3-pip: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:22 -0800
Message-Id: 
 <d83f4ea0a74e1ee46023eed04b71caadf50d1db5.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162083

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


