Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.7721.1585951183135369681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oc95cAAd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id e9so9374730wme.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rGBGiV7BzzmTM5GYIAH6xZqq21JsB5gYfktDRL39DAo=;
        b=Oc95cAAdflslUZZZLDvw4hsMym6lhfUv46lsNtKt3Hw8kEYuMB1Wv18owNSQJ8JNxc
         6JWrQ4rXKfDWuyzot9Gon7/WIeVfHaWTrp0iUxlZre4T8ZRVNAGcde1SE2CyuROa/zGt
         SpzanxocdwS3o+Ey2aKmc5CqkGuVgjA/9lOTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rGBGiV7BzzmTM5GYIAH6xZqq21JsB5gYfktDRL39DAo=;
        b=kPbR+09gc8ystke1CGj7JcCNId3XivRW9uzGHOlB4ZGi7AsxMjoXc/HMwEnWyhybRx
         FAzym6wEaCStJqNjPcEmLAlQ8R+qFwDRbRT8G9vlYp9r/1oPbK6WOQvg2yt5Kq7WcWSO
         bUX5kSs2ve1qgoA2vd/+y68SdXixyFJo+vRTGaL/RG9IFE6T+wXinC4LHaxdgXsO/R8/
         snqlVW9DaHCX/cumTd1nBA5X/wBBNv1dpMUFvxWPppAEMv0MfP4p8m9wbfR78wgRBwSP
         qK/M+jmnWmfykpK8/iBwcndHz2C2ePoz4s03YOl7exXbvA84J1iI9/TrACdWJdk0NXdd
         OwGA==
X-Gm-Message-State: AGi0PuZfno0tgxFrdjEFaaDYRhOKMG/zZC21FZpdIAfb9LbTCjdYoSY9
	XGvHK0SRHy8AZx93ZZrl/pqE4zgnVtI=
X-Google-Smtp-Source: APiQypLHClzoG8/4cmvTQ7ltb/QH42W/bwcTXPWsIsZH+6fkiSRvFUn01XvoWRJlaPSxw/1GWnYCCg==
X-Received: by 2002:a1c:4e:: with SMTP id 75mr10376501wma.24.1585951180890;
        Fri, 03 Apr 2020 14:59:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b203sm13185537wmc.45.2020.04.03.14.59.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:59:40 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
Date: Fri,  3 Apr 2020 22:59:38 +0100
Message-Id: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pseudo changes the syscall access patterns which makes it incompatible with
seccomp. Therefore intercept the seccomp syscall and alter it, pretending that
seccomp was setup when in fact we do nothing. If we error as unsupported,
utilities like file will exit with errors so we can't just disable it.

This works around issues on platforms where seccomp is enabled in file
(e.g. archlinux).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/seccomp.patch                | 124 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch

diff --git a/meta/recipes-devtools/pseudo/files/seccomp.patch b/meta/recipes-devtools/pseudo/files/seccomp.patch
new file mode 100644
index 00000000000..dd4ba666a90
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/seccomp.patch
@@ -0,0 +1,124 @@
+Pseudo changes the syscall access patterns which makes it incompatible with
+seccomp. Therefore intercept the seccomp syscall and alter it, pretending that
+seccomp was setup when in fact we do nothing. If we error as unsupported, 
+utilities like file will exit with errors so we can't just disable it.
+
+Upstream-Status: Pending
+RP 2020/4/3
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/ports/linux/pseudo_wrappers.c
+===================================================================
+--- git.orig/ports/linux/pseudo_wrappers.c
++++ git/ports/linux/pseudo_wrappers.c
+@@ -57,6 +57,7 @@ int pseudo_capset(cap_user_header_t hdrp
+ long
+ syscall(long number, ...) {
+ 	long rc = -1;
++	va_list ap;
+ 
+ 	if (!pseudo_check_wrappers() || !real_syscall) {
+ 		/* rc was initialized to the "failure" value */
+@@ -77,6 +78,20 @@ syscall(long number, ...) {
+ 	(void) number;
+ #endif
+ 
++#ifdef SYS_seccomp
++	/* pseudo and seccomp are incompatible as pseudo uses different syscalls
++	 * so pretend to enable seccomp but really do nothing */
++	if (number == SYS_seccomp) {
++		unsigned long cmd;
++		va_start(ap, number);
++		cmd = va_arg(ap, unsigned long);
++		va_end(ap);
++		if (cmd == SECCOMP_SET_MODE_FILTER) {
++		    return 0;
++		}
++	}
++#endif
++
+ 	/* gcc magic to attempt to just pass these args to syscall. we have to
+ 	 * guess about the number of args; the docs discuss calling conventions
+ 	 * up to 7, so let's try that?
+@@ -92,3 +108,42 @@ static long wrap_syscall(long nr, va_lis
+ 	(void) ap;
+ 	return -1;
+ }
++
++int
++prctl(int option, ...) {
++	int rc = -1;
++	va_list ap;
++
++	if (!pseudo_check_wrappers() || !real_syscall) {
++		/* rc was initialized to the "failure" value */
++		pseudo_enosys("prctl");
++		return rc;
++	}
++
++	/* pseudo and seccomp are incompatible as pseudo uses different syscalls
++	 * so pretend to enable seccomp but really do nothing */
++	if (option == PR_SET_SECCOMP) {
++		unsigned long cmd;
++		va_start(ap, option);
++		cmd = va_arg(ap, unsigned long);
++		va_end(ap);
++		if (cmd == SECCOMP_SET_MODE_FILTER) {
++		    return 0;
++		}
++	}
++
++	/* gcc magic to attempt to just pass these args to syscall. we have to
++	 * guess about the number of args; the docs discuss calling conventions
++	 * up to 4, so let's try that?
++	 */
++	void *res = __builtin_apply((void (*)()) real_prctl, __builtin_apply_args(), sizeof(long) * 4);
++	__builtin_return(res);
++}
++
++/* unused.
++ */
++static int wrap_prctl(int option, va_list ap) {
++	(void) option;
++	(void) ap;
++	return -1;
++}
+Index: git/ports/linux/guts/prctl.c
+===================================================================
+--- /dev/null
++++ git/ports/linux/guts/prctl.c
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2020 Richard Purdie
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ * int prctl(int option, ...)
++ *	int rc = -1;
++ */
++
++	/* we should never get here, prctl is hand-wrapped */
++	rc = -1;
++
++/*	return rc;
++ * }
++ */
+Index: git/ports/linux/portdefs.h
+===================================================================
+--- git.orig/ports/linux/portdefs.h
++++ git/ports/linux/portdefs.h
+@@ -32,3 +32,5 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
+ 
+ #include <linux/capability.h>
+ #include <sys/syscall.h>
++#include <sys/prctl.h>
++#include <linux/seccomp.h>
+Index: git/ports/linux/wrapfuncs.in
+===================================================================
+--- git.orig/ports/linux/wrapfuncs.in
++++ git/ports/linux/wrapfuncs.in
+@@ -56,3 +56,4 @@ int getgrent_r(struct group *gbuf, char
+ int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=pseudo_capset */
+ long syscall(long nr, ...); /* hand_wrapped=1 */
+ int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags); /* flags=AT_SYMLINK_NOFOLLOW */
++int prctl(int option, ...); /* hand_wrapped=1 */
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d921d85a05c..89e43c59969 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0001-Add-statx.patch \
            file://0001-realpath.c-Remove-trailing-slashes.patch \
            file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
+           file://seccomp.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.25.1

