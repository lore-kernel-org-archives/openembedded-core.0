Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A747C7EE29
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 08:08:28 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.26039.1685606906962497019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VZXhfUA3;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so544090e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685606905; x=1688198905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzvorbUtQumgdxMkNzOZlEsv6tuJxoiYHmdDSORCq20=;
        b=VZXhfUA3ljXwX9OiurJBIITxkzCkSdIJcBpap1nEBkzjAfWVpiSttIZF+J166CpIZ9
         bK8m2VrKiCXLq1uKAWTaOmJ6TsTHti1/FLV3mCvhxLgCcEYspqq9odhsky1k88sY5+8i
         uhW8J2owztbZJErvMH7svXjFJ/RUTtQgywmWQsUKZ+V2NxHcqsidQbNPd/jf7G0lecD6
         lii1GgJ0yltlDolcyEuPAd8gV2N0OQxZR0Y6wemUrU4q9OIBjmWJmPxof2YeiTqLo+mY
         IhXrEnOcT3gVv/cYSXYYhQCCtF8A8dMQUif9ILzriYbWdd2bP+oVo1BstEYwelG+z5gs
         oEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606905; x=1688198905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzvorbUtQumgdxMkNzOZlEsv6tuJxoiYHmdDSORCq20=;
        b=jiv5nm9XEOHlV2UXzFwk8nVCQywAaKulJbmz9ZD3y6bwgBYZIAFFDZysz2JYEKNgJV
         dH46ELYKXY/9q0W9kTarHJjYjNC5mOmGKdwov6Iw63BaMqCg+q+RHMeGWsfnOYNL5a7S
         ZDk1ISCnm9tAYphv/Qav7zbElYGjwijfcY93Qw8v8b3kEiEAmPuNvG7618vVXowEW0ds
         R5xAKl23ggWGi/mEOpwwlj/6K9sDF9EmBZ7s15LEqNWD0LP4DNJwxI6j2as79yoHIkno
         qDgmwUohf1ftkdQsqcsrK7z0+ryNclClEKT4Q4BV/pQVg7/FOYGxt3oSTd5yY+ySSQGv
         aXkw==
X-Gm-Message-State: AC+VfDxLBDiIMwhgR3S8pAxRwzAl97Op8LwXaI8PEQz8M5R94w60VqNY
	ainiQzn97LAkrFFPF/sY35VA7Bt60HI=
X-Google-Smtp-Source: ACHHUZ58tiwvlSJxJ0bEMMZ5Kf750u6jiV8G6X0xHVo09DwUn86bX5Xe2F6NKgMwTShtH2v1pN6qmA==
X-Received: by 2002:ac2:456e:0:b0:4f5:a17f:4898 with SMTP id k14-20020ac2456e000000b004f5a17f4898mr781578lfm.67.1685606904715;
        Thu, 01 Jun 2023 01:08:24 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003f4247fbb5fsm1380109wmc.10.2023.06.01.01.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 01:08:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 2/2] python3-meson-python: New recipe
Date: Thu,  1 Jun 2023 10:08:21 +0200
Message-Id: <20230601080821.2346868-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601080821.2346868-1-zboszor@gmail.com>
References: <20230601080821.2346868-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 08:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182054

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
index 8c4c586414..f2448ee3c9 100644
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


