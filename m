Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9930.1589535091901547717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 02:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04F9V0SW006722
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 02:31:21 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 02:31:10 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] archiver.bbclass: Fix for do_populate_sdk
Date: Fri, 15 May 2020 02:30:48 -0700
Message-ID: <ab5e6c612d362589fa88a49fd36c4a0b1ecc1a37.1589535009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1589535009.git.liezhi.yang@windriver.com>
References: <cover.1589535009.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixed:
$ bitbake core-image-minimal -cpopulate_sdk

Check tmp-glibc/deploy/sources, no source is archived, this patch fixes the
problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 48b4913a9f..49f96bdce6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -592,4 +592,8 @@ python () {
     # gets added or removed (by adding or removing archiver.bbclass).
     if bb.data.inherits_class('kernel-yocto', d):
         bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
+
+    # For populate_sdk
+    if bb.data.inherits_class('image', d):
+        d.appendVarFlag('do_populate_sdk', 'recrdeptask', ' do_deploy_archives')
 }
-- 
2.21.0

