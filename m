Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F94AC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 07:44:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7183.1685691866541128155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 00:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=eCNPTZzk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so16483015e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685691865; x=1688283865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SyIVyly71ItzuFETlScyPcbwi7P2yRK63M5AltfUJU=;
        b=eCNPTZzkD4O8vBQn8iRLcnNSX5O+FDyI9U+bsF2b++i2t9bPvOfZfUzv6dGiiVlG/3
         4S6LTK8r7XzbdZyzUPPmopMaUX2IL3eZ21uKR8CDaSx6q5Qoo5Br84Gx/UcQ3S4AhzkF
         pj2L+QvOZE/3JhKstrIF/5wU1NMJCGhB166U5PT1rIaNEZU2LpCKTX9dpHIahOhgiqZ+
         dbGPwMmou1h+Hg70gpLr5vnVMcLQL07Ew1jZqwRRG3ApsNkQfIAFnrkPBn1T0ScVQoTI
         NQ1AAUKcdv7FRwKsOfr7G9sa72uAlfR/NVf8MXSGTMRsQjfGAghYa6f8TFHH+zvm9elP
         hF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685691865; x=1688283865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SyIVyly71ItzuFETlScyPcbwi7P2yRK63M5AltfUJU=;
        b=A0XXpLA+rnNcEO8CXdaNt5fGBPIKeEJLpaMzteWGSo3nDbglp8w1ndxe8CDbydRNrg
         FUALmLvMCe0jOVMxqUHcaktWsTgAZcu6iXQd9Lmue2TwSLNKAdqgoAc97UMwUVXfmOxh
         q6EJN5YYF7KJUB2rXzhp30SuYFL+9HZrn6Fgr8vI630iPbVhNAsqbAlw/2/dKds4eNGN
         H3x9Z5CI7HD7EuVri9N058xcZqXzEP8wvSx5SqlzIvl65bd95feCBLFfWfz8WDaQNtqE
         znmX9oPk5ZJKLqN/JKBsUuulyS0aA+4fj/lmY3tfDZGyoOH/mokhb5mrmbDq7vRyHBUe
         jEdQ==
X-Gm-Message-State: AC+VfDyvjOdeZ7zBZmnBhS/BlPcdpEXVFSHibJz4d5iptZ1i1fwG7Lib
	bPhXRVlDRVobD3xANUHvF2j6kNwPXdg=
X-Google-Smtp-Source: ACHHUZ7JiQguz3sqi6mJb44FgT7bQPm2SOjF4kJ5+vUYz10TNDN7FErG0xg/eY96hPtn8LnX/sJdhg==
X-Received: by 2002:a1c:4c1a:0:b0:3f6:119:ee11 with SMTP id z26-20020a1c4c1a000000b003f60119ee11mr1151053wmf.32.1685691864528;
        Fri, 02 Jun 2023 00:44:24 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c214600b003f607875e5csm4596225wml.24.2023.06.02.00.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:44:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/3] python3-meson-python: New recipe
Date: Fri,  2 Jun 2023 09:44:18 +0200
Message-Id: <20230602074419.2450399-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602074419.2450399-1-zboszor@gmail.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182147

This python module adds support for a new PEP517 build backend
used by recent versions of scikit-image, scipy and others.

The previously added python_mesonpy.bbclass uses it

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d910ce6481..232e5aa8f8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -647,6 +647,7 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-python3-meson-python = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
new file mode 100644
index 0000000000..828a1652fa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native ninja-native patchelf-native \
+	python3-pyproject-metadata-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
+
+DEPENDS:remove:class-native = "python3-meson-python-native"
+
+RDEPENDS:${PN} = " \
+	meson ninja patchelf \
+	python3-pyproject-metadata \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


