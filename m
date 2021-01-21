Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.1442.1611246147646174349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tbF//T1WGschyg9suHswQ8EzPDy91RIIqURCb5vW+xmkz67y2NMcwkPQ0kMIDKJf1KqLoIiyw1
 n1Vlkt4NK6vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166966239"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166966239"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:25 -0800
IronPort-SDR: tZ8R4HJP8Pyn1uVY20gNkIsYJfXKAMEDwpKJApw916fVcMnbu4eStXDvT0k7us7INptHpf/9Bg
 veDJwHSATVZw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413646"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/20] meta: toolchain-shar-relocate.sh: Do not use $target_sdk_dir as regex
Date: Fri, 22 Jan 2021 00:21:52 +0800
Message-Id: <b97f2901c66d6343c49d5bf90d538aa22aeae79d.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

The $target_sdk_dir path might contain special characters, for example if
the path is /opt/poky/3.2+snapshot . Prevent grep from interpreting those
as part of the regex by using the -F parameter and multiple -e parameters
to specify which strings to filter out. Also note that the previous regex
was using asterisk as wildcard (e.g. environment-setup-*), but that should
have been regex (e.g. environment-setup-.*, with dot) to match correctly,
this is also fixed by this change.

Fixes: 9721378688 ("toolchain-shar-template.sh: Make relocation optional.")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19d9fa7ab6c851000bc5d24281739e1b2bb8f057)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c10018ef..9c358a53e2 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -56,7 +56,9 @@ for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
 done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
-    grep -Ev "$target_sdk_dir/(environment-setup-*|relocate_sdk*|${0##*/})" | \
+    grep -Fv -e "$target_sdk_dir/environment-setup-" \
+             -e "$target_sdk_dir/relocate_sdk" \
+             -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
-- 
2.29.2

