Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.1379.1611246138081873702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pD0rfaoFo/uT7cHaEHU2qVMHyE/Txuu8wV301PF08voLxUG8HLDymbDvyAUsvFd+3vjaB3IpDY
 FI+Fs7wXrT/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179446330"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="179446330"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:18 -0800
IronPort-SDR: 9lxqHhmC7QNzZfzxJw14AuEVb+Hu97h5rysJA6H2xJ/6saZhgkGiy90t/Ap1+XTs6KuVa3UJSB
 zcBwqOKgVdcw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413596"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/20] scripts: oe-run-native, fix *-native directories
Date: Fri, 22 Jan 2021 00:21:47 +0800
Message-Id: <ebc71592b57eba514588693d76057d90f92d6f62.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Herrera <adrian.herrera@arm.com>

This fixes a crash with "find" when running a native tool and *-native
directories do not exist under the binary directory in the sysroot.
This happened because the directory wildcard was passed as part of the
root directory.
The directory wildcard is now passed by "-name", which returns an empty
result if no matching directory.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: Iba7acd8bbd7e0beb4d25c984f6af7a4fd21486e6
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6c90ed0ad24b7d4f892e22e088b1578824eb1d3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 4e63e69cc4..22958d97e7 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -43,7 +43,7 @@ fi
 OLD_PATH=$PATH
 
 # look for a tool only in native sysroot
-PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p")
+PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE_SYSROOT/usr/bin -maxdepth 1 -name "*-native" -type d -printf ":%p")
 tool_find=`/usr/bin/which $tool 2>/dev/null`
 
 if [ -n "$tool_find" ] ; then
-- 
2.29.2

