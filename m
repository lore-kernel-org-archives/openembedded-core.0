Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4807E7D19A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 22:49:08 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w1so4451860wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DHOiLZbH4df3r9sen3VX5o1N8uNoZoWuJ+ruIl74BZ4=;
	b=XXdD++OhbnXF3GdK8rmoDxQzozgYB0p8dHcBxxPw5vai/988xYfeoNDw2Azh1qHFzV
	O1x8GeHalCXipWH0JgFwEA4ljTnzlcOyvClj8uQgFpraeFPSX0ewmX0qjRrjLik5AECQ
	j9K5Z2V3TBBQsVlL2PFZRmEW14Xs/Q7Ka/jn0QuxEeJ/ZCIchFDFZq3n1BI1ht9flrRL
	akf9tRN3bor2oMOxd6iKHcuMyfO0ELafHVIbtIANQvujEDN7scKx7hufPc2q/6l1+as/
	rY0+HzQYA6O6dsH8kiVsG13wFB3SXbXdKNKsC00ERS1f9xiR/L9uSD2gxHGmrygPChoj
	i84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DHOiLZbH4df3r9sen3VX5o1N8uNoZoWuJ+ruIl74BZ4=;
	b=qq93waqP6wCuw9UCoCOKEks9c4sNceP+ZR1s4bRVN613HHIm90JI8arW9L2ynv2pmy
	NM+7DLraUWRWlzIQbPebGHmCq1JrGWdT6wdnD5Hiy9fMWkQEhTo10RQ7r+g0HR6bUGOE
	CtvYGt69qOgf5MGwC0LDcudgE51Ksqu/UYrC+A9zXXAUSTatPx86pAdoL2N48i46YdTU
	kYFg9NSF+2Of62qkV9/yEeMSZgKfrjWE3PbkxNrptp8V9jo7rg4xahHDUBgq8Asu/nBC
	gbTeyIWGl4CyDBSC4goNcAT9uO+Bq3Er8GZpWNKVXViUpcgvkixVEowPC9bWFP7NAbuN
	fCGQ==
X-Gm-Message-State: APjAAAXIjBsMuozlzOG2zFAR0AXSO5ZuQEpsJRiG5GfXlMzPFlZr6c2l
	FvFTh4fP2FrLX6wfVKOKWft6FNCQUnw=
X-Google-Smtp-Source: APXvYqx46Cc8Z2XO1zkpNWV5cY8ehOPhgETQDGCNNFfg25aw5m3PiMssYvmThcjADhocUnnqk+4FOQ==
X-Received: by 2002:a5d:6a12:: with SMTP id m18mr14830480wru.325.1553899748883;
	Fri, 29 Mar 2019 15:49:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id g8sm6484881wro.77.2019.03.29.15.49.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 15:49:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2019 22:49:04 +0000
Message-Id: <20190329224904.27359-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: improve ptest
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
X-List-Received-Date: Fri, 29 Mar 2019 22:49:09 -0000

Add missing runtime dependencies: the test suite needs proper chmod from
coreutils, and the Europe/Minsk timezone.

Also change run-ptest to use -W (run verbosely on failure) instead of -v (always
verbose) to hopefully reduce the noise in the ptest reports.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python/run-ptest  | 2 +-
 meta/recipes-devtools/python/python3/run-ptest | 2 +-
 meta/recipes-devtools/python/python3_3.7.2.bb  | 2 +-
 meta/recipes-devtools/python/python_2.7.15.bb  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python/run-ptest b/meta/recipes-devtools/python/python/run-ptest
index 832551a1244..13dfc99efd5 100644
--- a/meta/recipes-devtools/python/python/run-ptest
+++ b/meta/recipes-devtools/python/python/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python -m test.regrtest -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+python -mtest -W | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index 3863c6d314f..20c9274dfa7 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 -m test -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+python3 -m test -W | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 4d10986f3b7..5c64bc8aa2a 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -284,7 +284,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 3e1af4baf63..c459af06f10 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -176,7 +176,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 RDEPENDS_${PN}-modules += "${PN}-misc"
 
 # ptest
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 # catch manpage
 PACKAGES += "${PN}-man"
-- 
2.11.0


