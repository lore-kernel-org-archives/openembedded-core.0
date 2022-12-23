Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456A6C4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 11:15:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.70115.1671794143611675318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Dec 2022 03:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Om/9Odc9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso5930893wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 03:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oad3eQF6UQ3SAwP23aX1hz8M/kSqCIh1MzTeAaMYPNk=;
        b=Om/9Odc92jlNckmQLHsqlWzO7LNViRhC/nxpGoo4X3bZMC6QPTOP82p/7DMrhrPoj8
         pejjWP4rqrAaSClB5sKQpO0cOSnCpqcjVWsXNI1sEn0LuCRBEIfP6RpNYMUO6JFX7dLG
         bbL1i/8GN/N7mli4fiXO1w4DqG574eOpV4qY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oad3eQF6UQ3SAwP23aX1hz8M/kSqCIh1MzTeAaMYPNk=;
        b=r9Wxjr2pGaos2oPl2CSflcrf14fnKUjHDFOtrGeXZUrREF20Zwu31l/h5YhI92ZZS7
         s6krsv1JTUiyJqiTOgE93As503zcDW62P+2PJZojg9Q6MT/sxzH3WA0Jj3qwb/aZIBWv
         kJDNQTc+tEJdWrtCekmMGfQybnXjodDbN1Q4l7ppHvw6xBK235IMCQISCyW8gKBcM/dH
         kWEVigUb3qVsdStOxZ7Gm7S8v/o2H5v5743VfEeobHW51UlSr40nY0Um2ej2bA52sp+n
         XXWouYy18hmFmcHGyhvo7U3lTjiIZjIB/vVVbt9DGgaXF8KdkVF4danew2EmvyHt4wzM
         xLBA==
X-Gm-Message-State: AFqh2koEcMj/sdJfMpc56RY8+eKeaEIEBm9qeq0v2HtF+opi37KBdByM
	Ah4/LMwBUrBwA6iiZgw4rylwWZddIdMZ4qJu
X-Google-Smtp-Source: AMrXdXt8HlnM+r2JCBTycRxEigMTH3Aqi/A49v9+yw3af8pdx4+fROtVXMDSMCOTMai3KukM9YE/Fg==
X-Received: by 2002:a05:600c:1e10:b0:3cf:973e:c874 with SMTP id ay16-20020a05600c1e1000b003cf973ec874mr6944411wmb.14.1671794141467;
        Fri, 23 Dec 2022 03:15:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bc21:fec7:83cf:e0c3])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003d04e4ed873sm8579262wmh.22.2022.12.23.03.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 03:15:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-poetry-core: Fix determinism issue breaking reproducibility
Date: Fri, 23 Dec 2022 11:15:40 +0000
Message-Id: <20221223111540.597037-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 11:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174978

Fix failing builds due to a reproducibility issue by adding a patch to sort
globbing, submitted upstream.

[YCOTO #14993]
[YCOTO #14994]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-poetry-core/deterministic.patch   | 23 +++++++++++++++++++
 .../python/python3-poetry-core_1.4.0.bb       |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-poetry-core/deterministic.patch

diff --git a/meta/recipes-devtools/python/python3-poetry-core/deterministic.patch b/meta/recipes-devtools/python/python3-poetry-core/deterministic.patch
new file mode 100644
index 00000000000..402ee530944
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-poetry-core/deterministic.patch
@@ -0,0 +1,23 @@
+builders/wheel: Ensure dist-info is written determinisically
+
+glob() returns values in "on disk" order. To make the RECORD file
+deterministic and consistent between builds we need to sort the
+data before adding to the records list.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://github.com/python-poetry/poetry-core/pull/545]
+
+Index: builders/wheel.py
+===================================================================
+--- a/src/poetry/core/masonry/builders/wheel.py
++++ b/src/poetry/core/masonry/builders/wheel.py
+@@ -294,7 +294,7 @@ class WheelBuilder(Builder):
+ 
+     def _copy_dist_info(self, wheel: zipfile.ZipFile, source: Path) -> None:
+         dist_info = Path(self.dist_info)
+-        for file in source.glob("**/*"):
++        for file in sorted(source.glob("**/*") ):
+             if not file.is_file():
+                 continue
+ 
diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
index 22a6a2a4778..8a950220125 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.4.0.bb
@@ -26,6 +26,8 @@ inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
 S = "${WORKDIR}/poetry_core-${PV}"
 
+SRC_URI += "file://deterministic.patch"
+
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
     python3-core \
-- 
2.37.2


