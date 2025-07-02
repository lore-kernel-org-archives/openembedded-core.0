Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECD7C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:51:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13591.1751421087503913279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9278637eb8=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5621T6q7029973
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 01:51:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1bu69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:51:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 18:51:25 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 1 Jul 2025 18:51:24 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] mingetty: fix do_package warning
Date: Wed, 2 Jul 2025 09:51:23 +0800
Message-ID: <20250702015123.2151893-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAxNCBTYWx0ZWRfX+a8SJ7QZ5tAp NfsRFw1v7w+jzP6XnQ3IatpnTQpuyHqbCP9BXkEwy1NgmKWUhoRUNOLxhMtr4OrgBqA4XwZ+Q2r hdyLgoP2cUeRa8M7KbqpN0RIMa1l7o5ZW6p3lRd9/Hc68/fiqQC01TXMr/UywsCLVqhahghSJw9
 oCp3VrbEPQr/c4qhSsH0j1TEasEO4PBLWOvuCWpMGP8LHp1BSbE6ylquaHhKnAz9rCbpqILIUTm V3bFNlAafSOWsAu+Lnt0MRffVjDjPVSgxizNVS1Wm8UDDhYNctb4lXzVc8CYcCufb6wny1yTk7l gsZ/EDnEbeJibZoZ1SQa32iwOoAUvXI6l4Yet7OsaWYh8RuxF0t8hGnXxDYI7HZnxhkX139hHqf
 /LyZuJaIqQsvldHQazuit3xwbFG5lt1KDLVbtL1sD43sXC44jxcbJstQWK2HMN1p+3JthqN2
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6864909e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=ldkcQDtHugyORtQ5_LEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _zk-A9NBQRJ4cGVd2gwkGr3fRJM0xs2A
X-Proofpoint-ORIG-GUID: _zk-A9NBQRJ4cGVd2gwkGr3fRJM0xs2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=582 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219746

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


