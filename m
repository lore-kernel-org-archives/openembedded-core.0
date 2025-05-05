Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C39C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:22:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43327.1746418972307656801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7220e56557=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5453okrh029994
	for <openembedded-core@lists.openembedded.org>; Sun, 4 May 2025 21:22:51 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjs2p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paJxi0oDlM8lPIGF1WYyYQtu6UP0SBta1ryCe+57kPWTnAuTZpW1KpFDTw3xzgREseZ84wGteghEnLqkiWQzLAUgN+8qR50JAdaT8B85LEV4gu3tk56TcfaS80QDHlbtiatd1Y/4ftdduCzUj4xZMhYyXzOmQ3D8BatJfz0ncibxbRYba5JB39y2KMwkQDHgj1TN7AKR00nnX/YKhx77AnIbS4UDxVs5JL4lnpoDqcwLa0ROMexsYuR6Vqmz9AovqO+IMm7+O8HkAxvsqMTq3rG6f+hTw4ALaEmYLn22nwzIbIgpnoljncLdguffxFbp/6r+Lwg8enJCdMDIHMOMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghDzzElKTGMnqj74GJrSlEM6q+kJ4NS6BdtiM0QnE8w=;
 b=oMWLTWR//tW0IZxGWl+GJ5jQdTxQQROXDFU/HqiwiL0X7iqof4rw/wqP+izAljO79oHbNfeIo3YajvnWMGMga0eWkkHh3H9GvRJio+RzTS+sAEu9r3ZBqRkKq3PIozSZAHFROqddGOoCgMi0kev1MgYmRlKfkq1DhfYFd/oskfTST36YaMsYAZWmn2iEr9lEiRqbNeaI/kWiY/3JcFlBHwCY8LCsUAicw192D/477U+f2rio6msoJRaFhUezKi2+X7GG0CsPeB0oc7tZEGlZWC+4nF50MnTyuWRpDGkWJj5uDd1HDKxCyirgVoChIIpNWG0os5/bleZYTbEbW+kgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 04:22:48 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 04:22:48 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH V2] glibc: stable 2.39 branch updates
Date: Sun,  4 May 2025 21:22:20 -0700
Message-ID: <20250505042220.1934494-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR10CA0039.namprd10.prod.outlook.com
 (2603:10b6:930:4b::26) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b43b9ff-038d-4161-0f16-08dd8b8c7e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zpPU/WKwUyAcI/taj+v+240w8trh0cvj+VYbV/9/J/6im0H/UDZARf7PDcbv?=
 =?us-ascii?Q?ucTTob+kxb14GG5B9GjQwDMESuZF22ETsLKpOIINoHaPMM5oXx5f6juRil9T?=
 =?us-ascii?Q?dCOUCyG3x3iszokhxJpQ+D165FE3RIvShl+x1uS8umGIrl0zDcdfqS/s9yWf?=
 =?us-ascii?Q?G6g7NVxWFzcuLEXg23odf5r/jcLx05ybw35VJzqUJ3nyPYfjg3wi/A4wmXjd?=
 =?us-ascii?Q?7QRnQDZrTu3FOYpoM06QANT2XFJzncXk1GnWqLDhofX1XXUUmmXUSXt+0w1K?=
 =?us-ascii?Q?Luq6eyXl4gXCGC9MN+WSBercIM7gdO2YwL4478Wd2Rm5E3HIBMLiDhhOjSC1?=
 =?us-ascii?Q?LHl0ujk1QExz3Gwol6EoECHszyjbvXMXBEtBx487YMmcfoUDHZxOtMFVvKIH?=
 =?us-ascii?Q?KoQEjlQCgclkmzZibli0IOX/AcxMg1saueywmitcdAp6rVhfmLAXjfz0sqtP?=
 =?us-ascii?Q?TWG5J5RLJmOwwV0T6UZ09q1bLPjfs+lTTUvAvf8APpMGx3xPMeLWIrD7EQze?=
 =?us-ascii?Q?Mw51FBbIEEeGvgwyXfzgMmmoDJLEy/5oYIDogu9JebGAnOqvHgLrHvmsLxjH?=
 =?us-ascii?Q?JK1ynLRiewCf9u8GbArGellPDUDyS2upWUIOL+y3leOJex6JVK6BgLkVmOVO?=
 =?us-ascii?Q?ZWvCC1nrBDnrTa3UY0h6fYCspU2SNsKDQ62/JvK/mjn1VjGSEBf+EUVXikqc?=
 =?us-ascii?Q?r33p+1etraqpMwVMSnMyHDFN0YCBfF7THKb0bqYi5JsridIR23T29kzJCsxu?=
 =?us-ascii?Q?oQuDW7Vdy7Iab3yOifXTM/zdD/0BLOEQRs5OGT4rofMdivlp0jTZyWKgPN4P?=
 =?us-ascii?Q?kRItSmi3zut0YfooiNHuJU4t4ex597K3l9H7uclDAK/zcgGpDavrI0g4tMPg?=
 =?us-ascii?Q?j4MYNwfGd1aKzCKkDhgdgbMsL/Duj4SrzKIk7qvSJWEqDA6GXMYwL0PKsY5m?=
 =?us-ascii?Q?4gg424hBctX6dkRuNCKOfLEwZq9YHcgcZ7vQZf6lJ5MnpgEPypOYFICh68gR?=
 =?us-ascii?Q?grHJEHTFppU7yN/lBa75Ho1A6760614mElIBhcuuLXGUv3crkHo7lla7K4q1?=
 =?us-ascii?Q?PvfPQAhqAYPnpsIeCTgmsBKsEKf9sk3ysf1X9zoIV2cDjW/iD3s4X6ozhpKu?=
 =?us-ascii?Q?ZsDdb/Jkm+5SgpyzxB2GsdD097SMEc/PZSPyWHP3j+0LJ6+LIonogbB9SpaW?=
 =?us-ascii?Q?zK3nwJKoYtzXbhY/FKHeuSNkX/qSJ+iV60kLwEa21Lq59hKS3ygzhsEosCQ2?=
 =?us-ascii?Q?dsptKOW4sNPehyq4vqlNnCSZE3iY2B1rcd6H4aAyu2fOhrVCUxBr+MB2PnF5?=
 =?us-ascii?Q?ml4MNYNW1s7GhTyymcMelpZyDSCaYvUriImivVSzCHbMuXjjXyV2FCmXtM0f?=
 =?us-ascii?Q?P1dGeqOMnMBcfpd/uRi8sORoVuVhlDrFpXWE4ACBTs++z2P7r+NfDX4Neg/K?=
 =?us-ascii?Q?dq4HqzumqNbYeBJvZwsOs0RemQF9LkdMfmm8P+3DPHLULOBERdmNpQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IYEndenz7FQfZhkKZWf3Q0oGbOPbfSQSlSo3htkDF60ZGytNNneStxPR/LfN?=
 =?us-ascii?Q?Pw/uvYmy+P88koyqYUpqhOK78QN8DUKZCDAVzlCo699GiSX1uq3lU8vH3iIA?=
 =?us-ascii?Q?CNMQhMgYO5woB4aXA0stv4z9Vm2myqe8apIbr6ayZhGDRryE56bJwBRdoAQp?=
 =?us-ascii?Q?NJqjr2Bgf+nMa9pTliXhtgI+UemRpc43nMwl0VDPmEO80Le39ee8Z3TME5ei?=
 =?us-ascii?Q?Owy5BhQWKQeBW7qlcQwG10JNf2Z/PAy3g0j0YSi22zx7+0Ur2HROCL9y7rx6?=
 =?us-ascii?Q?hjKIZpf8eHQtlyqT26YSTJHOS0BFSW5sfWBpI/w40S55UuppZLM3+Ho+CbIm?=
 =?us-ascii?Q?SE6qrbF2mY9e43rAA510iNKPVg6xSs7lh2dlUszwCCMP0LL4wfxpIt65fd2L?=
 =?us-ascii?Q?OVT+yvgff9nXrz7xNU++Us+ccEAeMHiukH7MwUDqP3kWUwQqglYlc7gL/knS?=
 =?us-ascii?Q?9g06t9vM14dJTAiqqbFAMwL7RindkgONGTOlUNcr/q+qCF0JDiERv75mQQCS?=
 =?us-ascii?Q?2nlw1Ki52BAERAOX0sSfmubcUO9QTkUaFTqIoKaxN6y9JoFB3fIOSKaSG/tY?=
 =?us-ascii?Q?RS/dkC1eiDcNQqBf4jfkzj3r7FPT5lXJykICEU8e1Opoa/oD0ugAsUYUVdDf?=
 =?us-ascii?Q?UNmh4oNNh7P8mDyXlctpUIVhBtYajFUAmXZ8DhzO90LySQuQuee2knzRVL+e?=
 =?us-ascii?Q?iS6+rY94pmBmBcbU5rmwk37WFjewFjhguTkqUbk+jDM2ClFbwy9y+SPDwhKM?=
 =?us-ascii?Q?7lrwhJM9w2Hc51uJlxpRTwh43zEP2+yjOLBoYzwm8CFSi2vOTFD3dc8CWitR?=
 =?us-ascii?Q?/ShRhKUKzZJ1siFVttej1iCM78YLP1aj5EKOwGDmIORkVIg0xvxkmjNDRRcI?=
 =?us-ascii?Q?/l/xdKwHS03Lu0zcy0/boYr65qvBOgXZw8mym4P9ZFdon4K3CPSMmNlkWAg1?=
 =?us-ascii?Q?kwe5lyDFF1JYpKUbLgzwkZlc+SvuSKsHKCQpyrwumP4pFz2jvLhBsMbB4fOZ?=
 =?us-ascii?Q?xzAFZlqtrVQgHCtwjwVLh4wnfqISm12aKbHZVeO2sJWWdqtVUNOCk7jEYLZd?=
 =?us-ascii?Q?s9/LMVdkIe+ZH7CRpl5skoq5ZJ6vynrrUI2pQf27h0ohDRvDTTw9rw20ddBs?=
 =?us-ascii?Q?v8ncfNAgn5fFTyCFp5z2hVkRf+Xudg3LVNRTRpCuSIebMqIovd9zrliDJXxl?=
 =?us-ascii?Q?J5eCHcn66kX9jK7Rqdu4kgwKPHZIOD1NFDwSeUdr6ptBFBtHYViPNFcaX1CE?=
 =?us-ascii?Q?P6cufpTPyIaLxZZsuqiLwfYe8AfxMe6n0G45cnTHxgR9DspenMSx9d8t4Fix?=
 =?us-ascii?Q?/Ibldwy9dLObVbEQZIC1NUbAMvx57qitITVXvQRJFoFFVhvj490n9k3iRJkE?=
 =?us-ascii?Q?+kLTQHka8R/hSkTJ/ynxnAUpLlOdaZqPN6syOWJbftQmMNqfw75yVJgHq4i/?=
 =?us-ascii?Q?OcfbImrBW2pH6DisiQ3/jP295rERoUFEAu3t9/hsoQtPhHg2t6s1DKq8Hsxr?=
 =?us-ascii?Q?4WkWjU9tVu3ZHWIWrcl1KSaYMG8EaA4A20jFnk75FMPtL+M9qK4aa6dvVpoN?=
 =?us-ascii?Q?pI3vkpvELjwnZRKPTh6OLOZZ2PVWDce6WyAAEe6aHpgMgLGy181NYvbT84RU?=
 =?us-ascii?Q?3DLkp8Fim3PCECf6CsLgNZI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b43b9ff-038d-4161-0f16-08dd8b8c7e1c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 04:22:48.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceSFRrtiv6JLFSixifpGgnZfZJheQmljO+J4I0eKl3OI6RjAz6pI8DKQRft+WDsa+gF6FKlAonZIawnsZE+fc0kZ3apbbO82cnwaamcWVUcWAfuMKLCvxO0Wdd3VOE4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzOSBTYWx0ZWRfX9H9UajCfdcyM o+aJt4+enz8pOH84A5UmbzZbXq7tWQodg6We1AhoIBYNildzmFhmX5dVq+GFf/F7I3TQUc9utm/ RjpUnQnL1tLqyiBd/JuYSnwzP7k6VS6wIDQyPxYzgdeoDYAHMYEqfl4LPUihggRvE1JjTxIBLRg
 URPUztEmdndLKLhNUMB0IoA+gOsRUc32j1bcO3j3ilzR1IJUBM1TUDIlWc4kCBSZIOnPUHhNP9W EaU8kVjM5/vFFZIplhzqd411FYh/4ukMLVbi7b2ViDDwIzST8ZNEGN3kXE3tCVm7CeBP+/rM1rr Gl6gtnzmlchivSvX96cTTkm7apO62ZmTr+XcDZlEVyIfQoFYl2PU0FufvUBxWmi+Y4+s8LhEBXx
 MInwJUjDMjSk9qymevAMa9cCfHFf7GdHayjSCTGNGdBnM3l1E6Egd9YuZW07ym2iPV4vqfaG
X-Proofpoint-ORIG-GUID: P-boIXkrf2XKc-udSbbDKWogJk6tIS_i
X-Proofpoint-GUID: P-boIXkrf2XKc-udSbbDKWogJk6tIS_i
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=68183d1b cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=xSs9iO1qsYZR3K1SDMMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=825
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505050039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215985

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

3463100f2d x86: Detect Intel Diamond Rapids
e09436c2cb x86: Handle unknown Intel processor with default tuning
7620d98186 x86: Add ARL/PTL/CWF model detection support
765ff3d0d4 x86: Optimize xstate size calculation
65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control non-temporal path
2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (bug 32047)
bde201e92c x86: Disable non-temporal memset on Skylake Server
38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold` when it is undesirable
cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
0da58e8be0 x86: Add seperate non-temporal tunable for memset
837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size (bug 32810)
60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires XSAVE
4cf3f9df54 x86_64: Add atanh with FMA
01ed435e2e x86_64: Add sinh with FMA
0edcc77fe7 x86_64: Add tanh with FMA
7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
e1fe22368e nptl: clear the whole rseq area before registration
dd8c0c3bbd math: Improve layout of exp/exp10 data
a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
d0e2133470 AArch64: Add SVE memset
0cc12d9c47 math: Improve layout of expf data
0cd10047bf AArch64: Remove zva_128 from memset
dd1e63ab58 AArch64: Optimize memset
65a96a6f2b AArch64: Improve generic strlen
4073e4ee2c AArch64: Improve codegen for SVE logs
78abd3ef6e AArch64: Improve codegen in SVE tans
a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
72156cb90b AArch64: Improve codegen in AdvSIMD logs
5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several AdvSIMD routines
80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
f6d48470ae assert: Add test for CVE-2025-0395

Testresults:
Before update	|After update	 |Difference
PASS: 5068	|PASS: 5072	 |PASS: +4
FAIL: 120	|FAIL: 120	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index da9227ccca..040fc793b1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
+SRCREV_glibc ?= "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


