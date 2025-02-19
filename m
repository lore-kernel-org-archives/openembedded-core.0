Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCF1C021B1
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17772.1739953102881461681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5pUso024311
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:18:22 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00j8q3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:18:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:18:20 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:18:19 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH v2 1/8] u-boot: Fix CVE-2022-30767
Date: Wed, 19 Feb 2025 16:18:12 +0800
Message-ID: <20250219081819.926163-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Tz2ogBvW9WJWj3t5zJ1B-qaK4YqwxqVD
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b593cd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=sfOm8-O8AAAA:8 a=H8iuuqadOsjrvJ7jMj8A:9 a=zQLMK8awuJ6_Hvp-_9Ux:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: Tz2ogBvW9WJWj3t5zJ1B-qaK4YqwxqVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211680

From: Carlos Dominguez <carlos.dominguez@windriver.com>

This patch mitigates the vulnerability identified via CVE-2019-14196.
The previous patch was bypassed/ineffective, and now the vulnerability
is identified via CVE-2022-30767. The patch removes the sanity check
introduced to mitigate CVE-2019-14196 since it's ineffective.
filefh3_length is changed to unsigned type integer, preventing negative
numbers from being used during comparison with positive values during
size sanity checks.

Signed-off-by: Carlos Dominguez <carlos.dominguez@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../u-boot/files/0001-CVE-2022-30767.patch    | 44 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch b/meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch
new file mode 100644
index 0000000000..aee7f05ab4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch
@@ -0,0 +1,44 @@
+From bdbf7a05e26f3c5fd437c99e2755ffde186ddc80 Thr Jun 2 00:00:00 2022
+From: Andrea zi0Black Cappa <zi0Black@protonmail.com>
+Date: Tue, 14 Jun 2022 17:16:00 +0200
+Subject: [PATCH] net: nfs: Fix CVE-2022-30767 (old CVE-2019-14196)
+
+This patch mitigates the vulnerability identified via CVE-2019-14196.
+The previous patch was bypassed/ineffective, and now the vulnerability
+is identified via CVE-2022-30767. The patch removes the sanity check
+introduced to mitigate CVE-2019-14196 since it's ineffective.
+filefh3_length is changed to unsigned type integer, preventing negative
+numbers from being used during comparison with positive values during
+size sanity checks.
+
+CVE: CVE-2019-14196
+
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/bdbf7a05e26f3c5fd437c99e2755ffde186ddc80]
+Signed-off-by: Andrea zi0Black Cappa <zi0Black@protonmail.com>
+Signed-off-by: Carlos Dominguez <carlos.dominguez@windriver.com>
+---
+ net/nfs.c |    4 +---
+ 1 file changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 70d0e08bde..3003f54aac 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -57,7 +57,7 @@ static ulong nfs_timeout = NFS_TIMEOUT;
+ 
+ static char dirfh[NFS_FHSIZE];	/* NFSv2 / NFSv3 file handle of directory */
+ static char filefh[NFS3_FHSIZE]; /* NFSv2 / NFSv3 file handle */
+-static int filefh3_length;	/* (variable) length of filefh when NFSv3 */
++static unsigned int filefh3_length;	/* (variable) length of filefh when NFSv3 */
+ 
+ static enum net_loop_state nfs_download_state;
+ static struct in_addr nfs_server_ip;
+@@ -578,8 +578,6 @@ static int nfs_lookup_reply(uchar *pkt, unsigned len)
+ 		filefh3_length = ntohl(rpc_pkt.u.reply.data[1]);
+ 		if (filefh3_length > NFS3_FHSIZE)
+ 			filefh3_length  = NFS3_FHSIZE;
+-		if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + filefh3_length) > len)
+-			return -NFS_RPC_DROP;
+ 		memcpy(filefh, rpc_pkt.u.reply.data + 2, filefh3_length);
+ 	}
+ 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index c4cfcbca19..cd40ad1a7d 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -7,6 +7,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
                    file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
                    file://0001-fs-squashfs-Use-kcalloc-when-relevant.patch \
+                   file://0001-CVE-2022-30767.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.34.1


