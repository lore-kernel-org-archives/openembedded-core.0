Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FA8C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:21:53 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.207453.1672330909992284640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOFLnngg;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id u9so46192594ejo.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1pKkGPh+V/CRS+ck9bYcpQ5Hbw6Gx3P4PoUbQpDpLw8=;
        b=bOFLnnggx7yx+uSbcz75xla6r81e7JbfT3M5H8WszjLX52ctptuhuxLaEPqyFs5xNS
         rlt+Z6SmXwKfyROfkothD4fCP/v7IemN6pHaNf+9Z0nqBE1ZrLCzkut62upuwudQO8F/
         jJlZVpCnxaLTmTHYCsBtJOjFVQJGg+ZtieMROYQUPYJ/grI/h95G2vO07j5H+RSDoFIg
         g//yesM3mNR+s58vI5XfkBGJDYpfL5s+pPZNYDQt+QXt64q+iTtb7HiSG6SRZpUO+eAs
         cnZXgwfLGs9FOAXi4L78hl3uIjxpTuzc4jX7TlENNLnoyap+gF6WPLD8fKaDss8PIu97
         97RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pKkGPh+V/CRS+ck9bYcpQ5Hbw6Gx3P4PoUbQpDpLw8=;
        b=yFTx3LNIPG+XpchAiu0Mt8gJOsrhBq7kv2LuCgnzaUq2N4VRrODCDwVa5rfVqgXVUK
         S4SjYvymuFqRYWeWnGW4Kl64Y+hzctRClbRvqSbQYMI3iHfaQ5+Tu3O+JAwO0IR7zZF8
         3QlCQPkTpv3WuGR59GE7Wz27JsipNiAU+x7s00Qk+/XgJrid9qAcqD8xSC6ePckrIQQv
         RuimvFeoVkf3fuUWl0eBjfHSLfrEOKpCAuwUguljMy9yzkbXveijaxn/Iym3f5r3GUdM
         00b4G5bVhM7B22acHt2RdltjKBnJfQa472PywMR7dcKp89Ld+3AtfYvb/sqmtAp2j7ea
         OrHw==
X-Gm-Message-State: AFqh2krizgUy+kUXnWtg28td6kC+36rjVNVx8FGGf5K9VvKj9py7/d/C
	CfFbmEO533uC1qCYgiQ01g35D5ZL3jw=
X-Google-Smtp-Source: AMrXdXves8SOqBrywiNXHOY3U9aIc9J1EtD1qOTZA9g/H0kuv2pr2Vg9pI7MN7/D+zFc1o12foupkg==
X-Received: by 2002:a17:906:dff5:b0:7ef:b60e:cb02 with SMTP id lc21-20020a170906dff500b007efb60ecb02mr24905165ejc.48.1672330908423;
        Thu, 29 Dec 2022 08:21:48 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r4-20020a17090638c400b007c16f120aacsm8601950ejd.121.2022.12.29.08.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:21:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] nativesdk-rpm: export RPM_ETCCONFIGDIR and MAGIC in environment like RPM_CONFIGDIR
Date: Thu, 29 Dec 2022 17:21:31 +0100
Message-Id: <20221229162132.1256730-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175118

* the paths in wrapper don't work for rpmdeps which is installed in
  ${libdir}/rpm unlike other wrapped bins from ${bindir} these relative
  paths don't work there

* replace environment.d-rpm.sh with here-doc so that we can use
  OE variables

* in the end it might be better to just get rid of the wrappers at
  this point and depend on environment.d to always set right values

* the wrappers were added in:
  commit 760103cdaed3e820888d8984ec0b76cfc831d534
  Author: Ovidiu Panait <ovidiu.panait@windriver.com>
  Date:   Fri May 25 10:48:29 2018 +0800

    nativesdk-rpm: Add wrappers for nativesdk support

    When installing the SDK to a non-default path, running "rpm --showrc" from the
    sdk will produce the following error:
    error: Unable to open /opt/windriver/wrlinux-small/10.17.41/sysroots/x86_64-wrlinuxsdk-linux/usr/lib/rpm/rpmrc for reading: No such file or directory.
    Fix this by adding wrappers that dynamically export the RPM_CONFIGDIR,
    RPM_ETCCONFIGDIR and MAGIC environment variables, pointing to the proper
    sdk locations.

* the rpm.sh in environment.d a bit later:
  commit 5f16fd0bf774314c79572daf4ba7e4a8ae209ba1
  Author: hongxu <hongxu.jia@windriver.com>
  Date:   Wed Jul 29 01:22:06 2020 -0700

    nativesdk-rpm: adjust RPM_CONFIGDIR paths dynamically

    While installing/extracting SDK to a non-default dir(not /opt),
    run rpm failed:
    $ python3 -c "import rpm"
    |error: Unable to open /opt/windriver/wrlinux-graphics/20.31/sysroots/
    x86_64-wrlinuxsdk-linux/usr/lib/rpm/rpmrc for reading: No such file or
    directory.

    This patch adds a flexible way to configure RPM_CONFIGDIR in SDK.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../rpm/files/environment.d-rpm.sh                 |  1 -
 meta/recipes-devtools/rpm/rpm_4.18.0.bb            | 14 +++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/environment.d-rpm.sh

diff --git a/meta/recipes-devtools/rpm/files/environment.d-rpm.sh b/meta/recipes-devtools/rpm/files/environment.d-rpm.sh
deleted file mode 100644
index 9b669a18d1..0000000000
--- a/meta/recipes-devtools/rpm/files/environment.d-rpm.sh
+++ /dev/null
@@ -1 +0,0 @@
-export RPM_CONFIGDIR="$OECORE_NATIVE_SYSROOT/usr/lib/rpm"
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 5f3986d8a3..152cab490d 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -25,7 +25,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
 SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protocol=https \
-           file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -120,16 +119,21 @@ do_install:append:class-native() {
 do_install:append:class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+                        RPM_CONFIGDIR='$'{RPM_CONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm} \
                         RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir'))}/..} \
-                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/misc/magic.mgc \
+                        MAGIC=''{MAGIC-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}/misc/magic.mgc} \
                         RPM_NO_CHROOT_FOR_SCRIPTS=1
         done
 
         rm -rf ${D}/var
 
-        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-        install -m 644 ${WORKDIR}/environment.d-rpm.sh ${D}${SDKPATHNATIVE}/environment-setup.d/rpm.sh
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/rpm.sh
+		export RPM_CONFIGDIR="$OECORE_NATIVE_SYSROOT${libdir}/rpm"
+		export RPM_ETCCONFIGDIR="$OECORE_NATIVE_SYSROOT${sysconfdir}"
+		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
+		export RPM_NO_CHROOT_FOR_SCRIPTS=1
+	EOF
 }
 
 # Rpm's make install creates var/tmp which clashes with base-files packaging
-- 
2.39.0


