Return-Path: <Zhangle.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F303F6B49F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 14:00:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rARE0N7O000608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 06:00:23 -0800 (PST)
Received: from PEK-DSM-SYRINX.wrs.com (128.224.157.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 27 Nov 2013 06:00:23 -0800
From: <zhangle.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 22:00:21 +0800
Message-ID: <1385560821-10168-1-git-send-email-zhangle.yang@windriver.com>
X-Mailer: git-send-email 1.8.2.1
MIME-Version: 1.0
Subject: [PATCH] rpcbind: Fix rpcbind restart failure when rpcbind is not running
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
X-List-Received-Date: Wed, 27 Nov 2013 14:00:24 -0000
Content-Type: text/plain

From: Zhangle Yang <zhangle.yang@windriver.com>

"rpcbind restart" executes stop and then start function. However, if
rpcbind is not started, "exit 0" shall be run in stop function, so start
function will not be run at all. This patch changes "exit 0" to "return 0".

Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind/init.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/init.d b/meta/recipes-extended/rpcbind/rpcbind/init.d
index 5c756bb..d418673 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/init.d
+++ b/meta/recipes-extended/rpcbind/rpcbind/init.d
@@ -47,7 +47,7 @@ stop ()
     echo "Stopping rpcbind daemon..."
     if ! pidof /sbin/rpcbind >/dev/null; then
         echo "not running."
-        exit 0
+        return 0
     fi
     start-stop-daemon --stop --quiet --exec /sbin/rpcbind
     if [ $? -eq 0 ]; then
-- 
1.8.1.2


