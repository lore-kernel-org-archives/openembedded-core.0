Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.419.1632243845533747474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="287090255"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="287090255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="549571168"
Received: from vanamadx-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.239.24])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 1/4] sstate: Avoid problems with recipes using SRCPV when fetching sstate
Date: Wed, 22 Sep 2021 01:03:09 +0800
Message-Id: <7d43b5607e4b8db982d2cb9f4c86828cad5714a6.1632216051.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632216051.git.anuj.mittal@intel.com>
References: <cover.1632216051.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When fetching sstate, SRCPV can be expanded withuin PV which breaks the
sstate fetcher as other variables like SRC_URI are changed by the fetcher
code. Expand the variable before doing this to avoid those problems and
hence avoid setscene task failures with remote sstate storage in git
recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d9d7acebe0be42d4cf8a30ecbbbbcb2dfd16a4b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4bf087b4e8..8b4bfc25b7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -731,6 +731,7 @@ def pstaging_fetch(sstatefetch, d):
     localdata.setVar('FILESPATH', dldir)
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
+    localdata.setVar('SRCPV', d.getVar('SRCPV'))
 
     # if BB_NO_NETWORK is set but we also have SSTATE_MIRROR_ALLOW_NETWORK,
     # we'll want to allow network access for the current set of fetches.
@@ -755,6 +756,9 @@ def pstaging_fetch(sstatefetch, d):
         except bb.fetch2.BBFetchException:
             pass
 
+pstaging_fetch[vardepsexclude] += "SRCPV"
+
+
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
-- 
2.31.1

