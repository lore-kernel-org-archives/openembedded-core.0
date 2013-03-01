Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UBTmv-0004Bx-4H
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:30:29 +0100
Received: by mail-pa0-f45.google.com with SMTP id kl14so1931515pab.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 09:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0xNdZgNHpCg6jVvIdXmRiR3VWUyaZHHqFCp5Acvr/g8=;
	b=aFl6mwnvrYn55zYPQbOkjQWJljeGJfzYLHEolM6tXDV2duyF1jmzSMdMJ65dS71Og0
	nHpi9y3fj9UKPuScjUyz037Ak1JHjkPutW+pe7t3Kqu5NIy73F9X9cMw5Sy8HngFP16V
	gQ4sCq92lmFdb/kCaSXf6IrQgWDv+cG3WHdg4XBcEcUpeNzkznTZqTqvON4xR6cImIJk
	Xziah9c8mHCzN292S+PWnJutzOfqzBocWztPLQOcaFIOx9lkGPo5mYyB+4YDaXYF0ouF
	EaRH+KQ4vs3S9SxgIA/E+xyyRrWLm970mHCoNMhlY3wf/zhuI6muFhZKxhj11Qc4PVRG
	6bdA==
X-Received: by 10.66.51.38 with SMTP id h6mr19520345pao.196.1362158044736;
	Fri, 01 Mar 2013 09:14:04 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ww9sm12619432pbc.41.2013.03.01.09.14.03
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 09:14:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 09:13:44 -0800
Message-Id: <1362158024-4041-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] iproute2: Fix build failure on ppc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 17:30:30 -0000

Latest version bump started failing for ppc32
attached patch is a backport from 3.9-rc1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tion-error-of-m_ipt.c-with-Werror-enabled.patch |   46 ++++++++++++++++++++
 .../iproute2/iproute2_3.8.0.bb                     |    6 ++-
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch
new file mode 100644
index 0000000..db74963
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Backport
+
+From 9235195666af7d887771cf557ef2bd3f00b9ecc8 Mon Sep 17 00:00:00 2001
+From: Vijay Subramanian <subramanian.vijay@gmail.com>
+Date: Tue, 26 Feb 2013 09:12:07 +0000
+Subject: [PATCH] Fix compilation error of m_ipt.c with -Werror enabled
+
+Commit (5a650703d47e10aa386406c855eff5a593b2120b Makefile: make warnings into
+errors ) causes the following build error.
+
+gcc -Wall -Wstrict-prototypes -Werror -Wmissing-prototypes
+-Wmissing-declarations -Wold-style-definition -O2 -I../include
+-DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib\" -DCONFDIR=\"/etc/iproute2\"
+-D_GNU_SOURCE -DCONFIG_GACT -DCONFIG_GACT_PROB -DIPT_LIB_DIR=\"/lib/xtables\"
+-DYY_NO_INPUT   -c -o m_ipt.o m_ipt.c
+cc1: warnings being treated as errors
+m_ipt.c:72: error: no previous prototype for 'xtables_register_target'
+m_ipt.c:361: error: no previous prototype for 'build_st'
+make[1]: *** [m_ipt.o] Error 1
+
+This is fixed by adding the prototype in the header include/iptables.h
+
+I am not sure if this is due to something wrong on my build system but I am
+using current glibc 2.17.
+
+Signed-off-by: Vijay Subramanian <subramanian.vijay@gmail.com>
+---
+ include/iptables.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/iptables.h b/include/iptables.h
+index dd844c1..f1e62e2 100644
+--- a/include/iptables.h
++++ b/include/iptables.h
+@@ -143,6 +143,8 @@ extern int line;
+ /* Your shared library should call one of these. */
+ extern void register_match(struct iptables_match *me);
+ extern void register_target(struct iptables_target *me);
++extern void xtables_register_target(struct iptables_target *me);
++extern int build_st(struct iptables_target *target, struct ipt_entry_target *t);
+ 
+ extern struct in_addr *dotted_to_addr(const char *dotted);
+ extern char *addr_to_dotted(const struct in_addr *addrp);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
index 70dcd2d..892d230 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
@@ -1,9 +1,11 @@
 require iproute2.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
-           file://configure-cross.patch"
+           file://configure-cross.patch \
+           file://0001-Fix-compilation-error-of-m_ipt.c-with-Werror-enabled.patch \
+          "
 
 SRC_URI[md5sum] = "951622fd770428116dc165acba375414"
 SRC_URI[sha256sum] = "579145749f1aaf60e7c7a5de24b7f00fa2200a961094733c792b4ff139181e4f"
-- 
1.7.9.5



