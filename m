Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FD4F36B94
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:42 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145074.1775776293790314566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FTC1YCPS;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so9839875e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776292; x=1776381092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zotv0sVG2xdNQubgvj8WN++QpOSWag/mUgHyGkLX0Us=;
        b=FTC1YCPSJ93ehFtwEvcjmpmZQ05yrEGajCZruz3ipBzRapYc5DCUWC+ERLAZjCFj/j
         9IdqZkhDR+opOhrnMiByrIajE6VtsSe13Ww1b6dNavY7Gay3NyslTWIW1BtJiVbGRedl
         bg30tQiyrj619pXHjYpewOui/otyoNrPTNlok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776292; x=1776381092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zotv0sVG2xdNQubgvj8WN++QpOSWag/mUgHyGkLX0Us=;
        b=bcxHgzwBMGUkFqmSRHfiDZtIuy/inR+tjfnaCuD+YfHS6Q/TJP/huIUmlqgX8lY2FF
         8/xaoqHGX4eevGprmxtVFZnEuWl0B6KMaNcs2oEK7DaSDw/G4kiReRbbhWNrEqHErsWM
         L0fD0bmjdudwN9ahmmq6O/gyzG2V8w9qqAMALOA7yWnDGwXcobS+Wk+Zc5pVNGaMp8kQ
         EHoLMjlytlktA6uJKayiDIw2CaRLCTC0DHj9xKNqACIZLH7olh5tNZY/uNGgG7ROPSfY
         kb4f/9rYQOneYDC2HSJriQebXkD8EjMO7vSP9GX+vlcfFAcudqzNUzZh0iHJilmL8YAd
         9ouw==
X-Gm-Message-State: AOJu0YyWTNk03Wby/OCSqo9GMWYICRRKB+8SP73Mf0Wda+wpAjZvOcLS
	4ptpN3BOQF27lpIElO+aGb1/ng2bYWoeKrgEOYQQ1P53JcAkpDjN12GqkTUgeSSksxrSm4SdWHo
	eMbr6rhfKeoth
X-Gm-Gg: AeBDiesqOGpjf6KMZndAwZWGsm6+XHODmnsMLAqsJDVoJvaDVp3AzJAi2sMRpa5A33b
	88r14Uo1Z0eBxZw4AL/IYP/3OIY74VYnnz9U3hH3Gi7GK9Y7tFkxzGGvw9QTT+UV7mRkODWxUUk
	u9cJ1Nv2ocaAJZJX57nK+131UkPtFXZeMRK37RXX2siBleYFOAnUjwcqY/bF6ZyPbqAlJfUWDWw
	xpFfSHFxKkoI3t9k/6JfGrk3rouqM5fwUyEDnE1v2XULNgcFp5gTvDqg5/TSjI60vifupHptMfi
	E2TymNJz1WHHV3M0zQ2MRQ4aZyZCvVAV+ypR0kzyiQefVej/Y8QBg13jE/T/ncNX/vT7x9vivDF
	x5WyZmvVT3trVv1tnkfmB+tkq//pvPWtePOrvms4SYXcN0JJPooyEfnoHOzWHE9cX/Jg320lobY
	YXTWGOJvIOCbguAiPl04jTLIctCpIzltpY2482CSI2hdSilzpR46wg2aMNlab/e1dtbfO0gFXL0
	UmDK+Zqz4DN+aAcX5kipPY0ECQaqpcgVzI8AaE=
X-Received: by 2002:a05:600c:3150:b0:488:c80c:c236 with SMTP id 5b1f17b1804b1-488d68057f3mr8406605e9.5.1775776291675;
        Thu, 09 Apr 2026 16:11:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 19/30] recipes: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 01:10:19 +0200
Message-ID: <c1b208babae70244ab062b2e4674b0309fbd65e5.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234978

From: Yoann Congal <yoann.congal@smile.fr>

This corresponds to the master
commit 139102a73d41 ("recipes: Default to https git protocol where possible").
But only for the git.yoctoproject.org and git.openembedded.org repos.
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/fetch.py                     | 2 ++
 meta/lib/oeqa/selftest/cases/recipetool.py                | 8 ++++----
 meta/recipes-core/dbus-wait/dbus-wait_git.bb              | 2 +-
 meta/recipes-core/images/build-appliance-image_15.0.0.bb  | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                  | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb          | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb                | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb        | 2 +-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb     | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb    | 2 +-
 .../xcursor-transparent-theme_git.bb                      | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb              | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb          | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb          | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb        | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb        | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb             | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb             | 4 ++--
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb        | 2 +-
 .../recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb | 2 +-
 .../matchbox-keyboard/matchbox-keyboard_0.1.1.bb          | 2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb             | 2 +-
 .../matchbox-terminal/matchbox-terminal_0.2.bb            | 2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.2.bb        | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb  | 2 +-
 .../recipes-sato/settings-daemon/settings-daemon_0.0.2.bb | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb   | 2 +-
 28 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index be14272e635..b5c09355fee 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -34,6 +34,7 @@ PREMIRRORS:forcevariable = ""
         # No mirrors and broken git, should fail
         features = """
 DL_DIR = "%s"
+SRC_URI:pn-dbus-wait = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=git"
 GIT_PROXY_COMMAND = "false"
 MIRRORS:forcevariable = ""
 PREMIRRORS:forcevariable = ""
@@ -46,6 +47,7 @@ PREMIRRORS:forcevariable = ""
         # Broken git but a specific mirror
         features = """
 DL_DIR = "%s"
+SRC_URI:pn-dbus-wait = "git://git.yoctoproject.org/dbus-wait;branch=master;protocol=git"
 GIT_PROXY_COMMAND = "false"
 MIRRORS:forcevariable = "git://.*/.* http://downloads.yoctoproject.org/mirror/sources/"
 """ % dldir
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index a2d8d292ad5..adbf0c15f03 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -359,7 +359,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
+        srcuri = 'git://git.yoctoproject.org/libmatchbox;protocol=https'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
@@ -512,13 +512,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipetool_create_git('http://git.yoctoproject.org/git/matchbox-keyboard')
 
     def test_recipetool_create_git_srcuri_master(self):
-        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=master')
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=master;protocol=https')
 
     def test_recipetool_create_git_srcuri_branch(self):
-        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=matchbox-keyboard-0-1')
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=matchbox-keyboard-0-1;protocol=https')
 
     def test_recipetool_create_git_srcbranch(self):
-        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard', 'matchbox-keyboard-0-1')
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;protocol=https', 'matchbox-keyboard-0-1')
 
 
 class RecipetoolTests(RecipetoolBase):
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index f2eb8b1874e..63d3447875d 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 544fbea80fe..8595412e501 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -25,7 +25,7 @@ IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
 inherit core-image setuptools3
 
 SRCREV ?= "1aee6e9648661c1e6159127c2b6e4690576020f7"
-SRC_URI = "git://git.yoctoproject.org/poky;branch=kirkstone \
+SRC_URI = "git://git.yoctoproject.org/poky;protocol=https;branch=kirkstone \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 9532ed1534a..5420366d862 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "gdk-pixbuf-native"
 SRCREV = "44afb7506d43cca15582b4c5b90ba5580344d75d"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index ee491984293..6a86196f41f 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
-SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master"
+SRC_URI = "git://git.yoctoproject.org/update-rc.d;protocol=https;branch=master"
 SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
 
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 6ebe4f457ed..823d4f011be 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master \
+SRC_URI = "git://git.yoctoproject.org/pseudo;protocol=https;branch=master \
            file://fallback-passwd \
            file://fallback-group \
            "
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 5d94be52b4f..7db54c10988 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
 PV = "0.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index b01b332a55b..f195ea233f6 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 #SRCREV for 1.12
 SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 81704beac46..ce20283e6e8 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=https;branch=master \
            file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index 09fbc9b7983..1d04ad09746 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -10,7 +10,7 @@ SECTION = "x11/base"
 SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
 PV = "0.1.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 12f1cf516ee..3de1e7bae2a 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -16,7 +16,7 @@ PV = "0.3+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 do_configure() {
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 94800aeacac..d0549dabe5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -17,8 +17,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 KBRANCH = "v5.18/standard/base"
 KMETA = "kernel-meta"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 772fc4e2ef2..b9f1605cf9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -14,8 +14,8 @@ python () {
 SRCREV_machine ?= "c8a23ffc90611d97d4e0d8b05e5aa30db4795e87"
 SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "5.10.234"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ea763ce9aa1..7c8369cc874 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -14,8 +14,8 @@ python () {
 SRCREV_machine ?= "46e4e1200a4fa889438a2cc62151bb7f1057421a"
 SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "5.15.201"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index a78839e32e6..db6f9182db8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -21,8 +21,8 @@ SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5)$"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 56853f481fa..358e3bbed3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -19,8 +19,8 @@ SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index db911b29524..74ae0db1a93 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -26,8 +26,8 @@ SRCREV_machine:qemumips64 ?= "4bae0f4714f4afc50c02ea884ec8ba6026d2ec16"
 SRCREV_machine ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
 SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.10.234"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 176d17e5736..0a770c81b76 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -35,8 +35,8 @@ SRCREV_machine:class-devupstream ?= "3330a8d33e086f76608bb4e80a3dc569d04a8814"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.15.201"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index d951baf3610..9cb628c0ecc 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} = "settings-daemon"
 
 # SRCREV tagged 0.2
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index b05a9c48ad4..95b525c5cd6 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 
 # SRCREV tagged 2.2
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;protocol=https;branch=master \
            file://vfolders/ \
            "
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index b1724675bab..6243d16a522 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "libfakekey expat libxft"
 
 #SRCREV for 0.1.1
 SRCREV = "630d89068dc0a1e9199306d405cb32f892dfa4d3"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=matchbox-keyboard-0-1 \
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index 3dec68b9638..d43aeea07ab 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -23,7 +23,7 @@ RPROVIDES:${PN} = "matchbox-panel"
 RREPLACES:${PN} = "matchbox-panel"
 RCONFLICTS:${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            "
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 802ffa971bf..74e543b0b53 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -11,7 +11,7 @@ SECTION = "x11/utils"
 
 #SRCREV tagged 0.2
 SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index bc4024736f4..3a69ff847e5 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,7 +2,7 @@ require matchbox-theme-sato.inc
 
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index eea7025c8d4..1709ab460b7 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "matchbox-panel-2 gtk+3"
 
 # SRCREV tagged 0.3
 SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
-SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master"
+SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 4356930da0d..33625f928d5 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -9,7 +9,7 @@ SECTION = "x11"
 
 # SRCREV tagged 0.0.2
 SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master \
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;protocol=https;branch=master \
            file://addsoundkeys.patch \
            file://70settings-daemon.sh \
            "
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 5a1d3299930..0dea9d67cab 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master \
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;protocol=https;branch=master \
 "
 
 S = "${WORKDIR}/git"

