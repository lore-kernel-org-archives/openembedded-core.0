Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web08.14196.1605132916264931346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 14:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=GYDfXK0f;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=jgblIDPe76S2LCXiJJQwFMIZNgULX/UQsQAseEBGkww=;
	b=GYDfXK0fT9RkDQCTQacA4GhsF3vZllkFt5/YxGdhFNKMZGCPZ/WPFZDs4r4ZoLGQVi2iwqWQdD2gE
	 u9lt0WqfNuozQuuQahCneQzgfg+GNNjoFFFqAU0gteblMHd3w4A3DOH3daD3Kvou1LHBlNf7bEygFR
	 vk+vJ73EGtXRhY7hhg3DXrVWsUJPB+Mb/PMl3ShUc2Wbz+uacTdPvpnQUHb8cdYJnQ0Sx9vFkSJ2dT
	 f+vi5dZcCDWjOkhb3B6tWe88RDyH0z6rUGK1Dccjnf7vz/kjaxgS+ETBC1iEyOXwXLkT+y2TzdKQAU
	 9GK6CfH8eRWGpj/v0WLNUZyXK8tWM6w==
X-HalOne-Cookie: c30ab97fba079ed1c776a8b4364b26a419a8f58b
X-HalOne-ID: 5f67227a-246b-11eb-bb81-d0431ea8bb10
Received: from localhost.localdomain (c188-151-59-206.bredband.comhem.se [188.151.59.206])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 5f67227a-246b-11eb-bb81-d0431ea8bb10;
	Wed, 11 Nov 2020 22:15:14 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 1/2] rt-tests: backport patch that enable build for all archs
Date: Wed, 11 Nov 2020 23:15:02 +0100
Message-Id: <20201111221503.2194455-2-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111221503.2194455-1-peter@berginkonsult.se>
References: <20201111221503.2194455-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream rt-tests has applied a patch that allow builds for all archs.
The problem is that oslat using frc() that is not present for all archs.
With this backported patch oslat is building but in run-time an error
message is dumped if frc() is not present.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 ...-Allow-build-for-not-supported-archs.patch | 52 +++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_1.9.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
new file mode 100644
index 0000000000..1ee7539f7d
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
@@ -0,0 +1,52 @@
+From 165b597e3003c6870f5980e8902014d9344e6cf3 Mon Sep 17 00:00:00 2001
+From: Peter Xu <peterx@redhat.com>
+Date: Thu, 1 Oct 2020 14:47:26 -0400
+Subject: [PATCH] rt-tests: oslat: Allow build for not supported archs
+
+Now rt-tests won't build for archs other than x86/i386/ppc64 after oslat is
+merged.  Instead of failing the build, let's make it pass.  However, whenever
+oslat is executed, instead of running the real program, dump an error message,
+so that people can try to implement the frc() function for it when there's a
+real need for the new arch.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=165b597e3003c6870f5980e8902014d9344e6cf3]
+
+Signed-off-by: Peter Xu <peterx@redhat.com>
+Signed-off-by: John Kacur <jkacur@redhat.com>
+Signed-off-by: Peter Bergin <peter@berginkonsult.se>
+
+---
+ src/oslat/oslat.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/oslat/oslat.c b/src/oslat/oslat.c
+index f1a82f2..a8b6155 100644
+--- a/src/oslat/oslat.c
++++ b/src/oslat/oslat.c
+@@ -69,7 +69,9 @@ static inline void frc(uint64_t *pval)
+ 	__asm__ __volatile__("mfspr %0, 268\n" : "=r" (*pval));
+ }
+ # else
+-#  error Need frc() for this platform.
++#  define relax()          do { } while (0)
++#  define frc(x)
++#  define FRC_MISSING
+ # endif
+ #else
+ # error Need to add support for this compiler.
+@@ -810,6 +812,12 @@ int main(int argc, char *argv[])
+ 	int i, n_cores;
+ 	cpu_set_t cpu_set;
+ 
++#ifdef FRC_MISSING
++	printf("This architecture is not yet supported. "
++	       "Please implement frc() function first for %s.\n", argv[0]);
++	return 0;
++#endif
++
+ 	CPU_ZERO(&cpu_set);
+ 
+ 	g.app_name = argv[0];
+-- 
+2.25.1
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
index 1fe0bd5cfc..330b5090c6 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
             file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
+            file://0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch \
            "
 
 # rt-tests needs PI mutex support in libc
-- 
2.25.1

