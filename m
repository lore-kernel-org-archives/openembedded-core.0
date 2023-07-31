Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D015C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 20:30:21 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3001.1690835412538244653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 13:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FswrwEsD;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31771bb4869so5158649f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690835411; x=1691440211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIidKOvlLDSkdgrPXXxDLXn05toFKUaTkV5qMiHkoYU=;
        b=FswrwEsDKGgHCaYUlLkPm91ysPU1EdVJ6LYoF6sHP0JgsqXX0UZ4ulFfNkE6y7hEtp
         kqN+RV51u4RbU0OINCdu4HkNfel4FslPH5oUwcg08DJyGLtlYFcykOEto1EXVoYsSzNT
         gx5WcIW58654+w9HO7lD0KicICqZDuFnp5ni2cTzl7OUQWJAei/Dl07Pf1X8WtjtV/pe
         fWGBMOIjSsN7npl26mKDFVZNklevs13dtqCBg7PW250dsTZzN76PiXjIYELs5J5jaR5V
         Pxx9DU4nXs54OJNxFa/nJNFUAazaKv6SO0p69GNReDuw3rVqujyi28XbRDQCon6+3E5z
         XNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835411; x=1691440211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIidKOvlLDSkdgrPXXxDLXn05toFKUaTkV5qMiHkoYU=;
        b=Np0jBng4VDpc4+SsF/uaRonv4/qlXa72nrjA2Hi0XxIjZg0Mf6rDIEz5o6wdzrOZ0o
         zSVSySwcfpPBn7lN6yXWq4cwaUxOWKCG1xnuhMcKcrueEBwhJiXuj24R2o905mANOcHw
         8fLj8tzEkpyJSED+DnDWVhD58RHvwyFkIG3BI6QqzrJdXb6rakBV8Rj/Jkb2p6PsypvW
         4oH6YLUo6NykdWUDo/Jkt9w6P9SCbeVrdhKLlHIweliLkAmjkXrlzQwG3VfPRI7scWJw
         Mj/LieL8NQKcVFU3G0rsbcI11D2o3tqJG6uMR9S1vjViHk1EeoonHkZoGQ4gsfyXayA0
         c8TA==
X-Gm-Message-State: ABy/qLarzseX961gPL1mIl7GL6ozBuY5x7+CZT4WOsG7IaRIPmEsAMDF
	ocR6TZsHuF7LtLP2crRHfJ+Hd2c2U8M=
X-Google-Smtp-Source: APBJJlFxndXo1juZPOp4xU4fjZbNomjdyk1H/GtT0dQ/vkywK8dki38EN291F/bkjrnKIgqsfPUMtw==
X-Received: by 2002:adf:d08f:0:b0:317:6310:a616 with SMTP id y15-20020adfd08f000000b003176310a616mr640683wrh.36.1690835410449;
        Mon, 31 Jul 2023 13:30:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p9-20020adfce09000000b0031763fd36c4sm14009300wrn.104.2023.07.31.13.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 13:30:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][PATCH] efivar: backport 5 patches to fix build with gold
Date: Mon, 31 Jul 2023 22:30:01 +0200
Message-ID: <20230731203001.1363019-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185170

* LDFLAGS += "-fuse-ld=bfd" in the recipe doesn't work and
  it still fails to build with ld-is-gold in DISTRO_FEATURES

  removal of this line sent to master in:
  https://lists.openembedded.org/g/openembedded-core/message/185167

* the most important ones are the 1st which removes --add-needed
  and the last which removes src/include/workarounds.mk completely
  while 2-4 patches just update src/include/workarounds.mk for the
  last one to apply cleanly

* alternatively we can bump SRCREV to latest 38 as master did in:
  https://git.openembedded.org/openembedded-core/commit/?id=4df808c616f847d90203582fd950a49bb8360dd0
  which brings 23 commits, but instead of adding 5 more patches
  allows to remove 5

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ve-deprecated-add-needed-linker-flag.patch |  45 +++
 ...002-Add-T-workaround-for-GNU-ld-2.36.patch |  33 +++
 ...LL-C-to-force-English-output-from-ld.patch |  33 +++
 ...on-and-remove-not-needed-workarounds.patch |  45 +++
 ...mp-efi_well_known_-variable-handling.patch | 262 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   9 +-
 6 files changed, 423 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Remove-deprecated-add-needed-linker-flag.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0002-Add-T-workaround-for-GNU-ld-2.36.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-Set-LC_ALL-C-to-force-English-output-from-ld.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0004-LLD-fix-detection-and-remove-not-needed-workarounds.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0005-Revamp-efi_well_known_-variable-handling.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0001-Remove-deprecated-add-needed-linker-flag.patch b/meta/recipes-bsp/efivar/efivar/0001-Remove-deprecated-add-needed-linker-flag.patch
new file mode 100644
index 0000000000..fb6d2e8580
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-Remove-deprecated-add-needed-linker-flag.patch
@@ -0,0 +1,45 @@
+From b23aba1469de8bb7a115751f9cd294ad3aaa6680 Mon Sep 17 00:00:00 2001
+From: Ali Abdel-Qader <abdelqaderali@protonmail.com>
+Date: Tue, 31 May 2022 11:53:32 -0400
+Subject: [PATCH] Remove deprecated --add-needed linker flag
+
+Resolves #204
+Signed-off-by: Ali Abdel-Qader <abdelqaderali@protonmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/rhboot/efivar/pull/218/commits/b23aba1469de8bb7a115751f9cd294ad3aaa6680]
+
+ src/include/defaults.mk | 2 --
+ src/include/gcc.specs   | 2 +-
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/include/defaults.mk b/src/include/defaults.mk
+index b8cc590..42bd3d6 100644
+--- a/src/include/defaults.mk
++++ b/src/include/defaults.mk
+@@ -51,7 +51,6 @@ LDFLAGS ?=
+ override _CCLDFLAGS := $(CCLDFLAGS)
+ override _LDFLAGS := $(LDFLAGS)
+ override LDFLAGS = $(CFLAGS) -L. $(_LDFLAGS) $(_CCLDFLAGS) \
+-		   -Wl,--add-needed \
+ 		   -Wl,--build-id \
+ 		   -Wl,--no-allow-shlib-undefined \
+ 		   -Wl,--no-undefined-version \
+@@ -98,7 +97,6 @@ override _HOST_LDFLAGS := $(HOST_LDFLAGS)
+ override _HOST_CCLDFLAGS := $(HOST_CCLDFLAGS)
+ override HOST_LDFLAGS = $(HOST_CFLAGS) -L. \
+ 			$(_HOST_LDFLAGS) $(_HOST_CCLDFLAGS) \
+-			-Wl,--add-needed \
+ 			-Wl,--build-id \
+ 			-Wl,--no-allow-shlib-undefined \
+ 			-Wl,-z,now \
+diff --git a/src/include/gcc.specs b/src/include/gcc.specs
+index ef28e2b..d85e865 100644
+--- a/src/include/gcc.specs
++++ b/src/include/gcc.specs
+@@ -5,4 +5,4 @@
+ + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now} -grecord-gcc-switches
+ 
+ *link:
+-+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
+++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
diff --git a/meta/recipes-bsp/efivar/efivar/0002-Add-T-workaround-for-GNU-ld-2.36.patch b/meta/recipes-bsp/efivar/efivar/0002-Add-T-workaround-for-GNU-ld-2.36.patch
new file mode 100644
index 0000000000..a175673922
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0002-Add-T-workaround-for-GNU-ld-2.36.patch
@@ -0,0 +1,33 @@
+From 8469d6f72ee2450753f044080b018f9ad7ff62dc Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Mon, 17 Jan 2022 12:34:55 -0500
+Subject: [PATCH] Add -T workaround for GNU ld 2.36
+
+Signed-off-by: Robbie Harwood <rharwood@redhat.com>
+Resolves: #195
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/197a0874ea4010061b98b4b55eff65b33b1cd741]
+
+ src/include/workarounds.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/include/workarounds.mk b/src/include/workarounds.mk
+index 3118834..143e790 100644
+--- a/src/include/workarounds.mk
++++ b/src/include/workarounds.mk
+@@ -4,12 +4,12 @@
+ 
+ LD_FLAVOR := $(shell $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/ .*//g')
+ LD_VERSION := $(shell $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/.* //')
+-# I haven't tested 2.36 here; 2.35 is definitely broken and 2.37 seems to work
++# 2.35 is definitely broken and 2.36 seems to work
+ LD_DASH_T := $(shell \
+ 	if [ "x${LD_FLAVOR}" = xLLD ] ; then \
+ 		echo '-T' ; \
+ 	elif [ "x${LD_FLAVOR}" = xGNU ] ; then \
+-		if echo "${LD_VERSION}" | grep -q -E '^2\.3[789]|^2\.[456789]|^[3456789]|^[[:digit:]][[:digit:]]' ; then \
++		if echo "${LD_VERSION}" | grep -q -E '^2\.3[6789]|^2\.[456789]|^[3456789]|^[[:digit:]][[:digit:]]' ; then \
+ 			echo '-T' ; \
+ 		else \
+ 			echo "" ; \
diff --git a/meta/recipes-bsp/efivar/efivar/0003-Set-LC_ALL-C-to-force-English-output-from-ld.patch b/meta/recipes-bsp/efivar/efivar/0003-Set-LC_ALL-C-to-force-English-output-from-ld.patch
new file mode 100644
index 0000000000..e53c31a673
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0003-Set-LC_ALL-C-to-force-English-output-from-ld.patch
@@ -0,0 +1,33 @@
+From 8ea2cf0ab6182f29ecd8568cdc674b2736f6ffba Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Fri, 24 Jun 2022 17:00:33 -0400
+Subject: [PATCH] Set LC_ALL=C to force English output from ld
+
+If the user has a different locale set, ld --version may not contain the
+string "GNU ld".
+
+For example, in Italian, ld --version outputs "ld di GNU".
+
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/01de7438520868650bfaa1ef3e2bfaf00cacbcc6]
+
+ src/include/workarounds.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/include/workarounds.mk b/src/include/workarounds.mk
+index 143e790..b72fbaf 100644
+--- a/src/include/workarounds.mk
++++ b/src/include/workarounds.mk
+@@ -2,8 +2,8 @@
+ #
+ # workarounds.mk - workarounds for weird stuff behavior
+ 
+-LD_FLAVOR := $(shell $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/ .*//g')
+-LD_VERSION := $(shell $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/.* //')
++LD_FLAVOR := $(shell LC_ALL=C $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/ .*//g')
++LD_VERSION := $(shell LC_ALL=C $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/.* //')
+ # 2.35 is definitely broken and 2.36 seems to work
+ LD_DASH_T := $(shell \
+ 	if [ "x${LD_FLAVOR}" = xLLD ] ; then \
diff --git a/meta/recipes-bsp/efivar/efivar/0004-LLD-fix-detection-and-remove-not-needed-workarounds.patch b/meta/recipes-bsp/efivar/efivar/0004-LLD-fix-detection-and-remove-not-needed-workarounds.patch
new file mode 100644
index 0000000000..f1a545140a
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0004-LLD-fix-detection-and-remove-not-needed-workarounds.patch
@@ -0,0 +1,45 @@
+From 09b9ddc51cb83ce547872a82271d1af4d11325da Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tomasz=20Pawe=C5=82=20Gajc?= <tpgxyz@gmail.com>
+Date: Wed, 29 Jun 2022 21:44:29 +0200
+Subject: [PATCH] LLD: fix detection and remove not needed workarounds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Tomasz Paweł Gajc <tpgxyz@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/1f247260c9b4bd6fcda30f3e4cc358852aeb9e4d]
+
+ src/include/workarounds.mk | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/include/workarounds.mk b/src/include/workarounds.mk
+index b72fbaf..57394ed 100644
+--- a/src/include/workarounds.mk
++++ b/src/include/workarounds.mk
+@@ -2,12 +2,12 @@
+ #
+ # workarounds.mk - workarounds for weird stuff behavior
+ 
+-LD_FLAVOR := $(shell LC_ALL=C $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/ .*//g')
+-LD_VERSION := $(shell LC_ALL=C $(LD) --version | grep -E '^(LLD|GNU ld)'|sed 's/.* //')
++LD_FLAVOR := $(shell LC_ALL=C $(LD) --version | grep -E '^((.* )?LLD|GNU ld)'|sed 's/.* LLD/LLD/;s/ .*//g')
++LD_VERSION := $(shell LC_ALL=C $(LD) --version | grep -E '^((.* )?LLD|GNU ld)'|sed 's/.* LLD/LLD/;s/.* //')
+ # 2.35 is definitely broken and 2.36 seems to work
+ LD_DASH_T := $(shell \
+ 	if [ "x${LD_FLAVOR}" = xLLD ] ; then \
+-		echo '-T' ; \
++		echo "" ; \
+ 	elif [ "x${LD_FLAVOR}" = xGNU ] ; then \
+ 		if echo "${LD_VERSION}" | grep -q -E '^2\.3[6789]|^2\.[456789]|^[3456789]|^[[:digit:]][[:digit:]]' ; then \
+ 			echo '-T' ; \
+@@ -15,7 +15,7 @@ LD_DASH_T := $(shell \
+ 			echo "" ; \
+ 		fi ; \
+ 	else \
+-		echo "Your linker is not supported" ; \
++		echo "Your linker ${LD_FLAVOR} version ${LD_VERSION} is not supported" ; \
+ 		exit 1 ; \
+ 	fi)
+ 
diff --git a/meta/recipes-bsp/efivar/efivar/0005-Revamp-efi_well_known_-variable-handling.patch b/meta/recipes-bsp/efivar/efivar/0005-Revamp-efi_well_known_-variable-handling.patch
new file mode 100644
index 0000000000..758a151138
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0005-Revamp-efi_well_known_-variable-handling.patch
@@ -0,0 +1,262 @@
+From 8c20b2242925616dfccc97b9be29f36afcf8034d Mon Sep 17 00:00:00 2001
+From: Nicholas Vinson <nvinson234@gmail.com>
+Date: Mon, 10 Oct 2022 14:22:36 -0400
+Subject: [PATCH] Revamp efi_well_known_* variable handling
+
+The current implementation attempts to use the linker to create aliases
+for efi_well_known_guids and efi_well_known_names. It also tries to use
+the linker to generate the variables efi_well_known_guids_end and
+efi_well_known_names_end.
+
+When building with clang, the generated linker result results in a
+broken libefivar.so that causes programs to segfault when linked against
+it.  This change does away with linker script hacker and instead
+introduces pointers to store the locations of efi_well_known_guids_end
+and efi_well_known_names_end.
+
+Additionally, efi_well_known_guids and efi_well_known_names are now
+created as pointers that point to the beginning of their respective
+arrays.
+
+Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
+Fixes: #234
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/cfd686de51494d3e34be896a91835657ccab37d4]
+
+ src/Makefile               |  7 ++--
+ src/include/rules.mk       |  5 +--
+ src/include/workarounds.mk | 24 -------------
+ src/makeguids.c            | 72 +++++++++++++-------------------------
+ 4 files changed, 27 insertions(+), 81 deletions(-)
+ delete mode 100644 src/include/workarounds.mk
+
+diff --git a/src/Makefile b/src/Makefile
+index b10051b..c69caf4 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -4,7 +4,6 @@ include $(TOPDIR)/src/include/deprecated.mk
+ include $(TOPDIR)/src/include/version.mk
+ include $(TOPDIR)/src/include/rules.mk
+ include $(TOPDIR)/src/include/defaults.mk
+-include $(TOPDIR)/src/include/workarounds.mk
+ 
+ LIBTARGETS=libefivar.so libefiboot.so libefisec.so
+ STATICLIBTARGETS=libefivar.a libefiboot.a libefisec.a
+@@ -30,7 +29,7 @@ EFISECDB_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(EFISECDB_SOURCES)))
+ GENERATED_SOURCES = include/efivar/efivar-guids.h guid-symbols.c
+ MAKEGUIDS_SOURCES = makeguids.c util-makeguids.c
+ MAKEGUIDS_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(MAKEGUIDS_SOURCES)))
+-MAKEGUIDS_OUTPUT = $(GENERATED_SOURCES) guids.lds
++MAKEGUIDS_OUTPUT = $(GENERATED_SOURCES)
+ 
+ util-makeguids.c :
+ 	cp util.c util-makeguids.c
+@@ -84,7 +83,7 @@ $(MAKEGUIDS_OUTPUT) : guids.txt
+ 	if [ "$${missing}" != "no" ]; then \
+ 		exit 1 ; \
+ 	fi
+-	./makeguids $(LD_DASH_T) guids.txt guid-symbols.c include/efivar/efivar-guids.h guids.lds
++	./makeguids guids.txt guid-symbols.c include/efivar/efivar-guids.h
+ 
+ prep : makeguids $(GENERATED_SOURCES)
+ 
+@@ -96,7 +95,6 @@ libefivar.a : $(patsubst %.o,%.static.o,$(LIBEFIVAR_OBJECTS))
+ libefivar.so : $(LIBEFIVAR_OBJECTS)
+ libefivar.so : | $(GENERATED_SOURCES) libefivar.map
+ libefivar.so : LIBS=dl
+-libefivar.so : LDSCRIPTS=guids.lds
+ libefivar.so : MAP=libefivar.map
+ 
+ efivar : $(EFIVAR_OBJECTS) | libefivar.so
+@@ -137,7 +135,6 @@ deps : $(ALL_SOURCES)
+ clean : 
+ 	@rm -rfv *~ *.o *.a *.E *.so *.so.* *.pc *.bin .*.d *.map \
+ 		makeguids guid-symbols.c include/efivar/efivar-guids.h \
+-		guids.lds \
+ 		$(TARGETS) $(STATICTARGETS)
+ 	@# remove the deps files we used to create, as well.
+ 	@rm -rfv .*.P .*.h.P *.S.P include/efivar/.*.h.P
+diff --git a/src/include/rules.mk b/src/include/rules.mk
+index f309f86..8d0b68a 100644
+--- a/src/include/rules.mk
++++ b/src/include/rules.mk
+@@ -3,7 +3,6 @@ default : all
+ .PHONY: default all clean install test
+ 
+ include $(TOPDIR)/src/include/version.mk
+-include $(TOPDIR)/src/include/workarounds.mk
+ 
+ comma:= ,
+ empty:=
+@@ -36,9 +35,7 @@ family = $(foreach FAMILY_SUFFIX,$(FAMILY_SUFFIXES),$($(1)_$(FAMILY_SUFFIX)))
+ 	$(CCLD) $(CCLDFLAGS) $(CPPFLAGS) -o $@ $(sort $^) $(LDLIBS)
+ 
+ %.so :
+-	$(CCLD) $(CCLDFLAGS) $(CPPFLAGS) $(SOFLAGS) \
+-		$(foreach LDS,$(LDSCRIPTS),$(LD_DASH_T) $(LDS)) \
+-		-o $@ $^ $(LDLIBS)
++	$(CCLD) $(CCLDFLAGS) $(CPPFLAGS) $(SOFLAGS) -o $@ $^ $(LDLIBS)
+ 	ln -vfs $@ $@.1
+ 
+ %.abixml : %.so
+diff --git a/src/include/workarounds.mk b/src/include/workarounds.mk
+deleted file mode 100644
+index 57394ed..0000000
+--- a/src/include/workarounds.mk
++++ /dev/null
+@@ -1,24 +0,0 @@
+-# SPDX-License-Identifier: SPDX-License-Identifier: LGPL-2.1-or-later
+-#
+-# workarounds.mk - workarounds for weird stuff behavior
+-
+-LD_FLAVOR := $(shell LC_ALL=C $(LD) --version | grep -E '^((.* )?LLD|GNU ld)'|sed 's/.* LLD/LLD/;s/ .*//g')
+-LD_VERSION := $(shell LC_ALL=C $(LD) --version | grep -E '^((.* )?LLD|GNU ld)'|sed 's/.* LLD/LLD/;s/.* //')
+-# 2.35 is definitely broken and 2.36 seems to work
+-LD_DASH_T := $(shell \
+-	if [ "x${LD_FLAVOR}" = xLLD ] ; then \
+-		echo "" ; \
+-	elif [ "x${LD_FLAVOR}" = xGNU ] ; then \
+-		if echo "${LD_VERSION}" | grep -q -E '^2\.3[6789]|^2\.[456789]|^[3456789]|^[[:digit:]][[:digit:]]' ; then \
+-			echo '-T' ; \
+-		else \
+-			echo "" ; \
+-		fi ; \
+-	else \
+-		echo "Your linker ${LD_FLAVOR} version ${LD_VERSION} is not supported" ; \
+-		exit 1 ; \
+-	fi)
+-
+-export LD_DASH_T
+-
+-# vim:ft=make
+diff --git a/src/makeguids.c b/src/makeguids.c
+index e4ff411..b9e9312 100644
+--- a/src/makeguids.c
++++ b/src/makeguids.c
+@@ -107,51 +107,46 @@ write_guidnames(FILE *out, const char *listname,
+ 			gn->symbol, gn->name, gn->description);
+ 	}
+ 	fprintf(out, "};\n");
++        fprintf(out, "const struct efivar_guidname\n"
++			"\t__attribute__((__visibility__ (\"default\")))\n"
++			"\t* const %s = %s_;\n", listname, listname);
++        fprintf(out, "const struct efivar_guidname\n"
++			"\t__attribute__((__visibility__ (\"default\")))\n"
++                        "\t* const %s_end = %s_\n\t+ %zd;\n",
++                        listname, listname, n - 1);
+ }
+ 
+ int
+ main(int argc, char *argv[])
+ {
+ 	int rc;
+-	int argstart = 0;
+-	FILE *symout, *header, *ldsout;
+-	int dash_t = 0;
++	FILE *symout, *header;
+ 
+-	if (argc < 5) {
++	if (argc < 4) {
+ 		errx(1, "Not enough arguments.\n");
+-	} else if (argc > 5 && !strcmp(argv[1],"-T")) {
+-		argstart = 1;
+-		dash_t = 1;
+-	} else if (argc > 5) {
++	} else if (argc > 4) {
+ 		errx(1, "Too many arguments.\n");
+ 	}
+ 
+-	symout = fopen(argv[argstart + 2], "w");
++	symout = fopen(argv[2], "w");
+ 	if (symout == NULL)
+-		err(1, "could not open \"%s\"", argv[argstart + 2]);
+-	rc = chmod(argv[argstart + 2], 0644);
++		err(1, "could not open \"%s\"", argv[2]);
++	rc = chmod(argv[2], 0644);
+ 	if (rc < 0)
+-		warn("chmod(%s, 0644)", argv[argstart + 2]);
++		warn("chmod(%s, 0644)", argv[2]);
+ 
+-	header = fopen(argv[argstart + 3], "w");
++	header = fopen(argv[3], "w");
+ 	if (header == NULL)
+-		err(1, "could not open \"%s\"", argv[argstart + 3]);
+-	rc = chmod(argv[argstart + 3], 0644);
+-	if (rc < 0)
+-		warn("chmod(%s, 0644)", argv[argstart + 3]);
+-
+-	ldsout = fopen(argv[argstart + 4], "w");
+-	if (ldsout == NULL)
+-		err(1, "could not open \"%s\"", argv[argstart + 4]);
+-	rc = chmod(argv[argstart + 4], 0644);
++		err(1, "could not open \"%s\"", argv[3]);
++	rc = chmod(argv[3], 0644);
+ 	if (rc < 0)
+-		warn("chmod(%s, 0644)", argv[argstart + 4]);
++		warn("chmod(%s, 0644)", argv[3]);
+ 
+ 	struct guidname_index *guidnames = NULL;
+ 
+-	rc = read_guids_at(AT_FDCWD, argv[argstart + 1], &guidnames);
++	rc = read_guids_at(AT_FDCWD, argv[1], &guidnames);
+ 	if (rc < 0)
+-		err(1, "could not read \"%s\"", argv[argstart + 1]);
++		err(1, "could not read \"%s\"", argv[1]);
+ 
+ 	struct efivar_guidname *outbuf;
+ 
+@@ -239,12 +234,11 @@ struct efivar_guidname {\n\
+ 	fprintf(header,
+ 		"extern const struct efivar_guidname\n"
+ 			"\t__attribute__((__visibility__ (\"default\")))\n"
+-			"\tefi_well_known_guids[%d];\n",
+-		i);
++			"\t* const efi_well_known_guids;\n");
+ 	fprintf(header,
+ 		"extern const struct efivar_guidname\n"
+ 			"\t__attribute__((__visibility__ (\"default\")))\n"
+-			"\tefi_well_known_guids_end;\n");
++			"\t* const efi_well_known_guids_end;\n");
+ 	fprintf(header,
+ 		"extern const uint64_t\n"
+ 			"\t__attribute__((__visibility__ (\"default\")))\n"
+@@ -252,12 +246,11 @@ struct efivar_guidname {\n\
+ 	fprintf(header,
+ 		"extern const struct efivar_guidname\n"
+ 			"\t__attribute__((__visibility__ (\"default\")))\n"
+-			"\tefi_well_known_names[%d];\n",
+-		i);
++			"\t* const efi_well_known_names;\n");
+ 	fprintf(header,
+ 		"extern const struct efivar_guidname\n"
+ 			"\t__attribute__((__visibility__ (\"default\")))\n"
+-			"\tefi_well_known_names_end;\n");
++			"\t* const efi_well_known_names_end;\n");
+ 	fprintf(header,
+ 		"extern const uint64_t\n"
+ 			"\t__attribute__((__visibility__ (\"default\")))\n"
+@@ -302,23 +295,6 @@ struct efivar_guidname {\n\
+ 
+ 	fclose(symout);
+ 
+-	fprintf(ldsout,
+-		"SECTIONS\n"
+-		"{\n"
+-		"  .data :\n"
+-		"  {\n"
+-		"    efi_well_known_guids = efi_well_known_guids_;\n"
+-		"    efi_well_known_guids_end = efi_well_known_guids_ + %zd;\n"
+-		"    efi_well_known_names = efi_well_known_names_;\n"
+-		"    efi_well_known_names_end = efi_well_known_names_ + %zd;\n"
+-		"  }\n"
+-		"}%s;\n",
+-		(line - 1) * sizeof(struct efivar_guidname),
+-		(line - 1) * sizeof(struct efivar_guidname),
+-		dash_t ? " INSERT AFTER .data" : "");
+-
+-	fclose(ldsout);
+-
+ 	free(guidnames->strtab);
+ 	free(guidnames);
+ 
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 42625fa041..dc84b3732f 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -12,6 +12,11 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
            file://efisecdb-fix-build-with-musl-libc.patch \
            file://0001-Fix-invalid-free-in-main.patch \
+           file://0001-Remove-deprecated-add-needed-linker-flag.patch \
+           file://0002-Add-T-workaround-for-GNU-ld-2.36.patch \
+           file://0003-Set-LC_ALL-C-to-force-English-output-from-ld.patch \
+           file://0004-LLD-fix-detection-and-remove-not-needed-workarounds.patch \
+           file://0005-Revamp-efi_well_known_-variable-handling.patch \
            "
 SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
@@ -21,10 +26,6 @@ inherit pkgconfig
 
 export CCLD_FOR_BUILD = "${BUILD_CCLD}"
 
-# Upstream uses --add-needed in gcc.specs which gold doesn't support, so
-# enforce BFD.
-LDFLAGS += "-fuse-ld=bfd"
-
 do_compile() {
     oe_runmake ERRORS= HOST_CFLAGS="${BUILD_CFLAGS}" HOST_LDFLAGS="${BUILD_LDFLAGS}"
 }
-- 
2.41.0


