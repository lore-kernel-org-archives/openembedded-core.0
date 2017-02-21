Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B2B6D72FBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:55:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so21316289wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bQNYiRO0MUM+Nt9ht4fKCNqL55zscvzsybkuSqfuHD8=;
	b=MfjsOb9K2hqVhDBH8x2xli6r1X1B24DW3BXpGHo9gvZwhRbijMX0s6aSw8OiG6ZfhL
	dIZJbfYJbdqtOzqULkW95edUUwHfoXb19SO7KsYf6mKK5o1YZVfk24OoXuFJljg7/Z0E
	wAib6dlqw9wO3ISgymvZ/B77VhD6AKAobRAMLWHmneEBuXJODnyRX9hEcxkBr3pThIOf
	PT9PnUyyOn+WxQFuQcqMQppeXu0xmMcM30DEJiERDA47pvot5lxoaxiYe8Cvq5D4IYWQ
	jbTMo2vMMZktrbQsI9VqDacDv94+95lmDKypVP5cL6oh2cEjoEzIbGJ0t1KgqmEAvumg
	0O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bQNYiRO0MUM+Nt9ht4fKCNqL55zscvzsybkuSqfuHD8=;
	b=TNQaEHvVdk4z42KU3mnNnovp0bcq39QwqjONVpAnFPoeD9L4pcc0pIHvI1nN6iOAD7
	W4emsNQU5CpS59/YP5qUQJ6BNBbgx86Cyegi7EBD3Cku9+A4ao93brpC4uSDKrcpCXLG
	0x+FbceELe/+mjlXW1HjW4XxCDTh2OKkIYUjUI67FwV5pvLRO11becNRaKjZOUBH3mob
	9nFGyl+q1bXEF6j2ejNIqyh8dTs3ppuEqbJScnbVzeonH1yLxemwoQTs9gWKjqrPK6z9
	lE9PN+b6onAhLp1/PfbAt4XtI7AB4/+8gJF6pgjxeiOWMQcyq3vuKM2JXUfgMJF9TO1z
	r+Bg==
X-Gm-Message-State: AMke39lB5R4c/+j3Zm45GES2YAk6bYetq6nj9/zaLUIgv9IJWyGkPwINhudZ8Jl27RG1bw==
X-Received: by 10.28.170.4 with SMTP id t4mr16037615wme.89.1487703331155;
	Tue, 21 Feb 2017 10:55:31 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o2sm18494107wmb.28.2017.02.21.10.55.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 10:55:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 19:55:26 +0100
Message-Id: <20170221185527.23988-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
Subject: [PATCH 1/2] qemu: fix build with glibc-2.25
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
X-List-Received-Date: Tue, 21 Feb 2017 18:55:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu/glibc-2.25.patch | 88 ++++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.0.bb         |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/glibc-2.25.patch

diff --git a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
new file mode 100644
index 0000000000..a6908bdbf9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
@@ -0,0 +1,88 @@
+From: Christopher Covington
+Date: Wed, 28 Dec 2016 15:04:33 -0500
+Subject: [Qemu-devel] [PATCH v3] build: include sys/sysmacros.h for major() and minor()a
+
+The definition of the major() and minor() macros are moving within glibc to
+<sys/sysmacros.h>. Include this header when it is available to avoid the
+following sorts of build-stopping messages:
+
+qga/commands-posix.c: In function ‘dev_major_minor’:
+qga/commands-posix.c:656:13: error: In the GNU C Library, "major" is defined
+ by <sys/sysmacros.h>. For historical compatibility, it is
+ currently defined by <sys/types.h> as well, but we plan to
+ remove this soon. To use "major", include <sys/sysmacros.h>
+ directly. If you did not intend to use a system-defined macro
+ "major", you should undefine it after including <sys/types.h>. [-Werror]
+         *devmajor = major(st.st_rdev);
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~
+
+qga/commands-posix.c:657:13: error: In the GNU C Library, "minor" is defined
+ by <sys/sysmacros.h>. For historical compatibility, it is
+ currently defined by <sys/types.h> as well, but we plan to
+ remove this soon. To use "minor", include <sys/sysmacros.h>
+ directly. If you did not intend to use a system-defined macro
+ "minor", you should undefine it after including <sys/types.h>. [-Werror]
+         *devminor = minor(st.st_rdev);
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The additional include allows the build to complete on Fedora 26 (Rawhide)
+with glibc version 2.24.90.
+
+Signed-off-by: Christopher Covington <address@hidden>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Submitted https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03548.html
+
+diff -uNr qemu-2.8.0.orig/configure qemu-2.8.0/configure
+--- qemu-2.8.0.orig/configure  2017-02-21 19:05:13.180094708 +0100
++++ qemu-2.8.0/configure       2017-02-21 19:08:53.114087084 +0100
+@@ -4727,6 +4727,20 @@
+ then
+ fi
+ 
+ ##########################################
++# check for sysmacros.h
++
++have_sysmacros=no
++cat > $TMPC << EOF
++#include <sys/sysmacros.h>
++int main(void) {
++    return makedev(0, 0);
++}
++EOF
++if compile_prog "" "" ; then
++    have_sysmacros=yes
++fi
++
++##########################################
+ # End of CC checks
+ # After here, no more $cc or $ld runs
+ 
+diff -uNr qemu-2.8.0.orig/configure qemu-2.8.0/configure
+--- qemu-2.8.0.orig/configure  2017-02-21 19:05:13.180094708 +0100
++++ qemu-2.8.0/configure       2017-02-21 19:08:53.114087084 +0100
+@@ -5695,6 +5709,10 @@
+   echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
+ fi
+ 
++if test "$have_sysmacros" = "yes" ; then
++  echo "CONFIG_SYSMACROS=y" >> $config_host_mak
++fi
++
+ # Hold two types of flag:
+ #   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the name on
+ #                                     a thread we have a handle to
+diff -uNr qemu-2.8.0.orig/include/sysemu/os-posix.h qemu-2.8.0/include/sysemu/os-posix.h
+--- qemu-2.8.0.orig/include/sysemu/os-posix.h	2016-12-20 21:16:48.000000000 +0100
++++ qemu-2.8.0/include/sysemu/os-posix.h	2017-02-21 19:07:18.009090381 +0100
+@@ -34,6 +34,10 @@
+ #include <netdb.h>
+ #include <sys/un.h>
+ 
++#ifdef CONFIG_SYSMACROS
++#include <sys/sysmacros.h>
++#endif
++
+ void os_set_line_buffering(void);
+ void os_set_proc_name(const char *s);
+ void os_setup_signal_handling(void);
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
index e0527a8fd9..fc3e766323 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
             file://target-ppc-fix-user-mode.patch \
+            file://glibc-2.25.patch \
 "
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.11.1


