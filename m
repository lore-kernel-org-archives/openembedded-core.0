Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 41DC865D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 21:35:23 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 006632232CC0;
	Tue, 24 Jun 2014 23:35:24 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 219DE2232CBF;
	Tue, 24 Jun 2014 23:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.2
Received: from localhost.localdomain (f052237089.adsl.alicedsl.de
	[78.52.237.89]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Tue, 24 Jun 2014 23:35:23 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 23:34:47 +0200
Message-Id: <1403645687-19655-4-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1403645687-19655-1-git-send-email-henning@itconsulting-heinold.de>
References: <1403645687-19655-1-git-send-email-henning@itconsulting-heinold.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 3/3][for-dora] perf: add slang to the dependencies
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
X-List-Received-Date: Tue, 24 Jun 2014 21:35:24 -0000

* TUI/GUI support was added in 2.6.35 based on libnewt
* since 3.10 slang replaced libnewt completly
* changing TUI_DEFINES is not necessary, because NO_NEWT is
  still respected with newer kernels
* add comment about the gui history to the recipe

The patch was sponsored by sysmocom

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 meta/recipes-kernel/perf/perf.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e43f053..63d356e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -15,7 +15,10 @@ require perf-features.inc
 
 BUILDPERF_libc-uclibc = "no"
 
-TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt', '',d)}"
+# gui support was added with kernel 3.6.35
+# since 3.10 libnewt was replaced by slang
+# to cover a wide range of kernel we add both dependencies
+TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
 SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
 
 DEPENDS = "virtual/kernel \
-- 
1.9.1

