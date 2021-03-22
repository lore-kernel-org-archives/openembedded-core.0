Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: nADZdH55Txrre6EJfeRzW5SQUX8cbUOoqF2NCG93axQ6sqOdtcuxJTU5R6o/EPoTvZLY4t5Ay/
 Po3XnTIaemKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211652"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211652"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:02 -0700
IronPort-SDR: y51TyzKaCeephJ4qvFxB6RdfnX2bUShbdySSlL+HIqspskojy/QKxQMFxQ8dhsNjhXQz2e7S/b
 wAXu7JzhJf6w==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295237"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/25] populate_sdk_ext: record METADATA_REVISION
Date: Mon, 22 Mar 2021 09:41:21 +0800
Message-Id: <c0599c12449240bbd7b3add43d01b3481ff1e813.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

As we delete the .git/ directory, it's impossible to get METADATA_REVISION
inside eSDK. Because of this, we meet the following warning when installing eSDK.

  WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
  but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64

So we record METADATA_REVISION in eSDK generation time to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff2ad51b801fd62e2abbc573ba2c9ee8fdc7e012)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e6bf27cf38..9112ab6c5e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -364,6 +364,9 @@ python copy_buildsystem () {
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n\n')
 
+            # Write METADATA_REVISION
+            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
 
-- 
2.30.2

