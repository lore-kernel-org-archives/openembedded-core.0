Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5432ECA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 10:27:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6102.1791368860018056486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 03:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=WLjx6lhj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4740c88694=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977kXeS3204082
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Oct 2026 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2u598gxaY
	M8INmF4KNBJye/QanZGwUvMBNQReF8PbAk=; b=WLjx6lhjs03LpKOYkfw/3fefV
	pfEgNTS266bZZSNkGcql2L6fWOHt2JNntJ0EXrr63blmbOwW1XP3q3Iej5W9UYm/
	bchM3mKemUOFChduLjgh73ClOyl8N6bb86/xHm4K1nWcoCZmKc/pi4Ntr89VfMQh
	EHSSq+b1ZHy4ksZFZ/1NQSkbtseathZfvQXEKJe3CBERLaKyU3yl1h+j2ykTlVez
	lb1SnRWsqZvs57tPtWcASG4sAjV6rIX26HPX02eL+Cfc9GmamkL8Fqdir6Q57RIn
	bWhV0jNvJjP27JdUsyXbJZge6yYRbnTjv9kzR1Qy9xcFaMaP8hcS1K5BZf4TA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021110.outbound.protection.outlook.com [52.101.57.110])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h2stpddyy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 10:27:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fi1IazkNy/57xxsqH46VTfT/qrcV5d/jjcgjYYXjTosKcg16/OcpKCSYWiTGBiDMgPxAAaKWcM6Hn3Vc9hjLmbNmA4xV1FM/imfQEmvH3rh0MJOk37UNUUEY3d05O+z8ZdPtNEdkFIzga2gbzBa/uNvOkfvxQT0ZIpHaDCVZQ8aVA452OPtiATpAXW4sgNEUrDcjhsbzf2rAYi/D+Zg9aBz+OCZEc0mT47AN+Gy8x6Qomjael7Tq8u9/2eP7HJyKCo9vfbvq8E986WiXvYV56c+Tti7dFa4zAg2SCKK99kmvaNosqnZIP4CTyyNifMFFo3ZS0iE09EJpJC9KO0ZLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u598gxaYM8INmF4KNBJye/QanZGwUvMBNQReF8PbAk=;
 b=YInm1/wx+phTVisyPFAsNMfyhe17NWFXyE6HCMkuFsWH9HFnQVs8bdxE60uTYYRYpr0UoexasHKwwcNoobhGNiTXQlgLbZYfty2YLxL2uvxQszKEBbZR39QFm/M6Es4W+8USyF0SauaAJgtNMoTE5qbN3t0xSmP9eSt29x2jehB+Qf6FCAE+ywHt07AfHajIS7ztqZZ99Ayg7msS/hcrDeMnuJ/SJW5U/dUJnF4JHGd5qKWNXiY9/X1Rh9uli6SCiMqMZciNdVjIKYPJnSrG+hH6hZvrNpL2Pfb4asq2//l0IiXYoH/1zEAr3wrdD56R6qDHWmmdPj9y/s02/N4Lww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA1PR11MB9852.namprd11.prod.outlook.com (2603:10b6:806:4da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:27:36 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 10:27:35 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [PATCH] gcc: Fix for CVE-2026-102010
Date: Wed,  7 Oct 2026 03:27:11 -0700
Message-ID: <20261007102718.1288681-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SJ2P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::12) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA1PR11MB9852:EE_
X-MS-Office365-Filtering-Correlation-Id: 74742a4f-fc68-40f6-b2b8-08df245d9ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|6133799003|18002099003|10067099003|13003099007|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dS3lDSvZ1Uk4sRUqY510ZuLoUi0x/NrN6q5Q0K+DjBhde8qM/NLHLJbbAG/MdQNB27OcCHLUlwqv8O/+XoJKkhDhDobi5sNiegPt9m0skaTVBlbLNXyO1rjI6dMALJz07OZSx4wT56WTjl339+dEKS1UhAJbmejJW2G+ywp7g9HzRS/mmkKKG+AKwobv7u1IjmYumJSylXdfMdZPawi6niaZt4vakCMxyJD6d7dBUCt0R1zaF1lYGKtN8RNRB1DxM5veJWT6E9aHlEtCMNa/FFb4GI7rSv9EG1JJF3aVtYZUrOf1LxSmrHusqdFhcKjIK5V7JV6ZFoQm1uRHyBAW3oMbxs+nO9ydon9hUG0tTtI5CbJYM9HR4OGIg5SfGt2A8fi/bSDoiIwOkkW+9NxXieSmyn/Kbpi0q9LeftniJ1uoaetfcOl2CFfTaWFPGRvCM/aRq7IW+5PSrG5xKsXKVhylPpDRIguQx6HpRjeDTLy2pDBUJZyHDekitp0ZMRtKuiuMuUNPhdtHm/Uc/HePuaqZ8rOMKDzZsej0DIv6azre5/FiJk/Z/zYZ4/WGIIa4JlzwGV2pRb/7DLenMmpwYTd26EDaA0CXio4v0hv+94luY7z66aYUc1piNV24r5FJHei8vWvThugYYxruMu4zzFHlMjLg5ORzgFxCmQlT96lXuUhmxucXlTM+ikjxSwgd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(13003099007)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v6ryxHZvHS/GLFNlCzp6OOpdiwX5MgJTvr8EOVnZdEjV8FleX9bbAalKuH6t?=
 =?us-ascii?Q?Vx+FOfGKG2lDlfTyY4fu/3ILvHeYn5PdgkzJ8WK+F3OdK/wjMOMAZKPEowa7?=
 =?us-ascii?Q?/y04TtnpapYQ9Yvv70Zl9W5Ofm0naPcsILkBHg+Tg/ch/PlOTWXN48whXsrN?=
 =?us-ascii?Q?5Rxyq0wjelkh7RtL2JgImdj/U8PjsPUrt1ROGJ4qZxMBPAvhZVaxeJcTfqn+?=
 =?us-ascii?Q?/jGceFRbM94wOcCD/tsQPk0xkk74JmqgX6jYpN4FaTdKFyarUrJqSrFZDpB9?=
 =?us-ascii?Q?k/BccNsvkw1iSUChjOj4IwtMedRQDvRhofFbixKkpde8XNjYVr7UjOFhWYaw?=
 =?us-ascii?Q?PGRURMXYt/BWrl4kfzRmuFu+AKjS46bAEQoiU9YXQG814dJ1ore0XGuGaKZg?=
 =?us-ascii?Q?V/1N6H3jYXpyFGvv5VTpkF1IoYMiAt4uqtAOEaIl5mhoVUNlZrywQD6h9IcF?=
 =?us-ascii?Q?OEIRlyOk5zD7I6u1yqZfG0LWcJFPYqrHBPMYxmY3xMLHab8YBl+aAz1KEMCG?=
 =?us-ascii?Q?okB64LV0Mk8PG0ba8FkJg1NuKnb8MvPoMh2eRLdL50ON4eWIGu1haL9HDID1?=
 =?us-ascii?Q?oLTGWJbP45HpM6OSGI3G0VUYmXFFGMFxGgjVcz335pK8DgCLiKLLzw8+JxNm?=
 =?us-ascii?Q?gaee1m/AhwdyIMCYc4r6KzOexf3/JDU8woFGL+0ySMU6n5+v/LXB7kLEeGT0?=
 =?us-ascii?Q?XvNVgljvZgiguca6dCuyVrUWAX9kcVVaUY9baE5SnB9ZpxKvlji3hEJnn76+?=
 =?us-ascii?Q?lDW98GmnUDJSyogsP1IJWzWH6wtRksK/LnKjPvf54V5j0E1/+g/ExFQM9dFy?=
 =?us-ascii?Q?ew8Y5Tkra7Fw2FxpAGAXXphEvLsX2Vej+P2y/jy3hBaHhHW3NOM5NcexBc18?=
 =?us-ascii?Q?w6vDfsitCEVXLNZGMZe7/PrSXB0qq+HftRP2aCFYgihenRgNZALzEUW9QOLC?=
 =?us-ascii?Q?ap38M7Pxq4X6wL0ifvpdbaNY+WZ/Pvp2bcPCBSZYj0VUggH53/EOhBqbCQaW?=
 =?us-ascii?Q?gmCahEvrZSwVWvFBO3WxMRQh+EH0LdSujP7W043nztuJchnDoKbNosmz941i?=
 =?us-ascii?Q?24rT4a8Zmbrf9VB2egVuTWHsc2Ivq1fM778UiwK+8Qtx2yPKeFK/wjyZ2pGN?=
 =?us-ascii?Q?azkjeSGl2VzyAE/TQ/SEUsCVfkTMVfs4YlqwxyyysO9EhCeNtUgmRi3fEw5r?=
 =?us-ascii?Q?lT8rcrmXlEJSOriyIgcQR9PmgAlB83BENcbZW8VNmh2cO56rughco1cmEwQh?=
 =?us-ascii?Q?sXzM+XzSkCN5/g8m7WHmG6f5C+RVwcdT6YgEUacHiyrpuPFxr43GhimAjIEC?=
 =?us-ascii?Q?XzLIOa/RqVopx2VQpmM3rArMjLdfCcLCQAecl2hO+2V4MXK0hS38J4MUshH/?=
 =?us-ascii?Q?naBs58q2NL9ugg0S6MvtT5ENpOF+jUDZ6IU9e+dhysWY2sn1tZAQz1VLobsA?=
 =?us-ascii?Q?g/DWsgBYzhZxDZlf3WAEfk6axCM+jqUQnFmAJm+tna7FhM46bZoOoBkDMzWS?=
 =?us-ascii?Q?sIKzbnhGys5At06uR5V6PyyXWwZSg1UXq2G657DtN1jvYHIpX9h6APNN6qBY?=
 =?us-ascii?Q?uxk3SQbxyfv0/YjbqsM45DglWbjV/dBl0rmNXj3LZDCVgmGR731PUa72DaBQ?=
 =?us-ascii?Q?mt1VDR46eOaNaZ6oq8TKGoI7RRaw8ckbXbPR6yf7U0i3ldY9ecKby4rcddDk?=
 =?us-ascii?Q?1grkVaHnkB4kDSJVI8dFjNh1Qz6vIKIb8L3nbTinZeVq6f7S7ZUb8+PAVNHv?=
 =?us-ascii?Q?fguYsc3OtEXud962MCtomYIB+7u5Kic=3D?=
X-Exchange-RoutingPolicyChecked: 
	qsIMB4ewj+0JaS5kzib7hqnjVJECiMrtSuFJ3mofjz3DGf7D8In+Z8YPDo+Y4ZE0FAGnu0CbA3DBpTs6yMKg9gUPaw6rhMmfzy2ppFXlzg8tAgnt39rdU4TZmtAJZHjTcCss1xKLePNoxsH9QVa4M2o8LJW7+doYg55e7kchMB/MQJNaRiGVbJuHAoLUv8KTCFiDC46wuwKjuJNpStPO7BB5AJZ8NfnVakDbTnEwhz1hthLHhbQb/YioaFurTXuSNzD/oHLdhkOd8nRVICU0+654BEB0yEhsd1/e3McwMfio/BDJyt9o/B91mCAPFn3iDqw6UimrgiN8I+rxnrFmlw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74742a4f-fc68-40f6-b2b8-08df245d9ad0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:27:35.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+S4I7OwHCgaBolPWv/BOLde6Z/fj7IgQbi4t4xZHCDVNVAkq9GR5JjOHdEj6RiUNdqikkXcFOTdMxS6n5HXm5yC5bh+qMf7B8ocS+sOFnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9852
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXzH0qYTdCuBuB
 pa/pIFTytx7siOBXg/bsRRWcCVbG3SmXgtFLXasbM9PyK+A23bd0aersp3T7qHQtFI+WUDbPyLq
 3E9XnxFIqtgMMIWiWDSISELIGIby+5ASwqwW2z1UaHWnBpv5e0olBJls1wGR/c8aXyg5LSljoag
 ZcJRlRGYDLcBqV/MqGsKlF22Lkscuqn22/7GR0l7jkoeMf++QxvqdStRpiIJRl+nGNpQex6V8Xw
 KrcKWW+f6I1EGrKIteu3OVuQ3KT15LbeggWLplfz6WhkbGwz9PMbxR13l0MNu5Wv5RlgRei3tLL
 YTBDWapYLyNPodG3df9AI9pDq1Z8kcwUuGIM+E2HmWJII97/ngz75EN9ilURtYhmBXNHRXiP3XS
 u/ZeJuzDTQyQOVjWR4fQZRvQ6kxk0E2zopdN5aemQ5JBqpa30/fi77Kszs2m7YFAhfd5mN4ChHY
 7hWsjw50uKcCucW0OUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX3ecbIuXC1pxs
 p12ovtixt/OOOXXPYRaRnvWrv/Hk/3/8TpenCyGT6nZPN1nrlLI1gxVseqwJkxOp7qajWH08eYV
 tmE+dgvtulb3Aw0ENwM0THTgl4vLt7AhMaXqzvzr8KBbz8Tr5Vv/
X-Proofpoint-GUID: e2nzgYUL0V58B-72tXadtc11wylhBeJt
X-Authority-Analysis: v=2.4 cv=B7EsQ+tM c=1 sm=1 tr=0 ts=6ac61e9a cx=c_pps
 a=Lukco47usUvZlN+GeMSXkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=hqvBK7wKDtxJH3H6EuoA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: e2nzgYUL0V58B-72tXadtc11wylhBeJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6977kXeS3204082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 10:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247383

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

PR 127656 use-after-free in libstdc++ pbds binary heap erase_if

After reallocating the storage the m_a_entries pointer is left dangling
and the new storage is leaked. Update m_a_entries after reallocation

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-102010
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D127656
https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Daaa8351f4d2e636f9680a=
1f0a8ebc2f0a60611e6

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |  1 +
 .../gcc/gcc/0026-CVE-2026-102010.patch        | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.pa=
tch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-16.2.inc
index 818dea8ac5..3497493619 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -74,6 +74,7 @@ SRC_URI =3D "${BASEURI} \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.p=
atch \
+	   file://0026-CVE-2026-102010.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch b/m=
eta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
new file mode 100644
index 0000000000..407119c076
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
@@ -0,0 +1,71 @@
+From aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: [PATCH] libstdc++: Fix use-after-free in pbds binary heap
+ (CVE-2026-102010) [PR127656]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+After reallocating the storage the m_a_entries pointer is left dangling
+and the new storage is leaked.
+
+libstdc++-v3/ChangeLog:
+
+        PR libstdc++/127656
+        * include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+        (erase_if): Update m_a_entries after reallocation.
+        * testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc:
+        New test.
+
+CVE: CVE-2026-102010
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3Daaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+
+Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ .../detail/binary_heap_/erase_fn_imps.hpp     |  1 +
+ .../regression/priority_queues_erase_if.cc    | 19 +++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/ext/pb_ds/regression/priority=
_queues_erase_if.cc
+
+diff --git a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn=
_imps.hpp b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_i=
mps.hpp
+index 2e70ed5c663..80d2cccbbf0 100644
+--- a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.h=
pp
++++ b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.h=
pp
+@@ -121,6 +121,7 @@ erase_if(Pred pred)
+       entry_pointer new_entries =3D s_entry_allocator.allocate(new_size=
);
+       std::copy(m_a_entries, m_a_entries + left, new_entries);
+       s_entry_allocator.deallocate(m_a_entries, m_actual_size);
++      m_a_entries =3D new_entries;
+       m_actual_size =3D new_size;
+       resize_policy::notify_arbitrary(m_actual_size);
+     }
+diff --git a/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues=
_erase_if.cc b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queue=
s_erase_if.cc
+new file mode 100644
+index 00000000000..30b8452eff9
+--- /dev/null
++++ b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_=
if.cc
+@@ -0,0 +1,19 @@
++// { dg-do run }
++
++// CVE-2026-201020 use-after-free in binary heap erase_if
++
++#include <ext/pb_ds/priority_queue.hpp>
++
++bool is_odd(int v) { return v & 1; }
++
++int main()
++{
++  using __gnu_pbds::priority_queue;
++  using __gnu_pbds::binary_heap_tag;
++  priority_queue<int, std::less<int>, binary_heap_tag> q;
++  q.push(1);
++  q.push(2);
++  q.push(3);
++  q.erase_if(&is_odd);
++  q.clear();
++}
+--=20
+2.49.0
--=20
2.49.0


