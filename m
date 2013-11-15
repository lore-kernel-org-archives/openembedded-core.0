Return-Path: <Yue.Tao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 921206D9FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 06:33:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAF6XtfM018207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 22:33:55 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 14 Nov 2013 22:33:55 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 14:34:45 +0800
Message-ID: <1384497286-19011-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Subject: [PATCH 1/2] Avoid starting rpcbind daemon twice during boot
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
X-List-Received-Date: Fri, 15 Nov 2013 06:33:56 -0000
Content-Type: text/plain

Check whether rpcbind daemon already run before starting it.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../initscripts/initscripts-1.0/mountnfs.sh        |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index 4fffe4e..a03070d 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -69,9 +69,12 @@ if test "$rpcbind" = yes
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
1.7.5.4


