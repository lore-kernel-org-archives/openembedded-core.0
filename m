Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494616"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494616"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075488"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/28] perl: correct libpth and glibpth
Date: Fri, 16 Jul 2021 10:42:10 +0800
Message-Id: <afe58be55b4efc360420a00cbcf60dd5d99ed556.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

Previouly there is a logic as below used to set libpth in config.sh.
libpth='@LIBDIR@ @BASELIBDIR@'

But after the below commits introduced, the above logic is dropped.
52f2828314 perl: add a version that builds the recipe using perl-cross, and update to 5.28.1
68552c3532 perl: remove the previous version of the recipe

So correct the value of libpth and glibpth to add the dropped logic
back to avoid confusing.

Before the patch(on 64bits system):
 # perl -V:libpth
 libpth='/usr/lib /lib';

After the patch(on 64bits system):
 # perl -V:libpth
 libpth='/usr/lib64 /lib64';

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a494de43c3ccdcf7af988765ae5c3a95bc20c567)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/perl/perl_5.32.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index b28040c7fb..f8893af3e2 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -62,6 +62,8 @@ do_configure_class-target() {
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
+    -Dlibpth='${libdir} ${base_libdir}' \
+    -Dglibpth='${libdir} ${base_libdir}' \
     ${PACKAGECONFIG_CONFARGS}
 
     #perl.c uses an ARCHLIB_EXP define to generate compile-time code that
-- 
2.31.1

