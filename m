Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.1379.1611246138081873702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hwhLzFjxTW972/psUwXnL3cQcbJ6DJfJXOUSeu2pzvm4aps4k6GEYuFkguc4gNdI9S+YQPgZdV
 0ympgG2SEzOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179446340"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="179446340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:20 -0800
IronPort-SDR: 0VKVKO1jc+24v/B2fuFAThljHohOTr+EhyOmK4eH0rPe/ORtYqLVePQyLiQe/r+ugFds1W01XM
 I7MA8vs8kuUA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413605"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/20] toolchain-shar-extract.sh: Handle special characters in script path
Date: Fri, 22 Jan 2021 00:21:48 +0800
Message-Id: <7d17f261347366a8723691a4a2cb77a1d5992d69.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrey Mozzhuhin <amozzhuhin@yandex.ru>

Extracting SDK archive may fail if the script is run using a path with
special characters such as space or asterisk. This is because the shell
interprets such characters after expanding the $0 variable.

Added quotes to all uses of the shell variable $0 to fix this.

Signed-off-by: Andrey Mozzhuhin <amozzhuhin@yandex.ru>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0453acbbd45604537090ec7a3295b34309e6eecb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/toolchain-shar-extract.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index bea6d4189a..dd9342758b 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -95,7 +95,7 @@ while getopts ":yd:npDRSl" OPT; do
 		listcontents=1
 		;;
 	*)
-		echo "Usage: $(basename $0) [-y] [-d <dir>]"
+		echo "Usage: $(basename "$0") [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
 		echo "======== Extensible SDK only options ============"
@@ -111,17 +111,17 @@ while getopts ":yd:npDRSl" OPT; do
 	esac
 done
 
-payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
+payload_offset=$(($(grep -na -m1 "^MARKER:$" "$0"|cut -d':' -f1) + 1))
 if [ "$listcontents" = "1" ] ; then
     if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
-        tail -n +$payload_offset $0 > sdk.zip
+        tail -n +$payload_offset "$0" > sdk.zip
         if unzip -l sdk.zip;then
             rm sdk.zip
         else
             rm sdk.zip && exit 1
         fi
     else
-        tail -n +$payload_offset $0| tar tvJ || exit 1
+        tail -n +$payload_offset "$0"| tar tvJ || exit 1
     fi
     exit
 fi
@@ -242,14 +242,14 @@ fi
 
 printf "Extracting SDK..."
 if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
-    tail -n +$payload_offset $0 > sdk.zip
+    tail -n +$payload_offset "$0" > sdk.zip
     if $SUDO_EXEC unzip $EXTRA_TAR_OPTIONS sdk.zip -d $target_sdk_dir;then
         rm sdk.zip
     else
         rm sdk.zip && exit 1
     fi
 else
-    tail -n +$payload_offset $0| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
+    tail -n +$payload_offset "$0"| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
 echo "done"
 
-- 
2.29.2

