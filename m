Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031B8C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 11:16:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47435.1743074194846459695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 04:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5181cfc623=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R8aID6024246
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:16:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1nvv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:16:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 27 Mar 2025 04:16:30 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] zlib: fix CVE-2014-9485
Date: Thu, 27 Mar 2025 11:16:08 +0000
Message-ID: <20250327111608.3963780-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e53391 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Vs1iUdzkB0EA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=QLcvo1IBAAAA:8 a=PYnjg3YJAAAA:8 a=fXms6y0vAAAA:8
 a=t7CeM3EgAAAA:8 a=vggBfdFIAAAA:8 a=sdZd56HHFjl-pXYmjU0A:9 a=RzNUdsAQ-ru6qNZnpkRj:22 a=c6Zb8eaUoX5VaqycxFvw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: N1V5b9tdgGBYWxZClPRWpDWtIXcoljKU
X-Proofpoint-ORIG-GUID: N1V5b9tdgGBYWxZClPRWpDWtIXcoljKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=964 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213723

From: Divya Chellam <divya.chellam@windriver.com>

Directory traversal vulnerability in the do_extract_currentfile
function in miniunz.c in miniunzip in minizip before 1.1-5 might
allow remote attackers to write to arbitrary files via a crafted
entry in a ZIP archive.

Reference:
https://security-tracker.debian.org/tracker/CVE-2014-9485

Upstream-patch:
https://github.com/madler/zlib/commit/14a5f8f266c16c87ab6c086fc52b770b27701e01

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../zlib/zlib/CVE-2014-9485.patch             | 64 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2014-9485.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2014-9485.patch b/meta/recipes-core/zlib/zlib/CVE-2014-9485.patch
new file mode 100644
index 0000000000..bf575d59f7
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2014-9485.patch
@@ -0,0 +1,64 @@
+From 14a5f8f266c16c87ab6c086fc52b770b27701e01 Mon Sep 17 00:00:00 2001
+From: Matt Wilson <msw@amazon.com>
+Date: Wed, 17 Jan 2024 14:46:18 -0800
+Subject: [PATCH] Neutralize zip file traversal attacks in miniunz.
+
+Archive formats such as .zip files are generally susceptible to
+so-called "traversal attacks". This allows an attacker to craft
+an archive that writes to unexpected locations of the file system
+(e.g., /etc/shadow) if an unspecting root user were to unpack a
+malicious archive.
+
+This patch neutralizes absolute paths such as /tmp/moo and deeply
+relative paths such as dummy/../../../../../../../../../../tmp/moo
+
+The Debian project requested CVE-2014-9485 be allocated for the
+first identified weakness. The fix was incomplete, resulting in a
+revised patch applied here. Since there wasn't an updated version
+released by Debian with the incomplete fix, I suggest we use this
+CVE to identify both issues.
+
+Link: https://security.snyk.io/research/zip-slip-vulnerability
+Link: https://bugs.debian.org/774321
+Link: https://bugs.debian.org/776831
+Link: https://nvd.nist.gov/vuln/detail/CVE-2014-9485
+Reported-by: Jakub Wilk <jwilk@debian.org>
+Fixed-by: Michael Gilbert <mgilbert@debian.org>
+
+CVE: CVE-2014-9485
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/14a5f8f266c16c87ab6c086fc52b770b27701e01]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ contrib/minizip/miniunz.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/contrib/minizip/miniunz.c b/contrib/minizip/miniunz.c
+index 3d65401..479e475 100644
+--- a/contrib/minizip/miniunz.c
++++ b/contrib/minizip/miniunz.c
+@@ -367,6 +367,20 @@ int do_extract_currentfile(uf,popt_extract_without_path,popt_overwrite,password)
+         else
+             write_filename = filename_withoutpath;
+ 
++        if (write_filename[0]!='\0')
++        {
++            const char* relative_check = write_filename;
++            while (relative_check[1]!='\0')
++            {
++                if (relative_check[0]=='.' && relative_check[1]=='.')
++                    write_filename = relative_check;
++                relative_check++;
++            }
++        }
++
++        while (write_filename[0]=='/' || write_filename[0]=='.')
++            write_filename++;
++
+         err = unzOpenCurrentFilePassword(uf,password);
+         if (err!=UNZ_OK)
+         {
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 393ac61e3d..dc8f7c6c85 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
 	    file://CVE-2022-37434.patch \
            file://CVE-2023-45853.patch \
+           file://CVE-2014-9485.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.40.0


