Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8932573CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 10:25:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8GAP2xm012508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 03:25:02 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 03:25:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 03:25:00 -0700
Message-ID: <5454639ee071da6816d723e22d89873be8927ea9.1442399039.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442399039.git.liezhi.yang@windriver.com>
References: <cover.1442399039.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] perf: mkdir ${B} -> mkdir -p ${B}
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
X-List-Received-Date: Wed, 16 Sep 2015 10:25:05 -0000
Content-Type: text/plain

${B} is the default cwd of tasks, so there might be race issues such as:
| mkdir: cannot create directory `/path/to/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/': File exists
[snip]
NOTE: recipe perf-1.0-r9: task do_configure: Failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index adb3a2c..242cf62 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -120,7 +120,7 @@ do_install() {
 do_configure_prepend () {
     # Fix for rebuilding
     rm -rf ${B}/
-    mkdir ${B}/
+    mkdir -p ${B}/
 
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-- 
1.7.9.5


