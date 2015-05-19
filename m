Return-Path: <lucas.dutra.nunes@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B51F601E3;
	Tue, 19 May 2015 14:14:52 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so10371402qkg.1;
	Tue, 19 May 2015 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ooHdu4j4q02fyTjVHdZeTG1ViVTO7SApJrsxFI3C9oM=;
	b=lQJX67UUn1izjbYagx5ofYyRjfytOFiCHdjgpNZTg13Go1SPgefXIPms5zm82yRPeh
	NDbbu9Px2fiWD/3z8x1oimBDXpSg1gT+CUSFk6eQaR6cToZYrTdFCXx+C8iXw0WYQ+zT
	TGjpCJO8zLP1WvboXqEgpUowEJFzAu1ckSOis1RCuXLkXldPZz6Zjpy1HqiiWOZzu3S5
	4WV74Ngc+FHO0jxXgDCyoR1isAvSma7kGBowLhvpSAVj8+SUsbvCQPA3uI4WSN0UoKpm
	iq3mVrQm9R1K6agAA0FrplgOtrXaZHwTQgxTO0eZ7w/1dBpfROr9Oxn8rs/1EMWSnDmz
	a4qg==
X-Received: by 10.55.40.218 with SMTP id o87mr36282182qko.82.1432044893612;
	Tue, 19 May 2015 07:14:53 -0700 (PDT)
Received: from ldnunes.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	f196sm9031696qhe.49.2015.05.19.07.14.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 May 2015 07:14:52 -0700 (PDT)
Sender: Lucas Nunes <lucas.dutra.nunes@gmail.com>
From: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
To: bitbake-devel-request@lists.openembedded.org
Date: Tue, 19 May 2015 11:14:28 -0300
Message-Id: <1432044868-9170-1-git-send-email-ldnunes@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: [PATCH] cooker: release lockfile on process exit
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
X-List-Received-Date: Tue, 19 May 2015 14:14:53 -0000

This fixes problems caused by the bitbake process exiting without
releasing the lockfile. This is most apparent while running scripts that
call bitbake several times, like the "cleanup-workdir" script on
oe-core.

Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
---
 lib/bb/cooker.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index ddf5fed..627ad4a 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -40,6 +40,7 @@ import Queue
 import signal
 import prserv.serv
 import pyinotify
+import atexit
 
 logger      = logging.getLogger("BitBake")
 collectlog  = logging.getLogger("BitBake.Collection")
@@ -164,6 +165,9 @@ class BBCooker:
         except:
             pass
 
+        # Register the unlocking of the file at exit:
+        atexit.register(bb.utils.unlockfile, self.lock)
+
         # TOSTOP must not be set or our children will hang when they output
         fd = sys.stdout.fileno()
         if os.isatty(fd):
-- 
2.1.4


