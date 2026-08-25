Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190BFC61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11829.1787618779044578596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=awAv9PqG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0gJw4362264
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=; b=
	awAv9PqGSiQ3BhWNAyNXAFP8J2w7BVMyXK8Tvi9NHde6rvDyc9YHP/+HqVwLBuOq
	Uf7Q/8bK8tVbARLzJbJxZAkk4ltnE0Z1tv48g/DIfuEmmwm7cRlvBm6a+Fch+PQD
	Z6RyhkzVnl60h6YWWgP7vKaYWIo6HizRDtBj4vOrRP4TDWBLQSOQwuzgxEHGbEeq
	IGuosHsIv6vbjMbEzFj79ocWRBwARZhJlT+S5JKd5FiYBIb2VIUeHQ7mwJNTGAV1
	g789thlbBFqJzqe+iEVPy2ho3ZZ4nJ8Eph3910qdf8Zsak/SedLHAg1hvs4HQDKH
	QbkgqrG3WvNtVhto2tt+mg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100kr7y-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm+/wUKde6l6Bbo2gdHE9pI7RWlJmFDrpAbojEr4bpLNA0xZ5gDRpyr5U2pcD+mYSVlW7OHUeJmYkTnJ/Y9RW08+Ho8xvA7fsIw+Oc+1IoEkusspHGIR9+fVRYnKTSB7a2xkjP7l4mngqj6KXEhEeByjsAJKoy2DBs54mx0Uuct0HRGgl5WhdsCPqKbHNMvGUgL0KqEHfwvD5QrdJ9Px0uWdyOzkJjcWq4c398dj0Mlz1UXAvYu9Sf9w7TK4dLX0emnfEL8fCULiFR7KgDWxYTgEpLbyRsN/AxQGFrCicvyLdMp1z8Pz06gj+zC9/IpgOxus6+QVwlUUvifGK+doFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=;
 b=aL4WOMOafg4/qMjK5dSM5K4RTEGA45/7E3b1GfXjbeOpBgnXiAFN+ByPXQ2YWkHrjPJhX7N5anfzZ62Tr79cWrXb1uuLpMi2zQHzVNfjqU6RE8h/3XrKEHlbUYsGY4f2Y7rOGVizifMn44RwKoIfPlIEdndfmmANaeyX/5SRVz6wWESWtaEKqsrQF+k06EG+ddAEjz4e0DEQZWsJUeShfzRBEHfzsV5bTfARP8PSm0vM311fm6vRrGsRUZXmeWpKSq1QzmrBec0iIiWF9GL1hhDQaMwXowdBMxsYhVrDJ/9W1RxV10B90M6eXba0ficEdbS+gTwlKF4NI/LIo6YVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:15 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:15 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 07/14] libarchive: Make it work with rpm 6.0.2
Date: Mon, 24 Aug 2026 17:45:44 -0700
Message-ID: <20260825004555.4111831-8-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 70de0cf5-45f9-4a94-c667-08df0242447c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|11063799006|10067099003|12006099003|6133799003|56012099006|18002099003|22082099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	F98l0hQdfdC49OU6xWi6NwS83CWytl/3Y232TzWODYS+PJFr3rwO3djwy3N4tah7QmtzFXMbSD7kN5puzEdA+oavZ2P9bAJVJbk0wUj1roDtqr828Z17I9MbnCMK7q2+kc6Yyu8F+XGZgcixovKxrvzKvizfpGaxxzMP2eF0xb5YZMXQQVTOWHZimAwznbPxdgTER6Goxvydw/qzzX2ceLVgqLGndA959Xo5zrdMkqhnpL0UCbbRI6gwVcO3msjQ4WGhJPkyVEfy9vcztJQ1eEKc1Rn9iHt7VcE8VHB9I/Xs5/Ni6nYFvPJJusbJDyh+9B8pJEa9nYpDMEnOEYkoLlY+eo9vXZq22bUtr0aHlGXz54jNYGXY3s1d2BW/CvjhnfU5D75Rkr034omarwmshFEomSnxnG553NeQ92xFT9RgRhKky3vpERtenny3EjInw2lGIFfjqDheyP0Z7wAaoTzt/Tc+k3kMrk3sqGxM5eQ/rabBH/tTP3YMmHd2M++qoccirl5DYNtlC6pJbEYpg4dhnvj+QL6NJyPBECfGfJFjxWsZqZQOJ9YeODZw+GqzDzMNJu717oM97cjgq0ghsLxZdKTPt168SwaQ2bxITkeDVjElDBUskbW9Ckn0dYd9P5yKM6I628vi3IRUeo1JQ31MlpMRkgFmrEPnCxZurao=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(11063799006)(10067099003)(12006099003)(6133799003)(56012099006)(18002099003)(22082099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yQIUkBJHcjtPSdbLf3PVQAAuRMbKUBNg37HsXFXso0hh7mgZ0s5dRboKTHjf?=
 =?us-ascii?Q?kMAlwAt/mbDbCQmKdlsl9W4j9F1tnJnnWlaOkTQknmNqNeMM4utqb6Sr2WBW?=
 =?us-ascii?Q?0EBqglj1bhMTwlxcsHpeueBkw5fEysEFUc+/8I3JOGMdoP9moYJ2TdWB93TC?=
 =?us-ascii?Q?gjayHosMBTokCru40WQFGs4OTrhZ2vsACpZuo1QVgE14zd4l9hCrNrqsrSkQ?=
 =?us-ascii?Q?KhVh0ETxvQfUzSdQ6wBxYZc8Ys9pvxF25xm4jqHmRRlM0B9A7aRlTnyz9EzB?=
 =?us-ascii?Q?4IwPHxZRNZOTQfqKTm8HPvM3MFbdEDGNxwM/QMWYII+f20Mekl26bAl+JtLp?=
 =?us-ascii?Q?Yme1IOeCPSmsT79Ho+rBvL+Ya7vHuH4w8htyd4wtPRNwfx2XTJa8U5Y2XvIV?=
 =?us-ascii?Q?rCa8yv9LUx7ucLwBIjezOqz7r/BYol/CCMT/tosj29O/e1YEcmoP42cuor5b?=
 =?us-ascii?Q?Q7zc/TovJ9pgwKw2WfZK95cKl+vZ6HgRP135VmdRxnLR/lrX4vm1pgGrWI4R?=
 =?us-ascii?Q?6T1WsRpHKz0eAJB+kzmCAY+rZwbHi7T8AMNLNqlPMMJ79+RuLM325I8hD/ic?=
 =?us-ascii?Q?URZFrTvTEVFtySt1dkN2tr+Guu3/Ls4blyNyc/YDX32z96A1lGlrjy45hln6?=
 =?us-ascii?Q?fCsey0530db9KBFJO1Qv5TX6Jt/369zxPf4wfeyj0t/p9oIRfWhbv7DZrE0l?=
 =?us-ascii?Q?aE3e/Mm8MXIQ5JftefH+V5wNHma3CKRzNTeS6hG+crY6DttvCB6euGzWnJDm?=
 =?us-ascii?Q?2iyCerYxFBrjvhy4UdUqdNRXwkiTZvhATfbeNGjxeiAiiSfsYNyATtSNYSIH?=
 =?us-ascii?Q?IWWqm8Gaey0UgSKFuljEMA/+nlXSM2P0YtW3XmtlEBmEOFDwZ8BTRMkleCPv?=
 =?us-ascii?Q?OjcNglHQQ2+SBBFt+1VVDwu3M7NAvxv8HEhWZTa1VFtchLTSOaX2bYXRiuhk?=
 =?us-ascii?Q?Lf6w0QPF8Scxawsr7YRTHllfotd/zFO9mxF6KjfFLcOSr18+okYLo1Kvq0Ol?=
 =?us-ascii?Q?rz3y9gswq1TgK+AAuJPaKaUHHSSIT59xPn2hSNnBtAWAp44lIk5XZocbOpPh?=
 =?us-ascii?Q?CAeE2QxWs7TrEwdwllf1zv82u7K8YaEFO2lFuD2ZaB95cNB9RMsbV9Pr4Gdy?=
 =?us-ascii?Q?Ow9uN+cK45fTOpBHUQ7prwkFT5WDO5uWs7i6XKR1yvdtJN2fI71fSpnKBM2F?=
 =?us-ascii?Q?XVQvvWamHZpJDM16QJALL7LQ09zYCeUVrYtTwf83nKlumL2eWiH/uTn306tH?=
 =?us-ascii?Q?YxtooyTly3inaq85yglJMOc/vnp9p6WlMbhLQrLQDVBLDwT2bU5qpGX7orAM?=
 =?us-ascii?Q?fxpRtBIJnDVGrj4RTFg2ec9N7wp+1eXkY4MVYer606czYz6SLXwRt2P6ssg0?=
 =?us-ascii?Q?MS039g9ECrtCw5nhyp0AH8uNY5dvKDtghu1nOg79DW0YjuLoHrS2rov+mTHN?=
 =?us-ascii?Q?RVXG+X5OC7yLNZZ3dZXI9TN5SBpx3wB88SjbbAxdyAf7+27sCyGa6tABlvze?=
 =?us-ascii?Q?D73I+XC+VMZEoq/2YHQQfQLHWZo8K/+N6nlP8ReNHTfGb2BYQKyiHTL0Wz0F?=
 =?us-ascii?Q?VWW2dV+Eb5McjlzdWUKc/rYYXdH27agSadbyI4SII3rZ/R6aE8PwTQ/GIWrt?=
 =?us-ascii?Q?MGbmuo+OzcRTj1/HGWJfxLjIu5IuayFb8bemwSIrvRr+FTXtclHPMQH3V9LO?=
 =?us-ascii?Q?AR/aTGCeIyQjuH0kkkix0FXVNNQF+7qSdTcz8tKMncJxtfipH5YgGmdOyJ7S?=
 =?us-ascii?Q?HDApk4lM6LQiziW7U7uCP19n5//xtn4=3D?=
X-Exchange-RoutingPolicyChecked: 
	NZJJbSsRmJ6kggzG2mGB5A6YHCuNEsd3p5QIRbelt8b2p9WYzaJ1qFzsRGj1Beg1r5ulSyOIGFF6AcXFy6QAHXo4rACBBqmeufZ81jqcZR90DU7USeVXADbyhMVjrQguDjSTJFy3eSAfsd3pb9w2lS+aYb+ojbpjgUX8izGSmZi/hF5LPJ3QiaaIinmFye1kFLgflCieWjvmkUzzQpek5qa4BWqPjWhJF1gXp0yo1YHpaW4PIqkEQOLfWNJ9s90gzz1DIdGJ1CTN6vgaKX9tWSiQ7ymOjgjnoxlr3mcDnnux3WzVQfLWM6e05J7pw4DXqHJ/2fcimOjhnNhXjQxydA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70de0cf5-45f9-4a94-c667-08df0242447c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:15.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KbtEgzOO35ryHw//1H4mFgXym6Fabt+bKwq1N5i6/E5a6UKk5e8sc2XmeK5f4gU9Ml2qHy7IMMHNksefJ8bBRbnLQvjfn0KwX8l5gFm7EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: T8asH18mZVGGeodf-DwLVzu40EK-4UHv
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8ce5d9 cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=yC51jOswJ7eKArgWbMgA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-ORIG-GUID: hNE_KpWCYeaUhAl_y8Q6dGdyTR6oRv3n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX+csoPC71cZm7
 2xUydUP/ZWTqAZnbKtabPgDWaSdslLznm/U9lphzWNgl66U59suJeQwzTPUVDnenqzKONYsC5Dc
 FYKaaERofU11lRahp7WroECT3le3slHPidycDwijrv4N8HyPqg52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX9iOUq5VAngyE
 /PgHVpwhucqpxEM9LqlnRz7CwA4gRJnaOoRPJ9pyoDHL7PKz3nRU05kCiynGncXdrrmW6CQzplT
 tU+rQZQobMwktQmjx6A2nuUv3/I96lvE26y4J/KUNmqRDtj+pv24Bdeh9ueGEn6PLDIlovZFXFk
 F9jxYas6wWKm8Ca78YFNwrGj0DWBjFyuF7c0oe7YxrKk5Qdppno3ZEP65FhGAZsp6gjh96APTFu
 oRGL3ZqRQ3RxcauuE2OafQKOYW6YvBVSrmaQ2TzLkothfGg5abcDKGJg810FaKxC2VK+RhrjpU3
 4HsE/KMFh8SbtVOwSlDo4BP1UOTquRHlF0eisv55zmdgpb9Dcyl0vP1WrpnJQi255qW4mR7VGOj
 JIIvgdQLW0Yg8dA1WE/FgjAFkKWINIbmZTpkQdd8Ewq3oW2j5dE27J4f7952FKr3zujct/SUKWe
 Evxe2ca2XvVVtH2lcJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244163

The patch is from:
https://github.com/libarchive/libarchive/pull/3346/

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe
/path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive format
exceptions encountered during archive scan

Note: 0001-append_filter-Use-last-bidder-for-filter.patch was already
present from upstream, so only the remaining two PR #3346 patches are
added here.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Verify-that-bidder-and-filter-match.patch | 103 +++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   2 +
 3 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
new file mode 100644
index 0000000000..a91f518207
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
@@ -0,0 +1,103 @@
+From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:26:22 +0200
+Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
+
+Make sure that appending a filter always matches its supposed bidder.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
+ 3 files changed, 56 insertions(+)
+ create mode 100644 libarchive/test/test_archive_read_append_filter.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 2fb4fdf4..c96b3bc6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_archive_pathmatch_oob.c \
+ 	libarchive/test/test_archive_read.c \
+ 	libarchive/test/test_archive_read_add_passphrase.c \
++	libarchive/test/test_archive_read_append_filter.c \
+ 	libarchive/test/test_archive_read_close_twice.c \
+ 	libarchive/test/test_archive_read_multiple_data_objects.c \
+ 	libarchive/test/test_archive_read_next_header_empty.c \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 44f839f8..c4102c3d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
+     test_archive_pathmatch_oob.c
+     test_archive_read.c
+     test_archive_read_add_passphrase.c
++    test_archive_read_append_filter.c
+     test_archive_read_close_twice.c
+     test_archive_read_multiple_data_objects.c
+     test_archive_read_next_header_empty.c
+diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
+new file mode 100644
+index 00000000..5c301d52
+--- /dev/null
++++ b/libarchive/test/test_archive_read_append_filter.c
+@@ -0,0 +1,54 @@
++/*-
++ * Copyright (c) 2026 Tobias Stoeckmann
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive.h"
++#include "test.h"
++
++DEFINE_TEST(test_archive_read_append_filter)
++{
++	struct archive *a;
++	int r;
++
++	a = archive_read_new();
++	assert(a != NULL);
++
++	/* Append a program bidder (without filter). */
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_support_filter_program(a, "prog1"));
++
++	/* Append a filter program which comes with its own bidder. */
++	r = archive_read_append_filter_program(a, "prog2");
++
++	/* Verify that filter uses its own bidder. */
++	if (r == ARCHIVE_FATAL) {
++		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
++			archive_error_string(a));
++	} else {
++		assertEqualIntA(a, ARCHIVE_OK, r);
++		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
++	}
++
++	archive_read_free(a);
++}
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
new file mode 100644
index 0000000000..bbd2478577
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
@@ -0,0 +1,258 @@
+From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:31:33 +0200
+Subject: [PATCH 3/3] Remove bidder name
+
+The name was only needed to find the appropriate bidder for a filter.
+Since this has been resolved by accessing the last bidder, since in these
+situations the bidder is added first, then the filter, the name is not
+needed anymore.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read.c                         | 2 --
+ libarchive/archive_read_append_filter.c           | 1 -
+ libarchive/archive_read_private.h                 | 3 ---
+ libarchive/archive_read_support_filter_bzip2.c    | 2 +-
+ libarchive/archive_read_support_filter_compress.c | 2 +-
+ libarchive/archive_read_support_filter_grzip.c    | 2 +-
+ libarchive/archive_read_support_filter_gzip.c     | 2 +-
+ libarchive/archive_read_support_filter_lrzip.c    | 2 +-
+ libarchive/archive_read_support_filter_lz4.c      | 2 +-
+ libarchive/archive_read_support_filter_lzop.c     | 2 +-
+ libarchive/archive_read_support_filter_program.c  | 2 +-
+ libarchive/archive_read_support_filter_rpm.c      | 2 +-
+ libarchive/archive_read_support_filter_uu.c       | 2 +-
+ libarchive/archive_read_support_filter_xz.c       | 6 +++---
+ libarchive/archive_read_support_filter_zstd.c     | 2 +-
+ 15 files changed, 14 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index e844e42d..406d84de 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
+ int
+ __archive_read_register_bidder(struct archive_read *a,
+ 	void *bidder_data,
+-	const char *name,
+ 	const struct archive_read_filter_bidder_vtable *vtable)
+ {
+ 	struct archive_read_filter_bidder *bidder;
+@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-		bidder->name = name;
+ 		bidder->vtable = vtable;
+ 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
+ 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9dd9f536..5cc8ff55 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
+     __archive_read_free_filters(a);
+     return (ARCHIVE_FATAL);
+   }
+-  b->name = a->filter->name;
+ 
+   a->bypass_filter_bidding = 1;
+   return r;
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 3bd8de2d..e30b6c2b 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
+ struct archive_read_filter_bidder {
+ 	/* Configuration data for the bidder. */
+ 	void *data;
+-	/* Name of the filter */
+-	const char *name;
+ 	const struct archive_read_filter_bidder_vtable *vtable;
+ };
+ 
+@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
+ 
+ int __archive_read_register_bidder(struct archive_read *a,
+ 		void *bidder_data,
+-		const char *name,
+ 		const struct archive_read_filter_bidder_vtable *vtable);
+ 
+ const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
+diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
+index 588953f2..1cfc55dc 100644
+--- a/libarchive/archive_read_support_filter_bzip2.c
++++ b/libarchive/archive_read_support_filter_bzip2.c
+@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "bzip2",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&bzip2_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
+index 4e1f1dc5..4763995e 100644
+--- a/libarchive/archive_read_support_filter_compress.c
++++ b/libarchive/archive_read_support_filter_compress.c
+@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
++	return __archive_read_register_bidder(a, NULL,
+ 			&compress_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
+index 9d9ad46e..8457ec7c 100644
+--- a/libarchive/archive_read_support_filter_grzip.c
++++ b/libarchive/archive_read_support_filter_grzip.c
+@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "grzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&grzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
+index 89ae0f37..34b174b7 100644
+--- a/libarchive/archive_read_support_filter_gzip.c
++++ b/libarchive/archive_read_support_filter_gzip.c
+@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "gzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&gzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
+index 33910fe1..a1d45d77 100644
+--- a/libarchive/archive_read_support_filter_lrzip.c
++++ b/libarchive/archive_read_support_filter_lrzip.c
+@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lrzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lrzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
+index 19086a1f..28189a07 100644
+--- a/libarchive/archive_read_support_filter_lz4.c
++++ b/libarchive/archive_read_support_filter_lz4.c
+@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lz4",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lz4_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
+index ebfaf01e..5a552fce 100644
+--- a/libarchive/archive_read_support_filter_lzop.c
++++ b/libarchive/archive_read_support_filter_lzop.c
+@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzop",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzop_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
+index cf7c3613..a9e02a32 100644
+--- a/libarchive/archive_read_support_filter_program.c
++++ b/libarchive/archive_read_support_filter_program.c
+@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
+ 		memcpy(state->signature, signature, signature_len);
+ 	}
+ 
+-	if (__archive_read_register_bidder(a, state, NULL,
++	if (__archive_read_register_bidder(a, state,
+ 				&program_bidder_vtable) != ARCHIVE_OK) {
+ 		free_state(state);
+ 		return (ARCHIVE_FATAL);
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf7..1cfddf75 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "rpm",
++	return __archive_read_register_bidder(a, NULL,
+ 			&rpm_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
+index c0f6f48e..10d49648 100644
+--- a/libarchive/archive_read_support_filter_uu.c
++++ b/libarchive/archive_read_support_filter_uu.c
+@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "uu",
++	return __archive_read_register_bidder(a, NULL,
+ 			&uudecode_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
+index 7c8e0cb5..b00ba543 100644
+--- a/libarchive/archive_read_support_filter_xz.c
++++ b/libarchive/archive_read_support_filter_xz.c
+@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "xz",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&xz_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzma",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzma_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
+index 12eac04c..163f54b5 100644
+--- a/libarchive/archive_read_support_filter_zstd.c
++++ b/libarchive/archive_read_support_filter_zstd.c
+@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "zstd",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&zstd_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 868086e319..01a5249a88 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
            file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
+           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
+           file://0003-Remove-bidder-name.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

