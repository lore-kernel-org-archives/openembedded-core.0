Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 37D6D61B29
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 22:19:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r15so18919001wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ib+8gkc7Ftz00tm5b+X14suG247OitL/ZPOi93k5kbI=;
	b=aD4okOJ8HkJSHrSbmXS0AXNJfIxQ+u5fcQI1y9V88I7yAtzHDnk3E+LgRJY8S5E/GZ
	x18vzxG8BE/sI4+6IJ0mAmk1Pf8bIMy+4JW3E8J2OFPq/4vUdu2vbpSF5CJDQy9qA/rm
	G3K8nUx7htmAFeIXHwm9PwU9hiNdp9XYRklxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ib+8gkc7Ftz00tm5b+X14suG247OitL/ZPOi93k5kbI=;
	b=GfDLmlUNxU6BXWvwr0WRywshpVgnCjVQHEPN5hc2oxfV/Q+iyFBoFcI6hB7QPoDB7Y
	A6ZVmV+LDK51fulii8N1ZUGAuFEZ0oSxtxBFtllhLiyb5t24phcPX2NliWW7KTCQ1l1P
	w3AKaUO5zXCR/XFhf9aLmwFXjfVc7JE1W6fpA3qxJj2CblFQfkRfywQ0DrOegT7Ehsaf
	pYN6fXR/i8Yj21OsKjb09m0RYmXOr3XL+rCpCLNinztpHA5O8c2MI3efcwnYU6PXMNa5
	GCkl57veJD0C43po64N8wVP4AhAoJqeMueKHMxp9NKfcT3CMovfEXiy9ZON7c59THaKI
	0z6A==
X-Gm-Message-State: ANhLgQ3B7z7jr0vIspQ9ynAtrFMb97xOxw0Ecu8tbPOnURZ0o6OZ+1Jk
	w7+IYfXZNMurrwH9BmDL4Js5yKLm9B8=
X-Google-Smtp-Source: ADFU+vuxSLYDJCrtKNdJNYNbe0qAAZMiWYzCA7cbo3SifWBArt+T5wopzI3LmR6u+a6dFBH/LBY62Q==
X-Received: by 2002:a05:6000:189:: with SMTP id
	p9mr31571292wrx.391.1584310784680; 
	Sun, 15 Mar 2020 15:19:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o5sm29145642wmb.8.2020.03.15.15.19.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 15:19:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 22:19:43 +0000
Message-Id: <20200315221943.187279-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] scripts/pybootchartgui: Fix to work with python 3.8
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
X-List-Received-Date: Sun, 15 Mar 2020 22:19:45 -0000
Content-Transfer-Encoding: 8bit

time.clock() was removed in python 3.8, use one of its recommended replacements
to fix failures on python 3.8 systems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index ef2d3d309ca..b42dac6b888 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -18,7 +18,7 @@ import string
 import re
 import sys
 import tarfile
-from time import clock
+import time
 from collections import defaultdict
 from functools import reduce
 
@@ -723,7 +723,7 @@ def get_num_cpus(headers):
 
 def _do_parse(writer, state, filename, file):
     writer.info("parsing '%s'" % filename)
-    t1 = clock()
+    t1 = time.process_time()
     name = os.path.basename(filename)
     if name == "proc_diskstats.log":
         state.disk_stats = _parse_proc_disk_stat_log(file)
@@ -743,7 +743,7 @@ def _do_parse(writer, state, filename, file):
         state.monitor_disk = _parse_monitor_disk_log(file)
     elif not filename.endswith('.log'):
         _parse_bitbake_buildstats(writer, state, filename, file)
-    t2 = clock()
+    t2 = time.process_time()
     writer.info("  %s seconds" % str(t2-t1))
     return state
 
-- 
2.25.0


