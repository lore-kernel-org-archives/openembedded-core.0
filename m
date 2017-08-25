Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24F697849D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:36:39 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 83so1161681pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JKUO/KHfq5pqADL/JWeIP8pOJ6E3Xo5UzCByizcmIFk=;
	b=m1qSy7Qdh9vB1ihGvlkY2ye1Kj2BgZLFqcWCjMmCtYiLkHbqLBsq+YUnm2bTMNLXkD
	Y1DRA43h8csURVD0b4Pma5s+YrftvndqDVkmBNfnJDW7ooI9RPt8hR0s8ct+UgBZtuDn
	JAP3TM06bGVXeJyNWwr4ondYS88sDbc3bvuqzIl4M6OZ+H4jt3ds4iFsjHJvDNXY14MV
	qbWdH99Z+jfc6+KvahfX18c8goQ3lUKfEo5x1hYgWHNfOuI/ZbfYXQiF/Hr8EBYFEJRH
	aFGKfBDCBZKfRNpmSYUTqHrtcq9zkISbAnTBEsfAFs4n5rhZTeUfBv/Ravhj7lG1r4jN
	tuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JKUO/KHfq5pqADL/JWeIP8pOJ6E3Xo5UzCByizcmIFk=;
	b=nMM2qPwFau/LdQdJxOMbVTitkKw7B1YSN5juzfSXydxf3CW7dFPV0hS9wIhMR26LZT
	vbSqpMTBRvlkiO+j0BcaVYyPscaRXxSdIycv3f4T6PfIOKOWoERG921Dv5Nk03ZXN7/9
	SP74nRszgBry57Ju8/EHKB/I3/Bgw2+B5Zt0EdrEGSUMyLfxSVAuK5iyKuNohXarYVjT
	wFMOnPlYf1KgvOATgLb1YaUcc1aPHHsVz+FY0OH8Cpf7WdK5R/7IWh7MGYZdVi930C6Q
	c+vNrcnqAX9BdxB2DOtW8U6YWgpM+ZGqN/s4oyXwFP5bRdf6RrHNMHl+nQeqEOgeySge
	dGVA==
X-Gm-Message-State: AHYfb5jVk6buDppwtmaeDcy8wl98zoDhpwSLFMBNnEw/m87q1EDYK5tX
	OmqNVvOgRzbWnAGo
X-Received: by 10.98.202.135 with SMTP id y7mr125459pfk.262.1503693400555;
	Fri, 25 Aug 2017 13:36:40 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id v3sm1290104pgc.7.2017.08.25.13.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Aug 2017 13:36:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 13:36:30 -0700
Message-Id: <1503693392-7893-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] terminal.py: avoid 100% cpu while waiting for phonehome pid file
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
X-List-Received-Date: Fri, 25 Aug 2017 20:36:40 -0000

Some of the less common terminal types haven't been tested with the
recent phonehome pid file changes and there may be error cases where
the pid file is never created.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/lib/oe/terminal.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3c6220d..714772f 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -221,6 +221,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     # to a file using a "phonehome" wrapper script, then monitor the pid
     # until it exits.
     import tempfile
+    import time
     pidfile = tempfile.NamedTemporaryFile(delete = False).name
     try:
         sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
@@ -232,13 +233,13 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
             raise ExecutionError(sh_cmd, pipe.returncode, output)
 
         while os.stat(pidfile).st_size <= 0:
+            time.sleep(0.01)
             continue
         with open(pidfile, "r") as f:
             pid = int(f.readline())
     finally:
         os.unlink(pidfile)
 
-    import time
     while True:
         try:
             os.kill(pid, 0)
-- 
1.9.1


