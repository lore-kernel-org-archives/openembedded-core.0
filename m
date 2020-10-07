Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.931.1602087621146298330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 09:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zhw2W/v9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id z1so2890800wrt.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EoXGEEPL9xuIx6rOKhE+Cr4nX1nElXBmGjIA4xREw5w=;
        b=Zhw2W/v9LPkBoMxedAlCRGNA+qL1hSQNYXjMklkB7q+Cf6JNuIqLoz26Tk7nDHeQqG
         YmkA02fvpj/HtHs+REaXNLpnAvZPDyY7jxgnP+qyR/1cYyYtxS5D9YYJiwKs2poeGxY+
         CPwNnktpblQXy3/rY2ALXr4RVLMvIV6o54AuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EoXGEEPL9xuIx6rOKhE+Cr4nX1nElXBmGjIA4xREw5w=;
        b=VxBKXCycd+/2kwET9PTDumtZZvIjSnF7xz15JvGqCq6KOf2qMn7xPH9a7/ZhmHIBWd
         KCHmY69pEoCMiqw7dn1UGbL2IdmCdYHy15PRmaFfJ2LaZWvDT/WgdR4s1SwOH91ePQzQ
         aeA1WN/Uy4NYyglGQN521PBWXxm4FpA/q369xAicKBWGl0g/DcjeXJ3/75zlTpZ+HzUg
         bMZH6bhAJ6UI5XXCk4PSZfBbOJeSkDs9nS2xGlxa1RMPSKu/5uB7AffSD0FF5JyPIHYa
         AODtaq448a953ZfFpVUsS1E7t1BX+krWeL+tA13RZPGWHlerADWvFgWyG+8fBSyV1xvC
         9Qlw==
X-Gm-Message-State: AOAM531gM+stfNtilPTzY/KrnycvBb0zh9FMScYoFYxKpzar5pNI2lup
	gizL5LRImJ/hf2VMlPMVHd8lCzjoWOlejw==
X-Google-Smtp-Source: ABdhPJwoRnx6eCLILxGXkEzoDc2BQg8FbQvJ5hFWnzJSlxXyNSxfWuoDZLI93QczcTEbHL5WGZbPtg==
X-Received: by 2002:adf:f0c3:: with SMTP id x3mr4464186wro.343.1602087619104;
        Wed, 07 Oct 2020 09:20:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id d23sm3299827wmb.6.2020.10.07.09.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:20:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 1/2] pseudo: do not expand symlinks in /proc
Date: Wed,  7 Oct 2020 17:20:17 +0100
Message-Id: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some symlinks in /proc, such as those under /proc/[pid]/fd,
/proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
have readlink called on them.  These look like symlinks, but behave like
hardlinks.  Readlink does not return actual paths.  Previously
pseudo_fix_path would expand files such as /dev/stdin to paths such as
/proc/6680/fd/pipe:[1270830076] which do not exist.

This issue affects:
- deleted files
- deleted directories
- fifos
- sockets
- anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)

Testing:
timed builds before and after applying patch, without significant
measurable difference.
$ bitbake -c compile <image>; time bitbake <image>

installed pseudo on an image and was unable to reproduce the test
on bug report after applying the patch.

[YOCTO #13288]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/files/proc.patch | 86 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/proc.patch

diff --git a/meta/recipes-devtools/pseudo/files/proc.patch b/meta/recipes-devtools/pseudo/files/proc.patch
new file mode 100644
index 00000000000..57ae9bf9504
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/proc.patch
@@ -0,0 +1,86 @@
+From: Matt Cowell <matt.cowell@nokia.com>
+From: "Sakib Sajal" <sakib.sajal@windriver.com>
+
+pseudo: do not expand symlinks in /proc
+
+Some symlinks in /proc, such as those under /proc/[pid]/fd,
+/proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
+have readlink called on them.  These look like symlinks, but behave like
+hardlinks.  Readlink does not return actual paths.  Previously
+pseudo_fix_path would expand files such as /dev/stdin to paths such as
+/proc/6680/fd/pipe:[1270830076] which do not exist.
+
+This issue affects:
+- deleted files
+- deleted directories
+- fifos
+- sockets
+- anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)
+
+Testing:
+timed builds before and after applying patch, without significant
+measurable difference.
+$ bitbake -c compile <image>; time bitbake <image>
+
+installed pseudo on an image and was unable to reproduce the test
+on bug report after applying the patch.
+
+[YOCTO #13288]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ pseudo_util.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/pseudo_util.c b/pseudo_util.c
+index c867ed6..bce4d1e 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -21,6 +21,8 @@
+ #include <sys/time.h>
+ #include <unistd.h>
+ #include <limits.h>
++#include <sys/vfs.h>
++#include <linux/magic.h>
+ 
+ /* see the comments below about (*real_regcomp)() */
+ #include <dlfcn.h>
+@@ -29,6 +31,11 @@
+ #include "pseudo_ipc.h"
+ #include "pseudo_db.h"
+ 
++/* O_PATH is defined in glibc 2.16 and later only */
++#ifndef O_PATH
++#define O_PATH          010000000
++#endif
++
+ struct pseudo_variables {
+ 	char *key;
+ 	size_t key_len;
+@@ -677,6 +684,26 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
+ 	 */
+ 	if (!leave_this && is_dir) {
+ 		int is_link = S_ISLNK(buf->st_mode);
++
++		/* do not expand symlinks in the proc filesystem, since they may not be real */
++		if (is_link) {
++			struct statfs sfs;
++			int fd;
++
++			/* statfs follows symlinks, so use fstatfs */
++			fd = open(newpath, O_CLOEXEC | O_PATH | O_NOFOLLOW);
++			if (-1 != fd) {
++				if (0 == fstatfs(fd, &sfs) && sfs.f_type == PROC_SUPER_MAGIC) {
++					pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
++						"pae: '%s' is procfs symlink, not expanding\n",
++						newpath);
++					is_link = 0;
++				}
++
++				close(fd);
++			}
++		}
++
+ 		if (link_recursion >= PSEUDO_MAX_LINK_RECURSION && is_link) {
+ 			pseudo_diag("link recursion too deep, not expanding path '%s'.\n", newpath);
+ 			is_link = 0;
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index bc20a2f134e..90f5cb0bcf2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://xattr_fix.patch \
            file://mayunlink.patch \
            file://pathfix.patch \
+           file://proc.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

