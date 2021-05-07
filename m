Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RDe7E0rCVOOSaxKDVj9J0z+KX2Wi/DQ9/nwEy/7/1obIEKsMom/vUAYdgO0WNK9+uSIwR3R4UV
 DZV330y+L2Hw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794750"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794750"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:09 -0700
IronPort-SDR: CgVICCvnu4tlZJAV8EedhYoC38hz6RGzEOi/N1hJU5yA4Ix5logIvOgb+AfB8ZdLf+eR92OtbI
 AKXJ6UXC9e2g==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331603"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/31] perf: fix python-audit RDEPENDS
Date: Fri,  7 May 2021 15:02:26 +0800
Message-Id: <220725bbe835cb20feef6f21f036a9f10f689a30.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When doing the perf python3 conversion, the audit-python RDEPENDS
was caught up in the regex replacement and was incorrectly changed.

The audit recipe continues to produce a package called audit-python
and it is that package we should have as a RDEPENDS.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7eccb9c0c2ea00685451c44cb8faa96c4a2272fd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e5e5a0d267..2dfd798ef7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -322,7 +322,7 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
+RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python3 bash"
 
-- 
2.30.2

