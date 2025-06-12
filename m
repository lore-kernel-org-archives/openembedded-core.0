Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94164C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 05:55:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6126.1749707696912894814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 22:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82586972f3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C5A8Vg028411
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 05:54:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2n7pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 05:54:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 11 Jun 2025 22:54:54 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 11 Jun 2025 22:54:53 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH v2] python3-requests: fix CVE-2024-47081
Date: Thu, 12 Jun 2025 13:54:52 +0800
Message-ID: <20250612055452.3029500-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA0MyBTYWx0ZWRfX/aY5ih+581O6 6q4quEg7aeQafRF5x/YrZzUUpktAek6RPEjhxh529T+8x8Z/iasJ6Jm8ijVAx15RP/CuA0XFMa0 xF+zupMsC4gonWl6l+QYXQ/+Cfsgi5HjBddReMyLlNicTB8ZU/dRDxR5CZbUSHhrNl8jO58YJ9q
 sRBdjS9XIvz+YhJLSgX+hO/QGHChLyP/4U0FPsvILY9kGvCQ4LTEzAz+6LE0vh0CWtIPeRI+Pcs jbYbswa1b94xGE0ROdsot5xa4z0MX08lw+TkZMAdDB1nnk9tNx1X1xWbHLVk7VRK11tLGeRYKVm OqR31J8NTPfp1YKP/qDe4iyGqy12M5nWB84/l02huw6KyYQfG2F74iURbYriD+1pN6UMNntqQ+u
 g8VUBxDDtb+S2bOvbeMc6CpIBlPhxTLHSFKzxFZ2o1SucEUZENaliFAZhar3X14qOy/UkMgw
X-Proofpoint-GUID: n-CLhU213JBNv591lesDToXBO2RCLRj8
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684a6baf cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=6y9X05RqG6gjzDZ3HXkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: n-CLhU213JBNv591lesDToXBO2RCLRj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 05:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218481

From: Jiaying Song <jiaying.song.cn@windriver.com>

Requests is a HTTP library. Due to a URL parsing issue, Requests
releases prior to 2.32.4 may leak .netrc credentials to third parties
for specific maliciously-crafted URLs. Users should upgrade to version
2.32.4 to receive a fix. For older versions of Requests, use of the
.netrc file can be disabled with `trust_env=False` on one's Requests
Session.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-47081

Upstream patch:
https://github.com/psf/requests/commit/96ba401c1296ab1dda74a2365ef36d88f7d144ef

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-requests/CVE-2024-47081.patch     | 37 +++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch b/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
new file mode 100644
index 0000000000..1d465cc594
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
@@ -0,0 +1,37 @@
+From c664b4415baf1b237a8d74f5e880179e69ee764c Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Wed, 25 Sep 2024 08:03:20 -0700
+Subject: [PATCH] Only use hostname to do netrc lookup instead of netloc
+
+CVE: CVE-2024-47081
+
+Upstream-Status: Backport
+[https://github.com/psf/requests/commit/96ba401c1296ab1dda74a2365ef36d88f7d144ef]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
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


