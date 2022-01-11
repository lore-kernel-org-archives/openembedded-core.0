Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B551C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.12339.1641927719484885025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFhzmLur;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c3so219290pls.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Vzk+k1yPnTgxfrdI7ptFaCwPWlrXb2jGmCZY2tUXdbE=;
        b=VFhzmLur+CdZHDMDYkpvZca/aZTC9XhapCNuop0kJL7B/VetzliQVVawWFLKuV0rWL
         pYnwGnABKbCs1tRaP7wZCCyM/zjDI4Mt5OaJPyVAi+kdiO1RgvL+Pg/zDRvY5K8RN1K+
         SxORrPn+JuOUkMRv8WXfmIKebxEvlN0zi7Qg7+haRVt6i5IpT/FcYnbaMkJfJZrMl5q5
         R1PhR2+3RkWlD2eLTkAJKpUQ5KmuGD4VO7GubpPjwFh7JEmL85iw/vSfgt8gLnxSzvN4
         G+gZnMf3O++dyDSR8WYsKo4a6M1nbNCjiykCxuCXVKJBGjPoYjClAF/XhlneMH5c/hig
         /coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vzk+k1yPnTgxfrdI7ptFaCwPWlrXb2jGmCZY2tUXdbE=;
        b=22vj4GD1zCKG4g+SJGNrCc+YvoIg428iQjFfCcedS0cHSx9Fqm0bgGbBz3ow9ufCrg
         7459BifqAr357WQqB8IFVIQHuxsnVUAHwF5BWbu0aBNgz1eDqfeQZaFIFp8naGgYjie0
         Up0e1CxPL0qyBUvEcFjDcbRVx67n4O+QC08awnp6xnPq3hRNF2AsoJK/RdJYRxBYXhG2
         /3126Q8jgUt6CGd1B1pT3Jzih8miQFX6mf4pPNjtVpl50LYTGnhoxp0+ZSWXyFdudFKc
         KQ0EFiaB/1ey7P7sD6O6Esrd8VzqQq9UA9LSQXtglBlZe0oR8sNmJsTgFkqTww231Ho3
         ZwUQ==
X-Gm-Message-State: AOAM533sg1imoQDe6NlDTUYeAhWrBL7yc5MnmRLi495Z/HRra8axUlBC
	NW8sNzD2PbP+nFdQ+VqgwkxgB6t5N6s=
X-Google-Smtp-Source: 
 ABdhPJxBY1lhxW8ULKUkm+saAFoVBjXQkRDLU6HiBRVtlZQ3AiU8Hs+LeT9D6mDAlk8OP7KKRlkJZg==
X-Received: by 2002:a05:6a00:1a86:b0:4c1:3039:16a6 with SMTP id
 e6-20020a056a001a8600b004c1303916a6mr93062pfv.5.1641927718672;
        Tue, 11 Jan 2022 11:01:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:01:58 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 02/22] setuptools3: refactor for no distutils bbclasses
Date: Tue, 11 Jan 2022 11:01:11 -0800
Message-Id: 
 <4f7e847bc47da7d1f57ff42a0774ae228d6391a1.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160438

Add setuptools3-base.bbclass as a re-usable starting point similar to
what used to be distutils-common-base.bbclass and disutils3-base.bbclass.

We no longer need to support python2, so no need for a
setuptools-common-base.bbclass.

Refactor setuptools3.bbclass to use setuptools3-base.bbclass instead of
the distulis*.bbclasses.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  - Drop distutils_do_configure task dependency (copy paste
    error)

 meta/classes/setuptools3-base.bbclass | 31 +++++++++++++
 meta/classes/setuptools3.bbclass      | 66 ++++++++++++++++++++++++++-
 2 files changed, 96 insertions(+), 1 deletion(-)
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
index 8ca66ee708e..fd8499d26c7 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,4 +1,68 @@
-inherit distutils3
+inherit setuptools3-base
 
+B = "${WORKDIR}/build"
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


