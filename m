Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <phil.staub@windriver.com>) id 1U0H5r-0005EP-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 20:43:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0TJS21e005113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 11:28:02 -0800 (PST)
Received: from soho-phils-d2.wrs.com (172.25.35.78) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 29 Jan 2013 11:28:01 -0800
From: Phil Staub <Phil.Staub@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 11:28:01 -0800
Message-ID: <1359487681-9335-1-git-send-email-Phil.Staub@windriver.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH] mips: Fix libaio system call interface
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
X-List-Received-Date: Tue, 29 Jan 2013 19:43:45 -0000
Content-Type: text/plain

The io_syscallX wrappers in syscall-mips.h discard error return status
by overwriting the value returned in v0 from the system call with -1.

Modify this behavior by returning the negative of the return value on
error (as identified by a3 != 0). This convention is consistent with
the behavior observed in syscall-ppc.h.

For a description of the MIPS system call interface, see:

http://www.linux-mips.org/wiki/Syscall

Signed-off-by: Phil Staub <Phil.Staub@windriver.com>
---
 .../libaio/libaio_fix_for_mips_syscall.patch       |   57 ++++++++++++++++++++
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |    6 ++-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscall.patch

diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscall.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscall.patch
new file mode 100644
index 0000000..0408865
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscall.patch
@@ -0,0 +1,57 @@
+diff -urp libaio-0.3.109.orig/src/syscall-mips.h libaio-0.3.109/src/syscall-mips.h
+--- libaio-0.3.109.orig/src/syscall-mips.h	2013-01-23 20:17:55.750897706 -0800
++++ libaio-0.3.109/src/syscall-mips.h	2013-01-23 13:13:34.143660455 -0800
+@@ -76,7 +76,7 @@ type fname(atype a) \
+ 	\
+ 	if (__a3 == 0) \
+ 		return (type) __v0; \
+-	return (type) -1; \
++	return (type) -(__v0); \
+ }
+ 
+ #define io_syscall2(type,fname,sname,atype,a,btype,b) \
+@@ -100,7 +100,7 @@ type fname(atype a, btype b) \
+ 	\
+ 	if (__a3 == 0) \
+ 		return (type) __v0; \
+-	return (type) -1; \
++	return (type) -(__v0); \
+ }
+ 
+ #define io_syscall3(type,fname,sname,atype,a,btype,b,ctype,c) \
+@@ -125,7 +125,7 @@ type fname(atype a, btype b, ctype c) \
+ 	\
+ 	if (__a3 == 0) \
+ 		return (type) __v0; \
+-	return (type) -1; \
++	return (type) -(__v0); \
+ }
+ 
+ #define io_syscall4(type,fname,sname,atype,a,btype,b,ctype,c,dtype,d) \
+@@ -150,7 +150,7 @@ type fname(atype a, btype b, ctype c, dt
+ 	\
+ 	if (__a3 == 0) \
+ 		return (type) __v0; \
+-	return (type) -1; \
++	return (type) -(__v0); \
+ }
+ 
+ #if (_MIPS_SIM == _MIPS_SIM_ABI32)
+@@ -186,7 +186,7 @@ type fname(atype a, btype b, ctype c, dt
+ 	\
+ 	if (__a3 == 0) \
+ 		return (type) __v0; \
+-	return (type) -1; \
++	return (type) -(__v0); \
+ }
+ 
+ #endif /* (_MIPS_SIM == _MIPS_SIM_ABI32) */
+@@ -216,7 +216,7 @@ type fname (atype a,btype b,ctype c,dtyp
+ 	\
+ 	if (__a3 == 0) \
+ 		return (type) __v0; \
+-	return (type) -1; \
++	return (type) -(__v0); \
+ }
+ 
+ #endif /* (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64) */
diff --git a/meta/recipes-extended/libaio/libaio_0.3.109.bb b/meta/recipes-extended/libaio/libaio_0.3.109.bb
index 161b712..23641ed 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.109.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.109.bb
@@ -5,13 +5,15 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://00_arches.patch \
            file://toolchain.patch \
            file://destdir.patch \
-           file://libaio_fix_for_x32.patch"
+           file://libaio_fix_for_x32.patch \
+	   file://libaio_fix_for_mips_syscall.patch \
+"
 
 SRC_URI[md5sum] = "435a5b16ca6198eaf01155263d855756"
 SRC_URI[sha256sum] = "bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d"
-- 
1.7.7.6



