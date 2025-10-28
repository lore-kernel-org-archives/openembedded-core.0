Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C914CCF9F0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 12:17:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9844.1761653829085007951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 05:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rePhqWF0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33963afc6a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SBkrKr3041679
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:17:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PjPCqZeVd
	hH/WNSV+EXLjR3/NHx80QHBUUWiUxSmCiI=; b=rePhqWF0ylTxD67j06bTjaJF8
	w4oAFEwOxLO0/gO8JwYcSzSipl1Hvv+8sx57cCOdkWB0z09BpxP0XKA/MKlojPKu
	yM02GjmH+o/H4suMmDLqCGt6I4Hfo68Ov6B4+2SWC4OIS5oU+UUbsa6neszjtqij
	WrOWEponOoy1FKVIiqvlURDYfdllXjpDeCXVkYuaizRooQTHx7kczXVI1cVxAAnr
	CBlB/bCZcugdWC8ryF2y/R0zeQvRku6A5w79+maKOyYfV6d1W6G7iQftFG03rPLe
	NDfP9GU3Pj1//nDcJ4sbapIBJsCv8imYDWiql4hhqvk3xM+pEmsYn7DdvcpfQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e2vc9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 05:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvbT4pWCb/zQyg4UghdVe24wVPso/nufIlIv9uN4pi7D5mVAK90KditPEREzmQj+EQMMeTu9x9pX4GHwaPXg4hzRYddkPGkwIYb63BMRCj1V85Y0JHxjUXj7R7hGUTUp31D9pbl/B5PkYrNf6RzAlIp15z2dYZCpPVPY9FCMJBr+81eYmTBhbiHpRUaplYmawiZ91B28AWnZO5LyLMrwrVIZAukHRAN4HKWuf6ZWsofpJz4S61F88k7ExS3G4a0Airp7GIagQ+tOcbw9Y7qNHv6Xoh2P0LrpqTmkCzXkf0PBvsg9vp65L0GbK/95JXk3bzgLUIFBc7gGe3SJwvQCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjPCqZeVdhH/WNSV+EXLjR3/NHx80QHBUUWiUxSmCiI=;
 b=CMmkaRbO8/Ko2jRXcBcwhsnYCxbsmBopX4aEs8cMkWaYlEdE2aikE2XudXLumI7jxRSa3TjmXGgVnpS/PbgqUEHtnApWJWjk/XjHK5BqX5ll54om6syZrhEtqkHip6DtvgtPS+KgvC68hvls6TnSo8SVMfKy88ElLS+ultkVO4r/6cTqmaHUcOIWbAmrcBbW1/0ZB9qZX1sy5yS3Dqz2V8oCXutq/0FhvlBlzl0dNFgrFvlMdGa9/LyOIUFIJCbE8buOcjP1DnT4ux6e14wMQBGYGVFUSnDUea8L1nP4tEfBLJcf5oamRF8fyw9p8INszhoa4G6evWalIDxs41E8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH3PPF496D5EAB2.namprd11.prod.outlook.com (2603:10b6:518:1::d1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 12:17:04 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9228.016; Tue, 28 Oct 2025
 12:17:03 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [walnascar][PATCH] binutils: fix CVE-2025-11081
Date: Tue, 28 Oct 2025 05:16:50 -0700
Message-ID: <20251028121650.1354791-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH3PPF496D5EAB2:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f258ab-381a-4080-4bdc-08de161be747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uqhrtuzAEd9hkEv53UxEQn8IT5NMWEeqThiawxuEbDqCGrcRvkzN51VqrWt6?=
 =?us-ascii?Q?l36U1cC1GnOhY9rlrYVnkyKJcIteHSrV+P+beRBB0nruF1OYC0fDCQIFd2ph?=
 =?us-ascii?Q?eWHst6V9K39iVWm4u/Q7GqmQzNtmaz7nMLlJU88HAI6Effnj/MlN5KcI1Teh?=
 =?us-ascii?Q?0j3nEAalyXn9HvTsiXkMGeGIaC2veoqgBLnmox+bCO/MEjTaB6fbWf2MnAan?=
 =?us-ascii?Q?9htmZ1tOs9zfMmYz22Qt3RI0Erw9LwpAYD9gPVQUu/EBN5cJpeQFFKLm4ElS?=
 =?us-ascii?Q?/T3isqXC8E6ufoHiXUyVtHbfTSPaMnQ/imlRJw0sVC1Npm9SYDsV66VfSfdn?=
 =?us-ascii?Q?pn7SUS9mEbr/9Fv9b8/KnVaQ573nLKVGQEk45mZb0s7Ovslc85K5ij+q2DzC?=
 =?us-ascii?Q?SCHTiKulrbbUU5B7JQCyCaFE3OkqBS04lphj9obTyzpy80tlw+ElzEScHg4F?=
 =?us-ascii?Q?tVMPyy1lcQj0eBK7YZWZ+DUYgcHLwtgLfnfPJ1BZKFiKVibn4CGINnYtmmGR?=
 =?us-ascii?Q?YK85NdjGue4Tecv4BfO9atsLDqJP4GjG+Jb8yaYt05TdjqsudkZM0KtphUrK?=
 =?us-ascii?Q?vxQMF7AlhWGJJKpcpmq4eNLzwUBZBDDcozPo4QXIHgHC5NJu1X+6nP0HFvVy?=
 =?us-ascii?Q?JNvwkjPq3IscVNzjDCenvvUGlb2IcQ/edzJB6ArGarj5mDgVQ7yl7hsdPCnw?=
 =?us-ascii?Q?EtsLkhGl3aUfFpzBpdnR4swt8lUuiRTef9FlRoctuc+44gdILq7O12NnuPkL?=
 =?us-ascii?Q?59ZfGAujTfLar2+3nl/ef0VXbfhKZ6TtYSWfY4aPF/WtfVNppeiJ+OOE6E/4?=
 =?us-ascii?Q?2CEwq9MlsU3pnqdvg2JFehyFUmHu8DNxpauBRh2azRZVOoXJUxaxsXL6VFVO?=
 =?us-ascii?Q?K1h2StyoOUQVo7DLeSWkeS9gpHbNPtSgdwiZWoMB5c8gW7Pr86Ykd3gqJwDL?=
 =?us-ascii?Q?8xKB+EZS9GLNTO0QagmMeHCl+VNJufzhojhi5k5SXzt8e2vyOxMyF1R0hQEj?=
 =?us-ascii?Q?VRUI4jukRDAH/i1xVjq0rvNp5uZyaOrTSxSdRXLtKQOyeHePIgQEAL07N7wY?=
 =?us-ascii?Q?9fDicepR7aj/OcvasX/bG9FxyfpsV5+UGkoisjZH3tE58ypSLBFh1KG/Rww6?=
 =?us-ascii?Q?LpukSMu65dvHBdDFMgYPlAF/AXaTEqcQ+2mM1MuyqyytMEdKJd/t5iGFY5Hx?=
 =?us-ascii?Q?Vudjhh7Bpaqy/aJE5IhRawRMBvxMtJPcHIGccye5AYstGWHAuuHjWbaLF/75?=
 =?us-ascii?Q?iUUkYe2vuuKYXc/0DbyAzIn3dH6lD0zbP63lvgfxyZDgp7wlC3ZoA2tNHl2Q?=
 =?us-ascii?Q?wlyuPKvUrnzv+j+12UumqsrhCJAQhMLP3PIAP9rb/HUfDcvlUPdWAa/QRCpi?=
 =?us-ascii?Q?b89+GEQLCt/xPPNmiIwK8fNqiT2ZycUUBX0SaANccMpx5Y7x+B4g4728AUby?=
 =?us-ascii?Q?OFK515QAwL6prg7cow+JtOgMLNySdH/K1To4BJ2hP9Dy2IelQRwC+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u9yiPyCNrFt9KUxlZ3SnhYM/o2NNWHJACk6P1yYongH+diTqe/6mfhxMUcDZ?=
 =?us-ascii?Q?lUu0e9gKaxc0GlVKDCFyrAgN5qZICAwOm8NaE3rT1gEjR5sX8DxUQnKs4XfV?=
 =?us-ascii?Q?NLjxCoNC7yWkez1/5VjlkD5GeOTMfhuakR/IuUpXGlo1bvastndDSeZ2/rbS?=
 =?us-ascii?Q?Xv9B7tgJB38FRn9XKo75tPqz4UCBfuNe2SghxssgjNzcjjvDW4i7i1Msg+K0?=
 =?us-ascii?Q?iUFxXDEDlwbuP+qVAOByFCVKVZh65CKGrhO7SogCghVAkfyJg96UlyV5Uz+Z?=
 =?us-ascii?Q?zj1ckrg0rakUFLL5L7jRHkdX6DWmYwmxQIi0h2Ss0Gkl19Lo11XzeNhzpDgA?=
 =?us-ascii?Q?GkD+/QT7Er/rSNSTdsvSBRRtsJ2nE7R5OEfG7bm5cmYMwoDyvng/eHrVB/8A?=
 =?us-ascii?Q?21wH7rxgzxPDuZkTAGxjWANBJzygib9XrlTMs7z/odYkXOubrZgAnwmIz97w?=
 =?us-ascii?Q?cqnb0zjrZxjZdM2qp0GD1kDBsHoe/x6+vps5CXeN9f2iixKIREz2R9UkC8z2?=
 =?us-ascii?Q?sNqswlziwUw7OIh01V2qrAtU6mYQSFPowJXHO+Rl3MmKCJ+8+LoWCwYk/gUk?=
 =?us-ascii?Q?HNan+IxGB5XUX8e/IeXnUjqE4bhoYrT7XdeSq9A1C9BtiTn8V1fHGJ3GFguB?=
 =?us-ascii?Q?nY1Q5WxaJav7k0ELpt53+jkpDu6JvaHzX0nm8WM2H0dk9vE++kBFF3i3SiOJ?=
 =?us-ascii?Q?CvRRjpgZtwQnrvyzUk05ClarDX/YWDRTkVPxLSpSBO75AOvlJzd59p+at04u?=
 =?us-ascii?Q?Wmv9v5UbYDCPukCpsO4nLWiO77VNV/JK1va/7tjoU5Lywoget3nVxUwzcCmC?=
 =?us-ascii?Q?S6KuxIEjyBfg4w+j07eHo2qpTdbMIR+5eebIAWWx6v24EtPAvOViyw/ECFGD?=
 =?us-ascii?Q?GQJOd/HUzTxRsBEm4ylT8YEJer2rEv2ZvleWc7cfPLUYkUcaMjDZz2p3gmZ9?=
 =?us-ascii?Q?RDzByx3oSV7C7FJuz5p7k9mI0kelhXSXZnZjNLEVWkaFqpt+SIfG1c1gJRH6?=
 =?us-ascii?Q?GefsBS7k9QqW4zJd/Ho3ORn2tnikPg+imnWwGZMxOLC85O+cmpr3U4FR5ItL?=
 =?us-ascii?Q?w5wU23CkAh9vbm+ZGot3u6/k638boUhoCb8H5h0Lu+UHHibeQDW95RRQH3tU?=
 =?us-ascii?Q?V6109JBOIpnXFsVwMrx+rOUFqQD0LL3EAPcACBfxJOGafxbV6ITppfd9BrRJ?=
 =?us-ascii?Q?YX0JIsReafvLzHLgst32fK/z8SuXJNNTxdReLnSNxXGKitAnGeHvgaTvWVbo?=
 =?us-ascii?Q?ew09AxZwCzLzQXENUdY0qXEZCsyI9R8L6LIC7kqaOCUZHa2pumeGIg4j90io?=
 =?us-ascii?Q?ep5ZaJEqxQz6rczbgkSMcbLMQIXQ3EnZggLnpANLBj2ZAPyc4tLN17XDueRH?=
 =?us-ascii?Q?bajUJ33/SgSy8ur+/a590ohuI0sQF+Zb0cRj92u5LQixiLJCsJekPN7IRaAX?=
 =?us-ascii?Q?3ww8c5JUw4cF67XDtZoNbVdQiqnAjd2SMePWEQynCnj6rPx0g5bT6X5mKLrR?=
 =?us-ascii?Q?PnemB5rRB3ClR5hYH/JsQdNktZWqxy1wwR8JpPAUhd173+7BeSpI2GT99qS2?=
 =?us-ascii?Q?FtiXFwowbMbgfKzjxIAJwM3FxbiuT/QsNlgZecSFTvbUXtmneX2V1j5hCxNR?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f258ab-381a-4080-4bdc-08de161be747
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:17:03.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS2m/VQE0ioCUB9DLNbyWAY52cUDAOIXDQc3ghpTkhCuKN0IODIHGXSOlAASksuzkqehO3PU3ODIBPwUlJzLqmayhO1JHwbtnYxDH1V6gB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF496D5EAB2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5crUm1eXanZgKiWGYnZ24RbOZ9brXt57
X-Proofpoint-GUID: K6kXN1Ejx72UARvL1dFv11jmzWU_9OLI
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=6900b444 cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G8xoJTEVNainHG8ybTEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwMyBTYWx0ZWRfX+XXo8lfYuTzh
 sAEVukxFJWdT5cK8P4zOO/OommZ8yFnNmRUK3W1C1iBPH7LkYjTrODeh0DnrJyA3wNAevvz03Rk
 OQLjtfLl7TZyulf4YuXGzAtntKkyn3sDb2ZSwzLh1LJh3aQHdZuDKxBXNT6zKghPkRYuUCnva0V
 sxMvymoOTzmBZTLfsWshwBAT+C1aoqabSXX6V2EL+iPSu8lxJVeDPJYGS3J6Ph7dM6fIzGCd71t
 MNWIVE7PHpjEC3T8KBAXGwgAFBOuAorPZ1m2KvJojxnK0EU3O3sszVBT/ZMntW7QDfgHUl2leo1
 xPb/fAkxUAuuN+qkNAw/kBvPxA9BFQrSkHv3l+tiQaV+8t0fTe0ow46gur5N8gufppyIUfA5tk3
 7URXIr1ekv4l3q1zMtnuLa0BZFK+nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 12:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225397

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-11081

Trying to dump .sframe in a PE file results in a segfault accessing
elf_section_data.

	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
	elf_section_type without first checking the file is ELF.

PR 33406 SEGV in dump_dwarf_section
[https://sourceware.org/bugzilla/show_bug.cgi?id=33406]

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0021-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index a217d07e8c..f8c7b47ee4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -48,5 +48,6 @@ SRC_URI = "\
      file://0018-CVE-2025-7546.patch \
      file://0019-CVE-2025-8225.patch \
      file://0020-Fix-for-borken-symlinks.patch \
+     file://0021-CVE-2025-11081.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0021-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0021-CVE-2025-11081.patch
new file mode 100644
index 0000000000..cd91e5fa7f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0021-CVE-2025-11081.patch
@@ -0,0 +1,84 @@
+From f87a66db645caf8cc0e6fc87b0c28c78a38af59b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 9 Sep 2025 18:32:09 +0930
+Subject: [PATCH] PR 33406 SEGV in dump_dwarf_section
+
+Trying to dump .sframe in a PE file results in a segfault accessing
+elf_section_data.
+
+	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
+	elf_section_type without first checking the file is ELF.
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]
+CVE: CVE-2025-11081
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 290f7e51f66..ee8823da05a 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -4418,6 +4418,10 @@
+   else
+     match = name;
+ 
++  if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
++      && elf_section_type (section) == SHT_GNU_SFRAME)
++    match = ".sframe";
++
+   for (i = 0; i < max; i++)
+     if ((strcmp (debug_displays [i].section.uncompressed_name, match) == 0
+	 || strcmp (debug_displays [i].section.compressed_name, match) == 0
+@@ -4923,6 +4927,36 @@
+ }
+ 
++static void
++dump_sframe_section (bfd *abfd, const char *sect_name, bool is_mainfile)
++
++{
++  /* Error checking for user provided SFrame section name, if any.  */
++  if (sect_name)
++    {
++      asection *sec = bfd_get_section_by_name (abfd, sect_name);
++      if (sec == NULL)
++       {
++         printf (_("No %s section present\n\n"), sanitize_string (sect_name));
++         return;
++       }
++      /* Starting with Binutils 2.45, SFrame sections have section type
++        SHT_GNU_SFRAME.  For SFrame sections from Binutils 2.44 or earlier,
++        check explcitly for SFrame sections of type SHT_PROGBITS and name
++        ".sframe" to allow them.  */
++      else if (bfd_get_flavour (abfd) != bfd_target_elf_flavour
++              || (elf_section_type (sec) != SHT_GNU_SFRAME
++                  && !(elf_section_type (sec) == SHT_PROGBITS
++                       && strcmp (sect_name, ".sframe") == 0)))
++       {
++         printf (_("Section %s does not contain SFrame data\n\n"),
++                 sanitize_string (sect_name));
++         return;
++       }
++    }
++  dump_dwarf (abfd, is_mainfile);
++}
++
+ static void
+ dump_target_specific (bfd *abfd)
+ {
+   const struct objdump_private_desc * const *desc;
+diff --git a/include/elf/common.h b/include/elf/common.h
+--- a/include/elf/common.h
++++ b/include/elf/common.h 
+@@ -528,6 +528,8 @@
+ #define SHT_LOOS	0x60000000	/* First of OS specific semantics */
+ #define SHT_HIOS	0x6fffffff	/* Last of OS specific semantics */
+ 
++#define SHT_GNU_SFRAME	0x6ffffff4	/* SFrame stack trace information.  */
++
+ #define SHT_ANDROID_REL              0x60000001
+ #define SHT_ANDROID_RELA             0x60000002
+ 
-- 
2.49.0


