Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A2AC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 20:25:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78347.1783023912460015410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 13:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oIsJDcR8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1643959378=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662Is2HR2446982
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Jul 2026 13:25:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hjtvH+e9c
	FLwmAB/aL4KhWvPupXUXECjzUrNBh8Og64=; b=oIsJDcR85LMkZccBZIroX/Qpm
	/l9z13VRvAJWvh5jHAQEbjQP2NdoHNoduWvTlGTkFUyp3pOqJrqwt8zRQqQ9K9Zn
	fX/tsSW5dvk1MiXDl4KmokhQQ3pB4rmtQd4nF/OWxk7vQ5L8ha1C5P2scFlGVOwO
	44m74A4O2eI3vBY2SFI4D4Gmqg420MkYpR92yc/+LNL8uex+kENoRf3QkvyJ6NmQ
	9QyGPBPk97zRFIavIphCpS0JBiSOcLZZdpAWHJuQQGHTduR4xSizbQZrmbvj651g
	3EkHIQXjb0ZD1qZl0+2PR8NKXJryIJT0Hybtl43+hGmImvHmh2xREICLSVL3g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f29syrd14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrJ7jOHlRdY7dvSDnVe6ykTt8EBLqw9IKFDrFL6VKqZCi9mtqSiSb9bMHKmhqp2HuC2dOAmFZwgZGXwPgO9euP/KkERB4rU5rynqAqoGelgCsLRAushS6PKo1lS6BXHsa8qt0xQOEaQDxCeJ7BVUh2Km3U9p+oi1CMx8uouPZPdZo2T3STcYRDOgg6hkx/6LE1MqTDF6ov/W0z7z8YHfowxxMAc1oFQczqITXgymRJUro//6EWP3RQKn2+R/N8mY6LJVvn436hgR/ZzaJGDpUzZLx+NwZ5tivdUcwVjYgmbH2pmgfV6lfV7VPiqbh5L+tgP44yuiKW79Toyt+IG8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjtvH+e9cFLwmAB/aL4KhWvPupXUXECjzUrNBh8Og64=;
 b=UsLdcM+g0cokP+qFYZInnIuoH2Sq433K9LddpnoDMRhIixAtJ3+hkjxRFEw/52NUtQdAbutE3fxUDPt9o2iPKIChKdMbI2AbnUdTt0sdcHTnHYTGJIV25I58NpJ/qE4qLeYBcd1qLE//2VOLlPBmhlX8/TlKmBU80LFwvG+5I0tqaPT5WUtfIVuY5EH+IaNBVcNtHXWMzIxdwEp60QJkzWAAQET9FfDLtO2XAwXZ2rkCR3frlNnxdJ6FDgUt+EBI+dwAButeQrTK83QxrL/6MYXN9gfUSYRNmhWlye7Xe/WUJCmSMg2IaT5NanZcVKlhpGOWD82WwgreFhF1r5DMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Thu, 2 Jul 2026 20:25:09 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 20:25:08 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][wrynose][PATCH] python3: skiptest tracemalloc_track_race
Date: Thu,  2 Jul 2026 13:24:37 -0700
Message-ID: <20260702202437.1356161-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|CY5PR11MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: a80daa68-7239-4206-75ef-08ded87802ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|11063799006|56012099006|18002099003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	GS5dsn8Dhbt3Fz5iY6dCcEWc3AD7zfHj+z5cuqipFlRKDgM1EtfKai3qoRX68/Revf9z8mJBrT0sEPZj9C4X6Vi7i/iiCFoG6e3eKBsQJGTB6U35XvelkS0PYfoqRn/3mI20dQCl9LaMzrA2tDYAp21UKOo2fSqLxATl8d2wwbsly03ZNfil9G/3RVJk4BJjqCPRKT1UruebIxwSQHBTluua2qYLJ1SuroGKsLiDId9bOshEX8nYbi56+gh1mLfUPC5fCLY5ZnUgftmvZ71U0bDsW6BSXg+lza1uwsHkcKruxubC29C/dHrsxW+GyThh92MVSR/+MXJezYogwpf2/p/hwS9OA0oSZuLjY/gUccv7IZNXB6xO0Ipy6RqwuwsXQCae2BkNwBVnZE8M4im1Cy3P7qB4hy9f3ulue3+V7744Hq3uE7nNSZWQ0bYBgRN+7hJ7TyFofL++/Q+7dBiLwXwdbJCsfNxYioNfiJ+K8tP1puFpefi+Aw7FSfCk+0wMEmXDdh4OX946Ub+Gmc6zyMnzto2rbL9r9zC/gCxD1iK5uH7ZFZAZHn4Ya8tA+WR7AkAwGrv3rQR58ru54nVoFSLGDPjLiWpJp3zzVE1mvlXH4/EBdC8Mba1o/E3Yffp3mXtv+SkmZRbAERnvq9aT3y5vY3znmFHZMswzQHgGsrP4CLzfW9TM+NjFqnyLicYTGqH95Uh4gS0mN3k5+9uOJBCs7ljmoQmy9OH7PRA4nG0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(11063799006)(56012099006)(18002099003)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DeBLKVCcfc8S7imwf9OOc1NhYj+N9tKIQ9V3BiB6YRTBC1SWexDqCJE9sa04?=
 =?us-ascii?Q?sR3gKJQuE3bIq8M/Ztapl/NohcOsRq+ZWqZdQSkEvml8LmT/FyvjV0PGR1Fb?=
 =?us-ascii?Q?z4fAbEEQvX1xLmnweTW4guI4pV77fFnvu85PbCgVBtZn3YFn80Q7JNmgKvGC?=
 =?us-ascii?Q?TZvarEiXKlnkkwDu9nYoREvvT0mvJBFZThZVUVeQgLLIc3dwOupxH2Y60FO9?=
 =?us-ascii?Q?md9HGXI9PdUVW0Wb/ZPbsL/mG93MxQO/fvq305EUCQsWZVQuriLao+l5a3D2?=
 =?us-ascii?Q?ZsJozQTBVir69qrBJodRbaNQYToraIpG7ECGnyW6LmbJsaZR4fEl8SojcCYG?=
 =?us-ascii?Q?8GLpU1pa0T1k5lg5wbx/NGStv+4xuU8mW1IJzXGFzl9/OuiyCH3y9yM1MyG0?=
 =?us-ascii?Q?4IgXGKBaC1Avv6pEMlVtvIaaSca/OBg7zMHg4Xh0Cd5nVeh+9ol4hASX6kef?=
 =?us-ascii?Q?WkHqoZrUbhlG57yNwaGBmSH1e+YhgeXxUplMfvzxdNgHrPBPSo7E8XxPvYTB?=
 =?us-ascii?Q?6oDH5l8FWUIYh9P1ifJYd7eeNRQcbjChiKE7QQxa64tOE79N6UtaJvJn/A+m?=
 =?us-ascii?Q?T4Fn0Hmy2b8XBd8tGG/BcHgH+qEpzLfRplaqH5lIe6MY5k/WruGgq/hgClXy?=
 =?us-ascii?Q?U1CeBE01tVZwInAnol95aPArFgaClrmbXpedzTDIdvK5Vz8fLdRAJUurBPiD?=
 =?us-ascii?Q?gQ/6FfDcMqJXK4+Vj2a+Ne43U4ZHrgcMwLjowtDrwlzBpGWK2YUg1K/ldutY?=
 =?us-ascii?Q?THNHZ8xOj/4yoM/T2dfZYUy9s9Wc2xDTVZB1XWG1wk0VLxvPlPD8JnC0HVhf?=
 =?us-ascii?Q?ZhhDY9s0A7KGMWkfHpIvv9cJXYnogq9NvjiDtXG2G51a0W+qItTZPkf7D5Wn?=
 =?us-ascii?Q?56AN+aREqdwyb/ot9AFwEEwYj9UHqTh9RecLyfz6au0RoI2XOm91pwly8By4?=
 =?us-ascii?Q?zfIdK1OmtLYbNsbM4FMLztLU4BzbbdMOxj6VcuuQ8O9l+xpaxCr1r4JXt3Y9?=
 =?us-ascii?Q?pmh/bnxu/sw+FvFUSkVAyMjgQ5LFybj+gFv81FfcNqZow7/ukiQuCzUpcRCv?=
 =?us-ascii?Q?hFcV4chCa6Itkzxk1AkDG0JEfiy33PofkA9BLA2HKtJ7azWSP0LAz+hb62Iu?=
 =?us-ascii?Q?6mNW1l2lf3jJLS7W6wS/h43FPewe7X4SRUP0vWsq92fccTnKBMsrCrfgImQx?=
 =?us-ascii?Q?LJdlpbMLiYXZ/zzHUzdy3WFA+v45Q+aQpmT6qbjRG/gSqzQ63P8KC3qIs6So?=
 =?us-ascii?Q?60RM+w358yBIGJ8xe05T9wvQupu1cSXXhtk2G0eWYYydXif7/U8qtL+7HAHH?=
 =?us-ascii?Q?IOdxLNsVv41XzCVrG7ryi74qByX/c1Cik4wP0aBcCNsNGJfoKZ6mV6bZQm5L?=
 =?us-ascii?Q?sivcXh3bttCgQGFACb5D7mlkoQ/bwoNlQwb/Rfqe6unEakSGGBVCc+JAdH+o?=
 =?us-ascii?Q?9pNMhyMNbknl/mRN7sbTWotiOkaLzvmavhnFRhQyxVEshKwOgarbVNGMehPq?=
 =?us-ascii?Q?J99bKiNUqND1DGUS3xNhQ/DXkhBdMEFDYios1gbe/kzcicTdDtgEaJl7K7Ui?=
 =?us-ascii?Q?Ya5TiuRRni2utRfWkCtcDga10P1wINP5au5AESWbcBZQRIlr/NKRrQ0ZZrdo?=
 =?us-ascii?Q?IrRIj4NHzwRyaLOpfK+2/bsuFWXx5NwD2vGpvJO7MGh0CagvxqRkoPHkzSiB?=
 =?us-ascii?Q?JGlkDFt+SbXtinpI6fUexzICEUMuzX8DKoVdKvB/Z/sJSrWRehrkxLyPsyNE?=
 =?us-ascii?Q?W4KNzqVqJcuAuuSplLdK7Cl6w0He1oo=3D?=
X-Exchange-RoutingPolicyChecked: 
	Em8AFgazBwaE4tXXk85qlgqTXY6496j79GBYvxm5dkGoBXJ+H00kfpO0WmpMwA2KkI18lEubm394vYH2p5eIDdNNVr9hpDLvU6FDh+Ls8pndwaC8RDGK6UdVpa14A5o/1uwTA9PpRTQ0My9dkN5AQAE72ySyLWUmAFyusLnhU8i/tOfWSvqJKtE9m6si+IZ8NfLVbJzGlvxrdb1aPeWI19svii8HO5TGMem8Tf6RNnO9L5d9f4u6JlX7Aqse+LfqXoSQ5CKqWOzX0/OkRHbhHWDTP8BTkFi2Yc2qHatc75sDqU/Zdmat19vA7TXnUDoV18aAJuy3/HBR1wAltVYmLg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80daa68-7239-4206-75ef-08ded87802ca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 20:25:08.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtt0dUNndwwcQgLLzqM6lLlQ0eIL4zSSVmy5EUd2cUS24p3erRb/F06TRKQj2XsI1BCTo67V8AeGThTGMoA41Iu77lKHOQkJr3CQaUEVO3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
X-Proofpoint-GUID: hOyCuPG7Fek0DLRDI3wLYnK2D82UKqg3
X-Authority-Analysis: v=2.4 cv=HsJG3UTS c=1 sm=1 tr=0 ts=6a46c927 cx=c_pps
 a=c7CpAOS9Jb82g9OYW51qCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=k6MaDOOo0J_rHtjznGwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: hOyCuPG7Fek0DLRDI3wLYnK2D82UKqg3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDIxNCBTYWx0ZWRfXwueZwRVs8zKQ
 3FQN7ZiCW6Gbzo61nXHSOYiOaLNAKvW4flhIE4En3+kmCWihGO3ICWVvOITMSK60k8fK/qU9j4B
 NavfQzQB3fPwkiYeFW9G2M3qfXmUCuUZoUi1aZ8trnKj49QnpWlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDIxNCBTYWx0ZWRfX6JMWiSL8IhJO
 R82j4J8PtdhWZ3Vzxs6EaezTVgUgTAh/sR6U1QQSxcTznGjMKEMX863KDA7Xum1gXG8HDa6RPF/
 rDnx6VzaddGRqPuQf0XyFOwTeD27qx3ozm/B421Prt2wYURHopLY1YasuYfSh0lkSeXzpv0VpZy
 zk9Wh6XSOXKNKFONmfk+e5OiArjKWVD4zYK/HI/3kpPfvj67xYtoemwX2HR+oEEuyob1xDpG//v
 +6C89EyZQzPuaOXlv/iWCV7bimAs1y/oW3N+4wVlkOKYFQfdbuwIVmViTM6+4gDnTllzXab41D+
 2f4efUgWoOz9JzsiEIolFduZRbo4zOUzIrjJp0zxfMivq/mN0I1TC4mBuDVKicIvbjXEtzcOHWl
 ADbsc20lqtFkfToi4+DC2byuV7XQC6dihkG+mk7Do0w9fvZ5dsK4Ze3mPqF+RyuQzIdozgJwMyK
 lem5XNll7XF1UMN08ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020214
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 20:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240069

In python3 ptests, tracemalloc_track_race fails with a segfault.
To avoid ptest failures for now, skip the test.

Fixes [YOCTO #16182]
Upstream Issue: https://github.com/python/cpython/issues/143143

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7504490ba5e6ce0317dd12bdb961542062f05830)
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index ed413dc1fe..fd407c9603 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -253,6 +253,13 @@ do_install:append:class-nativesdk () {
 }
 
 SKIPPED_TESTS = "--ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"
+
+# Fails with segfault
+# Bugzilla YP 16182 (test_tracemalloc_track_race)
+SKIPPED_TESTS += " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
+
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \
-- 
2.49.0


