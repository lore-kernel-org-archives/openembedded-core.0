Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ncz5ZfiaXC8G2gwRYbXB8cJTBYw+gIgP2AKNc2i6JEuuGWv8E6sCQ+5qfe6DR/7eVbKlUhywxd
 62hEVSYXtk5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699763"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699763"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:17 -0700
IronPort-SDR: t1n4wGmaavQSGWvlzAPAbWhDNwREeUombEcE3G5GT9DV7FR3+kBbevd2bBSEPOTEeLiNpSm7eM
 rSVmlWLyp2Yw==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245937"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 23/32] perf: fix build for v5.5+
Date: Tue, 28 Jul 2020 16:51:24 +0800
Message-Id: <3269e3d2d0258ac3788ed63fa46df4d4aae33b1e.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In kernel 5.5+ there are python3 scripts that explicitly use
/usr/bin/python3 as the interpreter. That will find the host
python and produce undefined results.

We add that interpreter path to our substitutions to ensure
that our sysroot variant is used.

(From OE-Core rev: 103316d50d4947b3c3500eb5cbc4845702a62d22)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5c4f3127521607742f7cdf62481b64cf4d3e828)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 90f05c0e62..d707b580e2 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -237,6 +237,7 @@ do_configure_prepend () {
         sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
-- 
2.25.4

