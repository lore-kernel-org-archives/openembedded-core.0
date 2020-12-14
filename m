Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.29836.1607916926312113884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ek7aBfy4hgneWrtJAdoR5Kt+oZKfQwelmoWldM/lmIKYoe9H+/y5YrTVsePF/6VTgmLJ452YMx
 9bEpLDgtWZ4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752352"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752352"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:24 -0800
IronPort-SDR: TOTeday7RWEBEHUOwQpHHbJaudHTXjLG+AVN9GHYZ/2+DN5H/lw5uSmNbciLzVNj7iDSZlB04U
 qA491LV5OdQA==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670744"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/19] cve-update-db-native: handle all-wildcard versions
Date: Mon, 14 Dec 2020 11:34:59 +0800
Message-Id: <4116c4bbc896d0b445efc294603f02dedd0d3674.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

If a CPE version field is just *:*:*:* it should be handled the same as
-:*:*:*, that is 'all versions'.  To ease handling, transform this case
to use -.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 04a9bc4ca5294fe6834513669c7746a824d12b04)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index cf2b251e21..cf62e1e32c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -172,7 +172,12 @@ def parse_node_and_insert(c, node, cveId):
                     op_end = '<'
                     v_end = cpe['versionEndExcluding']
 
-                yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+                if op_start or op_end or v_start or v_end:
+                    yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+                else:
+                    # This is no version information, expressed differently.
+                    # Save processing by representing as -.
+                    yield [cveId, vendor, product, '-', '', '', '']
 
     c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
 
-- 
2.29.2

