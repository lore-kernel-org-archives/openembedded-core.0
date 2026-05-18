Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7700ECD4F5E
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6064.1779102230423184409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y48Adapz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7ookm852309
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=bY3UB+9XeBCahJV8rBzsDnnwNzNraCawre4S+lClj1c=; b=
	Y48AdapzKr82dNI3tarqXAMROTIgCI+vTbJ71XY4zRmmCv64RziKOUMa/FRObrGQ
	ubP4ZueU/nLDFZeERkniGVycZrXH+wibVw++YFA22zFzfS/OeiW+YKew7V/sY0Gq
	Kzg66Kseu7r8UqxqnvtOz+ojRsFdWATUz7EUuNOfF20n6vOfX7/BFw1NtBl9MlyY
	f4MxmYzjYcOZ7cmLLqu02TnYjfSs8RE1LiH4ky6TJDIbaME8nafj1sC8aCOatSh+
	dyMWpP+PiP4Bf46YXJysFKek4PUzQW5RT+A34utRVj97b72AIdEFuuFsfrVwsSgo
	PrP+kJcT2gRiaRsZ911JvQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9pgk-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbdY/0NJyuTecdDjEwjVcb7ThnymYJZAJz1O/ThAmNNF6ihySgUBXMMSeKw3kBbac7kdJMwizdKFC+QbYou5sLAVAAmd75XN5/8iZq2KnqW0C6vZWjqhMoNr9gPxAiyASDWzl9jENlOiMWul2ve8igNghlqHVlyRdGL85Yl1eeZuZoIT97byMv3W1N0Ks4uihONpDQdjqekXq87sUZL/0m2QnSyBJo+Yoe/yb0qWQrTyVvhKbBd+jI5xHigKsRdew5zreCSZ0yz+cWSbwcsZzYEjfBld1zC5drKednA+vJPquVo2SatQP2qaafGOCgm+hzySo+F17kSzPQAw9ZkcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY3UB+9XeBCahJV8rBzsDnnwNzNraCawre4S+lClj1c=;
 b=M0J3BPiLRdUBMUWRQSyRTugclbziPnYh6x3yJlyY5BcInvkLsxgtNzRqaCvCWpEvxUJswzh0P46L+qzmimM3sLUniz4/3bSlEUnhW6YnmQaCWWpVWsDjj4NQ5lWxYZf/2vQSdEt+Sl4vJwSw9sEUMDYqs6AAAvY75SYVVL297OX97LR6XIbnOOIwOihGoHpTX+N9f57baSJlQSKC7hgXS2ht5E+EgnVqB76xs9IIE1Mu7MncRa8U0ZSeOSakg8w0H67Eh2iTvkqac6b64jHZN7X32kLIUkPJ1SouTAxfVI3RzV7kn/FwpqLCD+HSheI0ZgcJr9Zz6vd3nIdyq7nMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 11:03:47 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:47 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 04/12] gcc: Upgrade GCC to 16.1 release
Date: Mon, 18 May 2026 04:03:19 -0700
Message-ID: <20260518110327.2347543-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 839f24f2-5152-4750-2120-08deb4cd2265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|18002099003|56012099003|22082099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	Z6IbQ6uOYQI6EKaVcOy1gi48Bbmeq6+/nVdfUXLSS6bd7Ux7w6Y/dKevwZkOet2EKKCZxXqemRu7LdAeoI5N9xWKwqbDX75QHwuCimZSfN32EgT9jNeUPlfKXBPeiW/Ky6BRTCXQI8qqhNMfAEFo1OUjV926aTWrNMGxjaQCWmDZxpP2oxHV+0Tw3zDz7J1oGa3UujrBxSxBJaVdKlHywSL8BcihIWUx/PSFas+Z8afA+FJSwdlW3vI1reKaogoSCTMtdoL4fbv3eVJFymWZyA+WjodeOSk5EVv9zkgp3QlQbNUlNMdQQbPcguF65r5dWx4CNUPbNE4cBDHRd12MT+hSpvgXGxmoOQwL3Kxs075w9TwOizrJNbRHYJSFOvvHzUEXXDiJOREjAOSvtDbFtMCtoKoUbv+HG3PbJeV7ehZaDFRwj+OHMrtK7cK1cKusma0Zqk0hDxgBvtYwCXi+dUkfOhi+6rcgj4uO+TyC7adWR1RlAaxidNvwgi00RBn+bOnmWhzkx3mnSK5HkZjfIPQyx6fAB7kyChfLqTPFidU94N9qW/lSOteb4t0LWX8/bLZWVkklsa6GeeEvnbWkYbepMeiwgjUn6UoAZmdD7eguTW8YSnttfHkSHSInYty0Ct/fw4i1zuF2U0qsNHXdjWaaisvtY4nj/2+rZ4ucLSSHt43M8JZ0H59bRkiwBVPKzEEXBMzw/JJQvGSfiH08zs1yQnvXvsU0GI21oPyMxX703wdpa6Ef4IDCu0Z5VFo2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(18002099003)(56012099003)(22082099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hBi3WQdGhco0fjYMlhDEHulu07OCX5FwKbYqAtV7fa0LE6soNup2jvMj80T2?=
 =?us-ascii?Q?ahhx1w4m1iMTrd3kN3LGCF4Yuo4BZCF28H0MFn7RSoFr2UW8kguIyaipycLq?=
 =?us-ascii?Q?WzCSuFe4mOirwppQz1J9QmZhDY9AQQ3xY+fBeeiIL+mmcTiodllop3m+bPXq?=
 =?us-ascii?Q?QCVIKm+ixfCs82wwTLaDJBgJQqZ2ZtonS7hi3wh9OrVBnmVFHesh8/l203kv?=
 =?us-ascii?Q?DxEINoV5ZJeE7suEVgkwuScRwhQTVTmho9KBr9H1kA4ia6ba+13Fas+ya19f?=
 =?us-ascii?Q?KOG4kOl8BQIntMWxJ4IwWvNeR5F9pIbutnD8gDWiNFGF61CkQsyfruuXHZ7m?=
 =?us-ascii?Q?w/6mdQsp+z18DqgffRe72rkUa+mK4bHbTkgAMIb7g12/XhgRXmBJo5Qy3MaY?=
 =?us-ascii?Q?l06Azkv+e2jMhFFTZCHPbVWCq890p9UTDnvkg7r7OHkgfRQRkNvZa+vxUGep?=
 =?us-ascii?Q?OAlBKT7hrVQO2U3aT8NOlJ8O3I9EdkL8+DK8bu16obi1QqWNws8DeWCzNyZa?=
 =?us-ascii?Q?5WltZbgg2nKIyOAFNQkO3RglYCVFeeZWf4o4pMq68MYtDu6w1hHvwddaFCtg?=
 =?us-ascii?Q?WeHC6dJKeMeU4LaVZ0QIwFKUdZ7GIqn2OSZ4bOQ3nZN3MmaJd2zLifmNLPSC?=
 =?us-ascii?Q?jFM8TJIqd3yyukOo87Y7fgTv9y8aJByO+L0/6Tp5dRnRdV60TF8UUFpwuI7y?=
 =?us-ascii?Q?R9YwpthM1wJv+DFFhFHQmKDMFee92q/EV0qg9y/gULulWf9ee12ZyBE1FGVs?=
 =?us-ascii?Q?uKO8h3qC/cV/vCG4KDix/0sJ/wORTN2ieI16JH9v/EhYSise7h+pmejVOxdd?=
 =?us-ascii?Q?ivfGGj2ntGpTT8yRRHUmV/XqY1MH2uD9qseoorPuIsOq7Ivmmw05j5SQVMCt?=
 =?us-ascii?Q?bx8TRRvmbWEX4zDc0ON+h2Mxbbg/fMdj1PJ2IrM3nvVuAxD3KgGEYUnVm9JU?=
 =?us-ascii?Q?YSX5PHsOtA04yXclRzWSodKOma3eKa4OxzVjo1TGSQnQNS2KQ45uvEMDMMz6?=
 =?us-ascii?Q?3bP6Kz9EAVEAtFZTq7VzWunbWyYqr+eMSRKbJ3IfLJBTSjy4pk4xZut2hQ45?=
 =?us-ascii?Q?XbxRoIGrFpTcDMxiKUCQljDZBLtOLUyaYWbFH+rB61nBgKgTNwR3ahoIMEQe?=
 =?us-ascii?Q?CacPJpH0k8Uhiipw3cgQUrTsZSK7zXeIQD/i3IJlbsL/OMJvNXmkaN+UmD6+?=
 =?us-ascii?Q?LObVDiGGYjQQELl1toQzhvcz4ckb1BNrvAqf3joP+cIz/Fu6oGXfDZQKhAKf?=
 =?us-ascii?Q?zIzIlXrQqXkdjlsY9V6pZ2geJMqfH9Vm7u/bkMoCf+xy6DaowXiofgqOaJqf?=
 =?us-ascii?Q?wqFxb5Y6qGKglPabd2ZdxFOJT0UYuGZsTi6vexJ05YJVyWX/6vKisRKxnMBM?=
 =?us-ascii?Q?NJrEbau/Q7bDt1ll7A1j0X6GEcavXIDAn8VDu2R37mqtgysDDewmEpyqN8jr?=
 =?us-ascii?Q?kOWlGgjItRbRy5aFSPV89Xj2U7XUk/iyyh/Iv6SG6FN2dBdvrF2vxS3PBnuk?=
 =?us-ascii?Q?VFXBSqwBNVEwRpTGr3s40IpVlppSWC3Wr+KL/mNaq81XoWtt2NbGYwHn60QW?=
 =?us-ascii?Q?yOY3S7WMfbRepdnIq9ZpLyt6HlkEH3b45VADnXWyRUDskk9PBqELCArXX97x?=
 =?us-ascii?Q?3hdv+Nyq9Oco/RpRzu8EpqFMNWEWO1ie6qvp6TdueyRmZtw0zl0zdrEHwMmL?=
 =?us-ascii?Q?UC47By1WrS1lVu8k+JXpMIe1KudPSeCfSbK9yLh9EOLHHZYLvTHquHvN1pii?=
 =?us-ascii?Q?GYn2v/eLExzKjBcNs3GNdJqHKzt/EyM=3D?=
X-Exchange-RoutingPolicyChecked: 
	AirUmwIPXc177MFe7ZuOLIZgfU/B/wfUQ7nG10s6xrGv98NdxI9k/r0wsRb2G+XzIk6WuZzwSKpmhg/pWEgwEHxzpoKU61OnzVou6cOlB5xKhbZ35gNAPlC3El9EG0HFXi0Zg94bnebByPcGrSpdZZhR7p9Q03qPe8mxNdVjFcMVBY653HfWFThCk+CrnoGP7fJl9uoHARUtVFOYqDmGOwGXw53CXBnP9CRqH6rU6YIH14RiVszt5rwM0LMRQjHuyiW34GrrYzuVKBUBe+G9BAlEHxk5ehD3RMGTkBi2flVust7AnN+JukfKrrpYhnJnvWwS2nPYLV4LE6OWDNuz6A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839f24f2-5152-4750-2120-08deb4cd2265
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:47.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDmm/D6wNaaEVmY0My0/C5ZM57sDDTdPyhdR/ovTmAfl1Jhk5F2+r/1+DHMgvmudjFNCp1XrVZMtD4ifsWMVjZHHZz5IoqsIUNE6TMRPaLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: SBRbC7WoJEpGR_6F_DUrJR1OlBn0aGyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX+qwu4pxZHenA
 XpoWDJ8VvVMAkivUCaRbHb8NUVwUxkdIre57VdYXdXr/MTAqi6dnrbnjFbC69G8Nn/NmxMNW62s
 OnNSqQ7W1F+Bszx+vMrjW/f3A1GTV9GZz9G0ZhahUUahZ9yz0eJs9dJYtnfbFZhqzpYVG7jPeGa
 1vS0seIbnUVKodbY8x7JT2nWPuJQ0spmb/yQ8ltgRLM/ckb5kH485VmA0zQ1zDPw6Vva4ML7E9x
 j8t3HcSS/09H8ffpEZm136HlAJIVQuoq0XmBfLmZoKF2znc6QboyKcSqiU3mwoFltZtltioxPqi
 zAbqsB1Pqo+8qth5aIRVKeWN0UDDnIjzcZ9P6QDNny0s3Vesn15V3GVW4iWcS+ZtOYD5Z8kV2Oq
 BwGGMv6iMcZPjgHQuGcz0SVTZXtu7SfkavSsRa2+EiLDoLGg2kfpsxWOvjzFSbfxORRD4Zlzu9Y
 gQMN0TwmR5WVcqaJRGA==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0af215 cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=uCaEEmbJTeulPlxkI8cA:9 a=b05lPj1fihGE9SP1:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: eufmaq6Xn7ofpI3g0sdYSAQdVvsCIHZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237224

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Notable changes in GCC 16 include:
- Improved C23/C++23 support and initial C++26 features
- Enhanced diagnostics and static analyzer improvements
- Optimizer and code generation enhancements
- Target-specific updates for AArch64, RISC-V, x86, and others
- Runtime library updates (libstdc++, libatomic, libgomp, libsanitizer)
- Multiple bug fixes and performance improvements

* Rebased existing OE-Core patches for GCC 16.1 and dropped
patches merged upstream.

For detailed info: https://gcc.gnu.org/gcc-16/changes.html

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 17 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++---
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++++--------
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  0
 17 files changed, 66 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24c5a9d712..fdfdec28b5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-16.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d2dd5abc03..804b32c1dc 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "15.%"
+GCCVERSION ?= "16.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
 RUSTVERSION ?= "1.94.1%"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-16.1.inc
index a96f2b8411..3a96228631 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.2.0"
+PV = "16.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.2.0"
+BINV = "16.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -34,17 +34,17 @@ LIC_FILES_CHKSUM = "\
 #SRC_URI[sha256sum] = "41bf7be5dc029112a9df625266e7de030ffc36ff3638f270b180ae8c91fe6449"
 
 # from snapshot
-#RELEASE ?= "15-20250420"
-#RELEASE ?= "15.1.0-RC-20250418"
+#RELEASE ?= "16-20260502"
+#RELEASE ?= "16.1.0-RC-20260424"
 #BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
 #SOURCEDIR ?= "gcc-${RELEASE}"
-#SRC_URI[sha256sum] = "fe18624317c6c662977eea8b5a506ec6c132fc11c7a8d53e2f6d21b139b0af3c"
+#SRC_URI[sha256sum] = "e8edc2aaf0affce7020658b0be9a3fc820aa33dc610640d3fe1ba1aee360051b"
 
 # official release
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
+SRC_URI[sha256sum] = "50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -72,11 +72,6 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
-           file://0028-fix-gcc-libitm-false-postives-01.patch \
-           file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-devtools/gcc/gcc-source_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 621f8bc41f..07e9e23f3d 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -172,7 +172,7 @@ index fbc75a90ad5..38c239940bd 100644
 +  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
  
  #define MUSL_ABI_SPEC \
-   "%{mabi=lp64d:}" \
+   "%{mabi=ilp32d:}" \
 @@ -40,7 +40,7 @@ along with GCC; see the file COPYING3.  If not see
  
  #undef MUSL_DYNAMIC_LINKER
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index a087ba17d9..678457bbc9 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -89,12 +89,12 @@ index 007c91780f6..22eb17bc099 100644
 +	            {
 +		      memcpy (path + len, this_multi, this_multi_len + 1);
 +	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
-+	              ret = callback (path, callback_info);
++	              ret = callback (path);
 +	                if (ret)
 +		          break;
 +	            }
 +	        }
 +
  	      memcpy (path + len, multi_suffix, suffix_len + 1);
- 	      ret = callback (path, callback_info);
+ 	      ret = callback (path);
  	      if (ret)
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index 0f2a9d8c1f..5a8a79c0d2 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -29,14 +29,14 @@ index 0f1a7156084..255fe448e63 100644
  
  endif
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 9798e7c09e9..3b3027eb77d 100644
+index 887ae41..b3d5e6f 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -452,7 +452,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
- libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
--@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
- @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16 -mcx16
+@@ -470,7 +470,6 @@ libatomic_la_LDFLAGS = $(libatomic_version_info) $(libatomic_version_script) \
+ @PARTIAL_VXWORKS_FALSE@	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_2) $(am__append_3) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_4) $(am__append_5)
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=armv8-a+lse
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=i586
+ @ARCH_LOONGARCH_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -mlsx|-mscq
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index fcdd79a840..dc708942b4 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -92,10 +92,10 @@ index 6dd8fa3fce9..95672008219 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index c0376b04551..5d053dfe726 100644
+index 55775d0..df161a9 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
-@@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {
+@@ -3113,14 +3113,7 @@ proc check_mips_loongson_mmi_hw_available { } {
  	if { !([istarget mips*-*-*]) } {
  	    expr 0
  	} else {
@@ -107,11 +107,11 @@ index c0376b04551..5d053dfe726 100644
 -		return 0;
 -	      }
 -	    } "-mloongson-mmi"
-+	    expr 0
++            expr 0
  	}
      }]
  }
-@@ -2970,29 +2963,7 @@ proc check_mips_msa_hw_available { } {
+@@ -3134,29 +3127,7 @@ proc check_mips_msa_hw_available { } {
      if { !([istarget mips*-*-*]) } {
        expr 0
      } else {
@@ -138,38 +138,41 @@ index c0376b04551..5d053dfe726 100644
 -	}
 -	#endif
 -      } "-mmsa"
-+      expr 0
++    expr 0
      }
    }]
  }
-@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {
+@@ -10740,6 +10711,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
-+    global do-what-limit
++    global do-what-limit 
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10747,16 +10719,19 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
-+            set do-what-limit link
- 	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
+-	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
++	    set do-what-limit link
++            set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+ 	    }
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
-+		set do-what-limit run
++                set do-what-limit run
  	    }
  	    $runtest $testcases $target_flags ${default-extra-flags}
+-	    unset et_index
 +	    unset do-what-limit
++            unset et_index
  	}
      } else {
- 	set et_index 0
-@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {
+ 	$runtest $testcases $flags ${default-extra-flags}
+@@ -12539,6 +12514,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -177,51 +180,62 @@ index c0376b04551..5d053dfe726 100644
      global EFFECTIVE_TARGETS
  
      if [istarget powerpc*-*-*] {
-@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12570,14 +12546,16 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=970"]
  	    }
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif { [check_effective_target_x86] } {
  	lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_sse2_runtime] } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++         set do-what-limit link	
++        }
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_mpaired_single "-mpaired-single"] } {
+@@ -12596,7 +12574,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget alpha*-*-*] {
  	# Alpha's vectorization capabilities are extremely limited.
-@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {
+ 	# It's more effort than its worth disabling all of the tests
+@@ -12609,7 +12588,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget ia64-*-*] {
  	set dg-do-what-default run
-@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [is-effective-target arm_neon_ok] {
+@@ -12622,7 +12602,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget aarch64*-*-*] {
  	set dg-do-what-default run
-@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [istarget s390*-*-*] {
+@@ -12646,7 +12627,8 @@ proc check_vect_support_and_set_flags { } {
  	} else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget amdgcn-*-*] {
  	set dg-do-what-default run
+     } elseif [istarget riscv*-*-*] {
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtools/gcc/gcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_16.1.bb
-- 
2.49.0


