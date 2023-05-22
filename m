Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62678C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.1276.1684776400247554496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RMXxPRbr;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so9502327a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776399; x=1687368399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xT5KhHbXOsG6K2hGrSIbEcJLyjxd5ZMgNfD34d9Brw=;
        b=RMXxPRbr7kjU837LVskIky/wIzVek25VOz1uS4elDrKax9zsnJH9ueb6qEcD1MUnQ9
         uI/c5KX2shUh5IJW45MtutOk3SBc0GBMAWZSm5NWVK5cXswyUkmqLSYWxHoL33/xAFcw
         yOtOrUqtGzLtkv4+zER8GAfgfVsrKAXLIJw2PI6czC8Ui77kTQOGS1i8kPp1U7TDUGPE
         3hiF+1GA68Y5lFNZcwnYloVh6WIYvXY53ZCu/Epj2+1d633nsThHDmv7fO2sGDAixnXu
         M8ofsrOGy4LmUZJoXo26Cqdrz22lvrFN15BZK2GOBR4+x1S/Uap4cFoR7QI+30Aztf5N
         87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776399; x=1687368399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xT5KhHbXOsG6K2hGrSIbEcJLyjxd5ZMgNfD34d9Brw=;
        b=K6ZJQgvjM7MuVAU9n9010hkm+rC0JJI2Sup+yelylxT8UXLcz+i58NWfgJBExXSV6D
         lbqtiLoJxmFiw6PrYXilN/Ro7QvEmxqlGbg04q9ro01gqaoJAzmLZy/+zQ3DMqdwKWCH
         ZdM/xSZrYGWerPF/tR50Tw9vTx6s2WSThXcGwOLRJv+tskGl+rJY8f0x6IAM1iXHHmsT
         hugEzCvSeboyCniBHQVeGZSS70DiOQNRcJYwQam3OLLZB9l1d0PKMIzrCeq4fUfONHef
         HoBJYFVNE+aw92BRxXNZQLclwoKPAl1/OvlnmiZG9qnXPd2MzX6dgUlWIlJfZjM4ZRRH
         7vSw==
X-Gm-Message-State: AC+VfDxT3ZBfdppzOhKJDK9Qci4040AcL4jrDmPdMvlYT/tY444wt98N
	MkTSm2B8EEpSNWIdMNHlSrtmmsB4B6s=
X-Google-Smtp-Source: ACHHUZ5JZppK6hNfswhJyBhqlS10ltuHD/T+NpNvqrlFBuG5cpMEgATkD7qhDMl/nUnWyfGz+DvrQw==
X-Received: by 2002:a05:6402:184d:b0:50d:ba93:be51 with SMTP id v13-20020a056402184d00b0050dba93be51mr9254053edy.26.1684776398639;
        Mon, 22 May 2023 10:26:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/8] Remove usage of /var/volatile/tmp
Date: Mon, 22 May 2023 19:25:00 +0200
Message-Id: <20230522172503.1651374-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230522172503.1651374-1-alex@linutronix.de>
References: <20230522172503.1651374-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181605

From: Markus Volk <f_l_k@t-online.de>

Glib-2.0 uses ptest to ensure that /tmp is not a symlink.

This commit tries to align tmpdir usage. The symlinks for /tmp and /var/tmp are
replaced by directories and by default a tmpfs is mounted in /tmp.
/var/volatile/tmp is removed.

(From OE-Core rev: 3563f05df246f9fd24d7b20a65ce77787ed508b6)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                        |  4 ---
 meta/files/fs-perms-persistent-log.txt        |  2 --
 meta/files/fs-perms.txt                       |  2 --
 .../lib/oeqa/files/buildhistory_filelist1.txt |  1 -
 .../lib/oeqa/files/buildhistory_filelist2.txt |  1 -
 meta/recipes-core/base-files/base-files/fstab |  1 +
 .../base-files/base-files_3.0.14.bb           |  4 +--
 .../initscripts-1.0/populate-volatile.sh      |  2 +-
 .../initscripts/initscripts-1.0/volatiles     |  5 ++-
 .../initscripts/initscripts_1.0.bb            |  3 --
 .../systemd/systemd/00-create-volatile.conf   |  4 +--
 meta/recipes-core/systemd/systemd_253.3.bb    |  7 ----
 meta/recipes-core/udev/eudev/init             |  4 ---
 .../e2fsprogs/e2fsprogs/run-ptest             |  2 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 -------------------
 .../valgrind/valgrind_3.20.0.bb               |  1 -
 16 files changed, 8 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 314cc466625..498bca42fb6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -90,10 +90,6 @@ ROOT_HOME ??= "/home/root"
 # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
 VOLATILE_LOG_DIR ?= "yes"
 
-# if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/tmp
-# otherwise:       /tmp is on persistent storage
-VOLATILE_TMP_DIR ?= "yes"
-
 BB_RENAMED_VARIABLES[PNBLACKLIST] = "SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] = "CVE_CHECK_SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] = "CVE_CHECK_IGNORE"
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
index 518c1be3c93..326c0ed0924 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index daa4aed840f..ed59311035d 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -48,7 +48,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 ${localstatedir}/run	link	/run
 ${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -58,7 +57,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/lib/oeqa/files/buildhistory_filelist1.txt b/meta/lib/oeqa/files/buildhistory_filelist1.txt
index 8d882895ad5..ec500173838 100644
--- a/meta/lib/oeqa/files/buildhistory_filelist1.txt
+++ b/meta/lib/oeqa/files/buildhistory_filelist1.txt
@@ -9210,5 +9210,4 @@ lrwxrwxrwx root       root               12 ./var/log -> volatile/log
 lrwxrwxrwx root       root                6 ./var/run -> ../run
 drwxr-xr-x root       root             4096 ./var/spool
 drwxrwxr-x root       mail             4096 ./var/spool/mail
-lrwxrwxrwx root       root               12 ./var/tmp -> volatile/tmp
 drwxr-xr-x root       root             4096 ./var/volatile
diff --git a/meta/lib/oeqa/files/buildhistory_filelist2.txt b/meta/lib/oeqa/files/buildhistory_filelist2.txt
index ac6307060df..cedec51c382 100644
--- a/meta/lib/oeqa/files/buildhistory_filelist2.txt
+++ b/meta/lib/oeqa/files/buildhistory_filelist2.txt
@@ -9213,5 +9213,4 @@ lrwxrwxrwx root       root               12 ./var/log -> volatile/log
 lrwxrwxrwx root       root                6 ./var/run -> ../run
 drwxr-xr-x root       root             4096 ./var/spool
 drwxrwxr-x root       mail             4096 ./var/spool/mail
-lrwxrwxrwx root       root               12 ./var/tmp -> volatile/tmp
 drwxr-xr-x root       root             4096 ./var/volatile
diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index 70e400f5674..7064573130b 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -5,6 +5,7 @@ proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults              0  0
+tmpfs                /tmp                 tmpfs      defaults              0  0
 
 # uncomment this if your device has a SD/MMC/Transflash slot
 #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ff83567bd91..c2ecea0a257 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -29,7 +29,7 @@ S = "${WORKDIR}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 docdir:append = "/${P}"
-dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
+dirs1777 = "/tmp /var/tmp"
 dirs2775 = ""
 dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -53,7 +53,7 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
+volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index bc630e871c1..ecfb6fdc2b5 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -23,7 +23,7 @@ ROOT_DIR="$(echo "$DIRNAME" | sed -ne 's:/etc/.*::p')"
 [ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
 
 CFGDIR="${ROOT_DIR}/etc/default/volatiles"
-TMPROOT="${ROOT_DIR}/var/volatile/tmp"
+TMPROOT="${ROOT_DIR}/tmp"
 COREDEF="00_core"
 
 [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f2..7232a8ef900 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -25,11 +25,10 @@
 # link the file defined as /var/test will actually be created as /tmp/testfile.
 d root root 1777 /run/lock none
 d root root 0755 /var/volatile/log none
-d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
-l root root 1777 /var/tmp /var/volatile/tmp
-l root root 1777 /tmp /var/tmp
+d root root 1777 /tmp
+d root root 1777 /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
 f root root 0664 /var/run/utmp none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 4dc477bb8d6..7c9d9ca4f10 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -108,9 +108,6 @@ do_install () {
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
 	fi
-	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
-		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
-	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
 
diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index c4277221a22..1ba9b836cf0 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -1,8 +1,6 @@
 #This goes hand-in-hand with the base-files of OE-Core. The file must
-# be sorted before 'systemd.conf' becuase this attempts to create a file
+# be sorted before 'systemd.conf' because this attempts to create a file
 # inside /var/log.
 
-
 d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
-d		/var/volatile/tmp		1777	-	-
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index a79d6cb3ca0..09432f91926 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -291,13 +291,6 @@ do_install() {
 		rm -rf ${D}${localstatedir}/log/journal/remote
 	fi
 
-	# if the user requests /tmp be on persistent storage (i.e. not volatile)
-	# then don't use a tmpfs for /tmp
-	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
-		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
-	fi
-
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
 	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
 	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 477a525b212..2084de83ae3 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -79,10 +79,6 @@ case "$1" in
     }
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
-    # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
-    # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
-    # /var/volatile/tmp directory to be available.
-    mkdir -m 1777 -p /var/volatile/tmp
 
     # make_extra_nodes
     kill_udevd > "/dev/null" 2>&1
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8ef..020bb69b168 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -2,7 +2,7 @@
 
 cd ./test
 SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
-rm -rf /var/volatile/tmp/*e2fsprogs*
+rm -rf /tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
 rm -f *.ok
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
deleted file mode 100644
index e421ac6c801..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Jan 2020 17:55:39 +0100
-Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
-
-In oe-core, /tmp is linked to /var/volatile/tmp and
-valgrind output changes accordingly
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- none/tests/fdleak_cmsg.stderr.exp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
-index 6e5a797b9..0ede1ab18 100644
---- a/none/tests/fdleak_cmsg.stderr.exp
-+++ b/none/tests/fdleak_cmsg.stderr.exp
-@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
- 
- 
- FILE DESCRIPTORS: 6 open (3 std) at exit.
--Open file descriptor ...: /tmp/data2
-+Open file descriptor ...: ...
-    ...
- 
--Open file descriptor ...: /tmp/data1
-+Open file descriptor ...: ...
-    ...
- 
- Open AF_UNIX socket ...: <unknown>
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
index 07e50426e44..4ea173ba803 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
@@ -36,7 +36,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
            file://s390x_vec_op_t.patch \
-           file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-drd-tests-Include-missing-cstdint.patch \
-- 
2.30.2


