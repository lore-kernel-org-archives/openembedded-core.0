Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 624576EAFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9h5Gj024465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:05 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:42 +0800
Message-ID: <a2ac209bcc377adfdf62d90d7f3b09cec817d1cc.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996041.git.hongxu.jia@windriver.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/6] initscripts: Avoid restarting rpcbind daemon
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:04 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Check whether rpcbind daemon already run before starting it.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index fe6c196..be9f597 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -67,9 +67,12 @@ if test "$rpcbind" = yes
 then
 	if test -x /usr/sbin/rpcbind
 	then
-		echo -n "Starting rpcbind... "
-		start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
-		sleep 2
+		service rpcbind status > /dev/null
+		if [ $? != 0 ]; then
+			echo -n "Starting rpcbind..."
+			start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
+			sleep 2
+		fi
 	fi
 fi
 
-- 
1.8.1.2


