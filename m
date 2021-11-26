Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DB8C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.20246.1637901376767808971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CErreP00;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id m15so7044240pgu.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HzOzdYGqR+RK6G3oXh9wx41hRsnHbbJQXlK9kl64lK4=;
        b=CErreP00ooQq5r0xbyjWkKLMFae7Y0KptbhHRlWNaoXERti2t/PdxpGNFL6WyfWE+D
         mtE2TYalw2z89eq1gjOwifYwJVgM2rMTOJIPdX4y+e5wr6ZzRk4SBLw4BxG4F1sL6v14
         nwBw46G/MR/84OKvhihd1t0vuy2Stk3+4wetLmLys99Gzq0acioADMMCj3NdHYrh2EDK
         Q/duDtnkZ4FwIxLRqyDgYX73vJszmhFAZUVD0QcyiPOcmutvg4M75FUhmY34sjucpSdq
         4nZ6n9W67sQP+8cx++w4joewVPOcyy769+S8pfS6kPYOmjgjrSDS5KOHdXhYUZUnecUm
         FHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HzOzdYGqR+RK6G3oXh9wx41hRsnHbbJQXlK9kl64lK4=;
        b=QyTWYR6aQFQeWoa8Hjfe1cFZuRuKJm6JmO/xnALAyJuVvRt7oymr66AX8b73km9R9s
         8mB8L+xdLcbRDPKfm5GV+uvkeRYRrAktP0leKdcPN6wqg1oNuGZ+31RZJhfpd5GQCkIC
         kmi9bb8OS5HGXjBT8GreO+Ilhnr6yjS0GQmdN5wPlap/l+oW08ejlSxZUVYp4UbI0giy
         KRjICjQ1aGGYOYDA1qpgAMAN87B3kDaw3ENm2d74cvYkZsvRpbAPGGoQqJsClIPKpOVY
         sYDfpGknqvQQehFCz4ZVyeJV8BI1cWB5wdyPm5RNFQ4ZHpdFEN1AeVI01fa8PEqXn8D7
         tvuQ==
X-Gm-Message-State: AOAM533Bf1q5OtRqPzjGfSQS+Xes/jAlN85eDqpu2wSAfO9i0mzJtwMp
	V1+H20MAs08vEa2k1HOqSY/M4dS/z44=
X-Google-Smtp-Source: 
 ABdhPJz5KUO812B+b6yX/GbLJRe0X5WiSI99aHu+pcYU88zKPazeCREEd4Rm+9nMC7GawEtoO/tNRA==
X-Received: by 2002:a05:6a00:1312:b0:4a4:e341:213a with SMTP id
 j18-20020a056a00131200b004a4e341213amr18518153pfu.57.1637901375932;
        Thu, 25 Nov 2021 20:36:15 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 02/26] setuptools: refactor for no distutils bbclasses
Date: Thu, 25 Nov 2021 20:35:41 -0800
Message-Id: 
 <ccb8f5e5b91450066e8cd677ba7552b0518df760.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158798

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/setuptools3-base.bbclass | 31 +++++++++++++
 meta/classes/setuptools3.bbclass      | 67 ++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/setuptools3-base.bbclass

diff --git a/meta/classes/setuptools3-base.bbclass b/meta/classes/setuptools3-base.bbclass
new file mode 100644
index 00000000000..5098ae9d64e
--- /dev/null
+++ b/meta/classes/setuptools3-base.bbclass
@@ -0,0 +1,31 @@
+DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
+DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
+RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# LDSHARED is the ld *command* used to create shared library
+export LDSHARED  = "${CCLD} -shared"
+# LDXXSHARED is the ld *command* used to create shared library of C++
+# objects
+export LDCXXSHARED  = "${CXX} -shared"
+# CCSHARED are the C *flags* used to create objects to go into a shared
+# library (module)
+export CCSHARED  = "-fPIC -DPIC"
+# LINKFORSHARED are the flags passed to the $(CC) command that links
+# the python executable
+export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
+
+FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
+
+FILES:${PN}-staticdev += "\
+  ${PYTHON_SITEPACKAGES_DIR}/*.a \
+"
+FILES:${PN}-dev += "\
+  ${datadir}/pkgconfig \
+  ${libdir}/pkgconfig \
+  ${PYTHON_SITEPACKAGES_DIR}/*.la \
+"
+inherit python3native python3targetconfig
+
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 8ca66ee708e..4b8eca3f96e 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,4 +1,69 @@
-inherit distutils3
+inherit setuptools3-base
 
+B = "${WORKDIR}/build"
+distutils_do_configure[cleandirs] = "${B}"
+
+SETUPTOOLS_BUILD_ARGS ?= ""
+SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
+
+SETUPTOOLS_PYTHON = "python3"
+SETUPTOOLS_PYTHON:class-native = "nativepython3"
+
+SETUPTOOLS_SETUP_PATH ?= "${S}"
+
+setuptools3_do_configure() {
+    :
+}
+
+setuptools3_do_compile() {
+        cd ${SETUPTOOLS_SETUP_PATH}
+        NO_FETCH_BUILD=1 \
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        build --build-base=${B} ${SETUPTOOLS_BUILD_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py build ${SETUPTOOLS_BUILD_ARGS}' execution failed."
+}
+setuptools3_do_compile[vardepsexclude] = "MACHINE"
+
+setuptools3_do_install() {
+        cd ${SETUPTOOLS_SETUP_PATH}
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        build --build-base=${B} install --skip-build ${SETUPTOOLS_INSTALL_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py install ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
+
+        # support filenames with *spaces*
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
+                               -exec sed -i -e s:${D}::g {} \;
+
+        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+            if [ -f "$i" ]; then
+                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${SETUPTOOLS_PYTHON}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            fi
+        done
+
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+
+        #
+        # FIXME: Bandaid against wrong datadir computation
+        #
+        if [ -e ${D}${datadir}/share ]; then
+            mv -f ${D}${datadir}/share/* ${D}${datadir}/
+            rmdir ${D}${datadir}/share
+        fi
+}
+setuptools3_do_install[vardepsexclude] = "MACHINE"
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
+
+export LDSHARED="${CCLD} -shared"
 DEPENDS += "python3-setuptools-native"
 
-- 
2.30.2


