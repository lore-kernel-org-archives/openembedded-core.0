Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 981A47F82D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b18so26796194wrj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IcsooUOT89oyCFq1TYoAJKppOz8mFLij1x/oMyZHAwY=;
	b=rviiGZaAbKBPjxx/rLvqxGRLmZq6C4ste3UzdrSaK5R9LXCQ0MTEKKVzGYFHqcuK8w
	8dlT1sp46GX6FDrL5Fc/6cTrGHlexWrr2Pisz0A/lMIgrhuL4+Vtf0tlh2Tlc94vv+jL
	fD6mV69Thg1V2cJpCaknQR/JHDfCdpYxV8tAi69Q8kBLSJ8v+z4mh/+sxmc60oP+uMdI
	GIHG/7+1VZln8EdFqn33Fa1MqFuesX/Z8EGCwbMVk2V3s/MQjw3/INfoaPBxJ0Jb9qoK
	H/OEaOQfSmiTAoe4dncTPjMcxUABm9vinGek0C7Hpy+i3cWtL/+cYmoiQkU1zZoP9K5b
	H8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IcsooUOT89oyCFq1TYoAJKppOz8mFLij1x/oMyZHAwY=;
	b=gPwoJIJYvIcLpIHT9HvHqhfIBJCcsf55hD2XX1plQTxXTd6FFzqfaygWX/cK+cK8pz
	FiwPwPwgyUSlfTKVOB0+ylxsHyPoN7GPW53Hh+TPt5qwUi1j4Pf4vjQRaeYKYoDeY6bY
	bQ5Abyje6YgzL4ocVKYvYC/upMjxdDig00f60KUBei/Dre6EWtPmhfDiHyvsmGyVAGMd
	hubn29MPE9GoNXP376ak4O20Y4ncB4jLedLQjjr3sA77eKqtS7+5R9eJabrjppPq8nah
	d7/sfmPekVbyrrpNjrMSl7yC8y8oUvAzW1RyOaM+iClhDPAJdebDEHx5s2z81yOtmUkX
	OCbg==
X-Gm-Message-State: APjAAAWq5k1u+lyS5I7sX6S2Ps/jlLUVihsyEsTjIr5JivrqAJzLpgfY
	4bEvB+xnIGe2tPM94y1pp4YArOcO
X-Google-Smtp-Source: APXvYqwvrcXjYtSYxSri+P+P7LhgFJ4qvAH8HQM2Qm4X4u0Ez9Gx50hzo2JEMT3Y1w3TfICNHx9V7w==
X-Received: by 2002:adf:da4c:: with SMTP id r12mr3504425wrl.30.1574257514171; 
	Wed, 20 Nov 2019 05:45:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:50 +0100
Message-Id: <20191120134455.125118-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/11] e2fsprogs: fix build issues with the latest version of gettext
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-configure.ac-correct-AM_GNU_GETTEXT.patch | 26 ++++++++++++++++++
 ...to-use-gettext-defines-that-no-longe.patch | 27 +++++++++++++++++++
 ...-missing-check-for-permission-denied.patch |  7 ++---
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   | 13 +++++++--
 .../e2fsprogs/e2fsprogs_1.45.4.bb             | 12 +++++----
 5 files changed, 73 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch
new file mode 100644
index 00000000000..2719594c2fa
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-configure.ac-correct-AM_GNU_GETTEXT.patch
@@ -0,0 +1,26 @@
+From f907fea9ea053d5433b5199ce74008664141f753 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 19 Nov 2019 17:32:33 +0100
+Subject: [PATCH] configure.ac: correct AM_GNU_GETTEXT
+
+New version of gettext require the 'external' argument.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 654ff43d..4772b97b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -873,7 +873,7 @@ AC_SUBST(GETTEXT_PACKAGE)
+ AC_SUBST(PACKAGE)
+ AC_SUBST(VERSION)
+ 
+-AM_GNU_GETTEXT
++AM_GNU_GETTEXT([external])
+ dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
+ AC_SUBST([mkdir_p],['$(MKDIR_P)'])
+ dnl
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch
new file mode 100644
index 00000000000..31b585fc9a9
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch
@@ -0,0 +1,27 @@
+From d034239f05cfba849f6ad16eb3f1ea37efbe4f95 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 19 Nov 2019 18:34:00 +0100
+Subject: [PATCH] intl: do not try to use gettext defines that no longer exist
+
+Newer version of gettext no longer define this in m4 files,
+so patch it out until e2fsprogs upstream sorts the situation.
+
+Upstream-Status: Inappropriate [hardcodes a choice]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ intl/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/intl/Makefile.in b/intl/Makefile.in
+index e037e23c..89a876b8 100644
+--- a/intl/Makefile.in
++++ b/intl/Makefile.in
+@@ -175,7 +175,7 @@ libgnuintl.h.msvc-static libgnuintl.h.msvc-shared README.woe32 Makefile.msvc
+ DISTFILES.obsolete = xopen-msg.sed linux-msg.sed po2tbl.sed.in cat-compat.c \
+ COPYING.LIB-2 gettext.h libgettext.h plural-eval.c libgnuintl.h
+ 
+-all: all-@USE_INCLUDED_LIBINTL@
++all:
+ all-yes: libintl.$la libintl.h charset.alias ref-add.sed ref-del.sed
+ all-no: all-no-@BUILD_INCLUDED_LIBINTL@
+ all-no-yes: libgnuintl.$la
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 69c09bc1d76..4d335af4cf6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From c7914309aeee6209ddb6995c084805a911d9cc82 Mon Sep 17 00:00:00 2001
+From e8331a76983e839a3d193446ab8ae9c1b09daa07 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
@@ -19,7 +19,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/support/profile.c b/lib/support/profile.c
-index 9e96673b..32d83002 100644
+index 585ed595..810dd66b 100644
 --- a/lib/support/profile.c
 +++ b/lib/support/profile.c
 @@ -335,7 +335,7 @@ profile_init(const char * const *files, profile_t *ret_profile)
@@ -31,6 +31,3 @@ index 9e96673b..32d83002 100644
  			   strcmp(*fs, default_filename))
  			goto errout;
  
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 830e9d57a5c..95e6a7a2d5c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,14 +1,23 @@
+From de6d6f0dd010f5b9d917553acb9430278f448f23 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 23 Dec 2013 13:38:34 +0000
+Subject: [PATCH] e2fsprogs: silence debugfs
+
 When executing a script don't echo every command, as we do this for entire
 filesystems at rootfs time.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ debugfs/debugfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 5590295..ac57292 100644
+index 15b01214..15164df2 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2378,7 +2378,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2492,7 +2492,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index 90db71df00f..ab44c28f2a5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -1,11 +1,13 @@
 require e2fsprogs.inc
 
 SRC_URI += "file://remove.ldconfig.call.patch \
-            file://run-ptest \
-            file://ptest.patch \
-            file://mkdir_p.patch \
-            file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
-            "
+           file://run-ptest \
+           file://ptest.patch \
+           file://mkdir_p.patch \
+           file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
+           file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
+           file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
+           "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
-- 
2.17.1


