Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNX-0006tS-57
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:43 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1800424pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=++nV8cE8lbtOUmFB/K7+7RKWlKV45jj3sPw75MY3Be8=;
	b=ehp+xK9sE7quKwrhgeLfUFCSXBewT7UTingts0X1AopIgH8Fxv53Iz/o/XgUYzdxyu
	CQGocHST80pLE2MD7aXmQ/NEkQ2V6+/ddags0Yo+zvrPvrNAtFtp1rfkw8813AVZSTmU
	BlxAz2QKh0nWptxLOYdvMhWB54KxAYJlwZwPw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YKTLlbQUW2tMfmXgXpfGDM99RW+ol4/LlEyYpKPuSPod2R/27x5g3KvJtZfIxFkQ3G
	Q9VBnvtFwkaET0McAdJPGpsqf3AOAwDHi99Asj+FT8QkU42+CzfoLtBorOJaYN4UIivj
	nHYXvzcLkkIjM5f3km/ECNsfyKElzBABvK2rY=
Received: by 10.68.1.170 with SMTP id 10mr5943524pbn.189.1304754843111;
	Sat, 07 May 2011 00:54:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm2675953pbi.67.2011.05.07.00.54.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:54:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:59 -0700
Message-Id: <299c3a716b067eebdb1fc01e036d33119bfbc4cb.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 7/8] lttng-ust_0.12.bb: Fix compilation on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 May 2011 07:56:43 -0000

We provide alternative implementation of sched_getcpu()
when compiling for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |    4 +-
 2 files changed, 53 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
new file mode 100644
index 0000000..7102a69
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
@@ -0,0 +1,50 @@
+uClibc does not have sched_getcpu() implemented. So we create a wrapper
+to getcpu syscall when compiling for uclibc.
+
+So far execinfo.h does not exist on uclibc but it turns out to be that
+this header is not needed even in eglibc case so it can be removed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-status: Pending
+
+Index: ust-0.12/libust/tracer.h
+===================================================================
+--- ust-0.12.orig/libust/tracer.h
++++ ust-0.12/libust/tracer.h
+@@ -342,14 +342,22 @@ static __inline__ void ltt_write_trace_h
+ 	header->start_freq = trace->start_freq;
+ 	header->freq_scale = trace->freq_scale;
+ }
+-
++#ifdef __UCLIBC__
++#define sched_getcpu(cpu, node, cache) syscall(__NR_getcpu, cpu, node, cache)
++#endif
+ #ifndef UST_VALGRIND
+ 
+ static __inline__ int ust_get_cpu(void)
+ {
+ 	int cpu;
+ 
++#ifdef __UCLIBC__
++	int c, s;
++	s = syscall(__NR_getcpu, &c, NULL, NULL);
++	cpu = (s == -1) ? s : c;
++#else
+ 	cpu = sched_getcpu();
++#endif
+ 	if (likely(cpu >= 0))
+ 		return cpu;
+ 	/*
+Index: ust-0.12/libustcomm/ustcomm.c
+===================================================================
+--- ust-0.12.orig/libustcomm/ustcomm.c
++++ ust-0.12/libustcomm/ustcomm.c
+@@ -31,7 +31,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <execinfo.h>
+ 
+ #include "ustcomm.h"
+ #include "usterr.h"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
index 7dadc04..5fca949 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
@@ -12,7 +12,9 @@ DEPENDS = "liburcu"
 
 PR = "r0"
 
-SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
+SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz \
+           file://uclibc-sched_getcpu.patch \
+          "
 
 SRC_URI[md5sum] = "fae6e324a56016658c5b83ec14ba0043"
 SRC_URI[sha256sum] = "215b05f47d0c9e3a2934926a7d14fa9c67025db917c3a1f641df40b08314ab0c"
-- 
1.7.4.1



