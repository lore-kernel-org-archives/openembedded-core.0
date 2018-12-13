Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id B719D799B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 23:42:51 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id a18so4130404wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=C+2f106Q4n+gmHvr5uCFIaru3IAUr+c3yO3njDNa3k0=;
	b=GD/A+ZhouaxdP/J6a0gaCyYW09hRe+deOxA4ax8ZWZXm/3QMETGskcVyNBpNVFb6J5
	k25AHIxTStbc5jo1voIG1CACKAbfbjVitC48qCBKkGzYLF8HOxGRMSN51831iABnVeLx
	vA+TUZv2ygyOmXR4vt9Jv47zUsdRuHdcN5ZvH7cg0We1bk/HxOEhbCYqAvUii/zoC2VY
	3KOmDsviR99RBqnreaUJyn6ae6AkNIoSGxxKYEggPGR2yr3+ad5s59NimE20MhdBPhqg
	yJQ1OWzEDdL+YIBzaH/aI+rj45NEpFeXkt8YVrR7hv5YavLzKFUDBSwiskA7dQMrUWU5
	w+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C+2f106Q4n+gmHvr5uCFIaru3IAUr+c3yO3njDNa3k0=;
	b=AkLw7xwgvQRbDnFhzR6gfh8VIbs22f76gbBIJ8FWeYGjYr/INwr5O2g8miWb/jKiGZ
	/vtcmX4K3RHZgLmUn7x8s47IuI5ES41+vWqe6js52vC7ShMLKKdGx6YU+lPm8sASt8ag
	Uxh6vM29FrOe0a5TGR26qrabnNPi9yjjjV/+ZgUj0LgE5XFq9b+PR2ehxr55nbCx1QuU
	ZubXF80YJjQJE9EkfODFTHYTjfNeQkqdaglwvMs6hqEmvrBoMMbWz4Nu4+Q7T1qnGfbr
	Cy7iwh2VU8OwVXGYGUSfokt/4TtlVDvyP9gzfNfQ3D/8PskslDs8Wkpfo59VsR3aorNj
	UtxA==
X-Gm-Message-State: AA+aEWZTctONQxxFCjK3fgIE6RJ5dxSl0itxIzdlDdj6wi28pdffTga3
	j0bQ3k6FeF8gLO+4HAfOq2R5nbY4nFM=
X-Google-Smtp-Source: AFSGD/Ukz5tib0vCB367hvhu+WirZITWCdeb6tlEuPeN91jA5IlorNekmQEg53JlZWCZTm7OekmJMw==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr1309489wmg.51.1544744572191; 
	Thu, 13 Dec 2018 15:42:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a12sm3138994wro.18.2018.12.13.15.42.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 15:42:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 23:42:49 +0000
Message-Id: <20181213234249.22843-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] tcl: in run-ptest show output if a test fails
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
X-List-Received-Date: Thu, 13 Dec 2018 23:42:53 -0000

If a test fails the log has useful information, so include that in the output.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index dadba655f2a..22bb69ae0db 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,8 +1,13 @@
 #!/bin/sh
 
-for i in `ls tests/*.test |awk -F/ '{print $2}'`; \
-    do TCL_LIBRARY=library ./tcltest tests/all.tcl -file $i >$i.tmp 2>&1; \
-    grep -q "^Files with failing tests:" $i.tmp; \
-    if [ $? -eq 0 ]; then echo "FAIL: $i"; \
-    else echo "PASS: $i"; rm -f $i.tmp; fi; \
+for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
+    TCL_LIBRARY=library ./tcltest tests/all.tcl -file $i >$i.log 2>&1
+    grep -q "^Files with failing tests:" $i.log
+    if [ $? -eq 0 ]; then
+        echo "FAIL: $i"
+        cat $i.log
+    else
+        echo "PASS: $i"
+    fi
+    rm -f $i.log
 done
-- 
2.11.0


