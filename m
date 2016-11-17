Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20A1B600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 05:27:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH5RTu4015450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:27:29 -0800 (PST)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 16 Nov 2016 21:27:28 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2016 13:27:26 +0800
Message-ID: <1479360446-8915-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] e2fsprogs: fix hardcoded path for ptest script
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
X-List-Received-Date: Thu, 17 Nov 2016 05:27:30 -0000
Content-Type: text/plain

The hardcoded path would cause failure on mulitilib:
ls: cannot access '/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
./test_script: line 34: /usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index ef1ce58..77e8822 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -7,7 +7,7 @@ index 60cf655..ce220f1 100644
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
 -	@echo "SRCDIR=@srcdir@" >> test_one
-+	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_one
++	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@cat $(srcdir)/test_one.in >> test_one
  	@chmod +x test_one
@@ -16,7 +16,7 @@ index 60cf655..ce220f1 100644
  	@echo "Creating test_script..."
  	@echo "#!/bin/sh" > test_script
 -	@echo "SRCDIR=@srcdir@" >> test_script
-+	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_script
++	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
  	@cat $(srcdir)/test_script.in >> test_script
  	@chmod +x test_script
  
-- 
2.7.4


