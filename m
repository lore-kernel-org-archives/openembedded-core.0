Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC1AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 01:36:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.39787.1684287373730714287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 18:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rnZlX5Ca;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4501e44b48=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34H1BtuY024345
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:36:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=eND72v9kneMoyet/fIDbDoMrGVdG2EtEYknULu++UKA=;
 b=rnZlX5CaSj/tvI0rBaUxvVtZz4GFq8OT0NcnETq2BzJHgvPXXgYbwy2y32Dou1td5QtI
 7L6+GsanNa9t8zx3PNPxKAOPN8Bdr0RSo373QrDYwOJ5KE5PeOoCuAef67cBixcbsOX1
 Da059TNoa+fs/EnqhLlG6ycjelIbTPyeolwY8bHJ8YPtvtdDuVyQf9X7cO/RBdCKtXgn
 mX9mq70HdYAx4ZLr/kNItr35nnSSbFPZ2A2tKns4/ZvgS1YgIx++sDD9jF65mhBk283r
 utZKTf7QzakvkVkqFItyn3usoGgynOKfAJKTzw5kKZFS5PvG6P5RWh3x2F/eTYgTdcgx dw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj5u2uc04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:36:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 18:36:12 -0700
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 18:36:12 -0700
From: Chi Xu <chi.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] expect: Add ptest support
Date: Wed, 17 May 2023 09:36:11 +0800
Message-ID: <20230517013611.938300-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8cY-Ki5MBdOzwh5d5o1TjezpvLFxatrx
X-Proofpoint-GUID: 8cY-Ki5MBdOzwh5d5o1TjezpvLFxatrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_14,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=75 clxscore=1015
 impostorscore=0 mlxlogscore=583 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181427

Test results:
root@qemux86-64:~# ptest-runner expect
START: ptest-runner
2023-05-17T01:25
BEGIN: /usr/lib64/expect/ptest
via send_stdout
PASS: cat-1.1
PASS: expect-1.1
PASS: expect-1.2
PASS: expect-1.3
PASS: expect-1.4
PASS: expect-1.5
PASS: expect-1.6
PASS: expect-1.7
PASS: expect-1.10
PASS: expect-1.11
PASS: expect-1.12
PASS: expect-1.13
PASS: expect-1.8
PASS: expect-1.8b
PASS: expect-1.9
PASS: logfile-1.1
PASS: pid-1.2
PASS: pid-1.3
PASS: pid-1.4
PASS: pid-1.5
PASS: send-1.1
PASS: send-1.2
PASS: spawn-1.1
PASS: spawn-1.2
PASS: spawn-1.3
PASS: spawn-1.4
PASS: spawn-1.5
PASS: stty-1.1
PASS: stty-1.2
DURATION: 17
END: /usr/lib64/expect/ptest
2023-05-17T01:26
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Chi Xu <chi.xu@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 meta/recipes-devtools/expect/expect/run-ptest   | 6 ++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb   | 8 +++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/expect/expect/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index faa9bd6983..da9153b998 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -17,6 +17,7 @@ PTESTS_FAST = "\
     diffutils \
     ethtool \
     expat \
+    expect \
     findutils \
     flex \
     gawk \
diff --git a/meta/recipes-devtools/expect/expect/run-ptest b/meta/recipes-devtools/expect/expect/run-ptest
new file mode 100755
index 0000000000..856c314eaf
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+out_put=`tclsh tests/all.tcl -verbose bpse`
+echo
+echo "${out_put}" | awk '/PASSED|FAILED|SKIPPED/{gsub(/PASSED/,"PASS"); gsub(/FAILED/,"FAIL"); gsub(/SKIPPED/,"SKIP"); if ($NF=="PASS"){print $NF": "$(NF-1)}else{print $NF": "$2}}' | uniq
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 6cb46f334c..7b610b1ff2 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
 DEPENDS += "tcl"
 RDEPENDS:${PN} = "tcl"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives ptest
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-configure.in.patch \
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
+           file://run-ptest \
            "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
@@ -44,6 +45,11 @@ do_install:append() {
         sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+}
+
 # Apparently the public Tcl headers are only in /usr/include/tcl8.6
 # when building for the target and nativesdk.
 TCL_INCLUDE_PATH = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
-- 
2.17.1


