Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD33C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:38 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.4102.1637788477452235626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QDUe6bh1;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id i13so2665312qvm.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+HEhp7sorDpjVKaB10E672BMQl8EJ+TusId+bh/83Gg=;
        b=QDUe6bh1LHau3QN3+Uw6KSo0cIR0G9d5iAIA+vTLOkWcY+rsNnApdKXwGzf1unsR3I
         nZxBJYo4YqXcllZ4uH5rkB8PNUecCm4NMaO77nz4z2B6x7BnkzZ+yCocjgPoNywSjfZi
         u32/Tgla6UBMWy0ryxK5pN+zJxBn4h+fsnUAbXoRHOdlzIEenA7el8bilx8Of2K3fwKj
         zW3lf7DdSUCZ0mtRwkI38QJ6ePIBHPVrGXvilM8HfSQFVSGiFiNLOHLXunZCpz6Zpxhs
         b/aDQCqOcXJWlcDTMt/ZAqA4figSm0rVOMZRr1jdCnLBEhvzBMBSMhwEqGPheip77gmB
         WOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HEhp7sorDpjVKaB10E672BMQl8EJ+TusId+bh/83Gg=;
        b=qlLCOsiX2+mdo39OMcv1HXbUEsukrbfs6B/xj/IFWhLcUWjoznAaZBuX+HermHVgbN
         w3opEiqTzhWcw9aiO5P/iFNsH4ITEXeBfUeyRoGqzTyrLY3FjxLOdy25FYleiLQ5x0nS
         af6+CSf+geX2WoARC6GnDMLtz9/wtLIlH/+22DSgifOYpMw/2ragYuncsk/Bm6ZwwF1q
         8ZXszqnArx42+OA2TTzC8jAI5ePoEaq6YLxOAqMtS7InDYb/LEL0u9F6tvLN1xhd1N15
         UZGDPcJkt9UMEp/b5nJ9dkgJuLeHwc0gSH2SX8UPZZvlw+SavHVSt5I/0FL5jigsVRzG
         hZiw==
X-Gm-Message-State: AOAM533Pc4amEAddG6LivEGnHcluMScvSUA96EZkkA57JFXEpgEijFcF
	r5nMkH2PPaxFs9n3/kCo5g9xYzazmZqkTg==
X-Google-Smtp-Source: 
 ABdhPJyygXfBpxQho+iwPGQW9kaFBxeg/MjgmSNb4+ZcV1tvYppYFb5A4RFZPl14AcClUak2/6Lf5A==
X-Received: by 2002:a0c:bed0:: with SMTP id f16mr11134906qvj.57.1637788476516;
        Wed, 24 Nov 2021 13:14:36 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 08/20] python: import rfc3986-validator from meta-python
Date: Wed, 24 Nov 2021 16:14:14 -0500
Message-Id: 
 <ff3629debd537edc2c98753c9771ae30fbbf5625.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158754

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing rfc3986-validator, which is a dependency of
python3-jsonschema. These packges are required to support
the validation of kernel device trees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++++++++
 .../python/python3-rfc3986-validator_0.1.1.bb | 23 +++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 create mode 100644 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb

diff --git a/meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
new file mode 100644
index 0000000000..8a646874e8
--- /dev/null
+++ b/meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
@@ -0,0 +1,32 @@
+From 3531ff73631a0d59234eb4713e7b3a7f5ea57bbb Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Thu, 14 Nov 2019 12:17:51 +0000
+Subject: [PATCH] setup.py: move pytest-runner to test_requirements
+
+This fixes an issue with yocto build.
+pytest-runner is only needed when running tests.
+
+Upstream-Status: Pending
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 53ebea7..ebb0de2 100644
+--- a/setup.py
++++ b/setup.py
+@@ -10,9 +10,9 @@ with open('README.md') as readme_file:
+ 
+ requirements = []
+ 
+-setup_requirements = ['pytest-runner', ]
++setup_requirements = []
+ 
+-test_requirements = ['pytest>=3', ]
++test_requirements = ['pytest>=3', 'pytest-runner']
+ 
+ setup(
+     author="Nicolas Aimetti",
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
new file mode 100644
index 0000000000..68b3db1f48
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Pure python rfc3986 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3986-validator:"
+
+SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
+SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
+
+PYPI_PACKAGE = "rfc3986_validator"
+
+inherit pypi setuptools3
+
+SRC_URI:append = " \
+    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
+"
+
+RDEPENDS:${PN} += "\
+    python3-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


