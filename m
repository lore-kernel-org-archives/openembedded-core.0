Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E821C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 13:30:10 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.12864.1690896602462877880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 06:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F/xLVvGh;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bdf08860dso1068693166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690896600; x=1691501400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQcsuR18kOq9wLztPs4JPDhoV/FkkSxkhNqcavAf+rc=;
        b=F/xLVvGhuXmWnAiKyT1Bx/zkhpPNxQAHgQ8bh0L7YrX5GSA2Xp1CwumL62GwS/AmL1
         GGMwj9AiL1W+71qNRwIZuhi7iWGKibYyAuh+2LAEEr1hOHy3U5fd3ODpaVh6v4M0xpYa
         HH2HL3jqoxqnw653GjwQ6PaW8AfFeVdNWJByKuzKdR0bmLU3AdbQ4CizpH81d+ys2f2j
         aiH6459cKaKAAuEsxa711spw3YiYiBnrKNNHRAKqnJXgUPNkzB68pS0BamLD6jonJhE5
         KJlkDH3IJsQf8R/6qUGVjPn1XJuaZTnl3UBLjkC1BXGy8jCsCK2fHRbTc2mOLspMSpC7
         p8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690896600; x=1691501400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQcsuR18kOq9wLztPs4JPDhoV/FkkSxkhNqcavAf+rc=;
        b=JE7X1lrU3mf1yKpNPLJllqCnHYd8bjyW299A8ea6HFM1QsCmklnRBYoIp+kA7QUgGY
         SIxCJ6ULzvaQY++M0L2ED+U1QyMbiKmWXjMk8HK8V76CLPeXIRJHWOBHdQ5EuQfeXrdd
         nFl7381+Kq6kF9Knxg3xH3BLAIfGqX+LV7Xju9UxBoFZh1Ipu0KkzCdJId8ZgMoZ3SgJ
         tf9BbykgW7tuMUM2yla1DChnjuGXWB6IZma4uhu+oT30Ypwsy6faJWD7HKklj4my6tR+
         uy+A5ejwN7mYYICtLT7HAjj0AnO3NkgCmvQxukahxffM0XdKsA7Nm9E/beyX8sJ/1ec5
         RhHQ==
X-Gm-Message-State: ABy/qLaDV9BFOeEri6eAUKgZe86ClQBARaSvewf39PMEAtZQcj93d6tG
	6noEwBuZYEIHXJE7Bqbj3djG87Y1aUpsroSM
X-Google-Smtp-Source: APBJJlE8hAgyaWC/tjplegiJAoVH8cBtIbwlucz+3yCYWkI/1Pj6+Xf6Nw/ZX12FY6M9P5zj5+099w==
X-Received: by 2002:a17:907:2bf5:b0:98f:8481:24b3 with SMTP id gv53-20020a1709072bf500b0098f848124b3mr3060832ejc.37.1690896600357;
        Tue, 01 Aug 2023 06:30:00 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906c30400b009926928d486sm7636205ejz.35.2023.08.01.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 06:30:00 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v6] rpm: Allow setting platform macro settings externally
Date: Tue,  1 Aug 2023 15:29:57 +0200
Message-ID: <20230801132957.401557-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 13:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185245

Feed platform settings to installplatform externally. Based on the patch
submitted under https://github.com/rpm-software-management/rpm/pull/2585

Patch against INSTALL was backported for rpm 4.18.1

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...atform-macro-settings-externally-258.patch | 119 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
new file mode 100644
index 0000000000..a32ce38533
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
@@ -0,0 +1,119 @@
+From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Fri, 28 Jul 2023 12:16:56 +0200
+Subject: [PATCH] Allow setting platform macro settings externally (#2585)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* Allow setting platform macro settings externally
+
+By default, rpm installs a series of default platforms based on
+the CPU architecture names in subdirectories called
+
+    /usr/lib/platform/<arch>-<os>
+
+This is enough for regular Linux distributions. However, some
+distributions may use more specific platform names that refer to
+particular computer systems, like SBCs or specific CPU tuning when
+compiling.
+
+If the platform subdirectory does not exist in /usr/lib/platform
+then rpmbuild does not work.
+
+Allow creating such custom platform subdirectory with feeding
+the necessary data using external variables: RPM_CUSTOM_ARCH,
+RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
+and RPM_CUSTOM_CANONCOLOR
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6]
+
+---------
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Co-authored-by: Florian Festi <ffesti@redhat.com>
+---
+ INSTALL         | 37 +++++++++++++++++++++++++++++++++++++
+ installplatform |  9 ++++++++-
+ 2 files changed, 45 insertions(+), 1 deletion(-)
+
+diff --git a/INSTALL b/INSTALL
+index 13d0d8a83..5e035cf6a 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -148,6 +148,43 @@ and then install with:
+ 
+     make install
+ 
++
++By default, rpm installs a series of default platforms based on the CPU
++architecture names in subdirectories called
++
++    /usr/lib/platform/<arch>-<os>
++
++This is enough for many distributions. However, some distributions
++may use more specific platform names that refer to particular computer
++systems, like SBCs or specific CPU tuning when compiling. Examples of such
++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi_armv7",
++"raspberrypi_armv8", etc.
++
++If the platform name is put into /etc/rpm/platform, then rpmbuild uses it
++and the only macros file rpmbuild looks for is
++
++    /usr/lib/platform/`cat /etc/rpm/platform`-<os>/macros
++
++If this file does not exist, many rpm macros will not have their expected
++values set and e.g. %configure will fail when trying to run rpmbuild.
++
++To allow creating the macros file for such a custom platform, the shell
++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, the rest
++is ignored.
++
++    export RPM_CUSTOM_ARCH=genericx86_64
++    export RPM_CUSTOM_ISANAME=x86
++    export RPM_CUSTOM_ISABITS=64
++    export RPM_CUSTOM_CANONARCH=x86_64
++    export RPM_CUSTOM_CANONCOLOR=0 # to use /usr/lib for %_libdir
++    export RPM_CUSTOM_CANONCOLOR=3 # to use /usr/lib64 for %_libdir
++
++    make install 
++
++This also creates and installs the new platform file e.g.
++/usr/lib/platform/genericx86_64-linux/macros
++
++
+ Rpm comes with an automated self-test suite. The test-suite relies heavily
+ on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be executed
+ without it. Provided that fakechroot was found during configure,
+diff --git a/installplatform b/installplatform
+index a5ad7c5b8..59f57697b 100755
+--- a/installplatform
++++ b/installplatform
+@@ -11,7 +11,7 @@ VENDOR="${4}"
+ OS="${5}"
+ RPMRC_GNU="${6}"
+ 
+-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM_ARCH:+custom}; do
+   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
+   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
+   case $RPMRC_OPTFLAGS in
+@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
+   CANONCOLOR=
+   FILTER=cat
+   case "${ARCH}" in
++    custom)
++	ARCH=$RPM_CUSTOM_ARCH
++	ISANAME=$RPM_CUSTOM_ISANAME
++	ISABITS=$RPM_CUSTOM_ISABITS
++	CANONARCH=$RPM_CUSTOM_CANONARCH
++	CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
++    ;;
+     sparc64*) 
+ 	ISANAME=sparc
+ 	ISABITS=64
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 95a9e92f96..0b8ebebb51 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            file://fix-declaration.patch \
            file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
+           file://0001-Allow-setting-platform-macro-settings-externally-258.patch \
            "
 
 PE = "1"
@@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
 	EOF
 }
 
+def rpm_isaname(d):
+    import re
+    arch = d.getVar('TARGET_ARCH')
+    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
+        return "x86"
+    # Add more platform tweaks for ISANAME as needed
+    return arch
+
+# Add the custom BSP platform "macros" file
+do_install:prepend:class-target() {
+    export RPM_CUSTOM_ARCH="${MACHINE_ARCH}"
+    export RPM_CUSTOM_ISANAME="${@rpm_isaname(d)}"
+    export RPM_CUSTOM_ISABITS="${SITEINFO_BITS}"
+    export RPM_CUSTOM_CANONARCH="${TARGET_ARCH}"
+    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
+    export RPM_CUSTOM_CANONCOLOR="${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
+}
+
 # Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install:append:class-target() {
     rm -rf ${D}/var
 }
+
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
     # Ensure find-debuginfo is located correctly inside SDK
-- 
2.41.0


