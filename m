Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719D4C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 14:35:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9645.1637332542608555714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 06:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=S56nOr2w;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6957fbbf1c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AJCZUQm016606
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 14:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/zjfnTZUFbSl2hl3V/ZeowCPwJiGuHrr4UAIPSI/IqA=;
 b=S56nOr2w/r9TcyNM3sf4IqSk+WHvCyRMbgCIlUhBMP3LsIo2yWqdi6NdCrA0LsfYeXFh
 dKpoXozCfe+48hZ0/j4I4qgIht+MITYNLXAsQijkJ8tVZbib0bQYy7Mn3zHF53aKWAIg
 Tu/PkaxNUtPu0If4YL3ZNSkBZ9LfVuheggMNpi6triZO6UI0FUXAT9NahVmjFdN1aYtl
 7iWcc9EDRkm9xGwowzt6B6cjZwaCXutiUN2kq8PqWFaLFAjAZiPDmBnvI4yA2KPc0rnb
 DCMOZcjtvF5qvgQqacwjGxMPOq/HjABAkypwro6fOAXPc0aL7SedVNpn9omOhoOUyyyx uw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce5u0rbgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 14:35:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGOMOUJ9Y9297fsTXvxx/uQnNv5PT1alFNmBd1h1EOL+G+rFgRZe/K3s/2JTnOVn5mNAVCMuoYDCTNN7ON6xZ/b4lXdBA/bDPomkeKUiK2qgX9f1JccLTnZz6khN6pHgClAYhwxl8y3JVH8Cn/o49w3qfuXPEvTGSdAhO46bAL6a2/rpqDUrHRQpXtYIFvblXsi6Vvdvr6HhRREYtAAE77e8ncmlSIU68HRxT9hqVxqoB1f9+tI8mdX2Zd3Ffc3yl+BlQyzd+/f+NbvRjI/9ct6RD08RSfwDsr4w1ZK2aJAcefqPwdfdh0LHT8eUPo0LL5gcjF03+L5yeip5gfz4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zjfnTZUFbSl2hl3V/ZeowCPwJiGuHrr4UAIPSI/IqA=;
 b=NhZPOt1iMJqQo7zr0khH8KjJozknVbkXgjlNclChPXYTfNCo9RdUI4JpM/GaWU42Q9Zns0j+AX2A9awAMQFm6I+J5GfevJK2PnJn/2lQ5zrGfOxf5tWX3Szwcmc3hAnCQs2igsLoNjNcirsbuFXa+OgazmykFs9pf/VBo89j4Eq1TkHtO8m+gEnQS5vHGsKmmcLdBGEzj2p36XFR3oipE2vrOmweOlcCQU8YQ89YhMRTVqkGisfh1hPwm82tCOPKCzdA0sqLgms+iS6PQCyYw3p4jwq7aOxONFy+ul8ULqW2kQHceJcmO8LcItTjkXiI8eLa58ubLx/lv88T1wHusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Fri, 19 Nov
 2021 14:35:38 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 14:35:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa: fix warnings for append operators combined with +=
Date: Fri, 19 Nov 2021 22:35:27 +0800
Message-Id: <20211119143527.526437-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0061.apcprd03.prod.outlook.com
 (2603:1096:202:17::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR03CA0061.apcprd03.prod.outlook.com (2603:1096:202:17::31) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.10 via Frontend
 Transport; Fri, 19 Nov 2021 14:35:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd77f2f-4999-491b-2ac0-08d9ab69dae7
X-MS-TrafficTypeDiagnostic: CO1PR11MB4899:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4899CAE8D6EE640FFE43C185F99C9@CO1PR11MB4899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SpXP+6ssDA4H53wIHdQJxCTEy0miaiFGm+1DRXuARkus6ZEgsKNJRtm/kucXC15QMkOCLrPPcxQYFQkZGnA2q45fURvKIR2x+p0WC5RlRqEhxpjWFewfqWFGbHuJrf0thwzJR61zqj0AIBaXBZBQr7SjolxwUBNkQRao2fHGUt7lyC9l6x2ExUtxwp1uVd00JiJTz1LJuP1QdZTY2zixZyCDUwDlxtSVlG1+qCJG1hKe2MePYrlMqOf12lY/Zq9wUs5rJglYFivm9dyqgx6W5VQeeDDiO0E+tIBl5Ok1ioJXCmtH4c+W/rIu9gKiJMyEKcIY9ZjF2GuRH0LO5QQQUmj2kISUO91vl+XlYXgLYFsjLiHFd/i3CNAb5QhQUycTgqO9fk+vfbarrphD4uSxYpXpq3ZcFEXf8q9nM/b2nCxbRFnHAA0swWMTARGK8L+QRca/4mcpdkWJ1Uuybl84FjCXaM/uBwsEkKEq4V2HIDUDjtPD0oJ+2vZlmS2YWpZymsAsXjyzhsPhWsWInTk+aQXP8qT2untTr/xsKmNlq4d5K2ww3aGkKRqJwUuPvSbtk6Mah95kSdQdPVanMCwjMDO5bvBALhNch8uMPEMYejik6x0qJV9ewSVc0g/+F5REVfwREWgPTIbIJWRfltS1a3dVXjWwdXD+wAEgEJR5nOAQrHptYHnuKx5SBNfThbT7awLSe/eRlRE0x9/3ePpZ5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(508600001)(956004)(36756003)(2616005)(66476007)(66556008)(6916009)(6506007)(8676002)(52116002)(2906002)(38100700002)(44832011)(66946007)(38350700002)(5660300002)(1076003)(6666004)(6486002)(8936002)(316002)(26005)(83380400001)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sYBeWLLOvoOalxH76qlkyzIoVpAS1S1dxmN49mIW7fXBUzQRkF1/czKPV4i6?=
 =?us-ascii?Q?SPNhSITIGuDLxjR4QSq/YPkRja/zCTSYOtZ+DbmZs1QuLAyAb3ybVuz7mzsB?=
 =?us-ascii?Q?ySYooxUeLQl2dGVu/1quBkQPXXi09v9uv7Kz5+qHPLsTaiUvPkMEh3SOamdt?=
 =?us-ascii?Q?4bM9ENS/qukahA79wsGyPb2e8Uhi7TLfAwu6OlCketEVz3W6mJDVlG4QzKho?=
 =?us-ascii?Q?fXePmZF6/6W9s1ibAaYQzV1iCeJ35HKYYrUacm3E9ADouKdeNufdSGW+l9S4?=
 =?us-ascii?Q?V6yEmvkJ45bDUaru1ltWBGVUmzG/TPgK2fRqcMzblNhm0tzpeE/mgdFZsDnN?=
 =?us-ascii?Q?9OPCZfQyzjemH3YLTXqYT3jNV/I4tfrLJ1ySlQR/VkDaZ6B2oJ9mWCYsK4n2?=
 =?us-ascii?Q?lwuwfXawGkYpeV/GMnARQUNsJTa2jY/7FVzyetBKC+2tVN5BcIqkdtAqyRSF?=
 =?us-ascii?Q?pkgLw5HBjC0fOjyC/SxOymCt+fzUAHLsv3WT1PLUtDWAnAEu9C5J96yZFBPf?=
 =?us-ascii?Q?R37KAoB5OXowdBYmFXOnNN5jicidm0GEvGetOLu2FP0F2sV+v0vnEwLxzkJL?=
 =?us-ascii?Q?r1MZBFX7MwFVsNagvi55baZXlNm7NR8EdwJo599+jlWWF5KWOaaIXSmL0WGG?=
 =?us-ascii?Q?hnAp6GUFfJFe/bvErHg1as1i1c8t4qvhJcn0l780evn9HBlWZuIqwMyUKTXw?=
 =?us-ascii?Q?B+foDPyu+FASvZFvN+8RU6y0OHtPKUiZa4iQ6SgWPN2oIY2+R59pObMt5Qq9?=
 =?us-ascii?Q?OJhVk0VZJkt9FM/2B06o0akP6HfTS60D1j8E2yzVJsPoRd1qQ0KuX2GrfQtz?=
 =?us-ascii?Q?QH9VdKa0C+MMZkuwydwlmnxODa0pgWn2AVUJk1cF86/Z38IJAiqKSiXzn74Z?=
 =?us-ascii?Q?Gdpm+o4S+mraLnYpvIel887AUg0ybnf78zSBdDhQuSDL1YF/U28MjBAzfSBN?=
 =?us-ascii?Q?7ObIcMPmUQ1MdRgc4PHu6f2dqJbC50Rnh1m9mrpadQgJ1/WSbbNNMw8dck7d?=
 =?us-ascii?Q?MW/WtoXIbshm9JIdorrRTzxbc1J4VPMKdaXvTGsYrBJYH87cin1mVWF8MzUS?=
 =?us-ascii?Q?bVmluszgR8qS92uk8fzcKQbG2LaPSRYtfgoTsIehNOsL6o/225l5q3B8P43+?=
 =?us-ascii?Q?yXmW1NxFUm2esetluq5bXejdsismzK8ZEpK0wHu8dv5KcKT75dNkmOxMo0tK?=
 =?us-ascii?Q?ohNcHlocUYofE0Lo8MNmbEerKgxHgF5o59UjEKsuxADkCoLCEvobKJHLhVo0?=
 =?us-ascii?Q?RAeQmKwRp28fVANWfKmm5ZwbSSO13JAB3W0epnFhaIupTFzy3JsAUCweK9tx?=
 =?us-ascii?Q?OsjXMQVvay+TQUtuzPF5RwB8txhoN6Ho9gcTXyOWNGa7qDIeTondWG7Lm8tU?=
 =?us-ascii?Q?IHogr4bFwfbwr08YZ8ugDAnZWrd7epwqw5rJnj+eUJgKerK7nTjc1hONE0r1?=
 =?us-ascii?Q?PsnAS47FDRJbyYbFWUEFIsmLZNxmFOcydjAHphRtR6En4a62jNTrdEDRNYRQ?=
 =?us-ascii?Q?1cFL/UP2CvQiESy9Qsxc+M1m/rEkyZafB0M/vMo/lT08+VY+WTtVRnrKYkDw?=
 =?us-ascii?Q?6/OkjiV8sg269yRx01zCQb3im6u6FgniKUhv7KYHK9VuoZ1coOEStaKA/MZM?=
 =?us-ascii?Q?KVgV8Ub6SB+hSrqNixv2v8g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fd77f2f-4999-491b-2ac0-08d9ab69dae7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 14:35:38.3558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VsMjXfdBd05H0x1cEvfCaB0cBYvTM4ZqgzPdPyVtUhceFdxov1vHke6dYuv6tsuI19NG/3gZ4WLqCiamPTwNIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-Proofpoint-ORIG-GUID: q5GFWbXrOGZEcNLH7gl8rw8gJOR9wUkp
X-Proofpoint-GUID: q5GFWbXrOGZEcNLH7gl8rw8gJOR9wUkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=904 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 14:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158521

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py        | 2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 4d12d1d07d..c69e3fe4ac 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -10,7 +10,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 
 # need some kernel fragments
-# echo "KERNEL_FEATURES:append += \" features\/kernel\-sample\/kernel\-sample.scc\"" >> local.conf
+# echo "KERNEL_FEATURES:append = \" features\/kernel\-sample\/kernel\-sample.scc\"" >> local.conf
 class KSample(OERuntimeTestCase):
     def cmd_and_check(self, cmd='', match_string=''):
         status, output = self.target.run(cmd)
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 12902add94..18f37c6d7d 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -229,7 +229,7 @@ USERADD_GID_TABLES += "files/static-group"
     def test_no_busybox_base_utils(self):
         config = """
 # Enable wayland
-DISTRO_FEATURES:append += "pam opengl wayland"
+DISTRO_FEATURES:append = " pam opengl wayland"
 
 # Switch to systemd
 DISTRO_FEATURES += "systemd"
-- 
2.25.1


