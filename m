Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F52C433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:04 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.875.1637704683343884578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BbMoht1M;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id v2so290518qve.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+HEhp7sorDpjVKaB10E672BMQl8EJ+TusId+bh/83Gg=;
        b=BbMoht1MvoZGEnOzVDmeZnSLb+8txJy3kov4t9BwtIkGpvk3O/eqUngS5YmNIID3NF
         U+1f7XwNtgQl7pbp1UoGBo3NVy+eibIy6AoGw5t23lmjJCMt5lDb+rQp3eBI4kN155Za
         32Pul/5coI5DntVArW/+HcbEdPPG/I4GkrwdlwgmqC1QTW58KxVo255ecOzShj+P8PyO
         7hrDAWhJsLaESz2otI+5QoTBCRr6HF3Ps7blrXNZ1I7huWQphDUM9H/s9r+49D21FOCf
         PHz1YNwDIJdFRmn++hcfkhl+WQwKYZyB9HDf3XvsFnFYO/LRXKDC/rXquV6ko80zaM1w
         kYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HEhp7sorDpjVKaB10E672BMQl8EJ+TusId+bh/83Gg=;
        b=F9C7bLcLrbxO8TmfQ+GwUTguPV77L9IRoAIvEnXadBemDCKf+TG5R6VfeCrxqMCrAT
         JP2PBT5/ShlVnFhb0BWHQnysETvT68oRMShQL7+65RH2Pd2C+njyLJ0WIjAAjtVVp5wl
         JC2Bot/F6f5KROeQgPBTzkyBjJFOaKIO1MEIzeh7dAoC5rXC+7fzVq0ePFxdDhIU4SLe
         NMyXe+GsmwmEpVfNTomVDLLSc3rpOG/yRfcO+8cjRoqNCMoy5SIfzmjuMqaaJTjlXL8B
         kCg3kVmB8pFerubVXUMVQKqr7JXxPlc3V0ZrKuuL8z5EQMkaGi64ybYGcMjxHaBjzT12
         0kOg==
X-Gm-Message-State: AOAM533YaLmRSI2BOHqN2RHiiv/eidz3x0duFU9uZnmxIVqzU37ZdcQ2
	nPDPIVIiryUS7P0FbRAevcU=
X-Google-Smtp-Source: 
 ABdhPJyD7Jjjl7YwnIn89YRsisWJ54YfknNUVpC5qD6OnAU2gcn//oU8xmj7m+zRozX6UfDwAaDDdQ==
X-Received: by 2002:a05:6214:21a6:: with SMTP id
 t6mr681985qvc.40.1637704682497;
        Tue, 23 Nov 2021 13:58:02 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:02 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 12/20] python: import rfc3986-validator from meta-python
Date: Tue, 23 Nov 2021 16:57:39 -0500
Message-Id: 
 <90eea9834123f022de679c62497884722eecb423.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158633

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


