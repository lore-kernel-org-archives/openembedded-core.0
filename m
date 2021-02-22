Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.36735.1614009690142515631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xiy4j5zWIanAVyKWZYP5G8iL+8JK+MdedMtALtD7d0fUQYaNIfcGCQ3VdGafctZ/PJXcahV8fw
 zQkeZjLfBRhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706260"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706260"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:24 -0800
IronPort-SDR: bk+HsCNOMHWCkYcsuuW/iGsFvAEG7skN59rWkJqe+ScSazTN1/9/w5K9EmVj4x5IkXRq+XcNWT
 WHFlf5JldVpw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302174"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 30/30] acpica: Fix reproducibility issues
Date: Tue, 23 Feb 2021 00:00:33 +0800
Message-Id: <0e5605af9ebbfceffd510e42013d4eaa76c4e820.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

Fixes reproducibility when build acpica yacc sources by instructing
bison on how to do the file prefix mapping

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d13a1df7bd173fca3fc2cdf889d5eb487e35d6fd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/acpica/acpica_20200717.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/acpica/acpica_20200717.bb b/meta/recipes-extended/acpica/acpica_20200717.bb
index d1d06c0c24..e3c8c2bdfb 100644
--- a/meta/recipes-extended/acpica/acpica_20200717.bb
+++ b/meta/recipes-extended/acpica/acpica_20200717.bb
@@ -34,6 +34,8 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 PREFIX=${prefix} \
                 INSTALLDIR=${bindir} \
                 INSTALLFLAGS= \
+                YACC=bison \
+                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
                 "
 
 do_install() {
-- 
2.29.2

