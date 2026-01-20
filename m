Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5573CCA5FCE
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12562.1768931672443457786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oCtN8Luw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5Y6hs3683153
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=; b=
	oCtN8Luw2GatI6h8CAz2KkXzB4bobhgpKEbhCZpTG9hDl/o2cNEByJCzpm3mGeSr
	bVDuhedTreY+THUbPvCcVsyCrqqIz+n7JdE7sIKLqApsL3Hd9P6/X07QjEmTr+D3
	zLmisix0wMoEk1/2xjAWeitJ6aZcbPOMoDRFPYG9x6Mk8dWKyFUsEwvWd/lSgDgo
	PbV9TLWUeyEvOw1lIvJUCkIFcdoFF2b3ztP8sWQKk22jVhR23vPrVmWQffmthjPa
	yXVXunZ+QE7OnNdrK1asXflKa83moB1sgCK6pztR5gdFCDTDI4839OltTCpdYbT9
	Fm0mERrQc54uQ/g3n94jXw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu258-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhM9LYvHnwyNGPk4EstqtKIkCZfJ0pJFHUAdKwCQk8YeHtmDmTDbNgwsppBwimFbbXl1lYz/H0cVuGZCgvzJTaJQYZ3lI4iv/aEdEelnL0tF5dOwXOtvducSsQhyE3AP8klL3cPIS9mkHkB57e0YIFrXQza6PVxsiY2JYZ3oL6hEfNB9C4EF3AXC++83bJp8kijr+VPz+IcmtrBiM62Oti2vJeoHPDOQq1FbpzyVLicQlHDwEquqLt8Ng+UvsSwoki6RassKuYLa62ZjUJXFaFiSiu396mxFu2r7fcACLOLAGrTBasnao4c4Dy/26ufguxjobE+BmLycMVE6HujO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=;
 b=gD9P5gx4aAULrq7vgG/jBFMlgimGHQzsqbV624wcd3j3ak1EQxBQmfSrWK7kIPg5P0qUO10lZY2noC+BycIeimoQH0huMyg32hY1rXBB+upi4C62SErsoiabZEnr5Y+Swz9tkaUMDPZHq3zNX0xc0dd8d9DYq5xrYUNKKYLzytkhVXz79HSyCD6BQnenGjmh3Y09O6+MsE2Ya414+bL5SO8gqwnbOllkRWB89w9R82XgHjhbUEuZ5p/zhB31Gu/yqcAeYdm9ftMxcmU6GPTIcRVuq2YjT5dYSGtVRVUFqyrk8E3eo7sCTpRjgdVednkqEsjIa/PjvmBjo9iY1J+R0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:29 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 11/16] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Tue, 20 Jan 2026 09:52:41 -0800
Message-ID: <20260120175246.2052341-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd97fc4-b3ee-4eb6-5c29-08de584cf5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n6QCODLpVQpLIFItZ5sMnjTVdtzkiYBiFgkr8KQ2pgL6IMvX/uS2Da0Lgvps?=
 =?us-ascii?Q?xVsVusoh801rhgZTQ8m5zgj8IA+mZKOMLBuMte0Y28ub7WZT64/SG8zse/C5?=
 =?us-ascii?Q?lyQqoFKGthC5iuDG38Mqqb0oc/iqKLkcsjftBF/lFhHiR5CFbvdUU6OW03UX?=
 =?us-ascii?Q?zqwH4HL2qTtPqokS+wqUl5vyg85ECyppdsFGiz5qSf4JUI9SYiKKE2chF5pu?=
 =?us-ascii?Q?T4GjJdvqlzCIsXDMYKpZ9DOOSTP1a9m8Xwu8E89MKfAvp/eddiIVp/cqlcbG?=
 =?us-ascii?Q?V2wYzUrxjthk9z9utSr7sMaf5NlkNjpnlpELqqxmtm/vfKSIz6ekLn4xVUCv?=
 =?us-ascii?Q?ugh/M6JGRZuLDAAs4tR6MCQYsf14eqGSVD7xGtmKvX3rUMzUQCzdfkZ5PzSh?=
 =?us-ascii?Q?v4WsLy6qlvStQDsRxpKuItjSJr42LRgjXZL4crDJRIbM1NxcgP1y8rb2iyP6?=
 =?us-ascii?Q?MVnW00Hx7hSOlTmBSymACt3htbJ1QQ3y1VE3J7+OdtX4NFkmSBYaF+5NaH5J?=
 =?us-ascii?Q?IhIjgG8HuvZEIlpX3VrFlf3eMW5+ZxkUsem+sWGzEfUBNe6Ik8y6SD3VdYEc?=
 =?us-ascii?Q?L/PsuNtGrURkplkOuTb6X+PqAtvBb8RUnV9GMqco+QpQK9XmdMvJ5uGA3msL?=
 =?us-ascii?Q?X8RD26IbNZuw9I7dydTpHd1silkcJAX9+rv6bZfp0NiFO36qgrWXlbWvw0Hk?=
 =?us-ascii?Q?uTz3CVD21BN+IViTiEaFAjPvq1P9ws1yA3SSF4C4kgTo/hSBVYK5V3Bt+pP+?=
 =?us-ascii?Q?xFVRZ70eLu/pHDC7qdyPBIJWTwYRgilhkDUL8p1lqnrNBEYNoRIGThWu2ani?=
 =?us-ascii?Q?3u7JjPEFsVTF38uBJgKgwY90sfJw1TBDTcSNgTw1SkQxK6rinMTnh/D2Y+J2?=
 =?us-ascii?Q?573+mkVqNiSDTk9vwsS5fnsjMA8j5YZzODlQ6qJ/Oe21JUQ+Td40vPxxFJ11?=
 =?us-ascii?Q?rg1NTw93pLhBa6/iC1vTaqasfdJYKBgSF5Wi1VcHfxzqi38DXqkxcV9n0qMe?=
 =?us-ascii?Q?C2a8+Cl+wqGqz1czDWPSFV1+6diwf/OaaKWKGHwzYVAK3/NX10KsDQDn3j/N?=
 =?us-ascii?Q?eFtoLXclOQz73a0LECY5DLTA4ReVmreh5DLCgh3FSbBO58duJK7Z1b4Ya9og?=
 =?us-ascii?Q?LkuEIgMbL6yTh7JR2IOS7tv4erbVJQa//rYyUIv36ZW30E+cM3vESCR/iS1g?=
 =?us-ascii?Q?yYBnivVDCLnrMY0ap6O51+wVkpIg5wIvOjEeHHHOM7UR9kk8/j+rnF03gP1e?=
 =?us-ascii?Q?qbYnaiLejI5RFHllwxu3g2TByOQl5DhY/yWUx8TEjKxpyWU1qVTp/Py4Gbw3?=
 =?us-ascii?Q?O8NbkosUlpCo5xvZgMIeRM+bPJUxvMmBmsGIbZC/dboSCEJcD/QW+kqIIZhG?=
 =?us-ascii?Q?k0ZVCgoB0tjsOPAPhtelTjVue9wR7l7flaU1SjvTLFp7d31vTYAX4ANoAGCp?=
 =?us-ascii?Q?J1VCdvk+K86rTjbGOIFCQP3rPHY9mJXZyymcktiZrDljUjCspvK03tWNwDH9?=
 =?us-ascii?Q?StSWAje7A+mGkXyUC+TpXJa5kSx0pg7J4GwYm9fhtpREYt4+xbYLaI12hZiY?=
 =?us-ascii?Q?DDe9rs4na2maFdxRdcdGm99pyNyKu70HT+xnQID2R1k757w7P5fPgpPcNOrT?=
 =?us-ascii?Q?xtfG0bJFzULWSMhrUEH3j4Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ppRqatPbo5McFoN6IKyeMULawD30IMS4ZPqG2NDH/ht5d4xA3C1J9iFBJ7SL?=
 =?us-ascii?Q?3c2AD+4xOtMxvDT5p7sMAwS9nbmB8YEG6QMUdqWl8vvjXBMmjfRYXmp8Zf7a?=
 =?us-ascii?Q?u9yQ59l6dvPgAYt9/R0Rci3kM4OtslVwkd1QEvjE2e8DAEci+bL/5LagHMpI?=
 =?us-ascii?Q?IDeiLgvNbDRmKHNDme5f0BMyC3skmpfOf6xbheAJDF9rF2bMrqBaYg8/565y?=
 =?us-ascii?Q?+1hsKOXs5Kq00kHspTNzYM7WDYUdobRT+k969YfX9sP5ga6NFVbEXwv2nXpw?=
 =?us-ascii?Q?xPZtBsXPctXVL/q/++rRal7H4fbT0VpKZ/toWmCtfpC1yUpaMKojqdeLXcb7?=
 =?us-ascii?Q?8Xb6+fH2vFCutSRe+oMwswrxiMzmz6cSWsJrb3TeyEPcCfss7RIXhluC8fEO?=
 =?us-ascii?Q?9V3ZVYM25BLen4iFXOsw05RxVamMsgqdCfPgbirLWpwCRHfP22mjXYPxSOSf?=
 =?us-ascii?Q?vIGVjdCB09zginNdN3NVYHeQfQJs+9MFPV3lhiuy4SNisfZwotHcl/DbfOFI?=
 =?us-ascii?Q?PX9l5Ld/7rkudTHt6OEtP8QyqXLmyPdvL4Y/l53CjbIFytschOnDYTE6T/FU?=
 =?us-ascii?Q?ReUQM6rug1tOM+E/DmLBPbDIMlYKnlKdYutKhWbNCBrTa7jMAJPQyHEsE++A?=
 =?us-ascii?Q?BA/wwoZF5vhXQHUpa8Q8VIemK7EdhGIK0AH0d2bt8tmi7qh7Lq3I0zrjkjog?=
 =?us-ascii?Q?xXho71MB7l3Jh42VEMNDWh5005EZg/mOa6C1obx4rCqrcPV2doo8CyEDTx1k?=
 =?us-ascii?Q?ISpKs5aSlA0NFZNZbOCQMaS3uVc0HhI1DpYx080669plg61RxzK7QimKu1Lx?=
 =?us-ascii?Q?/zZYWS0IZ3nG3uVRpiNKRaMmUOXp0qfI+0uy08BBqvM/tPp6EDHruBfN2EbE?=
 =?us-ascii?Q?bK2jatc+1NFagnpNxtvVS1aJqABo0HZsH/jhgoVs5LOi3bog4gKU8yMUR9gR?=
 =?us-ascii?Q?pt/pUwEOhpqfxej3S0MK349dE8UJ7I/4grosM3GDKsnRRMaudLKF9BxFlFDH?=
 =?us-ascii?Q?+ONfaOIZptXiaWGscjyjjIv58SdjOTF2Wq6tRtmKH3ag6bRNg9T/mSn/jRTS?=
 =?us-ascii?Q?/BbREOfRP8ad6/PfoDZ2qmKe/LxFdTzE0cYgqo2SGnXQC3iNzn48kP405UT/?=
 =?us-ascii?Q?5hPdbqri8d9mdENSx+YjJFq6Mx113XqDJtp6RxCdJJ7eAGlP7NZLWBt+bkuH?=
 =?us-ascii?Q?+VpvtuL5AMF64Hhj00qZHxf2KOi7IdKlkvl2h35+CInlxVwV8nNvmJLEIp4N?=
 =?us-ascii?Q?wIAEAPpIxwIiZQuVVmc/RrFVXIn7bGs1k7CjZsg2UnvSVX75ahv+7MLSlkci?=
 =?us-ascii?Q?kvmJdAShRTfnjuS0ZHcA0V5k5Y6yxsvIQGa8SSnq2lGXD0eY5tXtBz0YJLNB?=
 =?us-ascii?Q?XVIzq46UIBYGIH5RQjIL11JlW0f7ai+lX7rADVWitZPxmou0TnKoGrFNKDyY?=
 =?us-ascii?Q?X51JCOg2X0YnpOqJR86AacRNjawA4UIq9ci/V3t/n1BlxHuUIlVQQyd+7Ecn?=
 =?us-ascii?Q?3JCbGjqiNvvJ82coa1ZRf05WZEubXW4Zvk4ZlOeaBW6A5jWz0nRxK55X+MkS?=
 =?us-ascii?Q?ATok409yGIdGophuL6ZVjLLyr+bHgrPsep0hjqWQubGIOn8SVVAFbgLTxuoS?=
 =?us-ascii?Q?zBIgNnaFsjUeHCLbzHuwf08fKrxRULRl0ObWawULutyEj/GhmCyomDMziR21?=
 =?us-ascii?Q?ei7zrgV1969DGmtHYTKbLiAyLXXTgWBT2dOuXgfKwnZtwIZHZ7phb56KEGp7?=
 =?us-ascii?Q?4ya4rbQeAX4jhqP+FkH+xAbZ5fzDVwo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd97fc4-b3ee-4eb6-5c29-08de584cf5be
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:29.7560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJgSZHKOL3P4HmyWmOnYaoH2kVtZL0Kqhn3UVsQAkTsm9wzi5IS498QzbfQMFlAIPJqhhHMRdpi5nDFQHgk3t1aDq2bQ0UKkDvvSlDTAxPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: YQWTKCTaeNwqdNEE2GnShjcqWEAZkGy_
X-Proofpoint-ORIG-GUID: MFj8IotSH7ktN8IT6n_VEVa2IIIiwdhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX3m7qj+8K7n0R
 Lnt1Rlq1QO6jo4MQW32rqbGs3+NbmHb7UXQHffWEAleDSKREugNZ5r12IGhoVxIIKDnie2xZr9P
 zBYrkMRzcai/zIFwuXkUNi/0taT/Wa7c+43vkBfCCbTtl+EzBh7IyR51f4bD9fDCgA4xy7VGtas
 4KS0qgWbjG4cA2ChUAHbrYf2Wy6ufK2myKuYmupHoDC57M3x70Skxipn0N6l2rOsyiJD9y8vNpL
 Cq9+YvVtZasuR/49fMIiRDF+tOLphXAeDQx1Gr5Jh+OK+jTuFv93b1mnpkJg47ctrY33vWUHQXj
 th0+NbdxH0c8hHTJ1ogXOl6f234l4LFP4wqzWFm2n94OqL9ew5JzViMCgYVrCw0n25WbzQoYtp2
 DPWqoBCET2thUTaekaoYe+qCNfueoaHfRpX2clQBwKciDNCM4pRGtXyiEDOXf4CFyq0LOmoivA+
 B7d3JjAAvdx6wnVwZXw==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc157 cx=c_pps
 a=QnZ2uEdZlRAtgHxfLCbJPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229758

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..30a10b0801 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


