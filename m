Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0630DFA3744
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.2199.1666901793633820197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmHsk0WP;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id 13so7920626ejn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fascw4vG8ySgI3ec/ONcwZIe7sXqUV/TbGgOSfOrfUM=;
        b=TmHsk0WP1lIaRfIH6vECFF0vstSol08rShQjhGdDuorFpXdLI4ZQ1LoJ3K4hVNfira
         Ax1+9PjPAEVJx/FiYJ2v26IJjOqWtSyE18WZypGGYH2AisFEV5zrOmYGyADuOFe1GLUm
         Hd4Z3xsDz+srf7e3NHU1bR8rg4NKBXq7+JSV9KCuUyEFUPSCJQED2yI1Q8ILrdI2cyzT
         9ohcGKDgWdVHb+J0pmeE9c0VcH3cx7w9b1A5MWa2HVO3jUcCt/2q6XNMQu2nvwvLA3Np
         az8hmHjEu+KXQBCOcsHX4/1GOa5GS5CtWH4INr1cK0v3B7L00T+BZkFQ3JmDIjmOsktl
         UPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fascw4vG8ySgI3ec/ONcwZIe7sXqUV/TbGgOSfOrfUM=;
        b=IQOzppoFV81vACAcgcMjgezdlHZWVRHSdhi4YjWnAzRz0EsoQlWcxQFL5cX2MuoFJa
         pRx06KufpaFbTCWJXsZPMcKaESLxyzkZnHQ4URvlMyI9/0yB1IrFk7ujCdCByjlq3yfd
         bopv/LYko8s3XK1ELTRO0ZbSoZxV4VYNI5zFBGpZFarryPZk6/oFQpoUmDB1v+LPxxFU
         mIJ6S9d/eyAZ3RAZGa22am4OevSWLZalAlO+g7LkaYTTVYP7/kq9YXTj791yq5LKNW2v
         M8/ZAf3tZ16yteWTcaEQT5R2sCT6/vWh9/Wfp1sZpfoSdhTKfdLThhrOJ3oU3Z8BTYj2
         RrRw==
X-Gm-Message-State: ACrzQf2jcp44JZ1o170T22qBk5jpgX06Fp4tFz7UdvoXs9vrBX3E3Ta2
	YPO6qkExgYPf6YDyq/oG7nOo1QmCrrT9ig==
X-Google-Smtp-Source: AMsMyM7NPxoZbL8r7Ri/3rJta9IS2pZvO+bE1MZVLbPI8poYZMdC/MV8h4uSuygzVAwqqPYat/bNWA==
X-Received: by 2002:a17:907:7251:b0:7a5:a8f5:b86e with SMTP id ds17-20020a170907725100b007a5a8f5b86emr22411430ejc.761.1666901794213;
        Thu, 27 Oct 2022 13:16:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/23] python3-hatch-fancy-pypi-readme: add a recipe
Date: Thu, 27 Oct 2022 22:16:04 +0200
Message-Id: <20221027201611.3644334-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172218

This is a new dependency of python3-jsonschema.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../python3-hatch-fancy-pypi-readme_22.7.0.bb      | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index fee4e52b10..57319cd8f5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -613,6 +613,7 @@ RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-vcs = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb
new file mode 100644
index 0000000000..a0167e25e9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Hatch plugin for fancy PyPI readmes "
+HOMEPAGE = "https://pypi.org/project/hatch-fancy-pypi-readme/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ba5633c60bd3e243091013aa83b4d807"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "hatch_fancy_pypi_readme"
+
+SRC_URI[sha256sum] = "dedf2ba0b81a2975abb1deee9310b2eb85d22380fda0d52869e760b5435aa596"
+
+BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = "/hatch-fancy-pypi-readme/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.30.2


