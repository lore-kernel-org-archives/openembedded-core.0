Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id D792B719B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 14:34:51 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id l9so1711146wre.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2W8gMQs5PsmMMZ0gfEJds2CIjNdKzswVCWV8oIUKHy0=;
	b=wx3drG4FBDnKmTCMv7hGQQpYb2oKb+NQ62xfuL5bSMfbJiLrst8QfrvbufkyzGjLU/
	WEf5OX1p1gr7RCWaw5JWCOSKzG4onustY/0c3UYwYyqbbJ9V3Gc8YH0PTXkXvEvfL4HY
	gLG2M8R/t7N9vOa/nx53ZN0Tg2BAci8CBV5NBfwm+iomuT78+EGNL3cp65nz+zz/s6bX
	ERE23lJIWolvWTBfWir4949nrGnGmqDe6DOHGypycPwAwhvXyIfeISRPNU9FYWquLm2N
	UFoMs/7cuSTN0PrP7f+kVRsJvC/6xvwUMnp5swcPfVSGqivz+D3R3ezl1huRVG7MZy5z
	GHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2W8gMQs5PsmMMZ0gfEJds2CIjNdKzswVCWV8oIUKHy0=;
	b=HJZF6QoQ/2CdfAV4jkjLu615/jt0151t29TR53RUHWu376ZuOCPgHquvCXR7+Jukw2
	7aYS3wVPmxHLVK7f+SRg7bI18cpJwng5NPlf8U01MFe/Wh8pWqjfAMVHVNlTfF5uXybM
	tN59gRv9lFA5ynq0phsROByawD3YB0w/IUXmcz0kG97src795+t53eusuW7Hz/6exzIj
	FY0ra1FGiF6niB6tT9aXyP2tWMt1llxBH44nmhB4gZVQRgjgr4Z2xRKdv2u9CU4nCq80
	jGPgJA8E3Tg8/itQ4TCFm5f4gKuBBQgzlqBl6IZ3qCWYGqgzXtuCF7hQUH1EDVLwFBg2
	mXBA==
X-Gm-Message-State: AODbwcDhfixdgFFrpAXWM/M5091N5nh4M9HtOyS8XlXibPzAe7WCC4PZ
	ORUh0ylqVupExdi+NnI=
X-Received: by 10.28.113.73 with SMTP id m70mr385178wmc.12.1494340491828;
	Tue, 09 May 2017 07:34:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 8sm50592wrb.55.2017.05.09.07.34.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 May 2017 07:34:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 15:34:48 +0100
Message-Id: <1494340488-19285-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] kconfig-frontends: fix build race
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 14:34:52 -0000

In parallel builds utils/kconfig-tweak may be written to before utils/ exists,
so add a mkdir.

Also mark the pkgconfig patch as Submitted as I sent that upstream at the same
time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/0001-Fix-installation-of-.pc-files.patch |  3 +-
 .../kconfig-frontends/files/missing-mkdir.patch    | 33 ++++++++++++++++++++++
 .../kconfig-frontends_4.10.0.1.bb                  |  3 +-
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch

diff --git a/meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch b/meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
index e9195a0..57ea42e 100644
--- a/meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
+++ b/meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Fix installation of .pc files
 
 They go to prefix/pkgconfig/, not prefix/pkg-config.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Makefile.am | 2 +-
@@ -26,4 +26,3 @@ index 058690a..f9e9b7b 100644
  EXTRA_DIST += libs/parser/kconfig-parser.pc.in
 -- 
 2.11.0
-
diff --git a/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch b/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
new file mode 100644
index 0000000..a06a547
--- /dev/null
+++ b/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ca05ee2fb6db5b3b1edc16dba6150a2c6078a6cf Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 May 2017 15:30:00 +0100
+Subject: [PATCH] Makefile: ensure utils/ exists before writing to it
+
+Since utils/ was changed to not build recursively it's possible that in
+out-of-tree builds the utils/ directory hasn't been created when Make runs the
+utils/kconfig-tweak target which tries to write to file inside utils/.
+
+To ensure this can work, mkdir the directory.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index c8e96ef..1baa110 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -348,6 +348,7 @@ EXTRA_DIST += \
+ 	utils/kconfig-tweak.in.patch
+ 
+ utils/kconfig-tweak: utils/kconfig-tweak.in
++	$(MKDIR_P) $(@D)
+ 	$(AM_V_GEN)$(SED) -e "s/@CONFIG_@/$(config_prefix)/g" \
+ 		$< >$@
+ 	@chmod +x $@
+-- 
+2.8.1
diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
index be90d6b..d427e98 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
@@ -15,7 +15,8 @@ DEPENDS += "ncurses flex bison gperf-native"
 RDEPENDS_${PN} += "python3 bash"
 SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.10.x \
            file://0001-Fix-installation-of-.pc-files.patch \
-           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch"
+           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch \
+           file://missing-mkdir.patch"
 
 SRCREV = "f8ffe5e1c6f183cb7d5d515aa9381b7557de654e"
 
-- 
2.8.1


