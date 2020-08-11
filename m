Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.10198.1597130900026048182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 00:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07B7RuvI016188
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 00:28:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 11 Aug 2020 00:27:33 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: set the default pigz thread
Date: Tue, 11 Aug 2020 15:22:58 +0800
Message-ID: <20200811072258.4074290-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

pigz, which stands for parallel implementation of gzip, is a
fully functional replacement for gzip that exploits multiple
processors and multiple cores to the hilt when compressing data.

do_package uses pigz to compress data to speed up the time
if there is pigz available on the build server.

But for some big package such as clang, there comes below
error during do_package.
gzip: stdout: Cannot allocate memory
tar: TOPDIR/sstate-cache/20/80/sstate:clang:cortexa57-wrs-linux:10.0.1:r0:cortexa57:3:20808f8a746b00ec9470a81057c8595d878cfe8c565cfbcbbaa3ea870528ee34_package.tgz.QF5dss8M: Wrote only 8192 of 10240 bytes
tar: Child returned status 1
tar: Error is not recoverable: exiting now

So set the default pigz thread and the user also can customize
the pigz thread such as via PIGZ = "-p 3" or PIGZ_pn-clang = "-p 3"
for the individual package in local.conf to avoid eating so much
memory.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 353caacef9..bc87e78d78 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -804,6 +804,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
+# Default parallelism and resource usage for pigz
+export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
-- 
2.26.2

