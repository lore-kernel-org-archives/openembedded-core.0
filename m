Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E51D56A98A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 18:27:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5BIRftr010753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 11:27:41 -0700 (PDT)
Received: from fidler.corp.ad.wrs.com (128.224.147.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 11 Jun 2013 11:27:41 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jun 2013 14:27:34 -0400
Message-ID: <1370975254-4851-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.8.2.1
MIME-Version: 1.0
Subject: [PATCH] sanity.bbclass: non-zero status means that we need -march.
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
X-List-Received-Date: Tue, 11 Jun 2013 18:27:41 -0000
Content-Type: text/plain

A non-zero status from the march test for gcc means that the "march" flag
is needed. Correct the logic to return True in this case.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6cad4bc..1c45b5b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -348,7 +348,7 @@ def check_gcc_march(sanity_data):
         if status != 0:
             # Check if GCC could work with march
             status,result = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
-            if status == 0: 
+            if status != 0: 
                 result = True
             else:
                 result = False
-- 
1.8.2.1


