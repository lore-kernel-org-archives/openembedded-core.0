Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
 by mx.groups.io with SMTP id smtpd.web11.1953.1587149966383099230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 11:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Rzfl1KIE;
 spf=pass (domain: flex--benjaminfair.bounces.google.com, ip: 209.85.210.201, mailfrom: 3jfyzxgwkaogloxtkwsxpksbqyyqvo.myw@flex--benjaminfair.bounces.google.com)
Received: by mail-pf1-f201.google.com with SMTP id q142so2746249pfc.21
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=JZciTRyB6/MPTfCppMntCNLfzFgWXX0ShEJZRH3S7tA=;
        b=Rzfl1KIEsrNOxEgL1sb3bJEXONnTyvF5aE+ThPf0vuN2p1y8U4f209sa0/H+9cNETo
         kXZQe6zVLmuJIqeyjev8yMm8FFbd+X/XNzjHBkojX+KJovgQD+DBWg7ABYl5fQ5n09Zd
         MZJKllycRBOKZym+uOpwSKKdnHOb50XMbDaBV3WIVMO5Z2k3AZWVjKUm1QcCX1J7i0x4
         MJ/zoRZrKVPeRVX+k3IDDn0+nNIiKMeIJgR0zROgwPviguptqZipgdVZZ6N2ur/bGenI
         saBwgHlo+uM1dyyf0szEIXtDx+j1cFiaUYjyU3nG/pRNy2vyom6HDJYQCpVU/QrZilWK
         SqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=JZciTRyB6/MPTfCppMntCNLfzFgWXX0ShEJZRH3S7tA=;
        b=Y5gPIRWJ16yh6W7rhJDNTz695S9S6GM7rwyAqPn825NxU2mdhwziUrqVJa3dVzvyD3
         RsHvoSrvVnhB128Tv9sT3dxxJ3xGHxymzRWd+VC6zAjDZAOFDVW+LlW4VwZegZMU6Gv+
         JLkMjLMK9eQftDTSfnXPl0Xp2UaaJ6M7R/UJ7cmGUE/QpQWB1M2SXGFI9Kri/7l15DUi
         mDGQ5hArZX5j3IOJQGFGQ+NgMGmZ440xJ/sa+fhhucbSFW4p+Zy1sMkXIHPpnTV7N1YS
         w4oX4UTFvKYYF6Ix6WMM94GfJr3tofpG1SgHbAkP1VWUWmf6Ujj1ZubcUOvo+KhdakI4
         S6ug==
X-Gm-Message-State: AGi0PublttilBR6L3i6dVBzuEJF1HLN1BqMB5XEqg0O1pmcZ0sKm+HOM
	GhaBGGSTNVj+FACwdT4dXcvGQ0E2+Mk/fDw20xjep/U6knN8H00iGsOjw62BA6+5bVgIx5PlMNe
	g2w1ByTtEF35AHhM214IljkMIVQQG3GE9l+dhnzS4uk0Oo9UqCJ8r4nUUBcxRtEeBDKElOUjB1e
	AGLnnl0xJjD9MqpiiJx5qu9TiqRQ==
X-Google-Smtp-Source: APiQypL8mAKXBrhdZg12+pmHgRr2AePh6IXyC8M9+oqsPN6L9uguBq6pSA6itLY4+ksiR5P/5SSaAiBx5d36rnGz2Tc=
X-Received: by 2002:a63:cc10:: with SMTP id x16mr4324989pgf.237.1587149965570;
 Fri, 17 Apr 2020 11:59:25 -0700 (PDT)
Date: Fri, 17 Apr 2020 11:58:17 -0700
Message-Id: <20200417185817.101912-1-benjaminfair@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
Subject: [PATCH] util-linux: fix build error in kill
From: benjaminfair@google.com
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Backport patches from upstream to fix a build error in the kill utility.

Fixes:
| In file included from ../util-linux-2.35.1/misc-utils/kill.c:57:
| ../util-linux-2.35.1/include/pidfd-utils.h: In function =E2=80=98pidfd_op=
en=E2=80=99:
| ../util-linux-2.35.1/include/pidfd-utils.h:19:17: error: =E2=80=98SYS_pid=
fd_open=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98pidfd_open=E2=80=99?

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
---
 .../0001-include-cleanup-pidfd-inckudes.patch | 42 ++++++++++++
 ...-types.h-before-checking-SYS_pidfd_s.patch | 64 +++++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-cl=
eanup-pidfd-inckudes.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-kill-inclu=
de-sys-types.h-before-checking-SYS_pidfd_s.patch

diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-p=
idfd-inckudes.patch b/meta/recipes-core/util-linux/util-linux/0001-include-=
cleanup-pidfd-inckudes.patch
new file mode 100644
index 0000000000..0ef6fb4ec7
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-in=
ckudes.patch
@@ -0,0 +1,42 @@
+From 0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 10 Mar 2020 11:43:16 +0100
+Subject: [PATCH] include: cleanup pidfd inckudes
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/0=
a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75]
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Benjamin Fair <benjaminfair@google.com>
+---
+ include/pidfd-utils.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 0baedd2c9..4a6c3a604 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -3,10 +3,10 @@
+=20
+ #if defined(__linux__)
+ # include <sys/syscall.h>
+-# if defined(SYS_pidfd_send_signal)
++# if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
+ #  include <sys/types.h>
+=20
+-#  ifndef HAVE_PIDFD_OPEN
++#  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+ {
+@@ -14,7 +14,7 @@ static inline int pidfd_send_signal(int pidfd, int sig, =
siginfo_t *info,
+ }
+ #  endif
+=20
+-#  ifndef HAVE_PIDFD_SEND_SIGNAL
++#  ifndef HAVE_PIDFD_OPEN
+ static inline int pidfd_open(pid_t pid, unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_open, pid, flags);
+--=20
+2.26.1.301.g55bc3eb7cb9-goog
+
diff --git a/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-=
types.h-before-checking-SYS_pidfd_s.patch b/meta/recipes-core/util-linux/ut=
il-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
new file mode 100644
index 0000000000..e43e12873f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h=
-before-checking-SYS_pidfd_s.patch
@@ -0,0 +1,64 @@
+From 3cfde0370d3a8949df0c5bcf447cec6692910ed2 Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 15 Feb 2020 21:12:50 +0000
+Subject: [PATCH] kill: include sys/types.h before checking
+ SYS_pidfd_send_signal
+
+Including sys/types.h must happen before SYS_pidfd_send_signal is checked,
+because that header defines variable in normal conditions.  When sys/types=
.h
+does not have SYS_pidfd_send_signal then fallback is defined in config.h
+that is included by default, and has therefore worked fine before and afte=
r
+this change.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/3=
cfde0370d3a8949df0c5bcf447cec6692910ed2]
+
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Signed-off-by: Benjamin Fair <benjaminfair@google.com>
+---
+ include/pidfd-utils.h | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 593346576..0baedd2c9 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -1,26 +1,28 @@
+ #ifndef UTIL_LINUX_PIDFD_UTILS
+ #define UTIL_LINUX_PIDFD_UTILS
+=20
+-#if defined(__linux__) && defined(SYS_pidfd_send_signal)
+-# include <sys/types.h>
++#if defined(__linux__)
+ # include <sys/syscall.h>
++# if defined(SYS_pidfd_send_signal)
++#  include <sys/types.h>
+=20
+-# ifndef HAVE_PIDFD_OPEN
++#  ifndef HAVE_PIDFD_OPEN
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_send_signal, pidfd, sig, info, flags);
+ }
+-# endif
++#  endif
+=20
+-# ifndef HAVE_PIDFD_SEND_SIGNAL
++#  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_open(pid_t pid, unsigned int flags)
+ {
+ 	return syscall(SYS_pidfd_open, pid, flags);
+ }
+-# endif
++#  endif
+=20
+-# define UL_HAVE_PIDFD 1
++#  define UL_HAVE_PIDFD 1
+=20
+-#endif /* __linux__ && SYS_pidfd_send_signal */
++# endif	/* SYS_pidfd_send_signal */
++#endif /* __linux__ */
+ #endif /* UTIL_LINUX_PIDFD_UTILS */
+--=20
+2.26.1.301.g55bc3eb7cb9-goog
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.35.1.bb
index 51964c9124..516b783887 100644
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -9,6 +9,8 @@ SRC_URI +=3D "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
             file://0001-libfdisk-script-accept-sector-size-ignore-unknown-=
he.patch \
+            file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd=
_s.patch \
+            file://0001-include-cleanup-pidfd-inckudes.patch \
 "
 SRC_URI[md5sum] =3D "7f64882f631225f0295ca05080cee1bf"
 SRC_URI[sha256sum] =3D "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1=
922c3597f1d7f9"
--=20
2.26.1.301.g55bc3eb7cb9-goog

