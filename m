Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.6402.1631603482577637738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 00:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E7BL9c027187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 00:11:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 00:11:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 00:11:20 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] python3: fix multilib qa issue
Date: Tue, 14 Sep 2021 15:06:52 +0800
Message-ID: <20210914070652.10294-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914070652.10294-1-mingli.yu@windriver.com>
References: <20210914070652.10294-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Enable tk in PACKAGECONFIG as below in conf/local.conf.
PACKAGECONFIG_append_pn-python3 = " tk"
 $ bitbake lib32-python3
   ERROR: lib32-python3-3.9.6-r0 do_package_qa: QA Issue: /usr/lib/python3.9/lib-dynload/_tkinter.cpython-39-i386-linux-gnu.so contained in package lib32-python3-tkinter requires libtk8.6.so, but no providers found in RDEPENDS_lib32-python3-tkinter? [file-rdeps]
   ERROR: lib32-python3-3.9.6-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

So add MLPREFIX prefix to fix the above issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3_3.9.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
index 34500642d4..f04bfc3053 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -374,8 +374,8 @@ RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
 RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr.iso-8859-9"
-RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter tcl', '', d)}"
+RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
+RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
 RDEPENDS:${PN}-dev = ""
 RDEPENDS:${PN}-pydoc += "${PN}-io"
 
-- 
2.32.0

