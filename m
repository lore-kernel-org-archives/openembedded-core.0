Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBEFC7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 07:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33748.1751269485751810560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 00:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92768025dc=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U1vdqc018264
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 07:44:44 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m19jas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 07:44:44 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 30 Jun 2025 00:44:43 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 30 Jun 2025 00:44:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mingetty: fix do_package warning
Date: Mon, 30 Jun 2025 15:44:42 +0800
Message-ID: <20250630074442.474150-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2MSBTYWx0ZWRfXxC43+PSuiYvN vKDRwMl5srJM0oxx47mrVG/anAJ2t92vcfDt0VfhWe7tIWqKy7/Vd0tTZSqNye0a/hEyqgbTZNE QnOVPKCqEOahTWwbeNDkIGPgkwQ2iqKXMxM6DV0nCmTh9V9PFHAH1AFnDFEkD3KAvV+ngFMjLlZ
 tew5KayR3PpWDhkvb8PjlsrcFVQWGXq4Mow7hZAQcGX8b0vnIlC6kazMeSh9q9RnUoq5U9N5HFi WHywpd9bmAd62aMyP+X0vKTBYX+6dY+uiExhF3pX1xuTVij78hHWnAKRVdv8qYq/1Xwn9TActOP 3i/DaMOhh4d+2RGSc072+ZhaQvmXIH4H+5tCNK6uSRf40Giu1bzLyKlFrIlTQPNyKuWL/SgJMor
 USN0kgWoLxvox6PgtNUWBE0rKmfNsDXcw3/PLL5FbJA/Ol5q195WmNz2LKll1PBlgw+lqR3x
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6862406c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=ldkcQDtHugyORtQ5_LEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WVMnJRhmgEigFwJX9EAcsqyM4vUMFSs0
X-Proofpoint-ORIG-GUID: WVMnJRhmgEigFwJX9EAcsqyM4vUMFSs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=574 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506300061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 07:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219455

From: Changqing Li <changqing.li@windriver.com>

Reproduce steps(Under the same project dir):
1. enable DISTRO_FEATURES usrmerge,  bitbake mingetty
2. disable DISTRO_FEATURES usrmerge, bitbake mingetty

Result in step 2:
WARNING: mingetty-1.08-r3 do_package: mingetty: NOT adding alternative provide /usr/sbin/getty: /usr/sbin/mingetty does not exist
WARNING: mingetty-1.08-r3 do_package: QA Issue: mingetty: Files/directories were installed but not shipped in any package:
  /sbin
  /usr/sbin

In step1, Line SBINDIR=/sbin is replaced to SBINDIR=/usr/sbin, in step2,
since do_fetch does not rerun, Makefile still has SBINDIR=/usr/sbin, so
sed not works as expected, SBINDIR still equal to /usr/sbin when disable
usrmerge. And cause above two warnings.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index be059995e7..892233054b 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -15,7 +15,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 CFLAGS='${CFLAGS} -D_GNU_SOURCE'"
 
 do_install(){
-    sed -i -e "s;SBINDIR=/sbin;SBINDIR=$base_sbindir;"  ${S}/Makefile
+    sed -i -e "/^SBINDIR=/c SBINDIR=$base_sbindir"  ${S}/Makefile
     install -d ${D}${mandir}/man8 ${D}/${base_sbindir}
     oe_runmake install DESTDIR=${D}
 }
-- 
2.34.1


