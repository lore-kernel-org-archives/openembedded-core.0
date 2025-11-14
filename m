Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26EFCE7AF4
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 11:48:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16187.1763120925789842267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 03:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hkicTi1K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34131d5d60=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEAXwuN2492907
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 03:48:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SoSqmB4vQ1fH29KktbHH
	j4c2VWjPrkiQUGS+pJsQulk=; b=hkicTi1KNbUA+j/fQmLXTN/9IVTbiCDyhLbf
	6CLPwZyiS1k7hOUJTNjpeoq4Rp7Wq81SxEHT6aMABHIiJqrVK9sqYnGeKy82ue56
	NggnXPzAv9kVJl1ApAFwTMAQ1Yi2o+IrfdbDnxj28TnGqpMJXG3PlCDBh6445b7C
	ejrjTL69U8w/+D7ME+MzAVYfRmxJJ5niXvEf5pq4IqMjb43ocWlxINC3F55ZDqVq
	iXVVGv+unnBDbuoZjVHDlKMB/LO1qGa0kgwsirjyNqMfsYVUJy3gR0SjCBdMQhcY
	+Zym5SD8Rf5y6jliaTLSqsyjRrpwNWTud4NrXzxKWHKo9jzkvw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtk6rfm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 03:48:45 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 14 Nov 2025 03:48:44 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 14 Nov 2025 03:48:43 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] icu: Add configure option to enable Automake-style ptest output format
Date: Fri, 14 Nov 2025 19:48:43 +0800
Message-ID: <20251114114843.2821561-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MyBTYWx0ZWRfX9WID837dXUT9
 wG6yO7EKMhjzDJXS53Ww/ih+sO3itRXYSqTlV0wxDcE7/3RCQ7neW4oNGOReT+r3LszEAQIQBjT
 RcBxD5LMvF+Nj/DAetK4/J1gpWTIQ/UvA9Wgr0RCTsVe78MFUo0mnYWYdOFtfL1zI6ccYF0I066
 E6k0P6cZIGyiV4Y+xbTJXqby2e2c9edNLVfJZV8xjP27E9ew7OIN2fMOGZzh0Ltk7YInmg9BbIQ
 +KO8jBtDbIya5aCBOS90f5+P/aWUAZ7MeEu2x886KGmGCllNNJC49lAqyeHGx7obVNCPdhewthe
 L3uOFW7CVVgbmMMMrcTeDrhKR3KQx9S47eH7pppxZjuo6kT6aTCBubaZ6cQeiC/vlGxLHrfuQxy
 p167NPwoK2zD/LdJXS+Q8WUKj68s0Q==
X-Proofpoint-GUID: z3iL-ynpSnj6C4Zu5u1dZAr4TvuvlkWh
X-Proofpoint-ORIG-GUID: z3iL-ynpSnj6C4Zu5u1dZAr4TvuvlkWh
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=6917171d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=eu2FYrs744zXLHLzHMEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 11:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226287

From: Jiaying Song <jiaying.song.cn@windriver.com>

Added a new configure option `--enable-ptest-automake-format` to enable Automake-style ptest output format.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...utput-compatible-with-Automake-forma.patch | 70 +++++++++++++++----
 meta/recipes-support/icu/icu_77-1.bb          |  2 +-
 2 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
index a3d9b46835..8fbc209097 100644
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
@@ -1,49 +1,95 @@
-From f56e295e936c6c6d9c7219ef649697891cd11382 Mon Sep 17 00:00:00 2001
+From e92a2b82cbbfa499ba210eca50cb6ca0b5c786a5 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
-Date: Mon, 3 Nov 2025 11:34:06 +0800
+Date: Wed, 12 Nov 2025 11:35:43 +0800
 Subject: [PATCH] Make ICU ptest output compatible with Automake format
 
-Change test result format to PASS/FAIL for Automake compatibility
+Change test result format to PASS/FAIL for Automake compatibility, controlled by the --enable-ptest-automake-format option.
 
 Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3764]
 
 Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
 ---
- test/intltest/intltest.cpp | 4 ++--
- tools/ctestfw/ctest.c      | 3 ++-
- 2 files changed, 4 insertions(+), 3 deletions(-)
+ configure.ac               | 17 +++++++++++++++++
+ test/intltest/intltest.cpp | 10 +++++++++-
+ tools/ctestfw/ctest.c      |  9 ++++++++-
+ 3 files changed, 34 insertions(+), 2 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index da4f170..37872d4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1165,6 +1165,21 @@ If set, it will REPLACE any automatic list of libraries.],
+ 		*) AC_MSG_ERROR(bad value ${enableval} for --enable-samples) ;;
+ 		esac],
+ 	samples=true)
++
++# Enable Automake-compatible ptest output format (for Yocto/OpenEmbedded)
++AC_ARG_ENABLE([ptest-automake-format],
++    AS_HELP_STRING([--enable-ptest-automake-format],
++                   [Emit ptest output in Automake format (PASS:/FAIL:) for Yocto ptest]),
++    [
++        if test "x$enableval" = "xyes"; then
++            UCONFIG_CPPFLAGS="${UCONFIG_CPPFLAGS} -DU_PTEST_AUTOMAKE_FORMAT=1"
++            AC_MSG_RESULT([enabling Automake ptest format])
++        else
++            AC_MSG_RESULT([disabling Automake ptest format])
++        fi
++    ],
++    [enable_ptest_automake_format=no])
++
+ ICU_CONDITIONAL(SAMPLES, test "$samples" = true)
+ 
+ ICUDATA_CHAR=$U_ENDIAN_CHAR
+@@ -1428,3 +1443,5 @@ then
+ fi
+ 
+ $as_unset _CXX_CXXSUFFIX
++
++
 diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 33829b0..07071ea 100644
+index 33829b0..6dfc8cb 100644
 --- a/test/intltest/intltest.cpp
 +++ b/test/intltest/intltest.cpp
-@@ -830,11 +830,11 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+@@ -830,11 +830,19 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
              saveBaseLoc[0]=0; /* reset path */
              
              if (lastErrorCount == errorCount) {
 -                snprintf( msg, sizeof(msg),  "   } OK:   %s ", name );
++            #ifdef U_PTEST_AUTOMAKE_FORMAT
 +                snprintf(msg, sizeof(msg), "PASS: %s\n   }", name);
++            #else
++                snprintf(msg, sizeof(msg),  "   } OK:   %s ", name );
++            #endif
                  if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
                  lastTestFailed = false;
              }else{
--                snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
++            #ifdef U_PTEST_AUTOMAKE_FORMAT
 +                snprintf(msg, sizeof(msg), "FAIL: %s\n   } (ERRORS: %li)", name, static_cast<long>(errorCount - lastErrorCount));
++            #else
+                 snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
++            #endif
                  if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
  
                  for(int i=0;i<LL_indentlevel;i++) {
 diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
-index 7634526..727b164 100644
+index 7634526..1f73650 100644
 --- a/tools/ctestfw/ctest.c
 +++ b/tools/ctestfw/ctest.c
-@@ -413,9 +413,10 @@ static void iterateTestsWithLevel ( const TestNode* root,
+@@ -413,9 +413,16 @@ static void iterateTestsWithLevel ( const TestNode* root,
          ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
  
          if (myERROR_COUNT != ERROR_COUNT) {
 -          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT, pathToFunction);
-+          log_testinfo_i("\nFAIL: %s\n} ---[ERRORS: %d]", root->name, ERROR_COUNT - myERROR_COUNT);
++        #ifdef U_PTEST_AUTOMAKE_FORMAT
++          log_testinfo_i("\nFAIL: %s\n} ---[ERRORS: %d]", root->name,ERROR_COUNT - myERROR_COUNT);
++        #else
++          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT,pathToFunction);
++        #endif
            strcpy(ERROR_LOG[ERRONEOUS_FUNCTION_COUNT++], pathToFunction);
          } else {
++        #ifdef U_PTEST_AUTOMAKE_FORMAT
 +          log_testinfo_i("\nPASS: %s\n", root->name);
++        #endif
            if(!ON_LINE) { /* had some output */
              int spaces = FLAG_INDENT-(depth-1);
              log_testinfo_i("} %*s[OK] ", spaces, "---");
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index 370c14af81..17fa4a4db2 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -23,7 +23,7 @@ inherit autotools pkgconfig github-releases
 EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
 EXTRA_OECONF:class-native = "--disable-icu-config ac_cv_path_install='install -c'"
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
-
+EXTRA_OECONF:append:class-target = " --enable-ptest-automake-format"
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
 
-- 
2.34.1


