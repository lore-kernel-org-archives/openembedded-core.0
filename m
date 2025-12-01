Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68AED116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 02:33:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11414.1764556431015611520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 18:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VMsirn7j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B11QCr9204739
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Nov 2025 18:33:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=8wDAEeCeU/5QN3XOaUa3
	HB4Rb/jO+ztMSAwgRFr6FjE=; b=VMsirn7jNWZMCbk7Ft+TU8MczC7mm/BpU0BH
	8/ehLyg8fv0N6KupHMfxFv6ayJ/YCt61VlG/xbon6I4NYhOFzRd6QMJYjiIDrhH4
	hHPDHrOICv5gpjvx4koLSq231JP0+b8KWh7/7GGrXA629UuhW0jJemAHOqaoOF7S
	M8FNs62MtPXYwEE9eD5YtE5ACfun0ObyK3Qpb8SldlnLwqUT39XExVYGkXDhlwCC
	N0dZYF/BZkufdHZMrrDhZnQEk377fZ5pDywKi1vDQZz8hgttq69xib+46kTR/tjN
	QFtobrgIhTE9j+yDEvwLUGs1Jpd23NSqiM1ZiUtP0eGa/wsQ+Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mry6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Nov 2025 18:33:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 18:33:49 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 18:33:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
Date: Sun, 30 Nov 2025 18:33:48 -0800
Message-ID: <cover.1764513013.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yy4p1e53tNCbvkAYsEulyeys2jMWA28u
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692cfe8e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VoMByiPvHmU6CFM0x3kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yy4p1e53tNCbvkAYsEulyeys2jMWA28u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDAxOSBTYWx0ZWRfX8nSCYsvMUbF5
 sXicHepR+P1zdTU89KrGdNnXUqMnnYwDDH9Bp6fUOzb48BL5/eOYxQ3jmXN9t3Q7x1OhP9212Rz
 Yw2ZOM6cr/qqojS8/twq/J17PvsylRbdBqLv++yYGfiSdDZ5SsHywCV+U7oGIQK5f4/fY03vniV
 Q3rD3HErrPuQ1mTnTEhz6vWC+ztpqKVCyxSmCZb82WHQYp6gz+XBf+ki1Z6NB9Pyr38vpjllkrk
 h9C/C6XezyXByLjKBiogQ0wCJQYbkW2odTiioQ90D7+BWHqBpof2V923l3tyV11YSNe5LC9bVnA
 pfSYqCT5b6fTTrlzZCeHGA4XHUprLawGdbGarDkr+hst9DbPXM+K/4pBr3L63Cig7EEvFmSEv4p
 bvJj43H7CQUqIbmzDM1luGBzy/Bnvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226952

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit ac7327583aef83fd400190506f3147623de38b68:

  libdrm: upgrade 2.4.125 -> 2.4.128 (2025-11-27 11:03:37 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/e2fsprogs
  https://github.com/robertlinux/yocto/tree/rbt/e2fsprogs

Robert Yang (1):
  e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB

 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.3.bb             |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch

-- 
2.49.0


