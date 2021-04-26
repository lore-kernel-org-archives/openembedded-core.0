Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7es5IXFNoAaulUWzgZlTOl9QtHr3mP1AmJzC23PKyny5pDb+dt4j62lzpFW1oNBDPI+JO2NxSl
 +fjb7jFzauaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818241"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:53 -0700
IronPort-SDR: YYyiEO0M7yHhMGz+yoNg/7nKPmSBdmgods/z5AWwC4KQLE7Rxa60t87RkWq3dht6SjmQT7lhuT
 oBjQZrb9vdeA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067467"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 42/64] ltp: fix empty ltp-dev package
Date: Mon, 26 Apr 2021 08:53:13 +0800
Message-Id: <c4419fb58b6ab5f4fbdcd65e5b6d2e7742c8d66f.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Höppner <jonas.hoeppner@garz-fricke.com>

Currently the headers are not installed and the ltp-dev package is
empty.

This patch adds an include-install make target in the do_install step to
install them in sysroot which ends up as a working ltp-dev package.

Signed-off-by: Jonas Höppner <jonas.hoeppner@garz-fricke.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6943da4444cd71053650be0c9212bc25ac53137)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/ltp/ltp_20210121.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index f58ca2eb2c..d98c9fdc25 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -61,7 +61,7 @@ EXTRA_OECONF += " --without-tirpc "
 
 do_install(){
     install -d ${D}${prefix}/
-    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
+    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install include-install
 
     # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
     # as it lacks dependency on some perl moudle such as LWP::Simple
-- 
2.30.2

