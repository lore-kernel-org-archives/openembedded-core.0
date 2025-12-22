Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05D2D711D5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 04:34:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74517.1766378068780766447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 20:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q09qK346;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451276127=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM4GUuC977488
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 20:34:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6xgYfqtbWktSKQVip13XK1fK6Dvh0XwqZBWOAf1qOlg=; b=
	q09qK346S0yEsbDNI73WWCLe5KTNet78uz4OwEtc4z3JMdeO/A/I4ihJeI7OhHmz
	SZs7ZDNZfeZz8eCig3nNXV0GjyuDMHJQ+8y8PlvlsIbQ52RHREJl+1gtk0IWgnxF
	u7H9KKbcVoXfM5D+SjRzcoNiZ/NhoEd7C+L03qwq4aNp/2+mKdXfxDs4q+n2VQSA
	Wi9qvLwoPgbhrAL1A8Kt90O6iD3oPFJQ+/rj7vdgA+qj8ih8Hvg/5D2tjtqzC9C1
	BsffzZ/Qh01j1q55RhC0IxhSRRlj8qz1IvprDs2QYavFq+xQ2pn8lZNLTrncYrTd
	TSRcVv9UzIMMGo1cErx/qw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4s7ud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Dec 2025 20:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOE8B3bVuintNE/ZivIlU+122cBWSHHPV2ankPI8ADowvtV666RBVKdEFJ0Q23USX3rLSNlAoiYyJN1m3IxXYAP39V57HyXCz8HqvKPPqqORQ/wwX0dO+6vYuHt8twPXPr/4zB7LTDgl1n5CxcC7X6mWVQp4z6xWielgx2CAwhsI7L1Y7OXJ9QBHTJ7rOjwNCvn3s58lZiUufmHj6j7DTY+++SW5NMFDwRcLq/41NNqvpT76OJTEoCTY12RdTtEkP6NKdAOcc552T3kS18UjlIFbQ1AXTI07gg7nhi0QGcHjXeNR+gTOsxKvted5w5QPz8quQO54avdm5zscnFQ1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xgYfqtbWktSKQVip13XK1fK6Dvh0XwqZBWOAf1qOlg=;
 b=LxbVnNBQeQIWireu93xaLtDZlvvvg6JlTHqkkzEORl+IdlZEIVTwdk+yh+Hzu7qXaDPvQxJb0MJz8PHqLuuM8tzcwM1TKkzCJwIRB1sVHzjW4Ls9RmXQ9gpqNnLtMkqfNDUV3uHeHGaVORlNDjDUR0ABB4fRJ74KEA27ia6Akxh9OIDLTKIW6AJdgoKCkP7yBr44XeCu1K+RLT7EZ4HMMEADfZPUjF6ORg0da7y3plAfZ5BH1VMJXzPxCpAj6MhWhhJdW4SGHEQrWNrCPZQfDeu8jTN6QLH9XjdsPC6yyrFjk6UM7eMbs9uVLqM8p/G6sdfMnwYYCKx5vxtz6rzaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 04:34:26 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 04:34:26 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [whinlatter][PATCH 2/2] binutils: fix CVE-2025-11840
Date: Sun, 21 Dec 2025 20:33:57 -0800
Message-ID: <20251222043357.366484-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251222043357.366484-1-Yash.Shinde@windriver.com>
References: <20251222043357.366484-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 636ed6dd-23a2-42b8-285e-08de41136380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZJRu4qAaTgXEuFyRjanX70bhntYzwcCcV9xv2pg8USW4Dg3k3YvsBIPWBbbb?=
 =?us-ascii?Q?/Rx1NVaNSz90+qdNUXiWaJ8vHWbf4sgCD+ma1uafXBm7oGoI0ybEME6J4Y0l?=
 =?us-ascii?Q?TRW/qjClwzOgPNzZLkbAtpEDXCltwkwxB34n2TSYejz2JY7UyNIH2EnkjmH5?=
 =?us-ascii?Q?Ljwyt1aSyM1zDlBiGFVr+gfZb9HaCMO2rRnJAkHmW2024x9SOzLXfcjOz7Wf?=
 =?us-ascii?Q?lE8o1kbVOVgnDrp8oBm2EEtiWSiKJXK72CLxdV5lWclONuQSCXv5HP8UlbFu?=
 =?us-ascii?Q?RkhG3AILHGusQ7N+CklJEYvagDHXXlpVB4p6g72sn4OAULaToU9ZA76etArz?=
 =?us-ascii?Q?9j3Nd0R2aLH8xx3i1FIF0BdijodnLrj3N3ztg9YbiufnwFMoVlOLrfFScBkO?=
 =?us-ascii?Q?IF6WdwCl6x8AyZURAzU0oojiCySgXXAmLz5gojANYh0lN9V9e7r6eEAuiBP9?=
 =?us-ascii?Q?JJDc9ijH8+pk8uBvOkBoXf2q4Ahw95MRidOUOwTj3tFH3FBRVqkTKA7KnFpZ?=
 =?us-ascii?Q?EEl83OEaoLZIs4AlpqksQ+HTcr6J0DKN5s112x5Y4OTaS3bIFg1WIRrb6Aqr?=
 =?us-ascii?Q?LQjobWXb2soQmHbDuraWwdKZZejsG+yTVkUt/0atS5lkd/v6jOpt6+mj34CR?=
 =?us-ascii?Q?GHxetdYsCNk0oR4vT1CaxZ7DQdKqglHDptGQ3feq4uvUGQGKJuGuBdVYH5Or?=
 =?us-ascii?Q?5jpFVeZjc/1uFkQ3g8CAqCgNflzEDLJMcM1XZnYBUYAdUFltGXDLLBY+98KF?=
 =?us-ascii?Q?1+HZhIyMPRjtoftIWBbFrewRdC1cG7w4nFsFipM8h3sNe/dGiO3jUugkH9sZ?=
 =?us-ascii?Q?587i7G6EbLn57cKhlEvM/pDr1aTPLr/imr0yNmbwhE9uYbQPBTxH/2uEw4oC?=
 =?us-ascii?Q?XyF2LGgz51B/FpVbStq+z+vqvSBL7hmBbIEQ2XNud9hLXMrrja8eJiAmRJpo?=
 =?us-ascii?Q?CMorlDthswe+R9MIQtmFsubF3Rv5VYlfwoI/co/EZapeY3lMApY9a4zMuyNk?=
 =?us-ascii?Q?8aDZWgsRkLrAN5fQHh1rCW1QDTJTkZ+3rU2z/+7YfNKTbLXuhtR6Jem+nGbR?=
 =?us-ascii?Q?cjpcVZVmlrU3O4G/IyOWzqJB5tsduNy5CDbIwzEkam6/MNptZvjo/mBhLJv2?=
 =?us-ascii?Q?ue0qBRllfT7fVzZsW8EI6VIKOL8iZ3CDVk6A8+7+dtU2DNrBK/v2aEZ+ACji?=
 =?us-ascii?Q?rILM5xzBEuqz8gNynvmIN2lmNC27W7h4hLeblOnCVXHqqtWHCe3b+vwHpe44?=
 =?us-ascii?Q?h6ulmvfheHNPSoJ50+oSidOtX/GpFG47mQ+LNbccthJHW8iOtq31z4f0EKS/?=
 =?us-ascii?Q?wbFkMjH49wF9oMf9DwytlgpUEaDdsTpCYAt2oNw06ExQTy/tsYAVnvE9Lse3?=
 =?us-ascii?Q?8RMQfkkU0zJW8nxOvcW6PsOVKRpU4T5UigEmBkB6OlLIuILu7gyVzSbEu/qJ?=
 =?us-ascii?Q?FX3CouNFwDdD0IbMaRgRWohf2ahzEgzAwgCvLVAvsESz5e3EK2VUnQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wud3dtKGC4G5moCLX3vau5TIUdnUjpeaUDbaOkSWY0aa+VQkslLAemMgnf5N?=
 =?us-ascii?Q?bMpIsv4F9S68UfpbM5XNeMe9fXFovgiwsIQWD+Jxv6JxlBqmb+AUQkdTMnL9?=
 =?us-ascii?Q?oEklBxs05WNmXEFQ8R0eOyhZiMKiggCNC7+Y38kUneArCW1CtA9EQqf9lzec?=
 =?us-ascii?Q?JRJaETPp5v1fNKDMQYewC1f7wonyfZMGcp+H6aulNTbaGgOyQwc5W5UxddSc?=
 =?us-ascii?Q?koIGoqXcOi4sCyEn0G9/T5z0+FaPdJD1kINMQQewcWR4Ap4lyG+l8AlSg0kF?=
 =?us-ascii?Q?euUggTGFuWbPwtbb8miLrbFaxynzXn0kYWJIHYEGV7LGDUNwKzaT3c3uo3c1?=
 =?us-ascii?Q?Tft1Zm57TB7AFJyaoL38GTc7d6m77wc/dx5yD7RNA1tE8/zi1YXmfA5h5jrY?=
 =?us-ascii?Q?i8+OEFgXezb4z9OrqgRQZut5xAt+/IYRIFwWbR0mvEDkxzyB85UJvV26ALYA?=
 =?us-ascii?Q?G2iBpuVK6WZnQJyLSu2pbiM2ibaWt7kPwAfTs33XcHttsfA5GDSAvbAsMd1G?=
 =?us-ascii?Q?ClkVz6YQbvNe5Kk7VyrZUOcBzT+NOymVk3ffcAlz166ir/WGAUJr3ncbtaTJ?=
 =?us-ascii?Q?xRjKmj3FYw17KVpKakWGnpmX79O6kmqNlsbVe7H+EaNngV8B2tBicw2JLob2?=
 =?us-ascii?Q?QuzP8CSC972y8StaTTtE5ciR8ygFkVW4kX4o+Y8LGOwMWxQuJv/YGSVvQ8pb?=
 =?us-ascii?Q?HNyCXk0ADD5qe0WYhfa29gYbOrOxbfBdujdPNprwgK3kqRnsKvDznOSJetWa?=
 =?us-ascii?Q?wRVORYVUxcQeeHVNR4e45pBL8NyHInAU2RV/YdEcVInM1c/uXRfZgsEE7TjU?=
 =?us-ascii?Q?v57dXeHnMUwNk7fDlNHIUDq21VYwxVFimEhmytV7MBC6GozcPk5/Tn5AZsjo?=
 =?us-ascii?Q?wLkbWM2rnJag7wB3JMaUb85Rvvj4BuFxkWAc+oMdDrgfyUQ7wmGu5eaI2RaL?=
 =?us-ascii?Q?4Lj6ZU7hEI891Oe9li46T1doXOprmvU3HWVjPzrnAyHHtDw37qgM3m777Sgd?=
 =?us-ascii?Q?nHoUYwS+iDzRc3IWFsAD9KU4nm7Eht85EymIrbyR/GFoTsHEbw7wCOBee1je?=
 =?us-ascii?Q?z6du+SlSdXSg7wVgFE+5bvp0sc7ByFh/Nlci1XLj00xqSrELGoflQjoA2iP9?=
 =?us-ascii?Q?w82azcD7om7rzztvBiT9ohSdXKd7R+CdaY1ZbUcW9dzwt1RaThTq3X0uDLAZ?=
 =?us-ascii?Q?6ZjJqrLM37K5bF7AuSbN00CyncC2XfHqg2obJl0R59CmVkkXKxKfKnXH0UdX?=
 =?us-ascii?Q?etH+j/1cciwn4UYfMzxN2YPtIcj3eJkh5TsvzxSy0A6ScnUcPKCZjuK/K4Br?=
 =?us-ascii?Q?wDdZ2+aOFV54I9P7FO1yO5UV6+2xNRVBc+HKJdxaJX1FwJS+EnPrmrbXTOxz?=
 =?us-ascii?Q?OQPjqCuAjoreb/WXpKgXwJ3xViw5X94BleCUSVNcbW3Ey2PO4j+0M3zM/OKx?=
 =?us-ascii?Q?6v3D//xmdBya40a//b725n1Upvc5+Gcv382ai8K0ixF3++Y33pS4XXgX3kzL?=
 =?us-ascii?Q?QOQzF04AGViZ71QsZ+F+z0hejz2E28JQmyW+h0ImNosvaPUjoxy7zXKghX+y?=
 =?us-ascii?Q?zbpL//Dd+NlJ1MkTSXd6Qw7HxT4QuP+6pVYbODJQgrkW03wASyfnldAXGjvA?=
 =?us-ascii?Q?5872PYAxVfW85jxVgPAYY089Xk8kPFGuKyCeE7RuvWeekj99ZOgy6srK5Yz3?=
 =?us-ascii?Q?gt76ywBm+QWRF4gtfDNirb6g3huk1Rhnl2uZx0h7g6XW8bK/bjtvZxHVaoqy?=
 =?us-ascii?Q?hJqWdw8HHl/kWdI5FJstbqHlAtRGXbU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636ed6dd-23a2-42b8-285e-08de41136380
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 04:34:26.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHzLVNk/ovQszyoui4Z85Z9W0C1k6bXNvbabpOG2LeBDsKXRGFY6Dsf0EyPMZX00l08VRbm3TGCeqxiBycMC5TbZuVC+FPIDCsFXRdec6MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2BNlCEng0_Mq21puEl9jjx1iYA75mF59
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=6948ca54 cx=c_pps
 a=diJABEK3oI6sFh9r2i/CNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=cGBbg9qyOBkjoRYc1MYA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAzOCBTYWx0ZWRfX6HouB5/H2NRu
 TnttqlQnqFJr91R//cQu+slv+UKtV9Dd1iVOron7CRZCu93/mVefQVrW1JMlGeWRREtfj4imp0n
 ejtFzRG62TZ4cF2vYl9cs9MNvxkLUMhwB45Tn5PfYFnG+kby+w1EAY08nXYA86ovd0VJnRhWj1N
 4+83JjBMJwNDSCZ0Qt6FZRetZENF3CWkFcn83tRrq8H5x+YURJTJ+O1eh0gE8buXLcmogwy0Wc1
 FmgiE9R26QTHLKRViC7QDEMn721TDXLwijGytmPpHVnN3uzr9H5VaveWLpXSNhou9/aGTqg6z7z
 RinC5Vh8hpabIMlACF82/dVdtELWPUN856lcmcVLniUBKGEuTgabwLmR/jpROSXNKVDC/9L3ucY
 VXVbyBi4WU2Tzj8i19lZi5mqzU0ZKLLFhsxF2nKHOVw4RrKbiBGKXr9gOE9T9MOUUeXAtuynPRx
 b5xzCMbkvFrweM19KpQ==
X-Proofpoint-ORIG-GUID: qY09ayZdRtpwJelRyNoF85xqAHbXd13X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 04:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228282

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11840

PR 33455
[BUG] A SEGV in vfinfo at ldmisc.c:527
A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
place emitting diagnostics assumes a reloc howto won't have a NULL
name.

https://sourceware.org/bugzilla/show_bug.cgi?id=33455

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0020-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 2f61c9377b..e707f3f5fe 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -45,4 +45,5 @@ SRC_URI = "\
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \     
      file://0019-CVE-2025-11839.patch \
+     file://0020-CVE-2025-11840.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
@@ -0,0 +1,37 @@
+From f6b0f53a36820da91eadfa9f466c22f92e4256e0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 3 Nov 2025 09:03:37 +1030
+Subject: [PATCH] PR 33455 SEGV in vfinfo at ldmisc.c:527
+
+A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
+place emitting diagnostics assumes a reloc howto won't have a NULL
+name.
+
+	PR 33455
+	* coffcode.h (coff_slurp_reloc_table): Don't allow a howto with
+	a NULL name.
+---
+ bfd/coffcode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]
+CVE: CVE-2025-11840
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 1e5acc0032c..ce1e39131b4 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -5345,7 +5345,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_ptr asect, asymbol ** symbols)
+       RTYPE2HOWTO (cache_ptr, &dst);
+ #endif	/* RELOC_PROCESSING */
+ 
+-      if (cache_ptr->howto == NULL)
++      if (cache_ptr->howto == NULL || cache_ptr->howto->name == NULL)
+ 	{
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-- 
+2.43.7
+
-- 
2.49.0


