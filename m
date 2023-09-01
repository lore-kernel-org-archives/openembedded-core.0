Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66062CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 11:52:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4246.1693569153142962055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 04:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bsDvPCHr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7608b660db=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 381BO2Zm008881
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Sep 2023 04:52:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=oMtW2
	rg9k+NTuemHIA2fj6v4rRqljOM+N9sEntU19o4=; b=bsDvPCHr6ysEaIeUWtCgZ
	85gbVilh6VgArCJU7Cm7r4RYfZ4rSD9GMxapxOWBMhy5581x2ddGT69TLm/2BfMc
	cnufTmETTksa01h1/eqm2EOmrJAv9m4G5Fcw8la0LubGjhgA/KnewJkIwjJX9Gwh
	bQSOTfwngglI16GcX2xcHCCi/e7F4RwwP2foplLAtT6FRYp1SkpRb4A7ptG+1O1w
	Y8lx+pDl+F/hT9e8OTnbAIHYvxWYC8O0oMXp/ebkCwlabjtXLFNQxF4gePt2xvec
	qMdJRJGBeHtz3t4CCUInSFCHalc78tlAU18nN7V//ylKFwzLC96asrAOc54u1Z1a
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfnh9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:52:32 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 04:52:30 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] gawk: fix CVE-2023-4156
Date: Fri, 1 Sep 2023 11:52:12 +0000
Message-ID: <20230901115212.2617185-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: hXOCHe6An3hgiWoecMZ0EvlfKWL2fItx
X-Proofpoint-ORIG-GUID: hXOCHe6An3hgiWoecMZ0EvlfKWL2fItx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_10,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=634
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309010111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 11:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187004

heap out of bound read in builtin.c

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../gawk/gawk/CVE-2023-4156.patch             | 46 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.1.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
new file mode 100644
index 0000000000..7becfa1dd7
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
@@ -0,0 +1,46 @@
+From 75a02992e0049868d077fda26b32699465de54fc Mon Sep 17 00:00:00 2001
+From: Arnold D. Robbins <arnold@skeeve.com>
+Date: Wed, 3 Aug 2022 15:30:54 +0530
+Subject: [PATCH] gawk: Small bug fix in builtin.c
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]
+CVE: CVE-2023-4156
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ ChangeLog | 6 ++++++
+ builtin.c | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 6b51464..39a5a7f 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2022-08-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++       * builtin.c (format_tree): When collecting positional field widths or
++       precisions, check for wrap around to negative values. Thanks to
++       YU Jiongchi <jcyu.2022@phdcs.smu.edu.sg> for the report.
++
+ 2021-10-27         Arnold D. Robbins     <arnold@skeeve.com>
+
+	* 5.1.1: Release tar ball made.
+diff --git a/builtin.c b/builtin.c
+index d7ba82c..4ee3f3f 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -963,7 +963,10 @@ check_pos:
+					s1++;
+					n0--;
+				}
+-				if (val >= num_args) {
++				// val could be less than zero if someone provides a field width
++                               // so large that it causes integer overflow. Mainly fuzzers do this,
++                               // but let's try to be good anyway.
++                               if (val < 0 || val >= num_args) {
+					toofew = true;
+					break;
+				}
+--
+2.40.0
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.1.1.bb
index fe339805d0..ecc8ca3bd2 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://remove-sensitive-tests.patch \
            file://run-ptest \
+	   file://CVE-2023-4156.patch \
            "
 
 SRC_URI[sha256sum] = "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b744901da15fb4f06bffd"
-- 
2.40.0


