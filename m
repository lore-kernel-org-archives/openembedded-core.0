Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AE5C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 08:21:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.2953.1690791703496322941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 01:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=O1gcyJgc;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52229f084beso6690226a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 01:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690791701; x=1691396501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZANnsgKRvE/IloWyH6wkA699H8p0tcNjnjVgy5bpamg=;
        b=O1gcyJgcLOnTNh+kFoPC/8w6MfmNIP9YFRD1o8xqsJsw0xc79TiCFx8AT+DWabzikH
         auSGblPnU9XQt7wY4TPpPaaqe+R1+OFSxUIXETQWG8Ln8isbXp/zf4fRSbD1nER792Lx
         oHQEwn2BxHshHgdrTP8GTmiV6cAJPWRyPQ/LNJ6ymAZwGTUepx8yW6oIYDmRcLrUCy3L
         bzY2p3KMv7/GDn8igfg/vezIpJeisaA7LSS6V8fz3X6WftL8QBhTkQqSoxnXST9f7ORM
         O+zSn46NHsmPKvUqpjsFDaEKrVWuevQO88F0doxiGqzy0kMr1JrYZ2cyEImTpU4OhP2m
         4h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690791701; x=1691396501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZANnsgKRvE/IloWyH6wkA699H8p0tcNjnjVgy5bpamg=;
        b=UWglFklwDDP/SIBvEgnlX2cfTzgp09SPp6avbk6LIVYBe6aEsvlEYA1+H3tqEhkXz1
         CAy85fCP82Zm8oTolmmtYLYAFZCcNfNgjetRYZ9pjYVd0SjuArowYEweeMId4447FqVj
         TIhE/iV5lGVQm2hnF4EwzhwOHqQ9qsF1/ETBmzg44Dw1wvPnZxaqo8wSJIJbT4hp3BvF
         AXHw6yXIJaQU1WRScAhI8wpDsN8t1h+7C9CgZi4wGxHXXZ40vhQXI7jcWC1R6o6dNl9L
         V90A5xZ3PMebKJQBghwvQQDRdfBcAwrbj/hnrDv9RzLnxA2bDFddI/DUao1L/XThh2NY
         a+Lg==
X-Gm-Message-State: ABy/qLZUCgypClq5Dl4+1JUfVV4D3WqfxSfGtvsj4EqFyF9ubh4EpCIC
	TutLA3Hilb4wLGC+AZm61tF2eZRz5y+BawsB
X-Google-Smtp-Source: APBJJlG2O8Xro+0hk2MhwcQfrLW44/iz9gAbnskDfuNp2kAms6I6Mh45exRVj5X4h5zItkQLd9gdaw==
X-Received: by 2002:aa7:c554:0:b0:522:40dd:74f3 with SMTP id s20-20020aa7c554000000b0052240dd74f3mr9125948edr.39.1690791701347;
        Mon, 31 Jul 2023 01:21:41 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id b23-20020aa7df97000000b00522d742bc4bsm13406edy.62.2023.07.31.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:21:41 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v5] rpm: Allow setting platform macro settings externally
Date: Mon, 31 Jul 2023 10:21:38 +0200
Message-ID: <20230731082138.92309-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 08:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185126

Feed platform settings to installplatform externally. Based on the patch
submitted under https://github.com/rpm-software-management/rpm/pull/2585

Patch against INSTALL was backported for rpm 4.18.1

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...atform-macro-settings-externally-258.patch | 118 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
new file mode 100644
index 0000000000..f4c3630b8c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
@@ -0,0 +1,118 @@
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


