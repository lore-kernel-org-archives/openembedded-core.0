Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6776C129
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:13:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4DFDGZP019850
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2019 08:13:31 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 08:13:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 13 May 2019 11:12:46 -0400
Message-ID: <1557760366-132812-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/targetcontrol.py: fix qemuparams not work in runqemu with launch_cmd
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
X-List-Received-Date: Mon, 13 May 2019 15:13:57 -0000
Content-Type: text/plain

As runqemu with launch_cmd means directly run the command, don't need set
rootfs or env vars.

Since commit [a847dd7202 runqemu: Let qemuparams override default settings]
applied in oe-core, if launch_cmd contains "qemuparams='***'", it does not
work, which is overridden by latter qemuparams="-serial tcp:127.0.0.1" in
QemuRunner.launch();

So we set qemuparams as a parameter in runqemu, the fix makes it work

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1868ad3206..b98b183504 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -159,7 +159,7 @@ class QemuTarget(BaseTarget):
 
     def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
         if launch_cmd:
-            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd)
+            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd, qemuparams=params)
         else:
             start = self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams, discard_writes=discard_writes)
 
-- 
2.17.1


