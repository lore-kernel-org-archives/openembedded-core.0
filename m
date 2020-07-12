Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.5663.1594589755826648129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2020 14:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=C719jxca;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2337; q=dns/txt; s=iport;
  t=1594589755; x=1595799355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GJAELGynOuT/ooTsdxkiqOPdplCBywdVNN8V3b/bl3U=;
  b=C719jxcaDROVgoYsnjrccNy2GI3+iV+OcMO0XXBQ0fLYlbLiNJZUXc1N
   pCGBIokKvV/ECkUh9l9d2nWVCYKVW2ioUbdemqBQfCUdm3KhO2V0oxB59
   eyIgK6QAplJzyqpzieuqlTMqBydZFbIUq0a4Wv6+btZfwfXpNHdkCUG0j
   s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C+AAAjgQtf/5hdJa1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBeQQBAQsBgimBQwEyLJ9ckXgLAQEBDAEBLwQBAYRMAoIWAiQ?=
 =?us-ascii?q?3Bg4CAwEBCwEBBQEBAQIBBgRthWeFcAYyAUYQUVcGE4MmglglpwGCKIVRgzO?=
 =?us-ascii?q?BQBSBJAGIAoRvGoFBP4Nsc4QVhh4EjyeLaZkIgQSCZ4dXkXIPIZ8pAbBgAgQ?=
 =?us-ascii?q?LAhWBaSSBV3AVgyRQGQ2dBSEDMDcCBggBAQMJjWeCRQEB?=
X-IronPort-AV: E=Sophos;i="5.75,345,1589241600"; 
   d="scan'208";a="528881902"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 12 Jul 2020 21:35:52 +0000
Received: from localhost.localdomain ([10.24.63.201])
	(authenticated bits=0)
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id 06CLZpIt009737
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 12 Jul 2020 21:35:52 GMT
From: "Taras Kondratiuk" <takondra@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: xe-linux-external@cisco.com,
        OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: use host pkg-config only when host provides sdl
Date: Sun, 12 Jul 2020 14:35:51 -0700
Message-Id: <20200712213551.2206605-1-takondra@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.24.63.201, [10.24.63.201]
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Transfer-Encoding: 8bit

Qemu recipe adds host pkg-config paths to PKG_CONFIG_PATH using
hardcoded pkg-config tool's location (/usr/bin:/bin). This may cause
qemu build failures on systems that use external native toolchain (from
buildtools tarball): a host package is detected during do_configure via
host PKG_CONFIG_PATH, but then the toolchain can't find the package
because it uses headers from buildtools-tarball only.

For example if xkbcommon is present on host, but not in
buildtools-tarball:
| build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory
|    16 | #include <xkbcommon/xkbcommon.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| make: *** [build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/rules.mak:69: qemu-keymap.o] Error 1

Using hardcoded pkg-config path seems like a hack. It was added to
handle a case when host sdl is provided by host. So limit usage of
host pkg-config only to the case when ASSUME_PROVIDED contains
libsdl2-native.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d41cc8f200b3..bfa69c402c8b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -93,10 +93,12 @@ B = "${WORKDIR}/build"
 EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
 
 do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+	# Append build host pkg-config paths for native target if the host provides sdl
+	if ${@bb.utils.contains('ASSUME_PROVIDED', 'libsdl2-native', 'true', 'false', d)}; then
+		BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
+		if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
+			export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+		fi
 	fi
 }
 
-- 
2.25.1

