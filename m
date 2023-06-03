Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC15BC7EE29
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 08:07:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.8018.1685779627945352199
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 01:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SUw9D4ut;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30c55d2b9f3so1930427f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685779626; x=1688371626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd3uamqNE2mUJH97htM1mVMNOCsutZvnGui61IsHt5A=;
        b=SUw9D4ut5iak8cVIqPe1v89jcaqi2lqdhNu5LCN9mlyH8Q4s72jCLVsyP1rOylutr4
         qsFCm5h9EA+0YjVrpJ2swDaCOrwU0aGLu0WumTjTqRlz8vg43ZmHqzpRZns5cOdTYHrr
         raRP0ZAXxYIPGDt48YkrgKHBm3Py/A1Yb3xV8GUYRmDUko0Jq/POVWeB82I1o8np+UVz
         wdKoFTDCVzT5UOvvpTi8c7KLb43e1defurGxNwj6lNrEMS/EIaTjgBbPgRj7lCvu90oB
         22opAW4MYmRRgA70WsHUc6VHhvbfxntUOGHjGk0fE259+MeZZydud8fkaANPqJ/be50K
         SYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685779626; x=1688371626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd3uamqNE2mUJH97htM1mVMNOCsutZvnGui61IsHt5A=;
        b=fVmhBJfB9toKrFlp+OmEASFWy3AA2QHylp7DRQXWJBbeP655YfPEP6vi1x4ykhpKrn
         Zj7o0adQe1kv54Zp2G3QJdjeUj24VZ02eqjng8q/QvEtsOGHqzjc9cGXrQeUfesyylIe
         ajI5e4mAGGezbq1hCcIu1Eo/A8gwgPzbFPk5eJt6sYnkeGMXV2VjJ/JXK6DA/lCph1LD
         blNpBUZlViD9+iV0NjZ8RlRJb5OdsOP44QIz/HepH7n1t82qYJNyzgFjN/Se4BgKrgVG
         ARHtw9cCKgSfvWSaweFnrgHA+SAwU1BiN50y2+O73eSgVdD3p2Ee/D+VVVd+6GeX4qzY
         0jig==
X-Gm-Message-State: AC+VfDy8ewcwd7n0rNiKocfSiDZxQTz2fPkp1d0WpYGKrBu4+Gavx9Rf
	StqullQai8Mr9LeiNQM5xsrvOX+YIdY=
X-Google-Smtp-Source: ACHHUZ5j6DoT1hSy9pqCoyv8ZgPkABK2VdlZkSkJf4lchRzbZa7N3FekTd+rO8aj9VMWDxA9U6+cIQ==
X-Received: by 2002:a05:6000:88a:b0:30a:f038:6113 with SMTP id cs10-20020a056000088a00b0030af0386113mr1547948wrb.40.1685779625792;
        Sat, 03 Jun 2023 01:07:05 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i8-20020adfdec8000000b0030796e103a1sm3801902wrn.5.2023.06.03.01.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 01:07:05 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 1/3] python3-pyproject-metadata: New recipe
Date: Sat,  3 Jun 2023 10:07:01 +0200
Message-Id: <20230603080703.1400571-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182347

It is a dependency for python3-meson-python.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 .../python/python3-pyproject-metadata_0.7.1.bb  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0f7b7287bb..cae9d36135 100644
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
index 0000000000..063df1b04f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "PEP 621 metadata parsing"
+HOMEPAGE = "https://github.com/FFY00/python-pyproject-metadata"
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


