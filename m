Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC5BC2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 16:59:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.18014.1660669145111054483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QTE/dfzE;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so10226668pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Hoa3pBEItjavgdh2dWU9su9dh1AvZn+1L4cDgbD85oM=;
        b=QTE/dfzE9MK++2tXaRn42c6/OiXjg4D/0B9oKDjkUfU7wAG/aeqpyew0Pmt4vhyas4
         kJ7VaEI1nOG/bBP9pA2bP1KpfQOWUeFqGjsDR3u8fdAABgBjOTPxHK+h9HFGEGhZBdFh
         P/I8vMcLLv5lE/gmBG8Ta5Lsrm+9cXAsWJ86j5lnPzVnroeZGkuhPL9NjiEr6gnqi8wV
         9NUNIsZFOK8Qo8HIpoFfN48YXECQQZWHhzJS3O8jTVvQrznTAPV2X0lX4UgRpIV38HR4
         dQUerOjwBThslnaJkQmwLLJivR1iZYRwSoQBNVRpIoWy5YpW4Sgwby/HilylDGo+hPxu
         E4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Hoa3pBEItjavgdh2dWU9su9dh1AvZn+1L4cDgbD85oM=;
        b=T6l6I+LYpQAD5K7ppKkwjlbhdhGLyyNk2o6amio+dEYKUYeNUZQpekvVlwQvQbylP2
         ZkS0ZTOnS+MN4xHwGopCv4guwvnodpw5F02aVqpnISRhUkidsWvWVn0YD/DBbZWI7iov
         fb5WypxHs/yWdraSpny57HT1QdzADxercB5hSIRvQ2BZPbVRywjwCCN45P54FbwsgPka
         SFkeyMt2V7lP1/K5wlpUbOC5SV+OPolg5VUvIeT/LqJcCWq/8tGuhewt6mg7H8KPyRhW
         28J7QxY/3tbHb//ggo8A58qMpWMaVTtFeuIHk8fR4aI+xjekDsN8OGJP369p/OCLENxY
         Tj2Q==
X-Gm-Message-State: ACgBeo0ma6cBnNtsaSd4fgQxdou9ucas1KXEE3S/3Shvt6GGhpAkmcd0
	rgoQz0ZF3DBewP+vXyfCyYoCoeE3i7Q7Rg==
X-Google-Smtp-Source: 
 AA6agR7cF9idthAAWZUE5X/ktFZAtdVd6fItYiYKhyeGZJLG5bd4MH2CpL1/QNXsdrOOulXeDDb/pw==
X-Received: by 2002:a17:902:e744:b0:170:d01d:df10 with SMTP id
 p4-20020a170902e74400b00170d01ddf10mr23150374plf.40.1660669143961;
        Tue, 16 Aug 2022 09:59:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a17090a531500b001f04479017fsm6562577pjh.29.2022.08.16.09.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:59:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/7] nfs-utils: Upgrade to 2.6.2
Date: Tue, 16 Aug 2022 09:58:54 -0700
Message-Id: <20220816165857.2342796-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816165857.2342796-1-raj.khem@gmail.com>
References: <20220816165857.2342796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 16:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169445

Fix build with clang
Package new rpcctl utility into a new package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...td-Check-for-return-of-stat-function.patch | 34 +++++++
 .../0006-Fix-function-prototypes.patch        | 93 +++++++++++++++++++
 ...{nfs-utils_2.6.1.bb => nfs-utils_2.6.2.bb} | 11 ++-
 3 files changed, 135 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.1.bb => nfs-utils_2.6.2.bb} (92%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
new file mode 100644
index 00000000000..13a21e53070
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
@@ -0,0 +1,34 @@
+From 887ecc7837962e9be77a4fea7d9122648f73a84a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 14:47:53 -0700
+Subject: [PATCH] mountd: Check for return of stat function
+
+simplify the check, stat() return 0 on success -1 on failure
+
+Fixes clang reported errors e.g.
+
+| v4clients.c:29:6: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
+|         if (!stat("/proc/fs/nfsd/clients", &sb) == 0 ||
+|             ^                                   ~~
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-nfs/patch/20220816024403.2694169-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Konstantin Khorenko <khorenko@virtuozzo.com>
+Cc: Steve Dickson <steved@redhat.com>
+---
+ support/export/v4clients.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/support/export/v4clients.c b/support/export/v4clients.c
+index 5f15b61..3230251 100644
+--- a/support/export/v4clients.c
++++ b/support/export/v4clients.c
+@@ -26,7 +26,7 @@ void v4clients_init(void)
+ {
+ 	struct stat sb;
+ 
+-	if (!stat("/proc/fs/nfsd/clients", &sb) == 0 ||
++	if (stat("/proc/fs/nfsd/clients", &sb) != 0 ||
+ 	    !S_ISDIR(sb.st_mode))
+ 		return;
+ 	if (clients_fd >= 0)
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
new file mode 100644
index 00000000000..793bc4651cd
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
@@ -0,0 +1,93 @@
+From cf0ffbb5c8fa167376926d12a63613f15aa7602f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 14:50:15 -0700
+Subject: [PATCH] Fix function prototypes
+
+Clang is now erroring out on functions with out parameter types
+
+Fixes errors like
+error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-nfs/patch/20220816024403.2694169-2-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ support/export/auth.c     | 2 +-
+ support/export/v4root.c   | 2 +-
+ support/export/xtab.c     | 2 +-
+ utils/exportfs/exportfs.c | 4 ++--
+ utils/mount/network.c     | 2 +-
+ 5 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/support/export/auth.c b/support/export/auth.c
+index 03ce4b8..2d7960f 100644
+--- a/support/export/auth.c
++++ b/support/export/auth.c
+@@ -82,7 +82,7 @@ check_useipaddr(void)
+ }
+ 
+ unsigned int
+-auth_reload()
++auth_reload(void)
+ {
+ 	struct stat		stb;
+ 	static ino_t		last_inode;
+diff --git a/support/export/v4root.c b/support/export/v4root.c
+index c12a7d8..fbb0ad5 100644
+--- a/support/export/v4root.c
++++ b/support/export/v4root.c
+@@ -198,7 +198,7 @@ static int v4root_add_parents(nfs_export *exp)
+  * looking for components of the v4 mount.
+  */
+ void
+-v4root_set()
++v4root_set(void)
+ {
+ 	nfs_export	*exp;
+ 	int	i;
+diff --git a/support/export/xtab.c b/support/export/xtab.c
+index c888a80..e210ca9 100644
+--- a/support/export/xtab.c
++++ b/support/export/xtab.c
+@@ -135,7 +135,7 @@ xtab_write(char *xtab, char *xtabtmp, char *lockfn, int is_export)
+ }
+ 
+ int
+-xtab_export_write()
++xtab_export_write(void)
+ {
+ 	return xtab_write(etab.statefn, etab.tmpfn, etab.lockfn, 1);
+ }
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
+index 6ba615d..0897b22 100644
+--- a/utils/exportfs/exportfs.c
++++ b/utils/exportfs/exportfs.c
+@@ -69,14 +69,14 @@ static int _lockfd = -1;
+  * need these additional lockfile() routines.
+  */
+ static void
+-grab_lockfile()
++grab_lockfile(void)
+ {
+ 	_lockfd = open(lockfile, O_CREAT|O_RDWR, 0666);
+ 	if (_lockfd != -1)
+ 		lockf(_lockfd, F_LOCK, 0);
+ }
+ static void
+-release_lockfile()
++release_lockfile(void)
+ {
+ 	if (_lockfd != -1) {
+ 		lockf(_lockfd, F_ULOCK, 0);
+diff --git a/utils/mount/network.c b/utils/mount/network.c
+index ed2f825..01ead49 100644
+--- a/utils/mount/network.c
++++ b/utils/mount/network.c
+@@ -179,7 +179,7 @@ static const unsigned long probe_mnt3_only[] = {
+ 
+ static const unsigned int *nfs_default_proto(void);
+ #ifdef MOUNT_CONFIG
+-static const unsigned int *nfs_default_proto()
++static const unsigned int *nfs_default_proto(void)
+ {
+ 	extern unsigned long config_default_proto;
+ 	/*
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
similarity index 92%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
index bbed5aea59b..42311c66c73 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
@@ -30,8 +30,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
+           file://0005-mountd-Check-for-return-of-stat-function.patch \
+           file://0006-Fix-function-prototypes.patch \
            "
-SRC_URI[sha256sum] = "60dfcd94a9f3d72a12bc7058d811787ec87a6d593d70da2123faf9aad3d7a1df"
+SRC_URI[sha256sum] = "5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -70,7 +72,7 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmap
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
 
-PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
+PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
 
 CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
@@ -93,9 +95,12 @@ FILES:${PN}-mount = "${base_sbindir}/*mount.nfs*"
 FILES:${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat ${sbindir}/nfsdclnts"
 RDEPENDS:${PN}-stats = "python3-core"
 
+FILES:${PN}-rpcctl = "${sbindir}/rpcctl"
+RDEPENDS:${PN}-rpcctl = "python3-core"
+
 FILES:${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
 
-FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"
+FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_base_libdir}/modprobe.d"
 
 do_configure:prepend() {
 	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-- 
2.37.2


