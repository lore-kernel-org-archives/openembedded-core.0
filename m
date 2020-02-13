Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD5860B98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 18:38:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01DIcqcG024715
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 10:38:52 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 13 Feb 2020 10:38:45 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2020 02:38:44 +0800
Message-ID: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Thu, 13 Feb 2020 18:38:52 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

To make the native python3 are always used,

- Move the substitution of /usr/bin/python3 to first, otherwise the
  possible original /usr/bin/python3 would be changed to
  /usr/bin/env python33.
- Add substitution for ${S}/scripts/

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 6d1b066..14a9090 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -240,10 +240,17 @@ do_configure_prepend () {
 
     # use /usr/bin/env instead of version specific python
     for s in `find ${S}/tools/perf/ -name '*.py'`; do
+        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
+    done
+
+    for s in `find ${S}/scripts/ -name '*.py'`; do
         sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
-- 
2.7.4


