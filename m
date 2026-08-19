Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60435C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:58:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1615.1787122714291691157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nZh1sV8E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=269148e14b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6SY0o2313328
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=u8iYfHuv7
	uQEGZeKPH/f16aQmAZoMtgPGePld+UKw54=; b=nZh1sV8EVMdNLatIQduybXD//
	77xu5T96sskqcZnbKO8bCayHEownUEFcOYNlfUtPA5h9FE7LM6Xm8PwUiT8qCfsN
	a6DvfTPBnkdmd84ls0ZZhX64dyiG5SgRZAALgVlCTcuM/iro5ei4XiZJEtFeos9L
	SDALOaUme9BeZsvkIKsx5ZzUdeAT6o8GMut2f6TJ2z+mfpcOnBdQZ0JdWXcatG76
	znlaTcawo7GOPEL8tYtq3tg0IjlHZOXjxgYg0ZT77eaerSzRSKOVt8zbvEtpgsm8
	v29+cZIbrfbOHrk6Dm453w5xtJazQirFxE7r1EVLyD0bJfdYSrtVxnu0kkxIA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020133.outbound.protection.outlook.com [52.101.46.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g4ydmgk1p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 06:58:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If5ICdexZ+xGUszWlxe9vEi8HOR3jJDW9Mj2vkm1DytrradmkhnpmGJrdVIo20S8Sz/+//RujXHWdnjzH49X5QfhZHhdAbNn8LHJ15WiAjIZKl3kNrgtXvdu8z3eFTiOelNYEReiKTQBbK1z9V7LGd+NEoFkGlJ4TQ4+/VF9/968rZT7YD908+0NTwjtYWUxeU69OMgo/bLth8O7qxr7jBMsF3xyaGoGkMwYftawTwWFmBqaSyCEKRQCeCAVtMNEVztrNX/kfKcfhv/i+TzSy3CAgvTiXxX2nMa9XZzyvjOmZolIAcpJfl9dTNsdx1SrdgOAYu6WXpIPa49claZcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8iYfHuv7uQEGZeKPH/f16aQmAZoMtgPGePld+UKw54=;
 b=C+OyuFobSIQgmaWSXkPtf7bo0oCDeL1nNO7lyRAsp9QQ1vf+XGXBaWU1T62gnXZ++NZIpziAgmfyZdalqMJcAQgAhq2NmDwgHFLudUih2XSIPgFRo4+rEtliBUuaJuzzXRZY6TlzfMhmK7M0M6w370dco427u0wUuUBLuL06kiJfkAkL7uHrwvg8xjZ4Yyl95UegsnVeEUaASbLdUJYnbZaZOx9VTs/d/CXOAyPPTJ3t2FS+8UqGB1n0SRXVdB0cVNhkplxKr3yAvX9Y1xkPb9evLPAZnj7uO5v/EpDc8gqEHLw0ha2pB9jgP0UwqfloZspL+kQQDIePhuq89HEPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 06:58:29 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 06:58:29 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com,
        sowmyasathram12@gmail.com
Subject: [wrynose][PATCH] binutils: stable 2.46 branch updates
Date: Tue, 18 Aug 2026 23:57:48 -0700
Message-ID: <20260819065748.492293-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa86fe1-e091-4c70-29f2-08defdbf45db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|18002099003|3023799007|56012099006|6133799003|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	n70Y+OGC+m2WdHRTv7WBp+kf1v5rapRnWhB4AJRSU2WNS4t+wdaZJuoo7wvyCl5ldjKw3noHWiUPKKoxeD/6FYQUImckEShsVLTRfcUdiZW+cvySppinsq4bzju/Renuw3Cfjv06FnTDpmS9QUY/qLV7QgESJnT/qcLeFLGE0ce15LQDZ5DbwsiKvsRI9PzwtmOlger5wdMnArqOK8YEJyr36U9RZcAm7u/vS+IB8jaE+eJatcINC2OaEy9iGopQtBu/zliKDZtXx42K8A5fSoOLEenQMj50JCQASz1bQL0/e/F66RlxOjwXzAj9/N3wSeU1eykMIYUGUUeEAA5wb1g5Mv21kj6uH+CyQ55O2DaBsfAQry+SZf5Qt4lGwbfjru9Pnwn9GMq8IPFubf3za7iopqiP63BUYoEmzD3ivLIJwOblx2CCGminus/XLmDEVfpxyQRIqzug3Nx62W0w3ny2aMiW3DyhTfH/iD418IZe9NHwq88SaTKDohy2/+0N0y+79MqGw26CojcHZXpMKDuSSmxfdlZtcaz0wEV/tRmwbl8wrl/OKeX5KEWWcgkJNgnErltCtSAV+AQpiiJKlpTBdikNzPBUfBAYrcMrugTxCcWM1gzTDl55KevyOe1ch0lwDIp+LVpntxipuqdqAI5xWI44qTOI4VsaiV0XFgEbp4V9VcJZbNl2c1GkzJQls9MuB6kMcSBMKc+Xi3hWZHMzHDOSznh0+yFtYj9cOK4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(18002099003)(3023799007)(56012099006)(6133799003)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AwRSltMBL4Oq2oX6X8DUnBonn3VSgCnVofAbB9vpmnM+b47GkH0b23iAHLZS?=
 =?us-ascii?Q?Jml7qoZwKHcK9nyepaze4JlxRN+ySi6954N5WVvFKPUnVTCBnsm1p28N6x8u?=
 =?us-ascii?Q?GPLH+LWbituy3N6jqjZCadhtRiadNRy7QFbmAHjWLTM0RKGw+XpiaV83os80?=
 =?us-ascii?Q?9oJY/sSzVH/uGvm/y+3N/JzvKJJ7AYcY1i/0CbkyxitpvPVgdRRN6Jk4Fmqo?=
 =?us-ascii?Q?cFmW/z+4PobiZIUdpx/FJaeDQJCfHJbI8ydUFFRZfcowK/m5WR1sreaecGyF?=
 =?us-ascii?Q?4zS0Bvg+MCQ0phvCQf/QuMslgB3Beu4gW6bdnu5oO4CGK6Q5wc0haXq/t2c8?=
 =?us-ascii?Q?40xiFDaMzRqOmI/D2kBg1mv1FlGHG+84W6kCTw83K50sm/qSTCRybn5ShLUV?=
 =?us-ascii?Q?NcHaUL+wQwTNTCyjF/QO5Uoi8E6PbXpSP3hn5jzjtZoUCjaifoJbkfI5XGjJ?=
 =?us-ascii?Q?7yn18QJdMhy4/5H2pYjy/roYcWZLtBHTBpe8GpOztaiS09XSeMyHEiia1C7f?=
 =?us-ascii?Q?rZFaYPlx2VYM6jlyITZ8boJm1RvyNGLXgtd4E2twxwjUwuN0oCURuOeXxzfp?=
 =?us-ascii?Q?rq2gJpiXsLDNmXkfOrf/DIGoZMoobDEuqok8+lieOcCgvj2w/XCV4xGtLPje?=
 =?us-ascii?Q?dr/56Er0Z6UG+8nb5DsOiCiyrRYMNhQdUTeyyyvHFdazyVbBmCIiDHU9vD2a?=
 =?us-ascii?Q?TbYvn8q/wWOBLgr2iLqJ42Z2bW/2zUi+2zLUqxgt84j1oR0kMhC5ttxzScvD?=
 =?us-ascii?Q?YyXeEzm+7pF/iJhNFjz3zDiI1td48CqIn6FrDI0S910rkWPv9/28QmkygxY7?=
 =?us-ascii?Q?xXmUAMHvPVYUwe2hAPFiUoPSt2U3+oGdIOfR6EskE7Oj7d6s6qfSFOMkmJUY?=
 =?us-ascii?Q?hTLxQuy93rArL9eDsjy2TIqS1RFEV4PRQtxj3rUdI4LScCoyH6GuJEbf4a1a?=
 =?us-ascii?Q?M3R3MKuFrGrYn4xV9i8CUbXj0Az27wqq1ODx6AGJJUjXVs0JHZym16fgJS7m?=
 =?us-ascii?Q?pNXYsPweP6rBZfXa8zOOutWwYfvzKKAq+1jI7AK6ZN1Imev1UbhXICMGLDXr?=
 =?us-ascii?Q?CLhaXEuyV9WPb18Rz6q+iS5BtQ/3uO0URgLh5fPcLIzotLIIpasD3FCtsGrm?=
 =?us-ascii?Q?MUnHOHaLhZjZUMclDm8r7aCeTvKt1ZAb4ML2zQducKEFe/DJcEKmJFJMcMij?=
 =?us-ascii?Q?tTF2wk1sMouZXIb5dgF32HsyGyiB5g/IQQECTPb/PvM0PToTzGUlhZ8zkJzn?=
 =?us-ascii?Q?kH8D2FYev/hPh5ZYu1cMD85bks/s4DUGq4XYoJjcoPRiRASupIv2CtrMgxDs?=
 =?us-ascii?Q?WWlzR70abAQnek+jkbBdbzy5XDGJoKyWKXqdBg88pb5FLIzy9ZsfgjqUAtX/?=
 =?us-ascii?Q?KpdrjsRZF9HABfcPxwBS7oEGCIxT80hHow/l0RyXilJr3TCaikKwUdF3jOQy?=
 =?us-ascii?Q?nOouE/J0hcE52mzTXbLPGSPZE+2yZkpFk8qBdwzxAcMwnVWJKDuBZdQACQNU?=
 =?us-ascii?Q?w/YOXJIrwLSlNByCUNFt486Z5iGbmSQf/OA5ydGjSfoPPFTFXa5b2ICYsstP?=
 =?us-ascii?Q?6EPJKUgYtp4QkVzfKVwWxyFxIavNswnrN0lQeW3PED5Dr5rll48m9S+fLRIk?=
 =?us-ascii?Q?cj84zuP7BRogOtePZB3ervEatH7mM9sxBejD8+5EBb0Z3/eP9C6Qkuewo5++?=
 =?us-ascii?Q?++zJ4iW1eYAjvIZDRpabfy7noPA5tZPbiNqOqATTbnmeNNfsp563ODwHvktY?=
 =?us-ascii?Q?1R4Dzxlso/TAwaqFV2zLmwDj1OHM0CY=3D?=
X-Exchange-RoutingPolicyChecked: 
	e/g5h/RrNzlIHqAsaaxrnH6MRUug/13NWwi22U+83fBpjIlzUHQ6Jzbp5RAD85FnXJ8wjVMY/uZhKXWBBkrE8TzIJtOpk4ZlONdfOT45ZYIug5Ros6QYjkn7/sN1/53nlTwph+ske2BHRxwzakz2mwwVKWZADs2OGJc0ZdTvdCrhi0xyIbJ3Xuo4/1ffrpt4DkJYxtNq9p0MLcB/AKD7Vr8RAG/unldN7JAf1KCQs5R9BA7R2GU1yT2bEZjYM8ASrNJXTZqw3zwyFogUhzPfmtQT/k6pWXInOoY6+Sbyo+6aaBTbXQ6wW2kO4AXDhN+joHFx9sX9jxFtvzQataxy4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa86fe1-e091-4c70-29f2-08defdbf45db
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 06:58:28.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZLHeOHtJIpAc3LBRKjdBHFD83Pr9Q91OqGkOneAeILa8Y4VpaZpp+xkaRcB3y7tNA5spfetc9357K5G8RcuIHa/chYCQavq4JDiRAeM9cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MSBTYWx0ZWRfX4Suk6+4/WsJN
 d98vV6fJDxH4LJI84TuGYXG8YibNecO5utjmPYdL3AmVcm2/OnsBBXi+fIOynGMAdFQUdX/zht5
 Zxycaif9FwW7VQkONq3J9WwTBpOgLB7R1ONPdi04G4+hMphpLTLn
X-Proofpoint-GUID: zRv1uIL4_FW6NSW26RcJGyzPbhg5rxvO
X-Proofpoint-ORIG-GUID: DOxYjoL-NlBxLGaeW5-tpnXoD0TdNoXw
X-Authority-Analysis: v=2.4 cv=PY3PQChd c=1 sm=1 tr=0 ts=6a855418 cx=c_pps
 a=/64aUU06laRl6xO2iYKDkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=X8Q9K1d4A9_ybcI_k0wA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MSBTYWx0ZWRfX4U8dzl2L7x6I
 Sm7MyhlIWeOZ5dQQ1Vj7hiGqJK+Kq2m8LsNMYvdEP4oRy1Mwn025VQV4/iH2qyxORDVCiahnbmw
 n3UmOrZjDv7dm9sQKyqvdgJHHeU6yVg9X7QwyPYkVARP9hO+L7/j79ZmjPwyguKs4kTLnd8P8mx
 tBD8CVRkiQhw9wuzGrQ3eWxX8e8j8+4Dr9nz1IFJ5d+TdhX766BVki/brcFhpZ4QewhlAI5D7uC
 ywGs0k+8fwumzQL3bxtmifdIbjAFiEPV2XgcX+qG//Cry96mdcqxoyXpR33FkCxutqYcZpxAH1q
 VMXLXJmmQZouAGhULLgzimGltAYdwKv3hSzVsEBZ4YQI0uz1MDVgunI5iYrzIQhZTCEFKYiN2RB
 Zj2+OJ58WSZDmUqEvRIfbWSBPaaCwkIoNPenWLk/m2QnmQwMpHZF1+1PDHxWEeBqLJOKvdK4SU2
 ylf1RUncEh7elzvz6dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243715

From: Sowmya Sathram <sowmyasathram12@gmail.com>

Below commits from the binutils-2.46 stable branch are updated
on top of the 2.46.1 release.

046eeeef472 x86: Check XMM destination when optimizing 128-bit VPBROADCASTQ
2c77fbc7007 PR 34204 dlltool SEGVs with --exclude-symbols
38093d82a3e Re-enable development on the 2.46 branch

Test Results:
                                  Before  After  Diff
No. of expected passes            327     327     0
No. of untested testcases           5       5     0
No. of unsupported tests            9       9     0

Signed-off-by: Sowmya Sathram <sowmyasathram12@gmail.com>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index cab270cea5..b00d2bb069 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -23,7 +23,7 @@ CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release co
 CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
 CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
 
-SRCREV ?= "5e56594815854de5eca35c7c04b11705d0f19c02"
+SRCREV ?= "a9c090db342ac76f10bc47258ef8e58f7eaca748"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


