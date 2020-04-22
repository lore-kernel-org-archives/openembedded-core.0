Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.2037.1587540521467706047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 00:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03M7SefH019499
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 00:28:40 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 22 Apr 2020 00:28:40 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/2] toolchain-shar-extract.sh: remove legacy .o files
Date: Wed, 22 Apr 2020 15:28:37 +0800
Message-ID: <20200422072838.27867-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

We want to make sure `make scripts prepare` succeed inside SDK. However,
the legacy .o files under scripts/kconfig will introduce build error
on some hosts, thus removing them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/files/toolchain-shar-extract.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 04527f891f..61911e72c9 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -286,6 +286,9 @@ if [ -e "$post_relocate" ]; then
 	$SUDO_EXEC rm -f $post_relocate
 fi
 
+# Remove legacy .o files to avoid kernel build failure
+rm -f $target_sdk_dir/sysroots/*/usr/src/kernel/scripts/kconfig/*.o
+
 echo "SDK has been successfully set up and is ready to be used."
 echo "Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g."
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-- 
2.17.1

