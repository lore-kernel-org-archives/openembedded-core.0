Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gsgKghRA8I9B4eDBNtB4DlCOVL3gYdfVA/3zArvbzKT76l/TFtHYQiV3KrJ00deaCDEDrSgoG/
 3zpQn4DdRhbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211613"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211613"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:54 -0700
IronPort-SDR: khGYe7OU4tXSGDZn/gORpottfIROiR5iNEjU/s6rS7+v2p1NyW5uYSmCwCX2ND14u9P8glwgY0
 821K5CjTwkpA==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295189"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/25] apr-util: Fix CFLAGS used in build
Date: Mon, 22 Mar 2021 09:41:14 +0800
Message-Id: <ca466a17fb18334f307e2241c65f25d024f0a164.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to use CFLAGS with the correct WORKDIR in them, replace those
in the sysroot file with the ones appropriate to the current recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45edf189961aff1858be9bb7b63116073c0a0c10)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index f7d827a1d8..4e183ca374 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -35,6 +35,7 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 do_configure_append() {
 	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
 		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${B}/build/rules.mk
+		sed -i -e 's#^CFLAGS=.*#CFLAGS=${TARGET_CFLAGS}#g' ${B}/build/rules.mk
 	fi
 }
 do_configure_prepend_class-native() {
@@ -49,6 +50,7 @@ do_configure_append_class-native() {
 
 do_configure_prepend_class-nativesdk() {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+	sed -i -e 's#^CFLAGS=.*#CFLAGS=${TARGET_CFLAGS}#g' ${S}/build/rules.mk
 }
 
 do_configure_append_class-nativesdk() {
-- 
2.30.2

