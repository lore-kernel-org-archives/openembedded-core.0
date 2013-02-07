Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCh-000543-W1
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWcar027235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:38 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:37 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:27 -0600
Message-ID: <7ec2e43b4d1cade618f7ed239589ccdff94010b7.1360270256.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270255.git.mark.hatle@windriver.com>
References: <cover.1360270255.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 06/11] eglibc-nativesdk: Fix buffer overrun with a relocated SDK
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
X-List-Received-Date: Thu, 07 Feb 2013 23:48:32 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

When ld-linux-*.so.2 is relocated to a path that is longer than the
original fixed location, the dynamic loader will crash in open_path
because it implicitly assumes that max_dirnamelen is a fixed size that
never changes.

The allocated buffer will not be large enough to contain the directory
path string which is larger than the fixed location provided at build
time.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../eglibc-2.17/relocatable_sdk_fix_openpath.patch | 41 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.17.bb            |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch b/meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch
new file mode 100644
index 0000000..f164f8f
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Inappropriate [SDK specific]
+
+eglibc-nativesdk: Fix buffer overrun with a relocated SDK
+
+When ld-linux-*.so.2 is relocated to a path that is longer than the
+original fixed location, the dynamic loader will crash in open_path
+because it implicitly assumes that max_dirnamelen is a fixed size that
+never changes.
+
+The allocated buffer will not be large enough to contain the directory
+path string which is larger than the fixed location provided at build
+time.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+---
+ elf/dl-load.c |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -1919,7 +1919,19 @@ open_path (const char *name, size_t name
+        given on the command line when rtld is run directly.  */
+     return -1;
+ 
++  do
++    {
++      struct r_search_path_elem *this_dir = *dirs;
++      if (this_dir->dirnamelen > max_dirnamelen)
++	{
++	  max_dirnamelen = this_dir->dirnamelen;
++	}
++    }
++  while (*++dirs != NULL);
++
+   buf = alloca (max_dirnamelen + max_capstrlen + namelen);
++
++  dirs = sps->dirs;
+   do
+     {
+       struct r_search_path_elem *this_dir = *dirs;
diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index 7bdb267..fb49ac4 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
@@ -45,6 +45,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 SRC_URI_append_class-nativesdk = " file://ld-search-order.patch \
             file://relocatable_sdk.patch \
+            file://relocatable_sdk_fix_openpath.patch \
             "
 S = "${WORKDIR}/eglibc-${PV}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
1.8.1.2.545.g2f19ada



