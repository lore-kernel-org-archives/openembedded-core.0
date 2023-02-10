Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1FAC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 14:25:56 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.16322.1676039153599455448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 06:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lr4ojate;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id v17so5865518qto.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=13zB7oRMM93htsDXCjMtXEItfDUMhM/8gmQbwN7hPkE=;
        b=lr4ojateUSWE8+z7UbE+xqdagLGjS4qjZg1ZBHUNx73AK2nt6TkYVkbYdcQ6LIIgY1
         ONC/+GmUQZFcg6tHf4XZJBfFzJxR+ndKu2h9DJiYRfko18a9CzRmYTiAdhj0mpT8CsZ0
         n1Sn2QHvUi/c6kEdhWVkmXcz8xwSqONLbjXQg687ML3oD27kZnYvCbFphJbzsVb4Vj0E
         +vJqhvq1uXyoF4crJmSRmmdKMrH0qK1sbfN0lwE6GY5hOcMyLBuIUZSiYn1x1idaMTl3
         cH9wfhzWGhTNU7H0Uho/3BtMmg+5m4dOc3LyvjTdR5VdUWSaq4C0DmMIyP8k1Teo3GIR
         ZMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13zB7oRMM93htsDXCjMtXEItfDUMhM/8gmQbwN7hPkE=;
        b=Tq3E85bBUgLcpuLh6/W2ry/ZykpcG0rvzfiXwMA/8gkaxQRBv0ZgxfLg+3WqDfCFWo
         lQz+WZoXgYy/SyYj574kYmjfeU7Tmr6JhyY1Lj0X5D9dlJELZhiAQPlmoQKu49W1QgE5
         G61vwHgsNLxsRuWSPALUP7RGCvbYUbHiHFMCyeXS9dtoPXEqY5E/2jrHbVETXumBBSlk
         U12/efQGdF++UiZg7Y2jkPW9WNA85Khfsshu30H/O+17xBKvtee6HI2LsV+0Rc3nQyjp
         +b5bg5HAmCEqg2RTwmfw0uLPjP0lwi3rZ40FjceDTmOMc7oHG+Ay/O9hY+EYskbM8AlI
         whRQ==
X-Gm-Message-State: AO0yUKWWxH/PpWYEnLOpOclm6IAoh/okLro4gQsI+UraclAkjkvSlXLA
	vob3D9CF8cpLcZyeWNBQAvBEaQx4+qQ=
X-Google-Smtp-Source: AK7set/4zAYHwpjBMqB1oWXgryMKxGrxSEfrkhuGFQNSHItwp9EKTXdSmfaF650USLMNM38YSWYcBQ==
X-Received: by 2002:a05:622a:11ca:b0:3b8:33b5:a7ec with SMTP id n10-20020a05622a11ca00b003b833b5a7ecmr27226397qtk.22.1676039152342;
        Fri, 10 Feb 2023 06:25:52 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id fg10-20020a05622a580a00b003b63238615fsm3553809qtb.46.2023.02.10.06.25.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:25:51 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-dtschema: add dependency on pylibfdt
Date: Fri, 10 Feb 2023 09:25:38 -0500
Message-Id: <20230210142539.28035-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176993

dt-schema has a dependency on pylibfdt.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes since v1:
- add a maintainer entry
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../python/python3-dtschema_2023.1.bb              |  2 +-
 .../python/python3-pylibfdt_1.6.1.bb               | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ec7ea90d16a6..575ceac8f23c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -661,6 +661,7 @@ RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pylibfdt = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
index 9767c95d3043..24bded9710a9 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "dtschema"
 SRC_URI[sha256sum] = "8fc8c269e4c57e9d008af7b32cd33b77afd4ea1ac9552bcfa96b41b9e0c52586"
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987 python3-pylibfdt"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
new file mode 100644
index 000000000000..966f8f1413fb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "libfdt from the dtc project"
+HOMEPAGE = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "pylibfdt"
+
+SRC_URI[sha256sum] = "90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778"
+
+DEPENDS += "python3-setuptools-scm-native swig-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.36.0.rc2.17.g4027e30c53


