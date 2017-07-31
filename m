Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39FDB78470
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:50:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6V9oH1T029856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:50:17 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 02:50:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 02:50:07 -0700
Message-ID: <6cc1c8015b1547ad900b6ebd6fc470f43ca7d94d.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] core/target/ssh.py: replace decode errors
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
X-List-Received-Date: Mon, 31 Jul 2017 09:50:16 -0000
Content-Type: text/plain

There might be wild strings when read from target (especially when
reading ptest results), replace the errors to avoid breaking the test.

Fixed: (Not always happen)
$ bitbake core-image-sato -ctestimage
[snip]
    status, output = self.target.run('ptest-runner', 0)
  File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 84, in run
    status, output = self._run(sshCmd, processTimeout, True)
  File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 55, in _run
    status, output = SSHCall(command, self.logger, timeout)
  File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 258, in SSHCall
    run()
  File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py", line 236, in run
    output = process.communicate()[0].decode("utf-8")
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xc3 in position 4906: invalid continuation byte

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/core/target/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index b80939c0e51..a2eafcd6f2a 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -211,7 +211,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             process.stdout.close()
                             eof = True
                         else:
-                            data = data.decode("utf-8")
+                            data = data.decode("utf-8", errors='replace')
                             output += data
                             logger.debug('Partial data from SSH call: %s' % data)
                             endtime = time.time() + timeout
@@ -233,7 +233,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 output += lastline
 
         else:
-            output = process.communicate()[0].decode("utf-8")
+            output = process.communicate()[0].decode("utf-8", errors='replace')
             logger.debug('Data from SSH call: %s' % output.rstrip())
 
     options = {
-- 
2.11.0


