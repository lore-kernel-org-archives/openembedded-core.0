Return-Path: <quic_vudupa@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFE4C369A5
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 06:17:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.2175.1744179470196729518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 23:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=aVVrTELx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: vudupa@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYmv7004647;
	Wed, 9 Apr 2025 06:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wefalQz4+BRm+O70Mj2BTKrgkXFSeWhX0Um
	wK1KZSX0=; b=aVVrTELxOXA0pC+kZVHQA2fjTz6ek2HwzjBWx6gPcXy4dv34iX8
	VjKJCJM/As8f18mgSw8lqAYsYEToJFGNNbOGqN2CPHK8fMSQ4KXYmERxyFuWGjWx
	KR4kQ3X0bCK3Qd8/HImRm9pWR6RtTqSsXZ/+RJaoKCLDbZEU/qDqHP3Wfp08WKa5
	yHdUcOUhpkrpPloEhbkux6kVOO+GqkVP7kaJxpn2J1H8vwcGpJN7V94LJDwP0U9t
	dQlKp/ysV1I7FztfBJPyNjnAkZoJ8TK53tZzcx2n/775NOCxhn101zo25dzZK501
	Zoc3kXAVft3b0YiGuM10l9YkvD+kI8W/VCg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb2cab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:17:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5396HfrT014152;
	Wed, 9 Apr 2025 06:17:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45ue7fvrm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:17:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5396He2j014147;
	Wed, 9 Apr 2025 06:17:40 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (hyd-e160-a01-2-03.qualcomm.com [10.147.154.239])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5396HeIV014144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:17:40 +0000
Received: by hyd-e160-a01-2-03.qualcomm.com (Postfix, from userid 3978420)
	id CFDDC2E24; Wed,  9 Apr 2025 11:47:39 +0530 (IST)
From: Vishwas Udupa <quic_vudupa@quicinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Vishwas Udupa <quic_vudupa@quicinc.com>, Ross Burton <ross.burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [oe-core][scarthgap][PATCH] openssl: rewrite ptest installation
Date: Wed,  9 Apr 2025 11:47:36 +0530
Message-Id: <20250409061736.220872-1-quic_vudupa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UQURJQWzzvcqCIZRwfGuvu-O_LbQz38v
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f61109 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=7CQSdrXTAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8 a=YDXD-FgvT3f8J3329vgA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UQURJQWzzvcqCIZRwfGuvu-O_LbQz38v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 06:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214576


Rewrite (again) the openssl test suite installation.

Depend on and reuse already installed libraries and modules instead of
installing them twice.

Be more selective when installing from the build tree so we don't install
intermediate .c .d .o files.

This further reduces the size of openssl-dbg from ~120MB to ~18MB.

(From OE-Core rev: 8baa0ce7eae65026cb3a784adaf3a4fc724ce9c9)

Upstream-Status: Backport[https://git.yoctoproject.org/poky/commit/?id=76212866402edb947f745f837e3c3b98b3056e58]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76212866402edb947f745f837e3c3b98b3056e58)
Signed-off-by: Vishwas Udupa <quic_vudupa@quicinc.com>

Change-Id: Ifc0e3a019c2abe5142d0f1e359ae5aa33dae1608
---
 .../openssl/openssl/run-ptest                 | 19 ++++--
 .../openssl/openssl_3.2.4.bb                  | 67 +++++++++----------
 2 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index c89ec5afa1..cd29bb1446 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -1,12 +1,19 @@
 #!/bin/sh
 
-set -e
+set -eu
 
-# Optional arguments are 'list' to lists all tests, or the test name (base name
-# ie test_evp, not 03_test_evp.t).
+# Optional arguments are 'list' to lists the tests, or the test name (base name
+# ie test_evp, not 03_test_evp.t). Without any arguments we run all tests.
+
+if test $# -gt 0; then
+    TESTS=$*
+else
+    # Skip test_symbol_presence as this is for developers
+    TESTS="alltests -test_symbol_presence"
+fi
 
 export TOP=.
-# OPENSSL_ENGINES is relative from the test binaries
-export OPENSSL_ENGINES=../engines
+# Run four jobs in parallel
+export HARNESS_JOBS=4
 
-{ HARNESS_JOBS=4 perl ./test/run_tests.pl $* || echo "FAIL: openssl" ; } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+{ perl ./test/run_tests.pl $TESTS || echo "FAIL: openssl" ; } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
index bada192fe9..c4ad80e734 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
@@ -186,44 +186,43 @@ do_install:append:class-nativesdk () {
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
 PTEST_BUILD_HOST_PATTERN = "perl_version ="
-do_install_ptest () {
-	install -d ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
-
-	# Prune the build tree
-	rm -f ${B}/fuzz/*.* ${B}/test/*.*
-
-	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm
-	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
-
-	# For test_shlibload
-	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
-	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
+do_install_ptest() {
+	install -m644 ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	cp -rf ${S}/Configurations ${S}/external ${D}${PTEST_PATH}/
 
 	install -d ${D}${PTEST_PATH}/apps
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-	install -m644 ${S}/apps/*.pem ${S}/apps/*.srl ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
-	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
-
-	install -d ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/loader_attic.so ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
-
-	install -d ${D}${PTEST_PATH}/providers
-	install -m755 ${B}/providers/legacy.so ${D}${PTEST_PATH}/providers
 
-	install -d ${D}${PTEST_PATH}/Configurations
-	cp -rf ${S}/Configurations/* ${D}${PTEST_PATH}/Configurations/
+	cd ${S}
+	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.der -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find util -name \*.p[lm] -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+
+	cd ${B}
+	# Everything but .? (.o and .d)
+	find test -type f -name \*[^.]? -exec install -m755 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.srl -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	install -m755 ${B}/util/*wrap.* ${D}${PTEST_PATH}/util/
+
+	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps/
+	install -m755 ${S}/test/*.pl ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/shibboleth.pfx ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/*.bin ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/dane*.in ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/smcont*.txt ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/ssl_test.tmpl ${D}${PTEST_PATH}/test/
+
+	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm ${D}${PTEST_PATH}/util/wrap.pl
 
-	# seems to be needed with perl 5.32.1
-	install -d ${D}${PTEST_PATH}/util/perl/recipes
-	cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PATH}/util/perl/recipes/
-
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/util/wrap.pl
+	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines/
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines/
+	ln -s ${libdir}/engines-3/loader_attic.so ${D}${PTEST_PATH}/engines/
+	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }
 
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
@@ -250,7 +249,7 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc = "perl"
-RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
+RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines openssl-ossl-module-legacy"
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
-- 
2.25.1


