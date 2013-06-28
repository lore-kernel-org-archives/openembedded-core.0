Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DBB3E6A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 19:27:21 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 12:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,961,1363158000"; d="scan'208";a="261518944"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.119])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jun 2013 12:23:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 12:23:47 -0700
Message-Id: <1372447427-31750-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2 v2] security_flags: Add the compiler and linker flags that enhance security
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
X-List-Received-Date: Fri, 28 Jun 2013 19:27:22 -0000

These flags add addition checks at compile, link and runtime to prevent
stack smashing, checking for buffer overflows, and link at program start
to prevent call spoofing later.

This needs to be explicitly enabled by adding the following line to your
local.conf:

require conf/distro/include/security_flags.inc

[YOCTO #3868]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/conf/distro/include/security_flags.inc

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
new file mode 100644
index 0000000..1c1f980
--- /dev/null
+++ b/meta/conf/distro/include/security_flags.inc
@@ -0,0 +1,23 @@
+SECURITY_CFLAGS = "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
+SECURITY_LDFLAGS = "-Wl,-z,relro,-z,now"
+
+# Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
+# to CPPFLAGS it gets picked into CFLAGS in bitbake.
+#TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
+SECURITY_CFLAGS_pn-ppp = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-eglibc = ""
+SECURITY_CFLAGS_pn-eglibc-initial = ""
+SECURITY_CFLAGS_pn-zlib = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-gcc-runtime = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-libgcc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-tcl = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-libcap = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-python-smartpm = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-python-imaging = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-python-pycurl = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-kexec-tools = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+
+# These 2 have text relco errors with the pie options enabled
+SECURITY_CFLAGS_pn-pulseaudio = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-ltp = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-- 
1.8.1.4


