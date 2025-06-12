Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBA5C7113E
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 05:33:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5925.1749706370452373346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 22:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82586972f3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3o8BY013353
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 22:32:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm4xpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 22:32:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 11 Jun 2025 22:32:49 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 11 Jun 2025 22:32:48 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [kirkstone][PATCH] python3-requests: fix CVE-2024-47081
Date: Thu, 12 Jun 2025 13:32:47 +0800
Message-ID: <20250612053247.1280470-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PTj6iqP2qVydMeZNt6uT1Sa4cdXB_AYo
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684a6681 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ZSZUBjdMoCMAKwRz_TgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA0MCBTYWx0ZWRfX7SGE2YFwiWuR sUareuqs2o+oB25DE4izxgWmAGmzJXqMf+2+ApkcCObJUY+syhMOsk6ukJ0iyz0+5r0PdJofNyB qeJnJtBA5oiOauW8/0ZMZAT2EbOgHzBZN7s71oms2IBKLCV2HVhqphBxgLPNgsXhau7nwtmsoek
 7qbjKRcaM5+f0lW43gcTm4dKYKvTVhnwVoeA9lwzDtdw3CUuBEHJ0RrBSGZ82JO15ybuHcVcnq9 Nu0c10YhzdHF5rEFOTw9oN1UKXCEnxMqp+G9P9sx/mMW2oLCrjfLltb1afUea2Qov8wdLF2VkmT H5eC/FoS4O6418Fx15z7ouPPzx0cxy1/dY6ux/vkcneTqUBth5DbxYJILb8A9WYNObTnks2S00t
 +hEb4rIjuKY20MDIKanlt5/WnFvhV+3C9Njr76+hrpJtbh6myt7IclE/al778G8HYEhh4z8i
X-Proofpoint-ORIG-GUID: PTj6iqP2qVydMeZNt6uT1Sa4cdXB_AYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 05:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218479

From: Jiaying Song <jiaying.song.cn@windriver.com>

Requests is a HTTP library. Due to a URL parsing issue, Requests releases prior to 2.32.4 may leak .netrc credentials to third parties for specific maliciously-crafted URLs. Users should upgrade to version 2.32.4 to receive a fix. For older versions of Requests, use of the .netrc file can be disabled with `trust_env=False` on one's Requests Session.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-47081

Upstream patch:
https://github.com/psf/requests/commit/96ba401c1296ab1dda74a2365ef36d88f7d144ef

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-requests/CVE-2024-47081.patch     | 35 +++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch b/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
new file mode 100644
index 0000000000..b2fa344594
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
@@ -0,0 +1,35 @@
+From c664b4415baf1b237a8d74f5e880179e69ee764c Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Wed, 25 Sep 2024 08:03:20 -0700
+Subject: [PATCH] Only use hostname to do netrc lookup instead of netloc
+
+CVE: CVE-2024-47081
+
+Upstream-Status: Backport
+[https://github.com/psf/requests/commit/96ba401c1296ab1dda74a2365ef36d88f7d144ef]
+---
+ requests/utils.py | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/requests/utils.py b/requests/utils.py
+index 153776c7..eae72959 100644
+--- a/requests/utils.py
++++ b/requests/utils.py
+@@ -208,13 +208,7 @@ def get_netrc_auth(url, raise_errors=False):
+             return
+ 
+         ri = urlparse(url)
+-
+-        # Strip port numbers from netloc. This weird `if...encode`` dance is
+-        # used for Python 3.2, which doesn't support unicode literals.
+-        splitstr = b':'
+-        if isinstance(url, str):
+-            splitstr = splitstr.decode('ascii')
+-        host = ri.netloc.split(splitstr)[0]
++        host = ri.hostname
+ 
+         try:
+             _netrc = netrc(netrc_path).authenticators(host)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
index 689a1dffb7..6f7c47abac 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRC_URI += "file://CVE-2023-32681.patch \
             file://CVE-2024-35195.patch \
+            file://CVE-2024-47081.patch \
            "
 
 SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
-- 
2.34.1


