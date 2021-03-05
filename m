Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hxUA3JJYRSdr1RrhoGE/uCWQnWsN8boN4ksZhBFupiJz8BwWLaPN2q+ktRfTmL7IxLA6ChhSLF
 uMkLcgJGOZlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671065"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:35 -0800
IronPort-SDR: HoIdCStOX5GFpoq0zhSbcEweP5P8lFYiyB/wedcvI0S2+T2whj8rVBSnKdrzRCmzxSQdGq9CGc
 i9hKp60dayyQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128943"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:33 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 27/52] python3: Fix python interpreter line length for nativesdk
Date: Fri,  5 Mar 2021 12:21:03 +0800
Message-Id: <79bddd12489fc2bcb2d2a74b91c94d75638fa3a3.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

Make sure the python interpreter is "#!/usr/bin/env python3" for
nativesdk to avoid the shebang path exceeding the limit when install
the sdk under the directory with long path.

Before:
 $ cd ${target_sdk_dir}
 $ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3
 #!${target_sdk_dir}/sysroots/${SDK_SYS}/usr/bin/python3.9
 [snip]

After:
 $ cd ${target_sdk_dir}
 $ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3
 #!/usr/bin/env python3
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a748e6098fa7d2ff594319937c7e0cf97700e83a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3_3.8.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index fb066084bf..fda35a31e2 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -169,6 +169,10 @@ do_install_append() {
 }
 
 do_install_append_class-nativesdk () {
+    # Make sure we use /usr/bin/env python
+    for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
+         sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+    done
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
-- 
2.29.2

