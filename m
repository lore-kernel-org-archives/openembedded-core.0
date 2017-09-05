Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD57877E9C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 02:16:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v852GZSb004437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Sep 2017 19:16:35 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Sep 2017 19:16:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 21:10:32 -0500
Message-ID: <1504577432-63141-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] psplash: Initialize psplash only if a framebuffer exists
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
X-List-Received-Date: Tue, 05 Sep 2017 02:16:33 -0000
Content-Type: text/plain

psplash-init exits if there is no framebuffer device detected.
This is done to avoid the following error message from
occurring when booting up:

"Error opening /dev/fb0: No such file or directory"

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/psplash/files/psplash-init | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index 66c85e9..0bce1de 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -7,6 +7,12 @@
 # Default-Stop:
 ### END INIT INFO
 
+if [ ! -e /dev/fb0 ]; then
+    echo "Framebuffer /dev/fb0 not detected"
+    echo "Boot splashscreen disabled"
+    exit 0;
+fi
+
 read CMDLINE < /proc/cmdline
 for x in $CMDLINE; do
         case $x in
-- 
1.8.3.1


