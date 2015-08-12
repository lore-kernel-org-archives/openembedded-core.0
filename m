Return-Path: <ajay.gju@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 07CE37670C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:05:48 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so4288254pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XIgeWhEGJFQQv/bDecnMr8zvI3pqvMSm/COl/I54ABM=;
	b=X/adAaFPTfHRT1wKGNFtz3WIfcyu6y9l8pWcnd2MAq4pH17Y6ps97K5nYVKrgUqA3v
	bGwWHuD1oXdv75EqJ9tqJKU4pqoK9G6IIX2J7MG77Fxt2iQZFgkaYyf8/1XwadluxR2y
	8iC/H4EHH2CQe17PQpJRHHmTlps18TLjR4m7zVxwmFqDtvLjZbDgIFm7cUQSzuwUgV4c
	P4wHNBPsSDg3nCIzybXWj0BhFiDbrt0+g3vRn8j6COa+fVQvchaFVshl1WUESXCkH2PA
	CeJDYjnSUTIyncLjLFjOdxrDUH984LuyPWaSDJ8bZ4cZ2ChaVCYuMTJGhGtMe7McAki5
	oWXg==
X-Received: by 10.70.37.169 with SMTP id z9mr64450445pdj.123.1439363149115;
	Wed, 12 Aug 2015 00:05:49 -0700 (PDT)
Received: from cardinal.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id y2sm5153272pdp.0.2015.08.12.00.05.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Aug 2015 00:05:48 -0700 (PDT)
From: Ajay M <ajay.gju@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 12:35:37 +0530
Message-Id: <1439363137-17385-1-git-send-email-ajay.gju@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bash: append srcdir to run-ptest script
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
X-List-Received-Date: Wed, 12 Aug 2015 07:05:55 -0000

If srcdir is not set, we get below error while running ptest for bash
on qemu target,

-- snip --
root@qemux86:/usr/lib/bash/ptest# ./run-ptest
/bin/sh: line 0: cd: /home/ajay/Downloads/poky-fido-13.0.0/build/tmp/work/i586-poky-linux/bash/4.3-r1/bash-4.3/tests: No such file or directory
Makefile:879: recipe for target 'runtest' failed
make: *** [runtest] Error 1
root@qemux86:/usr/lib/bash/ptest# vi run-ptest
root@qemux86:/usr/lib/bash/ptest#
-- CUT --

So, set srcdir to current directory, where tests binaries exist.

[YOCTO #8145]

Signed-off-by: Ajay M <ajay.gju@gmail.com>
---
 meta/recipes-extended/bash/bash/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index 8dd3b99..e3f8133 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
+make -k THIS_SH=/bin/bash BUILD_DIR=. srcdir=.  runtest
-- 
1.9.1


