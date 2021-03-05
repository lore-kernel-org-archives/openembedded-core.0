Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eEFRPtpGjkTj5t0hqJQSxUkCK5QCWdijlJH1sPvZQTedygA7qpInBDni5t9bryH8sNtVdOwiOX
 Gv9D/nt52okA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671073"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671073"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:36 -0800
IronPort-SDR: 75UZh5+wKiWwrtjCN7ApHRxIsg7t/MxJ81OwTxkjhR/Kuosb18tjwf6zU0zGhFLVRbzA0s6Snr
 zjg2EQkjQJVg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128946"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 28/52] report-error.bbclass: Add layer and bitbake version info to error report
Date: Fri,  5 Mar 2021 12:21:04 +0800
Message-Id: <4c2548f0040226d274a4c8604ebf5bfbd396bc48.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Milan Shah <mshah@mvista.com>

Instead of just providing local.conf info, add layer names and their
revisions with bitbake version information into error report
makes it easier to understand and reproduce failed build.

[YOCTO #9700]

Signed-off-by: Milan Shah <mshah@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5afd7b1857c0012ab6e3d8bbafa67a96ff9e9e0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/report-error.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 1a12db1206..9cb6b0bd31 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -6,6 +6,8 @@
 #
 # Licensed under the MIT license, see COPYING.MIT for details
 
+inherit base
+
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
 def errorreport_getdata(e):
@@ -64,6 +66,8 @@ python errorreport_handler () {
             data['failures'] = []
             data['component'] = " ".join(e.getPkgs())
             data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
+            data['bitbake_version'] = e.data.getVar("BB_VERSION")
+            data['layer_version'] = get_layers_branch_rev(e.data)
             data['local_conf'] = get_conf_data(e, 'local.conf')
             data['auto_conf'] = get_conf_data(e, 'auto.conf')
             lock = bb.utils.lockfile(datafile + '.lock')
-- 
2.29.2

