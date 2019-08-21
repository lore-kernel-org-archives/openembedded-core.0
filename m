Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF5D27E52D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 20:01:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7LK1H77015996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 13:01:27 -0700
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 13:01:07 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2019 16:01:05 -0400
Message-ID: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] quilt: Export missing QUILT_PC variable in ptest Makefile
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
X-List-Received-Date: Wed, 21 Aug 2019 20:01:36 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The quilt ptest uses a custom Makefile to implement the
"make check" rule, but the ptest Makefile does not export
the value QUILT_PC, which is user-settable and normally
defaults to ".pc". This causes failures e.g. import.test
with "rm -rf patches/ %{QUILT_PC}/", evaluating to
"rm -rf patches/ /" if the variable is not set by the
Makefile.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/quilt/quilt/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt/Makefile b/meta/recipes-devtools/quilt/quilt/Makefile
index 7b3ac8a..1f6cd24 100644
--- a/meta/recipes-devtools/quilt/quilt/Makefile
+++ b/meta/recipes-devtools/quilt/quilt/Makefile
@@ -2,7 +2,8 @@ PATH :=         $(CURDIR)/bin:$(CURDIR)/compat:$(PATH)
 QUILT_DIR :=    $(CURDIR)/quilt
 QUILTRC :=      $(CURDIR)/test/test.quiltrc
 export QUILT_DIR QUILTRC
-CHECK_ENV := P=patches/; _P=../patches/; export P _P
+CHECK_ENV := P=patches/; _P=../patches/; export P _P;
+CHECK_ENV += QUILT_PC=.pc; export QUILT_PC
 -include test/.depend
 
 check-% : test/%.test
-- 
2.7.4


