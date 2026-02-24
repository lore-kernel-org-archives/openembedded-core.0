Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A39EFB7EB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 02:47:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11972.1771901216945375856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 18:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OxnuV5FK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0U8pq336017
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Mv06Fl7WHxvKTw+K0yk4
	S6bslHgTRiOKAcPjTJ3sVKQ=; b=OxnuV5FKaMDCha0IHxJZJUmpB6zjLymZpqlx
	6QlRUXSrwGyVxElj9n7N6OS2+Jed2BbDxJgISWvgpfRng2m0GywerfwCjW9jIbxH
	6GCU4iUZ14Q/tZwQUsUjLCFBkPodlJpyqPZajnP8FzN9ouLt1xiM7ypd3yepVD5B
	ZohXCyp0mxipPbgXcVkjzsSEBeZUiCl1/ID/XWLB478CCjyGJi9ii025F5P1phYB
	3B5N4lZHXGV4YrO5c5fLobvLVa7Ucl57WF93ivJXaxaQnbgDGzRV99K34ghyt2qf
	Hn9JOC12VmzpZumDZMb+0MwHLqDpzzPF4UBZmRgzbrDWUaRnNw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p4an6q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:46:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVW3lfZWXWxGjLHB7FOg6SJnSvEa3CWWsVpbdAYDILL3kLb4GJ3kQPabsKzaRIpCVNFZUP3NLb1eH2hn3kz1b3mKrLmq6mgUyHqYDZXS7sXcV/LljMKCFVpNbhf/K92uuo+c6MkHOa1m9Jdd3fH26LVs5bTdr20nBK+FLCafmrh27E2ThzoMtJxAERnthR+eyzOB3daiIdaEzo6KKiR/KXJjjm+Wf76Q8Q6Fqh/P+XXGwn3jcCUGnmsYhpdAyBdA/Wkf+kHOqVSS6vxF0zlJbBxg5sQqbEdvaDz6HLQ3t45dCzGr1HQ8WCGORgTKnX2yeN8JF1qO0mQCHIR2mxRjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv06Fl7WHxvKTw+K0yk4S6bslHgTRiOKAcPjTJ3sVKQ=;
 b=PNANZohj/jPM3JNC85xT0AU/asOCYTpC+NDCimfbuN5SmD5SvNpv6ePszfJqkiuvEhjdeXGlNGHzh2L8KqDkFYuhcaZ5jmvTrVyWA0Olq0maYQfI2fC2soJ7KN0C3AtZI5kHN7+71EqZz0yHGS8nQcV7wU1uTbaANOAR36gZhe9cjLfGTeBVuhazsyhZ6lNlZWaBlsbr0FcAjIQ4pcCouI9uX7NU/Aa3RotyGP85mC2oSW+OpJ02SFY3nJyRGth/e1BYiyQF8OB7hQsvDaVO1vMNy2SgwcwO12xmdqV9lH7QC291N3va6kjwmaQRChJ5J8ypIzL2XPqcGp2UqSjxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 02:46:53 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:46:53 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] lua: upgrade from 5.4.8 to 5.5.0
Date: Tue, 24 Feb 2026 10:46:38 +0800
Message-Id: <20260224024638.1146564-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef62d0e-8a4b-40c6-4137-08de734ef7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e6nFL7lbe7MV6RD8fF1XTbiJH3BUA2QrZyBBnFMlqObIcjUzKPVT44vmlj+g?=
 =?us-ascii?Q?Z5lwtb9URAT2tSlte60x2XpxsQJ0e1LKPPBolS/gMCm32hEMSxf3+mjwC1Zi?=
 =?us-ascii?Q?MrcbUzIemUB68U7rgE56bkcQdqHeibhD77fzYf9tMYFavas5d5mGEO8OhQyH?=
 =?us-ascii?Q?aOkIC3Flb3RmTBRheR1bIzBgzowk1v20EuumLDePzZfIEC44YWutcPBqinXs?=
 =?us-ascii?Q?LuF7PtKfy0t7a/Zz7fQbgGHcOGkQIr93eXHsmE2O81SsTDfz7orLDr+66OXV?=
 =?us-ascii?Q?+Z3VRB+pT8uVee2GZVh/KVpjS2coPRLjm7FA2sYTacKQ5JHAzQHCTfwRc3gf?=
 =?us-ascii?Q?UPHzokCHDte6tFRko55BRGbH49YmYjz4Ip4NfVf+uWoHZpeoDyxIKknf/Ipo?=
 =?us-ascii?Q?MGfmGGFH6JsSbZVvOg69oBrHXSp5Jv/EcGlc4uCyPM50b0DR22DOXi6j0a3M?=
 =?us-ascii?Q?UYoBJ3wZfUZQgF8Z1m0JdAr23FkQHWO4nRfz3JzrU7naKBNpw4NS3JhcJbi5?=
 =?us-ascii?Q?4HqLelyv7EKn+H1C9205yLM/31TxokMGIYBQ2of8CDEG3hlfDyTVdcWXDp0m?=
 =?us-ascii?Q?f7FAEGoAzR0buWMyqk/D8vl0CSu51qabuU7+RyMCHR8kDUCnhO7wQP6MxmNl?=
 =?us-ascii?Q?MBbxkAgft5D9yLxwLBetyU6Z6jNopO+OyzaP/7JC3kMqPPPbACfyGDqLHEzd?=
 =?us-ascii?Q?Qb5IFrww5jt+1Ywxpr+ddzREJkEKRX95dCQXVep/rlM9xBuMq9YsTjhXpCx5?=
 =?us-ascii?Q?wW2+NDKzCGwdtrX+eYNr/a3o8KPGE8GySmUltfS8ZJYch4fTuguaRYnEGW+C?=
 =?us-ascii?Q?LQhz7ZyhewB/QFeDY/OGbObGRpyFWRwHfo1uW7k3STdCk+ijQ7Wbr/bw5xdR?=
 =?us-ascii?Q?31P304QzWOMlWyQG4B+jg7XV6f0JTRK8FiuPYVlyTkiuSSOikEo2t3U5CAoa?=
 =?us-ascii?Q?svAThU30Wdd49jmz5XRnz7+xd6jsY0yj3idvfpyJBGuM/IhE6bUPJwO1eDH4?=
 =?us-ascii?Q?Z5Hy0JXsd3a6nWixxFhd+lXvviY3b2fluOfELq0pfGM1n/j85Iuj/5xIvPgi?=
 =?us-ascii?Q?ZRLB7Ipf9/YVt9q3KB5k/Mow0XsUwWieOcNMgBjHlsuyCrpvqK/Xkh7sY379?=
 =?us-ascii?Q?FqmG4AMGa9YMOdECqkevfazfeidXcENtADT8K2v+3KiNTlibedVlMDT5FMsV?=
 =?us-ascii?Q?qkndvPBgsPepT5ccvKA7d/NdP1W7BkHql4boVjtaQNnIVer5MHLtYf6oYN40?=
 =?us-ascii?Q?Iz1UsABPFCfFs+ajNpMf5WAXYSf7deeW12vG6x5tKhyVMeY7Wx9KqZDRSm1f?=
 =?us-ascii?Q?za70mjfvWMMyEfUGZMONPzRx66wFaV60KOQS6U8jSyY70kzNtYCMekHm9eVQ?=
 =?us-ascii?Q?NC4vAyPvp9OZAQ1hvn2TI9NTGXNUsWeN0N3xp20RKGTq4A0dOM7o3oEPFNgV?=
 =?us-ascii?Q?XElNBRHZbwlEkRWEvVp65R+m+nB6Ao4Jf5/AEPokrBEFesIq/qdnFubP4+cg?=
 =?us-ascii?Q?Hq4rLDASo1l0FmYtAYH+UuPBf0IeOeHUVT5S4mnH+oBDkaRcdxtYv0gyyawV?=
 =?us-ascii?Q?JZ6d8qViwlESS35O8+8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P4atxgvZgdQwDYaPiSJsuRU4Dxug6DEX9gBpckWmsnBCDgm40/nSoCbONgG7?=
 =?us-ascii?Q?9qD7dvGi585O84Y/hPlaiyPNsNIkdxLMIokhVm42bYlg+RxxqOXC5qnZJIqF?=
 =?us-ascii?Q?VEgIWTqapomI+GAHgvaPTzUZQNVBZivmV1d1pVnK3+M/yE0QuHVV7CTWRk2S?=
 =?us-ascii?Q?VLI4er8bMfkRdhsCSjRFSZFVLcIx8SENaGoBxbpOieSVLevD5Wg6dntvTNSB?=
 =?us-ascii?Q?NxD2qydHOfR7YEJq00Y71SrehQ9OeAzQzo7W//dN8ZhMy598gmP5Wfqm9MvN?=
 =?us-ascii?Q?Kg8ckCKjCqjBF5+yPtvR6KzUIslm5DnUqwBlRY2PNcNVJUhRlZK+uQq1B3qA?=
 =?us-ascii?Q?1zyzMU4veLyvI7Z5qGGxYuvqqLv8gMU2Kln9DLYtpjwq5U6Vchsmg3iyj4ju?=
 =?us-ascii?Q?taaAN0J6VHLAiWuCFVIoMV8mEcqLugRv2R0ALrx9MsGYD5jaigvSPACVQq2X?=
 =?us-ascii?Q?rqVZp5Ex1f1bddllzMQ5yCoNRFv9Zi72iPMRoGK/G0Lhn+EPbi5o634eX8oZ?=
 =?us-ascii?Q?74nxnAtchd2O+AB4fxKANwPt/4p26/02fB7x27V0TzKmvJKNrSpyOtx5VxuR?=
 =?us-ascii?Q?4izpn2iDv0myT382/6aKXNgyomeHGKtDGDk8OAbNszxcrh1TVTKugZGOFvzT?=
 =?us-ascii?Q?PPGfDJJ49js+iNeSOk3BrA/e1R5MeETBp6Avc7NlOtg9uapD8hZ+YY+fvsCl?=
 =?us-ascii?Q?Q1rLaGtr2hq+iOQFaW/m/+YcgnqAmArg8gNc4t7wmBoWzQSd4NRK/2AqyWyV?=
 =?us-ascii?Q?XEQdUciZBMqVqa/sVTiBcSXfSeoqCgocbFwcIzws9DTGlvFaWA71CUAabI1r?=
 =?us-ascii?Q?zqaPcivyVB+4kZdBcW6vUt3huU1liAK/V25mnpteDKSbyyIZlsBJxy/B2Q6T?=
 =?us-ascii?Q?iciD9LXU3Poa/q1dUHfEkd0UbdX6Yi1hm3AKS7lKNj2acSHq06nUsKpttct8?=
 =?us-ascii?Q?C5+IUaLpxSeXJNXeVDLSPv77nCB1reQRwkbFkW1g+mgavBjVSd+Tkq13pj6c?=
 =?us-ascii?Q?yj17gG+tiCEOEkV9yYzQSKtFKRZGwZ2UjP9LzBMV8CNqSxWNcpXeHtXLNsaT?=
 =?us-ascii?Q?8cLjyRtGKrhPE6h2L9SdPj1jz0xKsnRrDyWZbcruAIeHraMb5BII/mj1gdcU?=
 =?us-ascii?Q?G7do3TcRKRMSPvVTn/J3/l5EN+ua+C7xngdiMDzkF08Zqy4Bg0a+NL+nc8WS?=
 =?us-ascii?Q?bws9FY1j8a/j5d+QepCP+wc85MPJtx4TnmYRfbzC+asb71Bi+axnR2e5Y3Sp?=
 =?us-ascii?Q?D90/sprQlvNTz5Of2+wktuDRHfheB21eiJvskGlY3ploJSlk0s5IvjDjWKuO?=
 =?us-ascii?Q?jCuGP1zgmqhmtkzuGfNQtYixD+3mHubevvtnSD4apHhmOiOCByA/UPdbtoUn?=
 =?us-ascii?Q?obXq+mVr+St/c0VOa16OeffW6K2urAcMEk4tVrzwPogiFJQAR1iiYw6rzEkF?=
 =?us-ascii?Q?Ln7WfukFruadOnJeilh5jqXkyyjDcgy19v+t7sbKVNy4UVjVsPVxfD5LImSy?=
 =?us-ascii?Q?ZLV4b+YEzt/zmnf7WnnvxkoFiObWCGG+Ur0NLfONpSIZMARPXrrgM8b+8nEY?=
 =?us-ascii?Q?G4KPhi08yWPhHZnXftirV+HPv1E8b87pGEIXpcFYloUGmptbxa8KDVbHGRl/?=
 =?us-ascii?Q?4TrDXbI1Nch7N6L/aD/9YV/hees3iGEf7hjA5AT/nc+TVuCU+lgMRUMBOwtj?=
 =?us-ascii?Q?MdUEJ7MEItN67vTFTV3pKqTaE2y3EeQx7ao9pSj9KqCXzH6avk0AZOfYhkWL?=
 =?us-ascii?Q?y+KXx/dp6J+Dy5GToUjBwpBZXpx7t+E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef62d0e-8a4b-40c6-4137-08de734ef7ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:46:53.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxeC2snaBxTFpBzQenbmx6u+xg+eaTwN9wHYV26JKZoRf7rUEzRdSEuCkrlVkFI/wraN/d64jnbmgjep+KI2B6SHyX0YRcbt/fTp8QawgG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699d111f cx=c_pps
 a=4Gx/Bq66bxzCWlClXrtOjA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=z_5uEx5cAAAA:8
 a=t7CeM3EgAAAA:8 a=iG99krfCKTvf1Ipm-4gA:9 a=JtrFjcrP6MhGCbC1Nd-z:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfXx2WE+vEpOt3+
 qQwtx10wq08lHBnMZ1p5hdEHf5oQfYNJMvjyEQ25RwNjqaSixfkBbk2Ex0FZsubtqp8OP6tihlG
 3DSwoSBqDjC50QMN3EAhLJIo2nZ935TdLCSMgRMd1TeGuJzzsyJ1rPDGTDQJfqTl0e4USUlF0oM
 iudUZ79IZ/PNUO7lpWjJYrtFpbM3ypoEHyuqhKSlFFBezjgt0on1XdsHNr7TelNVTBTKKend+EM
 IDP+xzUpXx69DG9VSCIC4LQSWtq0M4CFwpNKNUCIyYieyli3rM6bp4pl3Qq9rgEW3lM+cbeq8dk
 yLl/nW12rsYWqve95eWIwC7lvDrmfLcZt4zm43AqVLsiVvo6qdJ4udWdW+7g6X6F6Hsi0uBD8s8
 H3gO41GhD90EPtAepO5/fZf+ojneDBGKxsUEJeOqbqwhVjtj7/58Wk/1J+FGqf/8sBP/jtuC/Mx
 47jYrhhbvzpjUoCdO9g==
X-Proofpoint-GUID: kCDrzKvqCX6hG_f8u1ExUwltwJ97ynDm
X-Proofpoint-ORIG-GUID: kCDrzKvqCX6hG_f8u1ExUwltwJ97ynDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231736

Changes:
https://www.lua.org/manual/5.5/readme.html#changes

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}            | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (78%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 78%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..cbca0dc63c 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=299;endline=320;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,13 +12,12 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
-SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
+SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
 
 inherit pkgconfig binconfig ptest
 
-PACKAGECONFIG ??= "readline"
-PACKAGECONFIG[readline] = ",,readline"
+DEPENDS = "readline"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}' 'AR=ar rcD' 'RANLIB=ranlib -D'"
@@ -29,7 +28,7 @@ do_configure:prepend() {
 }
 
 do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux-readline', 'linux', d)}
+    oe_runmake linux
 }
 
 do_install () {
@@ -40,13 +39,13 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.4' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.5' \
         install
     install -d ${D}${libdir}/pkgconfig
 
     sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
     install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.4
+    rmdir ${D}${datadir}/lua/5.5
     rmdir ${D}${datadir}/lua
 }
 
-- 
2.34.1


