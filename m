Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web10.10780.1611061388367833027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 05:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=GHA47Nj2;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1000; q=dns/txt; s=iport;
  t=1611061388; x=1612270988;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SmVLaMvp75FLA3xmZfAYq2bNe2X/xXek7dVsOZRZgS0=;
  b=GHA47Nj2MdnXoF4C0zwUI6yDVrOQc0KieX1OuN4X1OwZ+bctwPSY5uXy
   DopoidOYpYg4dnXUutBZNvPZZaCyN3LibMAXFifDChZ7fkSJE90D0d5mp
   AeNXYrXl26fzz0ftBQw0pDFAKw7VV1XQneCVuNOvBaA7PZCZCk0pidEhb
   M=;
X-IronPort-AV: E=Sophos;i="5.79,358,1602547200"; 
   d="scan'208";a="630755528"
Received: from alln-core-3.cisco.com ([173.36.13.136])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 19 Jan 2021 13:03:06 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 10JD32mx021263
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 19 Jan 2021 13:03:04 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 96BF0CC1251; Tue, 19 Jan 2021 05:03:01 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] toolchain-shar-relocate.sh: Fix handling files with colons
Date: Tue, 19 Jan 2021 05:02:59 -0800
Message-Id: <20210119130300.101286-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-3.cisco.com
Content-Transfer-Encoding: 8bit

Files could contain colons in name and we should not use
colons (':') as field separator. E.g. perl/python man
pages packages.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c10018ef..80b27b931e 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -55,7 +55,7 @@ fi
 for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
 done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
-    awk -F':' '{printf "\"%s\"\n", $1}' | \
+    awk -F': ' '{printf "\"%s\"\n", $1}' | \
     grep -Ev "$target_sdk_dir/(environment-setup-*|relocate_sdk*|${0##*/})" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
-- 
2.26.2.Cisco

