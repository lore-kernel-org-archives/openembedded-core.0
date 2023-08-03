Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E47C00528
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:39:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9881.1691051978342135767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n7HOykHt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7579ef249c=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3736xHHZ015751
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Aug 2023 01:39:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=qbOvJ
	jB7peBQihOD90wlEX+8ZtngNK7B1w/xkefL0GA=; b=n7HOykHtcTk9vK7+QhqXS
	MxcbwVLBVShXIeU3eMYAQ0ie1f/Gj3jUeNzpVvVgon1ROtkUzL5xN6iWUpzePZqK
	MUoHgOur3U/RF37PyvlbLn9IdXd6QPLm0f9lfJTZ5acRfkH8HQLNOC+6rSIfqruf
	RsyklrtORrKI0a/x/S2LUFZlmVETUyB//kLnK2H/h/hb5RcwZnCySPogmfA12gs/
	Ey30IYdtyuVDInhIpvp1jskCJaHH9M6Eff/JwIiMyKHJyBD4MZSfo4GgS2bZyHkY
	pACMIsI6NxOTu5l5Uib7YZYMxlxnp72vrFnZJ4QK2yAfdO5XVUUKH9PI3G00Ckov
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqtyrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 01:39:37 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 01:39:35 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409
Date: Thu, 3 Aug 2023 08:39:10 +0000
Message-ID: <20230803083910.1288886-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: oome4SLW188LY3pVAy59_ktUXR2wMOh2
X-Proofpoint-GUID: oome4SLW188LY3pVAy59_ktUXR2wMOh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_07,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=868 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 08:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185466

Integer overflow vulnerability in pcre2test before 10.41 allows attackers
to cause a denial of service or other unspecified impacts via negative input.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41409

Upstream patches:
https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../libpcre/libpcre2/CVE-2022-41409.patch     | 63 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.40.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
new file mode 100644
index 0000000000..45b6492fcb
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch
@@ -0,0 +1,63 @@
+From: 94e1c001761373b7d9450768aa15d04c25547a3
+From: Philip Hazel <Philip.Hazel@gmail.com>
+Date: Tue Aug 16 17:00:45 2022 +0100
+Subject: [PATCH] Diagnose negative repeat value in pcre2test subject line
+
+drop change in ChangeLog
+
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/94e1c001761373b7d9450768aa15d04c25547a35]
+
+CVE: CVE-2022-41916
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/pcre2test.c      | 4 ++--
+ testdata/testinput2  | 3 +++
+ testdata/testoutput2 | 4 ++++
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/pcre2test.c b/src/pcre2test.c
+index ea52a20..378529a 100644
+--- a/src/pcre2test.c
++++ b/src/pcre2test.c
+@@ -6781,9 +6781,9 @@ while ((c = *p++) != 0)
+       }
+
+     i = (int32_t)li;
+-    if (i-- == 0)
++    if (i-- <= 0)
+       {
+-      fprintf(outfile, "** Zero repeat not allowed\n");
++      fprintf(outfile, "** Zero or negative repeat not allowed\n");
+       return PR_OK;
+       }
+
+diff --git a/testdata/testinput2 b/testdata/testinput2
+index d37d8f3..717ba2a 100644
+--- a/testdata/testinput2
++++ b/testdata/testinput2
+@@ -5932,4 +5932,7 @@ a)"xI
+ /[Aa]{2,3}/BI
+     aabcd
+
++--
++    \[X]{-10}
++
+ # End of testinput2
+diff --git a/testdata/testoutput2 b/testdata/testoutput2
+index ce090f8..d2188d3 100644
+--- a/testdata/testoutput2
++++ b/testdata/testoutput2
+@@ -17746,6 +17746,10 @@ Subject length lower bound = 2
+     aabcd
+  0: aa
+
++--
++    \[X]{-10}
++** Zero or negative repeat not allowed
++
+ # End of testinput2
+ Error -70: PCRE2_ERROR_BADDATA (unknown error number)
+ Error -62: bad serialized data
+--
+2.40.0
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 3843d43b69..e88b9196a0 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -11,6 +11,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+           file://CVE-2022-41409.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-- 
2.40.0


