Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC0D6100D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 03:44:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01E3iuZk015898
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 19:44:56 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 13 Feb 2020 19:44:56 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2020 11:44:54 +0800
Message-ID: <20200214034454.40728-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH v2] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Fri, 14 Feb 2020 03:44:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

To make the native python3 is always used,

- Move the substitution of /usr/bin/python3 to first, otherwise the
  possible original /usr/bin/python3 would be changed to
  /usr/bin/env python33.
- Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
  following warning.

File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
_temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
ModuleNotFoundError: No module named '_sysconfigdata'

This issue is first reported by Joel Stanley <joel@jms.id.au>
The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 6d1b06693d..a6fb51d3db 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -239,11 +239,8 @@ do_configure_prepend () {
     fi
 
     # use /usr/bin/env instead of version specific python
-    for s in `find ${S}/tools/perf/ -name '*.py'`; do
-        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
+    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers_doc.py; do
+        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
-- 
2.24.1


