Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web12.1408.1594403296195115252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 10:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=AYWZk/hI;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2879; q=dns/txt; s=iport;
  t=1594403296; x=1595612896;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YNVi6pgpLgnSHsme/RqChbFAuXWEQmjduRRybb1eaAM=;
  b=AYWZk/hIDmWOuw963dMZvymzGHZ4ieLlt8st8zSTJFhiy6iUHzBM5vXL
   TVnl3QhWRPR5cdwN/6s5OfzodWciBRz8WLdLc7V9RmOjumV0DIXjbcF7w
   yawcvBJIEQUPcUDQOv5oGcTr6zDw59pIbVOy7wOI+XaT8/ipR8ptFreKi
   s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A3AwD0qAhf/5tdJa1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGCCoIqgUMBMiyfXJF3CwEBAQwBAS8EAQGERwQCghgCJDgTAgM?=
 =?us-ascii?q?BAQsBAQUBAQECAQYEbYVnhigBRoE+E4MmglglqSyCKIkqgUAUgSSIAoRvGoF?=
 =?us-ascii?q?BP4Nsc4ozBI8FjAeaC4Jnh1WRcQ8gnyUBsFMCBAsCFYFqI4FXcBWDJFAZDY4?=
 =?us-ascii?q?rFo5EIQMwNwIGCAEBAwmPdgEB?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="510808411"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 17:48:15 +0000
Received: from localhost.localdomain ([10.24.63.201])
	(authenticated bits=0)
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPSA id 06AHmEY1014698
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Jul 2020 17:48:15 GMT
From: "Taras Kondratiuk" <takondra@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: xe-linux-external@cisco.com,
        OE-core <openembedded-core@lists.openembedded.org>,
        Cristian Iorga <cristian.iorga@intel.com>
Subject: [PATCH] qemu: access host pkg-config via HOSTTOOLS
Date: Fri, 10 Jul 2020 10:48:13 -0700
Message-Id: <20200710174813.1963559-1-takondra@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.24.63.201, [10.24.63.201]
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Transfer-Encoding: 8bit

On some build hosts qemu-system-native fails to build with errors:
like:
| build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory
|    16 | #include <xkbcommon/xkbcommon.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| make: *** [build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/rules.mak:69: qemu-keymap.o] Error 1

This is a combination of two factors:
1. In our setup we use native toolchain from buildtools-tarball because
   default host GCC on some machines is too old.
2. Qemu recipe adds host pkg-config paths to PKG_CONFIG_PATH using
   hardcoded pkg-config tool's location (/usr/bin:/bin).  Added by
   commit 68a5ed337f8f ("qemu: fix qemu-native pkg-config paths")

Host xkbcommon package is detected in configure. But then the toolchain
can't find headers because it uses headers from buildtools-tarball only.

Instead of using hardcoded location, use pkg-config via HOSTTOOLS. It
will pick up correct pkg-config from PATH and avoid configuration
discrepancies.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/conf/bitbake.conf              | 2 +-
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 353caacef986..fae1147d397c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -488,7 +488,7 @@ HOSTTOOLS += " \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls make md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pr printf pwd \
+    mktemp mv nm objcopy objdump od patch perl pkg-config pr printf pwd \
     python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d41cc8f200b3..881a5ba65025 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -94,7 +94,7 @@ EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
 
 do_configure_prepend_class-native() {
 	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
+	BHOST_PKGCONFIG_PATH=$(${HOSTTOOLS_DIR}/pkg-config --variable pc_path pkg-config || echo "")
 	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
 		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
 	fi
-- 
2.25.1

