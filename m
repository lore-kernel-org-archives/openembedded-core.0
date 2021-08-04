Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.1234.1628115550354144832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LhyNmYrp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id h13so3886618wrp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3eAt6n5nNXZRYjZTB9UcreOznLnvuCiARInDPnxtaIw=;
        b=LhyNmYrpbxIwrBBjF8ucvceOkUPKj6rLbpFKBEVST3Mzb/Y9fGgOvooAcNRMl2PnI4
         3xXBcwu88hdPKyCGCqS3cPnc1mNPwS0ilxQ3sI7+raiW25sOFo1MpgthvbElBcRWDXBR
         3emIQrNUBJSuIDSTknvfv2DisEsffTU3y7nQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3eAt6n5nNXZRYjZTB9UcreOznLnvuCiARInDPnxtaIw=;
        b=WQ0KzNEq24rObXd4jsgItR1IvNk6JDdZ3gwQEybMIHJgZtdLuPgUS7p7EWeMbRWn4l
         5DL9Kk78FahDS9YtLXVdgyIRtCH45VrM0Xxj3Y088mc+KinQkMOwY1ee8IzDb3jCjC33
         YDBNF8svW6hA0+pEBYRpl8Fzwgw8DFdzwKnn3pj7d8WevpWd54Lf2nfTtE1Ae/898lO9
         udFAj7eNjgBaA+tonLa5Yolga5loIm6qViTPJv3d4JVVIK06p/JU/llrGIfg9fOkxvQT
         wiCrGBEgGa2YvkBgq/+CSG1HGm+AJb6boxbdyn6gzbjXYh+PWET36I5bke6YPKEi6Rhw
         kqhw==
X-Gm-Message-State: AOAM532bWD0CQA4zOrg6tfBCj7sgidf1Pl9swMXoAp2OM8X/xVpSUeUx
	a6cN6cKO4peJdoEckga7hU+17aS0oWUx2Q==
X-Google-Smtp-Source: ABdhPJwktkfmb5Qr0P55bpoZzHLiChL7e4b0z+WHuK77eA9zALM6vcLT8Y8ecHUqu2RPo1N6/I3/Lw==
X-Received: by 2002:a5d:5541:: with SMTP id g1mr1531483wrw.29.1628115548141;
        Wed, 04 Aug 2021 15:19:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id l33sm6427872wms.12.2021.08.04.15.19.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 15:19:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] valgrind: Add patches for glibc 2.34 support
Date: Wed,  4 Aug 2021 23:19:05 +0100
Message-Id: <20210804221906.3551311-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This partially resolves ptest failures with glibc 2.34.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...6a5a0ea3e1e154663b0fc575bfe2becf177d.patch |   34 +
 ...51fc35f8a6148c2940eb46932b02dd3b9b23.patch |  171 ++
 ...2a4d246519cd1a638cfc7eff00cdd74413c4.patch |   43 +
 ...4805fc74b5690f763033c0c9b43f27613572.patch | 1422 +++++++++++++++++
 .../valgrind/valgrind_3.17.0.bb               |    4 +
 5 files changed, 1674 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/200b6a5a0ea3e1e154663b0fc575bfe2becf177d.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/52ed51fc35f8a6148c2940eb46932b02dd3b9b23.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/6da22a4d246519cd1a638cfc7eff00cdd74413c4.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/a1364805fc74b5690f763033c0c9b43f27613572.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/200b6a5a0ea3e1e154663b0fc575bfe2becf177d.patch b/meta/recipes-devtools/valgrind/valgrind/200b6a5a0ea3e1e154663b0fc575bfe2becf177d.patch
new file mode 100644
index 00000000000..9a5f6a3f512
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/200b6a5a0ea3e1e154663b0fc575bfe2becf177d.patch
@@ -0,0 +1,34 @@
+From 200b6a5a0ea3e1e154663b0fc575bfe2becf177d Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 21 Jul 2021 17:55:40 +0200
+Subject: [PATCH] m_debuginfo/debuginfo.c VG_(get_fnname_kind) _start is below
+ main
+
+With glibc 2.34 we might see the _start symbol as the frame that
+called main instead of directly after __libc_start_main or
+generic_start_main.
+
+Fixes memcheck/tests/badjump[2], memcheck/tests/origin4-many,
+helgrind/tests/tc04_free_lock, helgrind/tests/tc09_bad_unlock
+and helgrind/tests/tc20_verifywrap.
+
+Upstream-Status: Backport
+---
+ coregrind/m_debuginfo/debuginfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/coregrind/m_debuginfo/debuginfo.c b/coregrind/m_debuginfo/debuginfo.c
+index bc2578b377..e2218f2668 100644
+--- a/coregrind/m_debuginfo/debuginfo.c
++++ b/coregrind/m_debuginfo/debuginfo.c
+@@ -2289,6 +2289,7 @@ Vg_FnNameKind VG_(get_fnname_kind) ( const HChar* name )
+        VG_STREQN(18, "__libc_start_main.", name) || // gcc optimization
+        VG_STREQ("generic_start_main", name) ||  // Yellow Dog doggedness
+        VG_STREQN(19, "generic_start_main.", name) || // gcc optimization
++       VG_STREQ("_start", name) ||
+ #      elif defined(VGO_darwin)
+        // See readmacho.c for an explanation of this.
+        VG_STREQ("start_according_to_valgrind", name) ||  // Darwin, darling
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/52ed51fc35f8a6148c2940eb46932b02dd3b9b23.patch b/meta/recipes-devtools/valgrind/valgrind/52ed51fc35f8a6148c2940eb46932b02dd3b9b23.patch
new file mode 100644
index 00000000000..451a459ea75
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/52ed51fc35f8a6148c2940eb46932b02dd3b9b23.patch
@@ -0,0 +1,171 @@
+From 52ed51fc35f8a6148c2940eb46932b02dd3b9b23 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 21 Jul 2021 19:53:13 +0200
+Subject: [PATCH] Generate a ENOSYS (sys_ni_syscall) for clone3 on all linux
+ arches
+
+glibc 2.34 will try to use clone3 first before falling back to
+the clone syscall. So implement clone3 as sys_ni_syscall which
+simply return ENOSYS without producing a warning.
+
+https://bugs.kde.org/show_bug.cgi?id=439590
+
+Upstream-Status: Backport
+---
+ coregrind/m_syswrap/syswrap-amd64-linux.c    | 2 ++
+ coregrind/m_syswrap/syswrap-arm-linux.c      | 2 ++
+ coregrind/m_syswrap/syswrap-arm64-linux.c    | 2 ++
+ coregrind/m_syswrap/syswrap-mips32-linux.c   | 2 ++
+ coregrind/m_syswrap/syswrap-mips64-linux.c   | 1 +
+ coregrind/m_syswrap/syswrap-nanomips-linux.c | 1 +
+ coregrind/m_syswrap/syswrap-ppc32-linux.c    | 2 ++
+ coregrind/m_syswrap/syswrap-ppc64-linux.c    | 2 ++
+ coregrind/m_syswrap/syswrap-s390x-linux.c    | 2 ++
+ coregrind/m_syswrap/syswrap-x86-linux.c      | 2 ++
+ include/vki/vki-scnums-shared-linux.h        | 2 ++
+ 11 files changed, 20 insertions(+)
+
+diff --git a/coregrind/m_syswrap/syswrap-amd64-linux.c b/coregrind/m_syswrap/syswrap-amd64-linux.c
+index 45e1f3d1bb..3b2dcb8e30 100644
+--- a/coregrind/m_syswrap/syswrap-amd64-linux.c
++++ b/coregrind/m_syswrap/syswrap-amd64-linux.c
+@@ -874,6 +874,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
+ 
++   GENX_(__NR_clone3,            sys_ni_syscall),        // 435
++
+    LINX_(__NR_faccessat2,	 sys_faccessat2),        // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-arm-linux.c b/coregrind/m_syswrap/syswrap-arm-linux.c
+index 428cb7c6fc..7f41b07491 100644
+--- a/coregrind/m_syswrap/syswrap-arm-linux.c
++++ b/coregrind/m_syswrap/syswrap-arm-linux.c
+@@ -1051,6 +1051,8 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
+ 
++   GENX_(__NR_clone3,            sys_ni_syscall),        // 435
++
+    LINX_(__NR_faccessat2,    sys_faccessat2),           // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-arm64-linux.c b/coregrind/m_syswrap/syswrap-arm64-linux.c
+index 024ece27f5..0d717f44be 100644
+--- a/coregrind/m_syswrap/syswrap-arm64-linux.c
++++ b/coregrind/m_syswrap/syswrap-arm64-linux.c
+@@ -830,6 +830,8 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
+ 
++   GENX_(__NR_clone3,            sys_ni_syscall),        // 435
++
+    LINX_(__NR_faccessat2,        sys_faccessat2),        // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-mips32-linux.c b/coregrind/m_syswrap/syswrap-mips32-linux.c
+index 62b085ea21..b62129111b 100644
+--- a/coregrind/m_syswrap/syswrap-mips32-linux.c
++++ b/coregrind/m_syswrap/syswrap-mips32-linux.c
+@@ -1136,6 +1136,8 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY(__NR_io_uring_enter,          sys_io_uring_enter),          // 426
+    LINXY(__NR_io_uring_register,       sys_io_uring_register),       // 427
+ 
++   GENX_(__NR_clone3,                  sys_ni_syscall),              // 435
++
+    LINX_ (__NR_faccessat2,             sys_faccessat2),              // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-mips64-linux.c b/coregrind/m_syswrap/syswrap-mips64-linux.c
+index b73c03da16..94f38366f0 100644
+--- a/coregrind/m_syswrap/syswrap-mips64-linux.c
++++ b/coregrind/m_syswrap/syswrap-mips64-linux.c
+@@ -815,6 +815,7 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY (__NR_io_uring_setup, sys_io_uring_setup),
+    LINXY (__NR_io_uring_enter, sys_io_uring_enter),
+    LINXY (__NR_io_uring_register, sys_io_uring_register),
++   GENX_ (__NR_clone3, sys_ni_syscall),
+    LINX_ (__NR_faccessat2, sys_faccessat2),
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-nanomips-linux.c b/coregrind/m_syswrap/syswrap-nanomips-linux.c
+index 14127b181a..102c155507 100644
+--- a/coregrind/m_syswrap/syswrap-nanomips-linux.c
++++ b/coregrind/m_syswrap/syswrap-nanomips-linux.c
+@@ -824,6 +824,7 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINXY (__NR_io_uring_setup,         sys_io_uring_setup),
+    LINXY (__NR_io_uring_enter,         sys_io_uring_enter),
+    LINXY (__NR_io_uring_register,      sys_io_uring_register),
++   GENX_ (__NR_clone3,                 sys_ni_syscall),
+    LINX_ (__NR_faccessat2,             sys_faccessat2),
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-ppc32-linux.c b/coregrind/m_syswrap/syswrap-ppc32-linux.c
+index aad14f8ba4..1e2efc6777 100644
+--- a/coregrind/m_syswrap/syswrap-ppc32-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc32-linux.c
+@@ -1054,6 +1054,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
+ 
++   GENX_(__NR_clone3,            sys_ni_syscall),        // 435
++
+    LINX_(__NR_faccessat2,        sys_faccessat2),       // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+index c0e3f55491..76610e1423 100644
+--- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+@@ -1023,6 +1023,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
+ 
++   GENX_(__NR_clone3,            sys_ni_syscall),        // 435
++
+    LINX_(__NR_faccessat2,        sys_faccessat2),       // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-s390x-linux.c b/coregrind/m_syswrap/syswrap-s390x-linux.c
+index af6c4eb210..5283c19fe4 100644
+--- a/coregrind/m_syswrap/syswrap-s390x-linux.c
++++ b/coregrind/m_syswrap/syswrap-s390x-linux.c
+@@ -864,6 +864,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_io_uring_enter, sys_io_uring_enter),                    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register),              // 427
+ 
++   GENX_(__NR_clone3, sys_ni_syscall),                                // 435
++
+    LINX_(__NR_faccessat2,  sys_faccessat2),                           // 439
+ };
+ 
+diff --git a/coregrind/m_syswrap/syswrap-x86-linux.c b/coregrind/m_syswrap/syswrap-x86-linux.c
+index 67d866497d..418c769750 100644
+--- a/coregrind/m_syswrap/syswrap-x86-linux.c
++++ b/coregrind/m_syswrap/syswrap-x86-linux.c
+@@ -1645,6 +1645,8 @@ static SyscallTableEntry syscall_table[] = {
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),   // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register),// 427
+ 
++   GENX_(__NR_clone3,            sys_ni_syscall),       // 435
++
+    LINX_(__NR_faccessat2,	 sys_faccessat2),       // 439
+ };
+ 
+diff --git a/include/vki/vki-scnums-shared-linux.h b/include/vki/vki-scnums-shared-linux.h
+index c8bc31b4b3..6c70c9981d 100644
+--- a/include/vki/vki-scnums-shared-linux.h
++++ b/include/vki/vki-scnums-shared-linux.h
+@@ -39,6 +39,8 @@
+ #define __NR_fsmount		432
+ #define __NR_fspick		433
+ 
++#define __NR_clone3		435
++
+ #define __NR_faccessat2		439
+ 
+ #endif
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/6da22a4d246519cd1a638cfc7eff00cdd74413c4.patch b/meta/recipes-devtools/valgrind/valgrind/6da22a4d246519cd1a638cfc7eff00cdd74413c4.patch
new file mode 100644
index 00000000000..fce66b96aec
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/6da22a4d246519cd1a638cfc7eff00cdd74413c4.patch
@@ -0,0 +1,43 @@
+From 6da22a4d246519cd1a638cfc7eff00cdd74413c4 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Fri, 16 Jul 2021 21:37:21 +0200
+Subject: [PATCH] gdbserver_tests: update filters for newer glibc/gdb
+
+With newer glibc/gdb we might see a __select call without anything
+following on the line. Also when gdb cannot find a file it might
+now print "Inappropriate ioctl for device" instead of the message
+"No such file or directory"
+
+Upstream-Status: Backport
+---
+ gdbserver_tests/filter_gdb  | 1 +
+ gdbserver_tests/filter_vgdb | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/gdbserver_tests/filter_gdb b/gdbserver_tests/filter_gdb
+index 3bcd26d86c..4a5b5d7a5b 100755
+--- a/gdbserver_tests/filter_gdb
++++ b/gdbserver_tests/filter_gdb
+@@ -111,6 +111,7 @@ s/\(0x........\) in ?? ()$/\1 in syscall .../
+ #         If select.c sources are present, we can also get a line containing:
+ #              return SYSCALL_CANCEL....
+ s/in __select .*/in syscall .../
++s/in __select$/in syscall .../
+ /exceptfds/d
+ /sysv\/linux\/select\.c/d
+ /return SYSCALL_CANCEL /d
+diff --git a/gdbserver_tests/filter_vgdb b/gdbserver_tests/filter_vgdb
+index f8028a39ad..679ca4b31c 100755
+--- a/gdbserver_tests/filter_vgdb
++++ b/gdbserver_tests/filter_vgdb
+@@ -18,6 +18,7 @@ sed -e '/relaying data between gdb and process/d'                        \
+     
+ # filter some debuginfo problems with ld.so and SLES11
+ sed -e '/^1	rtld.c: No such file or directory\./d' |
++sed -e '/rtld.c: Inappropriate ioctl for device\./d' |
+ 
+ # and filter out any remaining empty lines
+ sed -e '/^$/d'
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/a1364805fc74b5690f763033c0c9b43f27613572.patch b/meta/recipes-devtools/valgrind/valgrind/a1364805fc74b5690f763033c0c9b43f27613572.patch
new file mode 100644
index 00000000000..ece88406c60
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/a1364805fc74b5690f763033c0c9b43f27613572.patch
@@ -0,0 +1,1422 @@
+From a1364805fc74b5690f763033c0c9b43f27613572 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Fri, 16 Jul 2021 15:47:08 -0400
+Subject: [PATCH] Update helgrind and drd suppression libc and libpthread paths
+ in glibc 2.34
+
+glibc 2.34 moved all pthread functions into the main libc library.
+And it changed the (in memory) path of the main libc library to
+libc.so.6 (before it was libc-2.xx.so).
+
+This breaks various standard suppressions for helgrind and drd.
+Fix this by doing a configure check for whether we are using glibc
+2.34 by checking whether pthread_create is in libc instead of in
+libpthread. If we are using glibc then define GLIBC_LIBC_PATH and
+GLIBC_LIBPTHREAD_PATH variables that point to the (regexp) path
+of the library that contains all libc functions and pthread functions
+(which will be the same path for glibc 2.34+).
+
+Rename glibc-2.34567-NPTL-helgrind.supp to glibc-2.X-helgrind.supp.in
+and glibc-2.X-drd.supp to glibc-2.X-drd.supp.in and replace the
+GLIBC_LIBC_PATH and GLIBC_LIBPTHREAD_PATH at configure time.
+
+The same could be done for the glibc-2.X.supp.in file, but hasn't
+yet because it looks like most suppressions in that file are obsolete.
+
+Upstream-Status: Backport
+---
+ Makefile.am                                   |  2 +-
+ configure.ac                                  | 37 +++++++++++++++++--
+ glibc-2.X-drd.supp => glibc-2.X-drd.supp.in   |  6 ++-
+ ...elgrind.supp => glibc-2.X-helgrind.supp.in | 16 ++++----
+ 4 files changed, 47 insertions(+), 14 deletions(-)
+ rename glibc-2.X-drd.supp => glibc-2.X-drd.supp.in (97%)
+ rename glibc-2.34567-NPTL-helgrind.supp => glibc-2.X-helgrind.supp.in (95%)
+
+Index: valgrind-3.17.0/Makefile.am
+===================================================================
+--- valgrind-3.17.0.orig/Makefile.am
++++ valgrind-3.17.0/Makefile.am
+@@ -41,7 +41,7 @@ SUPP_FILES = \
+ 	glibc-2.2.supp glibc-2.3.supp glibc-2.4.supp glibc-2.5.supp \
+ 	glibc-2.6.supp glibc-2.7.supp glibc-2.X.supp.in \
+ 	xfree-3.supp xfree-4.supp \
+-	glibc-2.34567-NPTL-helgrind.supp \
++	glibc-2.X-helgrind.supp \
+ 	glibc-2.2-LinuxThreads-helgrind.supp \
+ 	glibc-2.X-drd.supp \
+ 	darwin9.supp darwin9-drd.supp \
+Index: valgrind-3.17.0/configure.ac
+===================================================================
+--- valgrind-3.17.0.orig/configure.ac
++++ valgrind-3.17.0/configure.ac
+@@ -1090,6 +1090,31 @@ if test x$GLIBC_VERSION = x; then
+     fi
+ fi
+ 
++# If this is glibc then figure out the generic (in file) libc.so and
++# libpthread.so file paths to use in suppressions. Before 2.34 libpthread
++# was a separate library, afterwards it was merged into libc.so and
++# the library is called libc.so.6 (before it was libc-2.[0-9]+.so).
++# Use this fact to set GLIBC_LIBC_PATH and GLIBC_LIBPTHREAD_PATH.
++case ${GLIBC_VERSION} in
++2*)
++  AC_MSG_CHECKING([whether pthread_create needs libpthread])
++  AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_create])],
++  [
++    AC_MSG_RESULT([no])
++    GLIBC_LIBC_PATH="*/lib*/libc.so.6"
++    GLIBC_LIBPTHREAD_PATH="$GLIBC_LIBC_PATH"
++  ], [
++    AC_MSG_RESULT([yes])
++    GLIBC_LIBC_PATH="*/lib*/libc-2.*so*"
++    GLIBC_LIBPTHREAD_PATH="*/lib*/libpthread-2.*so*"
++  ])
++  ;;
++*)
++  AC_MSG_CHECKING([not glibc...])
++  AC_MSG_RESULT([${GLIBC_VERSION}])
++  ;;
++esac
++
+ AC_MSG_CHECKING([the glibc version])
+ 
+ case "${GLIBC_VERSION}" in
+@@ -1102,13 +1127,13 @@ case "${GLIBC_VERSION}" in
+      2.[[3-6]])
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+         DEFAULT_SUPP="$srcdir/glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
+-        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
+         DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.[[7-9]])
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+ 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
+-        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
+         DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.10|2.11)
+@@ -1116,7 +1141,7 @@ case "${GLIBC_VERSION}" in
+ 	AC_DEFINE([GLIBC_MANDATORY_STRLEN_REDIRECT], 1,
+ 		  [Define to 1 if strlen() has been optimized heavily (amd64 glibc >= 2.10)])
+ 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
+-        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
+         DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.*)
+@@ -1126,7 +1151,7 @@ case "${GLIBC_VERSION}" in
+ 	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
+ 		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
+ 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
+-        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
+         DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      darwin)
+@@ -1157,6 +1182,8 @@ case "${GLIBC_VERSION}" in
+ esac
+ 
+ AC_SUBST(GLIBC_VERSION)
++AC_SUBST(GLIBC_LIBC_PATH)
++AC_SUBST(GLIBC_LIBPTHREAD_PATH)
+ 
+ 
+ if test "$VGCONF_OS" != "solaris"; then
+@@ -4910,6 +4937,8 @@ AC_CONFIG_FILES([
+    valgrind.spec
+    valgrind.pc
+    glibc-2.X.supp
++   glibc-2.X-helgrind.supp
++   glibc-2.X-drd.supp
+    docs/Makefile 
+    tests/Makefile 
+    tests/vg_regtest 
+Index: valgrind-3.17.0/glibc-2.X-drd.supp
+===================================================================
+--- valgrind-3.17.0.orig/glibc-2.X-drd.supp
++++ /dev/null
+@@ -1,330 +0,0 @@
+-#
+-# Suppression patterns for ld, the dynamic loader.
+-#
+-
+-# Suppress all data races triggered by ld.
+-{
+-   drd-ld
+-   drd:ConflictingAccess
+-   obj:*/lib*/ld-*.so
+-}
+-
+-#
+-# Suppression patterns for libc.
+-#
+-
+-# Suppress all data races where the topmost frame is inside libc.so. Although
+-# this could hide some real data races, unfortunately this is the only way to
+-# not report any false positives on stdio functions. The glibc functions
+-# manipulating FILE objects use locking primitives that cannot be intercepted
+-# easily. See also the definitions of _IO_lock_lock() etc. in the file
+-# nptl/sysdeps/pthread/bits/stdio-lock.h in the glibc source tree.
+-{
+-   drd-libc-stdio
+-   drd:ConflictingAccess
+-   obj:*/lib*/libc-*
+-}
+-{
+-   drd-libc-thread-cancellation-test
+-   drd:ConflictingAccess
+-   fun:write
+-}
+-{
+-   drd-libc-random
+-   drd:ConflictingAccess
+-   fun:random_r
+-   fun:random
+-}
+-
+-#
+-# Suppression patterns for libstdc++, the implementation of the standard C++
+-# library included with the gcc compiler.
+-#
+-# Note: several versions of the libstdc++ library (4.2.2, 4.3.2, 4.4.0, 4.5.0
+-# and their predecessors) contain an implementation of the std::string class
+-# that triggers conflicting memory accesses. See also
+-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40518
+-#
+-
+-# {
+-#    drd-libstdc++-std::string::string()
+-#    drd:ConflictingAccess
+-#    fun:_ZNSsC1ERKSs
+-# }
+-
+-{
+-   drd-libstdc++-cxa_guard_release
+-   drd:CondErr
+-   fun:pthread_cond_broadcast@*
+-   fun:__cxa_guard_release
+-}
+-{
+-   drd-libstdc++-std::__ostream_insert()
+-   drd:ConflictingAccess
+-   fun:_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
+-   fun:_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
+-}
+-{
+-   drd-libstdc++-std::ostream::_M_insert<long>()
+-   drd:ConflictingAccess
+-   ...
+-   fun:_ZNSo9_M_insertIlEERSoT_
+-}
+-
+-
+-#
+-# Suppression patterns for libpthread.
+-#
+-
+-{
+-   drd-libpthread-pthread_create
+-   drd:ConflictingAccess
+-   ...
+-   fun:pthread_create*
+-}
+-{
+-   drd-libpthread-pthread_join
+-   drd:ConflictingAccess
+-   fun:pthread_join
+-   fun:pthread_join
+-}
+-{
+-   drd-libpthread-__deallocate_stack
+-   drd:ConflictingAccess
+-   ...
+-   fun:__deallocate_stack
+-}
+-{
+-   drd-libpthread-__free_stacks
+-   drd:ConflictingAccess
+-   fun:__free_stacks
+-}
+-{
+-   drd-libpthread-__free_tcb
+-   drd:ConflictingAccess
+-   ...
+-   fun:__free_tcb
+-}
+-{
+-   drd-libpthread-__nptl_deallocate_tsd
+-   drd:ConflictingAccess
+-   fun:__nptl_deallocate_tsd
+-}
+-{
+-   drd-libpthread-pthread_detach
+-   drd:ConflictingAccess
+-   fun:pthread_detach
+-   fun:pthread_detach
+-}
+-{
+-   drd-libpthread-pthread_once
+-   drd:ConflictingAccess
+-   fun:pthread_once
+-}
+-{
+-   drd-libpthread-pthread_cancel_init
+-   drd:ConflictingAccess
+-   fun:pthread_cancel_init
+-}
+-{
+-   drd-libpthread-pthread_cancel
+-   drd:ConflictingAccess
+-   fun:pthread_cancel
+-   fun:pthread_cancel_intercept
+-}
+-{
+-   drd-libpthread-_Unwind_ForcedUnwind
+-   drd:ConflictingAccess
+-   ...
+-   fun:_Unwind_ForcedUnwind
+-}
+-{
+-   drd-libpthread-_Unwind_GetCFA
+-   drd:ConflictingAccess
+-   fun:_Unwind_GetCFA
+-}
+-{
+-   drd-libpthread-_Unwind_Resume
+-   drd:ConflictingAccess
+-   ...
+-   fun:_Unwind_Resume
+-}
+-{
+-   drd-libpthread-?
+-   drd:ConflictingAccess
+-   obj:*/lib/libgcc_s.so.1
+-}
+-{
+-   drd-libpthread-nanosleep
+-   drd:ConflictingAccess
+-   fun:nanosleep
+-}
+-
+-#
+-# Suppression patterns for libgomp.
+-#
+-
+-# Unfortunately many statements in libgomp trigger conflicting accesses. It is
+-# not clear to me which of these are safe and which ones not. See also
+-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40362
+-{
+-   drd-libgomp
+-   drd:ConflictingAccess
+-   obj:/usr/lib*/libgomp.so*
+-}
+-
+-#
+-# Suppression patterns for libX11.
+-#
+-
+-{
+-   drd-libX11-XCreateFontSet
+-   drd:CondErr
+-   fun:pthread_cond_init*
+-   fun:_XReply
+-   fun:XListFontsWithInfo
+-   obj:/usr/lib*/libX11.so*
+-   fun:XCreateOC
+-   fun:XCreateFontSet
+-}
+-
+-#
+-# Suppression patterns for libxcb.
+-#
+-
+-{
+-   drd-libxcb-xcb_wait_for_reply
+-   drd:CondErr
+-   ...
+-   fun:pthread_cond_destroy*
+-   fun:xcb_wait_for_reply
+-}
+-
+-#
+-# Suppression patterns for libglib.
+-#
+-
+-{
+-   drd-libglib-access-g_threads_got_initialized
+-   drd:ConflictingAccess
+-   ...
+-   fun:g_slice_alloc
+-   fun:g_ptr_array_sized_new
+-}
+-{
+-   drd-libglib-access-g_threads_got_initialized
+-   drd:ConflictingAccess
+-   ...
+-   fun:_ZN27QEventDispatcherGlibPrivateC1EP13_GMainContext
+-   fun:_ZN20QEventDispatcherGlibC1EP7QObject
+-   obj:/usr/lib*/libQtCore.so.4.*
+-   obj:/usr/lib*/libQtCore.so.4.*
+-}
+-{
+-   drd-libglib-access-g_mem_initialized
+-   drd:ConflictingAccess
+-   fun:g_malloc0
+-}
+-{
+-   drd-libglib-g_private_get_posix_impl
+-   drd:ConflictingAccess
+-   fun:g_private_get_posix_impl
+-}
+-{
+-   drd-libglib-g_private_set_posix_impl
+-   drd:ConflictingAccess
+-   fun:g_private_set_posix_impl
+-}
+-{
+-   drd-libglib-g_get_language_names
+-   drd:ConflictingAccess
+-   fun:g_slice_free_chain_with_offset
+-}
+-{
+-   drd-libglib-g_main_context_new
+-   drd:ConflictingAccess
+-   fun:fcntl
+-   obj:/usr/lib*/libglib-*.so*
+-   fun:g_main_context_new
+-}
+-
+-#
+-# Suppression patterns for libQtCore.
+-#
+-
+-{
+-   drd-libQtCore-deref-that-calls-QThreadData-destructor
+-   drd:ConflictingAccess
+-   fun:_ZN11QThreadDataD1Ev
+-   obj:/usr/lib*/libQtCore.so.4.*
+-}
+-{
+-   drd-libQtCore-4.0/4.1-Q_GLOBAL_STATIC-connectionList
+-   drd:ConflictingAccess
+-   obj:/usr/lib*/libQtCore.so.4.*
+-   fun:_ZN11QMetaObject8activateEP7QObjectiiPPv
+-   fun:_ZN11QMetaObject8activateEP7QObjectPKS_iPPv
+-}
+-{
+-   drd-libQtCore-QObjectPrivate::clearGuards(QObject*)
+-   drd:ConflictingAccess
+-   fun:_ZN14QReadWriteLock12lockForWriteEv
+-   fun:_ZN14QObjectPrivate11clearGuardsEP7QObject
+-   fun:_ZN7QObjectD2Ev
+-}
+-{
+-   drd-libQtCore-QObjectPrivate::clearGuards(QObject*)
+-   drd:ConflictingAccess
+-   fun:_ZN14QReadWriteLock12lockForWriteEv
+-   fun:_ZN12QWriteLocker6relockEv
+-   fun:_ZN12QWriteLockerC1EP14QReadWriteLock
+-   fun:_ZN14QObjectPrivate11clearGuardsEP7QObject
+-   fun:_ZN7QObjectD2Ev
+-   fun:_ZN24QAbstractEventDispatcherD2Ev
+-   fun:_ZN20QEventDispatcherGlibD0Ev
+-}
+-{
+-   drd-libQtCore-QMutexPool::get(void const*)
+-   drd:ConflictingAccess
+-   fun:_ZN10QMutexPool3getEPKv
+-}
+-{
+-   drd-libQtCore-qt_gettime_is_monotonic()
+-   drd:ConflictingAccess
+-   fun:_Z23qt_gettime_is_monotonicv
+-}
+-
+-#
+-# Suppression patterns for libboost.
+-#
+-
+-# Suppress the races on boost::once_flag::epoch and on
+-# boost::detail::this_thread_epoch. See also the source file
+-# boost/thread/pthread/once.hpp in the Boost source tree
+-# (https://svn.boost.org/trac/boost/browser/trunk/boost/thread/pthread/once.hpp).
+-{
+-   drd-libboost-boost::call_once<void (*)()>(boost::once_flag&, void (*)())
+-   drd:ConflictingAccess
+-   ...
+-   fun:_ZN5boost9call_onceIPFvvEEEvRNS_9once_flagET_
+-}
+-{
+-   drd-libboost-boost::detail::get_once_per_thread_epoch()
+-   drd:ConflictingAccess
+-   fun:_ZN5boost6detail25get_once_per_thread_epochEv
+-}
+-# Suppress the race reports on boost::detail::current_thread_tls_key. See also
+-# https://svn.boost.org/trac/boost/ticket/3526 for more information about why
+-# the access pattern of current_thread_tls_key is safe.
+-{
+-   drd-libboost-boost::detail::get_current_thread_data()
+-   drd:ConflictingAccess
+-   ...
+-   fun:_ZN5boost6detail23get_current_thread_dataEv
+-}
+-{
+-   drd-libboost-boost::detail::set_current_thread_data(boost::detail::thread_data_base*)
+-   drd:ConflictingAccess
+-   ...
+-   fun:_ZN5boost6detail23set_current_thread_dataEPNS0_16thread_data_baseE
+-}
+Index: valgrind-3.17.0/glibc-2.X-drd.supp.in
+===================================================================
+--- /dev/null
++++ valgrind-3.17.0/glibc-2.X-drd.supp.in
+@@ -0,0 +1,332 @@
++# IMPORTANT: DO NOT EDIT glibc-2.X-drd.supp, as it is as a generated
++# file.  Instead edit glibc-2.X-drd.supp.in.
++#
++# Suppression patterns for ld, the dynamic loader.
++#
++
++# Suppress all data races triggered by ld.
++{
++   drd-ld
++   drd:ConflictingAccess
++   obj:*/lib*/ld*.so*
++}
++
++#
++# Suppression patterns for libc.
++#
++
++# Suppress all data races where the topmost frame is inside libc.so. Although
++# this could hide some real data races, unfortunately this is the only way to
++# not report any false positives on stdio functions. The glibc functions
++# manipulating FILE objects use locking primitives that cannot be intercepted
++# easily. See also the definitions of _IO_lock_lock() etc. in the file
++# nptl/sysdeps/pthread/bits/stdio-lock.h in the glibc source tree.
++{
++   drd-libc-stdio
++   drd:ConflictingAccess
++   obj:@GLIBC_LIBC_PATH@
++}
++{
++   drd-libc-thread-cancellation-test
++   drd:ConflictingAccess
++   fun:write
++}
++{
++   drd-libc-random
++   drd:ConflictingAccess
++   fun:random_r
++   fun:random
++}
++
++#
++# Suppression patterns for libstdc++, the implementation of the standard C++
++# library included with the gcc compiler.
++#
++# Note: several versions of the libstdc++ library (4.2.2, 4.3.2, 4.4.0, 4.5.0
++# and their predecessors) contain an implementation of the std::string class
++# that triggers conflicting memory accesses. See also
++# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40518
++#
++
++# {
++#    drd-libstdc++-std::string::string()
++#    drd:ConflictingAccess
++#    fun:_ZNSsC1ERKSs
++# }
++
++{
++   drd-libstdc++-cxa_guard_release
++   drd:CondErr
++   fun:pthread_cond_broadcast@*
++   fun:__cxa_guard_release
++}
++{
++   drd-libstdc++-std::__ostream_insert()
++   drd:ConflictingAccess
++   fun:_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
++   fun:_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
++}
++{
++   drd-libstdc++-std::ostream::_M_insert<long>()
++   drd:ConflictingAccess
++   ...
++   fun:_ZNSo9_M_insertIlEERSoT_
++}
++
++
++#
++# Suppression patterns for libpthread.
++#
++
++{
++   drd-libpthread-pthread_create
++   drd:ConflictingAccess
++   ...
++   fun:pthread_create*
++}
++{
++   drd-libpthread-pthread_join
++   drd:ConflictingAccess
++   fun:pthread_join
++   fun:pthread_join
++}
++{
++   drd-libpthread-__deallocate_stack
++   drd:ConflictingAccess
++   ...
++   fun:__deallocate_stack
++}
++{
++   drd-libpthread-__free_stacks
++   drd:ConflictingAccess
++   fun:__free_stacks
++}
++{
++   drd-libpthread-__free_tcb
++   drd:ConflictingAccess
++   ...
++   fun:__free_tcb
++}
++{
++   drd-libpthread-__nptl_deallocate_tsd
++   drd:ConflictingAccess
++   fun:__nptl_deallocate_tsd
++}
++{
++   drd-libpthread-pthread_detach
++   drd:ConflictingAccess
++   fun:pthread_detach
++   fun:pthread_detach
++}
++{
++   drd-libpthread-pthread_once
++   drd:ConflictingAccess
++   fun:pthread_once
++}
++{
++   drd-libpthread-pthread_cancel_init
++   drd:ConflictingAccess
++   fun:pthread_cancel_init
++}
++{
++   drd-libpthread-pthread_cancel
++   drd:ConflictingAccess
++   fun:pthread_cancel
++   fun:pthread_cancel_intercept
++}
++{
++   drd-libpthread-_Unwind_ForcedUnwind
++   drd:ConflictingAccess
++   ...
++   fun:_Unwind_ForcedUnwind
++}
++{
++   drd-libpthread-_Unwind_GetCFA
++   drd:ConflictingAccess
++   fun:_Unwind_GetCFA
++}
++{
++   drd-libpthread-_Unwind_Resume
++   drd:ConflictingAccess
++   ...
++   fun:_Unwind_Resume
++}
++{
++   drd-libpthread-?
++   drd:ConflictingAccess
++   obj:*/lib/libgcc_s.so.1
++}
++{
++   drd-libpthread-nanosleep
++   drd:ConflictingAccess
++   fun:nanosleep
++}
++
++#
++# Suppression patterns for libgomp.
++#
++
++# Unfortunately many statements in libgomp trigger conflicting accesses. It is
++# not clear to me which of these are safe and which ones not. See also
++# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40362
++{
++   drd-libgomp
++   drd:ConflictingAccess
++   obj:/usr/lib*/libgomp.so*
++}
++
++#
++# Suppression patterns for libX11.
++#
++
++{
++   drd-libX11-XCreateFontSet
++   drd:CondErr
++   fun:pthread_cond_init*
++   fun:_XReply
++   fun:XListFontsWithInfo
++   obj:/usr/lib*/libX11.so*
++   fun:XCreateOC
++   fun:XCreateFontSet
++}
++
++#
++# Suppression patterns for libxcb.
++#
++
++{
++   drd-libxcb-xcb_wait_for_reply
++   drd:CondErr
++   ...
++   fun:pthread_cond_destroy*
++   fun:xcb_wait_for_reply
++}
++
++#
++# Suppression patterns for libglib.
++#
++
++{
++   drd-libglib-access-g_threads_got_initialized
++   drd:ConflictingAccess
++   ...
++   fun:g_slice_alloc
++   fun:g_ptr_array_sized_new
++}
++{
++   drd-libglib-access-g_threads_got_initialized
++   drd:ConflictingAccess
++   ...
++   fun:_ZN27QEventDispatcherGlibPrivateC1EP13_GMainContext
++   fun:_ZN20QEventDispatcherGlibC1EP7QObject
++   obj:/usr/lib*/libQtCore.so.4.*
++   obj:/usr/lib*/libQtCore.so.4.*
++}
++{
++   drd-libglib-access-g_mem_initialized
++   drd:ConflictingAccess
++   fun:g_malloc0
++}
++{
++   drd-libglib-g_private_get_posix_impl
++   drd:ConflictingAccess
++   fun:g_private_get_posix_impl
++}
++{
++   drd-libglib-g_private_set_posix_impl
++   drd:ConflictingAccess
++   fun:g_private_set_posix_impl
++}
++{
++   drd-libglib-g_get_language_names
++   drd:ConflictingAccess
++   fun:g_slice_free_chain_with_offset
++}
++{
++   drd-libglib-g_main_context_new
++   drd:ConflictingAccess
++   fun:fcntl
++   obj:/usr/lib*/libglib-*.so*
++   fun:g_main_context_new
++}
++
++#
++# Suppression patterns for libQtCore.
++#
++
++{
++   drd-libQtCore-deref-that-calls-QThreadData-destructor
++   drd:ConflictingAccess
++   fun:_ZN11QThreadDataD1Ev
++   obj:/usr/lib*/libQtCore.so.4.*
++}
++{
++   drd-libQtCore-4.0/4.1-Q_GLOBAL_STATIC-connectionList
++   drd:ConflictingAccess
++   obj:/usr/lib*/libQtCore.so.4.*
++   fun:_ZN11QMetaObject8activateEP7QObjectiiPPv
++   fun:_ZN11QMetaObject8activateEP7QObjectPKS_iPPv
++}
++{
++   drd-libQtCore-QObjectPrivate::clearGuards(QObject*)
++   drd:ConflictingAccess
++   fun:_ZN14QReadWriteLock12lockForWriteEv
++   fun:_ZN14QObjectPrivate11clearGuardsEP7QObject
++   fun:_ZN7QObjectD2Ev
++}
++{
++   drd-libQtCore-QObjectPrivate::clearGuards(QObject*)
++   drd:ConflictingAccess
++   fun:_ZN14QReadWriteLock12lockForWriteEv
++   fun:_ZN12QWriteLocker6relockEv
++   fun:_ZN12QWriteLockerC1EP14QReadWriteLock
++   fun:_ZN14QObjectPrivate11clearGuardsEP7QObject
++   fun:_ZN7QObjectD2Ev
++   fun:_ZN24QAbstractEventDispatcherD2Ev
++   fun:_ZN20QEventDispatcherGlibD0Ev
++}
++{
++   drd-libQtCore-QMutexPool::get(void const*)
++   drd:ConflictingAccess
++   fun:_ZN10QMutexPool3getEPKv
++}
++{
++   drd-libQtCore-qt_gettime_is_monotonic()
++   drd:ConflictingAccess
++   fun:_Z23qt_gettime_is_monotonicv
++}
++
++#
++# Suppression patterns for libboost.
++#
++
++# Suppress the races on boost::once_flag::epoch and on
++# boost::detail::this_thread_epoch. See also the source file
++# boost/thread/pthread/once.hpp in the Boost source tree
++# (https://svn.boost.org/trac/boost/browser/trunk/boost/thread/pthread/once.hpp).
++{
++   drd-libboost-boost::call_once<void (*)()>(boost::once_flag&, void (*)())
++   drd:ConflictingAccess
++   ...
++   fun:_ZN5boost9call_onceIPFvvEEEvRNS_9once_flagET_
++}
++{
++   drd-libboost-boost::detail::get_once_per_thread_epoch()
++   drd:ConflictingAccess
++   fun:_ZN5boost6detail25get_once_per_thread_epochEv
++}
++# Suppress the race reports on boost::detail::current_thread_tls_key. See also
++# https://svn.boost.org/trac/boost/ticket/3526 for more information about why
++# the access pattern of current_thread_tls_key is safe.
++{
++   drd-libboost-boost::detail::get_current_thread_data()
++   drd:ConflictingAccess
++   ...
++   fun:_ZN5boost6detail23get_current_thread_dataEv
++}
++{
++   drd-libboost-boost::detail::set_current_thread_data(boost::detail::thread_data_base*)
++   drd:ConflictingAccess
++   ...
++   fun:_ZN5boost6detail23set_current_thread_dataEPNS0_16thread_data_baseE
++}
+Index: valgrind-3.17.0/glibc-2.34567-NPTL-helgrind.supp
+===================================================================
+--- valgrind-3.17.0.orig/glibc-2.34567-NPTL-helgrind.supp
++++ /dev/null
+@@ -1,301 +0,0 @@
+-
+-# FIXME 22 Jan 09: helgrind-glibc2X-005 overlaps with a lot of
+-# other stuff.  They should be removed.
+-
+-##----------------------------------------------------------------------##
+-# Suppressions for the Helgrind tool when using 
+-# a glibc-2.{3,4,5,6,7,8,9} system
+-
+-####################################################
+-# glibc-2.X specific
+-# These are generic cover-alls which catch a lot of stuff
+-# in various combinations of ld, libc and libpthread
+-#
+-# Note this is heavyhanded and not very clever:
+-#
+-# - suppress anything that has its top frame in ld.so
+-#   That's fine, since it's mostly dynamic linking stuff,
+-#   which has various deliberate (harmless) races
+-#
+-# - suppress anything that has its top frame in libc.so.
+-#   This really isn't clever, since it could hide some 
+-#   legitimate races.  But the problem is, if we don't do
+-#   this, then loads of errors to do with stdio are reported, because
+-#   H fails to see glibc's internal locking/unlocking of FILE*s
+-#   as required by POSIX.  A better solution is needed.
+-#
+-# - some of the stdio functions in newer glibc manipulate stdio
+-#   FILE*s state through mempcpy, which we intercept, so we also need
+-#   to suppress such manipulations.
+-
+-#{
+-#   helgrind-glibc2X-001
+-#   Helgrind:Race
+-#   obj:*/lib*/ld-2.*so*
+-#}
+-
+-# helgrind-glibc2X-002 was merged into helgrind-glibc2X-001
+-
+-# helgrind-glibc2X-003 was merged into helgrind-glibc2X-001
+-
+-{
+-   helgrind-glibc2X-004
+-   Helgrind:Race
+-   obj:*/lib*/libc-2.*so*
+-}
+-
+-{
+-   helgrind-glibc-io-xsputn-mempcpy
+-   Helgrind:Race
+-   fun:__GI_mempcpy
+-   fun:_IO_*xsputn*
+-   obj:*/lib*/libc-2.*so*
+-}
+-
+-{
+-   helgrind-glibc2X-005
+-   Helgrind:Race
+-   obj:*/lib*/libpthread-2.*so*
+-}
+-
+-# helgrind-glibc2X-006 was merged into helgrind-glibc2X-005
+-
+-# helgrind-glibc2X-007 was merged into helgrind-glibc2X-001
+-
+-# helgrind-glibc2X-008 was merged into helgrind-glibc2X-004
+-
+-# helgrind-glibc2X-009 was merged into helgrind-glibc2X-004
+-
+-# helgrind-glibc2X-010 was merged into helgrind-glibc2X-001
+-
+-# helgrind-glibc2X-011 was merged into helgrind-glibc2X-004
+-
+-# helgrind-glibc2X-012 was merged into helgrind-glibc2X-001
+-
+-# helgrind-glibc2X-013 was merged into helgrind-glibc2X-001
+-
+-# helgrind-glibc2X-014 was merged into helgrind-glibc2X-001
+-
+-# helgrind-glibc2X-015 was merged into helgrind-glibc2X-004
+-
+-# helgrind-glibc2X-016 was merged into helgrind-glibc2X-004
+-
+-# These are very ugly.  They are needed to suppress errors inside (eg)
+-# NPTL's pthread_cond_signal.  Why only one stack frame -- at least we
+-# should see the wrapper calling the real functions, right?
+-# Unfortunately, no: the real functions are handwritten assembly (in
+-# the glibc-2.5 sources) and does not create a proper stack frame.
+-# Therefore it's only one level of unwinding before we're back out in
+-# user code rather than the 2 levels you'd expect.
+-{
+-   helgrind-glibc2X-101
+-   Helgrind:Race
+-   obj:*/lib*/libpthread-2.*so*
+-   fun:pthread_*
+-}
+-{
+-   helgrind-glibc2X-102
+-   Helgrind:Race
+-   fun:mythread_wrapper
+-   obj:*/lib*/libpthread-2.*so*
+-}
+-{
+-   helgrind-glibc2X-103
+-   Helgrind:Race
+-   fun:pthread_cond_*@@GLIBC_2.*
+-}
+-{
+-   helgrind-glibc2X-104
+-   Helgrind:Race
+-   fun:__lll_mutex_*
+-}
+-{
+-   helgrind-glibc2X-105
+-   Helgrind:Race
+-   fun:pthread_rwlock_*lock*
+-}
+-{
+-   helgrind-glibc2X-106
+-   Helgrind:Race
+-   fun:__lll_lock_wait
+-}
+-{
+-   helgrind-glibc2X-107
+-   Helgrind:Race
+-   obj:*/lib*/libpthread-2.*so*
+-   fun:sem_*
+-}
+-{
+-   helgrind-glibc2X-108
+-   Helgrind:Race
+-   fun:clone
+-}
+-{
+-   helgrind-glibc2X-109
+-   Helgrind:Race
+-   fun:start_thread
+-}
+-{
+-   helgrind-glibc2X-110
+-   Helgrind:Race
+-   obj:*/lib*/libc-2.*so*
+-   fun:pthread_*
+-}
+-{
+-   helgrind-glibc2X-111
+-   Helgrind:Race
+-   fun:__lll_*lock_*
+-}
+-{
+-   helgrind-glibc2X-113
+-   Helgrind:Race
+-   fun:pthread_barrier_wait*
+-}
+-
+-
+-####################################################
+-# qt4 specific (GNU mangling)
+-#
+-{
+-   helgrind-qt4---QMutex::lock()-QMutex::lock()
+-   Helgrind:Race
+-   ...
+-   fun:_ZN6QMutex4lockEv
+-   fun:_ZN6QMutex4lockEv
+-}
+-
+-{                                                               
+-   helgrind-qt4---QMutex::unlock()-QMutex::unlock()
+-   Helgrind:Race                                                
+-   ...
+-   fun:_ZN6QMutex6unlockEv                                      
+-   fun:_ZN6QMutex6unlockEv
+-}
+-
+-{
+-   helgrind-qt4---pthread_setspecific-QThreadPrivate::start(void*)
+-   Helgrind:Race
+-   fun:pthread_setspecific
+-   fun:_ZN14QThreadPrivate5startEPv
+-}
+-
+-
+-####################################################
+-# Other stuff.
+-#
+-# pthread_exit apparently calls some kind of unwind
+-# mechanism - maybe to remove some number of frames
+-# from the thread's stack, so as to get back to the 
+-# outermost frame for the thread?  Anyway..
+-
+-{
+-   helgrind---*Unwind*-...-pthread_exit
+-   Helgrind:Race
+-   fun:*Unwind*
+-   ...
+-   fun:pthread_exit
+-}
+-
+-{
+-   helgrind---...-*Unwind*-*pthread_unwind*
+-   Helgrind:Race
+-   ...
+-   fun:*Unwind*
+-   fun:*pthread_unwind*
+-}
+-
+-{
+-   helgrind---...-*Unwind*-*pthread_unwind*
+-   Helgrind:Race
+-   ...
+-   fun:_Unwind*
+-   ...
+-   fun:_Unwind_Backtrace
+-}
+-
+-
+-
+-
+-####################################################
+-# To do with thread stack allocation and deallocation?
+-#
+-{
+-   helgrind---free_stacks-__deallocate_stack
+-   Helgrind:Race
+-   fun:free_stacks
+-   fun:__deallocate_stack
+-}
+-
+-{
+-   helgrind---__deallocate_stack-start_thread-clone
+-   Helgrind:Race
+-   fun:__deallocate_stack
+-   fun:start_thread
+-   fun:clone
+-}
+-
+-
+-####################################################
+-# To do with pthread_{set,get}specific
+-#
+-{
+-   helgrind---pthread_setspecific
+-   Helgrind:Race
+-   fun:pthread_setspecific
+-}
+-
+-{
+-   helgrind---pthread_getspecific
+-   Helgrind:Race
+-   fun:pthread_getspecific
+-}
+-
+-
+-####################################################
+-# To do with dynamic linking
+-#
+-# helgrind---ld.so-...-dlsym was merged into helgrind-glibc2X-001
+-
+-{
+-   helgrind---_dl_allocate_tls 
+-   Helgrind:Race
+-   fun:mempcpy
+-   fun:_dl_allocate_tls_init
+-   ...
+-   fun:pthread_create@@GLIBC_2.2*
+-   fun:pthread_create_WRK
+-   fun:pthread_create@*
+-}
+-
+-{
+-   helgrind---_dl_allocate_tls2
+-   Helgrind:Race
+-   fun:memcpy
+-   fun:__mempcpy_inline
+-   fun:_dl_allocate_tls_init
+-   ...
+-   fun:pthread_create@@GLIBC_2.2*
+-   fun:pthread_create_WRK
+-   fun:pthread_create@*
+-}
+-
+-####################################################
+-# To do with GNU libgomp
+-#
+-{
+-   helgrind---libgomp43-1
+-   Helgrind:Race
+-   fun:gomp_ordered_sync
+-}
+-
+-{
+-   helgrind---libgomp43-1
+-   Helgrind:Race
+-   fun:gomp_ordered_next
+-}
+-
+-{
+-   helgrind---libgomp43-1
+-   Helgrind:Race
+-   fun:gomp_ordered_last
+-}
+Index: valgrind-3.17.0/glibc-2.X-helgrind.supp.in
+===================================================================
+--- /dev/null
++++ valgrind-3.17.0/glibc-2.X-helgrind.supp.in
+@@ -0,0 +1,303 @@
++# IMPORTANT: DO NOT EDIT glibc-2.X-helgrind.supp, as it is as a generated
++# file.  Instead edit glibc-2.X-helgrind.supp.in.
++
++# FIXME 22 Jan 09: helgrind-glibc2X-005 overlaps with a lot of
++# other stuff.  They should be removed.
++
++##----------------------------------------------------------------------##
++# Suppressions for the Helgrind tool when using 
++# a glibc-2.{3,4,5,6,7,8,9} system
++
++####################################################
++# glibc-2.X specific
++# These are generic cover-alls which catch a lot of stuff
++# in various combinations of ld, libc and libpthread
++#
++# Note this is heavyhanded and not very clever:
++#
++# - suppress anything that has its top frame in ld.so
++#   That's fine, since it's mostly dynamic linking stuff,
++#   which has various deliberate (harmless) races
++#
++# - suppress anything that has its top frame in libc.so.
++#   This really isn't clever, since it could hide some 
++#   legitimate races.  But the problem is, if we don't do
++#   this, then loads of errors to do with stdio are reported, because
++#   H fails to see glibc's internal locking/unlocking of FILE*s
++#   as required by POSIX.  A better solution is needed.
++#
++# - some of the stdio functions in newer glibc manipulate stdio
++#   FILE*s state through mempcpy, which we intercept, so we also need
++#   to suppress such manipulations.
++
++#{
++#   helgrind-glibc2X-001
++#   Helgrind:Race
++#   obj:*/lib*/ld-2.*so*
++#}
++
++# helgrind-glibc2X-002 was merged into helgrind-glibc2X-001
++
++# helgrind-glibc2X-003 was merged into helgrind-glibc2X-001
++
++{
++   helgrind-glibc2X-004
++   Helgrind:Race
++   obj:@GLIBC_LIBC_PATH@
++}
++
++{
++   helgrind-glibc-io-xsputn-mempcpy
++   Helgrind:Race
++   fun:__GI_mempcpy
++   fun:_IO_*xsputn*
++   obj:@GLIBC_LIBC_PATH@
++}
++
++{
++   helgrind-glibc2X-005
++   Helgrind:Race
++   obj:@GLIBC_LIBPTHREAD_PATH@
++}
++
++# helgrind-glibc2X-006 was merged into helgrind-glibc2X-005
++
++# helgrind-glibc2X-007 was merged into helgrind-glibc2X-001
++
++# helgrind-glibc2X-008 was merged into helgrind-glibc2X-004
++
++# helgrind-glibc2X-009 was merged into helgrind-glibc2X-004
++
++# helgrind-glibc2X-010 was merged into helgrind-glibc2X-001
++
++# helgrind-glibc2X-011 was merged into helgrind-glibc2X-004
++
++# helgrind-glibc2X-012 was merged into helgrind-glibc2X-001
++
++# helgrind-glibc2X-013 was merged into helgrind-glibc2X-001
++
++# helgrind-glibc2X-014 was merged into helgrind-glibc2X-001
++
++# helgrind-glibc2X-015 was merged into helgrind-glibc2X-004
++
++# helgrind-glibc2X-016 was merged into helgrind-glibc2X-004
++
++# These are very ugly.  They are needed to suppress errors inside (eg)
++# NPTL's pthread_cond_signal.  Why only one stack frame -- at least we
++# should see the wrapper calling the real functions, right?
++# Unfortunately, no: the real functions are handwritten assembly (in
++# the glibc-2.5 sources) and does not create a proper stack frame.
++# Therefore it's only one level of unwinding before we're back out in
++# user code rather than the 2 levels you'd expect.
++{
++   helgrind-glibc2X-101
++   Helgrind:Race
++   obj:@GLIBC_LIBPTHREAD_PATH@
++   fun:pthread_*
++}
++{
++   helgrind-glibc2X-102
++   Helgrind:Race
++   fun:mythread_wrapper
++   obj:@GLIBC_LIBPTHREAD_PATH@
++}
++{
++   helgrind-glibc2X-103
++   Helgrind:Race
++   fun:pthread_cond_*@@GLIBC_2.*
++}
++{
++   helgrind-glibc2X-104
++   Helgrind:Race
++   fun:__lll_mutex_*
++}
++{
++   helgrind-glibc2X-105
++   Helgrind:Race
++   fun:pthread_rwlock_*lock*
++}
++{
++   helgrind-glibc2X-106
++   Helgrind:Race
++   fun:__lll_lock_wait
++}
++{
++   helgrind-glibc2X-107
++   Helgrind:Race
++   obj:@GLIBC_LIBPTHREAD_PATH@
++   fun:sem_*
++}
++{
++   helgrind-glibc2X-108
++   Helgrind:Race
++   fun:clone
++}
++{
++   helgrind-glibc2X-109
++   Helgrind:Race
++   fun:start_thread
++}
++{
++   helgrind-glibc2X-110
++   Helgrind:Race
++   obj:@GLIBC_LIBC_PATH@
++   fun:pthread_*
++}
++{
++   helgrind-glibc2X-111
++   Helgrind:Race
++   fun:__lll_*lock_*
++}
++{
++   helgrind-glibc2X-113
++   Helgrind:Race
++   fun:pthread_barrier_wait*
++}
++
++
++####################################################
++# qt4 specific (GNU mangling)
++#
++{
++   helgrind-qt4---QMutex::lock()-QMutex::lock()
++   Helgrind:Race
++   ...
++   fun:_ZN6QMutex4lockEv
++   fun:_ZN6QMutex4lockEv
++}
++
++{                                                               
++   helgrind-qt4---QMutex::unlock()-QMutex::unlock()
++   Helgrind:Race                                                
++   ...
++   fun:_ZN6QMutex6unlockEv                                      
++   fun:_ZN6QMutex6unlockEv
++}
++
++{
++   helgrind-qt4---pthread_setspecific-QThreadPrivate::start(void*)
++   Helgrind:Race
++   fun:pthread_setspecific
++   fun:_ZN14QThreadPrivate5startEPv
++}
++
++
++####################################################
++# Other stuff.
++#
++# pthread_exit apparently calls some kind of unwind
++# mechanism - maybe to remove some number of frames
++# from the thread's stack, so as to get back to the 
++# outermost frame for the thread?  Anyway..
++
++{
++   helgrind---*Unwind*-...-pthread_exit
++   Helgrind:Race
++   fun:*Unwind*
++   ...
++   fun:pthread_exit
++}
++
++{
++   helgrind---...-*Unwind*-*pthread_unwind*
++   Helgrind:Race
++   ...
++   fun:*Unwind*
++   fun:*pthread_unwind*
++}
++
++{
++   helgrind---...-*Unwind*-*pthread_unwind*
++   Helgrind:Race
++   ...
++   fun:_Unwind*
++   ...
++   fun:_Unwind_Backtrace
++}
++
++
++
++
++####################################################
++# To do with thread stack allocation and deallocation?
++#
++{
++   helgrind---free_stacks-__deallocate_stack
++   Helgrind:Race
++   fun:free_stacks
++   fun:__deallocate_stack
++}
++
++{
++   helgrind---__deallocate_stack-start_thread-clone
++   Helgrind:Race
++   fun:__deallocate_stack
++   fun:start_thread
++   fun:clone
++}
++
++
++####################################################
++# To do with pthread_{set,get}specific
++#
++{
++   helgrind---pthread_setspecific
++   Helgrind:Race
++   fun:pthread_setspecific
++}
++
++{
++   helgrind---pthread_getspecific
++   Helgrind:Race
++   fun:pthread_getspecific
++}
++
++
++####################################################
++# To do with dynamic linking
++#
++# helgrind---ld.so-...-dlsym was merged into helgrind-glibc2X-001
++
++{
++   helgrind---_dl_allocate_tls 
++   Helgrind:Race
++   fun:mempcpy
++   fun:_dl_allocate_tls_init
++   ...
++   fun:pthread_create@@GLIBC_2.2*
++   fun:pthread_create_WRK
++   fun:pthread_create@*
++}
++
++{
++   helgrind---_dl_allocate_tls2
++   Helgrind:Race
++   fun:memcpy
++   fun:__mempcpy_inline
++   fun:_dl_allocate_tls_init
++   ...
++   fun:pthread_create@@GLIBC_2.2*
++   fun:pthread_create_WRK
++   fun:pthread_create@*
++}
++
++####################################################
++# To do with GNU libgomp
++#
++{
++   helgrind---libgomp43-1
++   Helgrind:Race
++   fun:gomp_ordered_sync
++}
++
++{
++   helgrind---libgomp43-1
++   Helgrind:Race
++   fun:gomp_ordered_next
++}
++
++{
++   helgrind---libgomp43-1
++   Helgrind:Race
++   fun:gomp_ordered_last
++}
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 3f8a34becc0..2805ad0eb31 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -45,6 +45,10 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-Add-missing-musl.supp.patch \
            file://0001-drd-tests-swapcontext-Add-SIGALRM-handler-to-avoid-s.patch \
+           file://6da22a4d246519cd1a638cfc7eff00cdd74413c4.patch \
+           file://200b6a5a0ea3e1e154663b0fc575bfe2becf177d.patch \
+           file://a1364805fc74b5690f763033c0c9b43f27613572.patch \
+           file://52ed51fc35f8a6148c2940eb46932b02dd3b9b23.patch \
            "
 SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
 SRC_URI[sha256sum] = "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
-- 
2.30.2

