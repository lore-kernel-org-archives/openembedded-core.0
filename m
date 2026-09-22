Return-Path: <Roopa.Kalmath@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C500C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 06:59:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4411.1790060358649725671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 23:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XrsOIMur;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3725726d7e=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M50hFf3385919
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 23:59:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WUoQOtE+1rcdeOAVK4/M
	J+4UcEKHo+box3NpriLZu8c=; b=XrsOIMur9gQN1iKfXGEhQSKlZTj7Z/6bK6zf
	Bxmp8Mt0HrApxmGOck1IlZATQdBFm5VTR1cBX2FRFJQ5YdrRoQf6mTAAP5kO6wGX
	ipBDOMwziUC8FmeoNYGseD0r9mKY9NHQ/whL+fjT3ZOT0hzh94HFV/6G5G4LLu4V
	z9CVkJJU1kfDGMht+32AHbK2ePQXiF3j7eg76oBxQIMYKkqy2H1HmegUvi9L8QUD
	RxhFJ5SrTMsT9V3PXv7XB+NA+knJt9bYaT7AB0G4VIP9/SBBHavPSP9NNI0o2VFU
	MZvuhbpONFDKaoq9MuHF1OsbxYCGebm0KwvLnQcTYs2Y3IbTBw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021111.outbound.protection.outlook.com [52.101.62.111])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsswe3nce-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 23:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPgLi436YTmEqf5vgbsu0NRCHcqNOCTAvA3oy5H4476GeiEI+OuI6WXvk/QKNJt3ATPHBrIWlCDrDD3hyendSokgTmCFxJslMBj1W7KqIKOMB/pTZPN/wM6WU5nfCEKyaOTuytE/YM00fEEFRU236pen9nzRzWIc+QqWpxNK543ISn0VTf5vftg3OVus0MHc/ZirBtdaa5l6iziX3sejqeLHOrH1IhbVH6DemrO31vXZGeaChy5kqBGghZSXvDfKvKyVHsHoxAEuUgfcF4BovMpbJwg0b1qZv7mzXWbeUWqofNJbgeFbxZtIzDYpqo8uzv+yGhxNQX/Vut/wZQiQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUoQOtE+1rcdeOAVK4/MJ+4UcEKHo+box3NpriLZu8c=;
 b=l+FGcwacB3DsdNMW8xepfunI5mOI2KTij/Yanj4h0dR5J+kc2y3/lxw881JZdOmBjVfglLEb8fPf/rF5AlXE5SMEurOz5SpzalmzdrDdjbIF/HV1Ul7rE8dX3B3lrmhQcKDXnrNI7RThVBIvFAPbDqxzITukIKuIOYJQRlK3IpcNnWxX+8aC7wofGoxhHY0II+yVr3UFs8FDI/oZrFIPCuA58U87EIhezFA96JUktz53xWpQbsmxisHSX+1EVmrqqMAvN+ye9dI32zBV8OwXXzQximV/OPyK+oOXIYaD4Wzp+vbIq/9QpkqVEPw/wF9LusuQ1f2svu+hT9vqFl9S+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by SJ0PR11MB8294.namprd11.prod.outlook.com
 (2603:10b6:a03:478::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:58:38 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 06:58:38 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] qemu: fix CVE-2026-48914
Date: Tue, 22 Sep 2026 12:28:18 +0530
Message-ID: <20260922065818.1354130-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::17) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ec2447-8eb6-4536-0c32-08df1876edb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|13003099007|38350700014|6133799003|10067099003|56012099006|11063799006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bkAEys7TviRSg4CGGRT6r0sVbW5fin2yRRQErXmKqV77m8snC/rwjH9K7vK5Vcxqx8c6Tnws2y1A7I8wh0EQlX9Ki5CQreze32IUjotrV5KVTGpeSDBK8tJg9Iz1RwqsZwLd2iEWeH+3Ym9sEbAqAr2bEFhpPR07Cp3CgSHOSWqBYsD4Gk3ug0xo34xm4SQhPQFoGvbW3nbCDWSdSBHsYkNlefUXkwrljq6w50xt+F8VxPxudvT+sAEWdYH5zekldlKccGFB7arL/0qAtnLQWDu6tRhxcmCGkbPSQwyYlVfXEUFGdHBbiBDNsUKJ0yTIihbZZxPvXtGTBxxr+LKOD2Fx4tCLt0WcuPJZvcN7bdXR3fR0qo7AG0tezGdqvhFtCGANdjZ//6nSXoKYim+JxgkHhQxOnOTyS/FEBqDFP1PrmUUj+SUaPE8jNjcXwKr4LIPIMknvdyRF11vI/jw/YJeEREjZn1eu5LnBDNxH3/GuHTzkT9spA1sz2qt3AC2rHA/iBXA/1klNxvSF4NW8j0+6ej41SXYYZsInvtkkQL1CpKHBZBMRK6cRWgVBwHpRZeNkA338WAM0UFY+oR5OK3rXOq2dFC7RQ93S+dolYn+TRNA9d+HQd7qhEDCAPUA2xrh/1uFRk9Q0pQ4/7li7hIksHD8MzC870KJlEycTNG8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(13003099007)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(12006099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r3CIxFwo6JivMm/DXqyGVxLt9kbQyvCT9QorS+a+Mrz5otvYEXHG3Lfvy1Pa?=
 =?us-ascii?Q?iCSdDbG8XKS8z0E4vj+iFVA/q9kQKO8QIxbDsHLB0awcbP9qkM5lRyTGNj+n?=
 =?us-ascii?Q?j298ZFqfLoRTWsJIIlKlhQJfBdUVkL2Q09BbcIY1LuiFKWhK0i4XkZ8kB9I+?=
 =?us-ascii?Q?HDkxZteQ4WG8xmGMY9ZU6BreE73mzQVGi5FZSbmmxKmnC+Qq49CA61tJCk3j?=
 =?us-ascii?Q?+8qWo6Did2FUUrgUVbAS4fNHfvNJOtP+pM9SRf+TPUSSxYoqGhlC/zlittpv?=
 =?us-ascii?Q?iXD8w6c6p89eAIDTuXewnupI12ndUOuVw9ZHCzsdT2BWV5DZCu4gdjfiCsQB?=
 =?us-ascii?Q?c2m1NU9UFTlgnjQZpQdkQIz4bRKMmGTBh0iWs4XTb/VhLF0+1/ROdUiIwc/0?=
 =?us-ascii?Q?Azz9gc46mJDONhVZnWBIbLIAfXNWGEcp4VYnhDu5XK0CmscTWZ7KtjOIxKjh?=
 =?us-ascii?Q?B857V/7YHZY81Eff2DiE0pVoISXuVfKxpOIwUTByjhRIaSe12XS9jz960YW8?=
 =?us-ascii?Q?UMOOmPnkc9yF4q4hVAwYHcCPnGCF0FGnNHsYvsaJ/gL2Es3c1CfGszv/rykU?=
 =?us-ascii?Q?lJlMSN/33Mxg29Wsx6sXXdA9QU4o4k08PGKUsvlaYi0x+YVeOWYmIqrRwrAG?=
 =?us-ascii?Q?RXILhALD7VbOswF8UJDbs2NRyz6XJjqIMg3ZbnsZYjPy4UWBdLm37N0PLU6G?=
 =?us-ascii?Q?cAX0CblUHSM0rV8ShcWwWWWZti2VPWTJirnYL/Ch5M/FbohOuo0JSowaEN0J?=
 =?us-ascii?Q?227MgVphwvgsm2Tr+tg7bJoaZDgGd+myfLz9rkLRiKtWwbSFEZvOxWecJpQU?=
 =?us-ascii?Q?VJ5p2+15EKtYK0AbicGY2d9JAvljSuNVRWIiuaRffLErWwjSwmqlWX0ifIij?=
 =?us-ascii?Q?0XfdyTUnJg9slB1++gSwYZn7PqzNDkfpnckXsX/lH7spGYk5WuavbmpGGoDK?=
 =?us-ascii?Q?gKKaaql94WbrXRC728GBVi8B90oQ1ceOCn0QQewtG0/E4zyyEPtAu4XC+wuC?=
 =?us-ascii?Q?H2MG8D/KxXaXGqimQCvzPjhLteX2XNbgY7cKP4voV3fjCOieBu+m/oCRPhSg?=
 =?us-ascii?Q?t2e1h7M5iErhXSd1KWZmPYYAH4P0hZWKDMRS2N+0bF7jpbL27RKXXeiDOMmz?=
 =?us-ascii?Q?X4VwC+o7+1ZZwx9mVwFka6xeCgmZexIvksUpBp2tH3MDnozt1n6PJU9NrxiB?=
 =?us-ascii?Q?QUUbLdPrKaG+h6dJY88EdKwGXG/81OSTt7wt35VNhW2VVmGLngOnl4SSJGNF?=
 =?us-ascii?Q?MHf/3Lnch3YnQKi9oD9C5cr8Hid9UwXIyPkdlwTgMYb2HouvGkiw7eWP2KIh?=
 =?us-ascii?Q?Gcd9ubqXI4/o9SWlkCy/U3wgmrmMhmZb6yprOY5hN91IOhLhjZtN8KJT9D8A?=
 =?us-ascii?Q?3pZLlzJadeVdC1kLNkOyr8xt6dCfSSW7MLHfHacY6XfRJ/HTYOHtEycUs+JJ?=
 =?us-ascii?Q?F2PGVB4dYsOot+Ct3FKLF7p+vC8rlCntaWg+GAOWNkXdoExeovAosk8xZfeH?=
 =?us-ascii?Q?B6BQvFjmnd/vmM9MEmj6prrb9c1YDuO5NcbCP8Nrgn072z3cF6J6lokGF7Wh?=
 =?us-ascii?Q?vEfW4z37+naJifwwmSaV3CF0AcStZA32PUHkqBpN5gdlaWI0GMr3WshaBagx?=
 =?us-ascii?Q?MX9jhsZsRavtvejbwOrHaCWwNgiuJptTnLbxbPiFs0d0iqcUKR7wHdvVE08T?=
 =?us-ascii?Q?Za1kkUiG/69fNOz/ea5DOlcr29Qq+0baCNW1NDl6mLDsFy4LaBCULBE2lB24?=
 =?us-ascii?Q?HzPFGsla4PJDwlZCZBt9beFmczTk69k=3D?=
X-Exchange-RoutingPolicyChecked: 
	PpxKMMbJm2+JPuCNFkB/5yOlF6zuYSNg9Hl+csbTTvXap0204sWjxwHrplXRANb0teC84uHudNn8W6w0EX6id7QqsA3HPzpPD57quG5QjQ1mh4MYdrTcOtIx20+j9/ar8FtmcNqWSRkqjOhOC3pT7Ycdvbk2+4QedAo8jS0OYqgbm/9vxSapz7x0aDyBRtkMaZ435D4ffRTihp4Bo5ilJi1n3QohgbV0/wOpzo5F9nPu6swZRShdO4E7zREQVMH/317IhTcEs3RZk994oimigbtSGzQnsaVkuGhf2kw5RduXUsqfzvOlBYjb22PzXJ3bbypf3bTRV/LW7zUA8knaZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ec2447-8eb6-4536-0c32-08df1876edb1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:58:38.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AteLj6ynIHqlwdcdlo8Up0FJJ7iY8Ao1KWm5X6xC/mfHh6y0gN4WVGocglBZNpTZbdj1D3ZfqoYGan6ztgFg1JGcuHfzPBPuSB8ALIE7ROs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
X-Proofpoint-GUID: TXwFcOfD2VePXqXvghSRehx13LO9bkT-
X-Authority-Analysis: v=2.4 cv=WLrqzXsR c=1 sm=1 tr=0 ts=6ab22745 cx=c_pps
 a=pLVGl/zQNnluPJXkQhez9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=xNf9USuDAAAA:8 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=9qUTvQc-AAAA:8 a=8LpYHe4znK1Az7-Hv7UA:9
 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22 a=axOgMmt4Ejcwn1cqzmsR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX4OgLEZNC+EII
 BOoYAO0VhBwPMMMg3GH/hUBvgNrWId9SrfhlPiQ3ZHaxpocgGdZwNXwIAoBAu5NNXoF35kYpE6o
 uhrz6QOUwlY1QRBXk19X57eCpT4oXCsaH7RRKcVb0IxRatIQAFx5bv0ZoIi/qyFNeP0XMA0q2pT
 EHnDQYS0Hc2Sd7NHiOfFAP1Jf+EbHP9N3RE4P54XltIyaMrPfAnwLhjv3Lrh1QF50t67NaoebVj
 E4fdfSQJZxsEcpmDNxiBYyPvtp8+Co38e6NQWqRBQlv/wT+HgBJR+CwoyfkZ6M1F9u/SBvM/Oa1
 xp4fT8eDYOtn/dA6cwntRFmI4ODCCwEq8gGmSzIyK3Y4K2J+Lpy2NErrFW78j+8gzmAhtHs8N2c
 bULQHU9LuO6T9qdRSxYGbNYUdhq7KXbGHij45qugB4FVq5q3QZLmiwAPpJuua4UfDhmCM/RcagI
 Heugs9Afxw3bmwliV5Q==
X-Proofpoint-ORIG-GUID: TXwFcOfD2VePXqXvghSRehx13LO9bkT-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX+rkmS3y31gVf
 lBVBrN64VAunCh1nS2mAOBuchHfu0saa2665z7hgrW30vqliQ87tJNVBYN0bZQAitH03N4E/BKY
 9+6wKLcuBYCUj9dBa5Son6P3Oyd90mlOvmRCq6DfD6AUTH/fKArt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246380

flaw was found in QEMU's virtio-blk device. The issue arises
because the device does not properly validate the size of input
descriptors before writing data. A malicious guest with high privileges could
exploit this vulnerability by submitting a malformed virtio-blk SCSI
request, leading to an out-of-bounds write in the host heap memory
and a potential denial of service (DoS) for the QEMU process.

 Reference: [https://nvd.nist.gov/vuln/detail/CVE-2026-48914]

            [https://security-tracker.debian.org/tracker/CVE-2026-48914]

Backport the patch to fix CVE-2026-48914:

            [https://gitlab.com/qemu-project/qemu/-/commit/f5e2c6906cad9a84140e232f2e3eb7a46bf07f62]

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-48914.patch            | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cc8f2ecdfa..6a217cdaeb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
            file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch \
+           file://CVE-2026-48914.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch
new file mode 100644
index 0000000000..e38292d471
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch
@@ -0,0 +1,60 @@
+From f5e2c6906cad9a84140e232f2e3eb7a46bf07f62 Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Tue, 26 May 2026 11:49:57 -0400
+Subject: [PATCH] virtio-blk: add missing VIRTIO_BLK_T_SCSI_CMD size check
+ (CVE-2026-48914)
+
+Check that the iovec containing struct virtio_scsi_inhdr is large enough
+before storing an error value there.
+
+Feifan Qian <bea1e@proton.me> pointed out that this can be used to
+corrupt heap memory when the descriptor uses an MMIO address and a
+length of 1, forcing QEMU to allocate a 1-byte heap bounce buffer.
+virtio_stl_p() stores 4 bytes and therefore corrupts whatever is beyond
+the bounce buffer.
+
+Fixes: CVE-2026-48914
+Fixes: f34e73cd69bd ("virtio-blk: report non-zero status when failing SG_IO requests")
+
+CVE: CVE-2026-48914
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/f5e2c6906cad9a84140e232f2e3eb7a46bf07f62]
+
+Reported-by: Feifan Qian <bea1e@proton.me>
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-ID: <20260526154957.1741622-1-stefanha@redhat.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+(cherry picked from commit aeea0c2804c42f24915467a1e4c70e649e39b8e0)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ hw/block/virtio-blk.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
+index 9cb9f1fb2b..6b92066aff 100644
+--- a/hw/block/virtio-blk.c
++++ b/hw/block/virtio-blk.c
+@@ -199,10 +199,16 @@ static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
+ 
+     /*
+      * The scsi inhdr is placed in the second-to-last input segment, just
+-     * before the regular inhdr.
++     * before the regular inhdr. VIRTIO implementations normally do not rely on
++     * the precise message framing, but legacy implementations did and so we do
++     * too for the legacy virtio-blk SCSI request type.
+      *
+      * Just put anything nonzero so that the ioctl fails in the guest.
+      */
++    if (elem->in_sg[elem->in_num - 2].iov_len != sizeof(*scsi)) {
++        status = VIRTIO_BLK_S_IOERR;
++        goto fail;
++    }
+     scsi = (void *)elem->in_sg[elem->in_num - 2].iov_base;
+     virtio_stl_p(vdev, &scsi->errors, 255);
+     status = VIRTIO_BLK_S_UNSUPP;
+-- 
+GitLab
+
-- 
2.49.1


