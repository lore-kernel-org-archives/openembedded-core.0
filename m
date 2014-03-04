Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A99CF6F4F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 03:38:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s243cQXA018283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 19:38:26 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 19:38:25 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Mar 2014 11:39:00 +0800
Message-ID: <1393904340-21216-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: run rpc.statd as rpcuser:rpcuser instead of rpcuser:root
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
X-List-Received-Date: Tue, 04 Mar 2014 03:38:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

For security policy, change the group of running rpc.stdtd to rpcuser,
just like Radhat does.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../nfs-utils/nfs-utils/nfscommon                  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index c949b96..65fdd1d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -36,7 +36,7 @@ create_directories(){
 		umask 077
 		mkdir -p rpc_pipefs
 		mkdir -p sm sm.bak statd
-		chown rpcuser sm sm.bak statd
+		chown rpcuser:rpcuser sm sm.bak statd
 		test -w statd/state || {
 			rm -f statd/state
 			:>statd/state
@@ -50,7 +50,7 @@ create_directories(){
 			}
 		done
 	)
-	chown rpcuser "$NFS_STATEDIR"
+	chown rpcuser:rpcuser "$NFS_STATEDIR"
 	echo done
 }
 
-- 
1.7.9.5


