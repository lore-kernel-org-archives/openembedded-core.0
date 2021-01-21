Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zGFVgtGHsXE2S/tDWxuhADaJJHapH3Y/2MN8UTE6M9LIryndj4fhJClTvAhIKkMRsDl0QlC7KV
 AgTM/+UcgDTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392510"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:40 -0800
IronPort-SDR: 0w6PMjFEvQBNGDkN6tGc1bdW/DGpTTW0HX91ADmnzotTWysF4hWpbm2tmhg22Aubpa33AdpubQ
 ewwdFWGBeL0g==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413902"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/20] toolchain-shar-relocate.sh: Fix handling files with colons
Date: Fri, 22 Jan 2021 00:22:03 +0800
Message-Id: <5ea3c65c6b224a9e20cc4f41b044e598771de8a2.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Oleksiy Obitotskyy yIEf0zt.mo" <oobitots@cisco.com>

Files could contain colons in name and we should not use
colons (':') as field separator. E.g. perl/python man
pages packages.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50d2ed0689f1aed6f33b4992d37e2e991c99eb07)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 94d288ce05..5433741296 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -55,7 +55,7 @@ fi
 for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
 done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
-    awk -F':' '{printf "\"%s\"\n", $1}' | \
+    awk -F': ' '{printf "\"%s\"\n", $1}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
              -e "$target_sdk_dir/post-relocate-setup" \
-- 
2.29.2

