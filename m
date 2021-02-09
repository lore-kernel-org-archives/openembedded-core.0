Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.12468.1612885988361102987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: UFHKBhyqmjmgMTTMWuMKUv88BNatmJjH+cluCYro1DjNZhCMe8la4QtXpcvDGlrm54Tv3XJoqn
 kyd/K2mPuFmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266736028"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="266736028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:15 -0800
IronPort-SDR: AhoHoKTUDzdpggzK0WE3CEdWBpQNc+U5t+Ak/t14qli2cHeN3gTdtJkJvrnA0XwAKxyimqG9PL
 qne6yE3scpKg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215577"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 26/35] openssh: Backport a fix to fix with glibc 2.33 on some platforms
Date: Tue,  9 Feb 2021 23:52:11 +0800
Message-Id: <c7717df8a9e3b894bf48e3ec335d9e5c4cc7408f.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes openssh failing to work on qemux86 with glibc 2.33 due to
seccomp and the fact new syscalls are used. Also likely fixes issues
on other platforms.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22f8ce6e6d998c0539a40b2776b1a2abb4f44bb3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...440ca70abab947acbd77795e9f130967956c.patch | 28 +++++++++++++++++++
 .../openssh/openssh_8.3p1.bb                  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch b/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
new file mode 100644
index 0000000000..b88bc18f12
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
@@ -0,0 +1,28 @@
+From 0f90440ca70abab947acbd77795e9f130967956c Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Fri, 20 Nov 2020 13:37:54 +1100
+Subject: [PATCH] Add new pselect6_time64 syscall on ARM.
+
+This is apparently needed on armhfp/armv7hl.  bz#3232, patch from
+jjelen at redhat.com.
+---
+ sandbox-seccomp-filter.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Upstream-Status: Backport
+[fixes issues on 32bit IA and probably other 32 bit platforms too with glibc 2.33]
+
+diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
+index e0768c063..5065ae7ef 100644
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -267,6 +267,9 @@ static const struct sock_filter preauth_insns[] = {
+ #ifdef __NR_pselect6
+ 	SC_ALLOW(__NR_pselect6),
+ #endif
++#ifdef __NR_pselect6_time64
++	SC_ALLOW(__NR_pselect6_time64),
++#endif
+ #ifdef __NR_read
+ 	SC_ALLOW(__NR_read),
+ #endif
diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
index 2aa1df20bd..3061ed2975 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://0f90440ca70abab947acbd77795e9f130967956c.patch \
            "
 SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
 
-- 
2.29.2

