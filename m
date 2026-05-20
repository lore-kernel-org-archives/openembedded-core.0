Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65CCCD4F3D
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 17:16:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17800.1779297356877052019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 10:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L8tUSBaj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96001520eb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFC5SS2800008
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:15:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Iuf4fxpmY
	M/Nix+5inenavtNwz5Xkv2ElJTOlvhMnQc=; b=L8tUSBajk5Q2B0/Kr0bxNXpwU
	28IL8B0Y9ZsN2anwyC+XjAjXm9TY1DVnWy6i0rhhxNteY9Zyu9ir73AwEg7PbjA2
	+xP/6ondaYT9JgCrTZYg3tx7qsYmDcYlOCMTMcf7kA+/B4XNI6mo00REz2fkUzP8
	UnkhZNBYZwCe0vQ6K4MiwCgIesmdxHbEr5SUWn+IrXdA4M6M0UJsy0OZBJuFOWRd
	h0gy4jFLZsgMMmclbK+poiqdmrQhc/Cj0iXKdzeno3qD5jUmekgQincPHg5GjKxa
	uLh9UNiDBGEr7oINClEd4lZgQz4QXvlmDli2d8R68xucnwhMQp5qCiCQZTpoA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gdkyt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5w8u6UrGActl7FTETlPN1C088DrcVcc5h6QniDU7ur0xXOUAKoZvihF5m1B80O9IeZUK6SHvmTlieLIAX+mcF9/GrqvJU9DBvGGBdlB72hQ0LPgnMJLaIi5NaVrG/kRQKPbmZ4crFugg8XMIYTwdeK9ZeqehoH0kAQIpNPA0usovNMzzhZaTovsx212L7ziAIcVT4ZJh1cCVxD7pymXOUvZAI/e1n92N/ZTuoGNDmsYGUjnANdTVVjmCJfZIeTh/3il3SRGvdxo9DL4yFIh4+wF15qewyuR2jJKD423U9cRqEMR/pzx8zSjgFxW9idfv/SG286cj7mznpIBjpM9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iuf4fxpmYM/Nix+5inenavtNwz5Xkv2ElJTOlvhMnQc=;
 b=n+1KRhw0TRsuG0C7t/PBw/5I0aVIcbTOSkLnwX284oY/RiE5A1xMgNxhSNeMkDcjT+x+jpEFm3MQhwggmxF/Q2hk0KY50eS+0AU10nUbOrHFALqFZRd7a6150VssjA56StYtjDrrwIxZIqq9JqD5Trh4OKjBf0eF1duNtg2+kM7trwZQorveFHO6WdUvwisvUWmxx05qNtUTml3NAp7+itpMyizAP6N8TN6QWNNv3jDEsC6ZHePk1Tx2WQg0kY+3nJdEO248PaHYUToWRo2KVca0k9A0DbS3Q/iEoqijiTK1dxO4Me5aerhmokn7ptm/MDwbRasVMLTssQ9AzpjNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CH9PR11MB9904.namprd11.prod.outlook.com (2603:10b6:610:343::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 17:15:53 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:15:53 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH] gdb: Upgrade 17.1 -> 17.2
Date: Wed, 20 May 2026 10:15:37 -0700
Message-ID: <20260520171537.931621-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P220CA0037.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::30) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CH9PR11MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ca8e33-ee18-40b6-5a17-08deb69372b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|38350700014|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	REo7sgEofCAtJD77i14ynW8Lklqv4hgZYyUeTucKiOlYAiUGwUGEYt6xktI/RpfJN2EZAUQMSnqLidN7mv+sXITxVY8n58R3SCuJVIJ0ySYZYfo34Zp5KaDU+fm19BsIkD1kUJx9aX7Hmhbv5hWEnAhCtm6IZRu2bc3b6H+JFt92YNiOESr+1REoyXmxT2ere982wz4ibufOBz5I5t3JrSEj1Mo8Sbz9kYQ/Ni+KGcIdozG1BwHCtvPW6Ex9S2c0ccU+1+FKfcbD47vdlPpYYImQrFd3u99ceKFMCmEgyITI+A01uHa4xdz9mNn710qzkBnPb/tmzOoxBvCbBONW6lqen6HJGUdjWgrckIQcIR4sI4reSi5WQtwt67fIDrLnPqGzyxN5VJooJh/Y2fckgvSqcIOSZx4WRpFg4KMnw4M0C6JGlEufxAg9TN9PlLJsBhdBbkNeu1t+nTc3VkZgsy4yW4Qy7bgz0O2b8/Su8OXKSOwrk47eHrzUugKdRLcllSmp5Dvvt4Tmn4wyZxElVwum7SCb6r1mj3vHqcbet8RHUEp0gCMbkIxEocHHMYEbXv4n5RhxbUArg0DexI/VHeEupWRFGIRwkTj4w2p5zw9KAvsj7YUEt6q2E5WxLa4A8CcOVt5z/Ch/zmcoUVB6kcQH0xoTOXe91WNBZKCwTfWRF1ppVIN9zC/ibVldxLtRQYGrq+4pGOVaW2oKpIh2WA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(38350700014)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XHhr8FW8jbRUZvhGJnyc/aCALvcGvZipJgHSnWpkK6gKL3k8KhDDOWnNI5An?=
 =?us-ascii?Q?VQ8W3edsOuCefvcJG5xUkXWhflxSpAWJGIxSxBSuBKSfqdNPs0Me//WjT4Xa?=
 =?us-ascii?Q?hR6ymdyAAuFBsgUgdfz0L9uXCyLOGRvcX9qdBiu7eI9rUYTS76visMOTTLbk?=
 =?us-ascii?Q?dRZLWC1dRHtHWl1I4Vm5+hLnMNqOY3Vx5FmLxQvEVKIk3qEbnHzWb9YTgv08?=
 =?us-ascii?Q?9EYK7DahcghJ4nenh3HH6FSD4kSOJ8z8KM2ab7m9bblHIAbg5JTgEZKPxUZu?=
 =?us-ascii?Q?Kz7300ShXZllswbzVi2FBd/5yQ8OHmF/TAXFkbWkVy/Ty/cJls6Sv5qNdKlo?=
 =?us-ascii?Q?D9tInZ2NNw4UtKPkCaiKi3jEXCC5mieTBe9U0la0Y9l6BD+cllJOk9Iksyhy?=
 =?us-ascii?Q?8O725/PL6dlOzg1WyncqaSP6+lwAQbbB4TKK2mNpWt8m/lMkQ9yle/HPwlHj?=
 =?us-ascii?Q?UlYEGRhLXb1WUmJYnh8Vt90s5l9lsBozOZ7rOvFjsl0hKzibVXV6E9zLaLZh?=
 =?us-ascii?Q?rVbP8CPPhJZkxgQZIS0TpFvWWeD2sQFTHC5EwbxvbjMyYmY0yPjOhyrmwgWj?=
 =?us-ascii?Q?ubuXjK29KTYQuSNjwi61MDFobMKY30Ogv1VExuuNRI7nM/ovNEg+Q0CTGbMv?=
 =?us-ascii?Q?ADW/NpEiZRIO5zkAwQMhOdX79wXD0B4ivXUWjoebOcwaJ6WE4NPPPm4mlolb?=
 =?us-ascii?Q?LITHYj393Di6HZq5ZQXROxiItsSY7FjvMk91GrwVQsmLLp10T4+qQglOOEFG?=
 =?us-ascii?Q?sD2KvcbBgQ6ZPex04LxEV9AEZOeVWc8ea8KR5DqXWFJjHesJr20bF4VYeJhi?=
 =?us-ascii?Q?qCZMmZuGUd74CoiGARWzR4nwJyojYC0pdDfZeENrFge4230B9ZsAdO3Cegc7?=
 =?us-ascii?Q?edSIwK7mpU4MWSVJODzWCv5B2LrXLEomYBeiGl58bPdrjL8061AnfhhO7xck?=
 =?us-ascii?Q?1naHKzf+rPAqZ4v0fwVwCEU0zzgFA4ChahVtV7PPiO2kTEA2Hkun95TK432w?=
 =?us-ascii?Q?YjCwhP+ERY9qNNC1G92YgXhzWgnmYJ5ia7GQ2QOzYA/q823BP5LS3OH6ruwy?=
 =?us-ascii?Q?gho/WuxQc85eYc2Z39Jmcst2k80AvL0GpTvmGpUq5OX1IGezWs09OiRKoWKc?=
 =?us-ascii?Q?cAxn2g442cQ2Q6eIUFjRdBbNpIH0vxfxSd94pe5IGZQzAmOuKuMocA8tr7Xt?=
 =?us-ascii?Q?jbS/EY1QFXRny2yJJGi73Mr1G3lR0RfJDYum/oczGOY7uk8IZWkCfC/EMDGE?=
 =?us-ascii?Q?b+DEHIhTlNpKMKwdk8CfdJKkJlkH5shmcZ59cyVab4ePUj0jXUziEEZ1KYdC?=
 =?us-ascii?Q?rQct3PXhFbXtlf25HicuHw/6rojIKZqPAPGYHjJZra0TVLPT7nECbWCxeHf0?=
 =?us-ascii?Q?z+1REa7Q0rMg+La6/hkbaIWTjKgcbWwK3L3jQIm0YmM71P98jMgNE1pOkW7U?=
 =?us-ascii?Q?i8wVJMCUopxwbTHMkQGUB0ocknhhoHaHcchOLQtLZcAzhKf4J0zmLG9k/3XT?=
 =?us-ascii?Q?txYqmqPstbTUvmgAM3vxyCLzNtr8ZUatEKTa+zbm7QybySmu3V6P7aDp4UG6?=
 =?us-ascii?Q?EpgTzFB9Cjx7n0f3CL8E6WK/TBhwQKAgtGuvdTA9wvQgAWkR0pdRWk7wsfd1?=
 =?us-ascii?Q?iquUtJX7e5OvsrilN+YN3toT3g3/D58Gfhx/WMuavYnqiiUTSpxxWt5w6be2?=
 =?us-ascii?Q?+1PkWpRNciwz3CR9b7vUoCnq3YwQrPYwW4YwZtb+DR4Ew+Jeg4x1sWwhWqhu?=
 =?us-ascii?Q?tmrfKfzxbz4a32O2WBQdo5EkWKeUPUc=3D?=
X-Exchange-RoutingPolicyChecked: 
	K+Wro+Dr7Ayytix1DHF2vtMDo924HX/HQjk20rTienHFZtHDjFPgyHQcc7AM356qdY8W3ktBrJtC3fts6ks46ZlwPaIl4FNAzO+CsM/9ZPBnnjrxzUba/X+ztxvYZ6ZtCjyB1oYZxzkuRAuxMTzsgVWLbeo3/QHAkMJ6Fh/7OJNddxmTg/EwyyUmT7q1ouCfHpDhuPHLOG1EaF466b9jxSJM2ElJbKX/+PPMYEL/fITBvztB+HHezPI4XW4yxOpLQ4EdPCnuZzP07dSylrGGpGSfMF2thfPPgJ0QS8PltlBhgJVrOHWT3aMNCZakecsGA+2fcqHDXnEhxAul1dqQQA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ca8e33-ee18-40b6-5a17-08deb69372b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:15:53.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tS2a3rnpGDhdyidMzibVeKwhaqBBf7bl+uB9iYxFFrmzp3gmNmrOoqy5JduQU06Bm1VucOmvjpi1v2xlq5InPGIVXMDRUKT3DQnu3gtRPPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9904
X-Proofpoint-GUID: DZuyo1g-EQUMOjoBbn__WGW5J-wAmRkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2OCBTYWx0ZWRfX8lCdG4SEB0QP
 sAIKpcASGdHfIX9kuDiH7xLALAB0NSO9YMgec0g5PDj4ewte62qFvVxFw7ga/EvsxpUVb9xyRe1
 CqkbPNbcWIZWXJVlWYW2k7OhIiCE6LRcefTbFMS4GWrHQThb843pwS+9Hj6Ap4orbFUCh1iQGLS
 tI3ANFxjQUw04Z1o8YngMUPf1lNYalWnd0uD0s+OIb5hXIdS5oR8Tk7nFb4mJPiasPNG8x1STMm
 Uumh23lotqipL/1IICakJW9GuXKZv7nRsnVGAJlGwHCBgolZJOMnSGwvh3iau+PP9SW0uejkz+h
 FzBbRXINFvTVv41FRYedFz8ZsewVi1tI8eFh/FHskNUwL/HmtDBt+ai4G6qvDYTZZn1MJOLKKIw
 hChKonQQaYSrvdHUDZuBY08h3/+mlrwL0WePajDs6DNADFKnpgy9vCSmBvXeOrZo4sPY1JdKb8R
 AMM0k0veD38e2jhN+0Q==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0dec4c cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=m7CUszNA7STTOgLsIdMA:9 a=HCINmKHFQ_U6d0ff:21
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=MNXww67FyIVnWKX2fotq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DZuyo1g-EQUMOjoBbn__WGW5J-wAmRkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 17:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237458

From: Sunil Dora <sunilkumar.dora@windriver.com>

GDB 17.2 brings the following fixes and enhancements over GDB 17.1:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.2-release

 * PR dap/33228 ([gdb/dap] error while listing register children)

 * PR gdb/33737 (gdb --help says 'For more information, type "stream"
   from within GDB', but "stream" is not a defined command)

 * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
   in 'termios')

 * PR gdb/33748 (gdb17 regression with displaying ANSI colors)

 * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
   and static data don't mix)

 * PR cli/33761 (Setting style colors is broken on MS-Windows)

 * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts fails)

 * PR symtab/33775 ([gdb/symtab] data race in
   dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})

 * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache result
   for dummy CU)

 * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compressed
   debug info (thousands of partial units))

 * PR testsuite/33845 (gdb: There are 4 unexpected failures in
   breakpoint-in-ro-region.exp)

 * PR gdb/33872 (`skip -gfile` has inverted logic)

 * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on musl)

 * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matches
   outside of `file` [reproducer attached])

Drop patches merged upstream:
  * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
  * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ian_17.1.bb => gdb-cross-canadian_17.2.bb} |   0
 .../{gdb-cross_17.1.bb => gdb-cross_17.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
 .../gdb/{gdb_17.1.bb => gdb_17.2.bb}          |   0
 6 files changed, 1 insertion(+), 447 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb => gdb-cross-canadian_17.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb => gdb-cross_17.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_17.1.bb => gdb_17.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index d367486d02..cbb5885459 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,7 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
-           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
            "
-SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
+SRC_URI[sha256sum] = "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
deleted file mode 100644
index 30d22b21f9..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Tue, 17 Mar 2026 01:58:55 -0700
-Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud rate
- support
-
-The Linux custom baud rate implementation previously accessed the
-struct termios members c_ispeed and c_ospeed directly. These fields
-exist in glibc but are not exposed by musl, causing builds to fail on
-musl-based systems.
-
-Update set_custom_baudrate_linux to use a capability-based approach,
-with three distinct code paths:
-
-1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
-   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
-   speeds.
-
-2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
-   use it to support arbitrary baud rates.
-
-3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
-   the TCGETS/TCSETS fallback (primarily for glibc on older
-   architectures).
-
-4) Otherwise, emit an error indicating that custom baud rates are
-   unsupported on this platform.
-
-This preserves existing behavior on glibc systems while restoring
-build compatibility with musl and other libc implementations.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
-
-Suggested-by: Kevin Buettner <kevinb@redhat.com>
-Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/config.in    |  6 ++++++
- gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
- gdb/configure.ac | 22 +++++++++++++++++++
- gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
- 4 files changed, 119 insertions(+), 16 deletions(-)
-
-diff --git a/gdb/config.in b/gdb/config.in
-index efc3100cb9e..b2469c8dabd 100644
---- a/gdb/config.in
-+++ b/gdb/config.in
-@@ -110,6 +110,9 @@
-    the CoreFoundation framework. */
- #undef HAVE_CFPREFERENCESCOPYAPPVALUE
- 
-+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
-+#undef HAVE_CFSETSPEED_ARBITRARY
-+
- /* Define if compiling support to gdb compile. */
- #undef HAVE_COMPILE
- 
-@@ -517,6 +520,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
-+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
-+
- /* Define to 1 if `td_pcb' is a member of `struct thread'. */
- #undef HAVE_STRUCT_THREAD_TD_PCB
- 
-diff --git a/gdb/configure b/gdb/configure
-index d0bdba6eb36..8a0e2fa2771 100755
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
- fi
- 
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
-+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
-+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <termios.h>
-+int
-+main ()
-+{
-+
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_cfsetspeed_arbitrary=yes
-+else
-+  gdb_cv_cfsetspeed_arbitrary=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
-+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+
-+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
-+
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
-+"
-+if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
-+_ACEOF
-+
-+
-+fi
-+
-+
- 
- 
- # Check whether --with-jit-reader-dir was given.
-diff --git a/gdb/configure.ac b/gdb/configure.ac
-index 52924106bca..26e8d1ee276 100644
---- a/gdb/configure.ac
-+++ b/gdb/configure.ac
-@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
- 
- AC_SEARCH_LIBS(dlopen, dl)
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
-+  [gdb_cv_cfsetspeed_arbitrary], [
-+  AC_COMPILE_IFELSE(
-+    [AC_LANG_PROGRAM([[#include <termios.h>]],
-+      [[
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+      ]])],
-+    [gdb_cv_cfsetspeed_arbitrary=yes],
-+    [gdb_cv_cfsetspeed_arbitrary=no])
-+])
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
-+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
-+
- GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
-                 [directory to load the JIT readers from],
-                 [${libdir}/gdb])
-diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
-index 6f2766518be..fbd73970dbb 100644
---- a/gdb/ser-unix.c
-+++ b/gdb/ser-unix.c
-@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
- 
- #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
- 
--/* Set a custom baud rate using the termios BOTHER.  */
-+/* Set a custom baud rate.
-+
-+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
-+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
-+   (BOTHER) or legacy termios interfaces.  */
- 
- static void
- set_custom_baudrate_linux (int fd, int rate)
- {
--#ifdef TCGETS2
--  struct termios2 tio;
--  const unsigned long req_get = TCGETS2;
--  const unsigned long req_set = TCSETS2;
--#else
-+#if defined(HAVE_CFSETSPEED_ARBITRARY)
-   struct termios tio;
--  const unsigned long req_get = TCGETS;
--  const unsigned long req_set = TCSETS;
--#endif
-+  if (tcgetattr (fd, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  cfsetispeed (&tio, rate);
-+  cfsetospeed (&tio, rate);
-+
-+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(TCGETS2)
-+  struct termios2 tio2;
-+  if (ioctl (fd, TCGETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  tio2.c_cflag &= ~CBAUD;
-+  tio2.c_cflag |= BOTHER;
-+  tio2.c_ospeed = rate;
-+  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
-+  tio2.c_cflag |= BOTHER << IBSHIFT;
-+  tio2.c_ispeed = rate;
- 
--  if (ioctl (fd, req_get, &tio) < 0)
--    perror_with_name (_("Can not get current baud rate"));
-+  if (ioctl (fd, TCSETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
-+  struct termios tio;
-+  if (ioctl (fd, TCGETS, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
- 
--  /* Clear the current output baud rate and fill a new value.  */
-   tio.c_cflag &= ~CBAUD;
-   tio.c_cflag |= BOTHER;
-   tio.c_ospeed = rate;
--
--  /* Clear the current input baud rate and fill a new value.  */
-   tio.c_cflag &= ~(CBAUD << IBSHIFT);
-   tio.c_cflag |= BOTHER << IBSHIFT;
-   tio.c_ispeed = rate;
- 
--  if (ioctl (fd, req_set, &tio) < 0)
--    perror_with_name (_("Can not set custom baud rate"));
-+  if (ioctl (fd, TCSETS, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#else
-+  error (_("Custom baud rate not supported on this platform"));
-+#endif
- }
- 
- #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
deleted file mode 100644
index 2d91a351d2..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
-From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
-Date: Tue, 17 Mar 2026 02:24:48 -0700
-Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
-
-(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
-
-When building against musl (e.g. on Alpine Linux), the following error
-happens:
-
-    CXX    linux-aarch64-low.o
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
-  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'
-     35 | struct user_gcs
-        |        ^~~~~~~~
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
-  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct user_gcs'
-    329 | struct user_gcs {
-        |        ^~~~~~~~
-  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
-
-aarch64-linux-tdep.c fails to build in the same way.  This happens because
-aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
-have GCS-related definitions.  The problem is that GCS_MAGIC is defined in
-<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
-It's fine on glibc systems because in the set of system headers that
-linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h>
-ends up being included implicitly as well.  This doesn't happen when using
-musl's headers though.
-
-There isn't a macro in <asm/ptrace.h> whose presence is correlated with
-the presence of the struct user_gcs definition, so a configure check is
-needed to detect it and conditionally define the struct.
-
-Also, this change requires aarch64-linux-tdep.c to stop using
-struct user_gcs because target-dependent code can't include <asm/ptrace.h>
-and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
-struct definition available. To fix this problem, also backport the
-definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
-
-Note that there's another build issue with musl, described in
-PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
-able to test this patch, I applied the patch in comment 11 there.
-
-Tested with a native build on an Alpine Linux aarch64 system, and also
-verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
-
-Co-authored-by: Chris Packham <judge.packham@gmail.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/aarch64-linux-tdep.c     |  5 +++--
- gdb/arch/aarch64-gcs-linux.h |  8 +++++---
- gdbsupport/config.in         |  3 +++
- gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
- gdbsupport/configure.ac      | 19 +++++++++++++++++++
- 5 files changed, 66 insertions(+), 5 deletions(-)
-
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
-index 76bde85188b..6c402e7ecdd 100644
---- a/gdb/aarch64-linux-tdep.c
-+++ b/gdb/aarch64-linux-tdep.c
-@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
- 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
- 	};
- 
--      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
--	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
-+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
-+	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
-+	  "GCS registers", cb_data);
-     }
- }
- 
-diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
-index 018ca37a522..632823a8120 100644
---- a/gdb/arch/aarch64-gcs-linux.h
-+++ b/gdb/arch/aarch64-gcs-linux.h
-@@ -27,8 +27,7 @@
- #define HWCAP_GCS (1ULL << 32)
- #endif
- 
--/* Make sure we only define these if the kernel header doesn't.  */
--#ifndef GCS_MAGIC
-+#ifndef HAVE_STRUCT_USER_GCS
- 
- /* GCS state (NT_ARM_GCS).  */
- 
-@@ -39,6 +38,9 @@ struct user_gcs
-   uint64_t gcspr_el0;
- };
- 
--#endif /* GCS_MAGIC */
-+#endif /* HAVE_STRUCT_USER_GCS */
-+
-+/* The GCS regset consists of 3 64-bit registers.  */
-+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
- 
- #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
-diff --git a/gdbsupport/config.in b/gdbsupport/config.in
-index 0beacf22c05..2957ee0f030 100644
---- a/gdbsupport/config.in
-+++ b/gdbsupport/config.in
-@@ -271,6 +271,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if your system has struct user_gcs. */
-+#undef HAVE_STRUCT_USER_GCS
-+
- /* Define to 1 if you have the <sys/param.h> header file. */
- #undef HAVE_SYS_PARAM_H
- 
-diff --git a/gdbsupport/configure b/gdbsupport/configure
-index 133ddfa7f6c..66135791aa5 100755
---- a/gdbsupport/configure
-+++ b/gdbsupport/configure
-@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
- 
-+# Check for `struct user_gcs`
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
-+$as_echo_n "checking for struct user_gcs... " >&6; }
-+if ${gdb_cv_struct_user_gcs+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>
-+int
-+main ()
-+{
-+struct user_gcs u;
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_struct_user_gcs=yes
-+else
-+  gdb_cv_struct_user_gcs=no
-+
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
-+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+
-+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
-+
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
-diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
-index b7ccfabd6c6..d3b4c05daeb 100644
---- a/gdbsupport/configure.ac
-+++ b/gdbsupport/configure.ac
-@@ -68,6 +68,25 @@ GDB_AC_PTRACE
- AM_GDB_COMPILER_TYPE
- AM_GDB_WARNINGS
- 
-+# Check for `struct user_gcs`
-+AC_CACHE_CHECK(
-+  [for struct user_gcs],
-+  [gdb_cv_struct_user_gcs],
-+  [AC_COMPILE_IFELSE(
-+     [AC_LANG_PROGRAM(
-+	[#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>],
-+	[struct user_gcs u;]
-+      )],
-+     [gdb_cv_struct_user_gcs=yes],
-+     [gdb_cv_struct_user_gcs=no]
-+  )]
-+)
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
-+	    [Define to 1 if your system has struct user_gcs.])
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.1.bb
rename to meta/recipes-devtools/gdb/gdb_17.2.bb
-- 
2.49.0


