Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283AAC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:43 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.6476.1646731962058689350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XVuAvrs1;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id qt6so37785472ejb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PoGd5SBrnvUh9NKL3q3+SNc87ouru9t4KkK3ApFu7Ng=;
        b=XVuAvrs1TCyfFRWOTFAm3bvvmWTsh7uAg66ri4oGSXpb+aA4BMvShocFhOBdciBk7M
         dPdpYj/SfEjcmPu9MNH/u3PNlSMn6fpRy0JPdkJ9Cn2E5l0+Yc8U4HXVw99iXLOANj7M
         Sj3MKl8tz2nH4t8OFPYDl0LxPiuUxZbZC7gYWRhXZhUluZA3XUZFoYHdVh64+NSAzBdy
         0/Wa7CGTe82M5Xrl6uhXijcZR7I1DIVIaicZPwnpa42Cm5cZixygPyLgKOdoZj0H1fKB
         /VHjC+U1nMAS1rRSFkwOpz1TP20WrmR0v4Z2XtL3x9mKauhmHKwOu/FBqIrU57RSqgbm
         yPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PoGd5SBrnvUh9NKL3q3+SNc87ouru9t4KkK3ApFu7Ng=;
        b=ul1b/CcpWL1aV4o6rjOdKq0XsA97D00vC+kYgPncj2mdhPUfiEpdqBPP9NYsRSzkpi
         QR2Zsrz6AJBO7o25EKwfgr49sS+1i+YCd7tUpO1xd/sOAOsi99kLi9gC4NY+4skwcYxq
         eJQZ/qGZuWH7ImROVtG8rDl8F43tv8ET+gXD33U6o05tYcwHjXYmU6LdHN/l9XpBq6Z6
         E8QFF2mPoHngjKTkJuZ5QULG9FsBRqi5uifiuS8QuKDCLixcOxaQMZ4uJ0kvJk8P7urC
         qbTXxKwdu4GacdU+WpFnu6l/yzkAOgC2uaoP3WpwQyMVKrSoL909BwNd/+/450zIXpd4
         x9xA==
X-Gm-Message-State: AOAM533I72cMyUqwXpRuzKr7tkDIGHuL4Nfd/XeuuQmDtNe8hjEVtzQV
	QJe1aGm2NM9a1K8Rk8ooHuvJpQAqOBg=
X-Google-Smtp-Source: 
 ABdhPJwMOfPtA1aBSDbtlpCSNBAOoU8I6K3JgjLL+7bQ+LQFqS/aEunMFAvSHUTav7gtBacjMAb8dA==
X-Received: by 2002:a17:907:6e06:b0:6da:889b:321c with SMTP id
 sd6-20020a1709076e0600b006da889b321cmr12084434ejc.510.1646731960594;
        Tue, 08 Mar 2022 01:32:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/16] openssh: update 8.8 -> 8.9
Date: Tue,  8 Mar 2022 10:32:24 +0100
Message-Id: <20220308093224.3436483-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162893

License-Update: blowfish relicensed under 3-BSD.

Fix up ptests; listing the helper binaries one by one
is not necessary. Unittests are skipped explicitly in run-ptest,
no need to avoid building them. They still take long, but they
can be executed on target if wanted.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...467179428a0e3ea9e4aa9738ac12ff02822d.patch | 35 +++++++++++++++++++
 .../openssh/openssh/run-ptest                 |  2 +-
 .../{openssh_8.8p1.bb => openssh_8.9p1.bb}    | 16 +++++----
 3 files changed, 45 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.8p1.bb => openssh_8.9p1.bb} (93%)

diff --git a/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch b/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
new file mode 100644
index 0000000000..847c0a143c
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
@@ -0,0 +1,35 @@
+From f107467179428a0e3ea9e4aa9738ac12ff02822d Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Thu, 24 Feb 2022 16:04:18 +0000
+Subject: [PATCH] Improve detection of -fzero-call-used-regs=all support
+
+GCC doesn't tell us whether this option is supported unless it runs into
+the situation where it would need to emit corresponding code.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ m4/openssh.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/m4/openssh.m4 b/m4/openssh.m4
+index 4f9c3792dc1..8c33c701b8b 100644
+--- a/m4/openssh.m4
++++ b/m4/openssh.m4
+@@ -14,6 +14,8 @@ AC_DEFUN([OSSH_CHECK_CFLAG_COMPILE], [{
+ 	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #include <stdlib.h>
+ #include <stdio.h>
++/* Trivial function to help test for -fzero-call-used-regs */
++void f(int n) {}
+ int main(int argc, char **argv) {
+ 	(void)argv;
+ 	/* Some math to catch -ftrapv problems in the toolchain */
+@@ -21,6 +23,7 @@ int main(int argc, char **argv) {
+ 	float l = i * 2.1;
+ 	double m = l / 0.5;
+ 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
++	f(0);
+ 	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
+ 	/*
+ 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index ae03e929b2..8a9b770d59 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -5,7 +5,7 @@ export SKIP_UNIT=1
 
 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
-make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
+make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
         | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
 SSHAGENT=`which ssh-agent`
diff --git a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
similarity index 93%
rename from meta/recipes-connectivity/openssh/openssh_8.8p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 953c29dbf2..6c5c1912e8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -5,8 +5,8 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
-LICENSE = "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & ISC & MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=d9d2753bdef9f19466dc7bc959114b11"
+LICENSE = "BSD-2-Clause & BSD-3-Clause & ISC & MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=8baf365614c9bdd63705f298c9afbfb9"
 
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -24,8 +24,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
            "
-SRC_URI[sha256sum] = "4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9"
+SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
@@ -76,6 +77,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp and logwtmp
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
+# https://bugzilla.mindrot.org/show_bug.cgi?id=3398
+EXTRA_OECONF:append:powerpc = " --with-sandbox=no"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
@@ -94,10 +98,7 @@ do_configure:prepend () {
 }
 
 do_compile_ptest() {
-        # skip regress/unittests/ binaries: this will silently skip
-        # unittests in run-ptests which is good because they are so slow.
-        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat \
-                   regress/check-perm regress/mkdtemp
+	oe_runmake regress-binaries regress-unit-binaries
 }
 
 do_install:append () {
@@ -145,6 +146,7 @@ do_install:append () {
 do_install_ptest () {
 	sed -i -e "s|^SFTPSERVER=.*|SFTPSERVER=${libexecdir}/sftp-server|" regress/test-exec.sh
 	cp -r regress ${D}${PTEST_PATH}
+	cp config.h ${D}${PTEST_PATH}
 }
 
 ALLOW_EMPTY:${PN} = "1"
-- 
2.30.2


