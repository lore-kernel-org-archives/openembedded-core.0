Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA8E60620
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 01:56:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB41uMEJ020733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Dec 2015 17:56:22 -0800
Received: from Flora.wrs.com (128.224.163.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 3 Dec 2015 17:56:21 -0800
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Dec 2015 10:01:40 +0800
Message-ID: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Subject: [PATCH] gcc: Security Advisory - gcc - CVE-2015-5276
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
X-List-Received-Date: Fri, 04 Dec 2015 01:56:22 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

The std::random_device class in libstdc++ in the GNU Compiler Collection
(aka GCC) before 4.9.4 does not properly handle short reads from
blocking sources, which makes it easier for context-dependent attackers
to predict the random values via unspecified vectors.

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5276

Patches backported from upstream as:
git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227687
138bc75d-0d04-0410-961f-82ee72b054a4
git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227872
138bc75d-0d04-0410-961f-82ee72b054a4

Upstream-status: backport[4.9.4]

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  2 +
 ...67-Check-read-result-in-std-random_device.patch | 57 +++++++++++++++++
 ...std-random_device-retry-after-short-reads.patch | 71 ++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 6ac3685..f3af41f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -82,6 +82,8 @@ SRC_URI = "\
     file://0064-handle-target-sysroot-multilib.patch \
     file://0065-gcc-483-universal-initializer-no-warning.patch \
     file://0066-cxxflags-for-build.patch \
+    file://0067-Check-read-result-in-std-random_device.patch \
+    file://0068-Make-std-random_device-retry-after-short-reads.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch b/meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch
new file mode 100644
index 0000000..352567f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch
@@ -0,0 +1,57 @@
+From 2ef472318fe63bc092d3f1cc455116c50f853adf Mon Sep 17 00:00:00 2001
+From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 11 Sep 2015 13:44:26 +0000
+Subject: [PATCH 1/2] Check read() result in std::random_device.
+
+	PR libstdc++/65142
+	* src/c++11/random.cc (random_device::_M_getval()): Check read result.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227687 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+---
+ libstdc++-v3/ChangeLog           |  5 +++++
+ libstdc++-v3/src/c++11/random.cc | 12 ++++++++----
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/libstdc++-v3/ChangeLog b/libstdc++-v3/ChangeLog
+index a742a72..51a5a9f 100644
+--- a/libstdc++-v3/ChangeLog
++++ b/libstdc++-v3/ChangeLog
+@@ -1,3 +1,8 @@
++2015-09-11  Jonathan Wakely  <jwakely@redhat.com>
++
++	PR libstdc++/65142
++	* src/c++11/random.cc (random_device::_M_getval()): Check read result.
++
+ 2015-06-26  Release Manager
+ 
+ 	* GCC 4.9.3 released.
+diff --git a/libstdc++-v3/src/c++11/random.cc b/libstdc++-v3/src/c++11/random.cc
+index f61daea..ab3e55d 100644
+--- a/libstdc++-v3/src/c++11/random.cc
++++ b/libstdc++-v3/src/c++11/random.cc
+@@ -129,13 +129,17 @@ namespace std _GLIBCXX_VISIBILITY(default)
+ #endif
+ 
+     result_type __ret;
++
+ #ifdef _GLIBCXX_HAVE_UNISTD_H
+-    read(fileno(static_cast<FILE*>(_M_file)),
+-	 static_cast<void*>(&__ret), sizeof(result_type));
++    auto e = read(fileno(static_cast<FILE*>(_M_file)),
++		  static_cast<void*>(&__ret), sizeof(result_type));
+ #else
+-    std::fread(static_cast<void*>(&__ret), sizeof(result_type),
+-	       1, static_cast<FILE*>(_M_file));
++    auto e = std::fread(static_cast<void*>(&__ret), sizeof(result_type),
++		        1, static_cast<FILE*>(_M_file));
+ #endif
++    if (e != sizeof(result_type))
++      __throw_runtime_error(__N("random_device could not read enough bytes"));
++
+     return __ret;
+   }
+ 
+-- 
+2.0.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch b/meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch
new file mode 100644
index 0000000..e0c475e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch
@@ -0,0 +1,71 @@
+From a1f5c28240646583a99c6cc2986d490f71f2157d Mon Sep 17 00:00:00 2001
+From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 17 Sep 2015 15:06:42 +0000
+Subject: [PATCH 2/2] Make std::random_device retry after short reads
+
+	PR libstdc++/65142
+	* src/c++11/random.cc (random_device::_M_getval()): Retry after short
+	reads.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227872 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+---
+ libstdc++-v3/ChangeLog           |  6 ++++++
+ libstdc++-v3/src/c++11/random.cc | 24 +++++++++++++++++-------
+ 2 files changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/libstdc++-v3/ChangeLog b/libstdc++-v3/ChangeLog
+index 51a5a9f..5df4d8c 100644
+--- a/libstdc++-v3/ChangeLog
++++ b/libstdc++-v3/ChangeLog
+@@ -1,3 +1,9 @@
++2015-09-17  Jonathan Wakely  <jwakely@redhat.com>
++
++	PR libstdc++/65142
++	* src/c++11/random.cc (random_device::_M_getval()): Retry after short
++	reads.
++
+ 2015-09-11  Jonathan Wakely  <jwakely@redhat.com>
+ 
+ 	PR libstdc++/65142
+diff --git a/libstdc++-v3/src/c++11/random.cc b/libstdc++-v3/src/c++11/random.cc
+index ab3e55d..db2f841 100644
+--- a/libstdc++-v3/src/c++11/random.cc
++++ b/libstdc++-v3/src/c++11/random.cc
+@@ -129,16 +129,26 @@ namespace std _GLIBCXX_VISIBILITY(default)
+ #endif
+ 
+     result_type __ret;
+-
++    void* p = &__ret;
++    size_t n = sizeof(result_type);
+ #ifdef _GLIBCXX_HAVE_UNISTD_H
+-    auto e = read(fileno(static_cast<FILE*>(_M_file)),
+-		  static_cast<void*>(&__ret), sizeof(result_type));
++    do
++      {
++	const int e = read(fileno(static_cast<FILE*>(_M_file)), p, n);
++	if (e > 0)
++	  {
++	    n -= e;
++	    p = static_cast<char*>(p) + e;
++	  }
++	else if (e != -1 || errno != EINTR)
++	  __throw_runtime_error(__N("random_device could not be read"));
++      }
++    while (n > 0);
+ #else
+-    auto e = std::fread(static_cast<void*>(&__ret), sizeof(result_type),
+-		        1, static_cast<FILE*>(_M_file));
++    const size_t e = std::fread(p, n, 1, static_cast<FILE*>(_M_file));
++    if (e != 1)
++      __throw_runtime_error(__N("random_device could not be read"));
+ #endif
+-    if (e != sizeof(result_type))
+-      __throw_runtime_error(__N("random_device could not read enough bytes"));
+ 
+     return __ret;
+   }
+-- 
+2.0.1
+
-- 
1.9.1


