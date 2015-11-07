Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA13F770B4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 06:43:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA76hNNL006298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Nov 2015 22:43:23 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 6 Nov 2015 22:43:22 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 7 Nov 2015 01:43:19 -0500
Message-ID: <89c0590779e8e6436ec26ba671fa8ca5409d8ffa.1446878344.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446878344.git.wenzong.fan@windriver.com>
References: <cover.1446878344.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v4] rpcbind: don't use '-w' for starting rpcbind
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
X-List-Received-Date: Sat, 07 Nov 2015 06:43:24 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

While runing:

$ systemctl restart rpcbind
$ systemctl status rpcbind

There are errors like below:
  rpcbind[1722]: Cannot open '/tmp/rpcbind.xdr' file for reading, \
    errno 2 (No such file or directory)
  rpcbind[1722]: Cannot open '/tmp/portmap.xdr' file for reading, \
    errno 2 (No such file or directory)

'-w' causes rpcbind to do a "warm start" by read a state file when
rpcbind starts up. The state file is created when rpcbind terminates.

The state file is not always there, the patch refers to:
  https://bugs.launchpad.net/ubuntu/+source/rpcbind/+bug/835833

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
index b3ae254..9cdade4 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -5,7 +5,7 @@ Requires=rpcbind.socket
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
-ExecStart=@SBINDIR@/rpcbind -w $RPCBIND_OPTS
+ExecStart=@SBINDIR@/rpcbind $RPCBIND_OPTS
 SuccessExitStatus=2
 
 [Install]
-- 
1.9.1


