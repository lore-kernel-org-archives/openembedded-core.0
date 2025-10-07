Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D51CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 06:33:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12804.1759818783810172462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 23:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HcWN/wS0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375bebcce=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5975ctoc2309810
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 06:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=OsicDZo8s
	3y5qynnW1GESP5yXOOR6Jz/o/Gz9yAwXFA=; b=HcWN/wS0bv/5FkwuzsBLj8sQE
	o5ogJa36X8MmgEGpR/7P508Z+rYts7GY8Kdd22nQQTpSIuxnZ4nIlQ35XZVMXqO6
	h+FS6zuFQ3OqrE1zYV+kfDhBS0LVsxpE3FO9nyewBsEqJHP9fVlBYNp11s7rFmq+
	+vNrJcTRPfQA1oSUKXNmmAtG08bE2ojFMR57PtUFQE2hNJ3lSzyZrt4k8yJITH4x
	14ueI5RJvqjhFLuh+OJjk7RhTYHy/foo3YYcrjaIFKfPSYYRcBJZjLvB71seohF1
	19vPXfqtob1wu2S8UxoMySz194dGn3eQogUygfsiHCYDNx62sOeyT26LoEIFw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj3ajuf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 06:33:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPpzNhp8WMdc972Wr+o8543FGPfG5W5RqEpuTUiBC5JAiESmtldqJWEZsjCylz7u8sJkIcpwzlZPIpo0fDwiavqrDAdrW6H6ysDWm0AVpGosGGvImWB1PvH8VE7b/x0tcPfyp8Zh/OMvt39MxVqTStzHMQ1S/0eYfG3uBAuy6cW5SUNMRCsopH30kXD+thUr04bOseMxHMco5OPNIi4X2h7o0rP4HU5xZtfRdp6on4g709PyK2ZbplDmQgzMsI7s9CN+9/zzNmdC4bHoQ7YcJ0tsXDK1SJ/qxvtBld6gB0nHXVhO6uGDVaRmkt4ivHXqzOjUPYg+b+jT/quuntCzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsicDZo8s3y5qynnW1GESP5yXOOR6Jz/o/Gz9yAwXFA=;
 b=kMXXFgYPBnYBHbJs6MdKjHhCcfdGudzy01hAriy7rCdkaJxJpGO8Z3YPNj+vly7WFPr1Yq74t65xohGreVnr+gWfAQDO22SVrxfEmamnwI5HoQoXtnh69lB6FSxtXxS2W/W2i42n/hnYWYw8NxUq3CCuckeIFsi4Q3c3bomjDFsfpf+qJmylCNR6pjd0GKiCoqzQpxq+inAmpM9g0m+o1/TgwKBsuwX4jZpXq7EWIiBZCdtSTatgfFRO2DtFS5dbaLeMIPIRMiV/zqPEwrEVTouz+U6+EqwRrNvkvpvVgiCJf1jQ4slcjOqEhoP4eUy91zMMGKzT7SKGLVV0z5RCZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Tue, 7 Oct
 2025 06:32:55 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 06:32:55 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Mon,  6 Oct 2025 23:31:46 -0700
Message-ID: <20251007063146.2204704-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: ec78a848-c557-4e82-3403-08de056b596e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hjlme3EcyCmtWXIILTc7K2nv66lOGb3KGOVYTovHN36h/6PsIvubnG7mYc7F?=
 =?us-ascii?Q?31RgmXjlPCfTI3SllXyOPVg2Ucmu0A8UBXJfS0GUgOvVX2lF6Kl8wUUmVk+X?=
 =?us-ascii?Q?xQj3Ujr+Ny7ZwB8kdxLZXoh6xQMnBqHVXpKycqchxhWw5gQdUIwIz4XGLREA?=
 =?us-ascii?Q?urv/lgxNdpVtKBtT/BaYvCxHdf01utJedRt5NuRvymx4O6fbkYcW8vKlr+3u?=
 =?us-ascii?Q?fqE+sipg8fkAYl+Y0YXqSnGD8k7klLUhYPL9EDMhlHylJ9Uni+0mwqh1UOoy?=
 =?us-ascii?Q?CjvfAYN3i8wY4ylzqT/xStFXQWyk/pXSvBZzE5NjGAsAXihN66lg0ncGC7At?=
 =?us-ascii?Q?fXxg0KC4pe8srGVrLWQ5AkgiJSo/OSRaFzGssQCTXjz1GRyyQvtAqziPI/OH?=
 =?us-ascii?Q?MFCfJ05DXw4x6rXmuvlhfm3szW5GrIrKmcHB+94gjcQW+OXGARCx/dLddfg8?=
 =?us-ascii?Q?+z4G00SkV42tcWUd+bjkJMssRZcKSnP44S9uqEt9/eszQtrTLk+MkfcEUmuY?=
 =?us-ascii?Q?59HH/UARzVbsypSaAw0q3TG+lLPaki/t4Zkq2ZEtQs/cAUCfBcolRMyokHu9?=
 =?us-ascii?Q?PSn1we0qC1IWRq6x8E6YGxpJ92zbwQtxhincZ/1MqbQIsAhKaaRyPgWXUtBf?=
 =?us-ascii?Q?b8BQdWGnwRJChdeQB/rZ547Vi+SUaAy+cbrdlJ8Zl5Qer8rdYj0G6aA6MSek?=
 =?us-ascii?Q?vedZzNa6CLmgUJPbhNTyv21+GG5LC/k+PgZmhsscCHVjWCNgG5meR5rWzNUi?=
 =?us-ascii?Q?SXPpvrnBsojDsy0VxcVk1TDRXg1ZzKhJYIVyyVQATHcagrcyishv5W/4ZrQK?=
 =?us-ascii?Q?dWdnaoerQArCaHpiSRGgjivPBQU2WTGcR9vDuua5qJro9FvvUGdeM9/JMa9m?=
 =?us-ascii?Q?aBcA2CbDz/1z3qUBTXZSA75NRcRqe7zyzeayDg/4Z4hiCuFO+s1x/U4ESghi?=
 =?us-ascii?Q?PmLdRBLI5GotNA29XzcUKl1WLDbF8kDXaPtixpl69lIUcGgj6c9kdyzhMY/Y?=
 =?us-ascii?Q?Lv4lrILMO3BsP9vqo6V5AhVw7rPkeef5Kzc6ADG2I1nqftSZxae2+TLAS5O1?=
 =?us-ascii?Q?kuj88btDFF5K+GkWa3mKjftjTdeJjmdBixzJojOiwP8Fd01GbxkeO6W2p0YA?=
 =?us-ascii?Q?NOPisLAYdWaGcwx/6JPSTzb2UnnsaQuFYwBM4CJqTL2Gk2uNo9bM1dILlLGD?=
 =?us-ascii?Q?RZJKolkEyQpUIYEBIoGos63QQqOF6h+mWjvbIVeWckPNofmyOAtbviMVCNcl?=
 =?us-ascii?Q?Bl9hTMgtghcBLCuvrKPHhtSoutBYDHY6syTVSMO6G2T7m5qzRRLVAkkzaCGD?=
 =?us-ascii?Q?75YAcAvVqTYQUGdptw0Y2zupS/6jk5vXiWXlnzVbGOMeaGst4F+wTrnu6HtD?=
 =?us-ascii?Q?QeRnZY1EXenMuJEJTCLe8bEeghnJ3+KWApAd3RWGGI9dkCsPGYOcX1/xJeaY?=
 =?us-ascii?Q?GiHkL4RVulyVHSFqly5i3/Bu5AAnlcGnFSdbsTEz6wxtMXtSCsPCMUT6GNrl?=
 =?us-ascii?Q?Jk38okitOt6lkk4xSWmHK34bVXYnvS1hAR6c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C+nxYfeipPiehctmt+u6JJnsUkfufOwLjq+XMZQiT6Nxb2gFBbBt6M9NaEr1?=
 =?us-ascii?Q?SoBcrwHZAwNuQV9ctGsghGoh3yPjj7keDxbHWw7qHmHJDbu9SxpQBqey6tIx?=
 =?us-ascii?Q?B5LVknFY/6H4dP7gpEMZikef97gnfm5LmT0U2j02ROJgxc/i/RTpH5/4ne8/?=
 =?us-ascii?Q?1+YZnZKZJCYnuGmm3tDZR7LEh1IzC0lwWadlMC8wv2/N49OE9YFTEkg5kjdW?=
 =?us-ascii?Q?7KC6rV3BIA8sV8OIxqvOyZ64s0eutGXm0zwRnIRZzlJBqIai2b+z1hTGLSy4?=
 =?us-ascii?Q?VGQbqZvUvm8K0VexERau8NMgEhf1ERFLJKlkn8b5ZWHG1v8YpPVW6x85xMoT?=
 =?us-ascii?Q?ANj14tGLnzbOMf6FrgZ5izc00F/k5ZyI2Is7UHtWSACZhuhu6Ab0ScG+dyuP?=
 =?us-ascii?Q?4lF+pbZ+4oyrlJVn59z+Vq5Or1OhA9ayOw7+dML0yNFXyCHRmTBHPqrFic0O?=
 =?us-ascii?Q?1Ig3NfmtjPQ/idV3WCy5RiC0M/yyIDSvzC9OxyK5ri/fkrQ3TJqgF5RnNhCx?=
 =?us-ascii?Q?t0wU6CKQkm8iHHh6SEZiKCHy0CXz+yxx09bFAg5WU/tQcHEKJi1yKITaCob7?=
 =?us-ascii?Q?jfe6p0SgrSPSb6BGq9QQtvSb1JutkaKnHHlUyCgHDKi/04HbTuvfJGDgf0gt?=
 =?us-ascii?Q?pcwEc9LiMQ6DPY2I2zPmOS99n9wj5TuSqD2G1UHierYCW7MVWOfT5EqTMY7f?=
 =?us-ascii?Q?YcJSAzZBwdypqN8Og0CXaVd6MFaXgKz+P/p4uLpKcapMm3FwDI/4qx6zg2Ih?=
 =?us-ascii?Q?2GPRxq47AOZRAllj1BM8yCCYYNMIWSVGgprdYGmsdaLBD6MLw8lDb907BMqM?=
 =?us-ascii?Q?h/Ew1CMhAScqO2q9Q0+y8rsAFz2UvpD/oxUwIAA8eSj4k0pMVRIw2yXhD/QM?=
 =?us-ascii?Q?+MwGjs5+AHIC96VOTOQD9RWQS+fqdVxIw2DKSZ8vh3d1q1n8+DdlVZhShJmw?=
 =?us-ascii?Q?T20o7U8U0vEgAB1JNxWxOSe9MtGARmhd+a166M5BZktrfmpvb0O38hP0AntN?=
 =?us-ascii?Q?3P7m89MRWghl90KvCmaooPsmgWhC7cemVCtQNsUcZnYC0yqNbSY/hU0A3teR?=
 =?us-ascii?Q?ZciTuFPfuojxih19YqZaHXP6L6tMBgz8mJcLcv/v8ffm9ZGswSkvrQuGhU/U?=
 =?us-ascii?Q?ts85w2OR0ckrn+DvSsVKR6qVe+WR44r1b5W2fuj14MU3jn2PRYx4e7nLM4dV?=
 =?us-ascii?Q?zsxziLApFt8hSy/qlaBHS3ZMxZK53kzsdr7ycniEH+otRjwiQG1eN48eGaM/?=
 =?us-ascii?Q?NF08zyjKIsD7HbRSM3P0yJwkMWDYnDG7p/oXQvyZitItNYqbz+h2Tjlt7tDL?=
 =?us-ascii?Q?oVc0oho3nV5mM8e32lhdspIxRPyVtDACZzKdN/75jsjw6oY9ZsMkid/puH2H?=
 =?us-ascii?Q?nTtCKzlQ75yAABv2gHS8CaH06jNbbAl9FEM1VHTFp9IrS149vVV1o/Y/muZu?=
 =?us-ascii?Q?ECDfGG2iIIO6An2TSMePhErnv8rB3nPNm8oSn9V1AI0IVYP7TZEBgTUaDjxd?=
 =?us-ascii?Q?ky/iE0Pvs7UMkdkNV+Ep1tuNPPO9kqKNeT4uAr0UBvB28macQE1kK+7P2TwP?=
 =?us-ascii?Q?qQlnB5cOA/MFzc3osXruTOAibVeuxbqBiSJYNQBdSuR02GT1Kph3+FxUmnZ7?=
 =?us-ascii?Q?Ppm9TxMR7o31oNQCibyi/SA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec78a848-c557-4e82-3403-08de056b596e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 06:32:55.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNliUHW4ApI9xAUiN75lK8BoLMbZDXWrJU3+hX3OGO1PHzaD/KzBXBXD+A0ws9X0Lws035I/LZmxhYw0m4WQ4yFfw7YcRI44TJ/QPEIyTMMkzIZXOW58CjeedYln9agv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
X-Proofpoint-GUID: p3hKZ8CqQn_7w6_KwUFjq3ne95cnlg-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA1MCBTYWx0ZWRfX2wA8dgZkB3bq
 OIK1BOl/N/SMGAXawJRKkoBERuxh7IUfw4c3WySu7EaKps+bIi5Cg1SSVOkw/AYXHU/Wjq54L11
 +0Rt5s8V+ZdM+3YkCs3le+xDUFVVh9eIRbEvNX1mk0AL0djN2+HgxvZTSsDHadI7tYt4Z+G8Bko
 KR7eJgXdJTeI/W0pHjHAivH1Btp+2s7sfBzR4w9SDin6shoAjSUjGJiXbo9Af44K45o4UwoF5mJ
 TKgO7MKSws/kewPu1kBQPvsI4T2qFwKOjvaPmunvsz23zz77ywuOMtzFeKvaLZ58AJuH9gehuNV
 wNNW9EYyg6DCMxv6s9ypZ2D+0ZnbmdfTe63AETBlWqavtfhFI4x2GEYMOhlsirf4/RPw8uz5KDi
 PwuOg0ox2cwj+DfcAF7Bw9HGGYJ0YA==
X-Proofpoint-ORIG-GUID: p3hKZ8CqQn_7w6_KwUFjq3ne95cnlg-U
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e4b41e cx=c_pps
 a=oVQupeHHWlONJbG3R3cvFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=ITOSnwOEketPtstdGAcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 06:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224512

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f2c33719e3a5bc13432552991513b

765534258e (HEAD, origin/release/2.39/master) nss: Group merge does not react to ERANGE during merge (bug 33361)
7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
a6ac06abeb Avoid uninitialized result in sem_open when file does not exist
ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ #32245]
fffc2df8a3 Optimize __libc_tsd_* thread variable access
83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
3b6c8ea878 debug: Wire up tst-longjmp_chk3
89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
4c2509882f elf: Preserve _rtld_global layout for the release branch
cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy relocations
97017da5ef elf: Introduce _dl_debug_change_state
5601ad79b7 elf: Introduce separate _r_debug_array variable
24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug 29190)
5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded
4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug 32066)
f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug 32065)
e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug 31985)
fef226255d elf: Add the endswith function to <endswith.h>
d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out
4f145bb35d elf: Switch to main malloc after final ld.so self-relocation
65d86471ce elf: Introduce _dl_relocate_object_no_relro
5434cc2c41 elf: Do not define consider_profiling, consider_symbind as macros
b2d8c6cbe7 elf: rtld_multiple_ref is always true
2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (bug 31986)"
46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlopen (bug 31986)
d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT switch
6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)
9fa7cc6a0b ldconfig: Move endswithn into a new header file
269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support (bug 31840)
42a8cb7560 Remove memory leak in fdopen (bug 31840)
d1c1f78e9e math: Remove no-mathvec flag
20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variables [BZ #33234]
c11950503f ctype: Fallback initialization of TLS using relocations (bug 19341, bug 32483)
25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupper,tolower}
fbdf9680cc Remove <libc-tsd.h>
fca5937510 ctype: Reformat Makefile.
49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)
392e6cf1e8 AArch64: Improve codegen in SVE log1p
3a78a276a3 AArch64: Optimize inverse trig functions
b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]

Testing Results:
            Before     After    Diff
PASS         5080      5096      +16
XPASS        4         4          0
FAIL         119       123       +4
XFAIL        16        16         0
UNSUPPORTED  154       154        0

Testcases changes

testcase-name                                                before           after

debug/tst-longjmp_chk3(new)                                    -               PASS
elf/check-dt-x86-64-plt(new)                                   -               PASS
elf/check-gnu2-tls(new)                                        -               PASS
lf/tst-dlmopen4-nonpic(new)                                    -               PASS
elf/tst-dlmopen4-pic(new)                                      -               PASS
elf/tst-dlopen-auditdup(new)                                   -               PASS
elf/tst-dlopen-constructor-null(new)                           -               PASS
elf/tst-link-map-contiguous-ldso(new)                          -               PASS
elf/tst-link-map-contiguous-libc(new)                          -               PASS
elf/tst-nolink-libc-1(new)                                     -               PASS
elf/tst-nolink-libc-2(new)                                     -               PASS
elf/tst-rtld-no-malloc(new)                                    -               PASS
elf/tst-rtld-no-malloc-audit(new)                              -               PASS
elf/tst-rtld-no-malloc-preload(new)                            -               PASS
elf/tst-tls23(new)                                             -               PASS
elf/tst-version-hash-zero(new)                                 -               PASS
libio/tst-fdopen-seek-failure(new)                             -               PASS
libio/tst-fdopen-seek-failure-mem(new)                         -               PASS
nptl/tst-sem18(new)                                            -               PASS
ctype/tst-ctype-tls-dlmopen(new)                               -               FAIL
ctype/tst-ctype-tls-dlopen-static(new)                         -               FAIL
stdio-common/tst-scanf-bz27650                                FAIL             PASS
malloc/tst-aligned-alloc-random-thread-cross-malloc-check     PASS             FAIL
malloc/tst-aligned-alloc-random-thread-malloc-check           PASS             FAIL
timezone/tst-tzset                                            PASS             FAIL
elf/ifuncmain8                                                PASS              -

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89e532fd67..f63eb0ad56 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
-SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
+SRCREV_glibc ?= "765534258e7f2c33719e3a5bc13432552991513b"
+SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
-- 
2.49.0


