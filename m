Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E20EA60EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:07:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB97AuW020599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 01:07:10 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 11 Dec 2013 01:07:09 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2013 04:07:06 -0500
Message-ID: <6e1ed6ec99f4074ec6422f6de09429008bf01e22.1386752117.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386752117.git.wenzong.fan@windriver.com>
References: <cover.1386752117.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpcbind: fix init status and exit code
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
X-List-Received-Date: Wed, 11 Dec 2013 09:07:10 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Print status messages and exit with proper code. This also allows debian
service script to get rpcbind status correctly.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind/init.d |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/init.d b/meta/recipes-extended/rpcbind/rpcbind/init.d
index d418673..67499aa 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/init.d
+++ b/meta/recipes-extended/rpcbind/rpcbind/init.d
@@ -16,6 +16,9 @@
 #                    RPC include NFS and NIS.
 ### END INIT INFO
 
+# Source function library.
+. /etc/init.d/functions
+
 test -f /sbin/rpcbind || exit 0
 
 OPTIONS=""
@@ -73,8 +76,7 @@ case "$1" in
         start $OPTIONS
         ;;
     status)
-        pidof /sbin/rpcbind >/dev/null
-        exit $?
+        status /sbin/rpcbind
         ;;
     *)
         echo "Usage: /etc/init.d/rpcbind {start|stop|force-reload|restart|status}"
@@ -82,4 +84,4 @@ case "$1" in
         ;;
 esac
 
-exit 0
+exit $?
-- 
1.7.9.5


