Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id DAACD78F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 01:05:40 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id v66-v6so1897923pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 18:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WWlMicR3bkzpNXoQglNO+rRtIzQQ/dSTFxp0D/0Kgpc=;
	b=RtcynUDifa8hIzbTBwxCjPUxqn2c42FPAD5wBc2T48oeFhmhTrGBf6aG9Ta0MPUXck
	aym2rZK5SuTWPlRFZFbmzI6bxGPpNveTxCp/j0rffwEoB2PLPpDcNRDsdRyNIz8lyhZN
	0omkbhpKeqxLfTM/GeuaOMOvWg4STt0zwBBkT/cE6oxVGNMvcgpUsj+CO3dro2v3Rc0s
	zvCfy1osqRIf/Y7Ld0MIWnT0hIXjmzJDCPSiiBTRWx60Yftd6PEMpxiULIOIP6ERJbS0
	wjePUF6FIlG8AfaFKNJtw1B0JeevBVOEamZ3Bi1d95j7z59OMYCiL8LshsOkH3OaYwYM
	iVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WWlMicR3bkzpNXoQglNO+rRtIzQQ/dSTFxp0D/0Kgpc=;
	b=W0tnEZRBHHeuv1XRGNFym1j3IOnw1hCLQrMjkgPIsOOsyz3D8sh5bAzxNTRF+9J4EI
	xeTnvgvqkgZ3fvNslqEzNva8oFH2VkIqgJrYeUHUmiIXcW2sL0da3D0lSAp9SDh0P6x9
	xdqYgZVR5AlGyji79UNGOZkuMFjh4viJQ1mGRPgDwaejLkx8agzN4tNvztJDIOqaqaj9
	7jZEcIMcqkT/UAWdYDUFTRaJyDChTUFuVWnt8LJJ2Fi/9BYA/DqBHlIUtCWW5PFVDQio
	5f6Fl4v8fgmtl6SQWWv3QGzpPiil9d3F/D9vsMFnrD5kVFRi3SHk0qa1ALbamMT5bzae
	wUVA==
X-Gm-Message-State: APzg51BwJrvnvBn9EPE4e+xbsrTLKHkwNPCwrlqNiHAd6WAtwjfrVOvV
	PKUEEFbcdzfLQ2z7pUgHIPcJU3XM
X-Google-Smtp-Source: ANB0VdYFnNUdX/TQIDhHT9A8yt5dLSB5e1X+YjV8wgsVVou3SUpSdHPH2ZTa0mzxtWTEQCP1FMIZ1w==
X-Received: by 2002:a62:8d16:: with SMTP id
	z22-v6mr4958105pfd.181.1536800741456; 
	Wed, 12 Sep 2018 18:05:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	f13-v6sm2664935pgs.92.2018.09.12.18.05.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 18:05:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 18:05:31 -0700
Message-Id: <20180913010531.41241-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180913010531.41241-1-raj.khem@gmail.com>
References: <20180913010531.41241-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] musl: Wire-up name_to_handle_at and name_to_handle_at syscalls
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
X-List-Received-Date: Thu, 13 Sep 2018 01:05:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e_to_handle_at-and-name_to_handle_at.patch | 76 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch

diff --git a/meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch b/meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch
new file mode 100644
index 0000000000..4738e1efd8
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch
@@ -0,0 +1,76 @@
+From ef3ef607693a9513d5ab94a1de67dd2f1f97d8ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Sep 2018 16:08:40 -0700
+Subject: [PATCH] wireup linux/name_to_handle_at and name_to_handle_at syscalls
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2018/09/13/4]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fcntl.h               |  7 +++++++
+ src/linux/name_to_handle_at.c | 11 +++++++++++
+ src/linux/open_by_handle_at.c | 10 ++++++++++
+ 3 files changed, 28 insertions(+)
+ create mode 100644 src/linux/name_to_handle_at.c
+ create mode 100644 src/linux/open_by_handle_at.c
+
+diff --git a/include/fcntl.h b/include/fcntl.h
+index 6d8edcd1..5c3defcb 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -155,6 +155,11 @@ int lockf(int, int, off_t);
+ #define F_OWNER_PID 1
+ #define F_OWNER_PGRP 2
+ #define F_OWNER_GID 2
++struct file_handle {
++	unsigned int handle_bytes;
++	int handle_type;
++	unsigned char f_handle[];
++};
+ struct f_owner_ex {
+ 	int type;
+ 	pid_t pid;
+@@ -170,6 +175,8 @@ struct f_owner_ex {
+ #define SPLICE_F_GIFT 8
+ int fallocate(int, int, off_t, off_t);
+ #define fallocate64 fallocate
++int name_to_handle_at(int, const char *, struct file_handle *, int *, int);
++int open_by_handle_at(int, struct file_handle *, int);
+ ssize_t readahead(int, off_t, size_t);
+ int sync_file_range(int, off_t, off_t, unsigned);
+ ssize_t vmsplice(int, const struct iovec *, size_t, unsigned);
+diff --git a/src/linux/name_to_handle_at.c b/src/linux/name_to_handle_at.c
+new file mode 100644
+index 00000000..bb6f8007
+--- /dev/null
++++ b/src/linux/name_to_handle_at.c
+@@ -0,0 +1,11 @@
++#define _GNU_SOURCE
++#include <fcntl.h>
++#include "syscall.h"
++
++int name_to_handle_at(int dirfd, const char *pathname,
++			struct file_handle *handle,
++			int *mount_id, int flags)
++{
++	return syscall(SYS_name_to_handle_at, dirfd,
++		pathname, handle, mount_id, flags);
++}
+diff --git a/src/linux/open_by_handle_at.c b/src/linux/open_by_handle_at.c
+new file mode 100644
+index 00000000..9bc93f14
+--- /dev/null
++++ b/src/linux/open_by_handle_at.c
+@@ -0,0 +1,10 @@
++#define _GNU_SOURCE
++#include <fcntl.h>
++#include "syscall.h"
++
++int open_by_handle_at(int mount_fd, struct file_handle *handle,
++                             int flags)
++{
++	return syscall(SYS_open_by_handle_at, mount_fd,
++		handle, flags);
++}
+-- 
+2.19.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index de1cfd0058..f6edf7de61 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -11,6 +11,7 @@ PV = "1.1.20+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
+           file://0001-wireup-linux-name_to_handle_at-and-name_to_handle_at.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.19.0


