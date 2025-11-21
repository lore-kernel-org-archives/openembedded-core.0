Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CD0CFA474
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 05:33:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5463.1763703174673429408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 21:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jGjJ3Gl1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=342003eb54=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5Ar1A2476521
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 21:32:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=X/eot3k2C
	Zzn5yi4YziyjCfWeDdtcCa+Xb1+uP+Wuw8=; b=jGjJ3Gl1EmLXZtFog+3WCBanx
	pSVHZwGc/5qg7zJFAm9lKlnLymj094W7mi9v55yz+TuDCeWuq+WsYy8YpQZdkTXn
	pZ+RHV2o8GqK8VvUQg0M4nsFyfDrFq0chZWjdnxGOeEnGdPZxi+7TjzmiG725tOE
	ej4DKT/FPYPdf+XNjZK9exxOKs6pthwHtqT0LayqdIA2be0A9o64QQXYpVcQsOXQ
	fwIyLbNEKRWxzlC6H8pqLUSsJo71QFsKqlweqQhwZB5lGUb3/raS9PaiZhOMNT2e
	IToAaU8b5xWimXVhsknNvbyrzZtDGBuM1FTQcClm6IbP9u84dcgPNQ5cGhWYw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ajekag54f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 21:32:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 20 Nov 2025 21:32:53 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 20 Nov 2025 21:32:52 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Liezhi.Yang@windriver.com>
Subject: [PATCH v2] icu: Add configure option to enable Automake-style ptest output format
Date: Fri, 21 Nov 2025 13:32:52 +0800
Message-ID: <20251121053252.654614-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0MSBTYWx0ZWRfX9A5vHr9dUx70
 5DIlgcw0dBoFRD7qoUUH4JrzyAXD26Ynxcxbhm5aJAdMTDNVUXwKDPBn/7XBwt7xqbHCRXPwuY0
 MpmC5KD0DjkUWWE65Oet+j0uCrvjfHbVNrLYh0xohEQBLYnI55+PVh0tPmMLpq33t6EU3Lcj9Ml
 gpDRk4j28jFYlekX0QPtAXGNinSyfYw/ghHXBV/9DiFAGXUU3VuoijfVF6zWxWST6TdT2Y0dG9Q
 GMzDpdlHa4H5gZ130K39rT+BlwL3nIrjAfkH8BbPHjcSE3RoLIBcmEnv2xqtmy90+2SdCUl/kAJ
 Sp1l+zibCzVTU40et50dMQq3zB4JoWgywFLvOAFH99rRECHEU9hvGpU+79KJNK6ZUeN5sQquxY+
 oSUb0PM1mEsVLt/UbGC69AapV7Av0g==
X-Proofpoint-GUID: AL2HuItMdhGjpcqU5DS4Mto2nIiSS-KI
X-Authority-Analysis: v=2.4 cv=YIuSCBGx c=1 sm=1 tr=0 ts=691ff986 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=7gnkTrLSKuvzd49Q8jwA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AL2HuItMdhGjpcqU5DS4Mto2nIiSS-KI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226646

From: Jiaying Song <jiaying.song.cn@windriver.com>

Added a new configure option `--enable-automake-test-format` to enable
Automake-style ptest output format.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...utput-compatible-with-Automake-forma.patch |  52 ---------
 ...tput-compatible-with-Automake-format.patch | 105 ++++++++++++++++++
 meta/recipes-support/icu/icu_77-1.bb          |   4 +-
 3 files changed, 107 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
 create mode 100644 meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch

diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
deleted file mode 100644
index a3d9b46835..0000000000
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f56e295e936c6c6d9c7219ef649697891cd11382 Mon Sep 17 00:00:00 2001
-From: Jiaying Song <jiaying.song.cn@windriver.com>
-Date: Mon, 3 Nov 2025 11:34:06 +0800
-Subject: [PATCH] Make ICU ptest output compatible with Automake format
-
-Change test result format to PASS/FAIL for Automake compatibility
-
-Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3764]
-
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- test/intltest/intltest.cpp | 4 ++--
- tools/ctestfw/ctest.c      | 3 ++-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 33829b0..07071ea 100644
---- a/test/intltest/intltest.cpp
-+++ b/test/intltest/intltest.cpp
-@@ -830,11 +830,11 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
-             saveBaseLoc[0]=0; /* reset path */
-             
-             if (lastErrorCount == errorCount) {
--                snprintf( msg, sizeof(msg),  "   } OK:   %s ", name );
-+                snprintf(msg, sizeof(msg), "PASS: %s\n   }", name);
-                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
-                 lastTestFailed = false;
-             }else{
--                snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
-+                snprintf(msg, sizeof(msg), "FAIL: %s\n   } (ERRORS: %li)", name, static_cast<long>(errorCount - lastErrorCount));
-                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
- 
-                 for(int i=0;i<LL_indentlevel;i++) {
-diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
-index 7634526..727b164 100644
---- a/tools/ctestfw/ctest.c
-+++ b/tools/ctestfw/ctest.c
-@@ -413,9 +413,10 @@ static void iterateTestsWithLevel ( const TestNode* root,
-         ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
- 
-         if (myERROR_COUNT != ERROR_COUNT) {
--          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT, pathToFunction);
-+          log_testinfo_i("\nFAIL: %s\n} ---[ERRORS: %d]", root->name, ERROR_COUNT - myERROR_COUNT);
-           strcpy(ERROR_LOG[ERRONEOUS_FUNCTION_COUNT++], pathToFunction);
-         } else {
-+          log_testinfo_i("\nPASS: %s\n", root->name);
-           if(!ON_LINE) { /* had some output */
-             int spaces = FLAG_INDENT-(depth-1);
-             log_testinfo_i("} %*s[OK] ", spaces, "---");
--- 
-2.34.1
-
diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
new file mode 100644
index 0000000000..484e1c7f6f
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
@@ -0,0 +1,105 @@
+From 4779f798463d673dd74623979ec93141eb60d07a Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Fri, 21 Nov 2025 10:47:59 +0800
+Subject: [PATCH] Make ICU test output compatible with Automake format
+
+Update ICU test output to print each test result in the Automake "simple
+test" format[1]:
+
+result: testname
+
+Where `result` is one of PASS, FAIL, or SKIP.
+
+[1] https://wiki.yoctoproject.org/wiki/Ptest
+
+Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3764]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ configure.ac               | 17 +++++++++++++++++
+ test/intltest/intltest.cpp | 10 +++++++++-
+ tools/ctestfw/ctest.c      |  9 ++++++++-
+ 3 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index da4f170..514fa0c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1165,6 +1165,21 @@ If set, it will REPLACE any automatic list of libraries.],
+ 		*) AC_MSG_ERROR(bad value ${enableval} for --enable-samples) ;;
+ 		esac],
+ 	samples=true)
++
++# Enable Automake-compatible test output format
++AC_ARG_ENABLE([automake-test-format],
++    AS_HELP_STRING([--enable-automake-test-format],
++                   [Generate test output in Automake format (PASS / FAIL: testname) ]),
++    [
++        if test "x$enableval" = "xyes"; then
++            UCONFIG_CPPFLAGS="${UCONFIG_CPPFLAGS} -DU_AUTOMAKE_TEST__FORMAT=1"
++            AC_MSG_RESULT([Automake test format is enabled])
++        else
++            AC_MSG_RESULT([Automake test format is disabled])
++        fi
++    ],
++    [enable_automake_test_format=no])
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
+diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
+index 33829b0..bf3ef56 100644
+--- a/test/intltest/intltest.cpp
++++ b/test/intltest/intltest.cpp
+@@ -830,11 +830,19 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+             saveBaseLoc[0]=0; /* reset path */
+             
+             if (lastErrorCount == errorCount) {
+-                snprintf( msg, sizeof(msg),  "   } OK:   %s ", name );
++            #ifdef U_AUTOMAKE_TEST__FORMAT
++                snprintf(msg, sizeof(msg), "PASS: %s\n   }", name);
++            #else
++                snprintf(msg, sizeof(msg),  "   } OK:   %s ", name );
++            #endif
+                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
+                 lastTestFailed = false;
+             }else{
++            #ifdef U_AUTOMAKE_TEST__FORMAT
++                snprintf(msg, sizeof(msg), "FAIL: %s\n   } (ERRORS: %li)", name, static_cast<long>(errorCount - lastErrorCount));
++            #else
+                 snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
++            #endif
+                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
+ 
+                 for(int i=0;i<LL_indentlevel;i++) {
+diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
+index 7634526..c2e11dd 100644
+--- a/tools/ctestfw/ctest.c
++++ b/tools/ctestfw/ctest.c
+@@ -413,9 +413,16 @@ static void iterateTestsWithLevel ( const TestNode* root,
+         ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
+ 
+         if (myERROR_COUNT != ERROR_COUNT) {
+-          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT, pathToFunction);
++        #ifdef U_AUTOMAKE_TEST__FORMAT
++          log_testinfo_i("\nFAIL: %s\n} ---[ERRORS: %d]", root->name,ERROR_COUNT - myERROR_COUNT);
++        #else
++          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT,pathToFunction);
++        #endif
+           strcpy(ERROR_LOG[ERRONEOUS_FUNCTION_COUNT++], pathToFunction);
+         } else {
++        #ifdef U_AUTOMAKE_TEST__FORMAT
++          log_testinfo_i("\nPASS: %s\n", root->name);
++        #endif
+           if(!ON_LINE) { /* had some output */
+             int spaces = FLAG_INDENT-(depth-1);
+             log_testinfo_i("} %*s[OK] ", spaces, "---");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index 370c14af81..7c9483c975 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -23,7 +23,7 @@ inherit autotools pkgconfig github-releases
 EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
 EXTRA_OECONF:class-native = "--disable-icu-config ac_cv_path_install='install -c'"
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
-
+EXTRA_OECONF:append:class-target = " --enable-automake-test-format"
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
 
@@ -122,7 +122,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch \
            file://0001-test-Add-support-ptest.patch \
            file://run-ptest \
-           file://0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch \
+           file://0001-Make-ICU-test-output-compatible-with-Automake-format.patch \
           "
 
 SRC_URI:append:class-target = "\
-- 
2.34.1


