Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EB8A760125
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 01:22:08 +0000 (UTC)
Received: by iodv127 with SMTP id v127so102779906iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C/8NQ/L5Ufhy0hvhyAW78d0mguTZgo0HxVy0RURfTNk=;
	b=ZukgTaPxxiMQYchTxRt3DyzXqcIbwnmK19iG/BG3fGkdsDM3ixc97+cGSS2NDWzGZC
	ytLW5A8A1lfl1dn+zZzaouiGIIIoH+RkehlUkN531Piz/4LKIL6FiU15GOSXk0i8l3Ph
	3g3lecTABhd+NEg3tbHweIUbikp7KV390tySciwkGIwKgpvXWgaIMlP17WJhpD9pls8e
	CSfV0kR19JelxnJG2xUU3thXQIKMU0aPZ32NSQP2O/xp1JwPdS6bweDvY5nzxs4Er412
	43rm9ak3TFzW7PqIMqnBzRBaAMlfCAs3fO7aOK0oc6+jRulfLQQT9xijl6ePnfkdxyjo
	McjA==
X-Received: by 10.107.36.134 with SMTP id k128mr52187340iok.113.1439688128592; 
	Sat, 15 Aug 2015 18:22:08 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id 85sm9102909iot.6.2015.08.15.18.22.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Aug 2015 18:22:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Aug 2015 18:22:01 -0700
Message-Id: <1439688121-32636-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
References: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/4] systemd: Cache/define tool paths for target
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
X-List-Received-Date: Sun, 16 Aug 2015 01:22:10 -0000

Recently, systemd has added a patch

f00929ad622c978f8ad83590a15a765b4beecac9

where it now pokes at the system to find
out the path of mount/umount tools, this caused the builds to fail
because it ended up with identifying these programs from native sysroot
but they were actually meant for target, this lead to boot failures due
to none of mount worked because the paths are encoded into systemd
binaries during build time.

Correct few others while here, these are not yet detected wrongly in my
build, because those binaries are not found in my native sysroot but if
some one staged the native providers of these packages they will fail too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_224.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_224.bb b/meta/recipes-core/systemd/systemd_224.bb
index 16eb497..97d5d22 100644
--- a/meta/recipes-core/systemd/systemd_224.bb
+++ b/meta/recipes-core/systemd/systemd_224.bb
@@ -98,7 +98,17 @@ rootprefix ?= "${base_prefix}"
 rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
-# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+CACHED_CONFIGUREVARS_class-target = "\
+                         ac_cv_path_MOUNT_PATH=${base_bindir}/mount \
+                         ac_cv_path_UMOUNT_PATH=${base_bindir}/umount \
+                         ac_cv_path_KMOD=${base_bindir}/kmod \
+                         ac_cv_path_KILL=${base_bindir}/kill \
+                         ac_cv_path_SULOGIN=${base_sbindir}/sulogin \
+                         ac_cv_path_KEXEC=${sbindir}/kexec \
+                         ac_cv_path_QUOTACHECK=${sbindir}/quotacheck \
+                         ac_cv_path_QUOTAON=${sbindir}/quotaon \
+			 "
+
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  --with-roothomedir=${ROOT_HOME} \
-- 
2.5.0


