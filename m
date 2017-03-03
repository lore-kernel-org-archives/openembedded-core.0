Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8235560670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:36:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v190so4985801wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 13:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nvzXQmrhpEnEgKyvBNDqQjuE+3aaHQIB2m4pY6tmqnI=;
	b=TjM9bX73jYAZhcdEU39x5eAMFupOvFIydn/bWzu1PBxZV2G7NMCkhv1P5h6WHDXa+j
	q1fVLaMUZIQJfSgMfZ8kPCTUSt2FOd7NSJqKthiuEyf+RBO2WrU18ZII7bhJSe+hzCWu
	SVQcm+/fDpXsRUrP6rI49WIko7DC35Ka3qKWFFSUfuuJm+fWKkjzVwh2oR39PYLi5zjT
	O3TA7bbV1260LK4EqMcCiE4R/ttacdb/WjyizmK7IfiAB3BS4E0N1AKuMMxfXPb/HY7S
	0fmRTaDl3uOF9xndeQADZvL2ehgIUtaBfHdG7d882L2HcUOdwjXzbVGv9735u0K1VCUL
	VoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nvzXQmrhpEnEgKyvBNDqQjuE+3aaHQIB2m4pY6tmqnI=;
	b=i3WL95griHkwvjh0r5fGEBrc96E7Zy037lMt3wzS7fplGAVPnnmxkry+ci+cYM6ov/
	45yDHNLD+/Pg5e0dkcrBIpAO5WwVjmriDjsOECoyJ1YijViAtiU9mcuDBifm8Um3F5Vu
	n7qFp6s6n/Q+5ZNXK5iBj5Lesd9bJWDA/mnI4SnhlusCoPe87QnwFjTk+kTQ1fk5p/tp
	c+X1+7ZOyqJO0KVAYJmZQ4nP79G1BW93hmB8RJrIefq7bQfylB2F7OHS5B0erOouA6MZ
	hEJSzWsJsfX0lYv+ujaNHDHAOWhscaFfyo4SGypVxAt+/WTOcVPfz+V4kbJd1b9FdQdO
	joiQ==
X-Gm-Message-State: AMke39naE0aFg4HWdMdqv9tjOv3thb83CuakH+7xfCYHij4EElHdEYlUivy+ueMq5Ggv3A==
X-Received: by 10.28.101.68 with SMTP id z65mr4300762wmb.102.1488576991667;
	Fri, 03 Mar 2017 13:36:31 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911C6391E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:c639:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	186sm4480414wmw.24.2017.03.03.13.36.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Mar 2017 13:36:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 22:36:18 +0100
Message-Id: <20170303213619.29944-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/2] parted: fix rss+perf+gold failure on do_compile_ptest_base
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
X-List-Received-Date: Fri, 03 Mar 2017 21:36:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Was detected in Martin's world build

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...s_resize-link-against-libuuid-explicitly-.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.2.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch

diff --git a/meta/recipes-extended/parted/files/0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch b/meta/recipes-extended/parted/files/0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch
new file mode 100644
index 0000000..bd2b5c5
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch
@@ -0,0 +1,34 @@
+From 5c99d7e4c2b5e7a957dc922aff03debfebbd6154 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 3 Mar 2017 21:49:15 +0100
+Subject: [PATCH] libparted_fs_resize: link against libuuid explicitly to
+ unbreak gold linking on test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined reference to 'uuid_generate'
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ libparted/fs/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
+index d3cc8bc..c301b0b 100644
+--- a/libparted/fs/Makefile.am
++++ b/libparted/fs/Makefile.am
+@@ -113,6 +113,8 @@ libparted_fs_resize_la_SOURCES = \
+   r/hfs/reloc_plus.c		\
+   r/hfs/reloc_plus.h
+ 
++libparted_fs_resize_la_LIBADD   = $(UUID_LIBS)
++
+ AM_CPPFLAGS = \
+   -I$(top_srcdir)/libparted/labels	\
+   $(partedincludedir)			\
+-- 
+2.9.3
+
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index edc4bd3..9ce2dfe 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-compile-failure-while-dis.patch \
            file://0001-Include-fcntl.h-in-platform_defs.h.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
 	   file://parted-3.2-sysmacros.patch \
            file://run-ptest \
            file://Makefile \
-- 
2.9.3


