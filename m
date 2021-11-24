Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27060C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:34 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.3980.1637788473433305881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HidvdZVJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id t34so4084918qtc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZhFNzrCuMTpHsg6HM4paCFGFMMnkAPdTe+ZdSkF8UDc=;
        b=HidvdZVJEbfDv9GDcrNWRwzy30svxvrxlnbyLIybmw/WU+Z0OOydIeler2G92a2nLR
         /MBTK0ovDmqBruaChH+gVIKzMSkFjg3ok1eQPrypP78tNXiNoPIaZfdZAUn6Ad/Z2xs6
         +7/VCu4DdphLL8Gv1aVmBSyL4eFj+H3T/hQ5EixWWORi+Tie93097ErO5fVcAGN5jaj0
         xV/ubzRmftH1dHzcDvC91ZTiR6oIdGyCYURsTFLovxINE8QR+YcCOtvSCCmHK4g69nY/
         fD8gFD0+j5dOVSdtbzH0yJNYLtn3F/2Zyz+RFtVK6AMoXdH1S1jBK0F+8dyu7UJk6B8w
         EP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhFNzrCuMTpHsg6HM4paCFGFMMnkAPdTe+ZdSkF8UDc=;
        b=5lZiRqmIIuDw26CTH3KK8oeiJYMYtYJNjbD5mbP/E9z+zrr2bT/GiZEpzxQkZC79Yc
         znCXnwa/a7v/R1ACWBpxNC6SJteGLLl7BaZDuEGmEbP5NawIK4ifMspwzAHkZaic9t5I
         J8kxtkFISLLAkDqX/DjZjqcKmBMgRJvSOQZZWLBt0cMxnv2uhRj/LgCSXg9qQ6hN/Mdl
         3zTHMwMQTDVt02ez4utMOLz1jMylCq/PpfL39QIXCOQtmYa1U4xe1JKCVtQyFFFvHRsi
         9OhM2mZNXB81QuOWsP6GkSQnwjESn7zlMiAJH+8pF2+3DbhTTMa8l0Lwnd4Nzkuf6kgK
         xcoA==
X-Gm-Message-State: AOAM531mcN/0L/Y+338LF9zjvuGI/mcQuHPPwmtukKnv7RrfXzEybO0E
	wr53D48iZ9IzuNgsHlYJll4=
X-Google-Smtp-Source: 
 ABdhPJyl8CUziu9p6ztYV9dH/IF6C5b4EvXjlCHIpS8UtKPkEiWSSVwB8ELR39Ysi9YJlp/QZg3WiA==
X-Received: by 2002:ac8:57ce:: with SMTP id
 w14mr11271858qta.252.1637788472572;
        Wed, 24 Nov 2021 13:14:32 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 04/20] python: import jsonpointer from meta-python
Date: Wed, 24 Nov 2021 16:14:10 -0500
Message-Id: 
 <ad2699efc399fb72cb0d63198af11222d2371349.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158750

From: Bruce Ashfield <bruce.ashfield@gmail.com>

required to support python3-json, which is required for python3-dtschema
and device tree checking by the kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-jsonpointer/run-ptest      |  3 +++
 .../python/python3-jsonpointer_2.1.bb         | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer_2.1.bb

diff --git a/meta/recipes-devtools/python/python3-jsonpointer/run-ptest b/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
new file mode 100644
index 0000000000..51e609f4ba
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 tests.py
diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
new file mode 100644
index 0000000000..fb3d9e0da9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi ptest setuptools3
+
+SRC_URI[sha256sum] = "5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-json \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
+}
-- 
2.19.1


