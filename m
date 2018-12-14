Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id C4EAB6D2AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:10:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r10so6127661wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=C+2f106Q4n+gmHvr5uCFIaru3IAUr+c3yO3njDNa3k0=;
	b=QrmkN9YvZTUfzzdTwaAifDdij1OarC4zxNmF1pBKySX5MdQiG4vI1hZYQh4Cib8/OX
	bFTUkMHc0//wPCY9uwYjnUzmOsSNGI1HFeHC7Txiu5C8hulmt5GWCx5ENZ6IopE1s1CZ
	ekdsZBEeccN4SDXT8Vogyv2Lodom4daIvSQt13lx/jv1MvJKBkt0SZARRFY/P+iFmiXJ
	TJce8XauSPIxla0gHhmijdNKYi55jVuu2SeSG1w7+1i1iRnwFyitpkE6l5yhS+9EjS17
	LN2vCG/1Tx66dI/ThuRDT3rwqcFpl3/EcQ/4zwO/o/bl+/SHKI3VDLwbyKmZ6qY3bqHQ
	jtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C+2f106Q4n+gmHvr5uCFIaru3IAUr+c3yO3njDNa3k0=;
	b=kmZ/n50gmVfKgoFTl1R6MEXfI4RWPyoRxiL72wL/nIG6aujcya7SIYxf7XE0kkf3QM
	l7z3+5loVTb+xVo5eS9cq/dvyz4Ow1T7dhQRHhP789hpFBfZERtRan+r2QMJ1aiosuB4
	zWPKAf/JRvFoadGg++UcAKrrz/K/nkTh/CMFZAH1EtdHkaRSlLjBpwMrxQwfUdvO6JTZ
	SvI9D1Iyn4yw/QnrV01clYb8RFPTei3yK0a3EUOg7JgERPk7mlly56P15FHCryo7B8ab
	dw4XHjHLByD1/7A5pZ7+INNQCb0cWug0z1Yx3No7aUM0jLc/ohuGZhrGrTbyCiTZHwrH
	WgFA==
X-Gm-Message-State: AA+aEWaZNjciM3Y/Hr8ADEtIZvbcvk4mEHWN0eTg1a+1iWOfHAOLSVlt
	t7WDT0df4CeGtirN3hA2g7tFQlnNcak=
X-Google-Smtp-Source: AFSGD/VwJH3AR9SEMCblN61BtwsMZgMRLJXPy9UixcZPs7MiqqTQNEB5KN1yJ74yo7rc1ufrAcjTJw==
X-Received: by 2002:adf:be8b:: with SMTP id i11mr3423913wrh.235.1544807445235; 
	Fri, 14 Dec 2018 09:10:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m4sm3560843wmc.3.2018.12.14.09.10.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:10:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:10:42 +0000
Message-Id: <20181214171042.1965-1-ross.burton@intel.com>
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
X-List-Received-Date: Fri, 14 Dec 2018 17:10:45 -0000

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


