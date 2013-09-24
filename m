Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2785610FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 13:20:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8ODK8Kh009901
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 06:20:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 24 Sep 2013 06:20:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2013 21:20:08 +0800
Message-ID: <1380028808-24039-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] bind: port a patch to fix a build failure
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
X-List-Received-Date: Tue, 24 Sep 2013 13:20:07 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../bind/bind-9.8.1/mips1-not-support-opcode.diff  |  104 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff b/meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff
new file mode 100644
index 0000000..2930796
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff
@@ -0,0 +1,104 @@
+bind: port a patch to fix a build failure
+
+mips1 does not support ll and sc instructions, and lead to below error, now
+we port a patch from debian to fix it
+[http://security.debian.org/debian-security/pool/updates/main/b/bind9/bind9_9.8.4.dfsg.P1-6+nmu2+deb7u1.diff.gz]
+
+| {standard input}: Assembler messages:
+| {standard input}:47: Error: Opcode not supported on this processor: mips1 (mips1) `ll $3,0($6)'
+| {standard input}:50: Error: Opcode not supported on this processor: mips1 (mips1) `sc $3,0($6)'
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+--- bind9-9.8.4.dfsg.P1.orig/lib/isc/mips/include/isc/atomic.h
++++ bind9-9.8.4.dfsg.P1/lib/isc/mips/include/isc/atomic.h
+@@ -31,18 +31,20 @@
+ isc_atomic_xadd(isc_int32_t *p, int val) {
+ 	isc_int32_t orig;
+ 
+-	/* add is a cheat, since MIPS has no mov instruction */
+-	__asm__ volatile (
+-	    "1:"
+-	    "ll $3, %1\n"
+-	    "add %0, $0, $3\n"
+-	    "add $3, $3, %2\n"
+-	    "sc $3, %1\n"
+-	    "beq $3, 0, 1b"
+-	    : "=&r"(orig)
+-	    : "m"(*p), "r"(val)
+-	    : "memory", "$3"
+-		);
++	__asm__ __volatile__ (
++	"	.set	push		\n"
++	"	.set	mips2		\n"
++	"	.set	noreorder	\n"
++	"	.set	noat		\n"
++	"1:	ll	$1, %1		\n"
++	"	addu	%0, $1, %2	\n"
++	"	sc	%0, %1		\n"
++	"	beqz	%0, 1b		\n"
++	"	move	%0, $1		\n"
++	"	.set	pop		\n"
++	: "=&r" (orig), "+R" (*p)
++	: "r" (val)
++	: "memory");
+ 
+ 	return (orig);
+ }
+@@ -52,16 +54,7 @@
+  */
+ static inline void
+ isc_atomic_store(isc_int32_t *p, isc_int32_t val) {
+-	__asm__ volatile (
+-	    "1:"
+-	    "ll $3, %0\n"
+-	    "add $3, $0, %1\n"
+-	    "sc $3, %0\n"
+-	    "beq $3, 0, 1b"
+-	    :
+-	    : "m"(*p), "r"(val)
+-	    : "memory", "$3"
+-		);
++	*p = val;
+ }
+ 
+ /*
+@@ -72,20 +65,23 @@
+ static inline isc_int32_t
+ isc_atomic_cmpxchg(isc_int32_t *p, int cmpval, int val) {
+ 	isc_int32_t orig;
++	isc_int32_t tmp;
+ 
+-	__asm__ volatile(
+-	    "1:"
+-	    "ll $3, %1\n"
+-	    "add %0, $0, $3\n"
+-	    "bne $3, %2, 2f\n"
+-	    "add $3, $0, %3\n"
+-	    "sc $3, %1\n"
+-	    "beq $3, 0, 1b\n"
+-	    "2:"
+-	    : "=&r"(orig)
+-	    : "m"(*p), "r"(cmpval), "r"(val)
+-	    : "memory", "$3"
+-		);
++	__asm__ __volatile__ (
++	"	.set	push		\n"
++	"	.set	mips2		\n"
++	"	.set	noreorder	\n"
++	"	.set	noat		\n"
++	"1:	ll	$1, %1		\n"
++	"	bne	$1, %3, 2f	\n"
++	"	move	%2, %4		\n"
++	"	sc	%2, %1		\n"
++	"	beqz	%2, 1b		\n"
++	"2:	move	%0, $1		\n"
++	"	.set	pop		\n"
++	: "=&r"(orig), "+R" (*p), "=r" (tmp)
++	: "r"(cmpval), "r"(val)
++	: "memory");
+ 
+ 	return (orig);
+ }
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 3c5d600..5919c21 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-CVE-2012-3817.patch \
            file://bind-CVE-2013-2266.patch \
            file://bind-Fix-CVE-2012-4244.patch \
+           file://mips1-not-support-opcode.diff \
 	   "
 
 SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
-- 
1.7.10.4


