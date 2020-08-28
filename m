Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.37413.1598595648959964367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 23:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07S6Ju6H028292
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 23:20:38 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 27 Aug 2020 23:20:01 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libpcre: fix occasionally do_package_write_rpm error
Date: Fri, 28 Aug 2020 14:14:34 +0800
Message-ID: <20200828061434.2943665-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Error info:
ERROR: libpcre-8.44-r0 do_package_write_rpm: Failure expanding variable
SUMMARY_libpcrecpp, expression was ${SUMMARY} - C++ wrapper functions
which triggered exception RecursionError: maximum recursion depth
exceeded while calling a Python object

this error is hard to reproduce, only met one time. Seems expand SUMMARY
with reference to SUMMARY cause a dead loop.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/libpcre/libpcre_8.44.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
index e5471e81da..102b92b4dd 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -40,8 +40,8 @@ EXTRA_OECONF = "--enable-utf"
 
 PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
 
-SUMMARY_libpcrecpp = "${SUMMARY} - C++ wrapper functions"
-SUMMARY_libpcreposix = "${SUMMARY} - C wrapper functions based on the POSIX regex API"
+SUMMARY_libpcrecpp = "Perl Compatible Regular Expressions - C++ wrapper functions"
+SUMMARY_libpcreposix = "Perl Compatible Regular Expressions - C wrapper functions based on the POSIX regex API"
 SUMMARY_pcregrep = "grep utility that uses perl 5 compatible regexes"
 SUMMARY_pcregrep-doc = "grep utility that uses perl 5 compatible regexes - docs"
 SUMMARY_pcretest = "program for testing Perl-comatible regular expressions"
-- 
2.17.1

