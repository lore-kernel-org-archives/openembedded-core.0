Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id C08CC60D28
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 20:20:08 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 017KK8FP028724
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2020 14:20:09 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:20:06 -0600
Message-Id: <20200207202008.132026-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
References: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 1/3] package.bbclass: Fix debug source processing for static libraries
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
X-List-Received-Date: Fri, 07 Feb 2020 20:20:09 -0000

Format of the sources list is the [ (file, [source, ...]), ... ] before
this change, the static libraries were processed but the items were
included incorrectly causing no sources for static libraries to be
included.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ef3de35961..46ec9b6b3a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1051,7 +1051,7 @@ python split_and_strip_files () {
 
         if debugsrcdir and not targetos.startswith("mingw"):
             for file in staticlibs:
-                results.extend(source_info(file, d, fatal=False))
+                results.append( (file, source_info(file, d, fatal=False)) )
 
         sources = set()
         for r in results:
-- 
2.17.1


