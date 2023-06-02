Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F6CC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 07:44:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7182.1685691866184622407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 00:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ofiNKo3X;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f606a80d34so16771005e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685691864; x=1688283864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BFw6K2e9ETEWySy17xN13bsi0vS1ikRJjLebfVtFHM=;
        b=ofiNKo3X8eCwylQaQCAbu4ncxemuvxqAgoVQPTEj9WimPvgdDiFcJlrS1RQ7HQH//1
         dp3v7iDwurHHW2/uCNvGHyv7eXf7rvrE0pQHaGJ/ikLp+PVkbdEQ2DIDsEu75exbXgw5
         /N8bAOqyl+M5d36sXdIUz01cgTPrANaq8bZL4puEYw/SeNiltk57gi6z+ofWwe30z1qJ
         /GjBJ3i18n6OWng/4lZCmMeEozKiPWv+Xc0+WkpbOT8JtU0cjx08t+xsqpPccnxrMaPW
         iUCST7FMxOyYoP5PIRuNDbROR13PP+nYdq5zG1qWA39P45ayGfuI/IlMUjIeb2Va84VQ
         +hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685691864; x=1688283864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BFw6K2e9ETEWySy17xN13bsi0vS1ikRJjLebfVtFHM=;
        b=eaWw6PG3lj8/f27OwpWRBCk1Bxqsr5zbSLZqOOPrVMXmdiJduBhedUOD9HZ0Fp/xhq
         gDKPbIxTpQHsZrXD2pnWPgJPDktwPRA+D/4MnpR1w8FhTRHUOTU4z53hTOysjHQMFGQP
         h5j7OqZdi4zeIKU9977nDv5KrjGyZ5y7YtXVeIlaN86bks+P6DPOV+99H04eTkHj0NFU
         4NkO5DLjjfYmZiJn9pb9jcC7a83yYwyqmk6LThloZnEFrrnHUKd+dDxX3JPKYpv3tSQF
         P+/+7wVB6qwCN4dFFqkMn4hH7ueGueT4EXaR7BgV4NcvWgcATME3fIXJwjFzn7xOVwry
         D3yg==
X-Gm-Message-State: AC+VfDzA3G+snQjV2cK1ygZ0KDKCKkdosfsj15UpcjTaJ07I6+FD5/iz
	MerJFwN8c7Ricv8OgCgwqC8TBbR2Udc=
X-Google-Smtp-Source: ACHHUZ4PY6GqjJyeUijCD2OHNagayUehWlxs1HQ+bGujYenwTeuY2Y7vZBRJpWb6wIC0j5melSUAHg==
X-Received: by 2002:a05:600c:2114:b0:3f6:97e:b45d with SMTP id u20-20020a05600c211400b003f6097eb45dmr1188281wml.24.1685691864014;
        Fri, 02 Jun 2023 00:44:24 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c214600b003f607875e5csm4596225wml.24.2023.06.02.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:44:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/3] python3-pyproject-metadata: New recipe
Date: Fri,  2 Jun 2023 09:44:17 +0200
Message-Id: <20230602074419.2450399-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182146

It is a dependency for python3-meson-python.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../python/python3-pyproject-metadata_0.7.1.bb   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5accca3fef..d910ce6481 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -670,6 +670,7 @@ RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-runner = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
new file mode 100644
index 0000000000..9887af78d0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "PEP 621 metadata parsing"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
+
+PYPI_PACKAGE = "pyproject-metadata"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-logging \
+    python3-packaging \
+    python3-profile \
+"
-- 
2.40.1


