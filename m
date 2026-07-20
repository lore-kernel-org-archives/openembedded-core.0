Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227CDC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2883.1784568226289836482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hV8vkasc;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954df200ddso17967765e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568224; x=1785173024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I+lP0RUz3fXrvfZTQAt8vcPdH4EHzwD240pTwFlDSgo=;
        b=hV8vkascvr+0dTjshwOjLQCrWCtU4TnS4/NFqCV9038Uo00cpn1hR43kRWDg4Rgrie
         9ikqWT57phPCipGCKDTizoYi7L+6KBYPqUltp1yPJE2eFLs2BH8gfbDCUR7nEq0XV+bN
         srHmp91nhfwyTlssHFEXke5/tQSMOYYidTcD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568224; x=1785173024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I+lP0RUz3fXrvfZTQAt8vcPdH4EHzwD240pTwFlDSgo=;
        b=Yn6jII4UxWeyUepQ+ffOTGxdb6RZsnAL78jLZkvyn9tUqFTNLv0/+ARE7CiAfw7iPx
         BoLNA4ICGmCcSQAFFIZrpinH2eIoXy/vsExHs40lGcd5unbZKcQUbX6WGdSicji1c2VN
         GNrf879P+d9Rt0qjeNF7tMLtG/xqpPp8v7p1TCqrlr5diXNvig3QDskT7WQl4DqeV2WH
         IzzpqUGg3G/lyxarjXwn71Jh9sncJ90BfoMzgee0De+v5x7ImsaotxNYhGhKAxO9acW9
         AyjUE/Sk7DeH49X6jqYCQBRYrHYB7sNGj3SaPqoEVfEJeowiQ2oqhRb00rcNwsRINFWX
         Y9Qw==
X-Gm-Message-State: AOJu0YxxYqggDq0SHJ6gKESncw9nDEqZVk9sWJUQjfgIbpZjSStA0Zd2
	RCPWPt7sbAhtT1XcuoBRj+b0ea4rDw8uPJ6pVKVLq87VvO/ZSMUonKDY5Prinz4ZNDoj2DdFt6U
	p/dfIjg8=
X-Gm-Gg: AfdE7cmXMEsaaQw0lnAgmTPx3dQJ7Ixv3FwBl/o8vB5a+U3gl4sNQ8oRn4/g1NalFNq
	vqRMfXQn+shy73iJ1INJ5QHuD/4m7Ks0+2h9Xf6aPSU1mqgBR42aFl2MlDZLR/Ls4cuoPVN6o1j
	a1UAT/55ov2aTJ0TYVJgQf46Raq7fg2+3CFiWd2IUzTkB27FYtNUV5rzgcARlHjlJ49ZqFYEIt4
	ekv3jvu1L9sPi9ULJfcplWw0TF4rZxUc3hxQNi0ELKGqVvhVQ2TmFyE1vaj/Q24zSmZTxELL+Zc
	bnc31qyqnvXnWlksTiuzQ9URtOUpP1Z0Fn/avovWjmXdt5LSwKpJYgLdNcNlPdU8QRsXQG0jjUH
	6hRoYFoovUVSJt+z1ij2bLyWj/KRAYbLaPdU75pQ3tgGFwdzADdEwqjaDFgItwh+8beLSb7hlH7
	xaLwsYnoA1vVYRwm+CY46aYjMAzRZBDhOoEY6ZJnmkWZ4MdO6My0oARCtJ3s0AqMehgei3+HR0O
	qC+S7bz
X-Received: by 2002:a05:600c:3baa:b0:493:b730:8d78 with SMTP id 5b1f17b1804b1-4954a514007mr208606355e9.31.1784568224409;
        Mon, 20 Jul 2026 10:23:44 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/33] libcap: Fix CVE-2026-4878
Date: Mon, 20 Jul 2026 19:22:55 +0200
Message-ID: <0488c0247ea017e465608c3a68aa3777b34df327.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241456

From: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
[2] https://security-tracker.debian.org/tracker/CVE-2026-4878

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libcap/files/CVE-2026-4878.patch          | 164 ++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2026-4878.patch b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
new file mode 100644
index 00000000000..dcc63d93a54
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
@@ -0,0 +1,164 @@
+From f17734c6b0f4fd102fe4f7e863cb1165f8ec66e2 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
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
+index 59e16b0..bb49d53 100755
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
+2.43.0
+
diff --git a/meta/recipes-support/libcap/libcap_2.69.bb b/meta/recipes-support/libcap/libcap_2.69.bb
index 03975b44a0a..43185f027ea 100644
--- a/meta/recipes-support/libcap/libcap_2.69.bb
+++ b/meta/recipes-support/libcap/libcap_2.69.bb
@@ -16,6 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://CVE-2025-1390.patch \
+           file://CVE-2026-4878.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \

