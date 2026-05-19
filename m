Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78912CD5BA6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16152.1779175555761900182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mvmiFt3x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F40G3123077
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=bY3UB+9XeBCahJV8rBzsDnnwNzNraCawre4S+lClj1c=; b=
	mvmiFt3xwYeygSHN9Ngsu1bHhhKiUNtObXdFC651hLwIBxlIkz2pDOI7B/0c9Jkw
	U6cvqKQhStIPdxZn94nXmPr0o0hYBjcPco9LclI0iy64NL6zkd/YQrRPzJDK8MH/
	k5Ao5UKs5eXwBeysYUESoro4W482aLX1YGv5TtMUlP+Bw+Iy+mLp5lWGitxzPy8l
	ydfm6uEbyGt8C1Il9VFk0RifsM6b/mCxQX4V6A0vUg7QbFc6Iw60QjZtW/M+7Hsh
	1iHxmXDmr9WGUJVo088tUZPjHkMzeJrRJcW+fHTF6VqbavrnhYis0CZiIaOLNkOo
	Pzgbj8nLVHEQvk2ro3QLnw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf37vq-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQSTqnLL0BUNylGN9y9BmtsdZnvKm87C3UKR+7CyaejmK8osl+vMtdLdstfay8BbQnFL6eAZKtbQF81tB+mAZTaWJToarB0eAnLrdme3jN69ETKaLEJ5+qPLLpn1dMyL9z+fT4rXJJnGLNkapW3Tjcsp+8G0zLAahNmJ5Zg82u1kSk0Aw1y+sg8KHjLbtCkatr5RI1RmTou4X+WLRUNdMEM7oOYR68N18C63aR1uZUAKlT1Eg68ozrRYLZswGeO7Gs6Hy60KkuoN0UwB3EbgnnYQFVf5KVO889kIPLwHNT5hGjLAx1DeRPHr9vOaxrr93h8qT5nIYJe1oYpJVR59ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY3UB+9XeBCahJV8rBzsDnnwNzNraCawre4S+lClj1c=;
 b=emCtWE+IqnpD5F22OMOOrAL0v2Gf6avKszVGZYDs6tzyYRO5IKEbpGh5qnt+KYyyNmAYQkTeUohWwxr4fxVnYB/+ULjSKQ5jTdBdXzi3Hty+RlLxXu5PAJqbzwUw8/besZZHnMWDGtadPjQgtyYHwJ9Rl7h3M7eLwmqidp2pPng7gcKIa8eJf41qv16aAICIUQ0sLaKcoVZdwByWgzQj4Z3LbVuhUT+CN3k2WNjldkTRZSACAPpguPUCQuOidtNjGz88F3bn9ZIsr5nZpMRKd3WUO4HrmjU4Et/X5I5YvlMbIAnkIgRLySMLfWP+bnL2Y8DjA5cst0xLR5Kx/R8O6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:25:51 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:50 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 04/12] gcc: Upgrade GCC to 16.1 release
Date: Tue, 19 May 2026 00:25:26 -0700
Message-ID: <20260519072534.24588-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7ec812-a2e1-424e-a0fc-08deb577daaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014|22082099003|11063799003|18002099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	VLKLVVrJPfo9vsJUbRDuLPo+hUhHxURC49SOxjPed4AaljieyYjyl76FnOnRbWHktiJArMe132ajiANsx2WQsB8S3smOdjjLRIs3BZmsiqLL5bt5scQuWzhEolnn6Co4FNVb47/LtTHYzrFDk2VLGREiZMm+X57ujE5pw9Vh96yJGyZK4iLQ5DVZ3YdjwSHQAX/Hn8dGoXUwBwg2BifIhJr2v1speSQFODXDkDEdVo0+onvcWW1D35qnhUlybm0eQ5cR11pkQPeV3uT9+2c+gTEVc6PwP+4CNcqrKbWeUKVc+/iun5iNisQ/lPVK1e3TfSqMFd2eKn4Z0g2pDJbAgsUUL5eLUpa0ghkosZa4R65EZXfi0ActHmpGCQFhNoMQ85vHDNlc15+W6IUXnRsCTHepcfKdwjwyn0E5fx7+WzenX5/RuGkAvp3V4EHWg4oVH36Hyg2X3JNvKwkjJ0BYldXOe1X9TYyRViiRN9R/2Zah1v/3+ZwGmC8RkZhx1n29xrZyNfj7voXLkcJdr6VjqRXSbnNx9bcJ+fn2uAx9o2+8cLHOm7+QzB3XO04Gj4U+PUpDbe1hCTiIpJahedOeU8lw7z5ZtmHkdPAKKV3LZHzPEcyo1aRjKEWQc3eICmjKSz7PEWYr4/6valvwEpwAc8JumsFa5xuftH91T/FnKZvr9NNJaE20BOJJvbPOmIXIGR8T+NEcsdYUEnq9gyoc5R9C5U04+kcF6pl7LkPBz2xt+OWmFjHhmjREd6yh0AOF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014)(22082099003)(11063799003)(18002099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l5dOtvWJVyOQ1LHFGJ4s9WVYFBnzhUs0D8adNT5DSMn0ArxfW3WhvNiMPqTx?=
 =?us-ascii?Q?8oQMijYsipswlAXK5MpdI7aQQCWu1eghS2VdElchelG7C/4IASisIvYXDzTm?=
 =?us-ascii?Q?3i6vQ4NDLPkI4DecXk6gtbvw3MDr5AO6Q3/0TrsKWV98H0FeTN/jodUEQ9AY?=
 =?us-ascii?Q?NqMw+Yu/HhYvbCqxTxyiQ2g6NISElxSKdvmjjsuYEB7nQreENBx0W4WQk5yn?=
 =?us-ascii?Q?n4fwVPsYEckZnR13kW4ZoEpIwC2g3UK8kdP0gMaDVbt52ioxEMjHOrB5q/IC?=
 =?us-ascii?Q?dhhM4P14+v8P8EcpycC/TbUbMG31KGgr5ZHWqHv1BXWokmtvOpK3eu2c4PSU?=
 =?us-ascii?Q?drP2s4q8WQd9SS1WdYoT0D35diZHMflKckYg27pBtSO1MimHiaQhO8dxDahU?=
 =?us-ascii?Q?KCM8U4ayk42wcZvR9ZMXZzN46mu4FPop+uWUVqMyJFryCD4Ea10+e5WmblUO?=
 =?us-ascii?Q?K2k9NV13yDXfx6Zc7c1+A22T8uaRhFMB5Ix4p8ix4WDFG0gyQ74hJIMI92+M?=
 =?us-ascii?Q?WLqJJ46WSPvdMXzeDjuqS7Rx2iDDHT4IrlwwEFiFd2MOBx9aG/W8ca5Fpn4J?=
 =?us-ascii?Q?GnxOvrC8j++jsvBHlTS4hQgozqw3V44o0jRVFUHx0k04RjNiZHYKdaYN0ix4?=
 =?us-ascii?Q?/PpGn0wnSdUNniGTmWxInGVISWE7Gd1HfSCkpeKc6xaK+1nuVnmuQ5E5RR0A?=
 =?us-ascii?Q?FoyJcN1PNqzP0rmS9k22vXHa6nvp3EEitb5u914BoUwxt9CTrsrc4o2XR6Sg?=
 =?us-ascii?Q?Sj/3jj2Y4J7HoMmQmAlH+Dm0fMx4nShwD+KXQEtIuBZEpf89OGSQh7IsPoC4?=
 =?us-ascii?Q?cAoFvYfcFot7GlOr2eBgXLhe5h1JDxjrznWuZYy/yKMYlUN0Ik/f/fx20Gmg?=
 =?us-ascii?Q?FjVZwX/dZgYpC+RmkfWdV8S107VMgCtmRtl5b98qM/lcOf7tWxWzUxA6dXEq?=
 =?us-ascii?Q?Mjey+qUcHssbvrKWJh42yStz/CwT9uL+3GwucCfcv/6QmeoAiD/8Lh7NItS1?=
 =?us-ascii?Q?wvQvrOgTyokQLWGuYDYZ9JDfRnuWDV2s3jX437pfODwYKGMQzZwJksUqpB8t?=
 =?us-ascii?Q?J1iDUU4G28igxe9YY61uFbngjBeJIDj+iufUjuBOMoHSKwV8VtsYh8yLuzNu?=
 =?us-ascii?Q?uQ9chHO6l1SNlxpLVAXZfNXK9OgPKlpbtoCPFDsxh55x3Gtk1dMuy28q9hNF?=
 =?us-ascii?Q?O73dt1BCD3AKdVzCH3IW6I3/rqFXvxR+MtAFU5edgh4TU4EJXDhqFEo/IJ86?=
 =?us-ascii?Q?qaT01eLNRYMZe3rj+ZOURKto8hNFNSiVkgopCA3VW7DYYDO55kO0f/eF204k?=
 =?us-ascii?Q?QPSofp82VOrbdDFwWB3FjJdSL773E2gZmMqQIZFSfZEIl33hT1Wzvh0AwcFq?=
 =?us-ascii?Q?CcsEm8Y/dXBMKv47BWYGrE0nL8sY/oEYkH5AAHUSXRuFX6eCgIHQhN/1SgFS?=
 =?us-ascii?Q?dfQrL+CBuhm3Kc4j2w2uQ7uUMKiq/GzLTRoGanrCcVin4sXJXsMsZJQPFkdB?=
 =?us-ascii?Q?J9MhVwXKDQiu1KI6IZtheVZkZwlCY31iK7hIIX10dI+/T01igYT26cLgcLge?=
 =?us-ascii?Q?25+HPp5IPs0DqGdTDEb+4skfmtjdE+H6E3n83IpBD7cLKLo4PWYuChE51u9+?=
 =?us-ascii?Q?2QK3BtDSXl8mHwww3KWiEGNFKjKxTdq7KPvdQ+lks/79DAAOGEMYIxVxSsNz?=
 =?us-ascii?Q?K9h3biTRh3L76Cb4EYcLUAEg+PBgOIWaemI68O4QBnjRWvckpIy+X2ax5Ws0?=
 =?us-ascii?Q?jNhhYSzU+d4Eoaqy6s+gX7zn5Ma7TcU=3D?=
X-Exchange-RoutingPolicyChecked: 
	F5qm2r3xt4VwBFGUOBzESiRuCS0ZTzuMF3ogoZRmJcFfjhYUVvbxwz38nm4fKbYGLnK6OWcR72HxqsL4kG8OTuOy4VQzPbE7+N+NcWlL+mJQWFrwDBCYkt9dJiY4FWckS5hI4rGRaWHvysQwwryczuZJi93btoRh+YvD/l3nAZjNJa3o02G32TszqDeflgKHhd0ujGrtbNXbrjgv021aNLHtB4t6ZvBvchrpnxW7xEuZNoyNwKTOOQmIBpxNooVfzxFgWjmcfam7OtUBHnZUzTNQlx7Odcmo7FaErkh9PT+nR1TAkM+mQCptVVA4Ie4L5KEo23j1HJSeTDEk0bfL3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7ec812-a2e1-424e-a0fc-08deb577daaa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:50.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUutjKi5g3xRiBEEoh/ki3qp8lYrXPlhwxeYK7pTCchTxjcit3GtYxMyWXRm/eA3AjM/D/3sRdJbVydMqrfurxjqQ/s/+nZolLq/so0Yzqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-ORIG-GUID: HldlHzCQ7C3yxVD_pdwsxhYsLbbcKwcH
X-Proofpoint-GUID: HldlHzCQ7C3yxVD_pdwsxhYsLbbcKwcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX3IvlnpVEapaZ
 2auy92FbLs3XzdwiJST4IMTs9aK3doBGeNROiJZsCSQFwryIA8qdXuIoEYk7tmjB3A8+DSL45Pg
 rW6CHIxTPbgX4nDYRmECF5bCT7Qk1OgVFZ6BlytreSIjq01h9L9LtxZ6V7Ola3JxrRYYD0HIcqj
 tJgg91X/ds0p5P/W2sGaaiTwLZyTAshHu6ONpMk4L2gdrFpKUTMFJlmYa5zAR1fEH9ExocuhqXd
 OvxMC9/WGRGMv8lnh3CM+Rf/27gddzhOlRC+QTGG5k9neteZf/kkuyLfGfYh/4n5L1vs08RP7CT
 LgXMzpWfiTwCst3lJldCQXSl1Jf86q8GvVAjmfp5uoJqduEb6OYWFHurb/9KaAJl4nx7r+8QYqo
 dEeBukRMXGgWVcQSi1wodpar1YUfEmh7uIsovIi7WeosGsl8OT3KzShIrE5nnxM3mQCKvdxKBlT
 bse9xh0pk8eHlUPKRiw==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c1080 cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=uCaEEmbJTeulPlxkI8cA:9 a=b05lPj1fihGE9SP1:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237278

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


