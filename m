Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0DCC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 08:30:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16251.1713169821874938937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 01:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gg/JrM9h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48352763c0=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43F4eq6p024607
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 01:30:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zlhRs
	HCvXHeubOePBtrvTp0xW0cHXF0/47arbsi1vvM=; b=gg/JrM9hkEMCCTn6oY2rq
	YpZPGRLRLftDmGZEKJdj6iuqrXszikUUMm0fk6MFfyWTeH5gvNqb+h/7z+VF97wg
	kDNtZLWv87R1oFERb3SbKyMi4BD7p4smizRPe1SaO3dh5yIwPHTSoARzpWbwkacQ
	zs/bt6PEQnqv5sSNoFom+S/R+kMuYIzrt0AGEYWZKtVnNJK6MhtJIwl00D7bUjEJ
	t35PdQwdAZ8yexN5auGmrkE6qjBY6LANr4gjpOJ38ETCEBXv0ZH/E6OK53HiMYs0
	zyb7/IYye+6DvU/UA+eHr0ZwFUdUJ+9wikubo2c+qGw20ZEIPqADQ/qMtCMNpV/l
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb1193a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 01:30:21 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 15 Apr 2024 01:30:20 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 15 Apr 2024 01:30:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] base.bbclass: make do_fetch depends on PREMIRRORS MIRRORS
Date: Mon, 15 Apr 2024 16:30:19 +0800
Message-ID: <20240415083019.1867284-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: z9N1-BQLFcf-V5PDFgPrMfJyCwyongXK
X-Proofpoint-GUID: z9N1-BQLFcf-V5PDFgPrMfJyCwyongXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_07,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=583 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 08:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198222

From: Changqing Li <changqing.li@windriver.com>

When there are tarballs in local mirror file://, do_fetch will
create symlink under DL_DIR, eg:
pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
after user update path from localmirrorA to localmirrorB, because
do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
be rerun, so the symlink will not update to:
pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorB/pseudo-prebuilt-2.33.tar.xz
then, do_upack will failed since the tarball cannot be found.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 0999b42daa..5094a1540e 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -139,6 +139,7 @@ do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
 do_fetch[network] = "1"
+do_fetch[vardeps] += "PREMIRRORS MIRRORS"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()
-- 
2.25.1


