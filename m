Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3249DCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:51:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33009.1759755117689202131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ixuS1za0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2374a6f512=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5965Zw1a575304
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 12:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=w37BxDmaz
	auaoZf+6ufrA7n8pbIOJDWYFBLL9hoVucY=; b=ixuS1za0OqaL0toY/KFKALab7
	AKP3hoe3LQJ8a6RCRzRR/02QYGx+x/y49Hlj8truM6iQN2mLePaHQhqY60ex+xry
	xaKIcGMkPQULJoi1F7CNy1yHR7NdyplNUbacm6Ed7y1Y1KB4K1avZZkjKijGUsqZ
	91ozkFnrwCw5R5U5duh3hObFC28xMq6fHz7Pro6TEXgIcKC6MyDWuYysiibzHITa
	EcxAeqwBqATYW/ffGoagwFmCeXWrloRyxUiefJzHcppHZ7i031rb9iO8qWvHyRsV
	K0MULF6QlcR5ZuW5PQljn7ZNRPnom0JJ+7Vi76kwpPY1ysu3kKhIhmxTpHpCQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012029.outbound.protection.outlook.com [40.93.195.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxgsrn4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 12:51:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsU9sx5l4CpzcR4BSHtX+/xx2KwmIUBJ9YYFXmo2wgN8/craZ+ngrPCWobYaw9gvV8lUDiBrA6HNjU/Cd2sLJUNDUc0J40mpxHSZnZB3BuBudCP17H5ayt1mY1cCZyhghW2dsUDUuCwslBbMB3M7D9TQSTGM3pGMQcxKnB+60FQZvRyUKJPr+Iw0kHRgksZhRvpQTcohDsI4bRcrqMXbMQYgv1w4QFZ9D7RXyc3/UzXlCz+8o5zX0sEE1CyfWk6UEtW+cyK2tQVLtOZKyQxrYc1IkNs17ZOvh8bVbtdAEOvHtPEA/fNqFilHYMan1sePjTfJD1xhhh7Acof7WpalCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w37BxDmazauaoZf+6ufrA7n8pbIOJDWYFBLL9hoVucY=;
 b=Sn3MW73zOXlrllJscGZbmWdyxffPbdzCuz0EdeffFrMKipnSKhrj3Br1QmukJjxGvQYygoYZWewUbt17Wcbd0HdWqtsEJOkCVD4+vnQQ6zLAQOkcVzllCfPm7OXzGiUfERI3q9DvhF2dL3jp2QCjwVmsXksYXObu8paMkVT4eJt+2qgLJZZJw5YZuxKSyEcBoDz/edHMVyK/pveQbv1Q8nylM47cWyLxP8hY6fzfosBNM2hdENbG6lRrKCmLx+n/E/rHDv8+bpHVTEho+ccEO7fWqEndDKdSx4WbOqumJW4ytKuWmO9kflcKzlugMsGWVJP4BBKBDFCXKrsHXdTpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:51:50 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 12:51:49 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Mon,  6 Oct 2025 05:51:27 -0700
Message-ID: <20251006125127.2156281-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::37) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d29000-f219-472f-7d4a-08de04d71d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sSgUct/VZqyFt61V5BijcD7+Z0NDK9dw7RPEq/lChFDoiWa/hxJknAhLbjai?=
 =?us-ascii?Q?KDuZ15H2DgImvi3qd36XlAsEmu60WmcUdyFQWsW9+wiYjM/WvxHsYlSpddeB?=
 =?us-ascii?Q?PDTA4/lVerw+7mBrKoOvryEgcAaAzBSnkwNYVGnL+JD2SImhK0ZgP62a0eAS?=
 =?us-ascii?Q?kgjwNToX2e2uX0uAGZZ3d8zeTxLIaf5iMYHUdggx64xx+Q2ExV0KJfByUm/A?=
 =?us-ascii?Q?3nPYjFluGqwgakB1+Plr0pI/KIiY8tQOrqY9Gxy6wmqK036XiQ3yCB7l6zYL?=
 =?us-ascii?Q?1TF+vZ9B2nESxKTRGVjYirIPDDHsq0OhUzTFVfWnbGt/+QkofyAbob8cDDDD?=
 =?us-ascii?Q?cfLDwNaRY4xH01SKR/UZBd+yO3IRWMEa+sz/RhFa4sDBxiyfJwnDaDBykG+1?=
 =?us-ascii?Q?gt1MIUXQmPIumfGv2uTCHzaMg9jqo4l07gNQBaNrd6PLgSjGRqrUOI+hvKp+?=
 =?us-ascii?Q?j+ZZMzHeVFr8INHeKA03aKRpoy8uHBNF1cZkXVABO0giZP26wv0KKNu7yWbt?=
 =?us-ascii?Q?5IJdsnhg8Sf8sUjX/nC2zbKD4PK0CGIprv6yd9GAmgyfwLGksRnNAffNaa3Z?=
 =?us-ascii?Q?A+0Ra4qtwcArriUi85CUw1cfGZUuaUYgHJFPva2P1faebZF0fSNhQRiPDmjo?=
 =?us-ascii?Q?CiAiqVXEkgd5joAheH6DMnkk5jfydWGyBoN/aoH/riruuusEND75s6TI6f3L?=
 =?us-ascii?Q?3l976stIWZz1ZMNSASxVr7A+i3WcO+lXeIufD/doegf/pRiKiWlcMw7ioUSA?=
 =?us-ascii?Q?2ASM0LfPZmwKX2r78fJLotGwZfiSe2jUjCxRrfCBiIQAqKYtBiIsBlSVilgX?=
 =?us-ascii?Q?GbaQHHQlnXEoikWGIOmvLS8mALZS/TJywmCmKait+3G/2+y9EwFOBdqnY4nc?=
 =?us-ascii?Q?2rSeqmDoqQSYJFNutjkuQhnQ+7lKAUkdQa1/9w/xwIiTqoQO4im/G0KhVD2m?=
 =?us-ascii?Q?e+t9+rgxRhssHnF6OXHmgl/Awiyaw/jtKA1eHYM7B131RjxUp2kKTetdGux4?=
 =?us-ascii?Q?FAa4n/m+H/nFvtmPvAy+Z7kKTHE6H9IraXE0/yD7rS+aN5R5nXbalBVEqqfA?=
 =?us-ascii?Q?bidTL9GCPJ7W+Vdh1HF1+1NQEqfArPPWThDL/pLlqDrUpam94xASj9GRpj3h?=
 =?us-ascii?Q?ST54Wu7211d2aXQLbOdrS0anJuv2OVjQmIpSFVYPIWlbFKmv49NeIWZKxbWA?=
 =?us-ascii?Q?5cAf5syiTNUxPUcGBJhiWJ+lAZ8KROLm8zlm5J28EQ5+UKD/tcuJkHQCZSpK?=
 =?us-ascii?Q?USVwaOsMwrXGRAQjuDkzaS7P1q43BsUWDbVJq5VAFQ+bbw/pbTIA1bXJDm6T?=
 =?us-ascii?Q?noGE5CKVrOF4sSWHWk4uV1MQIJ/lXTxAPrIrECXcCPpY16gFl+yoey0wcXZH?=
 =?us-ascii?Q?yEB/MzJnY9j//gRjIkpZtMvq6aDGToSCvhNQqXn5gGRpM2khwL6diiH3Uckz?=
 =?us-ascii?Q?/rHtbRsVcW/KGZE18w8mbpwvSmC6SbFPfN2bPRwdj5g44AghxYITRp5qzJww?=
 =?us-ascii?Q?YGGx8bnThIZxlmrSgE9Gjpe+uBeuDt2aCbIZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zA+F04tbIdQWHHuVLd6THwFFSUbEgQGgc3MTpMQaIberhMbfPrbIWUcaVAeJ?=
 =?us-ascii?Q?CRNAb3ygTRdQy89nwkLyFFwNPWUjbhaiMW8iddJWuaXBBNW90YMDGAADrAce?=
 =?us-ascii?Q?4TBYlNz9cO1dc/4jbrPgShPPpRAPgXdlylZpkyHOYFB5emrTeS1L0sKQBeFA?=
 =?us-ascii?Q?S382aOv5TB9tjbspHdz6v5iGALZ9zgee3jEzaykH0PHyExzIU4q991PD2Hsx?=
 =?us-ascii?Q?2hDSxFu8NCayjV3B6b2sOW+0SOElHKEUt8XnuCBG0HqpTb4EB6D3/2GEL2st?=
 =?us-ascii?Q?zdV8/4lXFLUmSbNtMYIvldrAYJD6y6DeBB6GI9eyWIRWfQg5a2Mw3pdmRFRg?=
 =?us-ascii?Q?Pkfysy8Z7A1oGjwAF3wxOdlJ9LEUneGmoXjLmLgmJQ9GFappc+Zvd28nf90B?=
 =?us-ascii?Q?tSWlMTYoZAIu0c6aomG0heQaWIVc0pDwZgbE2MWeU4efr6Wxr803JD1jZIYD?=
 =?us-ascii?Q?xnDPqnESqGRHqkCv8hN2iuEwc9nwtlwWvcjRQxGHQar3DWPrFmuhf7CrxFlP?=
 =?us-ascii?Q?o9YMLCSyIr214E1vD7vOtwbDg9aZ/ZEgJckpwGvdMlI/gtFktj7G3HuftTdW?=
 =?us-ascii?Q?xxZwDrXgMSRzgtDrrIWiiNIBVISusgBHs2khNptB1Omgdlr3neyorFOl9p23?=
 =?us-ascii?Q?Exdho/J1f6rCdCRp1WbgLG3cIGh6TzWf/QG0swvRFlUGBhNm/dN9IneyEbpU?=
 =?us-ascii?Q?WiBB44sttjSJC2/NEoME4u60wlZej3hGjCeHCFQVJF/wM1QfLVc17MQDmXjy?=
 =?us-ascii?Q?pDEkLFic7m/+9E/qO+TR5F/TmwcDEB5AiQs+OxIRg2BrZlHXVdoMSsp2xYsn?=
 =?us-ascii?Q?AS/Ple6jhT8hEZDjwJfcaqhFf1/zT3pT4tT3H1IqcmAWaJY7RXeyR+R62+yL?=
 =?us-ascii?Q?YcOIqxernUPXfDyksYLc/FhdUyPjKg+KM56a9++WU1MT2nRg64FpUBmi3FxR?=
 =?us-ascii?Q?cSqccnh9TkATLMup+gQ/SYtLpkWQqw1euG4oHNpkBHbinOGqgC9aNU+dsTlA?=
 =?us-ascii?Q?aLiREBoSkNP26MczsO+XP/dIlMRKf4qSFMvsPw55GduOY5qkl7Mcpo8yTGWc?=
 =?us-ascii?Q?mY75mrkG4EeRg4//8sCX88m1uVA/mxkSD5M+chh+QO8LCrgOYO+uktT0R/VX?=
 =?us-ascii?Q?6IfFlPleLs9To/7pfCgn2OtPMcHLNu9K7LrdNlOh1B2ms7iTN1NC1MO6bsLV?=
 =?us-ascii?Q?LpnHNd/ZqCexH+fSMPjQz3qC1QKnl+Jw73W8X4r2e7N1yIYFgT2WPb0r8afp?=
 =?us-ascii?Q?Fit5NZ9v4hdC7ngR4W1gYZwgYW3uFwYNaYPNEXlOeXISVFfGYwreZ/Q2T1Ng?=
 =?us-ascii?Q?AE5cg9M+xyjMfR9ky6bnSGG+iwRUL7cECE4FG0zo8o7+p6gPfPrX+J698opL?=
 =?us-ascii?Q?C/VD2Nl1pYugspOcjkrLrmJLmIbwsnIN+wIk3582MuW3dDS2fkb/bvnS6sdo?=
 =?us-ascii?Q?VCF8k5enu/isyS3EqhpShFSATlhXLQNtczUfG2BZn7Lx1kzyeFOVKypNfkDL?=
 =?us-ascii?Q?hGNwFJevb/MFlsHC8qMFUSSXDTvmfc3FAiTYjQehPwxp62mlthxyM3xZDlx9?=
 =?us-ascii?Q?k1dzrPau0r4rL/ynHdhehLan26XmO6jqQQQzB9e/1CABttpIGSSu08DvfEgZ?=
 =?us-ascii?Q?uSZWrdTT5BuZ574qwlNRLaM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d29000-f219-472f-7d4a-08de04d71d54
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:51:49.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nQXNQ1pWITb4jZkmWWmSWZnRaL2KjaTrBNPMQNiIPYLxLUA75NefKno//brEWLCTfo2+dr8xI830exMciVOSg27KuH3mHH7R9XxEn5Wr7ajG/pnlRM0emGftTPojSW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
X-Proofpoint-GUID: Qxum5ei_miMPEgVVh-piH2Y_sVIUoCgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEwMyBTYWx0ZWRfX0eUWEpqp+bl1
 XVySKifkvhJSFxm+GRk+9lXCLkHeC4gr9O4cOJUfzHSEZG0hTUXkhq6ZrH0JrLw/CVj/ghcRefW
 cxlKCTMZ2Jl3VJBOy7RoMXZlxRuT+UKAZ62ESwoKrwQwo4nDTBlySQZtSnveS3T3FVcjY5pLHVc
 MfSU7p8kgdKr81Bgfkgcl3CnndpRrQKqb6PYYTpixXqDIPg0SpcTnvAyzccq5r/9NtGi+n1ulwz
 O6bScDyMxlJUkAqox6DJvSwlGasp/4Wpz36f0JQxc3C36042pU48c1eWuBQ6oy/vNVOJpy1zWrQ
 9NX/hbB7IYKPFH9aG8xEWvJrMLwTZm9m4quXRXUPCiGOxJLUGEAUFp/96H3JRMwFG+X9v/u+hmm
 vSaZrKQZoie9dhecfsLpjMVdmR0r1Q==
X-Proofpoint-ORIG-GUID: Qxum5ei_miMPEgVVh-piH2Y_sVIUoCgP
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e3bb6c cx=c_pps
 a=trpw6pICdiNRq397GyXMQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=U5mQUs3XlkhBtIqLHeQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510060103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 12:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224478

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline a66bc3941ff298e474d5f02d0c3303401951141f..4e50046821f05ada5f14c76803845125ddb3ed7d

4e50046821 (HEAD, origin/release/2.35/master) x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
c97735cfde elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
96cc65a28a elf: Extract rtld_setup_phdr function from dl_main
e3f04f64fa elf: Do not add a copy of _dl_find_object to libc.so
bfae8bf49c arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)

Testing Results:
           Before     After   Diff
PASS         4605      4609     +4
XPASS           6         6      0
FAIL          358       356     -2
XFAIL          16        16      0
UNRESOLVED      0         1     +1
UNSUPPORTED   197       197      0

Testcases changes

testcase-name                              before           after

elf/tst-link-map-contiguous-libc(new)        -               PASS
elf/tst-link-map-contiguous-ldso(new)        -               FAIL
elf/check-dt-x86-64-plt(new)                 -               UNRESOLVED
misc/tst-tsearch                            FAIL             PASS
posix/bug-regex24                           FAIL             PASS
string/tst-cmp                              FAIL             PASS

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0b06005b25..b9f5e8fb8f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "a66bc3941ff298e474d5f02d0c3303401951141f"
+SRCREV_glibc ?= "4e50046821f05ada5f14c76803845125ddb3ed7d"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.49.0


