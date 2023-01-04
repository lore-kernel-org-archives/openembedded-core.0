Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60461C54EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9361.1672830356464596205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pRPoyoES;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z16so16086277wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bmu/tUguzsg4lskSs32Qww1Ycv9bO357oxopThB/KUk=;
        b=pRPoyoESHD/SDKjIUl5Aav87IkjdyH+cAYMFPl9XkH/qHe8VeXg3VhNNPFRO2zaNT/
         NAGKth24faiFcrUAGyF1jmb41RlMY85y029zHAkrCxJCLgJdW3DfpCKbCIbLf//ctp0G
         t+94RSKHm7qhgUyMS4fLLqpIJM7XioI/FW3Wlpe8iAVCFhqkWAzDvyRDdss1U+UaLlAj
         BXkBokyCkq69Xuo31HIfxfUhYMl9aAKliA6Dsuu0NwcSs1EyZD4GRdB5buqer5x7Ey1m
         KcqDv7rrGdkk2cINyIY+edivczwR/Q5dZr5ZJNn7vXdAYZbXYus3UdvFV/LyEId9djcC
         FY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bmu/tUguzsg4lskSs32Qww1Ycv9bO357oxopThB/KUk=;
        b=Nnrrcuhii1ROFpNV2i0uYn7cuhhOwlsp3GB9nzVGPEZsB3leGGhmfntF2XDHLeB5KS
         vkGwUAC2Lextmy4bjCG/3kBlFm8sRb1YEUNjQ0Due0ohmmq6KvOLPT9VmsLkS3O7QSNl
         qqvg1NMLBIEKR7I61itEap/kL9rN+/mbjyAb997cNqygj4Xs0G4RFu1qbeD3WCIaiehH
         bTuv0mldi5qi8eC3qsn3j0nZOUdJDCwwzaInFOAQl/pB6Ru2wRoH6Kcli02yOuXysP2E
         CvU4ckP9FiLiQklBwSNfrf7gJ94yoyCayPlSWusNy5s4H4/HuRvJOmBH5JeJIDuXnrEb
         U3vw==
X-Gm-Message-State: AFqh2krngCYrJ4ndLPstFHuYs42BPnk/Q+cs+pHGjb5Yz4uaTJPsaQch
	9BDTfcdi+POJ6QMAAN0Nbabthn/sTyE=
X-Google-Smtp-Source: AMrXdXty6UG9PYkjTOljFDUz5zs3YAVzjtzIwPw76h15kEC5RMq0FfxRn3vHwDiDt2D83Hhq9TO8Sg==
X-Received: by 2002:a5d:5e81:0:b0:244:e704:df2c with SMTP id ck1-20020a5d5e81000000b00244e704df2cmr34057766wrb.57.1672830409234;
        Wed, 04 Jan 2023 03:06:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 74/77] python3-strict-rfc3339: remove the recipe
Date: Wed,  4 Jan 2023 12:05:45 +0100
Message-Id: <20230104110548.2537259-74-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175459

It is both unmaintained and not needed by anything in core or meta-oe.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...001-setup.py-use-vendored-_distutils.patch | 27 -------------------
 .../python/python3-strict-rfc3339_0.7.bb      | 11 --------
 3 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch
 delete mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0affa1bded..508d10e091 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -691,7 +691,6 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.or
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-strict-rfc3339 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch b/meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch
deleted file mode 100644
index ba1c3d3363..0000000000
--- a/meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 857719e82daea0d85b734cac34cf569050724068 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Sun, 20 Feb 2022 20:26:51 -0800
-Subject: [PATCH] setup.py: use vendored _distutils
-
-Deprecation warning of distutils is interferring with bdist_wheel build.
-
-For now, use the vendored setuptools._distutils.core.
-
-Upstream-Status: Pending [upstream appears unmaintained]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 1bf87cf..a49fb8e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,5 +1,5 @@
- import os.path
--from distutils.core import setup
-+from setuptools._distutils.core import setup
- 
- readme_file = os.path.join(os.path.dirname(__file__), 'README.md')
- readme = open(readme_file).read()
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
deleted file mode 100644
index c377c3bfb0..0000000000
--- a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
-HOMEPAGE = "https://pypi.org/project/strict-rfc3339/"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-
-SRC_URI += "file://0001-setup.py-use-vendored-_distutils.patch"
-SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


