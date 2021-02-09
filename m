Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YSulBjI7yhDW1J5MScYjyvVzs95HMc0VfZvN9kdkjc26+0qcZnpB9NXvBXMSEpNcLu2/MvSlXN
 sM5HJE3/cIXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968655"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:00 -0800
IronPort-SDR: ai1sZY2DDWP/BHOseZOUTcffal72xTpd3JPEjOlVmkiBvUpVrEcv0gnhbgN+xuIlNDFjGwnBNe
 7wUtM9RUU5ZQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215478"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:59 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/35] package: Ensure do_packagedata is cleaned correctly
Date: Tue,  9 Feb 2021 23:52:01 +0800
Message-Id: <68e17e21f59fcf763877b350cc2a1494b5f1bd91.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In an earlier commit, libprocps was split into a separate package leaving
no shlibs in the main package. A bug was seen where igt-gpu-tools wouldn't
build correctly in some cases as it thought the librbary was still in the
main package, throwing qa errors as a result.

The issue was due to an extra file being left in the sstate output of
the do_packagedata task in the shlibs2/ folder which contained the bad
shlibs information.

The reason for this was that the temporary directory used in this
task wasn't being cleaned so files which were deleted were not handled
correctly. Add a missing cleandirs entry to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50f17d0a655a3a2556f9fcad67259101c2814a36)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 247bdc7bbf..5a32e5c2e3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2446,6 +2446,7 @@ python do_packagedata () {
 
     bb.build.exec_func("packagedata_translate_pr_autoinc", d)
 }
+do_packagedata[cleandirs] += "${WORKDIR}/pkgdata-pdata-input"
 
 # Translate the EXTENDPRAUTO and AUTOINC to the final values
 packagedata_translate_pr_autoinc() {
-- 
2.29.2

