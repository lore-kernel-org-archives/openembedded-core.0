Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFECCC25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 02:52:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7427.1716519137711477939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 19:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RYh3zeEj;
 spf=pass (domain: konsulko.com, ip: 209.85.214.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f304533064so19479805ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 19:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1716519136; x=1717123936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQY3azn5yJ/85H+wJFzUWSWAF6jiAgGrIlGAVf4hYHQ=;
        b=RYh3zeEjD5XHHQ9PU2yTuVxd2aXE1bn8HpNdKxu1B+gIUHjw+4b3X2quHAVljy5qd2
         ASu2uZVHwCmxYXAAaBWMpMlGZlnpJo28D6pXX1LTo3iO56BmoW5xQVWQYOFxdgR2bOrt
         cu05V2giK7tXOFmT7opGj4bHAEyuEP56bA4lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716519136; x=1717123936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQY3azn5yJ/85H+wJFzUWSWAF6jiAgGrIlGAVf4hYHQ=;
        b=ECab8HHYQK7MtNcOIG5v3EnvTUY1yh/dx5hxc1FxL+cJVeHdV3VB8BRNWyfmDZZCMy
         iHFznxgiM9k0KQpEGhnBKR/b/n4dVJeLwR72zn0R2H86E/wf99NBVRVFjGN+wNJpD6+p
         VwlpJkigtfviR+jQu56aBJEKts1pgOpGqqb0VX08gotX8MydG28MHpQCaPtDhhx6xVGV
         IF4oeflA6+YByB15ongrBmWPKfoY41VUvuN7sQWujtWdC7/84K+xOcQaua7Ijt7h+21b
         lnLkljWYpPvhZtPDXA+sE2MyajTvqar413BI9CAXo1E5FKL4zR6bLgOe4RQdhkAAD8R4
         wC0Q==
X-Gm-Message-State: AOJu0YxHnXdgmz2NXmM3nCdqaizOrMVGtrnRn5+bYCJfcLfhTX9ghEns
	yDX72wywdzSGfeQsD0nwh7xies3MBkN+d+fV6n12CQurNkLAAQUgK9E3NSipodPWuNGffNLG9PO
	jPwU=
X-Google-Smtp-Source: AGHT+IEhQ4Q5MczUJ/K9qRBOV71yjg9yKyA6dkpvZ8bR5p6wlUwfg5Svhnm+AZxrHxrCN+dnnKKkeg==
X-Received: by 2002:a17:902:d4c5:b0:1f2:ff65:d2d8 with SMTP id d9443c01a7336-1f448205c0emr14663215ad.27.1716519136368;
        Thu, 23 May 2024 19:52:16 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:d675:a2eb:1b98:4f95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9903b5sm2910815ad.189.2024.05.23.19.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 19:52:15 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] pythonn3-rpds-py: enable ptest
Date: Thu, 23 May 2024 19:51:40 -0700
Message-ID: <20240524025137.1601126-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524025137.1601126-3-tim.orling@konsulko.com>
References: <20240524025137.1601126-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 02:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199824

From: Tim Orling <tim.orling@konsulko.com>

* Add RDEPENDS for ptest from tests/requirements.txt
* Tests take ~14 seconds, so add to PTEST_FAST

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 .../python/python3-rpds-py/run-ptest            |  3 +++
 .../python/python3-rpds-py_0.18.1.bb            | 17 ++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-rpds-py/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5975db25ccc..da6fa6ee972 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -69,6 +69,7 @@ PTESTS_FAST = "\
     python3-pyasn1 \
     python3-pytz \
     python3-pyyaml \
+    python3-rpds-py \
     python3-trove-classifiers \
     python3-wcwidth \
     python3-webcolors \
diff --git a/meta/recipes-devtools/python/python3-rpds-py/run-ptest b/meta/recipes-devtools/python/python3-rpds-py/run-ptest
new file mode 100644
index 00000000000..8d2017d39ce
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rpds-py/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
index c6e88d88d76..f46df1115c8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
@@ -4,12 +4,27 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
+SRC_URI += "file://run-ptest"
+
 SRC_URI[sha256sum] = "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
 
 require ${BPN}-crates.inc
 
-inherit pypi cargo-update-recipe-crates python_maturin
+inherit pypi cargo-update-recipe-crates python_maturin ptest
 
 PYPI_PACKAGE = "rpds_py"
 
+RDEPENDS:${PN}-ptest += " \
+    python3-iniconfig \
+    python3-packaging \
+    python3-pluggy \
+    python3-pytest \
+    python3-unittest-automake-output \
+    "
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.45.1


