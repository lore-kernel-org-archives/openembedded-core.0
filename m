Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEFF76ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:41 +0000 (UTC)
Received: by igfj19 with SMTP id j19so70077066igf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MpP/ECZ5b/UiDkPwDCAWsgXy5+JrnvKkziscLyf6nHs=;
	b=wEUi+uN+/os7A4+orU610sqHSpMSkJWWjVdqmwtwJlvw+FQz/WC2aRJ04auMR64sIb
	+0xcZW5m8yni/W1pI+JoE+Ol8DfOojw0saV2sWkBqwKY6R02nIdA/L1GHGWVxf1PlLip
	GRLk0Ql+oG85smlD9prQf27bFdjulc9n1bwjewbqdz6+g1ilaE4AprbwywINSTzWa7kG
	Co2vjcnCSsIBMUDV3w+EQ6cYjczlE0a+0pTYc0ADQ6yzQnlftLBXZR+ry11jkLCdM76h
	3rtmUQTTtYBOc7tMMvFFDpGtuApkREJ6Ht+NF8tWql8YfSB2qMXXmWQlvGk1ucihLw0e
	cYAA==
X-Received: by 10.50.20.135 with SMTP id n7mr17753517ige.58.1440446622119;
	Mon, 24 Aug 2015 13:03:42 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:21 -0700
Message-Id: <274f856f9e614e0d5bab8e65cb4ac69cddf7195b.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 03/17] systemd: Cache/define tool paths for target
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:43 -0000

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
2.1.4


