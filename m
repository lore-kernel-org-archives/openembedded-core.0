Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56510C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:41 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1837.1645557460815893381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dszmlGOx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id p8so13057517pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OqfbI/taZuE5tvRkjzUudtuBzn1DIs9rdG1KeJG3/cw=;
        b=dszmlGOxHwpZcZbsB04sjf+Hf0Iez/cXkj4QqEfRNSkwkBSRUGR8ti2+2JzydgEnOr
         hH602Qd9N94LHNnZM6VXJWQ1f3aNYMXEJ1lorZGjlhp19eVDDunbpQPxCQdGKGDJnnoR
         +pFzx/EUr03w7Kt4IdZ0JqLzLIn6UNycwYkCKVS/r4xv/ESuBblM15u37xskfpHIhT4F
         kdf/KfYPZV3ZcZiuiTNJigE9krP2RpBsFnhlKKgvrY4hDlIGXYViyp+/gpLR03dUwZtX
         duAWYMf2FkVszBugqViCrgrTHOpU4ZEpJroDaxTuV5FsoM/DzmByFDog39kix0VuT7mk
         O6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OqfbI/taZuE5tvRkjzUudtuBzn1DIs9rdG1KeJG3/cw=;
        b=AAKNkcSAF2NWZNb2MF84F6OMeGr5sC11FQiAL9IT5QxHCKK9WPvJVFEvsYdyLmo9oN
         m7CaFrBtd6rcdlcilVhbKvrCwFpO/hUSlXGAz35j5F3+LgRYUFKk91HpMP1fjI/Llr60
         5jLOy8ziBI7eivJCF3ZqgaE44DToeetzxF0EVYUDQ70z+3ixrwDanbUX0iMcxmpEot4J
         g471rQDpFHh59HREOhqloQyHL+HW04RBTsiMqhL9gK9rL8tLKCQewAKoas38b+kpvnbq
         XGKMq1QUPiS8dmJrhOWWDXZscdDJNQTRMA75bOsPgZONx3omSIcXEw5b2vn7uDh0NRNj
         7C4Q==
X-Gm-Message-State: AOAM533iCuRNBYDZLskmzSjwfHol/vozrRzXAt9yuGvmUyoRFjQ8lhAx
	s5U99MCqLWnXmi3RzuxMQVmaZUu5D6viQg==
X-Google-Smtp-Source: 
 ABdhPJzvyGNCP3mraTB2c84zAxyEKD8S6IPFc61lmvMGJt2mTvNda/DQDIsJPLZqsWang7Kswbwzbg==
X-Received: by 2002:a05:6a00:22cc:b0:4e1:bee1:937 with SMTP id
 f12-20020a056a0022cc00b004e1bee10937mr26128492pfj.13.1645557459846;
        Tue, 22 Feb 2022 11:17:39 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 22/32] python3-scons: merge -native recipe
Date: Tue, 22 Feb 2022 11:16:48 -0800
Message-Id: 
 <085319c03515531403ae28d31b15466a6b34daa3.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162213

The native recipe simply calls create_wrapper to add a host script. Do
this via do_install:append:class-native()

The scons*.1 man pages are being installed in ${prefix}, move them to
${mandir} (previously installed in ${datadir}).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-scons-native_4.3.0.bb            |  7 -------
 meta/recipes-devtools/python/python3-scons_4.3.0.bb | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-scons-native_4.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb b/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb
deleted file mode 100644
index 73076b87320..00000000000
--- a/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python3-scons_${PV}.bb
-inherit native python3native
-DEPENDS = "python3-native python3-setuptools-native"
-
-do_install:append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
-}
diff --git a/meta/recipes-devtools/python/python3-scons_4.3.0.bb b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
index bff2fdae92d..cfb075f65f3 100644
--- a/meta/recipes-devtools/python/python3-scons_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
@@ -8,6 +8,7 @@ SRC_URI += " file://0001-Fix-man-page-installation.patch"
 SRC_URI[sha256sum] = "d47081587e3675cc168f1f54f0d74a69b328a2fc90ec4feb85f728677419b879"
 
 PYPI_PACKAGE = "SCons"
+PIP_INSTALL_DIST_PATH = "${B}/build/dist"
 
 inherit pypi setuptools3
 
@@ -24,4 +25,14 @@ RDEPENDS:${PN}:class-target = "\
   python3-pprint \
   "
 
-FILES:${PN}-doc += "${datadir}/scons*.1"
+do_install:append() {
+    install -d ${D}${mandir}/man1
+    mv ${D}${prefix}/scons*.1 ${D}${mandir}/man1/
+}
+FILES:${PN}-doc += "${mandir}/man1/scons*.1"
+
+do_install:append:class-native() {
+    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
+}
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


