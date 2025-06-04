Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7987CC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:17:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11198.1749025072812989591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8250c6c08c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5545mdp3025901
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 08:17:52 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t25ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:17:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 01:17:50 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 01:17:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysfsutils: fix my_strncat function
Date: Wed, 4 Jun 2025 16:17:44 +0800
Message-ID: <20250604081744.2068514-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9UvCQwTLBqEpTvxOqtXIR1VEjLpMuPt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2NCBTYWx0ZWRfX9vp8e9yyfRgp 9UGu0YwcJDnQVFuVyAPN+uSsGm3gVZuge2oN2nn8d1zBGQ/1j4VUBpqyFII5dkoSdybDKY3QVFk 49DUpk0Kn8Yg7n4+V89PNHujIVdExW8xM/kUhWdMTpsbwiyQ9qY5SP2/bSs4dR+++rNeYFo7Su5
 FeVonCSmyqXWbvqiYIevts+JmP7xBvc4FOZ8ICSoL4dJ9pd/HNbFR37tWXloJWumKE7xH922GND 6Q01SnBj6hdoBu72pvYcHUlwVH7hE6+MwVJcg3ztn8tXGMNs6kNUBHWuG1rDk8p+V8gbxdMt8dt ZlbbjeMMx8Ps4pWi3s9I3cZntTD+IfbMoTpIz+QRszCs4f/81ScbyBN9z7tc5y0TzvFR783kNkW
 nImoO81LPSqXNzCTKzM/L0tRlD62MFm7A+ANKz8H9BNIJb0H08RLW/cillCCoT+plds3IfvG
X-Proofpoint-GUID: 9UvCQwTLBqEpTvxOqtXIR1VEjLpMuPt_
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=6840012f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=UtV5FjuMAAAA:8 a=xB5c_Pe8wRB33DJVP2MA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ehT88nhQmDs7a44Z_RBH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217845

The bug was introduced by upstream commit [1] where strncat was replaced with
internal my_strncat function, such as:

  char dest[32] = "/sys/devices/platform/axi";
  my_strncat(dest, "/", sizeof(dest) - strlen(dest) - 1);

Will result in dest string being:

  /sys/

and not the expected:

  /sys/devices/platform/axi/

The meaning of the "len" parameter in the my_strncat function is the size limit for
copying characters from "from", not the size limit for "to" after copying. Also,
the "#define safestrcat(to, from) my_strncat(to, from, sizeof(to) - strlen(to) - 1)"
has already imposed a limit on max based on the size of "to". Modify the function
to prevent truncation of content when too many bytes are passed to the my_strcat function.

[1] https://github.com/linux-ras/sysfsutils/commit/0719881cad85f837f039ecb378b823306640902a

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Modify-my_strncat-function.patch     | 34 +++++++++++++++++++
 .../sysfsutils/sysfsutils_2.1.1.bb            |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/sysfsutils/files/0001-Modify-my_strncat-function.patch

diff --git a/meta/recipes-core/sysfsutils/files/0001-Modify-my_strncat-function.patch b/meta/recipes-core/sysfsutils/files/0001-Modify-my_strncat-function.patch
new file mode 100644
index 00000000000..a8a49a80cd3
--- /dev/null
+++ b/meta/recipes-core/sysfsutils/files/0001-Modify-my_strncat-function.patch
@@ -0,0 +1,34 @@
+From a13fc5a57ea7c6b1761bc204cb79d8ce4745f57a Mon Sep 17 00:00:00 2001
+From: songliang <YS.songliang@h3c.com>
+Date: Wed, 4 Jun 2025 15:58:53 +0800
+Subject: [PATCH] Modify "my_strncat" function
+
+The meaning of the "len" parameter in the my_strncat function is the size limit for copying characters from "from", not the size limit for "to" after copying.
+Also, the "#define safestrcat(to, from) my_strncat(to, from, sizeof(to) - strlen(to) - 1)" has already imposed a limit on max based on the size of "to".
+Modify the function to prevent truncation of content when too many bytes are passed to the my_strcat function.
+
+Upstream-Status: Submitted [https://github.com/linux-ras/sysfsutils/pull/30/commits/c2326946c0c2a4206c9b079a9fe25f7f9115295c]
+Signed-off-by: songliang <YS.songliang@h3c.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/sysfs_utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/sysfs_utils.c b/lib/sysfs_utils.c
+index 46e0849..c0176d1 100644
+--- a/lib/sysfs_utils.c
++++ b/lib/sysfs_utils.c
+@@ -375,8 +375,8 @@ char *my_strncat(char *to, const char *from, size_t max)
+ {
+ 	size_t i = 0;
+ 
+-	while (i < max && to[i] != '\0')
++	while (to[i] != '\0')
+ 		i++;
+-	my_strncpy(to+i, from, max-i);
++	my_strncpy(to+i, from, max);
+ 	return to;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index 86cc06a2cdd..d99039b6f8d 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dcc19fa9307a50017fca61423a7d9754 \
                     file://cmd/GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lib/LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=master \
+           file://0001-Modify-my_strncat-function.patch \
+"
 
 SRCREV = "da2f1f8500c0af6663a56ce2bff07f67e60a92e0"
 
-- 
2.34.1


