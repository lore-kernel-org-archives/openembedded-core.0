Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D83C4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 06:00:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.627.1784095251417563684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 23:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SoGfPgnw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=165692db3c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F5A4pc3632803
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=HjllDWBrOweYWqufjncRDy6vJ3eVSCTzl1SkYX1jcyM=; b=
	SoGfPgnwRIMc62Yt9oXQ+ktTG5T8OjYa2tcjuT589lU7g4YvFS9IZmU0sx3rzX/k
	0EgHcRBZcgiWCv9MY39dl/C9/PRkq8dno0MrjucHDS8UWMdGSV2xruUH5nUHtAWE
	yZT0nNJpjSqEkoR+yFjQs006l5A1cHgiLCAgGcl4g+TgNvaG9WrD7Eb8ko28rcYv
	5ZigTdGLOzcFvAe5NQ46RpFjuOaZ/0qP151qNfu+EpBre4I/2hVFke4yu08gOmnU
	npGXdE0ethXLQ1h4C8/3f8+OH/ZdU6KCK+yBp1fQuEesl0CLCdlfztbWwRRPBzMY
	HW+o4Dmq3+8lA1sd2l429g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbnbdn9yg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enKkIPWQkfgwERG3xW5YZBn8aNrj6uxb+420GJiqAyGFNUrLxGeVFWDhiFV4j0TQF4vcO1M9o1yv9f352UaDoPdBdMmVtohbQIX1N8pvJAe6ArOkhCxZLVNu/lla0x1MOkgHbzpenLHIlFhOG/1py03UyKxzqE8gVTF32KBEXbRRKST+TMsdFpA4CyUab1rvvkE5zRVQDFeip4amWQMJLqGLTLGzkKAxczItW0EybdrNaIec8w5obgxEjMaPfcY4XMMF6MM7y/sfB1t6JnosnMT0QSFrC9yGCOuVpDvNI4dEm86ZPDfqC3eOxB9mFaVDx76GMNJWHqT0S4IdkBY1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjllDWBrOweYWqufjncRDy6vJ3eVSCTzl1SkYX1jcyM=;
 b=jIIDVOtkxdyl4N0ZpFl8n6X6boT/UqvAKTsc2Zk+aXv0cCXgPMgIZzYV8EKvhZjBr81DxHhf+Uu4ElSn1/NRkSV0g7BixSyb+se4+0PBzrMKAkiaGu4gA92O6zYRAURHnPqsUTJlSMwVK6T6ACQXDulfTZ+tdQLl8Ghb9di+SjsxeJhzwRlFsbS5/tVvTfLVX0KG3h7TL3vDCgzNnTaiWsc9Kx4QejfuR6QsVSuaKGxepjzzy6cFsMESaDKMbFZztQELuZGMOU14PtXHaXbkJAEf9f3tZttmwoCTLbuxJ1ljXK2/LlyiJeDhUGf9gV9Mid5DgHGfGUDBaXKGH/VT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 06:00:48 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 06:00:48 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/3] oeqa/selftest/clang: Add oe-selftests for Clang/LLVM/LLD test suites
Date: Tue, 14 Jul 2026 23:00:21 -0700
Message-ID: <20260715060021.579656-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c3c23a-cd9a-4ea8-defb-08dee2366b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|18002099003|22082099003|38350700014|6133799003|3023799007|11063799006|21046099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	/scRyap3uFsB8QxsC6eye9rrMwY+Hp0KnIdj+YwsB4ICgXL0wniiioHQq9b7Hdo3Py1uiWVte71KbUY+XdfJ3YTNiljJSLz+gPeDhWcoLjhAzIG/MkitjsQb/NhbeFzAtExmYzkh/lXlsBWvadzZVB1jE7rncJllQSi6rw2F5JwKkeUS5G2mFLIluQpfdCceTZYKaFyJGchZIuqInNIEWgcfwzc/+wBwN/pHdL7sOJ8N6P8QL9hb7O0/xpzu+tO2XM56D3wdGW1SDY6ar6yz1yGXWVL++ECIGrkSrcICTeo2e1F2kRmpMVSd/53dmcKYY3el6ChdDJpoz2dtedgvROdIwAmPu312CI/WpsQslG1QBrd6tDfjc2IpF9HoyvOxHhQ01GtJ3f1icHszNBEoCwQPZdy+3vvhUe5NvdQgASykq6y57tsvJIHaO2xZ+mZGgYqXBKjueqxVMn1lt6M+xOzykqXYtWG2xYE24VpISCmM8BwSw/WeTMwRLLFJxUH/4eUnW87BLKbPNMNx4HAvdiPXOZCwcYQkopEMV8/BdaD1cwtC4Ix8QKrT1R+S5+Qh8F6pFKXndeDc+HlpH7ztAqiqo7XOOCEnYCg9bqr3N56P3Tbr1jLdBN+DJtq3eFtFkXO4otR0QFu2p8MCpC0lGY7MRVBNk2xTNV8zEAXNTzyWJ6SAgB/gav3pFHOdyJbfUfVltVA261fy2l25Si8/8YnU+ZAZhSeaf43Zrl5uqN8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(18002099003)(22082099003)(38350700014)(6133799003)(3023799007)(11063799006)(21046099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RUOniYJg0Zqy7wIcmDf/uEqWwB0eA9TXA70ujvWNixCF1q7tOb0ZlPe0OtIR?=
 =?us-ascii?Q?upJAQj5VitTKHZvNVIKxTF9DaizMxSy4wgDJLw6ppSFD1V+BSgyNq9anDuBI?=
 =?us-ascii?Q?XeOT/CWp+WC1W7/GbzfRaep170UY9eqmZnZ9ng4mgIDG21t+oo0A6bByZOl2?=
 =?us-ascii?Q?PdH2g5rmYswRJEuXXqdwMPijoeHSBCccGIG52U5PvR2TPxWEv/TwMZZ41xdd?=
 =?us-ascii?Q?wGBgp/HubeUR7vJI07vIHRQU4PeNa3qbdaKiDRuOX8XbvAms/yta64Ys6hm1?=
 =?us-ascii?Q?BardI6PothSN5f0szw8s7cRRiPmelQOGzeX51WA8KEEmMVWLx9ikT04krSmV?=
 =?us-ascii?Q?nSMMIIiIJ8AQCNd/Ucp7aGEf4v9udO1svQ91B6Wj5rQCpDSo/R+6M05pTKB8?=
 =?us-ascii?Q?S1gv6PMx/0m3wyfiNhA8sUopGrPpiMlBKmxcJY+mlzxCzQPmfR81tMPgyQi0?=
 =?us-ascii?Q?vQfWnWJm2+9qeRxoQFqYw5rx3Vayp6zfHupdbjWwnWZ/Yp+ZbFCFc6Yw8Yy/?=
 =?us-ascii?Q?ooGgNUvy+/D8oewgEUcWnEC+wdoSEg57KKt07k93UfhMt8wrtA13b84mz6r5?=
 =?us-ascii?Q?EKqPnDaWrLigd53khKc3cRQgYw8HesQcJsfmA5Uc055a3MhvHrqXxrvlws3K?=
 =?us-ascii?Q?E1nVrkyRCnXmCAN1TqmjX7TmwMvyDqoC4s2H0htXEz09viTj5xHRzdprMGFz?=
 =?us-ascii?Q?our8hxZqcyGXO/qcp7LoJ5CHMLDVvXuzKP30s7KPxltad/JdxGtnNlwV+ZB8?=
 =?us-ascii?Q?VzXzA2smvehKauO3R+2oWrrrfgea7RBavP8HltnIM5ShR4YcdtJGjFcqqEph?=
 =?us-ascii?Q?CTVohvRVjK9UqXj7erfj3Juh15W/rkZqHG3RiNx0lHXSoLFsO6nLt5Ua43+i?=
 =?us-ascii?Q?kKjNK7DyhvXlG+i6oHJC8wQWViU9y9HNTDoizUfygR+iubc1/LuORTdtCcEn?=
 =?us-ascii?Q?ni6bnHbbV6K66GYGWAbRiqkKx1N/52A5lBxw85kPm1y/fZgEt7OyahGOX5Lc?=
 =?us-ascii?Q?7FaJl8MU4WnQfmVsukmjVHuE/U718yAh8WJ4yjIqA4ZbI4DWEWA1mriAS6BF?=
 =?us-ascii?Q?qMaJwc8tHCcljrUliRFrDdTVu2tSbyTNovjEhS1QaEnhrAJAARSl4qG1bmuw?=
 =?us-ascii?Q?ZWxevHVFrmqnRe7rfOp1SsykgV53GW9rEklrkaKpnGgRkC3IA/jJ7S1KfbXJ?=
 =?us-ascii?Q?3m4eh2DP2IDFYDY2stlub4sCPglbOoU2bqQJYpS/JRWH0pI8PV8qk0+gCJkB?=
 =?us-ascii?Q?MTd9Cv8UBitSt42XwsRPe6CZsQQhdhBEqgfPuSOQWzfh1wwjOgaejKjqZlz7?=
 =?us-ascii?Q?0lpndHfkNiG0PSVevCo9l/5fcb4oyZYqgdUX16OhvvAen0BQEWAs1JNnksjG?=
 =?us-ascii?Q?yI8AnWgWzKQZg6pYyLzUrDTsXbulKJvbJRXm2GXwQxbL/CmH4u4hmxKEa+GT?=
 =?us-ascii?Q?00qwRblLunL8EDX3lHl5vNXXAM3+T28vc4QZcAXNET2wqryAb1TPTiWyepib?=
 =?us-ascii?Q?0uP8+IOhB3aN/r65Mpx/64QmO9+7CjLE2e8j4SK7ITa4OKSCCLPTVKrwE2uA?=
 =?us-ascii?Q?BIX/tJSrkHD0FsAJ+28jFgrxsXryMRX7G8Ka2etbHc1iFgsfzvKqlIZ1Dxkj?=
 =?us-ascii?Q?S8NMNXRE6YjgGE8DKGWY6rbkQD/jgauziNSdK4yggKU3rqc8BsppZj6RdYT1?=
 =?us-ascii?Q?M0pZorGlT0QuLqs/5LWThyWlhccSkFmjhM8pyYsAfH3NZq6nE1/X5uubinwH?=
 =?us-ascii?Q?X0/DbGPyQzoexAM1Q7+usO/nrHt53bjtX59D5XyYMdymzzyGNErN?=
X-Exchange-RoutingPolicyChecked: 
	AVVXguzxh+ED1ruIG1XEiblxvJrEIkhYdDwBD/0LrD+7J5XZf/DJLo96UyX6c06Dj9pyJp7lT7X7D7Ueub94/br9iEAJbNQT7Q5BO+baFAlr/2Jd90L0GCfMtMHUWpMlLVzuv5qGA23RDNCykluMdPXWE3zhaCAcsgFhcs+5rZ5napeKGex7+vmSFKSMuEUJhqY51u/GRasvfx3eZnjFQp2w7jwd+bs4XmTR/INh1GknauKJLafOPkQhLtzAFLFRTBXJ2zjwcuCnGxL60XFHiwP8od1y5b478tZfaps48PLb0zyTkbuZEr0wwaGNROZ3s0cqblk2CMTigeRQeWv9Sg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c3c23a-cd9a-4ea8-defb-08dee2366b0a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:00:48.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPckcqw4Phk8612w+KBiaymXHU9wgzpmm7jIwuxYcDRNTG4gN08ybBsD2KhhXKmuKTs3gXF3Wxom3/k2Gbj3rP8oSGKTGa89/3TYtV8ZF8s+WHfhoGs7LHyP/D6JGSXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX3t2xzIZNsuug
 tWigZd9FM/ubhDcZhjPZvR1cxAqTVQPHNtsM7f6+1oGb+k5vZp06PWUUZJ47k+0CQzXJucCbaaZ
 brtgoPGVxI5Tfx4cpum0vvt7RPUM/0+drK+URk4St22PkUmfMWxnajTToaGoKCI2sQtGvXuA2AL
 EAo9XB2J5XGJr1kcn4x4AIuWLlDAFrJuRzJmcVDQBDMPhIRx9CkLJO72UUaocJK30eKc7nC60nm
 Ymxh7PC5xQmiQVKMdxsvuj5epfw7pFm50VegDGkCXpmsWlSalQQapWy7Iqxn4TCaFZPLRJDiXTx
 iKk1htl5AwWKVdwkEQIhu8zftNhybl9Cn6DiCjskBJKY7/xVtoQKvrb8KoykQ+C7ZcgZa094PPz
 ImJyvN5ES3/BpD+tQyLEkAWJx68tPpS5DP4pN6mM7K5E9KDNZCVWbfH2gWl9kjFFPI1yvIHgwBD
 w9ZzfIHVDMRnC55+EfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX+MTWCtT6dmP3
 53HN8EnLRabIBEZ0yt5duz53Fq9xL0ge0hSxUWWY00RZhZ9iH4bWf4/aPCyjHSxQZDb9NmdGaDF
 zs/YS2N5v2Khuu+hngcOVHHWcKuVHBgdb1pSiM4D6BIASjAuWpM1
X-Authority-Analysis: v=2.4 cv=VI/tWdPX c=1 sm=1 tr=0 ts=6a572212 cx=c_pps
 a=9AcDkMntNQwiSFi2uhiI7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=iG7WmaLeum_H_6XJk-4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Mt9qZvDftDG7eGHJLPsYVtB6ZrvGE6EE
X-Proofpoint-GUID: Mt9qZvDftDG7eGHJLPsYVtB6ZrvGE6EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 06:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240941

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Add three selftest classes (LLVMSelfTestSystemEmulated,
ClangSelfTestSystemEmulated, LLDSelfTestSystemEmulated) that run
the upstream LLVM, Clang, and LLD regression test suites on target
using llvm-lit inside QEMU.

Each test:
  - Automatically sets CLANG_ENABLE_TESTSUITE = "1" to enable
    testsuite CMake flags and target tool installation
  - Builds core-image-minimal with Python3 and LLVM dependencies
  - Boots QEMU with 8GB RAM / 4 CPUs (3GB for 32-bit ARM)
  - NFS-mounts the host TMPDIR into the guest to access build
    artifacts (lit configs, test inputs, and target tools)
  - Runs llvm-lit with filters to exclude tests for non-target
    architectures and unsupported OS platforms
  - Excludes known-failing tests specific to each component

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 330 ++++++++++++++++++++++++++
 1 file changed, 330 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
new file mode 100644
index 0000000000..5defde3f60
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,330 @@
+#
+# Copyright (c) 2026 by Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+import contextlib
+from oeqa.core.decorator import OETestTag
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+from oeqa.utils.nfs import unfs_server
+
+class ClangFamilyBase(OESelftestTestCase):
+
+    ALL_ARCHS = [
+        "aarch64", "arm", "i386", "x86_64", "x86",
+        "mips", "riscv", "riscv64", "ppc", "ppc64",
+        "hexagon", "sparc", "sparcv9", "msp430",
+        "loongarch"
+    ]
+
+    EXCLUDE_OS = [
+        "Mac", "macho", "Darwin", "OSX", "wasm",
+        "Windows", "Win", "MinGW", "COFF", "zos",
+        "FreeBSD", "aix", "fuchsia", "ve"
+    ]
+
+    DEFAULT_PACKAGES = [
+        "libgcc",
+        "libstdc++",
+        "llvm",
+        "python3",
+        "python3-core",
+        "python3-modules",
+        "nfs-utils",
+    ]
+
+    def setUp(self):
+        super().setUp()
+        self.write_config('CLANG_ENABLE_TESTSUITE = "1"')
+        self.target_arch = get_bb_var("TARGET_ARCH")
+        self.tmpdir = get_bb_var("TMPDIR")
+        arches = [a for a in self.ALL_ARCHS if a != self.target_arch]
+        self.filter_out = "|".join(arches + self.EXCLUDE_OS)
+
+    def build_core_image(self):
+        features = [
+            'CLANG_ENABLE_TESTSUITE = "1"',
+            'IMAGE_FEATURES += "ssh-server-openssh"',
+            'CORE_IMAGE_EXTRA_INSTALL += "{}"'.format(" ".join(self.DEFAULT_PACKAGES))
+        ]
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+    def start_qemu_nfs(self):
+        ctx = contextlib.ExitStack()
+        s = ctx.__enter__()
+        nfsport, mountport = s.enter_context(unfs_server(self.tmpdir, udp=False))
+
+        # 32-bit ARM can only address up to ~3GB
+        if self.target_arch == "arm":
+            qemu_mem = 3072
+        else:
+            qemu_mem = 8192
+
+        qemu = s.enter_context(
+            runqemu("core-image-minimal", runqemuparams="nographic",
+                    qemuparams=f"-m {qemu_mem} -smp 4")
+        )
+
+        status, _ = qemu.run("uname")
+        if status != 0:
+            raise AssertionError("QEMU SSH check failed")
+
+        status, _ = qemu.run(f"mkdir -p {self.tmpdir}")
+        if status != 0:
+            raise AssertionError("Failed to create TMPDIR on target")
+
+        mountcmd = (
+            f"mount -o nfsvers=3,local_lock=all,port={nfsport},mountport={mountport} "
+            f"\"{qemu.server_ip}:{self.tmpdir}\" \"{self.tmpdir}\""
+        )
+        status, output = qemu.run(mountcmd)
+        if status != 0:
+            raise AssertionError(f"NFS mount failed: {output}")
+        return ctx, qemu
+
+    def run_llvm_lit(self, recipe, extra_filter=None):
+        build_dir = get_bb_var("B", recipe)
+        workdir = get_bb_var("WORKDIR", recipe)
+        guest_result = f"/tmp/{recipe}-target-results.json"
+        host_result = f"{workdir}/{recipe}-target-results.log"
+
+        filter_regex = self.filter_out
+        if extra_filter:
+            filter_regex += "|" + "|".join(extra_filter)
+
+        cmd = (
+             f"cd {build_dir}/bin && "
+             f"python3 ./llvm-lit -j 4 --filter-out '{filter_regex}' ../test -o {guest_result}"
+        )
+
+        return cmd, guest_result, host_result
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLVMSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLVM_EXTRA_EXCLUDE = [
+        "BugPoint/compile-custom\\.ll$",
+        "BugPoint/replace-funcs-with-null\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice-absolute-md\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice\\.ll$",
+        "CodeGen/Generic/fp128-math-libcalls\\.ll$",
+        "CodeGen/Thumb/2009-08-20-ISelBug\\.ll$",
+        "CodeGen/Thumb/2010-07-15-debugOrdering\\.ll$",
+        "CodeGen/Thumb/2014-06-10-thumb1-ldst-opt-bug\\.ll$",
+        "CodeGen/Thumb/PR17309\\.ll$",
+        "CodeGen/Thumb/dyn-stackalloc\\.ll$",
+        "CodeGen/Thumb/frame-access\\.ll$",
+        "CodeGen/Thumb/frame-chain\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/scmp\\.ll$",
+        "CodeGen/Thumb/smul_fix\\.ll$",
+        "CodeGen/Thumb/stack-guard-xo\\.ll$",
+        "CodeGen/Thumb/stm-deprecated\\.ll$",
+        "CodeGen/Thumb/stm-merge\\.ll$",
+        "CodeGen/Thumb/thumb-ldm\\.ll$",
+        "CodeGen/Thumb/ucmp\\.ll$",
+        "CodeGen/Thumb/vargs\\.ll$",
+        "CodeGen/Thumb2/2009-08-21-PostRAKill4\\.ll$",
+        "CodeGen/Thumb2/2009-09-01-PostRAProlog\\.ll$",
+        "CodeGen/Thumb2/constant-islands\\.ll$",
+        "CodeGen/Thumb2/ldr-str-imm12\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-1\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-2\\.ll$",
+        "CodeGen/Thumb2/thumb2-ldm\\.ll$",
+        "ExecutionEngine/JITLink/Generic/llvm-jitlink-option-show-addrs\\.test$",
+        "ExecutionEngine/JITLink/Generic/sectcreate\\.test$",
+        "ExecutionEngine/MCJIT/.*",
+        "Other/spirv-sim/.*",
+        "Transforms/LoopLoadElim/.*",
+        "tools/llvm-cas/validation\\.test$",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/DXContainer/dump-section\\.yaml$",
+        "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
+        "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
+        "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-segment-layout\\.test$",
+        "tools/llvm-objcopy/ELF/check-addr-offset-align-binary\\.test$",
+        "tools/llvm-objcopy/ELF/dump-section\\.test$",
+        "tools/llvm-objcopy/ELF/gap-fill\\.test$",
+        "tools/llvm-objcopy/ELF/pad-to\\.test$",
+        "tools/llvm-objcopy/ELF/parent-loop-check\\.test$",
+        "tools/llvm-objcopy/ELF/strip-all-gnu\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-keep\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections\\.test$",
+        "tools/llvm-objcopy/ELF/update-section\\.test$",
+        "tools/llvm-original-di-preservation/acceptance-test\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
+        "tools/not/disable-symbolization\\.test$",
+        "tools/opt-viewer/.*",
+        "tools/UpdateTestChecks/.*",
+        "tools/yaml2obj/ELF/custom-fill\\.yaml$",
+        "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
+        "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-end\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
+    ]
+
+    def test_llvm(self):
+        bitbake("llvm -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "llvm", extra_filter=self.LLVM_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=7200)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLVM: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLVM lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class ClangSelfTestSystemEmulated(ClangFamilyBase):
+
+    CLANG_EXTRA_EXCLUDE = [
+        "APINotes/yaml-roundtrip-2\\.test$",
+        "APINotes/yaml-roundtrip\\.test$",
+        "AST/ByteCode/builtin-bit-cast-long-double\\.cpp$",
+        "AST/ByteCode/builtin-bit-cast\\.cpp$",
+        "AST/ByteCode/builtin-functions\\.cpp$",
+        "AST/ByteCode/builtin-object-size\\.cpp$",
+        "AST/ByteCode/c\\.c$",
+        "AST/ByteCode/codegen\\.cpp$",
+        "AST/ByteCode/complex\\.c$",
+        "AST/ByteCode/complex\\.cpp$",
+        "AST/ByteCode/const-eval\\.c$",
+        "AST/ByteCode/const-fpfeatures\\.cpp$",
+        "AST/ByteCode/constexpr\\.c$",
+        "AST/ByteCode/cxx20\\.cpp$",
+        "AST/ByteCode/fixed-point\\.cpp$",
+        "AST/ByteCode/floats\\.cpp$",
+        "AST/ByteCode/functions\\.cpp$",
+        "AST/ByteCode/hlsl\\.hlsl$",
+        "AST/ByteCode/intap\\.cpp$",
+        "AST/ByteCode/invalid\\.cpp$",
+        "AST/ByteCode/lambda\\.cpp$",
+        "AST/ByteCode/literals\\.cpp$",
+        "AST/ByteCode/memberpointers\\.cpp$",
+        "AST/ByteCode/neon\\.c$",
+        "AST/ByteCode/new-delete\\.cpp$",
+        "AST/ByteCode/placement-new\\.cpp$",
+        "AST/ByteCode/records\\.cpp$",
+        "AST/ByteCode/spaceship\\.cpp$",
+        "AST/ByteCode/unions\\.cpp$",
+        "Analysis/dead-stores\\.c$",
+        "Analysis/exploded-graph-rewriter/.*",
+        "Analysis/scan-build/cxx-name\\.test$",
+        "Analysis/scan-build/deduplication\\.test$",
+        "Analysis/scan-build/exclude_directories\\.test$",
+        "Analysis/scan-build/help\\.test$",
+        "Analysis/scan-build/html_output\\.test$",
+        "Analysis/scan-build/plist_html_output\\.test$",
+        "Analysis/scan-build/plist_output\\.test$",
+        "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
+        "Analysis/scan-build/silence-core-checkers\\.test$",
+        "Analysis/virtualcall-fixits\\.cpp$",
+        "C/C23/n3018\\.c$",
+        "ClangScanDeps/module.*",
+        "ClangScanDeps/multiple-commands\\.c$",
+        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
+        "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/visible-modules\\.c$",
+        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
+        "CodeGen/builtins\\.c$",
+        "CodeGen/compound-literal\\.c$",
+        "CodeGenCUDA/static-device-var-rdc\\.cu$",
+        "CodeGenCXX/int64_uint64\\.cpp$",
+        "CodeGenCXX/pointers-to-data-members\\.cpp$",
+        "CodeGenOpenCLCXX/constexpr\\.clcpp$",
+        "Format/docs_updated\\.test$",
+        "Frontend/rewrite-includes-bom\\.c$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/crash-vfs-umbrella-frameworks\\.m$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/embed_constexpr\\.c$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+        "Sema/arithmetic-fence-builtin\\.c$",
+        "Sema/atomic-expr\\.c$",
+        "Sema/auto-type\\.c$",
+        "Sema/builtin-expect-with-probability\\.cpp$",
+        "Sema/c2x-auto\\.c$",
+        "Sema/constant-builtins-fmax\\.cpp$",
+        "Sema/constant-builtins-fmaximum-num\\.cpp$",
+        "Sema/constant-builtins-fmin\\.cpp$",
+        "Sema/constant-builtins-fminimum-num\\.cpp$",
+        "Sema/constexpr\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-1\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-2\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-3\\.c$",
+    ]
+
+    def test_clang(self):
+        bitbake("clang -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "clang", extra_filter=self.CLANG_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for Clang: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy Clang lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLDSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLD_EXTRA_EXCLUDE = [
+        "ELF/fill-trap\\.s$",
+        "ELF/lto/cache-warnings\\.ll$",
+        "ELF/oformat-binary-ttext\\.s$",
+        "ELF/oformat-binary\\.s$",
+        "ELF/partition-synthetic-sections\\.s$",
+        "ELF/reproduce\\.s$",
+    ]
+
+    def test_lld(self):
+        bitbake("lld -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "lld", extra_filter=self.LLD_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLD: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLD lit results back to host")
-- 
2.49.0


