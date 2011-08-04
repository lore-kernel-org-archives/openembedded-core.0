Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X3-0005MJ-2J
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260469"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:16 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:50 -0700
Message-Id: <03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:45 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/tclibc-glibc.inc   |   32 +++++++++++++++++++++++++++
 meta/conf/distro/include/tcmode-default.inc |    5 ++++
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/distro/include/tclibc-glibc.inc

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
new file mode 100644
index 0000000..823195c
--- /dev/null
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -0,0 +1,32 @@
+#
+# glibc specific configuration
+#
+
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
+
+# Add glibc to the overrides.
+OVERRIDES =. "libc-glibc:"
+
+PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
+PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "glibc-nativesdk"
+PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
+PREFERRED_PROVIDER_virtual/libc ?= "glibc"
+PREFERRED_PROVIDER_virtual/libc-nativesdk ?= "glibc-nativesdk"
+PREFERRED_PROVIDER_virtual/libc-locale ?= "glibc-locale"
+
+CXXFLAGS += "-fvisibility-inlines-hidden"
+
+LIBC_DEPENDENCIES = "\
+    libsegfault \
+    glibc \
+    glibc-dbg \
+    glibc-dev \
+    glibc-utils \
+    glibc-thread-db \
+    glibc-localedata-i18n \
+    glibc-gconv-ibm850 \
+    glibc-gconv-cp1252 \
+    glibc-gconv-iso8859-1 \
+    glibc-gconv-iso8859-15 \
+    locale-base-en-gb \
+    "
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0d0af38..5f66c9e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -48,6 +48,11 @@ PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-canadian ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
+PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-nativesdk ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-initial-nativesdk ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
-- 
1.7.6



