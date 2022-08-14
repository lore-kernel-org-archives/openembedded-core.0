Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15890C19F2D
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 03:09:02 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1603.1660446535014642625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 20:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VT/6XLIj;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id z19so3827728plb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 20:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zOpI0qz2mUr4JSPsPyD58PyTE+d3Qrn5pr0KgGnfNmI=;
        b=VT/6XLIjD8Q/EUDOQNhse6XIv56l8FroNu5HJBpgG9yBhszUADdn7hUXgIU+wcIIuP
         WWIWywvmdbZJlHl5KTZm/sx6aqlYi/9tUFDV59Jruu1xppNSgAacL8FRw7uGxNad4Cth
         86/GXCmKDNmpZeL2LUvTp3fSIS+goCUomoHkndc0VUj3gg4SNNJBHO6PGQu8lXH7VgnD
         SuLTHijpvUWEa86uE8C8kENqwVwM32OR3Fz4i/+AVQIepNTKewy4Dc9RAcAhHSADJqFZ
         8YOeX/ti9ev2PPi+YClp2URAIYrUoeY57u0HWbH2/py/Ksay+P6Z+3J3mdFCLyrf8m7c
         D7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zOpI0qz2mUr4JSPsPyD58PyTE+d3Qrn5pr0KgGnfNmI=;
        b=kcXNyJt0i6wgTuySFD5sBb1N4pj9XonDjc+RS2D3mfXVmew9URjnbxdTMdpWYaHwjC
         DoT/xjqANYLvCNjoJCYudUElz6BYUMmMFEcnlYgppsBDvFhEl3iHI24TksUtjD/VqgjS
         qr6sD5bdyVB4WQy7N8H0MS7RD5uw89GjKBnVoipb7sbDxowe/NMxW9l3Yv8+6ypBTuYi
         ANYMM8mzbzlzHD9nKFfttau2+SgEiNTn2MvsNhsfNYIVXUVhvO1/xVxilizzZD18kYcC
         5hx9NL13Xo1lMQ9XqMwgsWIePaDMx0uGmM+tqBM45fPd+EahdHJ7cHDffeTgtCPObcNX
         qOhQ==
X-Gm-Message-State: ACgBeo0ljoOICf4g1iE8kFXuhFl7dyrRiQ7VL4PoNS5G+no3MIyPBgou
	le2LdyC0zOqC574Wxrwaq1ROIosGz3nF/A==
X-Google-Smtp-Source: 
 AA6agR4jXi792fUqe68JfUzmZBm7Ue9MOuo61/LPnzHi3KkgPAtpnDOW+A8HkcHoacrMXkP3WEW72A==
X-Received: by 2002:a17:903:264b:b0:16d:b891:593 with SMTP id
 je11-20020a170903264b00b0016db8910593mr11425548plb.133.1660446533922;
        Sat, 13 Aug 2022 20:08:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a17090301ce00b0016ef7235e09sm4462033plh.168.2022.08.13.20.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 20:08:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] musl: Upgrade to latest tip of trunk
Date: Sat, 13 Aug 2022 20:08:50 -0700
Message-Id: <20220814030850.236327-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 03:09:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169318

Rebase existing patches

Brings in following changes

* 46d1c780 fix strings.h feature test macro usage due to missing features.h
* baaf257f fix ESRCH error handling for clock_getcpuclockid
* 4f48da00 aarch64: add vfork
* 7d568410 fix mishandling of errno in getaddrinfo AI_ADDRCONFIG logic
* d16d7b10 early stage ldso: remove symbolic references via error handling function
* 63c67053 in early stage ldso before __dls2b, call mprotect with __syscall
* a23a3da2 avoid limited space of random temp file names if clock resolution is low
* 41002798 remove random filename obfuscation that leaks ASLR information
* 6c858d6f ensure distinct query id for parallel A and AAAA queries in resolver
* 8974ef21 mntent: fix potential mishandling of extremely long lines
* 751bee0e mntent: fix parsing lines with optional fields
* dcb31f6b fix constraint violation in qsort wrapper around qsort_r

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase and forward patches

 ...ic-linker-a-relative-symlink-to-libc.patch | 18 +++++++++++------
 ...ir-and-libdir-as-default-pathes-to-l.patch | 20 +++++++++++++------
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
index ba00efe7b37..8b097f32768 100644
--- a/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
+++ b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
@@ -1,7 +1,7 @@
-From 0ec74744a4cba7c5fdfaa2685995119a4fca0260 Mon Sep 17 00:00:00 2001
+From f95b6fd0475a95c00e886219271cb5c93838e3c3 Mon Sep 17 00:00:00 2001
 From: Amarnath Valluri <amarnath.valluri@intel.com>
 Date: Wed, 18 Jan 2017 16:14:37 +0200
-Subject: [PATCH] Make dynamic linker a relative symlink to libc
+Subject: [PATCH 1/2] Make dynamic linker a relative symlink to libc
 
 absolute symlink into $(libdir) fails to load in a cross build
 environment, especially when executing qemu in usermode to run target
@@ -13,18 +13,19 @@ V2:
  Make use of 'ln -r' to create relative symlinks, as most fo the distros
  shipping coreutils 8.16+
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
----
-Upstream-Status: Pending
 ---
  Makefile         | 2 +-
  tools/install.sh | 8 +++++---
  2 files changed, 6 insertions(+), 4 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index e8cc4436..466d9afd 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -210,7 +210,7 @@ $(DESTDIR)$(includedir)/%: $(srcdir)/inc
+@@ -210,7 +210,7 @@ $(DESTDIR)$(includedir)/%: $(srcdir)/include/%
  	$(INSTALL) -D -m 644 $< $@
  
  $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
@@ -33,6 +34,8 @@ Upstream-Status: Pending
  
  install-libs: $(ALL_LIBS:lib/%=$(DESTDIR)$(libdir)/%) $(if $(SHARED_LIBS),$(DESTDIR)$(LDSO_PATHNAME),)
  
+diff --git a/tools/install.sh b/tools/install.sh
+index d913b60b..b6a7f797 100755
 --- a/tools/install.sh
 +++ b/tools/install.sh
 @@ -6,18 +6,20 @@
@@ -58,7 +61,7 @@ Upstream-Status: Pending
  m) mode=$OPTARG ;;
  ?) usage ;;
  esac
-@@ -48,7 +50,7 @@ trap 'rm -f "$tmp"' EXIT INT QUIT TERM H
+@@ -48,7 +50,7 @@ trap 'rm -f "$tmp"' EXIT INT QUIT TERM HUP
  umask 077
  
  if test "$symlink" ; then
@@ -67,3 +70,6 @@ Upstream-Status: Pending
  else
  cat < "$1" > "$tmp"
  chmod "$mode" "$tmp"
+-- 
+2.37.2
+
diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
index 0aeb5eb5c23..59bfae5a27c 100644
--- a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
+++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
@@ -1,7 +1,8 @@
-From 5a2886f81dbca3f2ed28eebe7d27d471da278db8 Mon Sep 17 00:00:00 2001
+From 3cce8716c6c3ae2e0c835caeac3780ec35090b2d Mon Sep 17 00:00:00 2001
 From: Serhey Popovych <serhe.popovych@gmail.com>
 Date: Tue, 11 Dec 2018 05:44:20 -0500
-Subject: [PATCH] ldso: Use syslibdir and libdir as default pathes to libdirs
+Subject: [PATCH 2/2] ldso: Use syslibdir and libdir as default pathes to
+ libdirs
 
 In absence of /etc/ld-musl-$(ARCH).path ldso uses default path to search
 libraries /lib:/usr/local/lib:/usr/lib.
@@ -20,6 +21,8 @@ Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
  ldso/dynlink.c | 4 +++-
  2 files changed, 5 insertions(+), 2 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index 466d9afd..d2f458fa 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -47,7 +47,8 @@ CFLAGS_AUTO = -Os -pipe
@@ -32,6 +35,8 @@ Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
  CFLAGS_ALL += $(CPPFLAGS) $(CFLAGS_AUTO) $(CFLAGS)
  
  LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
+diff --git a/ldso/dynlink.c b/ldso/dynlink.c
+index cc677952..b0e8815b 100644
 --- a/ldso/dynlink.c
 +++ b/ldso/dynlink.c
 @@ -29,6 +29,8 @@
@@ -40,10 +45,10 @@ Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
  
 +#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
 +
- static void error(const char *, ...);
- 
- #define MAXP2(a,b) (-(-(a)&-(b)))
-@@ -1094,7 +1096,7 @@ static struct dso *load_library(const ch
+ static void error_impl(const char *, ...);
+ static void error_noop(const char *, ...);
+ static void (*error)(const char *, ...) = error_noop;
+@@ -1097,7 +1099,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
  					sys_path = "";
  				}
  			}
@@ -52,3 +57,6 @@ Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
  			fd = path_open(name, sys_path, buf, sizeof buf);
  		}
  		pathname = buf;
+-- 
+2.37.2
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index fde5fc0ccec..510dd4eeeea 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "6e9d2370c7559af80b32a91f20898f41597e093b"
+SRCREV = "46d1c7801bb509e1097e8fadbaf359367fa4ef0b"
 
 BASEVER = "1.2.3"
 
-- 
2.37.2


