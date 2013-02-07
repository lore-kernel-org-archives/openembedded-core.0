Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA4-0004O9-2d
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTuxD006246
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:56 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:54 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:36 -0600
Message-ID: <1923ac0d270c40a8519f734aae141667cebfb538.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 09/18] Summary: Security Advisory - boost - CVE-2012-2677
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
X-List-Received-Date: Thu, 07 Feb 2013 23:45:53 -0000
Content-Type: text/plain

From: Wei Cai <wei.cai@windriver.com>

[ CQID: WIND00366777 ]

A security flaw was found in the way ordered_malloc() routine implementation in
Boost, the free peer-reviewed portable C++ source libraries, performed 'next-size'
and 'max_size' parameters sanitization, when allocating memory. If an application,
using the Boost C++ source libraries for memory allocation, was missing
application-level checks for safety of 'next_size' and 'max_size' values, a remote
attacker could provide a specially-crafted application-specific file (requiring
runtime memory allocation it to be processed correctly) that, when opened would lead
to that application crash, or, potentially arbitrary code execution with the
privileges of the user running the application.

Signed-off-by: Wei Cai <wei.cai@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/boost/boost_1.49.0.bb         |  5 ++--
 .../boost/files/boost-CVE-2012-2677.patch          | 30 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/boost/files/boost-CVE-2012-2677.patch

diff --git a/meta/recipes-support/boost/boost_1.49.0.bb b/meta/recipes-support/boost/boost_1.49.0.bb
index 71fdc48..b0094c1 100644
--- a/meta/recipes-support/boost/boost_1.49.0.bb
+++ b/meta/recipes-support/boost/boost_1.49.0.bb
@@ -2,9 +2,10 @@ include boost.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRC_URI += "file://arm-intrinsics.patch"
+SRC_URI += "file://arm-intrinsics.patch \
+            file://boost-CVE-2012-2677.patch"
 
 SRC_URI[md5sum] = "0d202cb811f934282dea64856a175698"
 SRC_URI[sha256sum] = "dd748a7f5507a7e7af74f452e1c52a64e651ed1f7263fce438a06641d2180d3c"
diff --git a/meta/recipes-support/boost/files/boost-CVE-2012-2677.patch b/meta/recipes-support/boost/files/boost-CVE-2012-2677.patch
new file mode 100644
index 0000000..42e813d
--- /dev/null
+++ b/meta/recipes-support/boost/files/boost-CVE-2012-2677.patch
@@ -0,0 +1,30 @@
+--- a/boost/pool/pool.hpp.orig	
++++ b/boost/pool/pool.hpp	
+@@ -11,6 +11,8 @@
+ 
+ #include <boost/config.hpp>  // for workarounds
+ 
++// std::numeric_limits 
++#include <boost/limits.hpp> 
+ // std::less, std::less_equal, std::greater
+ #include <functional>
+ // new[], delete[], std::nothrow
+@@ -792,7 +794,8 @@
+ { //! Gets address of a chunk n, allocating new memory if not already available.
+   //! \returns Address of chunk n if allocated ok.
+   //! \returns 0 if not enough memory for n chunks.
+-
++  if (requested_size && (n > (std::numeric_limits<size_type>::max)() / requested_size)) 
++	return 0; 
+   const size_type partition_size = alloc_size();
+   const size_type total_req_size = n * requested_size;
+   const size_type num_chunks = total_req_size / partition_size +
+@@ -975,6 +978,8 @@
+   {
+      if(max_alloc_size && (n > max_alloc_size))
+         return 0;
++	 if(chunk_size && (n > (std::numeric_limits<size_type>::max)() / chunk_size)) 
++		return 0; 
+      void* ret = (user_allocator::malloc)(chunk_size * n);
+      used_list.insert(ret);
+      return ret;
-- 
1.8.1.2.545.g2f19ada



