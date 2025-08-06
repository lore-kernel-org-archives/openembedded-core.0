Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C21C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 02:42:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16393.1754448167483646916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 19:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03130c4a15=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5761VucQ1868453
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Aug 2025 19:42:47 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7gdhg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4P8/jKfHqzRlE36l26fmdfsHEnucLDtKACJ1WgsVAuyvndYqMsqZWnWSoJR2ONFzth8fkYisyXt3XaBXtACQhjtDFvzjpesTyiQz6CNPvvUXwvu6mpaZEW6bOPyWpZ2g7ZTGT0MLVweK2dPdktePdKiyazSBmml/8oY9xTjlAQQiRcAKlmf7/6a0bULhlIrV6ouvYbrIiPzaLpLlXJq38p0aG9O4CgZpNsoMfthq+sM6QYUTw47WbJudhp94S2LGNNlhJarURwLUrTGR/FLweF68aaQ8MFdn+bjTb78suv9GeLgMmm1NCkywfkPrcxbFQLeRevXwJckk42+XNunaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5SY6VTQBLfGXYQQsMZpIzFJhg/A86txOr+q/rfzQ2I=;
 b=BtdsKnTf8ikkOnsR1g8XPt3QNX+WV0kNkTpN9K3YbVrLJhQ+2WXIb3nfGHzIU8mRqktTMEAzoNYxjFTdeQ8ts3AzhuXuI89AuW5P6oyWIhsW3PQORhysBMQwBxEmB2vj8uOurd7wZeZS7umbH+xTAgxOEYVOrLBMXILBgsILfSHBWj3fMyhhV8/iOAqeuFJryqvvsMr4l/MEeHb/yrRKCaCBw55ueeRShqdnhG+MMUFNzvX4ItPJPLJqi7X56QIcZhhRxail0Vtn6zt9Q30SYWAfuLpBC+N3tTgGcLWfEKQudWLu0fDprjwa07jmNVCP05gq5J6JJTjKK0VGxPOEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Wed, 6 Aug
 2025 02:42:44 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.8989.015; Wed, 6 Aug 2025
 02:42:43 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [V2][Patch] runqemu: fix special characters bug
Date: Wed,  6 Aug 2025 10:42:54 +0800
Message-Id: <20250806024254.3399945-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|MW4PR11MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 408367da-80da-425c-dad4-08ddd492eb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JgohK4AG1sVFEQlHZm7+PyaBMRdltHmpneR52u97eJ9RwctmyjQNqQyNUHh0?=
 =?us-ascii?Q?76EasYOD7Qoh9JFH00Ad3NRQR+V9J0xGJwGp++62QCD1KO2MDdplEvSL28Xf?=
 =?us-ascii?Q?aEnQqvBJ4IcS62vVVjOpHAl28NA4sYHbhB2GeU08iCXjAJQ64EVkVaLaqa2u?=
 =?us-ascii?Q?ZIg47AAgmScevoJBqfh2wppba77fp1NmWThWXIdbPT7qx1t4oLWD/wtfaReu?=
 =?us-ascii?Q?LcTEM0BLfusGk6ImI6vZAo6/Itmu9H6l7DoCXd1Dzb1gvZql+N0cOP74/J/S?=
 =?us-ascii?Q?aPdMyuGClqR9UPRUuO2plQJ/72tWdVIPX3tdd5BWhxypsxahEWZllex68Gwo?=
 =?us-ascii?Q?BCbUcC8BJ/V4CzAgF0a8qnU6h/WnMP+XlNIl4w1rAxkunsjTvp4C+BQfuZg3?=
 =?us-ascii?Q?s4KxtpJvpDiP2UC/iKPuUx8/M3KN1avMimimBYUMWuETmZQKg7UP19HHXBNf?=
 =?us-ascii?Q?Ay8UxZ29OIuzv4zQ7LQupL4BHOKO9pHkbIQUieOtaFLod3TohvZNIES0Hhq7?=
 =?us-ascii?Q?72PKBePaj/xga/J8bIOaMxRzdKBUC1CPeia3RF6pQVm6zT3n+PU7i6XZ2R41?=
 =?us-ascii?Q?n1b8rTz1Ni1HdHHEdW7/ANt3CpNB+e7eDoYfL9yaY3BMFveDrfPbkrn5ds8i?=
 =?us-ascii?Q?PcC7Q7iGL2wbaic7Sz6zeeCEuQwkZGPCK1m/ItPNteyzR3uGTC3v3p6MUdTT?=
 =?us-ascii?Q?bLVvDXjB7QjrkDR2gVFqYyLCAlMftRAWanSNTBTOhrVG1JqcVVocbogrkZ3s?=
 =?us-ascii?Q?wrOSdOl8F96A352bJAJ+xpyaMWIC7hcWi2sookT5m83v8o0WosHRSlBbv//o?=
 =?us-ascii?Q?VU5Vttwa+ypnakAQ1KkIhNVPia4HP4h5v0b+i5Y+3yEOTGbKTrFtOLpXXtvD?=
 =?us-ascii?Q?kfye868NxehsohkCnykHip9kgQgN2/4VslbFYo9nX/ZVIZG8I72pVGEznYvP?=
 =?us-ascii?Q?yKfUyl5iACckJPEzINJRc7sKuhuwxYSiZ7R25mhfcLfxkq+e5xBz/uMuJcvU?=
 =?us-ascii?Q?IQ2a6DVGb8ZEqN0fYh2TQAe32TJXjDSsD/dY9EjHe7NsU9lPPD6gDYgih8C0?=
 =?us-ascii?Q?p1WvhDnOFY/V1NLGFwQtwwApxoJ/lc2HEg8E8DLhXH1NutrW6gtDnm8l4Tkn?=
 =?us-ascii?Q?ww/wXHvfrRZnInNIH+NZGMojvzjjTUY2rmGMY4GEfQ7OP0jt6if3z9ulFEin?=
 =?us-ascii?Q?LOKZMuANko+9emmyHNSvI4iW73uStR5Q9Xhci12YJrqrCCTUBnQy7ZpTLosM?=
 =?us-ascii?Q?nxdkn3E639jHd6VHuWFMZPptGCjgEL+afx8zVJ8FNfIC2ZJ8laisfv8I2e4W?=
 =?us-ascii?Q?JVJ0W0nlRh7E6y1eHyfn2+oks++tKuUokG7mcpcCg0CImj5hQ5UbAuYm5hLJ?=
 =?us-ascii?Q?imaZYdXmpxAIyZQ8ncSHcN6KiziFv9DBSgxkd2elsWx58TNr+g+CAAukXHlc?=
 =?us-ascii?Q?Kqm/ITtKKOSE1EtmPiDD35OkTf/C9TXvJ6txtBfYPPXY4VPwhbInXA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OW80mgI5UiF+knOrlB1+YlLMS0alNuNF6lTXe3rjVkzkdj2C2Qgq/1XUWiBQ?=
 =?us-ascii?Q?vu7g5K9Zadii7YmcRelppw7Y+hHUfF4GXjNH4mIY4+ZioTYHiT9fyr9HDK9/?=
 =?us-ascii?Q?kPkZiFVT18USl1aEnCy6nzOGigh+di9fCDVDl+WOHhOlt9O0U2U/8xCBk/qX?=
 =?us-ascii?Q?qx4V8s1d2X5l7F81EIYaBi/3wfgSQs7g4d0V6hhA1NDCXCYxdILRMuBawlv+?=
 =?us-ascii?Q?hktuXHSR+faENdtSUmnqTahnTn21TlZ6W6rujyUvgMVvdliWGMXgGe4oyWNJ?=
 =?us-ascii?Q?s7ullCfrtKZQA5mEB3KWFukxae4LPUelkFbuMNtQFjjLZwwlWhPdoTPU3U2/?=
 =?us-ascii?Q?xRxXwz/ODVfVxAXM+t4nIkKCpm4B5qNe3OKlDVCCjcUwbJLoL18DrKSMLr3K?=
 =?us-ascii?Q?1idJz+abLsVeowz2n3nl9fP3yAX28of3nbBfAc2Doq5YYFe8WYMCpwCLJ3+o?=
 =?us-ascii?Q?gCjFpbpPocNo3HWu67j8ywMq0nqZXWNGh7+vDOMUlupjHoWYB1Uy1rFKKWei?=
 =?us-ascii?Q?XWGZAYPJ+7x7OpAO/9H4dF0o76bbVLl8GfCXUtF7GBKVw4G7z77gZ1hhbG05?=
 =?us-ascii?Q?p0xK+LdyZ4nFpUiAaIGoCW0cvfbAESPQs0LHKnjnA12SxXAXEhWsn4YlwJft?=
 =?us-ascii?Q?jUd+pt0xjcOZnD1D9fhyR3o+rcbXXfVvc3Bs07F6jhkaJmeiCChxxY47oorX?=
 =?us-ascii?Q?Vt982RsoqTNcbbeDhyeXZKptDFKRCEKTgM+6wUcSYOF9oIhCBX8vi+OTsqJ/?=
 =?us-ascii?Q?CdY8LN1qCOMEOwpuaJetts6J8P7GemmCyRrBa6+kxgUn+CrSpmkjwW3kXtvL?=
 =?us-ascii?Q?NefjC+04+Tb/TG+VLSKg0CqxS+mMNis3TXNP8Beh4Ol/17qK25AbFJkxha5p?=
 =?us-ascii?Q?bXa3Onkc1McNvDpIwc8UCShiFZvbIZRRYDSH+qBOk+/ZQ9ilQfKTxyFaJPr7?=
 =?us-ascii?Q?Vj4h4VQ58xVNnxqj+KH4LMAczxG1qk0sNv/0hrQQVXo6YcaDq/IRPIlYuqw+?=
 =?us-ascii?Q?M68bKRO1zrVxEPm4+h8/wRQdpF2odjqMYNpIapuJRFI/i3rQMS53uWCOl6/7?=
 =?us-ascii?Q?89YoMNP68NS+tWfzHo3d57a1mukhViSiuTDvYB+DABNF7MSZWYkgTjr7bHDO?=
 =?us-ascii?Q?fOsRRZJFPN1n01RizAM1kINndrL+KGLHIsHVBgbw1HMtG452i7v1SVVqoQkQ?=
 =?us-ascii?Q?XTRTfCszf4jsXB9dqrmJCYvmjUkQ7fvrSDr/h2rbHEfBbW9Rv0ukjqUVwydL?=
 =?us-ascii?Q?l7Jij7VfWUqoJ+63lxcSKJHQ2UqYKvNbkGd0BJ4zUw7ty8vfvp0BLwdeWgvk?=
 =?us-ascii?Q?ogRk+/GT21yuSusu/PzK6jBShWAiIgZtvDBTUxjGQI8ik2wIA4i++K7vRmdO?=
 =?us-ascii?Q?tmf9aDbL/K0hTPN6I1kip17j4UvUN1s5I4IYwbS3VutWVXAzLA7IQhiTg+5m?=
 =?us-ascii?Q?j3xtleWh+oXRxhc3Q/MY7FoDvHkzUWseqsGzvyjcPW7eNYSnDv5n5POE7jyg?=
 =?us-ascii?Q?bWTR9m9nfiUM1hWZyT1XjIWht+n6+LNWNij7Mz4tHtGynlH7D6My6Cx2cbNt?=
 =?us-ascii?Q?5869WP3OFEU0AHZR94iFjiz6jCuCUIw+ygVw8/Kj/o7tRBkAWDtP/4R80/AU?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408367da-80da-425c-dad4-08ddd492eb58
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 02:42:43.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdqfoVh33IooBlhSqlugfzsbswk/tjgDN64WZhEVFLf3iyqj/Hwc33335Z6QYyHFUngFdBl5INrtgfGMVF6UXKgxnBKKkBpjXypOaSesoQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=6892c126 cx=c_pps
 a=wl18FVzv68UoWdwoSm105w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=nQNCM_iwqSZUGIDYJeAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yDia6S37MQtiKPGu_qmyMg7LOfkU57tY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAxNyBTYWx0ZWRfXwneyvpxVbahw
 KUTDv/4WT4v6OMdygus+fY5D6cB6085GSgN6KPa4T/DhsJIi3cW6JUlyQ1MD9EmgrdmlXb49phD
 9wxgDwG9FDAb9rKI5j/W+wPio3/DR8r4zq5ie39ttmqx4qdkcmpLEt+vRL0TwLs0pfhDmlElojM
 N3s4GRroxw52vjvsLgKteSLX96eQFWXZMMJk1inHlbL4EVDW+QmxhvbNkWrTuibAFaNLOc3OH0P
 MQyCnHKvClRcIBrt2V/DOoOS3rHJJeLdSbvhPxMmbSrEQQAiZJA4obUOPCZiTGFRbFqHqw0wIkg
 ojLD7FyQ5k6RnJkkeiGQ0j8zDtnXs7FEfLmRxhj+JV7GcbJyPNhfOwZpinADDk=
X-Proofpoint-ORIG-GUID: yDia6S37MQtiKPGu_qmyMg7LOfkU57tY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221496

From: Libo Chen <libo.chen.cn@windriver.com>

Fix the bug in runqemu that happens when the file path contains
the specific words such as 'vmlinux', e.g. /home/frank/vmlinux.

runqemu - ERROR - wic doesn't need kernel

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2ab36fd03d..f189dbfb60 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -368,12 +368,13 @@ class BaseConfig(object):
         - Check whether it is an NFS dir
         - Check whether it is an OVMF flash file
         """
+        n = os.path.basename(p)
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
-             re.search('zImage', p) or re.search('vmlinux', p) or \
-             re.search('fitImage', p) or re.search('uImage', p):
+        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
+             re.search('zImage', n) or re.search('vmlinux', n) or \
+             re.search('fitImage', n) or re.search('uImage', n):
             self.kernel =  p
         elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
             self.rootfs = p
-- 
2.34.1


