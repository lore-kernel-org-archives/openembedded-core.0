Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F25D25047
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:12:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28799.1768205536806918853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=De6RR688;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5472523fd3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C3vSN93802000
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OcOZkPsXT+Mc2SjJ12ea
	Kpv0FmDOlbkEICN7s5wYGHI=; b=De6RR688HY7BPbmtJhjU5BhGiMcWt+zPpnzT
	fZs80rnaLML8Cw9oYe2ln1rqhfFxtOsyHAqvSxgF1IILzyw3D7MZhStTbvs69UO7
	rEniEYuNWB6/WmFK80xTYfKgfh+tyX0OzsdqetAmEELWUYDXozuaN+DcUnosNl7B
	STjABWw6m+PoFXAfa1U62CZWZhNkb4wwP4OUj8a1EIXHPVdQqkC//i8B0jqiCaFd
	psPN7gbgMzSJYsRoFeVey0vjIgoo2Tmw61itWc9Fr9lO7Hv0/uXQxvxhQ6XckdwM
	m3BTtK+2NOk9zwC3u4ZsjWVALE0akCmjgzryfaM7rPGNMiPJaw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbythjbw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzuCBSGkg/mPcgAWC6Q492UDVLvh3GlquyjgAqSlTHHfZsvqgYY7vLzehM08maZLpDSWVzYNnavRnQa2oQ56YMOdsUwaipuYR/iw6kTiNkSqvyCx8RDMBS5K0X5RCqVFrBvZJV9ljxQj00/UQF9uMP1sVOTWucWxm51StoQVd8xyjQTg4KtE6+yeDg900NwX9dwFZMOm2NdvQgnXqYGBBTbnghkJ8mOQqdMuJ2LMQ8msNXvtye/mzyWcSOkkFnzlEbAiPTmU8Eq+0V63+/z2SVIZ8qV3s86J/suivA64fWU9bvTKh8TZZuslYM8qm7R/Vnt2A+/njc968+kmuPcyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcOZkPsXT+Mc2SjJ12eaKpv0FmDOlbkEICN7s5wYGHI=;
 b=MBTL3OAS6NBqWfcJ17NkcuuVXx0L2Pfp5HFSVGpvZMYiSa+8AgwzLdMsMCOjAyvsEN+wJFHPh/M1tEV2YRKsiW3zkb0Uo+aow0WMoJnULR0GRs31E2TLt01XHuyxIxnXTOJuFcsNPdxRLDdO1sHQYA0p62Zk4G6UTQPfRVpi0Z8A6EbELg2c5x6QElk9+bQ+Iw/AwgayHoAskA5sX6I9YW8j2lfTxmw5aptsD5MKnwhsB5d23tIcNBByT0OLY5WlMuEChXae2e6fn3OeMuNPlexE/ApOPzkX6xT9Xpg3T1Qc/Mq1COTiWWnmIZjSB3+88yyzIiT5ZTi1Nn2mmKrrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:12:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:12:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3 V3] kea: fix creating runtime directory in service files
Date: Mon, 12 Jan 2026 16:11:56 +0800
Message-Id: <20260112081158.782266-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b87e89d-96c0-4a2d-ab3e-08de51b24a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A4cjRLvQIgCg1wcioOEMa978NGay84+RBvzJh6wzM3au6tSdkQ8y3IRvZ2CK?=
 =?us-ascii?Q?c9huhIy116DLRhfqEPyGN98K5HHXY42mPvzBVhHtUdHLUfmtx5qDGsl1hcTa?=
 =?us-ascii?Q?SkWVzQb381dRxP2H+Q7oGD1wo4KhK1VhOxSQUNKcKsBwOmnvV79GVmRAhl2y?=
 =?us-ascii?Q?vl3QffN/qIPyoiDrctc51BEhSNy6i1SxAfnbmFerOZZn/WkMemIrd5/4lfOG?=
 =?us-ascii?Q?/JQerBh18cIsXd+pqztvlHs0tQKewaAvp06cxOiyVhwcbKmdoHRwrfJsiY0Z?=
 =?us-ascii?Q?zJ/hvdkSYEDUJq1k9lJqSb2yGmlDd7hXbVY8Y3X6Ts/sWy1sR6m9yK7W8hyS?=
 =?us-ascii?Q?K0JUFPtNYifl3utLIydEZGY4js4l0z5U9dbU2gG8L259UfEcz7zrbxYOpsls?=
 =?us-ascii?Q?Nhp9rBIEuuXyIoYSrLpAGpMDt5K/JN9Dc3OonQW1EUzU4DjeMv7VRX8AVY8M?=
 =?us-ascii?Q?FxTsVXnxeTyEbd9YhPIdmGSVWNm3fl7QRXEdYN4vEZ4uR6IB9Ijs4ej8d63M?=
 =?us-ascii?Q?l1lt7C784wL5NufnU5ZnYTY9tRaHDWsEXscNreDDHVWsldKHOXJat3dio7Ad?=
 =?us-ascii?Q?R/kDzQwfj5bwS/jLJoo9NQ0zdlRH/uq6HYY9znCA+Uhi8uWdkh22Brps5+tc?=
 =?us-ascii?Q?Tx/AH9gJTQjqEi/AhvI980UYsRNHTXvyWluQaRfXA7mtrlyY6QOSy9nziRUO?=
 =?us-ascii?Q?Jp7VB2a+pLKCQbjEFMN6HqXyYMtZP53rsMgeZRTN3FAZ6aTKtkMkaXntP2Up?=
 =?us-ascii?Q?HS/kV2r9uvwwB16Sq2x0WrzpiwUiDO7y0JyVdLX9TIzLuYJU9OlWosL/YYhk?=
 =?us-ascii?Q?akXt+xnAtz4Rt96f+kTPhrerFXVD1zxMkrmoPCslMaVSijbbsW+WZiIMOmAj?=
 =?us-ascii?Q?Yx0Y9Ho3KhtyD8L3DxyD1NqzLkuG1nb5CdEFZcxoO7unxsJrs0vLjTpJJZrm?=
 =?us-ascii?Q?R3hapHEmUFjsTBCmwEcczMN36WV8FrrwKizUy5ot1gi6igIDQHyExvqgosDR?=
 =?us-ascii?Q?lTv2ctUX0uujvmvFr/kXvvr6f2MhPvSu6P19/TCoVmtjNDVwqmvvEpRHrbeU?=
 =?us-ascii?Q?Gir+wUL8OZTCQNelZZ3MaLcSFCHYXczumsI5jhUdeY6Vuf+8p2kZZcmsXfu1?=
 =?us-ascii?Q?QWmb0u9vtL1HwSev4piaswkRQt1WsDOxoDwiviY2COkWzz0LGDpsByzEWNS9?=
 =?us-ascii?Q?oPN5oaooBwo0NED+XjJnY/oAr61uyCCAc5WgMjMFDUA7naasq31/ukzpCQPU?=
 =?us-ascii?Q?MypzfAzKcDueSRZLq0cTA/l7Oz3EOdOFT9t52Y9nE6iaV6OI2OKfLFINvwZB?=
 =?us-ascii?Q?og6MHaYQUD4jWJnMNxlvr6Te6y9tFRnyaWIt7X1VqdQxZGQIeyXYAp76uplU?=
 =?us-ascii?Q?L9oAUB8m2F5CIViVchNDTI9l3lFGLRj5vhk1Z2/JIDooE3Pq6pqWaopf2AIV?=
 =?us-ascii?Q?1xDypl4+XkUeMCipPsHJe7sO1TzWBdGH2Z0u1zx/1t7sN4kihJPcqQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v00pPhBYxC90jYw+eA9WGkyYZjox4rJhCRmJqsjRNCXulyOxYZKBZgcvKgHm?=
 =?us-ascii?Q?6mn8wMBtjngTC0T1nNKTEwSMH49tOuGypVfzXmjlwpIL+DyEG3I8ZAfomZf6?=
 =?us-ascii?Q?3Fc/HrhrOWv/5ujOyc+lVZiL6/UdIBGLIO3LkBUmPQ6n4aJosFyqQI/EUENC?=
 =?us-ascii?Q?ZSyjSNHAp/2MM7RrpdcTgZG3MIaYSSS6pbe03K1wiUQnJaS5ZEUDostigj+N?=
 =?us-ascii?Q?iMVtYokPinzOZynWS5Yxb2hmJip4NYYXwzjDCXWDSuJOhLTfSxO1DRs27H8F?=
 =?us-ascii?Q?SfwBELsdHSpoSpiSBUl14B2rO2JNeiNWJxHlMXu2ukYgxEHiOunaQD7T/muW?=
 =?us-ascii?Q?B0beettl+OSFYncdmttODN/XcMOe0/psJdCHhNaqVhgehahGmcUJj9KKx7Ds?=
 =?us-ascii?Q?VOiY2nFOyYUgBB0P678XE8G5STRemqboeX366kMUVdwuq74g6EZNI2iiup9v?=
 =?us-ascii?Q?GhBwoXFImW8ixIFsWEfgHUF5BVZjcDzSEeYxb4SahCZkL8pCGezb+OvyL3rV?=
 =?us-ascii?Q?e8gYRlU9pmq9TJtXuf29yXyceG42vu64zEt3Y3UVaxB5ZxCTWeSu1LJgbuzi?=
 =?us-ascii?Q?CZQovVEoedItHAEQT+XWl4wapVOPIfPkoKAznkFpDCcuePq5c2Se9KeyepxH?=
 =?us-ascii?Q?sSondY1C2h/aGdTtp/xjv+X0D2yxgTvRvUGMGMImqYF25A/wNIKY2GB0JalL?=
 =?us-ascii?Q?V+CXysd+wEmWC+B6iH8IShyabIk7I8d1GHL4c8UyWHNORa7GJnOos7pzIZJK?=
 =?us-ascii?Q?HXbCA/H1dL0JIyH8gCJVaJ756V+4+pCiC+3NfUPatyolEwSuNAkt6lBJbsNP?=
 =?us-ascii?Q?o2LyRuuc6P1yPYgRX3oFIdEvfiWFylLinhqVddktwYkrzq6EtLjasha70CsD?=
 =?us-ascii?Q?slbNnalwn/k6lpGA3B/voHhqEMBbJAhiq5571h0uNb6RREaiDWCetDT5mmQ8?=
 =?us-ascii?Q?lZoX7y2k2Tvp0e9pQk0ZO6gb2EuaVN3P2Oh2Uw6da60Fd3D7QXBJroHmoUUF?=
 =?us-ascii?Q?0MqLNa3UwVCXsmy3N9E/chyr70j2RLdWjRNWwhH7s5yj8MP9BsANyGumBbwM?=
 =?us-ascii?Q?NgFrD/qPP/1hMaR2MU3QZrB3T/+5rILqZL/DZpNhV7WMU//nnzvzXHF9+qel?=
 =?us-ascii?Q?y/Bjr8vlt9gMinkO5fPnRTyqIvKMlESRPP4b4+f0URsqT7CepQEQD8AnOMP3?=
 =?us-ascii?Q?PpQiEw2izxPJRr98Bk6L+t9Teuy1sRhZFdFeYo+FY8oIc+ybZlH3Pp1OyL3D?=
 =?us-ascii?Q?tue7PPdtP8gPGTgON8eL9xY+s2TLkX9hHJzlXA4rmn0VKDNQnTRctEeJP68a?=
 =?us-ascii?Q?bQMWaM7x09Jezyghg4g2dgLaXn+nGPiNvyL27+2ahraW/WdboTgXAAz8li2W?=
 =?us-ascii?Q?y6Ob6/nj6c8bHK7cQMsPXpi6s4/ypV8K34hhEtwE+ygPuLTyWBi+1xPGsrj6?=
 =?us-ascii?Q?V8t1pif4KLwWbOo0qSdLIOFN8zbN8rBEFchhiGgItUoFlgGIiAiSjcQer58u?=
 =?us-ascii?Q?9pVCmjkGkPO/Oht0s0iGgrMhyYvRQ9K6usb8OLTPequiBcHbwN2YrwcbiwAG?=
 =?us-ascii?Q?0zRBUgA2bLVb6RCbnWs58RI6dINSBAVxLSwW17hVgq1jPT5jbP+rkrr8U3UA?=
 =?us-ascii?Q?tYGs1rgGvbOX8liON6+hj1DXuGq9PJFnvKnBCxM2r13U7e/9YVhrE/SY3uYP?=
 =?us-ascii?Q?R/x8Py+qWSUze31PGijzX0kS36iUr6sk9e5nzLiVote6lBkzAGbEPXSoR5DI?=
 =?us-ascii?Q?sG04GIIgSg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b87e89d-96c0-4a2d-ab3e-08de51b24a5e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:12:12.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUWgO/uTRHJ6e72eyOO21E7OT1sYWcWlBaWUilxVzcA8x3U67/3vo54aSNIvfiKb5LdRPx3GEGNLlJfvcu5LXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
X-Proofpoint-GUID: CWcRKnJKMRVc6IzCfxd7jjD6vydGth5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfX7epR27Ygl2PE
 pSX7/gAh6TRs95n+KY3NvKDM1xGeeKePh3rY/spjZ8vZGfgHZ6Dfc1rSHSFWRDid1UHD/ebEOIs
 8RwO7Qtj3iLTeMPMTmeA1pUpLH7g7qYYCxSwS2WE/bmFyQmdnt+2/VZclpBDkKuYDc//lb/Hpmf
 iJmmoDnfB6gXVXcYKW06KWjKH8UrAy6kaPaY3wY5h3uOijxkCbv4jEyYaWicgYA0V/mOj9FDXXt
 jkFsnRzt9Lo6HWShOd8KavcTdb9UcMgBy68qMfOja8qGl3mxSW+PuHyZMjZJJfHUyS8z3JLD/4V
 qLn1ftQJJIBAO5FRMDdr4b+WtZUWZE40Q+e44EDY7ggB9vItM4cQIFNvWdo8h4GKKUQRiZi5mzy
 AL8kv0VrsdDqLLC5NacR6jZTCzjFH2+6YcK7RI6DkPS7aafto3KFcaEMEkIYMSHmSxcRA8VQ15R
 zvizlzbmbYiLAdfgQ7A==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=6964acdf cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=92j3KeMvF2ysJ9yKw7MA:9 a=yG98XkLpjRIA:10
 a=-pDjxN4xWycA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CWcRKnJKMRVc6IzCfxd7jjD6vydGth5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229188

Create runtime and state directories using RuntimeDirectory and
StateDirectory in systemd service files, rather than creating them via
ExecStartPre. This is a standard approach for systemd[1]. When the
server starts, systemd will automatically create these directories.

Also, add more configuration files to CONFFILES.

[1] https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#RuntimeDirectory=

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V3 Change: update commit log

 .../kea/files/kea-dhcp-ddns.service                  |  7 +++++--
 .../recipes-connectivity/kea/files/kea-dhcp4.service |  8 +++++---
 .../recipes-connectivity/kea/files/kea-dhcp6.service |  8 +++++---
 meta/recipes-connectivity/kea/kea_3.0.2.bb           | 12 +++++++-----
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index aec6446f0e..feef7e0b6e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -5,8 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index a2ed4edb59..ce1256cf26 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -5,9 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index ed6e017d0c..6123a8ad58 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -5,9 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-connectivity/kea/kea_3.0.2.bb
index 30dfba07a2..11e9bd13a2 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -76,13 +76,15 @@ do_install:append() {
            ${D}${sbindir}/kea-admin
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
+    rm -rf ${D}${localstatedir}
 }
 
-do_install:append() {
-    rm -rf "${D}${localstatedir}"
-}
-
-CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf"
+CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf \
+                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
+                   ${sysconfdir}/kea/kea-dhcp4.conf \
+                   ${sysconfdir}/kea/kea-dhcp6.conf \
+                  "
 
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${nonarch_libdir}/python*/site-packages/*"
-- 
2.34.1


