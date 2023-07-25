Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBA1C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 13:57:34 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.21006.1690293447759259515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 06:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B8dfpAgE;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fddd4e942eso8160690e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690293445; x=1690898245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxizJzEX/KHpxOp3UBF2bqT6Blraeq+bWCUbKXKrfzI=;
        b=B8dfpAgEI9LMu1Q6/r3xc9YEq66KAJH7LxoZcnWIy2hft4A4lMLsT/F79jCuT+GSfQ
         OoAY0xOn3gdDmnV612mIN/iHCVwb5x67clxet9eF6LEvF0uD/lYf+iLGWfTn6ompus1j
         YRaKQ1Rhk1YAVP2QvGFRdIfzSTs2zJu+rbu5BpcWY+VPbhinHkrmSzBuiOH1z7Tq+DC7
         MvBMvtSGzjhfSQhKCBleIlxzGZHyr2BCkCozewndhL0X06KE5oOGHaiwrGVKH0DJaGzk
         +19rvjlOnMhiVbGRrOWvYWa3ahd7wcd9v2M8oWz0obJQP+6Kl+D8Z8RQ40es8WDjLDkC
         Tm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690293445; x=1690898245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxizJzEX/KHpxOp3UBF2bqT6Blraeq+bWCUbKXKrfzI=;
        b=LhYakvIXx8vDEvSdy1UkDgGCY0p5GpeRv/DQ4Bo9rj9bGHk84QPXqyI0Sk8m606fn4
         DfXMLibjxjglZfWjVLBFRZ9iP5Sc4xSvf/3pSkd64gzTWkd0drIP7gndx1w/9zz3hw3X
         3HuJItWzBjLFzSWO2Z6onj6MKs+moAMeXYd2KFjvD0IaTRypuppOEJElBE6uw/ryntGe
         28TFXN4T4vs2THKSf2hqshTT+n2Fdj8gSc+5U0MfR+vQGqvvYNj+oEvqmI2yOIKFaSw1
         jYTDi95Ufp+HJ4qnoh/6e9je+8iRI6Svi/ZEwhUQFeX53xwjK8vHCFLhwwZSwqrLxzmD
         7d4w==
X-Gm-Message-State: ABy/qLb0r3L84rXofn78zsJN6iXu8bLhwKxqhELJ6GRcsR2E24ExrVJE
	7kLax3/gXLVGx9J4MK1ctiOTUS6WJ+l+/Q==
X-Google-Smtp-Source: APBJJlEnaJ6LvzWR5/2vhJaby6+SSi/6K2YyBV8UOtPw4Xl5vFoIpZPkc5WE2r3jsdnObkfv5atS0g==
X-Received: by 2002:ac2:4d96:0:b0:4f9:5426:6622 with SMTP id g22-20020ac24d96000000b004f954266622mr7350647lfe.69.1690293445270;
        Tue, 25 Jul 2023 06:57:25 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i25-20020a17090671d900b009937dbabbdasm8111462ejk.217.2023.07.25.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 06:57:25 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] rpm: Allow setting platform macro settings externally
Date: Tue, 25 Jul 2023 15:57:19 +0200
Message-ID: <20230725135719.388231-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184844

Feed platform settings to installplatform externally. Based on the patch
submitted under https://github.com/rpm-software-management/rpm/pull/2579

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...ng-plaform-macro-settings-externally.patch | 56 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       | 17 ++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
new file mode 100644
index 0000000000..8b3220f114
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
@@ -0,0 +1,56 @@
+From 320f4f3861dad70342f065004311eac143d6522d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Tue, 25 Jul 2023 10:56:44 +0200
+Subject: [PATCH] Allow setting plaform macro settings externally
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Yocto has their own way to set the platform names via BSPs
+(Board Support Packages). These names are more specific than
+basic CPU architectures, and such a platform name ends up in
+/etc/rpm/platform but the corresponding subdirectory under
+/usr/lib/rpm/platform does not exist.
+
+Allow creating such custom platform subdirectory with feeding
+the necessary data using external variables: RPM_CUSTOM_ARCH,
+RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
+and RPM_CUSTOM_CANONCOLOR
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2579]
+---
+ installplatform | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
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
index 95a9e92f96..bc036fc843 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            file://fix-declaration.patch \
            file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
+           file://0001-Allow-setting-plaform-macro-settings-externally.patch \
            "
 
 PE = "1"
@@ -103,6 +104,21 @@ WRAPPER_TOOLS = " \
    ${libdir}/rpm/rpmdeps \
 "
 
+def rpm_isaname(d):
+    import re
+    arch = d.getVar('TARGET_ARCH')
+    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
+        return "x86"
+    # Add more platform tweaks for ISANAME as needed
+    return arch
+
+export RPM_CUSTOM_ARCH = "${MACHINE_ARCH}"
+export RPM_CUSTOM_ISANAME = "${@rpm_isaname(d)}"
+export RPM_CUSTOM_ISABITS = "${SITEINFO_BITS}"
+export RPM_CUSTOM_CANONARCH = "${TARGET_ARCH}"
+# CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
+export RPM_CUSTOM_CANONCOLOR = "${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
+
 do_configure:prepend() {
         mkdir -p ${S}/build-aux
 }
@@ -132,6 +148,7 @@ do_install:append:class-nativesdk() {
 do_install:append:class-target() {
     rm -rf ${D}/var
 }
+
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
     # Ensure find-debuginfo is located correctly inside SDK
-- 
2.41.0


