Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEE0B78296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M1NKDZ032733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:20 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:10 -0700
Message-ID: <00ad9ee0ea4e4de1773220dfca8792819701092f.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/9] core/target/ssh.py: replace decode errors
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:19 -0000
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
index b80939c..a2eafcd 100644
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
2.10.2


