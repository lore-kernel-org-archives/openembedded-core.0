Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id CFB317FBEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:02:01 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id F37A7ABF6E;
	Mon, 20 Jan 2020 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1579525261; bh=Q6lrUSbNa87LFigiw5n/pmcYmI1h23+YqBW0+BHysCM=;
	h=From:To:Cc:Subject:Date;
	b=JisvUsrJiwYGTfiQYcGHCfvWz8AMo2nxDmV7d15VcuZA/h6RoAQXKpyverOdh+te9
	Zg88eZjhzsgZR8xPQKqhGnJxjxwfTAN9mPscDR/OqEF07PsKNyX8xsNFgC1FhG5L8n
	pX92+fZ4iLokWk41/CVLWU3sk87+EkaEkZMU6UdknI9UcAoKmsh3DlyInc9Nbq539I
	jhuxVOO4nMh9Jr4aJREFTo7lZ+Pgs+f50WMFVlmDggIVsOgA9qsDPF6NJXT8v5UZf3
	s31mBFAz1YJyh8pf4rHGNy9zOR7qMeSTMjrvhR2712VxhQzFBAL0bzZCXVyASgABtJ
	kJCAMtdBqN35A==
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 14:01:51 +0100
Message-Id: <20200120130151.92546-1-martin@geanix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=4.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
	version=3.4.3
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on ea2d15de10a4
Subject: [PATCH] package: disable libseccomp for find
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
X-List-Received-Date: Mon, 20 Jan 2020 13:02:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Distros where libseccomp is enabled for the find util segfaults in
do_package:

ERROR: base-files-3.0.14-r89 do_package: Fatal errors occurred in subprocesses:
Command '['file', '-b', 'build/tmp-glibc/work/iwg26-oe-linux-gnueabi/base-files/3.0.14-r89/package/etc/skel/.bashrc']' died with <Signals.SIGSYS: 31>.: Traceback (most recent call last):
  File "poky/meta/lib/oe/utils.py", line 272, in run
    ret = self._target(*self._args, **self._kwargs)
  File "poky/meta/lib/oe/package.py", line 70, in is_elf
    result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
  File "/usr/lib/python3.8/subprocess.py", line 411, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
  File "/usr/lib/python3.8/subprocess.py", line 512, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['file', '-b', 'build/tmp-glibc/work/iwg26-oe-linux-gnueabi/base-files/3.0.14-r89/package/etc/skel/.bashrc']' died with <Signals.SIGSYS: 31>.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b8585d4253..0c22307c46 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -71,7 +71,7 @@ def is_kernel_module_signed(path):
 # 16 - kernel module
 def is_elf(path):
     exec_type = 0
-    result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
+    result = subprocess.check_output(["file", "-S", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
 
     if "ELF" in result:
         exec_type |= 1
-- 
2.25.0


