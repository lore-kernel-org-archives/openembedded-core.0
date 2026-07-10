Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7138DC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1862.1783701434837365449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xWXJbEKW;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so8448555e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701433; x=1784306233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAazCRUchFyPQ9exVaNV58quNTX3DiX0gdUkmDaKnxI=;
        b=xWXJbEKWZ4n6DA/Xdu345C/pqhLVKBP1kQLcK0P2yS0xvJ+lHP700MQacjx1z1WMjs
         QSttbLCjUDqbS//hdfX0O65czq15GQyYUyTZqRaASgemFYYScXCow3JLhhnz955M2gYi
         yEmm35D1Np++oreyBTuF0BiF97VjrgHtH33Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701433; x=1784306233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MAazCRUchFyPQ9exVaNV58quNTX3DiX0gdUkmDaKnxI=;
        b=ViDsqD07pNZDpf2MM19X+2WA03LSKezydOX21RR/eg+0QTjEL1vuAo11OAszlew4C7
         wGYP2rJzS40NG+FaaLDqsYdNNSGFDyhtesWV8c4arUPRA8hXaDPMJUgKFMDwsL7DZIy+
         0tR7y+O6BfOfq2h01zLSIAfY0O8v+z1+RzLPcUIBEZBkAoYuwEG4cOfGqDc6J9m8LqHf
         x83OiRHUYY0r6Ck9VesPZZNkS+r/PMNS0lhUtHs7j+SLOgQM8NqMeHf4eV3z3W40G7RT
         W5VDYBvndCjWjngVs27gG1l+noapOHtCfKB9hrxYtYhXn0sA6Ru5GhiBpQ9S0/eGx+QG
         51iQ==
X-Gm-Message-State: AOJu0Yymwh8jyFn0kj+15YSu0LEdpvUYeJRBfmLBVyvxYjCSRfX0wAxP
	OXVILLIVsv2ttuz+Pl+fERL+QrTlbIxcQXNsnuGjDpt0rUyKDX9+my8f+6R2vKzaUrqBAaav6fh
	oFGZyYcg=
X-Gm-Gg: AfdE7cnFUF8ZHt0KOtZoHemlWRqjfAf9XBiheB1QOoEXA93AvdG1vEfikHDMyMieb8L
	oO/M0PbjnXz0PVjJj8RIpKrqwJxQk9lmfl32goG/nmUWNLAian+YBdIyixBnYGUngmVyfvplllv
	/WcB2R4mYrzaUcW2pk9H9zsw++U3wsmtDq2zNZZhog7kyL0/HKxX48iCZFtOho4aeoyHiPcJVaa
	K/JjQDNPHKOUOxtEmnhhOdlkPC38FFeP30bXN+syTG/ddQ0wtjInyBeeCKda2SBusov/DX/Zdj7
	tPHbOQXnfNEHQ8uzMGgTSUrRYvgJGRPtuEoPI+C+hwvptejChhyiiJTx/YnVPCZJ4T3ocsmH4Wt
	GatxtrU+C5pLi2OEiIRsAwv8EqILpsySa1fqST/IYQtlnUrym6jJY4M9rE7zPDL8uxhmTrROoLJ
	jzTKlRZeg4YJQntf6QEZX9ZskeI3Q3DrNvcIupE4o5Qugqvg9PHtgOaB/U3cDopRVzSnZYMVBiE
	kU4cZ4rucIT7eCAdkU=
X-Received: by 2002:a05:600c:8119:b0:493:ee34:d875 with SMTP id 5b1f17b1804b1-493f2b3369fmr43098095e9.10.1783701433024;
        Fri, 10 Jul 2026 09:37:13 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/18] libcap: Fix CVE-2026-4878
Date: Fri, 10 Jul 2026 18:36:29 +0200
Message-ID: <79ccba312aca8733e6f22b5349a9383de7645e10.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240675

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4878.
Wrynose libcap 2.77 still has the path-based cap_set_file()
race fixed by upstream. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

The fix switches named file capability updates to an opened file
descriptor and adds quicktest coverage for symlinked paths.

[1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
[2] https://www.cve.org/CVERecord?id=CVE-2026-4878

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libcap/files/CVE-2026-4878.patch          | 163 ++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.77.bb    |   4 +-
 2 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2026-4878.patch b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
new file mode 100644
index 00000000000..955b540b8ac
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
@@ -0,0 +1,163 @@
+From 286ace1259992bd0c5d9016715833f2e148ac596 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Thu, 12 Mar 2026 07:38:05 -0700
+Subject: [PATCH] Address a potential TOCTOU race condition in cap_set_file().
+
+This issue was researched and reported by Ali Raza (@locus-x64). It
+has been assigned CVE-2026-4878.
+
+The finding is that while cap_set_file() checks if a file is a regular
+file before applying or removing a capability attribute, a small
+window existed after that check when the filepath could be overwritten
+either with new content or a symlink to some other file. To do this
+would imply that the caller of cap_set_file() was directing it to a
+directory over which a local attacker has write access, and performed
+the operation frequently enough that an attacker had a non-negligible
+chance of exploiting the race condition. The code now locks onto the
+intended file, eliminating the race condition.
+
+CVE: CVE-2026-4878
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596]
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+(cherry picked from commit 286ace1259992bd0c5d9016715833f2e148ac596)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ libcap/cap_file.c  | 69 +++++++++++++++++++++++++++++++++++++++-------
+ progs/quicktest.sh | 14 +++++++++-
+ 2 files changed, 72 insertions(+), 11 deletions(-)
+
+diff --git a/libcap/cap_file.c b/libcap/cap_file.c
+index 0bc07f7..f02bf9f 100644
+--- a/libcap/cap_file.c
++++ b/libcap/cap_file.c
+@@ -8,8 +8,13 @@
+ #define _DEFAULT_SOURCE
+ #endif
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++
+ #include <sys/types.h>
+ #include <byteswap.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+@@ -322,26 +327,70 @@ int cap_set_file(const char *filename, cap_t cap_d)
+     struct vfs_ns_cap_data rawvfscap;
+     int sizeofcaps;
+     struct stat buf;
++    char fdpath[64];
++    int fd, ret;
++
++    _cap_debug("setting filename capabilities");
++    fd = open(filename, O_RDONLY|O_NOFOLLOW);
++    if (fd >= 0) {
++	ret = cap_set_fd(fd, cap_d);
++	close(fd);
++	return ret;
++    }
+ 
+-    if (lstat(filename, &buf) != 0) {
+-	_cap_debug("unable to stat file [%s]", filename);
++    /*
++     * Attempting to set a file capability on a file the process can't
++     * read the content of. This is considered a non-standard use case
++     * and the following (slower) code is complicated because it is
++     * trying to avoid a TOCTOU race condition.
++     */
++
++    fd = open(filename, O_PATH|O_NOFOLLOW);
++    if (fd < 0) {
++	_cap_debug("cannot find file at path [%s]", filename);
++	return -1;
++    }
++    if (fstat(fd, &buf) != 0) {
++	_cap_debug("unable to stat file [%s] descriptor %d",
++		   filename, fd);
++	close(fd);
+ 	return -1;
+     }
+     if (S_ISLNK(buf.st_mode) || !S_ISREG(buf.st_mode)) {
+-	_cap_debug("file [%s] is not a regular file", filename);
++	_cap_debug("file [%s] descriptor %d for non-regular file",
++		   filename, fd);
++	close(fd);
+ 	errno = EINVAL;
+ 	return -1;
+     }
+ 
+-    if (cap_d == NULL) {
+-	_cap_debug("removing filename capabilities");
+-	return removexattr(filename, XATTR_NAME_CAPS);
++    /*
++     * While the fd remains open, this named file is locked to the
++     * origin regular file. The size of the fdpath variable is
++     * sufficient to support a 160+ bit number.
++     */
++    if (snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd)
++	>= sizeof(fdpath)) {
++	_cap_debug("file descriptor too large %d", fd);
++	errno = EINVAL;
++	ret = -1;
++
++    } else if (cap_d == NULL) {
++	_cap_debug("dropping file caps on [%s] via [%s]",
++		   filename, fdpath);
++	ret = removexattr(fdpath, XATTR_NAME_CAPS);
++
+     } else if (_fcaps_save(&rawvfscap, cap_d, &sizeofcaps) != 0) {
+-	return -1;
+-    }
++	_cap_debug("problem converting cap_d to vfscap format");
++	ret = -1;
+ 
+-    _cap_debug("setting filename capabilities");
+-    return setxattr(filename, XATTR_NAME_CAPS, &rawvfscap, sizeofcaps, 0);
++    } else {
++	_cap_debug("setting filename capabilities");
++	ret = setxattr(fdpath, XATTR_NAME_CAPS, &rawvfscap,
++		       sizeofcaps, 0);
++    }
++    close(fd);
++    return ret;
+ }
+ 
+ /*
+diff --git a/progs/quicktest.sh b/progs/quicktest.sh
+index e6c48e6..5dc72f9 100755
+--- a/progs/quicktest.sh
++++ b/progs/quicktest.sh
+@@ -148,7 +148,19 @@ pass_capsh --caps="cap_setpcap=p" --inh=cap_chown --current
+ pass_capsh --strict --caps="cap_chown=p" --inh=cap_chown --current
+ 
+ # change the way the capability is obtained (make it inheritable)
++chmod 0000 ./privileged
+ ./setcap cap_setuid,cap_setgid=ei ./privileged
++if [ $? -ne 0 ]; then
++    echo "FAILED to set file capability"
++    exit 1
++fi
++chmod 0755 ./privileged
++ln -s privileged unprivileged
++./setcap -r ./unprivileged
++if [ $? -eq 0 ]; then
++    echo "FAILED by removing a capability from a symlinked file"
++    exit 1
++fi
+ 
+ # Note, the bounding set (edited with --drop) only limits p
+ # capabilities, not i's.
+@@ -246,7 +258,7 @@ EOF
+     pass_capsh --iab='!%cap_chown,^cap_setpcap,cap_setuid'
+     fail_capsh --mode=PURE1E --iab='!%cap_chown,^cap_setuid'
+ fi
+-/bin/rm -f ./privileged
++/bin/rm -f ./privileged ./unprivileged
+ 
+ echo "testing namespaced file caps"
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/libcap/libcap_2.77.bb b/meta/recipes-support/libcap/libcap_2.77.bb
index 9968cd5f504..66ac0f1d7df 100644
--- a/meta/recipes-support/libcap/libcap_2.77.bb
+++ b/meta/recipes-support/libcap/libcap_2.77.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-4878.patch \
+           "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "

