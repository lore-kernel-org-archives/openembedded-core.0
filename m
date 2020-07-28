Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.8071.1595926461485962472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rW4fxE0zBXaS1pIyNnwPKbfR6EcoRUSqWA0BhpBEy7KaQwqrHN6lKmagSngGSqjIE8vuqC88Zz
 AEIrnIzKEE8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699769"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699769"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:19 -0700
IronPort-SDR: s5f4s3PGv2caGGOC9nmXcEujdbX1CdnGVTFMzhksQdfZsne8LsnnclX0Y5mHAEOS3T2BRG9fXJ
 Z2ulo2mc8GfA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245945"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 24/32] perf: Correct the substitution of python shebangs
Date: Tue, 28 Jul 2020 16:51:25 +0800
Message-Id: <c0bcc24ccc6d769935d7fa202a1405250d94e342.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: He Zhe <zhe.he@windriver.com>

To make the native python3 always used,

- Use sed one-liner instead
- Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
  following warning.

File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
_temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
ModuleNotFoundError: No module named '_sysconfigdata'

This issue is first reported by Joel Stanley <joel@jms.id.au>
The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: 3f93173130a94310255389cfc62c67102a4fb21b)

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a1a18ba9d28adb5562eabe9ec354f6d93154f5c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d707b580e2..904aca95de 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -233,11 +233,8 @@ do_configure_prepend () {
     fi
 
     # use /usr/bin/env instead of version specific python
-    for s in `find ${S}/tools/perf/ -name '*.py'`; do
-        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
+    for s in `find ${S}/tools/perf/ -name '*.py'` `find ${S}/scripts/ -name 'bpf_helpers_doc.py'`; do
+        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
-- 
2.25.4

