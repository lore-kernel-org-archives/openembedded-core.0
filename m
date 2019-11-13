Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id D4E857F43D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:58 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q26so1850520pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H/5EyEwTEMVPtrUYWuWjnsaCn7tvtNgqfPsonHO9PlI=;
	b=HDlbyTh1SkMSPZhLHlsCbWmm5+eGxenWBGWblapzxyDvYTEQaMTsNrpdXbk+X9X+ZX
	BIKDKyLiG+bO80ztyVBKbEbE7xEnRp/G8QWo3T13jSUvbp/pHQYO0vWSKscZhv/Mp0HL
	AARBJHWWhswIafOVrjC4M32UfkjUz7MEX8YfUNZv4Yj0fXBdjZ6aKtg0o3Z4wyBwLZV7
	TvqElsuNwBiLZhSAf6kaoKFjWNUEyxtqT96tAF1lgKcMRDpaW8OiC1+WmJAl6gMG/uJO
	+D8vdIiMbfFqvrAyZ5+JMlv+/yDrNet+7J+xcLKqRoaUywsu20W5rTumxVWmzNBBdu07
	HD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H/5EyEwTEMVPtrUYWuWjnsaCn7tvtNgqfPsonHO9PlI=;
	b=XbZzmi8tbaG3at9Rvea/sL9KT9Ja7FiSJcvCEYsL89HFxkO51dZBERkVhcpZ/YjSrc
	Ue6qN9IZKGEUbRjjXqMkDX4mKDZWZvc2Q29dqasPTmzDDskTYl09TYhxSEzmSlSywMH4
	7wDwxD2UuGO0RLaCjSQXeAra3M6AKbnlXba4zxMJEFRnipy1+0uxrtROqsAETP0JyCoj
	MpcfWR2NgULKDK3L/6BsQNc/sID0WbYIB32T46s7k/R71+qXxZpuYUDyYqkwLR1MLL86
	2akVMDyX1n1dxpAVTgDCcv9MKW+u+8dXkk8YiFZIE/0sCwVxmLBiHIp/9w00zS7B8amq
	63yA==
X-Gm-Message-State: APjAAAXRADUNghjGm/SU5Gq2Rx+pmrN8WcvHZ7aGLwuIaZTK4M5i2sDm
	dz8rHKOncItCv8uQDU09Vrz2yRgq
X-Google-Smtp-Source: APXvYqx+MgJziy89WdBNeCxFGMYZF49MFnjuQ+DM8pr2Z4uzKWg1OOdG7fVNvDyyy5JrzEgFYLolgw==
X-Received: by 2002:a17:90a:a45:: with SMTP id
	o63mr5655911pjo.45.1573658399695; 
	Wed, 13 Nov 2019 07:19:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:16 -0800
Message-Id: <dc84f40fd485863fb6c77e641d76135b21867d39.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 13/25] python3: fix do_install fail for parallel buiild
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:58 -0000

From: Changqing Li <changqing.li@windriver.com>

When using make -j with the 'install' target, it's possible for altbininstall
(which normally creates BINDIR) and libainstall (which doesn't, though it
installs python-config there) to race, resulting in a failure due to
attempting to install python-config into a nonexistent BINDIR. Ensure it also
exists in the libainstall target.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ix-Issue36464-parallel-build-race-problem.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
new file mode 100644
index 0000000..237645b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
@@ -0,0 +1,34 @@
+From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 8 May 2019 16:10:29 +0800
+Subject: [PATCH] Makefile: fix Issue36464 (parallel build race problem)
+
+When using make -j with the 'install' target, it's possible for altbininstall
+(which normally creates BINDIR) and libainstall (which doesn't, though it
+installs python-config there) to race, resulting in a failure due to
+attempting to install python-config into a nonexistent BINDIR. Ensure it also
+exists in the libainstall target.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/13186]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.pre.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 15f3687..7e9f173 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1456,7 +1456,7 @@ LIBPL=		@LIBPL@
+ LIBPC=		$(LIBDIR)/pkgconfig
+ 
+ libainstall:	@DEF_MAKE_RULE@ python-config
+-	@for i in $(LIBDIR) $(LIBPL) $(LIBPC); \
++	@for i in $(LIBDIR) $(LIBPL) $(LIBPC) $(BINDIR); \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
+ 			echo "Creating directory $$i"; \
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index af3c325..13f4f5f 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
+           file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


