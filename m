Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEC9A741CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 05:31:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D5VJfI022221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jul 2015 22:31:19 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 12 Jul 2015 22:31:19 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 13:25:28 +0800
Message-ID: <1436765128-16695-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] rpcbind: handle rpcbind options
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
X-List-Received-Date: Mon, 13 Jul 2015 05:31:21 -0000
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
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
index b3ae254..24836d4 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -4,8 +4,8 @@ Requires=rpcbind.socket
 
 [Service]
 Type=forking
-EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
-ExecStart=@SBINDIR@/rpcbind -w $RPCBIND_OPTS
+EnvironmentFile=@SYSCONFDIR@/rpcbind.conf
+ExecStart=@SBINDIR@/rpcbind $RPCBIND_OPTS
 SuccessExitStatus=2
 
 [Install]
-- 
1.9.1


