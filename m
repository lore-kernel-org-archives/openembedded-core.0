Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5ED65CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2NF9Cc7008285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Mar 2016 08:09:12 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 08:09:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Mar 2016 11:09:03 -0400
Message-ID: <a7fc7543d87f8aa22906a8b5080059f76e0f090a.1458745322.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458745322.git.bruce.ashfield@windriver.com>
References: <cover.1458745322.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] perf: fix python scripts QA errors
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
X-List-Received-Date: Wed, 23 Mar 2016 15:09:15 -0000
Content-Type: text/plain

Two QA warnings were being generated from perf, due to the location of
python scripts changing in the kernel build:

WARNING: perf-1.0-r9 do_package_qa: QA Issue:
  /usr/libexec/perf-core/scripts/python/call-graph-from-postgresql.py contained
  in package perf-python requires /usr/bin/python2, but no providers found in RDEPENDS_perf-python? [file-rdeps]

WARNING: QA Issue: /usr/libexec/perf-core/tests/attr.py_perf contained in package
  perf requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]

By adding libexec dir to both the tests and scripts packaging, we get the
appropriate RDEPENDS on the packages that actually contain the python scripts
(without making perf-core depend on python).

We also tweak any python scripts to use '/usr/bin/env python', rather than a
version specific python, since it won't be provided and generate a QA error.

[YOCTO #8991]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8b862902011d..e9c5c0c9f30e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -183,6 +183,11 @@ do_configure_prepend () {
         sed -i 's,#include "tests/tests.h",#include "tests/tests.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/arm/tests/dwarf-unwind.c
         sed -i 's,#include "perf_regs.h",#include "perf_regs.h"\n#include "util/debug.h",' ${S}/tools/perf/arch/arm/util/unwind-libunwind.c
     fi
+
+    # use /usr/bin/env instead of version specific python
+    for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
+        sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
+    done
 }
 
 python do_package_prepend() {
@@ -205,8 +210,9 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
-FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
+FILES_${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
 FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
+FILES_${PN}-python += "${libexecdir}/perf-core/scripts/python/*"
 FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
 
 
-- 
2.5.0


