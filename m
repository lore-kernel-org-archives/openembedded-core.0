Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5039ACA5FCC
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12469.1768931671678647976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QU8gOuKE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3qvdG2794329
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=; b=
	QU8gOuKETqnkbjV5Yyul6Hy45JdCUEHYFPVc9deggqpWmmyhkwC+eAWRYDPZwJ/q
	d3LdtgAvCNfAvk7U2JkJq0TxXuCK08FCXDGPIWruop072kIaD/GqQRqXNSka3vSY
	jMBTTYMxlt++ablqY9Zc6Nf91LvCS/33nRQ4M8/JoknWpiTdhqB+BqsedCGNxKxh
	Xcl/zleGMFAFvBNFNrhnpn2NkcvHI05DXFg4dVNJlicTKZhhgwB+owK46mErFcrs
	X5VQnKMsI9Qz+VDR/tlskC51fw4txVJzkNY5ssy3e7I54wRM0c9a59DtrwgqquL2
	sWUup4dp+jXYfePaOG5oFg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukf0r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5RFP9loTDlxqhjIBp22Oxle33aYs/SMqcHBI+BbzpBjW8vzbWHJFrxfbzWm2fLVXXb/n6XJUnRIybTWYX9FaEsO0qAgL5yA1tqN5SwNtxSw5f6zBw4rMexupgQApUeqBfGtYwgqGLdjmaA9xZvzpvDmzWV+byWJz5+G+M7kPJef9B2jHr321glbjPlEI6UjWV9y0PLmqMRV9eIuTWeQguMk1M3lBZsi6lcxNmcDVM1gCuH7mpvploxmYpnoN88p0OkVAuwDvmoHkHRKp6dJTi40xkKr/9rScogMmIxX3WtmNshY373wVbWtF+nWZRQNSnhKWcZMloZ2zYzDdL2dzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=;
 b=ZwdU1BJWv+RpeD1xmv4/Rg+JqbvoVX7v1YzVgoeHAIoyWPJ1Ieyo65ATRivVxGM8JwPWV2uTdxDOi42/JexKAZDXUziKarcOzWVilr107MD9jOmBxE/jRMuTnAchbXauIaL01XVEGdyXdSfYo6JLTzuc/AMPPKWoLTX9viionKVxmiXqhZDIuUWl2uniXkkS5tFkRc3w91U+YS8HOhfb1OTUqGeCiPElDJPNtKYEVYHYjxAOtzBSxH/DqTbTdZHFxJNGW/ptuQllWYe711IsBV7j7UDlKKlzczunWk+nseOtpYn1t5zRr4Cr1AzgXdu8J8uwtY7qxzh3eydYwF6lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 10/16] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Tue, 20 Jan 2026 09:52:40 -0800
Message-ID: <20260120175246.2052341-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc47f6b-51cd-41cf-b88c-08de584cf496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FQAkKNkpFZEyLv/hoPBe/wCLoCXGXbrusXGG2ggdpx4TN0QMWAZMMogsjzfO?=
 =?us-ascii?Q?GHfW597PKK4h1BZLgSzIx3iGx1I7ZBuBsFuJmVkjhOgqiLs6rTIysHMPLqo2?=
 =?us-ascii?Q?DKcdzj1EhtbdyF3WEZlfOjHTyamkzKfle+ikH7pYX8hG7f+Xqmm9GAiJXCwA?=
 =?us-ascii?Q?5AR+OR5TiRg2anTjkc18JIZw9h4RQK/+magBsZdT4zUrKy7C8SJ2KN95HVqm?=
 =?us-ascii?Q?SArhfMHAR/hsBH7L+E5sGszSOeMxEDGnV9xKOhMGh/PhY6cIKHn6HkT63kUE?=
 =?us-ascii?Q?J3VRlaWxFDLrLO8gWtCce/gWVEI+pnBO0rQJoll96m8KKjg6nkY9AP+xHsi3?=
 =?us-ascii?Q?fI+OPLjcncCjNbLoOs4DeigWuudr/ae9E8ktrijAtq8BeDcjIFnnqVKZtMTN?=
 =?us-ascii?Q?rLOrJ3ZZ4NznJknV+phM/r9Fv/ggbYSVUPIoJhikh2ykZlS9zMNzm8QUK7hg?=
 =?us-ascii?Q?lB27pga8BPGRTl76VlGjRhQk2WfpB6eW0W/h6jjGumX4fS51+d6Ltd5+5/pb?=
 =?us-ascii?Q?dEIULSXJ2Xyeos2GqsDDTLPErz/YK7vDdTPTyCh3Ef+ojzNJ1xW/YT5YmuiQ?=
 =?us-ascii?Q?O19wVZj7ze/VE5M5UqKt+hpZQ09D59I1abLCDoZFMWbmFrrPyBqePiQCpzYM?=
 =?us-ascii?Q?O6deMZEk8xwbmm8B9kWh7nxuobVQ1i/fEvlrJftco97qb0FwRhB0xsYRWXyU?=
 =?us-ascii?Q?mayeo5THLTNVH+KbH+A+i3S+vXjaBsab2aMjKWuFke119pN+3OSCaijbLhfp?=
 =?us-ascii?Q?l9ULEIql7zju9+HJUdI6BxlNEMuyhsYahOIE+3HWUUvvRNSjicPLSQ3JGVgW?=
 =?us-ascii?Q?zPahewrLASCqycfNkqx3cLb1NaQzwBk3wqf4Ezo7hIf+SFSfXY/YpK2GyruY?=
 =?us-ascii?Q?qcesymbCJGjc6zkRXkznwwhUNj947NakMxMMopuYXqwj8tIM5VkFHRT0MAR/?=
 =?us-ascii?Q?7CGTtxSV+Ef7Zvm8ZEMlAnLPplVL54I67YD60BKLL0RvDq1PSjdLRPwf+wvx?=
 =?us-ascii?Q?qR16JKWVdljw9Bw4+uBX6BZlQkHbrEuSDCrYoY1pkBrXB9R5SnvqoYJo1rRE?=
 =?us-ascii?Q?37xJGIzUbj7z9N8do8T95phrw40AT2L15bpZu2qwJ4AEpwOF/VPlSxmB63Qv?=
 =?us-ascii?Q?jFzu+5eVDIqU3cW/X/yCsBN25uP2LSm8yOy9HWBlosUpDWdFdOx/+X6RdCx4?=
 =?us-ascii?Q?fFHwJvvnrpEXdKXveCiJOBeVK4uESsavLMN9+bVLcgrINv86I5WtRoF8dnfi?=
 =?us-ascii?Q?E08HLYiAiYaofa3riu3xVrKwMsxV4XkniJw61JKZ3lp6qY6HZ6mBkLogDn11?=
 =?us-ascii?Q?PoYrhOOvwngiw3okYh9Oc5kgSMFOuHNS/Oy8syztUUdwQsEHN1jn44FqUs6m?=
 =?us-ascii?Q?HVs7SLBcXmC+1z7igwMM4Xq668rEUxGJZ32DgwrtFK58Fb1qdFj8Gyin1ftf?=
 =?us-ascii?Q?aenH/A0ioisCQn22bLTqcgguJkuesFcJIZIyCfd0kUjxPxyHgVl3AvzIL736?=
 =?us-ascii?Q?8jSsNgfaoo632cIyufZGFQlIw7CNzagPWTFaleLmff8Uo+dEnFCmu06Eq/Na?=
 =?us-ascii?Q?YHKSgixlTz9e1B6fGfKUr+rGPAAiF/RRVr8v7qFz7YXHvr1CVnFlHTGbikZg?=
 =?us-ascii?Q?FjVYNTV9k6l3ba89EWthC0Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M/rNcaNWTssssjaiftmeWO6Ts/o3FeMXLUQgiQcR0uwhszoel6ozocxucPdK?=
 =?us-ascii?Q?A5zsOwbgd3eQFMPsYhP6RXgLrwwW6LEcZkFxhI9ZXDJ+RAyF/x5I+x5SfuAP?=
 =?us-ascii?Q?1kJFdcAZAq1zGTPuO4FCA2g8vJUo3Fgk1k5B0C+8fe9MU6Yb8D2wuN4rla20?=
 =?us-ascii?Q?PT5vDN9Q/Rim8jLZPcJ7dhvvsGGSpJ9qkEPnn8Z2aEvdSdPYKih1XX/VcLeN?=
 =?us-ascii?Q?Xvn44bKRsU/MbVu+yktaOpQ7NRTjBDB2OKptOI7qwFJxHk4sPP0RkfJ9WIxB?=
 =?us-ascii?Q?68Gc/hjqzZel7ig/8JKzc2566qQm9ZD6K2iASA30TGrQcl+wHK+XzxmUbZJ+?=
 =?us-ascii?Q?W09mJfdlT7ckR426x9wKJBrvU6zs9qDe5DuQgbGoeP1fI0IIbtrrd3Qz6kao?=
 =?us-ascii?Q?Ubr1/U0F1whaZ51lfmVcSng0WFRdv7KluIJ4GPa8pPWdiFXwRty/Gr0pJk1c?=
 =?us-ascii?Q?l294Bg3wqq+S/m3wMpHBAaLDRVIMyDVwcBwVwV0ti0nzeP88HqxV91XizL2M?=
 =?us-ascii?Q?jdtfnNbfzxbsSCR7zVWg2bhbyBVP6nrrOHA201StyObGGajnm0XJC/VSODcs?=
 =?us-ascii?Q?6qiwZLeCSTUOAaP3K6PsPn43DycwznH0TktUcixVepSrpLWQxU97c4j9MBDl?=
 =?us-ascii?Q?0dxp7m/FquX5SzKza3199ug3XOXBqAKULYMIiKo1I5oAae456iHROTtwUByo?=
 =?us-ascii?Q?mwCNV4ppI4v+8Q4V7z4Q5L0kJ1MpmgCB5ArGgEpQZhJ49uCzSiTBNB+3bv03?=
 =?us-ascii?Q?7cN/VOUa6OHz7OyPd86/Vh5YJ7SPksmupheR1Go8Zhjk+98GGxh3Uw+862KZ?=
 =?us-ascii?Q?9IqAYGHUDq74jsu5VFuhkmj3Hg3HjdghaobIEcQAFG6RAtCwCBQHVCyHL5ty?=
 =?us-ascii?Q?eKQN3HehFsZMG/7QXXTBwf5Mvbo5ZRSz90akgj3xiLwfrlrcggjuQYeX/t+N?=
 =?us-ascii?Q?XGh4+wLIUAdS3GQdBIkyyOGRDRizCs75p94xuwoDtgY0aQZdQKVLTgf2eBZf?=
 =?us-ascii?Q?NSIHVjsjsuD2alZBBfaPGIT1i/RrL5mL9bAYmnmYX7gYFYKPUcKBZWQJYxIk?=
 =?us-ascii?Q?j8JfTyAjRLe0574EGWnPVE6Sf3Ydjdztx4Om3O+tCTMI7/CtZXhUIom2OQsc?=
 =?us-ascii?Q?u+iNy5GLmuLhIn84BAjZdcq3GwWl5puxcr6o6CQMkjkrnhfu+YiuarX30+I+?=
 =?us-ascii?Q?e+kGVNl58c9hVDgqrnzb0/sjJt3Cx/Nq+gYDyvzACm2XqRa84OwPAKZVJa0b?=
 =?us-ascii?Q?z9GTxgaNbqSyFZafcdL29A0ozs+ZhotIEFn87bwYy/GpSl7L21XytnU3jdsZ?=
 =?us-ascii?Q?LDrtXjLiTQR8w6L30J5+D2iEaBWKoS5/qa+Ds1JekozUwfqQNlh98batJGq8?=
 =?us-ascii?Q?B5vjuZ/ahx2y/U7sS4tuusOnhh6VxtLWUBl5iV0JuOY0BCwTWEYmitjAWBPe?=
 =?us-ascii?Q?Bv84cZ2Gt7RDIt80QjUC02bD4X/ALn7/BNg5K9GdW8uqrtuG8Ai6JUlPzA99?=
 =?us-ascii?Q?/hQn4hEaC3CeaVrd48v1n4j/SOcqY9hFsPpz+e06+jg68A5uVmyidAYHa8XD?=
 =?us-ascii?Q?iWbjeYV/67s1y6odXcpWlVHrtw7JEZIwJJXwkl8whzsIjrWPCgQ/RQyKPwoZ?=
 =?us-ascii?Q?y/04fCY7ANHuTlA7Ct9aM36yUhe8LQZGfwhkA2jmlc3slZ1WloXN0CThA/IR?=
 =?us-ascii?Q?Qvx19wWp7o+Aq7tCSLsw7g/vIArihTET4j2hnqTO6zKO3qphK0ux5AXWeVMe?=
 =?us-ascii?Q?ZNNz1pgmdzYoeIvotdg9YFQxmOpXODE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc47f6b-51cd-41cf-b88c-08de584cf496
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:27.8251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fenIjjS7CfVoiVANDiRefxj3Y8JqoH+Vrsmh8RBjhz/xV637UGNr0IJDyAOUdpxlXTtaELdqT78trROFZVo7U02fLcqRxDMglUT72KJ8pcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fc156 cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LHzJR2tZe8dORsY-z4w9yHcSqjJSl4Cy
X-Proofpoint-ORIG-GUID: wXtjLnExNOSVuvU_vT1nCJmILX07bN_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX3dFx3oooGlaU
 wAyKJRp7FW97gOlDPlnoAgYoXjNgTgv3S9ytuI2KwafWiVVGr4ibEBfpZYd+TU1viI2W/zszAHn
 F6r8Zn3jFEoghRmir4gg+tfSIebSWP37XmghzicBgpuDPNRe7XFrBGXFwtwTFJ6l9mPYijJtxR7
 8/XvqtAO6cE4jklOatUxEc4ldWA05TpXNnCU4EPtDoOccFAY01BLjhNsoEAydV68msD8xHciRAO
 1crwQuh5O7Dt832LdC/3e5lOPOPRdmibY7werNGioI0GHu5HAdEbN09L9WQ0UDu4YkrZn1TYsAx
 wKkrPBXYQ3WBPkERi0xik9HVGMldD/dMGO3XYh8eT3uyq9cE2yFroFXYoaj5kdVLrWLJzfh6oPG
 A8/32IrPvtJdg71VQmP1oORRjxapYq08yhWNMR5uQmlkR79eSuBEIkcIpN6fN7qRYCLv5hjUpFC
 dAR4rPqKRharT8GZSqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229757

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..e8374606a4 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,28 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                DISTRO_FEATURES:append = ' rust-kernel'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
-- 
2.49.0


