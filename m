Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9B9C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 23:57:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.64208.1720051053668286440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 16:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuyLarSs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4256742f67fso230485e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 16:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720051051; x=1720655851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTX2rXx+Hxf8pvfdBP8Wi/Z5FeDPFeQqz2jns7vzhtM=;
        b=KuyLarSsxhHCPfLjNXBPC5EoWRKmCf1p+w/Zk/d0rPub5nLBJauT7ot7CDX8gcL8li
         5atW/PgFMwAmzTvNcyVNeG9CzevnQm05U6s/kj4BvZWULFVWt4miQFE7WD42ZOJRWUCr
         6F/XtAUr0rGDSV3uJZ3pJWVENvaI62Fit5SwKNucHgOzOGs4ucpoPadO5RqIYctws7DX
         LJskifKzpUGg/aNW2YMnrD89+pl9IeXHLUsKvXkAiUFDne7z5NpEW0fw0bxB5T7pPu6r
         6MFz4DIZwgUqmHZ5LNk9do857oNGzkZc+2+xp+H/Rrn0h0RK9B6R/ljZYvES4vHBj8D5
         fuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720051051; x=1720655851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTX2rXx+Hxf8pvfdBP8Wi/Z5FeDPFeQqz2jns7vzhtM=;
        b=NQM1sjnxtLpo3qKbRzjG/ZV1BpjfSjrCLtTc9DG+OO+0kiddjaCjsoppezqFlLRwSn
         TbXCrol7oLcljKocUrodpPbfoYeWAzHaamjuo9IWASX3HSQCy8Jt9XFlIWiakaqE1a4Y
         Zj9TBESExQYrgMZ3308nphdAuEun9NhWFcP4T7noDFDbRrGvTeRAtAGmD/kmdopoe0If
         rG+x8F/IzH3+MuSOBfpqsfJwBwQXbl+SIwAok/nRaoQk3ZXI6r3UFMPfxcFgMwasyzQT
         I6um/7Umm1MI6L+EmPPwNtvRXe4jQ6H1CR8a5+SqR1Dz2CGF9YDcDRnfkxsivzkD+Hml
         IUuw==
X-Gm-Message-State: AOJu0YzcPJL5R3OQeAbwJ5iJGt++GBtM4uhsB5i3O1T+rx+GIsqIIUkh
	FeN8v1G3HOqC8SAc3cyeub0ICeEAcygyxJ8wGQ+MPlY5umexYHmF8eNoTg==
X-Google-Smtp-Source: AGHT+IEOm8Z0hS7yQjcKdiO1LpHTnAfkVWMTfY7T0dVot/Zl6Ye7N6FpDrPMImy3kC3TZqcqJQSCvg==
X-Received: by 2002:a05:600c:54c2:b0:426:47df:7d76 with SMTP id 5b1f17b1804b1-4264a3d7224mr920515e9.10.1720051051230;
        Wed, 03 Jul 2024 16:57:31 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a21cbc6sm2436275e9.24.2024.07.03.16.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 16:57:30 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.72 -> 5.76
Date: Wed,  3 Jul 2024 23:56:25 +0000
Message-Id: <20240703235626.1542975-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 23:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201499

Changelog:
* https://github.com/bluez/bluez/releases/tag/5.76
* https://github.com/bluez/bluez/releases/tag/5.75
* https://github.com/bluez/bluez/releases/tag/5.74
* https://github.com/bluez/bluez/releases/tag/5.73

Changes to the build:
* Patch file
  0001-Allow-using-obexd-without-systemd-in-the-user-session was removed
partly because some of the changes are now upstream. The rest of the
changes are dropped, mainly concerning adding obexd D-bus service when systemd
is disabled. Quite a bit has changed in the configuration files, if
anyone is depending on this then a new patch is needed. There is
currently no patch waiting upstream.
* Add a patch file to resolve an issue introduce in version 5.73 where
  --disable-cups configuration breaks the build. A
  patch was submitted upstream a while ago but was denied (silently) due
to failing CI checks according to one of the BlueZ maintainers, see: https://github.com/bluez/bluez/issues/773#issuecomment-2200883833

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +-
 ...d-without-systemd-in-the-user-sessio.patch | 56 -------------------
 .../0001-test-gatt-Fix-hung-issue.patch       |  7 +--
 ...et-for-building-tests-without-runnin.patch |  7 +--
 .../0004-configure.ac-Fix-disable-cups.patch  | 48 ++++++++++++++++
 ...shared-util.c-include-linux-limits.h.patch |  5 +-
 .../bluez5/{bluez5_5.72.bb => bluez5_5.76.bb} |  2 +-
 7 files changed, 58 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0004-configure.ac-Fix-disable-cups.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb => bluez5_5.76.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a1ffdeef8c..6875f56f67 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -51,10 +51,10 @@ PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,python3-docutils
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
+           file://0004-configure.ac-Fix-disable-cups.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
deleted file mode 100644
index 618ed734a9..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f74eb97c9fb3c0ee2895742e773ac6a3c41c999c Mon Sep 17 00:00:00 2001
-From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.org>
-Date: Sat, 12 Oct 2013 17:45:25 +0200
-Subject: [PATCH] Allow using obexd without systemd in the user session
-
-Not all sessions run systemd --user (actually, the majority
-doesn't), so the dbus daemon must be able to spawn obexd
-directly, and to do so it needs the full path of the daemon.
-
-Upstream-Status: Denied
-
-Not accepted by upstream maintainer for being a distro specific
-configuration. See thread:
-
-http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
-
-Signed-off-by: Javier Viguera <javier.viguera@digi.com>
-
----
- Makefile.obexd                                                | 4 ++--
- .../src/{org.bluez.obex.service => org.bluez.obex.service.in} | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
- rename obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} (76%)
-
-diff --git a/Makefile.obexd b/Makefile.obexd
-index de59d29..73004a3 100644
---- a/Makefile.obexd
-+++ b/Makefile.obexd
-@@ -1,12 +1,12 @@
- if SYSTEMD
- systemduserunitdir = $(SYSTEMD_USERUNITDIR)
- systemduserunit_DATA = obexd/src/obex.service
-+endif
- 
- dbussessionbusdir = $(DBUS_SESSIONBUSDIR)
- dbussessionbus_DATA = obexd/src/org.bluez.obex.service
--endif
- 
--EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service
-+EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service.in
- 
- if OBEX
- 
-diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex.service.in
-similarity index 76%
-rename from obexd/src/org.bluez.obex.service
-rename to obexd/src/org.bluez.obex.service.in
-index a538088..9c815f2 100644
---- a/obexd/src/org.bluez.obex.service
-+++ b/obexd/src/org.bluez.obex.service.in
-@@ -1,4 +1,4 @@
- [D-BUS Service]
- Name=org.bluez.obex
--Exec=/bin/false
-+Exec=@libexecdir@/obexd
- SystemdService=dbus-org.bluez.obex.service
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index b1e93dbe19..b90f267340 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
+From d11501ae5a6360b5df25fb06dbab07255d1e6833 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -21,16 +21,15 @@ no action.
 Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
 ---
  unit/test-gatt.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index 5e06d4e..4864d36 100644
+index 1613fbc..25dd614 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
+@@ -4547,7 +4547,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 881494a354..903b15e919 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,20 +1,19 @@
-From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
+From 94df3d222a7678024dd91c9173ed08e620c6d4ea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile.am | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index e738eb3..dab17dd 100644
+index 05d0293..534a340 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -710,6 +710,9 @@ endif
+@@ -708,6 +708,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-configure.ac-Fix-disable-cups.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-configure.ac-Fix-disable-cups.patch
new file mode 100644
index 0000000000..4ca01452bf
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-configure.ac-Fix-disable-cups.patch
@@ -0,0 +1,48 @@
+From 90477fa7f0d403324c9fc05af34648374f03e0bb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
+Date: Wed, 3 Jul 2024 22:42:19 +0000
+Subject: [PATCH] configure.ac: Fix --disable-cups
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+or else we get:
+  configure: error: conditional "CUPS_SERVERBIN" was never defined.
+  Usually this means the macro was only invoked conditionally.
+
+Fixes: https://github.com/bluez/bluez/issues/773
+
+Credits go to Lars Wendler <polynomial-c@gmx.de>, See upstream patch:
+https://lore.kernel.org/linux-bluetooth/20240416052603.4373-2-polynomial-c@gmx.de/
+
+The patch was denied/ignored due to failing CI checks, though it is unclear what
+failed. The patch may need to be resubmitted upstream.
+
+Upstream-Status: Denied
+
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ac9de6e..8e902c3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,12 +249,12 @@ AM_CONDITIONAL(CUPS, test "${enable_cups}" != "no")
+ if (test "${enable_cups}" != "no"); then
+ 	AC_MSG_CHECKING([cups directory])
+ 	cups_serverbin=`$PKG_CONFIG cups --variable=cups_serverbin`
+-	AM_CONDITIONAL(CUPS_SERVERBIN, test "${cups_serverbin}" != "")
+-	if (test "${cups_serverbin}" != ""); then
+-		AC_SUBST(CUPS_SERVERBIN, ${cups_serverbin})
+-	fi
+ 	AC_MSG_RESULT([${cups_serverbin}])
+ fi
++AM_CONDITIONAL(CUPS_SERVERBIN, test "${cups_serverbin}" != "")
++AS_IF([test "${cups_serverbin}" != ""],[
++	AC_SUBST(CUPS_SERVERBIN, ${cups_serverbin})
++])
+ 
+ AC_ARG_ENABLE(mesh, AS_HELP_STRING([--enable-mesh],
+ 		[enable Mesh profile support]), [enable_mesh=${enableval}])
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 516d859069..f90f626c13 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
+From d01dd68b0f2a1f9bae8242b96116ffbcd202d09a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -8,13 +8,12 @@ systems such as those using musl.
 
 Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  src/shared/util.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index c0c2c4a..036dc0d 100644
+index ee59b94..84e5820 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.76.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.76.bb
index 9fda960ea7..86ae191837 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.76.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
+SRC_URI[sha256sum] = "55e2c645909ad82d833c42ce85ec20434e0ef0070941b1eab73facdd240bbd63"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.34.1


