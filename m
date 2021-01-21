Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QPcoIvE881VmUjh/tN+Uz+ZH/Qm3R1CW0H9UyO2VCXUsydoV3lQwoeNZ3knlxjqAIaFU+iWhKj
 eOYAQCsnc+tQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392436"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392436"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:27 -0800
IronPort-SDR: cg/cr1ZunSIrydyFZQIhiTz7q7K46kWYhmgAEl522bN1sIiJw++iZQk5i60dax5TnbXzRde4IE
 FzV+lCnO/f6w==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413655"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/20] meta: toolchain-shar-relocate.sh: Filter out post-relocate-setup script
Date: Fri, 22 Jan 2021 00:21:53 +0800
Message-Id: <9504a975c74fc00f3c27b9dbc18316143215b6a3.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

The toolchain-shar-extract.sh script updates the SDK relocation paths in
post-relocate-setup.sh, so avoid doing this twice. This is generally not
a problem, unless the SDK path is a subset of the SDK relocation path, in
which case the resulting path is substituted twice. To trigger the issue,
  $ ./tmp/deploy/sdk/poky-glibc-x86_64-core-image-base-core2-64-qemux86-64-toolchain-3.2+snapshot.sh -y -d /home/oe/.local/opt/poky/3.2+snapshot
which generates relocation path
  /home/oe/.local/home/oe/.local/opt/poky/3.2+snapshot
instead of
  /home/oe/.local/opt/poky/3.2+snapshot

Fixes: 93ec145f42 ("toolchain-shar-extract: Add post-relocate scripts")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5000aabe6ac336e7b424dafa1bf76271dee6a6f1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 9c358a53e2..94d288ce05 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -58,6 +58,7 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
+             -e "$target_sdk_dir/post-relocate-setup" \
              -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
-- 
2.29.2

