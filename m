Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 768C97FD0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:24:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so9841551wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C8Hu+I0soygNlI7rs48RqSCkUwdmotvVFEiq6Cv6QMo=;
	b=Mp1uodOl5QBgy30kjFORceszjpVQYm9EAgz7tYOTpk0Aj7b+VDPzoolA04btI4omPf
	O+FafYlvQTRStKOmbHF/HWSV6gA2/j7SxFMt70iFNhNhv2CzqGfO54fNrR6Qox9qoDNY
	7rx/iSYZBv+W0BkD3OyjiUbabcejHPdTwGoDPL/9zgdmYjBk38BsJF0gyD68k2fN6Dxm
	KWrEZHLOXt0VjyKu4iVsScVDaIJ2LH03EI+3DgWdQUCrAP8Tu+9f/cdOaTQgK7bZveec
	jJAb07O3CtW2a2lVf9iJNitZW2Rq8xHDrpLJWp6BR3+U97eQ94BJheeDlHf3m8P5S/6p
	8P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C8Hu+I0soygNlI7rs48RqSCkUwdmotvVFEiq6Cv6QMo=;
	b=nHDbnURa0OV2TxUiTegbktIcltAgjX2SBFxoYxpBi9GDRZF2hhNUIT6XR+qHEODgDS
	o1j3pFUPNu5w718qiwd5P6WyVcl399QyxWmB9H8+15gSfvpw75vvew/cj2LJcF6g1V1I
	9s7EJIUkZWYpiQGsNHKmXtb3c8urNerkQrjta/oUZNFxz0roXzNF5jvu0SY94ocHjcpW
	vvaGb2vAI7ftzglcrfWm11UPqL2qSfJnKcGf1DxvX+nKuPUzVYYGqBYkJxHPauP9q7/H
	nw+bVD/BMfvHdWDjytiwj06+GjAgcKI10b9jWBAnA+fPqYerKckhg3D6a/SDphWZTjJh
	jZ/g==
X-Gm-Message-State: APjAAAVPt4v2OteQju+gjSRNJSt7xa6K2GUnPGTU+Kvc2oZWzLD/tQh7
	rGrLiwBQg2eVBHV7VwhdR7FunwqRa+o=
X-Google-Smtp-Source: APXvYqyYWAZcDI6ye1XmNVXYGq/kkA+SK3EUJxyChPvRa3aMayIR7BBajtq8IMrn2ZPcGUGTWq+wlA==
X-Received: by 2002:a05:600c:141:: with SMTP id
	w1mr16978220wmm.61.1576859040855; 
	Fri, 20 Dec 2019 08:24:00 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.24.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:24:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:46 +0100
Message-Id: <20191220162351.94498-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/11] ltp: fix build with musl
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ltp/0001-Add-more-musl-exclusions.patch   | 70 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190930.bb     |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
new file mode 100644
index 00000000000..d3af31f34a2
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
@@ -0,0 +1,70 @@
+From 788c47ceef7f115ab7f7aa17f918e58795f4e6c7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 13:06:05 +0100
+Subject: [PATCH] Add more musl exclusions
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ testcases/kernel/syscalls/accept4/Makefile      | 4 ++++
+ testcases/kernel/syscalls/fanotify/Makefile     | 6 ++++++
+ testcases/kernel/syscalls/setxattr/Makefile     | 4 ++++
+ testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
+ 4 files changed, 18 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/accept4/Makefile b/testcases/kernel/syscalls/accept4/Makefile
+index 504042e11..94db06266 100644
+--- a/testcases/kernel/syscalls/accept4/Makefile
++++ b/testcases/kernel/syscalls/accept4/Makefile
+@@ -20,4 +20,8 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := accept4_01
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/syscalls/fanotify/Makefile b/testcases/kernel/syscalls/fanotify/Makefile
+index 5d01b4825..0263a6e20 100644
+--- a/testcases/kernel/syscalls/fanotify/Makefile
++++ b/testcases/kernel/syscalls/fanotify/Makefile
+@@ -20,4 +20,10 @@ top_srcdir		?= ../../../..
+ fanotify11: CFLAGS+=-pthread
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := fanotify13 fanotify15
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
++
++
+diff --git a/testcases/kernel/syscalls/setxattr/Makefile b/testcases/kernel/syscalls/setxattr/Makefile
+index 72544c13e..7f20b2780 100644
+--- a/testcases/kernel/syscalls/setxattr/Makefile
++++ b/testcases/kernel/syscalls/setxattr/Makefile
+@@ -20,4 +20,8 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := setxattr03
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases/kernel/syscalls/timer_create/Makefile
+index 8de247075..eb240f432 100644
+--- a/testcases/kernel/syscalls/timer_create/Makefile
++++ b/testcases/kernel/syscalls/timer_create/Makefile
+@@ -20,6 +20,10 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := timer_create01 timer_create03
++endif
++
+ CPPFLAGS		+= -D_GNU_SOURCE -I$(abs_srcdir)/../include
+ 
+ LDLIBS			+= -lpthread -lrt
diff --git a/meta/recipes-extended/ltp/ltp_20190930.bb b/meta/recipes-extended/ltp/ltp_20190930.bb
index 9a436a52303..e56bb575d29 100644
--- a/meta/recipes-extended/ltp/ltp_20190930.bb
+++ b/meta/recipes-extended/ltp/ltp_20190930.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch \
            file://0001-testcases-fix-an-absent-format-string-issue.patch \
+           file://0001-Add-more-musl-exclusions.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


