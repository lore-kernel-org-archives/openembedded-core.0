Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: L09HrG0tN3ntB5GOpK/CBw/2KmmFUfghF4LxK/IKctzcu9h4TzjiS58cMqZBQJkmcpMR0Aoa+4
 l3UhFJ0ykBiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236055"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236055"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:15 -0800
IronPort-SDR: uw8t8ayPPCLDl/pw6BBQfSXTIgzBLPrZJ5rmG+qOQE+p0SGLwrDR6XYpwpmdqJQJW+iLDdB3sr
 rDfJw2favAag==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027602"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/35] perl: fix installation failure because of shell issue
Date: Wed, 23 Dec 2020 23:18:27 +0800
Message-Id: <784ca95f7e3a816be9c9782944fa49b896d58690.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On one of my buildservers I noticed perl do_install failing with the
following message:

| rm: cannot remove '<OEROOT>/tmp-rpb-glibc/work/armv8-2a-linaro-linux/perl/5.32.0-r0/image//usr/lib/perl5/5.32.0/*/CORE/libperl.so': No such file or directory

I tracked this down to shell being dash rather than bash not being able
to expand this glob in the middle of the filename. So replace the glob
expansion with the simpler one which works in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1ea1b5c12120abdd085dc4eb69120af9258a99b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/perl/perl_5.32.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.0.bb
index bba8263b90..3815dd44b1 100644
--- a/meta/recipes-devtools/perl/perl_5.32.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.0.bb
@@ -137,8 +137,9 @@ do_install() {
     install lib/ExtUtils/typemap ${D}${libdir}/perl5/${PV}/ExtUtils/
 
     # Fix up shared library
-    rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
-    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
+    dir=$(echo ${D}/${libdir}/perl5/${PV}/*/CORE)
+    rm $dir/libperl.so
+    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $dir/libperl.so
 
     # Try to catch Bug #13946
     if [ -e ${D}/${libdir}/perl5/${PV}/Storable.pm ]; then
-- 
2.29.2

