Return-Path: <george.nita@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C756560107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 10:35:55 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Nov 2015 11:35:53 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4089)	id A4CB628FA82;
	Thu, 19 Nov 2015 11:35:53 +0100 (CET)
From: George Nita <george.nita@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Nov 2015 11:35:47 +0100
Message-ID: <1447929347-20043-1-git-send-email-george.nita@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: george.nita@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy][PATCH] toolchain-shar-template.sh: Ensure it's ran in clean environment
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
X-List-Received-Date: Thu, 19 Nov 2015 10:36:00 -0000
Content-Type: text/plain

Fixes [YOCTO #8698] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=8698

If prior to running the toolchain installation script a toolchain
environment script is sourced then the toolchain installation will
fail. This because the environment is now set for the sourced toolchain
and doesn't suit the installation. In particular PATH points to the
toolchain executables.

The fix makes the script recursively call itself a second time with a
clean environment.

Tested by sourcing a previous successfully installed environment, erasing the
previous installation directory and then reinstalling in the same directory.

Signed-off-by: George Nita <george.nita@enea.com>
---
 meta/files/toolchain-shar-template.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index 4a7fbd5..b8c5685 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
 
+[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i  ENVCLEANED=1 "$0" "$@"
+
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
-- 
1.9.1


