Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.3813.1625563457061663284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1669OFGw027364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jul 2021 02:24:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 02:24:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 6 Jul 2021 02:24:14 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] perl: correct libpth and glibpth
Date: Tue, 6 Jul 2021 17:23:09 +0800
Message-ID: <20210706092309.8813-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

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
2.17.1

