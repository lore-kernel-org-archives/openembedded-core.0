Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9495E72491
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 17:18:35 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t55HIZ6h020175
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 5 Jun 2015 10:18:35 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z0vG3-0005NR-3p; Fri, 05 Jun 2015 13:18:15 -0400
Date: Fri, 5 Jun 2015 13:18:15 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org, amy.fong@windriver.com
Message-ID: <20150605171815.GA20636@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] External modules fail to load due to unknown symbols
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
X-List-Received-Date: Fri, 05 Jun 2015 17:18:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From da12fa5e6daca0c0b7bb15df030b1c79fbefa089 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 1 Jun 2015 13:16:20 -0400
Subject: [PATCH] External modules fail to load due to unknown symbols

When building external kernel modules, a failure can happen
when the module has dependencies on other kernel modules.
In such cases, the build looks at Module.symvers to do
symbol lookups of the other kernel modules that it depends on.

Module.symvers gets copied by do_shared_workdir
after do_compile and Module.symvers gets updated during
do_compile_kernelmodules.

do_compile_kernelmodules is modified to explicitly copy Module.symvers
to the shared workdir.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4f22cde..4a177b1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -215,6 +215,14 @@ do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+
+		# Module.symvers gets updated during the 
+		# building of the kernel modules. We need to
+		# update this in the shared workdir since some
+		# external kernel modules has a dependency on
+		# other kernel modules and will look at this
+		# file to do symbol lookups
+		cp Module.symvers ${STAGING_KERNEL_BUILDDIR}
 	else
 		bbnote "no modules to compile"
 	fi
-- 
2.0.1


