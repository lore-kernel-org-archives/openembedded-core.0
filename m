Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E1D457885C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 05:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E156320AB9;
	Wed, 10 Jan 2018 05:09:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pdvSbB4X9d0X; Wed, 10 Jan 2018 05:09:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C049220189;
	Wed, 10 Jan 2018 05:09:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3EBCE16325E;
	Wed, 10 Jan 2018 00:09:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 00:09:00 -0500
Message-Id: <1515560940-118797-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] perf: depend on native versions of bison and flex
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
X-List-Received-Date: Wed, 10 Jan 2018 05:09:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Explicitly depend on bison-native and flex-native for deterministic builds,
as those are required for the build:

| Makefile.config:129: *** Error: flex is missing on this system, please install it.  Stop.
| Makefile.perf:205: recipe for target 'sub-make' failed
| make[1]: *** [sub-make] Error 2
| Makefile:68: recipe for target 'all' failed
| make: *** [all] Error 2

| Makefile.config:133: *** Error: bison is missing on this system, please install it.  Stop.
| Makefile.perf:205: recipe for target 'sub-make' failed
| make[1]: *** [sub-make] Error 2
| Makefile:68: recipe for target 'all' failed
| make: *** [all] Error 2

In most cases, those dependencies come indirectly via toolchain dependencies,
specifically binutils-cross, which pulls both bison-native and flex-native.
Different setups, such as with external toolchain, would expose this problem,
since correct dependency is not marked explicitly.

The change is build-tested on all qemu architectures.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b79b973..bb943ec 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -26,7 +26,7 @@ DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
     ${MLPREFIX}binutils \
-    bison flex xz \
+    bison-native flex-native xz \
     xmlto-native \
     asciidoc-native \
 "
-- 
2.7.4


