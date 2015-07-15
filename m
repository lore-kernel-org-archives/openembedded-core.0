Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 753777391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 06:25:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6F6Pwwi018735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 23:25:58 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 14 Jul 2015 23:25:57 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jul 2015 14:19:58 +0800
Message-ID: <1436941198-24451-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] rpcbind: handle rpcbind options
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
X-List-Received-Date: Wed, 15 Jul 2015 06:25:59 -0000
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

Don't pass -w to rpcbind on boot up, since the files won't be there
to be read, the patch refers to:
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


