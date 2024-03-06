Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069A2C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.15008.1709739721955988605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OU/qsCiK;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a45bdf6e9c2so82421566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739720; x=1710344520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZs7EALRItLAXhfHcmc8SFY4WLeasOFhWlNMZx3zfZA=;
        b=OU/qsCiKh4B/viUu+sN5O2d/8VYvC/aPrajzYfxhNZwWOVBQ1OKJ6LcwysCktt4r+G
         Lk/rbTWYEDMLd0PEPe13EPP1PSjDerThzzBsEMNE46CkiPih7GCmZOaZ9AEA5FqQuTjR
         eeouRMm4ooUlOfLUtreN+LzYAX/9BuogjJpIu4ezi9LMIpK43syFN+VdfE5m/XITpJME
         PZ6O4Bm2MnzokKUTis2bbp1xx5HlYsziETzTw5W6EztPQwB+ztMgCs+74cnaQDxUDsLb
         88S0tZ6CRKWbxWUGJTy/XR57yAhfMeMTLEQ38H9hjAd2g3cJdF/6KKedBHSSNiEPpRdM
         3Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739720; x=1710344520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZs7EALRItLAXhfHcmc8SFY4WLeasOFhWlNMZx3zfZA=;
        b=dXBzhj0xuq6RJINtY+SOwCs98kUL5OvXlxGZ9NN6QBvUgxCu6ydoG+7R4OFrRRUZ2p
         x0dXJl5D5hrvxWTKSha4f2RIjDBEOaoebUjzpSfB1ylmLt3IEbSnYAj55F/exdwmqIRI
         3YcidL+jXENRdtsPsnP+nbcOlnxi8/NZrn6G/TXIYAdH0ija9kI7dbACkqNLarctkIDw
         tbYC8+4lIDwVcrTWN9zrKRNnKAE8IhRQxr8SKrLRBl1QTjf+kp+yon6AKr9J17VwQgll
         xG752SB1S3rpmvWdNxTBqQGyg7A+5csMM/tW6t+BXgl4yjy4i/7vH0LLfFCoE+K2YaPb
         vARA==
X-Gm-Message-State: AOJu0YwL16zc08BR44wUpLFkn2X1QZ9HPPDSnj9LwoBPBoR+2ytTa1AV
	EbaKB6FILKYxvVFrkcxd1nv8FpguvVU2SOixp9cHfX6H4CfQTme8FzkBzKqD
X-Google-Smtp-Source: AGHT+IFqaq24iIbezAE5HctiRoKXmtJN4kpeZioLdWWneFpkW9T2+SsBq6aNVcEYTHviWkpI6yi+vQ==
X-Received: by 2002:a17:906:ff53:b0:a43:5bc6:17f3 with SMTP id zo19-20020a170906ff5300b00a435bc617f3mr11361687ejb.6.1709739720043;
        Wed, 06 Mar 2024 07:42:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:41:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/47] python3-sphinxcontrib-jquery: add a recipe and make python3-sphinx-rtd-theme depend on it
Date: Wed,  6 Mar 2024 16:41:05 +0100
Message-Id: <20240306154151.3741709-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196684

It's a hard dependency of recent python3-sphinx-rtd-theme
versions:
https://github.com/readthedocs/sphinx_rtd_theme/commit/4d6de11137333ede9842d535aa08b753dcb7f1b0

The issue is exposed by latest btrfs-tools update.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc             |  7 ++++---
 .../python/python3-sphinx-rtd-theme_2.0.0.bb         |  1 +
 .../python/python3-sphinxcontrib-jquery_4.1.bb       | 12 ++++++++++++
 3 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a3433f496cb..3f566eaafca 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -706,12 +706,13 @@ RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <mrybczynska@syslinbit.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-htmlhelp = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-subunit = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
index 46b46bf0175..22b4d964444 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1db7d4ef426c2935227264e1d4ae8f9 \
 RDEPENDS:${PN} += " \
     python3-compile \
     python3-sphinx \
+    python3-sphinxcontrib-jquery \
 "
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
new file mode 100644
index 00000000000..5f915663c27
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Extension to include jQuery on newer Sphinx releases"
+HOMEPAGE = "https://pypi.org/project/sphinxcontrib-jquery/"
+LICENSE = "0BSD"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=926e8b7e89e3ebb2a2d1dfaf0873f241"
+
+SRC_URI[sha256sum] = "1620739f04e36a2c779f1a131a2dfd49b2fd07351bf1968ced074365933abc7a"
+
+PYPI_PACKAGE = "sphinxcontrib-jquery"
+
+inherit pypi python_flit_core
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


