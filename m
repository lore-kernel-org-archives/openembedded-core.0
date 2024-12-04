Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00222E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.8174.1733295006256955962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TkPmi5B+;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385de9f789cso3580248f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733295005; x=1733899805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gskaSPLZsGkEsIGnc6w8IluRXZah5edwFuvuguPPiKQ=;
        b=TkPmi5B+dCw22o6JQ3L5MkbIhblnJzJ8JWt3MndHiQMnuNvWfh2N816hYeHH3Mny6o
         RrawKQrh1RjI+G+TG2DXf2ztjoeKNvXqrNWWTeNADub5POr0onoClbG1aYyMh5TYZqKG
         lOZ8fg7mbceyfAd6wX3VCgdNGiG65tP4Lf6JjWNirpB7CBO3lyishERKTRd7ak4rWCjw
         aDDQrZc14rxnRBwU86H+JBi5VKzyc64yZ0EgR2sSg9tMoR0SV/u/msKLULw5fkKdbudd
         /6aYJAjnXNiLmj/1AFvMpuYdsxAjLl8cWAdF5B7oZSyijG91ksAXp4kVxI6tL/Ues76k
         UdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733295005; x=1733899805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gskaSPLZsGkEsIGnc6w8IluRXZah5edwFuvuguPPiKQ=;
        b=azVCwl+KVWamTt126Gzrqu0nlK83yf7mZGeekcXrrTOv+2eP3aojhKn2VcHmfcJ+WE
         8U1D0UDK1Am123ggWNwXI1pjpE3uN96ER5XcDLE3OqRFMu+L+wT3PDn1IgKGlx8D0E2B
         Mfeu6ECjVPFirBXrJ3hNfjH0JjXmzo+pU4Cz+BZnkzEnMUsk3mQzIUBvR/X1MP6rPu+J
         78atF4tAY7NRhrXkMD+QhJCS7qM/NYykhUwGU4q9eOp5IfWkxaHRp7jtTRV6r7My3wQ9
         gF+u++n/uNADlFsWIeXofingZE3vVq+CDarMkmcXR1TIH+h2+PELja9IOtXnp//w9Bvj
         4Ykw==
X-Gm-Message-State: AOJu0YwBS6JoKmqDbKxNgp1KYbsxx9wlsa73k0QRzI4OUEb6P2zwi2ZT
	Qpu+KBdX+AyCpxGO7HE7gz7dpgL3vz5zGy8aRF6AzQXHrYidCwq9wqmuXA==
X-Gm-Gg: ASbGnctRxiYDdg9ip8Q/NaZZEf6LR2v3eNRJpnJyHbNH+t0ABMlfgcZx2rNt9P+XQCw
	4pm10hW0dXaDJkszUhBED5JcjTYmTCKxw/ImN5SDovdWTsB9H43aFtMVmKGiNcnVLTqp2S2A3jX
	7U4U6Zkd+Ya/zIieKXXbRhojVIC+nxu0noK8KodzExuy4XB13aV2sDDBPZ/Jg4T9S5o0einfn7G
	qV9olE5SMM2aUSmtNVLRzE58PdKDHBRdcM2hXsMPtd89J89mNxHltfi9/v9v8iiVQinvvq4mNj9
	BEL5xB/oAlo=
X-Google-Smtp-Source: AGHT+IHFbpjbhdaZB6BroftvhZ6ep2+MB36y3ri2zCLm0mFdJD4OVX8oc8jJud62sIACtwezAgSVng==
X-Received: by 2002:a05:6000:23c7:b0:385:fc00:f5da with SMTP id ffacd0b85a97d-385fd3ed7d6mr3460107f8f.27.1733295004350;
        Tue, 03 Dec 2024 22:50:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:50:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/37] rpm: update 4.19.1.1 -> 4.20.0
Date: Wed,  4 Dec 2024 07:49:19 +0100
Message-Id: <20241204064920.817016-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208265

From: Alexander Kanavin <alex@linutronix.de>

With this release, as expected, deprecated openpgp support
has been fully removed and replaced with sequoia:
https://github.com/rpm-software-management/rpm-sequoia/

Alas, it's written in rust, and has no recipe, so for now
signing rpm packages has to be disabled.

Remove package name parameter to %prep in source archiving, as it's
been dropped in the new rpm, and wasn't needed to begin with.

Drop 0001-perl-disable-auto-reqs.patch
(files removed upstream).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass       |  2 +-
 meta/lib/oeqa/selftest/cases/signing.py       |  1 +
 ...olor-setting-for-mips64_n32-binaries.patch | 10 ++---
 ...ook-for-lua-with-pkg-config-rather-t.patch | 10 ++---
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |  9 ++---
 ...satisfiable-dependency-when-building.patch |  6 +--
 ...lib-rpm-as-the-installation-path-for.patch | 18 ++++-----
 ...1-Do-not-read-config-files-from-HOME.patch | 20 +++++-----
 ...-PATH-environment-variable-before-ru.patch |  6 +--
 ...lling-execute-package-scriptlets-wit.patch |  8 ++--
 ...not-insert-payloadflags-into-.rpm-me.patch |  4 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |  4 +-
 .../files/0001-perl-disable-auto-reqs.patch   | 39 -------------------
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 32 +++++++--------
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |  4 +-
 ...ge-logging-level-around-scriptlets-t.patch | 12 +++---
 .../rpm/{rpm_4.19.1.1.bb => rpm_4.20.0.bb}    | 11 +++---
 17 files changed, 77 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
 rename meta/recipes-devtools/rpm/{rpm_4.19.1.1.bb => rpm_4.20.0.bb} (95%)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index a3be823c9d8..3579d0d695f 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -104,7 +104,7 @@ python write_specfile () {
     # append information for logs and patches to %prep
     def add_prep(d, spec_files_bottom):
         if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
-            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN'))
+            spec_files_bottom.append('%%prep')
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 18cce0ba258..51d1c3fa641 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,6 +71,7 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
+        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index 25aa69d7daa..769d7b34098 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -1,4 +1,4 @@
-From f4cf90b5a298d6a3199e8b4c07f520aaf593ce2b Mon Sep 17 00:00:00 2001
+From 38e38437e83ed961dc1fa6d5b534bbdaae5b535e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Mar 2017 18:54:02 +0200
 Subject: [PATCH] Add a color setting for mips64_n32 binaries
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 6 insertions(+)
 
 diff --git a/build/rpmfc.c b/build/rpmfc.c
-index 4b67a9bae..ed7e4e623 100644
+index 86dd36d14..df421a23f 100644
 --- a/build/rpmfc.c
 +++ b/build/rpmfc.c
-@@ -660,6 +660,7 @@ exit:
+@@ -716,6 +716,7 @@ static int rpmfcHelper(rpmfc fc, int *fnx, int nfn, const char *proto,
  static const struct rpmfcTokens_s rpmfcTokens[] = {
    { "directory",		RPMFC_INCLUDE },
  
@@ -22,8 +22,8 @@ index 4b67a9bae..ed7e4e623 100644
    { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
    { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
  
-@@ -1158,6 +1159,9 @@ static uint32_t getElfColor(const char *fn)
- 		color = RPMFC_ELF32;
+@@ -1258,6 +1259,9 @@ static uint32_t getElfColor(const char *fn)
+ 		color = 0;
  		break;
  	    }
 +            if (ehdr.e_machine == EM_MIPS || ehdr.e_machine == EM_MIPS_RS3_LE)
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
index e4edc884b1e..83552dd5c21 100644
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
@@ -1,4 +1,4 @@
-From c39a074ff3c4d21c100d387661c7d725b5eae7b0 Mon Sep 17 00:00:00 2001
+From 99d02b8e8ce2c93c10a7924cd7571b76b0f45eb1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 29 Nov 2023 14:06:15 +0100
 Subject: [PATCH] CMakeLists.txt: look for lua with pkg-config rather than
@@ -13,15 +13,15 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4a383ceba..ed847c09a 100644
+index 9a3aba071..08dabffd3 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -190,7 +190,7 @@ set(REQFUNCS
+@@ -196,7 +196,7 @@ set(REQFUNCS
  )
  
  find_package(PkgConfig REQUIRED)
 -find_package(Lua 5.2 REQUIRED)
 +pkg_check_modules(LUA REQUIRED IMPORTED_TARGET lua>=5.2)
  find_package(ZLIB REQUIRED)
- find_package(BZip2)
- find_package(Iconv)
+ if (WITH_BZIP2)
+     find_package(BZip2 REQUIRED)
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
index 1bd83e7befb..7db643871f7 100644
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
@@ -1,4 +1,4 @@
-From fea9cea49aa0844de14126e54d05b91ba619427f Mon Sep 17 00:00:00 2001
+From cb5355da9b47166253dbe5ab3215e433b55068d1 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 26 Jul 2024 17:18:30 +0800
 Subject: [PATCH] CMakeLists.txt: set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} in
@@ -36,10 +36,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ed847c09a1..385b5040c6 100644
+index 08dabffd3..1b7661139 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -84,7 +84,7 @@ function(makemacros)
+@@ -96,7 +96,7 @@ function(makemacros)
  	set(sysconfdir "${CMAKE_INSTALL_FULL_SYSCONFDIR}")
  	set(sharedstatedir "${CMAKE_INSTALL_FULL_SHAREDSTATEDIR}")
  	set(localstatedir "${CMAKE_INSTALL_FULL_LOCALSTATEDIR}")
@@ -48,6 +48,3 @@ index ed847c09a1..385b5040c6 100644
  	set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
  	set(oldincludedir "${CMAKE_INSTALL_FULL_OLDINCLUDEDIR}")
  	set(infodir "\${prefix}/${CMAKE_INSTALL_INFODIR}")
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
index d0ed7110866..96a5e14999a 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
@@ -1,4 +1,4 @@
-From 86e585cc0dd06dfa20f584af8b59d52a59accb45 Mon Sep 17 00:00:00 2001
+From dc40261464de1a1799704967906f5bd113b53793 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 9 Jan 2017 18:52:11 +0200
 Subject: [PATCH] Do not add an unsatisfiable dependency when building rpms in
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/build/pack.c b/build/pack.c
-index f7dac6d9a..f382c7da0 100644
+index eb9c7b3f1..fb1f1bed8 100644
 --- a/build/pack.c
 +++ b/build/pack.c
-@@ -711,10 +711,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+@@ -712,10 +712,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
  	headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
      }
  
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index b571a0ae8c8..6a44f4f22d9 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 73d6841d9ef2a8ac7bd63f9645a3efe8038dfdd4 Mon Sep 17 00:00:00 2001
+From 651310691a8a41ab3a766545c53b69e6e0c4f88d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -12,24 +12,24 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7808115c1..4a383ceba 100644
+index de0b578a6..9a3aba071 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -33,7 +33,7 @@ option(WITH_IMAEVM "Build with IMA support" OFF)
- option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
- option(WITH_READLINE "Build with readline support" ON)
+@@ -41,7 +41,7 @@ option(WITH_LIBELF "Build with libelf support" ON)
+ option(WITH_LIBLZMA "Build with liblzma support" ON)
+ option(WITH_DOXYGEN "Build API docs with doxygen" OFF)
  
 -set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/lib/rpm" CACHE PATH "rpm home")
 +set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
+ set(RPM_MACROSDIR "${RPM_CONFIGDIR}/macros.d")
  set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
  
- # Emulate libtool versioning. Before a public release:
 diff --git a/macros.in b/macros.in
-index b49ffaad4..3acbe78f6 100644
+index 4d3e8afdc..66e31320f 100644
 --- a/macros.in
 +++ b/macros.in
-@@ -969,7 +969,7 @@ Supplements:   (%{name} = %{version}-%{release} and langpacks-%{1})\
- %_sharedstatedir	%{_prefix}/com
+@@ -964,7 +964,7 @@ Supplements:   (%{name} = %{version}-%{release} and langpacks-%{1})\
+ %_sharedstatedir	%{_var}/lib
  %_localstatedir		%{_prefix}/var
  %_lib			lib
 -%_libdir		%{_exec_prefix}/%{_lib}
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
index 796088df539..bfc9a74b6ca 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
@@ -1,4 +1,4 @@
-From e210458d125793915abce30420d866a30305c37a Mon Sep 17 00:00:00 2001
+From 874679725c443e5d73e3a33d1158ab25442c8a5f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Jan 2017 14:11:30 +0200
 Subject: [PATCH] Do not read config files from $HOME
@@ -10,26 +10,26 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index 9437a0ff1..483585ae4 100644
+index 5d778b8b7..dc8d42aeb 100644
 --- a/lib/rpmrc.c
 +++ b/lib/rpmrc.c
-@@ -459,8 +459,7 @@ static void setDefaults(void)
+@@ -485,8 +485,7 @@ static void setDefaults(void)
      if (!defrcfiles) {
  	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
  				confdir, "/" RPM_VENDOR "/rpmrc", ":",
 -				SYSCONFDIR "/rpmrc", ":",
--			  	"~/.rpmrc", NULL);
+-				userrc, NULL);
 +				SYSCONFDIR "/rpmrc", NULL);
      }
  
- #ifndef MACROFILES
-@@ -472,8 +471,7 @@ static void setDefaults(void)
-   				confdir, "/" RPM_VENDOR "/macros", ":",
+     /* macrofiles may be pre-set from --macros */
+@@ -498,8 +497,7 @@ static void setDefaults(void)
+ 				confdir, "/" RPM_VENDOR "/macros", ":",
  				SYSCONFDIR "/rpm/macros.*", ":",
  				SYSCONFDIR "/rpm/macros", ":",
 -				SYSCONFDIR "/rpm/%{_target}/macros", ":",
--				"~/.rpmmacros", NULL);
+-				usermacros, NULL);
 +				SYSCONFDIR "/rpm/%{_target}/macros", NULL);
      }
- #else
-     macrofiles = MACROFILES;
+ 
+     free(usermacros);
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index 328fbf86ac1..d3263896efd 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -1,4 +1,4 @@
-From a8fe7a7a2e41c9f127ed26407d57076babcb89e8 Mon Sep 17 00:00:00 2001
+From 4cf76bb57d3480420e734da99a5c839ac3a9976a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Jan 2017 13:32:06 +0200
 Subject: [PATCH] Do not reset the PATH environment variable before running
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 57689bb68..7b7e26606 100644
+index 060fd8124..4dc6466a8 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -252,7 +252,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+@@ -251,7 +251,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
  	if (ipath && ipath[5] != '%')
  	    path = ipath;
  
diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index e4251a1a73a..fc6d7e0d29b 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -1,4 +1,4 @@
-From 34c0d3263f3e0b366a2320e0823f46673f7ba928 Mon Sep 17 00:00:00 2001
+From 3603cf181b69ab1e0077dcd8a124e669dcb9dd9c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 17 Jan 2017 14:07:17 +0200
 Subject: [PATCH] When cross-installing, execute package scriptlets without
@@ -29,10 +29,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 3f6313278..57689bb68 100644
+index 097c9055a..060fd8124 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -448,8 +448,7 @@ exit:
+@@ -447,8 +447,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
      if (fn) {
@@ -42,7 +42,7 @@ index 3f6313278..57689bb68 100644
  	free(fn);
      }
      free(mline);
-@@ -483,7 +482,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -482,7 +481,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
index 2f6397aa8a3..0c29e5543ad 100644
--- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
+++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
@@ -1,4 +1,4 @@
-From ae4fdd8e8d052835973e6ff4b7550f93bde30a98 Mon Sep 17 00:00:00 2001
+From e688eb54fd54d65181e94b854b3568d99cbf3a24 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 31 Aug 2021 10:37:05 +0200
 Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm metadata
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/build/pack.c b/build/pack.c
-index f382c7da0..0889dd993 100644
+index fb1f1bed8..45885a6ac 100644
 --- a/build/pack.c
 +++ b/build/pack.c
 @@ -330,7 +330,7 @@ static char *getIOFlags(Package pkg)
diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
index 98e52da3a89..7d443ccc6c2 100644
--- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
+++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
@@ -1,4 +1,4 @@
-From b04ecb793a3c859985eead5e261785b27a4c4a20 Mon Sep 17 00:00:00 2001
+From ad530868e37f09e9236c085d25a834304750704b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 7 May 2020 17:40:58 +0800
 Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
@@ -32,7 +32,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/lib/transaction.c b/lib/transaction.c
-index 70d2587ac..b89b30060 100644
+index 5e4414d2a..b1c55bd44 100644
 --- a/lib/transaction.c
 +++ b/lib/transaction.c
 @@ -400,7 +400,18 @@ static int handleColorConflict(rpmts ts,
diff --git a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
deleted file mode 100644
index 55108e7f1ce..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 58bf006646a063837c46b695f7e7ebb69bee7238 Mon Sep 17 00:00:00 2001
-From: Mark Hatle <mark.hatle@windriver.com>
-Date: Tue, 15 Aug 2017 16:41:57 -0500
-Subject: [PATCH] perl: disable auto requires
-
-When generating automatic requirements, it's possible for perl scripts to
-declare 'optional' dependencies.  These seem to often be incorrect and will
-cause installation failures in OE.  Instead of fixing the perl scripts, it
-was decided it is better to simply disable the automatic dependency
-generation.  This matches the behavior from the previous RPM5 implementation.
-
-Upstream-Status: Inappropriate [OE specific configuration]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- fileattrs/perl.attr    | 2 +-
- fileattrs/perllib.attr | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/fileattrs/perl.attr b/fileattrs/perl.attr
-index 0daef58d5..81ddf5305 100644
---- a/fileattrs/perl.attr
-+++ b/fileattrs/perl.attr
-@@ -1,3 +1,3 @@
--%__perl_requires	%{_rpmconfigdir}/perl.req
-+#__perl_requires	%{_rpmconfigdir}/perl.req
- %__perl_magic		^.*[Pp]erl .*$
- %__perl_flags		exeonly
-diff --git a/fileattrs/perllib.attr b/fileattrs/perllib.attr
-index fcad48099..495a28927 100644
---- a/fileattrs/perllib.attr
-+++ b/fileattrs/perllib.attr
-@@ -1,5 +1,5 @@
- %__perllib_provides	%{_rpmconfigdir}/perl.prov
--%__perllib_requires	%{_rpmconfigdir}/perl.req
-+#__perllib_requires	%{_rpmconfigdir}/perl.req
- %__perllib_magic	^Perl[[:digit:]] module source.*
- %__perllib_path		\\.pm$
- %__perllib_flags	magic_and_path
diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
index c5caa7dc5e5..082fb343c29 100644
--- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
@@ -1,4 +1,4 @@
-From d7143dc4e75c8bcc5cc4c852a4b972942b7e4d07 Mon Sep 17 00:00:00 2001
+From 7cc1c8cfcc620dec284204be0ae4416fd9fed95d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Jan 2017 13:33:05 +0200
 Subject: [PATCH] Add support for prefixing /etc from RPM_ETCCONFIGDIR
@@ -10,21 +10,21 @@ from target rootfs instead of its own native sysroot.
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- lib/rpmrc.c | 19 ++++++++++++++-----
- 1 file changed, 14 insertions(+), 5 deletions(-)
+ lib/rpmrc.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
 
 diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index 483585ae4..ea858c290 100644
+index dc8d42aeb..3f2996850 100644
 --- a/lib/rpmrc.c
 +++ b/lib/rpmrc.c
-@@ -456,10 +456,14 @@ const char * lookupInDefaultTable(const char * name,
- static void setDefaults(void)
- {
-     const char *confdir = rpmConfigDir();
+@@ -481,11 +481,14 @@ static void setDefaults(void)
+ 	    userrc = xstrdup(oldrc);
+ 	}
+     }
 +    const char *etcconfdir = getenv("RPM_ETCCONFIGDIR");
 +    if (etcconfdir == NULL)
 +        etcconfdir = "";
-+
+ 
      if (!defrcfiles) {
  	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
  				confdir, "/" RPM_VENDOR "/rpmrc", ":",
@@ -32,11 +32,11 @@ index 483585ae4..ea858c290 100644
 +				etcconfdir, SYSCONFDIR "/rpmrc", NULL);
      }
  
- #ifndef MACROFILES
-@@ -469,9 +473,9 @@ static void setDefaults(void)
+     /* macrofiles may be pre-set from --macros */
+@@ -495,9 +498,9 @@ static void setDefaults(void)
  				confdir, "/platform/%{_target}/macros", ":",
  				confdir, "/fileattrs/*.attr", ":",
-   				confdir, "/" RPM_VENDOR "/macros", ":",
+ 				confdir, "/" RPM_VENDOR "/macros", ":",
 -				SYSCONFDIR "/rpm/macros.*", ":",
 -				SYSCONFDIR "/rpm/macros", ":",
 -				SYSCONFDIR "/rpm/%{_target}/macros", NULL);
@@ -44,9 +44,9 @@ index 483585ae4..ea858c290 100644
 +				etcconfdir, SYSCONFDIR "/rpm/macros", ":",
 +				etcconfdir, SYSCONFDIR "/rpm/%{_target}/macros", NULL);
      }
- #else
-     macrofiles = MACROFILES;
-@@ -1115,7 +1119,11 @@ static void read_auxv(void)
+ 
+     free(usermacros);
+@@ -1142,7 +1145,11 @@ static void read_auxv(void)
   */
  static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  {
@@ -59,7 +59,7 @@ index 483585ae4..ea858c290 100644
      static struct utsname un;
      char * chptr;
      canonEntry canon;
-@@ -1435,6 +1443,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
+@@ -1462,6 +1469,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  
      if (arch) *arch = un.machine;
      if (os) *os = un.sysname;
diff --git a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
index 23dce300862..00fe19108e8 100644
--- a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
@@ -1,4 +1,4 @@
-From 29c2a0c18b0c773128bf62c611b4c53fe4471105 Mon Sep 17 00:00:00 2001
+From d8972ff7fa0a30e199144ba135223bf561874e01 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 16 Jan 2024 09:59:26 +0100
 Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if undefined by C
@@ -16,7 +16,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
-index 243568766..43c27074a 100644
+index eb439cad8..1eef0b851 100644
 --- a/rpmio/rpmglob.c
 +++ b/rpmio/rpmglob.c
 @@ -33,6 +33,12 @@
diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
index 732202c46f6..278fa38bade 100644
--- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
+++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
@@ -1,4 +1,4 @@
-From f01d9c24bb86bc47ad2453483518dbb25953cac7 Mon Sep 17 00:00:00 2001
+From 452b696ea3e1975ea30cf7a92678aa4b316e6300 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Jan 2019 18:14:18 +0100
 Subject: [PATCH] rpmscript.c: change logging level around scriptlets to INFO
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 7b7e26606..1dcd23be5 100644
+index 4dc6466a8..6d3c19d01 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -291,7 +291,7 @@ static char * writeScript(const char *cmd, const char *script)
+@@ -290,7 +290,7 @@ static char * writeScript(const char *cmd, const char *script)
      if (Ferror(fd))
  	goto exit;
  
@@ -26,7 +26,7 @@ index 7b7e26606..1dcd23be5 100644
  	static const char set_x[] = "set -x\n";
  	/* Assume failures will be caught by the write below */
  	Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
-@@ -323,7 +323,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+@@ -322,7 +322,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
      char *mline = NULL;
      rpmRC rc = RPMRC_FAIL;
  
@@ -35,7 +35,7 @@ index 7b7e26606..1dcd23be5 100644
  
      if (script) {
  	fn = writeScript(*argvp[0], script);
-@@ -375,7 +375,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+@@ -374,7 +374,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
  		sname, strerror(errno));
  	goto exit;
      } else if (pid == 0) {/* Child */
@@ -44,7 +44,7 @@ index 7b7e26606..1dcd23be5 100644
  	       sname, *argvp[0], (unsigned)getpid());
  
  	fclose(in);
-@@ -418,7 +418,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
+@@ -417,7 +417,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
  	reaped = waitpid(pid, &status, 0);
      } while (reaped == -1 && errno == EINTR);
  
diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
similarity index 95%
rename from meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 93303237973..ec4276d16ea 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protocol=https \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protocol=https \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -32,7 +32,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protoc
            file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch \
            file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
-           file://0001-perl-disable-auto-reqs.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
@@ -42,7 +41,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protoc
            "
 
 PE = "1"
-SRCREV = "13b4521341781293c41ac898aa9c2d2f6bc1f21d"
+SRCREV = "b3323786668cf99bc9aed7e60ccdab0bc25e19da"
 
 S = "${WORKDIR}/git"
 
@@ -62,13 +61,13 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= "internal-openpgp"
+PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
 
-# Deprecated! https://fedoraproject.org/wiki/Changes/RpmSequoia
-PACKAGECONFIG[internal-openpgp] = "-DWITH_INTERNAL_OPENPGP=ON,-DWITH_INTERNAL_OPENPGP=OFF"
+# has replaced openpgp support and is written in rust: https://fedoraproject.org/wiki/Changes/RpmSequoia
+PACKAGECONFIG[sequoia] = "-DWITH_SEQUOIA=ON,-DWITH_SEQUOIA=OFF,rpm-sequoia"
 
 PACKAGECONFIG[cap] = "-DWITH_CAP=ON,-DWITH_CAP=OFF"
 PACKAGECONFIG[acl] = "-DWITH_ACL=ON,-DWITH_ACL=OFF"
-- 
2.39.5


