Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 69F497646B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:03:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6UF3F30003838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 08:03:15 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 30 Jul 2015 08:02:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Jul 2015 11:03:14 -0400
Message-ID: <1438268594-14450-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: add liblzma depdenency
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
X-List-Received-Date: Thu, 30 Jul 2015 15:03:17 -0000
Content-Type: text/plain

With kernel commit 6c6f0f6164f [tools build: Add feature check for lzma
library], perf now performs a test for lzma and adds functionality
appropriately.

This currently is a floating dependency that will sometimes be present,
and sometimes not. The result is the following QA warning:

  WARNING: QA Issue: perf rdepends on liblzma, but it isn't a build dependency? [build-deps]

By adding xz to the DEPENDS, we'll ensure that it is consistently in
place.

[YOCTO: #8045]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 056ac831f7ac..246f1b47f7b8 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -29,7 +29,7 @@ DEPENDS = " \
     ${TUI_DEPENDS} \
     ${SCRIPTING_DEPENDS} \
     ${LIBUNWIND_DEPENDS} \
-    bison flex \
+    bison flex xz \
 "
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
-- 
2.1.0


