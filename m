Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1145760112
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 21:56:26 +0000 (UTC)
Received: by lbblt2 with SMTP id lt2so79071240lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 13:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YvM8/47ffrsESjE4NBdZaCXCz0FmWEBpNdBnBn4STF4=;
	b=T7I8wx62jNE/gV6W3mi9BiKrSr7nFjRblVOKG4Dkzt/xNgQwNLY/X8K92AwlB9BzgB
	ccvwBMcFuew5YfF6RDWODpvrPGSYYD/6Hm7XFI73Nh/R48KtkWZMxm2EmEbp47PNN7ij
	ggQC0Tm4OCnFm3P0J5qnHm7fEtlFxMa5md2IJfeKE6jaCfUi5T5mBGKwu2e0zNUjzAP/
	Z5UiTm1Q3Vh8AxCa9qXnb6F8T2oSJBspizsJgDGc0kuNi4D7Dz9bVvkVb49MnE//z8ym
	Hd3ttgpyDDs3BjlpL7ewMvBdjkd8vPNy3IVvhN300WDx8INSi/iuR4xXkQgKHj4ReWA9
	SkEg==
X-Received: by 10.112.170.7 with SMTP id ai7mr3435908lbc.102.1448142986368;
	Sat, 21 Nov 2015 13:56:26 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231])
	by smtp.gmail.com with ESMTPSA id v1sm810902lfd.25.2015.11.21.13.56.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Nov 2015 13:56:25 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Nov 2015 22:55:50 +0100
Message-Id: <1448142950-5321-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] initscripts: do not save timestamp for readonly system
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
X-List-Received-Date: Sat, 21 Nov 2015 21:56:27 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To avoid reporting errors for /etc/timestamp is not writeable in a
readonly system.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index b038fc5..0f7aa20 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -9,5 +9,7 @@
 # Description:       
 ### END INIT INFO
 
-# Update the timestamp
-date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
+# Update the timestamp for non-readonly system
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+[ "$ROOTFS_READ_ONLY" = "no" ] && date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
-- 
1.9.1


