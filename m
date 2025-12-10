Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF19D3B9BE
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12533.1765361910275784324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KFijeWXh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4439ea1cec=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6A2Ad128616
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Rwc5IkDtnEJyG/ljeEDzm9p0mkFiASBD4yOdFWaRqjM=; b=
	KFijeWXh7yGfDcx7Si79Odjz2z505dNTFnOhHD7o/wzmrijrYwSst7Exc8Hk3AUw
	/AkDWkyoEYjqMKes1oS77U5mPtAFhgb/a1v8U3cB2RzqrHgDquwr3Qov3cQOTUjG
	d+16EqhzugjEvl/Jm1FYw5Rb8y9vvGGOUw/p2JPlrrXEOC8FWibCC2o2RF3Kujrc
	mcP8a0LVLrZv5LnGVTGGpt92GH2WKKyjzTYzlpAzaULwm73Sgu2LiHCuaSqHU6a+
	DytUlUOcZjT6o7tzDc/eau59cuDIQ7NPBwIudFsVReN6EV3+fqFTWaHlsONH4YAW
	UyeXv9NMX+SYgM8RFyG41g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hrd2b-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7/9YDR4e13+P3n2o3M0wBD33yAm6ddKflNkRniWlC0oQ1CCgOJ9x9ARgFqZezmHpMSMOYn06pCrWcYul2Lr/xt6WXx4L7pVIoPrrNmw041d25p2PofsFE49qOUO620QucniZpwdEmRIyZ2Y1PIs1GyNKS0rgg1TLHbcuMDfgRf7Mp5WqGZ1LxD+PdOxyPSVbBXKfyMNNQaw/mURzl9J8epGEg75y9k7ZgD7soHGYWz/sE+9SvBY7c+kqdTNgMB4Ax28YM0HNu9pNNsAwHjrNTuK2LwJQWEybxDXvf1Zut+9oePZY9Vbajv83Wy/0GUzn2JjfWVuo114GcoRvs6UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwc5IkDtnEJyG/ljeEDzm9p0mkFiASBD4yOdFWaRqjM=;
 b=DGikGZzb/eqO4fiU/Bj1GA47WxJaOFMm3QCe62k5sZhLDL/guXHzVcgZg8GKhcQu6m98WX3NMDSdPd1BWCcYK5TgCeJ6Q69NCtpuGWJo7y9pSWjokyyGEMRjgsKWmkDXdx2a42xtOtrVw9HbfiF6QNM/8GndQ4eVgPVuysdVUeGNEsTFPkVCOqGsdj6cA+Y/wGEOJ3fwGsPOSsB59D86R5emCoeJnmp/Y2QW/+L+jqiCXiG7VO8FSe7/p1R1qvhRmqbHdzcSQhen2MG9Sn1jh1RAyOm9Aa5c4kxjoIX5mwwI6MdLxEpq9b1HXPgH8sNFjTE5SRL8PX3SmhAMJLT/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:18:25 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 10:18:25 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 5/5] rust: Upgrade 1.91.0 -> 1.91.1
Date: Wed, 10 Dec 2025 02:18:03 -0800
Message-ID: <20251210101803.1120711-5-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecdb985-9a82-4d03-c327-08de37d57453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vCdRBcwmabenTbgpJUNQfkrXkIzCWPuFg0ViBJ+q8hRwlqlySFOExnX8kAqY?=
 =?us-ascii?Q?9crh05wEk8cCBdCCmxEBe+qu4ATLQGtxi/01KZudejgf683cO9T6zyg7GHdw?=
 =?us-ascii?Q?iL6JvCCa4bb1nbicmLu3dZigT8MZR9f71ZlC2sp/DupmTK1XUm1L0Pso22pd?=
 =?us-ascii?Q?ICbAYGZbDsznU7m0QeYnl4C9l65/TBR9OCcXJJ0LSdYJhRuB2izHgfZjb6/o?=
 =?us-ascii?Q?Vfo+SOmU/TyFvKGUhRYfUSByN/7g9T1S6OvGAiOTGDQ5zZvamKVudxxbUWhm?=
 =?us-ascii?Q?Wiu83rBdLhVm3t3vBv6OWoCfyv2CfLnCmZH5xXKUXd7+nVXPQapZAP0cKwCL?=
 =?us-ascii?Q?IyUk4fATKZvG8lHyGlLqxO/sbO6lasn2WemUw6nfCCl5SxKRdugJh/KOig0Q?=
 =?us-ascii?Q?U7WeYP5UqVW1b3kp7ViTHNge/cD+a0hSj2jWvnKquS85BiFzyR1H6lAqPaVq?=
 =?us-ascii?Q?6fztWlgbz0phrlGfDZxWN1ogYUrrUxuWJTkn02olZrWvD3m8Z5My1RrAriIA?=
 =?us-ascii?Q?ds4sDYSoUf9XNzS9VfXax7hG2YxhhHPO/0jA7fi7vm0KhZFm2IHxqVicnCOC?=
 =?us-ascii?Q?1xTAkv2LtY+uqSr0SOPEWoT0u7cunIdf8A62cU5tC148zedZu5KFQpIEWOgh?=
 =?us-ascii?Q?tvTxZaK0kFhPVkLmzfDnBZZZjFdnBvyL3z+LNQfP37lLqTxLnP+gk66/vjWm?=
 =?us-ascii?Q?zLZ82GEiyzTT25Q9vSLcHxrZi9AHrecj5zwlYSaoFWUpw/qxgWsDqEuXVtSZ?=
 =?us-ascii?Q?0lR1rPR2yKnH34/s3oWr4VO0M2kHXmuN4CipTnhv2huMnQo+T+XB62x+5NAb?=
 =?us-ascii?Q?0ZYdUA0IH3/eDZ4+msTzxsnyM9hpmg/a0/yPPHr4qW77YwGiwZx94vuX1GSl?=
 =?us-ascii?Q?jZkXS1ZZ/S2YN0l8Lh1pQu8jVzF4XUVAfVPP6HyqmmG3OIJr9F0oW/HiCo+4?=
 =?us-ascii?Q?fbZ7RycwFuuSmhe2YYYV8Ft1XS+LXBG9Y8tpJVObxitoO4oaLgpwlO7IIpfW?=
 =?us-ascii?Q?fUr8qmpBoTgK/CsHxKrzAlYXSqapL/eYE+BWUQBNtcECiRiZi2rq09TgRHA1?=
 =?us-ascii?Q?7+P2T9fEtQfqidwc1OvrVvjZs3DEWtoIhRQDZQ3MGCwkWbPzwU5YtljU9KTw?=
 =?us-ascii?Q?uXo/FfgnbdIvBQpH6po9YBjXE+/Dnagfe8XAYmjc2X+C2tnVNbMpEsthOQ/p?=
 =?us-ascii?Q?H/5rSdXnRs3N0NXxy/DxnCRZ6YMebeQNXcbwVXZ1mNq3WsTSsSH65jhMC+kP?=
 =?us-ascii?Q?qrgnpjG5rmWt45sz+VfR5lWBDkzkHuUxrQCgY/kehBHS4/cVKIOCwfS0KQBQ?=
 =?us-ascii?Q?JK2bscwpxYGe4hxaQj86otd+DjHl4Dx/8+LjdYo9jHKQ72fgUnOmD8/nwK8g?=
 =?us-ascii?Q?dg4tpq7QYyfvYCGxtbYgTP3tiqy10GHvhD4sWvPXK/8+Ywv8r1mU4Rf7Av0b?=
 =?us-ascii?Q?zXvuKwxFgS71yXUfIrodZZUpWiOrAbmc4qa19WqERCHa+3J384NaM+tAqGkv?=
 =?us-ascii?Q?59TxqFJ7Z0z8OkTLi4HIHV0d2WGamOw0WVF6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pVXLxWzY7AxMIaLlsWVyHePazbd+/mmjdD37igflQKkeBfuMPXnaU90SGYTZ?=
 =?us-ascii?Q?moDYugf3keIPuGqBXwZXDP87tD3zAXykLQeP1npsNgUwd25pTD1xEtqOw4W9?=
 =?us-ascii?Q?8StONqSo+BGLO0iOJP3YP/YUor7qv+241Uo6dR3xuXi/mDxhKKr+C1Dash8/?=
 =?us-ascii?Q?J7EgH5sENkNiKAsOT+u+syAfZYial0kZ/onf+6cAoBO+mztDgEOymmclM8y0?=
 =?us-ascii?Q?XzhTuAJ8BuwOH/tTDERTiT87O1nOiVKbV7+UdfmsnmRGmEAlauPiKT7AEnUU?=
 =?us-ascii?Q?8lIOaBlQqDtYXDtriYfucAr5TDRe33XaaBy3xe4xqshZ05u8sl75+/GQgJ0B?=
 =?us-ascii?Q?GxeOjB0ZTsV2VSEdb7AGYRsE8UpyBFrAuVadtDP9zrqakF0YKAHVZxU2fAOd?=
 =?us-ascii?Q?7aXNdOFlRi8pirxeEbQ9lTCIJtVCsPGNjiwUEeP3xtDvdoCQyCeAlLW1cg0V?=
 =?us-ascii?Q?SnjASUSyaXdUSXaLBOky2zS9r80rkqFr9tCOS8vUxRh5bBy+Os+3TaKfjgwv?=
 =?us-ascii?Q?EgkDWZsQICb3TaW1ItTDmNRvewkcMsTslthiR9GGm/bqJHES5YssNKgSFUZ/?=
 =?us-ascii?Q?vG9znOuduks5NXtu6Pr/oocXf6ICU2axbApIdaua+R4vsMWyJjfUzKnEpnTR?=
 =?us-ascii?Q?os3YtW3m4gvhUFglBH9RchirYHWGjjeDZyjzeFhIE0UtEZ7wr4Jy8Hi3mjgz?=
 =?us-ascii?Q?HP17lT81VDIxqiuKR+TljjrJLBblup/qskFkfrGAEmyeZiPlBIYCMWmAfhYS?=
 =?us-ascii?Q?AWxoB0h9IcVN1rDf/cpxKWueFawj+qGAMlRjvWMJREC1YgYeQrBnzGNJMTzF?=
 =?us-ascii?Q?4Ls0hosmsU4/be6RTS1K46gi1avNcDoLLJ95S9fhwW53SedWr/l69iPo06Ac?=
 =?us-ascii?Q?chk5gJ9mQl81V+Gl7Wl2SRvahjd+YAvsmkzaja6Ps9JTZEDyduFRBfTnaalt?=
 =?us-ascii?Q?NV0vDdwL6DpxcNGKvlCCKQXrDoJsGBBhMSt/zAIKmUjYvgI516J5Dmk1dOG1?=
 =?us-ascii?Q?wnej3wmF2ZsnuL+TzpuxeI8pKyLrqIm7hEbSkTPKlkY5937cZtUWmaJ1kKud?=
 =?us-ascii?Q?6iMlxJ9FPiwq+soEj4Stxbiuo3HcYdaacgw9z4dLLNFVlJMTuzHA4mu7T3nU?=
 =?us-ascii?Q?3kaV+oyNB36yh1LR1Tn5iBwFf/XVLKSGZn4N+6+VOj5jJMxYqIfhFoiZdy98?=
 =?us-ascii?Q?k6DgaiLHhlScpzbLeQDzMaA6fOAagS0hLoJjzZj7Ttxf4WgFqQOIlkCcdPr4?=
 =?us-ascii?Q?iM7Oe+2Mb7XVh+wuFoi+8PEoxywioPW1LqjKFUsF37XDbuz2OqH0+exRCFtq?=
 =?us-ascii?Q?W5OJ3rpIc4YpglsnhBQRV/tlkvETq4BH3ugBFNaOoy8gBBeW0/ih4ijcSISp?=
 =?us-ascii?Q?xWgpLAp815LNvMStvKYOjcxi/d2TeYYb5SqLw2vc5T7EO9Xs3GJni3nwjUNr?=
 =?us-ascii?Q?yYXFF1TZUpWN/R5P66ueekOsDcvod43924tc0Gi8OgX0diFw920t5HSTFfAM?=
 =?us-ascii?Q?glAW1j5M17M/xve8SSh1cG9NWbun+KKkepatQl29ipZ5/rpkKz50qrbw8/rV?=
 =?us-ascii?Q?ENogMvBpmtDRi5cpndhMW0/21sVuO1+lEhiLssaYx/Xg93JfCjOII9LfQTAd?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecdb985-9a82-4d03-c327-08de37d57453
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:18:25.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iusgj9QetMaHjigGp8HU8/nSljSZFac37ychAlLoBuXfxAO4lQyjxrVko6L7y2kpRKsFi2HdhfFzowA101QyM1wvyp95YpzOWOzjLi+eZYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NSBTYWx0ZWRfX5pFYo5G6T/Io
 1kx/d5G0nstHfuMhPhgPOtDao9bInLhupa8plPuHTxsX8npAyHqjIT2L4eP41qCpY7qksHVEwsX
 aQQHWAyE/jJy+euToYeOPsqR2lBe96CcVMT+uh8YI0tEyzbmg7tt5Hy6w1QSlRf4t5DR55Lm7w9
 szdnelb+8tLNVWjEpRG4J1MA2xDwb2ulBmRHwonPqDPl4V/UuVKrSOYlA274+wC8txmoiGcyEeR
 BI7ZVPffe92SCpZa3zf5aReSsS67z6F3KlCOXSTLyevt54wYRhAAasRJKfC519VXC75Yjd8uyz+
 ACA6gB9DH5OJAtXFfLu1M60x1a7n7qOVat7xbz3HWBBb6sH0aS4EcH4UA8R+EF7nv19JzlDUlfS
 S2RvIfKhgHhz/qbPmfgtmE6nLJYutA==
X-Proofpoint-ORIG-GUID: OlRHqJbWHOLAZS5hfjWnxykFzeRQV5sU
X-Proofpoint-GUID: OlRHqJbWHOLAZS5hfjWnxykFzeRQV5sU
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693948f5 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=T_XE1fNAp8Y85a0F2esA:9
 a=t0EB5k7lhMAKNYPM:21 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227465

From: Yash Shinde <Yash.Shinde@windriver.com>

https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/

Test results summary:

   rust v1.91.1
   +-----------+--------+---------+
   | Machine   | Passed | Ignored |
   +-----------+--------+---------+
   | arm-32    | 29,968 |  1,510  |
   | arm-64    | 30,071 |  1,447  |
   | x86-32    | 29,985 |  1,489  |
   | x86-64    | 30,229 |  1,247  |
   | riscv-64  | 30,045 |  1,472  |
   +-----------+--------+---------+

   Test results difference (1.91.1 - 1.90):
   +-----------+--------+---------+
   | Machine   | Passed | Ignored |
   +-----------+--------+---------+
   | arm-32    |  +451  |   -19   |
   | arm-64    |  +463  |   -24   |
   | x86-32    |  +477  |   -18   |
   | x86-64    |  +326  |   -28   |
   | riscv-64  |  +461  |   -22   |
   +-----------+--------+---------+

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 meta/recipes-devtools/rust/{cargo_1.91.0.bb => cargo_1.91.1.bb} | 0
 .../rust/{libstd-rs_1.91.0.bb => libstd-rs_1.91.1.bb}           | 0
 ...t-cross-canadian_1.91.0.bb => rust-cross-canadian_1.91.1.bb} | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.91.0.bb => rust_1.91.1.bb}   | 0
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.91.0.bb => cargo_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.91.0.bb => libstd-rs_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.91.0.bb => rust-cross-canadian_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.91.0.bb => rust_1.91.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 01e4c7812b..20acf3524f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.42%"
-RUSTVERSION ?= "1.91.0%"
+RUSTVERSION ?= "1.91.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.91.0.bb b/meta/recipes-devtools/rust/cargo_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.91.0.bb
rename to meta/recipes-devtools/rust/cargo_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.91.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.91.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 562bcbf4c5..f714487428 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,7 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "9b94161dba3aa32192e0e75f7891912d98095ffb86087b07a05af35a0265a938"
+SRC_URI[rust.sha256sum] = "66401bb815e236cc6b2aacbbe23b61b286c1fe27a67902e7c0222cfe77b3dbab"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.91.0.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.91.0.bb
rename to meta/recipes-devtools/rust/rust_1.91.1.bb
-- 
2.49.0


