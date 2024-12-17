Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901A1E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:30 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.91466.1734468925144453824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vJJp+7eE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-725f4623df7so5138236b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468924; x=1735073724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhYKbWxRCDoCa2+tI15x6/KdXeJyes4iXljh1q2ZsS4=;
        b=vJJp+7eEafkucVghf0+VG5eJ3FTM/4mLO4j/8B0MQutwCprpUJvF2eTJdwNksDYdBA
         djVm1WuQXUVjviIAuVPv68vsbi7PFhv0sSHA+PkdffnKetXneze2u+mPlGf0ANz92KFQ
         We9zU7eFXoFpBOav8aoOb7ahQ6QvxbSHSP+wbDQwqdqTvD2D2LNogyitsfre3AA77l+f
         jFQ0sojPaLSR69AKyWtCVi7vV8RF/S4pQBWSsw13QvXgV70jpGgT6DAyBHxoeQzoeQzA
         WvoMS9sZSKbIzEjwDKobtcRpeaKBR/3zwAQ0hL+tB4JxMaI9C/1JsxeuOHr+l9vM3SLb
         QOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468924; x=1735073724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhYKbWxRCDoCa2+tI15x6/KdXeJyes4iXljh1q2ZsS4=;
        b=i817z+rNRKIOcF3C0V2QS6XkMY2xImyIq6/l07ggoB1fG07fyR4dB2c0wyhSpdTfPi
         ynXwG5les1bm9tQecsnhMwtqInE7dvXhPHPA3xHtuyAlJgCuIPExxzuCvrgtESYZvnoz
         2UCwz9MSDNZ/3yhPaQviYgijimg30LyngNRlKm6MDc/dSCcNlfRh8+14pR2QM9jltqXU
         B2/ySDu27oLuQ6xqSTOnCJ/GSBpFfl3C6NIDLUsQG3YTnpm6Mn98H0xMpGnuLMA9R8fj
         KldXmpHw81GRQDEXNEkf37dxiX+UsAylpvm6ZuUvp7c3AIEW+F8uOU3N9WHRd4S6lYyL
         8Pig==
X-Gm-Message-State: AOJu0YxZUDgXAM1+NNA8zjzd8NXGSFQ22opS2VT128i3HksnVJAyJLyN
	TfzwjMu35hYrFhR0sHugh+UUyz0gsqeanmIvEKseJ8a6Se0rkA1WSfYPaKtpTzVWQaBLsc0/0Qf
	M
X-Gm-Gg: ASbGncsI7syDM1PHWnyVgXDpgwfB3bYojkDEWsv50SEahLxJyl7pUkpQYKyuIFJ7qYW
	My0Cvhw6nMHTPmRRmfle3YMeYW3Pasxqdh9OMwHJrcJewVxZuniWxz/CC7ywe5LGH/gJcL0MH+7
	ra7LHI6qcQtMvNDMuBlSGzYV8vPndvIvNuOtfZz4uvmBzmnPnIcNDHJX6Ry78SoOueJzkf8FLIL
	2CL8aODTT0dg/NXCh3prbwUJUGr+F6lLxbl0JkKpT390w==
X-Google-Smtp-Source: AGHT+IHQ6ze3uWvt2qe0LasibSAMpHfnqNxw77qoXAv9/jKewEzsCdwTEVYt+vO/BnIHMrEKQxN2jA==
X-Received: by 2002:a05:6a00:3307:b0:725:90f9:daf9 with SMTP id d2e1a72fcca58-72a8d261072mr585314b3a.15.1734468924234;
        Tue, 17 Dec 2024 12:55:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] base-passwd: Regenerate the patches
Date: Tue, 17 Dec 2024 12:54:55 -0800
Message-Id: <1e146868b59b5d3982576c18376331a8678e539f.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208850

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6515d96c12b080b9e7f344799e26dba3b98e17e2)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Add-a-shutdown-group.patch           | 26 +++++++++++++++++++
 ...nstead-of-bin-bash-for-the-root-user.patch | 23 ++++++++++++++++
 ...-since-we-do-not-have-an-etc-shadow.patch} | 15 ++++++++---
 ...put-group-for-the-dev-input-devices.patch} | 17 ++++++------
 .../{kvm.patch => 0005-Add-kvm-group.patch}   |  2 +-
 ...006-Disable-shell-for-default-users.patch} |  5 +---
 ...ble-generation-of-the-documentation.patch} | 22 +++++++++++-----
 .../base-passwd/add_shutdown.patch            | 19 --------------
 .../base-passwd/base-passwd/nobash.patch      | 15 -----------
 .../base-passwd/base-passwd_3.5.29.bb         | 14 +++++-----
 10 files changed, 93 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
 rename meta/recipes-core/base-passwd/base-passwd/{noshadow.patch => 0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch} (40%)
 rename meta/recipes-core/base-passwd/base-passwd/{input.patch => 0004-Add-an-input-group-for-the-dev-input-devices.patch} (42%)
 rename meta/recipes-core/base-passwd/base-passwd/{kvm.patch => 0005-Add-kvm-group.patch} (88%)
 rename meta/recipes-core/base-passwd/base-passwd/{disable-shell.patch => 0006-Disable-shell-for-default-users.patch} (96%)
 rename meta/recipes-core/base-passwd/base-passwd/{disable-docs.patch => 0007-Disable-generation-of-the-documentation.patch} (40%)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/nobash.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
new file mode 100644
index 0000000000..e50efc9623
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -0,0 +1,26 @@
+From 8f3ace87df3aaad85946c22cae240532ea3e73b8 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Fri, 29 Apr 2022 13:32:27 +0000
+Subject: [PATCH] Add a shutdown group
+
+We need to have a shutdown group to allow the shutdown icon to work
+correctly. Any users that want to use shutdown like the xuser should
+be added to this group.
+
+Upstream-Status: Inappropriate [Embedded]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index ad1dd2d..1b5e2fb 100644
+--- a/group.master
++++ b/group.master
+@@ -35,5 +35,6 @@ sasl:*:45:
+ plugdev:*:46:
+ staff:*:50:
+ games:*:60:
++shutdown:*:70:
+ users:*:100:
+ nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
new file mode 100644
index 0000000000..ea0256684b
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -0,0 +1,23 @@
+From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Fri, 29 Apr 2022 13:32:27 +0000
+Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
+
+/bin/bash may not be included in some images such as minimal.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ passwd.master | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/passwd.master b/passwd.master
+index a01a6aa..b54ff51 100644
+--- a/passwd.master
++++ b/passwd.master
+@@ -1,4 +1,4 @@
+-root:*:0:0:root:/root:/bin/bash
++root:*:0:0:root:/root:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+ bin:*:2:2:bin:/bin:/bin/sh
+ sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
similarity index 40%
rename from meta/recipes-core/base-passwd/base-passwd/noshadow.patch
rename to meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index e27bf7d9be..88cc5be66c 100644
--- a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,11 +1,18 @@
-remove "*" for root since we don't have a /etc/shadow so far.
+From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Fri, 29 Apr 2022 13:32:28 +0000
+Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
 
 Upstream-Status: Inappropriate [configuration]
-
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ passwd.master | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- base-passwd/passwd.master~nobash
-+++ base-passwd/passwd.master
+diff --git a/passwd.master b/passwd.master
+index b54ff51..e1c32ff 100644
+--- a/passwd.master
++++ b/passwd.master
 @@ -1,4 +1,4 @@
 -root:*:0:0:root:/root:/bin/sh
 +root::0:0:root:/root:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd/input.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
similarity index 42%
rename from meta/recipes-core/base-passwd/base-passwd/input.patch
rename to meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 3abbcad5d5..394a0f01d3 100644
--- a/meta/recipes-core/base-passwd/base-passwd/input.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,17 +1,18 @@
-Add an input group for the /dev/input/* devices.
+From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Fri, 29 Apr 2022 13:32:28 +0000
+Subject: [PATCH] Add an input group for the /dev/input/* devices
 
 Upstream-Status: Inappropriate [configuration]
-
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
 ---
- group.master |    1 +
+ group.master | 1 +
  1 file changed, 1 insertion(+)
 
-Index: base-passwd-3.5.26/group.master
-===================================================================
---- base-passwd-3.5.26.orig/group.master
-+++ base-passwd-3.5.26/group.master
+diff --git a/group.master b/group.master
+index 1b5e2fb..cea9d60 100644
+--- a/group.master
++++ b/group.master
 @@ -12,6 +12,7 @@ uucp:*:10:
  man:*:12:
  proxy:*:13:
diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
similarity index 88%
rename from meta/recipes-core/base-passwd/base-passwd/kvm.patch
rename to meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 113d5151e7..72e6ee333c 100644
--- a/meta/recipes-core/base-passwd/base-passwd/kvm.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
+From 6cf19461fb31d7a7a3010629aae9aab49c26a01b Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch
similarity index 96%
rename from meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
rename to meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch
index bfaa786018..2bcb829d9c 100644
--- a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch
@@ -1,4 +1,4 @@
-From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
+From f35eb24213475d3024ad45297fd855c6abfbbac0 Mon Sep 17 00:00:00 2001
 From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 Date: Mon, 18 Apr 2022 11:22:43 +0800
 Subject: [PATCH] Disable shell for default users
@@ -52,6 +52,3 @@ index e1c32ff..0cd5ffd 100644
 +irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
 +gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nologin
 +nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
---
-2.32.0
-
diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-docs.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch
similarity index 40%
rename from meta/recipes-core/base-passwd/base-passwd/disable-docs.patch
rename to meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch
index 14c08b7484..4a19f91c35 100644
--- a/meta/recipes-core/base-passwd/base-passwd/disable-docs.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch
@@ -1,14 +1,22 @@
-Disable documentation for now as it uses tools currently not supported
-by OE-Core. It uses sgmltools and po4a.
+From 7ccf8227cb10d78f1958a7a7feed75a390a6b133 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Fri, 29 Apr 2022 13:32:28 +0000
+Subject: [PATCH] Disable generation of the documentation
+
+It uses tools currently not supported by OE-Core. It uses sgmltools
+and po4a.
 
 Upstream-Status: Inappropriate [OE-Core specific]
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ Makefile.in | 3 ---
+ 1 file changed, 3 deletions(-)
 
-Index: base-passwd-3.5.28/Makefile.in
-===================================================================
---- base-passwd-3.5.28.orig/Makefile.in
-+++ base-passwd-3.5.28/Makefile.in
-@@ -25,13 +25,10 @@ gen_configure	= config.cache config.stat
+diff --git a/Makefile.in b/Makefile.in
+index 9ba097c..d3ea47c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -25,13 +25,10 @@ gen_configure	= config.cache config.status config.log \
  		  confdefhs.h config.h Makefile
  
  all: update-passwd
diff --git a/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch b/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
deleted file mode 100644
index 5f357d8895..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/add_shutdown.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-
-We need to have a shutdown group to allow the shutdown icon
-to work correctly. Any users that want to use shutdown like
-the xuser should be added to this group.
-
-Upstream-Status: Inappropriate [Embedded]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: base-passwd-3.5.26/group.master
-===================================================================
---- base-passwd-3.5.26.orig/group.master
-+++ base-passwd-3.5.26/group.master
-@@ -36,5 +36,6 @@ sasl:*:45:
- plugdev:*:46:
- staff:*:50:
- games:*:60:
-+shutdown:*:70:
- users:*:100:
- nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
deleted file mode 100644
index b5a692295b..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-use /bin/sh instead of /bin/bash, since the latter may not be included in
-some images such as minimal
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- base-passwd/passwd.master~nobash
-+++ base-passwd/passwd.master
-@@ -1,4 +1,4 @@
--root:*:0:0:root:/root:/bin/bash
-+root:*:0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index ef7792ae49..e561599136 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
 
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar.gz \
-           file://add_shutdown.patch \
-           file://nobash.patch \
-           file://noshadow.patch \
-           file://input.patch \
-           file://disable-docs.patch \
-           file://kvm.patch \
-           file://disable-shell.patch \
+           file://0001-Add-a-shutdown-group.patch \
+           file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch \
+           file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch \
+           file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
+           file://0005-Add-kvm-group.patch \
+           file://0006-Disable-shell-for-default-users.patch \
+           file://0007-Disable-generation-of-the-documentation.patch \
            "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
-- 
2.34.1


