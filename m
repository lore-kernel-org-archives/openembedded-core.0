Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040ACC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 04:18:06 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.20173.1661401081758584155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 21:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=2VwzchSg;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=5236436b7d=alex.stewart@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27OF4fNq031268
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 23:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=HxbggS8DAstBMuLgXYhkW9nxtH4I/rHq3Inaps+uEPE=;
 b=2VwzchSgOD6YnF7mCT5EwPat+05z5NajtnoTLFGJQgEIAidMCm/kkUtTkCPNdlMrL9g5
 QacbjHqJYwYhZ/izrkR2ArJfJAfKNKh8X2TnEFJRt4G7Z+pQ76XGqBbC6FuArSHBefkj
 z8yBTCNjZCFxr3r1qWdwEq5wX4UzqvE6tVEvzJEwSVs8drQRfNdACGNwXC5HvjZj3903
 sksUkwKaahEDLWfalX9BSCX8faiqQJ2U7/Ktqau/K/QrlHAgasXb0bGensXNDNJkclmZ
 aFrgi6gXqUOEfBqMNkKBRA1W++FdyvGdN6Z0Da6iPN+bCy4XorPDh3yngqScCnN4ZTcW vg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3j5a55abdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 23:18:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+W2V1UiyWw4qGiWddIRCIH5gVcAECjyq1juR71+EgYzWl95SEhJNhS5YB7aOm3Ff0jeipco01iowlfuFy189aN2HJX9+A3xDPN/gTHqUc6Yaxq058pZ5wKxM+1P4/ChBE44/Sd/9zAEHSoYCZYY5Bj+9S5UsrShuN71i8K0dUql+LasIi+3olEGu4rVA7yK+C4cg4xFE0E2CLaB4WgKHtCtfKZ1wAkbsRqlkSfpzsBUmrcneyGjeSqBd/+UlpED/2UgBD0/Y1PljZTp5Lnp9ub/EUzsLiD2OYm6GXUI2Wvx48xfRuW6NchQ34cjuyJ9OYT16TbWJ8bqZvFF0ToXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxbggS8DAstBMuLgXYhkW9nxtH4I/rHq3Inaps+uEPE=;
 b=Y9cCjRZWYRJn8uAjjii3ns0rALV/jafRfkWr4+6niQ+N+UyPVmrblfS/4bQEPLjfgLlIAo5Xj+hk79ktGn/OYsJO/YBn1Z4EbwkWIfAs3JVN2YXCr9sHijTfpHqbHTzlrslLbjSk9px4R3XL4+TLerF3dXadjNNA4nrVDf+vgKzJ/v/9z8yKe97NtEbXFUDVaAINpLZmvnMG6wPMjvCLFtzu8nTOfRRfnYvE20pSk893nOYmGCmzuH/czF9grgr420BFVfL2Zitm/rnk5NCEgxcND/CjRJSsyC1M92GKcbJwSaTPs0KUopc2G4hdFiO9DqNlKkXpmQVVCUdPp/tzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxbggS8DAstBMuLgXYhkW9nxtH4I/rHq3Inaps+uEPE=;
 b=UjgbX3aY+fSOBOYPJR8QXoAPfu/PdV42cjzhUIQwzGfvNvkekCxJmwr0PXcesfvj0ktKerJyP+aw1Hsbyj8d6hjFSvMx9LyNOFzUCH6uONaPZd+S3GdJHrJ6QCg5SFEnBJCySitVp6bEhRJLuaUinyzHVtZFjegUzcKPBL/jnFo=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by DM6PR04MB4938.namprd04.prod.outlook.com (2603:10b6:5:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Thu, 25 Aug
 2022 04:17:58 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d15f:1673:92fc:1cb3]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d15f:1673:92fc:1cb3%4]) with mapi id 15.20.5546.023; Thu, 25 Aug 2022
 04:17:58 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH] maintainers: update opkg maintainer
Date: Wed, 24 Aug 2022 23:17:37 -0500
Message-Id: <20220825041737.815701-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:806:6e::23) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6a2ad59-4407-4c59-c309-08da8650cac4
X-MS-TrafficTypeDiagnostic: DM6PR04MB4938:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i2OcYLO0PdB7DMDlOaeOvmzUdBE56rfhjfTc28lHs8yUxmGoNLKDQ/w67542LJy+eVNleJx2MoD8gtOyorX4x7l3Q28AxhToctp+lzHqGRAUhfGPTUhCUFxBrmlbaxi0z2RMDR3TtS8Jgxi7cKtcT1aca3EhPn53k4mfX+VRvBh+6nTxfuPraRyvZf3mBD+l0TEh8+4I39JyJRV49MMNDTvxAAiH1AS4oyvuzC/cZmSwfBcJB2vRndNOVNNENMvOoJUDhsQFx3eXXoT/hWb4ab7zQbBgAsYexobT9A/9aC82wu7juC3sJAPKK9vgqzAA+DvPc0UGK3kV5QJpHnDYmUHzLdwMgYT4eI2gWVy4UgvV4Oz2HnyLgEE2CIPB/nMZUTdgK3WDAHgjZQ8tQOQY4p0hfIM8Ee/xwecK2EwFKNNCPD3HfouT7jvqyxmKmhIDr8MI3jr23g0TgwJbdoE6ASJAdtouPF2Z8tSfgyrwrVfFjDg19O4LKN5NQ4GZ8nS+EiuHCG+p2p+Apzjfcu7TeqSqEgC3M/Lz58tyTq9O4IQKQuy6+ftb16rtygFQ9PJTYwJx8ZXOhxntXEXNiq7DOBg/LxxupNDRyrAxPNbIhxQEKG2n5m9qyLcZA5oYIKSeNQLyP6tMmdvZs1ApUMshC7j10thvI57GPmsUazv17OXUWfzxzUxwXA8mUFu/U4kJd69LELOK17T11tvPrt2gjqn7EHVOhFNnPd8OHgYwbHpJfoJJTrQnthAwGD9wBWwR0Wwa3/ae/zrnnuDWzBi1VA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39860400002)(6512007)(6666004)(44832011)(26005)(8936002)(15650500001)(6506007)(2906002)(52116002)(5660300002)(186003)(86362001)(36756003)(38350700002)(83380400001)(38100700002)(66556008)(4326008)(41300700001)(66946007)(1076003)(8676002)(2616005)(316002)(478600001)(66476007)(6486002)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D0WlgTA/sd2lkc2OUW1viMuQ2vZg3spzW/KrNkVJYW3cf3aqlAePiYMeShCG?=
 =?us-ascii?Q?bjMBNVgKo/V4s8A1yfFgW2nTq5hxQosz3vYV3RsBjSCXO/17Hn8dDz6TQRLa?=
 =?us-ascii?Q?GMzDVP+qpUysmUQDdfESqQg50s2M41nAf3ppsziJJtH9BcQj2/risrBLr+CD?=
 =?us-ascii?Q?3RxpMOF60uZPL/sFUEVkAc/qOEm7tHvszTx7WesPjCZDgjr1loozMQTQi8K/?=
 =?us-ascii?Q?VAZb4cU/m0NU29yuyoI4XuV6CcBwj0/89zF7PgTdrJN4sNoo1u6aJb5TRtid?=
 =?us-ascii?Q?5SRK3ntvlXM7WdR+XO7g1x0vtTQZS+6pBZ7m3qKeWxgAXCyU+6QmqXY6ZnKi?=
 =?us-ascii?Q?d9LpI69zX4E1fwFJQm5QmkAIAatxAfYmc8fknn7drFdBNJOTOrFVj6M3Xnx/?=
 =?us-ascii?Q?QnmIWiw3OEPYVcyVHXvCK0AO0S0IEakoG592aM+IiqHw8DqVQ0ITfb69qXCR?=
 =?us-ascii?Q?X3UFBXb2Dxvrm0ExZnGw+9vBEXALMPbcPYyBatJkWMt8nWpBvD/eL2pLXxg7?=
 =?us-ascii?Q?bQaCHqHcPlsSI5fcmd3YE6axuVolFV8Ct2pDR9LZpaOK54eBmWXECVCIz/iX?=
 =?us-ascii?Q?WQWk2FkSH4X6epQ6JjYAuQcQeuyxLW7ol9rnYrDnAJYVJ6kED5Lnh299pAKH?=
 =?us-ascii?Q?wrcSQ9J6rd4SCdKymUSWYdMg5mZvuFW5F388L8JaH9eNoJwrxSnS6wsWvlEF?=
 =?us-ascii?Q?vvCXcSsHsvu9Zvjdqv6wHpyPo5NrZBtI5+nMQnYwrGARm/iCZVbSbAEU5hct?=
 =?us-ascii?Q?dIIH05P/ZwafUtRZbm+TvNZNUhc8YDteEFjygJaA2SjESvmoA3o8nr3B/sf5?=
 =?us-ascii?Q?lKlQtdh8mt4gOplBOUl9BH51c3wNS7PoKGf7N9CPqXqbFR1vqVur0ivZhKA+?=
 =?us-ascii?Q?w85LUEG3UEkVOoxKEjXyENS6FhmXACpvTas5Tfk/OBCr+miZD4Vtp2CEHo2T?=
 =?us-ascii?Q?d4ghROzqeDBYym33VNK/5O7uLa4pL14lVcCrMcq0HRsSMirtl/uYzw2q6rzp?=
 =?us-ascii?Q?YrgwolQa51YZrM55QE4U+4ROmevA/Ei9F41XElsFAIQUC1y/SLOvA7cVjwNh?=
 =?us-ascii?Q?FsXC1eWHIljWAyDK9O8V4ImZzNcRX26hUS6hLu2rV8KIesTBEYOu5h8WOGjP?=
 =?us-ascii?Q?okJtXO0JHP/riMBcYoCVi+Wkdrc+hMHtR5IxSPiXPVItllcHsvZJ5mc26d3b?=
 =?us-ascii?Q?dJ/Wc96/d+M8mXUY9u2j3Z9GTNd0iXSV6oau1JVfQ+CkE8yX+yx13+9qxlrm?=
 =?us-ascii?Q?D2S7mQ/rS0RjjHbgn29jWb381ItcF2sdlIYfa7g0CEmTH9YkMI6ewR7e4UkA?=
 =?us-ascii?Q?q+q1WOAxolNop24oo0fXty2fGrVCJiHQArndKgc54/B1HREd976Z+oM4kzNN?=
 =?us-ascii?Q?YondM59fgrtfcg186JzAHzQCLTEPJXkoKCMj94ZKdO8a6xk/GuYwsjN0xH08?=
 =?us-ascii?Q?HKtxVk1PxF6tNk8ZJ6iLzLBVoa8MCwxEKUXnEzWX6Z4/lSSrdFJLB9iFsM/O?=
 =?us-ascii?Q?FWy56T76xbvZXNeQKo5firscSqWm4rdN0N7FSf5EjHQmNFSjlsEgUw2VYe/T?=
 =?us-ascii?Q?n/obg0lbXkn3snYU9iWytpccRiwt8DVWOOlNo7kb?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6a2ad59-4407-4c59-c309-08da8650cac4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 04:17:58.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nImD/LHxv/U+A2l0fuMy5UfmkaZVCVPPa1ecneIu+D5aUZwvj6rQcdAdbxINjwiZmVA283MoAgO/cFywe08zmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4938
X-Proofpoint-GUID: Fben49A5s4zYgOsDmouyJQPQelVFklO7
X-Proofpoint-ORIG-GUID: Fben49A5s4zYgOsDmouyJQPQelVFklO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_02,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208250016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 04:18:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169830

Alex Stewart assumed maintainership of the yocto project's opkg fork,
and opkg recipes, from Alejandro Del Castilo back in Q1 of 2020.

Update maintainership of the opkg recipes.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c0c38dfc165f6a7e9b465a49f57c7cbe928974bb..98e18a1e3469cdecd88b6e09a4676707fa212d00 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -544,10 +544,10 @@ RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-opkg = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER:pn-opkg-arch-config = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER:pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER:pn-opkg-utils = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
+RECIPE_MAINTAINER:pn-opkg = "Alex Stewart <alex.stewart@ni.com>"
+RECIPE_MAINTAINER:pn-opkg-arch-config = "Alex Stewart <alex.stewart@ni.com>"
+RECIPE_MAINTAINER:pn-opkg-keyrings = "Alex Stewart <alex.stewart@ni.com>"
+RECIPE_MAINTAINER:pn-opkg-utils = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-orc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-os-release = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
-- 
2.36.1


