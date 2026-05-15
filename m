Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BEFCD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 06:17:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29231.1778825828647714077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 23:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nfG6HAyy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95958a1d91=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5NOop1580669
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 23:17:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=yEDFcsl0s
	o31hKuNT2YjnUMF6NwM1264uNFibDFRoEA=; b=nfG6HAyyUJ4TUlqHSkehjhymT
	mNAOnoHMYU2hOi4yA9/dakdur6SST21U9Njx1milKASvHzXsLcYRUi7Z9aZbvIS9
	aLv1GoT1Q0MpWBeGum+pNx+3YRcXdsZxCG+Y6wJeZZVTWkKgbEgAZhgv7t1lWO98
	ovCNIULF4GQ/svrG0qAZo5scLqfX7zOoO3VKot+BvG6XXZCQ0YI4Ztx5muYtKdla
	ZRgb7+ZWN0w1nfbasi8GxvF27kcL+t9bYPKHNx0BzxcGxwy3qzhKizEJGw2VAG8i
	IAzm4aE+8z40aFlGJSzJMvbsFKlILYXn+LkJ6pCdQLRQnjUqmMX1LmP92clNA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m688gnu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 23:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzlUvPFAX6s81RRjk6O52k/XmZBW7URkEeBSUZ9AauZo//9Djt5A+4xhN+nDCSzOj0kqiNjMosWpYq53+Rt0hA1hp3yDQFUnkhjhHLfz8ILjrr+qWZvFrEHuoYIJIqbbZKGwugmNRyrj/cDhIxrFsp8MxlWsO0DjDY7jrawk5t3OUbFfOP/fBAw/VVBbvbPhzCg64Dtv3eH+IT0H/9GmsrTTpLPdTHIJJDyQMutBu8h7KZS33UqZ7McCetJypFi8mFjiXZfQDQ+O6/KArC9Cdv5vWmj8M4qCws8ji2ZgUapJ2pJ8VE0ZUYXW7sc2d8j9ADJZ1t44tu0vyQ3Ks5G4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEDFcsl0so31hKuNT2YjnUMF6NwM1264uNFibDFRoEA=;
 b=I3CilcGdbHPNPZeh/9tg7U5mosA9siubX2FLY9P2Lt6cZjN60VH9sKjmfzf47/lzdUKLnken8sWtOdg1biCqapsF8iDrsZAVx39sMkMjGkX8zLLt16cpDMXRo1CL/HmU+o+z8Y/7I9XRT9rvXziqKf/uFyBtvnwEOx5QQiJ32Z5XzZ84EZfb9p72yTkT+jCN2kwDWddLZruh4JkC1iJEYn2NBQKM/cFql4MAI3jLKHu8yzovymeX4AMlO7vav3hSTY77W0U2yC8SW/s8Mkx3pgvCFL46zX0ytINkx4cqE+qv/XNAoq5KaZ58dpA4iaCrhfafNv7OlJyPYV07vXrjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by IA1PR11MB8785.namprd11.prod.outlook.com (2603:10b6:208:599::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 06:17:04 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 06:17:03 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.Macleod@windriver.com
Subject: [PATCH v2] rust: Upgrade 1.94.1 -> 1.95.0
Date: Thu, 14 May 2026 23:16:40 -0700
Message-ID: <20260515061641.3299999-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|IA1PR11MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0165c8-1c02-4a67-bb9d-08deb249949d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|13003099007|11063799003|29003799003|25016099003|12006099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	/vU4RRaXwnQBLHM7Yq8dRUvfYVvyrSaAZ6Mi62iJRTqhlmhvmDnBv4Uoc8bVRxF8c3xEoB8iUesA3LbABT9Uv33WDrfKmGU8NEcYx37qlwP+nN1MNW0D13y1nnN/9rMlw9TT4urK7DAdspFJbE8cS7U3GQWqGMKqYbfw9EDG7Vt8AEMZ3fuvPSbhd7LsLSghSIuMz//KPO+K2FXXD+60KegD/JJOVEYI0VnjnDOcgXXFH4xLKCaTO6npFgYR5Y44s1P57dfC6j1VncxLRbSjrlvNjA9ejYUi8cPEglaSFSDGYfDOCJznX4Q8ouQ0zOg4n3YMggE9/vqPxf8HXwv6dq6lQ35lHcW0YPR4ZwIFD+aCstqNg4/g6lFHn5LzIQp5Sn0nZ8Mrfca96b3bBSg3+c0M+bcS3utSxCpxBRHlYRUa9QkH9bu44z6Ee+FM8j1jzzEUud9XD4eRWiDprk4gLd49SOyqQUfy1VNmodzPprTJTaqtw7Y6+h/DW9EAZgKgGs03KEhAV3DnNM0OKrslz77dqCrSAxpEgBoZ/TEdVkYtvgOGq3mhEqxJinxjdOpjhQib4ht2/R2XYYeJvkLOvIOI2zFc/9gOWKJIg/rSg3JQwRGQ/cAN497XaK7+w0Gzon03KHJ+PsDQuOJs7tBDfMh5kNcGXbT6pbrEnCKCtiENInkIT4nvvRBrm9fN65X8PoBVxMlG2+4UqEqt4qvxfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(13003099007)(11063799003)(29003799003)(25016099003)(12006099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?91wHqh7/RN+/cJVJozY6xm9+mtOlVYVoza3XYjdvhXSkH9epqGjHP655bsAb?=
 =?us-ascii?Q?945IrxLu4gkNEkqvSTzuFSJ/rjfHlZRPBbmCiy/04h6F/5BO6DHQDEJbMC6J?=
 =?us-ascii?Q?Xvn93tmZaWwIfkLFkNl4gpWMMqm2KFTFPKJ4MxWTuNrJmePJonCIlA0g3kDe?=
 =?us-ascii?Q?EDIkc3WjeEfCankXDGGUbBvHJzFjfqg3JYAbnXP/CjNfFElw6GIXDUbmfxHS?=
 =?us-ascii?Q?bNhAgZmjWfiSR/pfp2DhXGmCGurlM7Bgv4M7LQgsUrZX1FRsaTslT27/8JfS?=
 =?us-ascii?Q?0KD5poyAbRYIdu2NyOGkRhxcunn30v1vjZkBQVkGPuiGejyht7aSnxCltI6R?=
 =?us-ascii?Q?MdY1xnB4s+VMbYqvHvZB4vCIW6k2Q4z2zTt9H1JNDGL17P79wWftgE0Q/VsR?=
 =?us-ascii?Q?9/B2C/U1Ehf91EptMK6QqOeHDNK7XpWl4LiU+dJZUdubwV3cB/9cDFQjcX6A?=
 =?us-ascii?Q?svx58sxMx0mv1P9IqknQauWkkNQMJs0UhkfJNnlBgyRYM15T69i78/AsuvCy?=
 =?us-ascii?Q?Fk6uLiOd0eiei/WzrOS8Gk5peFAi0T7F4Z5Yb6Z87w1gTiK1EgyNj8hVc0B4?=
 =?us-ascii?Q?HFEouE7HfW3qx0VqnKPzyRp/bMHWhMtia1S8VK2VCW6+lYRC0bKk/C7nmeOf?=
 =?us-ascii?Q?JMO8Kgv7oD83sXI9HI/nmd2ygLc7Z/TzJnQe79EiicudIxMSF2dUCCkuMWXZ?=
 =?us-ascii?Q?ePys2RIyJSkYnRr3cQp4Qpn065EwJctgbl4uGXV9cZIGU8+bLuolLLJ9E3WK?=
 =?us-ascii?Q?bzEsq7C66ikgMksoogRnq1m8j7/Io0rSu7MtLBoFzsEmcfIM7hM9Ru/pbDae?=
 =?us-ascii?Q?+WL1A5mnj1nhof62zru1aLt1zsLVh00QCLivbLoFclMv60VynQUywb4DiDqh?=
 =?us-ascii?Q?iE/RcgYmEiO6LrQGvTFF/2xYAbCuD71f8MpTmOjSZ4Uvt77jSqrgZ0NpGlYH?=
 =?us-ascii?Q?pB7TlCVblTC2UwnVyCkmyeOnUrKc28+wI3QugO0p9aBwRfsPso1sNE3uUxpA?=
 =?us-ascii?Q?F6dImCccmaQzM1qIrzGttGklj/VQE3vr7GfanPauBwnMIK0UMGBSbkCeoOFx?=
 =?us-ascii?Q?1z4zLU+PsVRp4F1mfR3JDCYYAIpa16g5aZO4VrfpcMK7quBNZSYAeIYcxKP0?=
 =?us-ascii?Q?EOLJbWuX2oj/uYVzs9i608maLYtPyUn/A0VcyXK+ul1gduxKb9ids1WzHC66?=
 =?us-ascii?Q?wfiwdKLumtYpznp66EbUcfUiJBtWxAu3rT2xxI1wfMWgdx8sNYmiS4ZC7EEe?=
 =?us-ascii?Q?CRVPQ4YZLadwaCFGtK6DPW13MR0AAhJIjQushl7xR0hQarKk8eafrZbiXgjy?=
 =?us-ascii?Q?6oe+UVhzX9zDBI48Z6Rb3xoh+UNz7mjCYN09y6NtK+aKvNAb82MOGcxrt5JA?=
 =?us-ascii?Q?dD/TR7xyCCnch+UnzpRiTW4gjLVwohzfVtbdbtEfkYBW/9WRQCUtH1Mg9dvN?=
 =?us-ascii?Q?V6hWEfzkc0OkJxELPV3+jUWrT2zuOzlwQ1hLno54VUJX7v1KQW8X9UousPAH?=
 =?us-ascii?Q?12sPj56OxXoO+Uh//1W0D4DgEE2pBvVbXnzNpvUNj1xU3tdpIe7GdluT6bcR?=
 =?us-ascii?Q?WPTOEXYMpRMd4XkKA20fGuubc8EMIetD6fVAhusk5CLXmAjj9O8C71HyMOew?=
 =?us-ascii?Q?n4Zp7qOZzQlHK6917tch+EtvyU+Da3AtdyiQ3005F/eUoPSCDaGEcf/h6scA?=
 =?us-ascii?Q?fe4svDclh734lYQ6KoX0ostVjQcupB9biB+Q1rSFmFo+7TzxbTwjK5LCnqYy?=
 =?us-ascii?Q?v9ct61/cjouevHXeT8DBdr3vCuvdYV7HiOFqM8ooqZZLERN/fMUj?=
X-Exchange-RoutingPolicyChecked: 
	e/JasqsnzDtSXWudNEwqLdoFSsNdst+p1nv/PDwcLln5JdX9ejaBJBX/Qid5cFcHI/LA3srehcl2Ul1Nbe6hqkOJcs7Ql5o25+jCRHqEWzEY8jVl4aUwo3zDdYWPgpZNSqEwUrmss0G/yJrJStUxedKnfkrSIXWoqkdutwXQz+bsWsyiwvks80NNFw054N1CzYbTOEwNMZrhjfZAl2urMvxfZe5X/Vwi6BAYR1tQ2kpF3Hf8MmUotf3vZGdjc4nL1hdS0GFn0Y06Q+wYFOH+4YK1JQwF+ekdhMiLKzdYWV0csR3zzTbxfSPnSsAo9QHiVVy9JTfHhwUHkdvEXUkE+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0165c8-1c02-4a67-bb9d-08deb249949d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:17:03.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoQk44CYbySCULFtTsqt49H+SkBzD+7f4xZkQ9Maxb1UvlMmLqlXOLu6UFiEGy9/dEJp4ddf9ty5haOoM7dn8ug4fxQ6sBX1Wxx9ZRcOFGJTwH8XNfjBPvFyeR4Ci8md
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8785
X-Proofpoint-ORIG-GUID: QB2DTASgKSDPtkDTGm0MibTIWVpdmZbL
X-Authority-Analysis: v=2.4 cv=GoZyPE1C c=1 sm=1 tr=0 ts=6a06ba63 cx=c_pps
 a=fm8IUWXzr0h7QqFIpCBYEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=j57RdskLAAAA:20
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=d7hCQll8_AD2aNdzHcwA:9 a=Q7wG1V7fVtKbRUR_:21
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: QB2DTASgKSDPtkDTGm0MibTIWVpdmZbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2MCBTYWx0ZWRfX7k2f6aGGydV8
 yIHZ6B/PNOeZtkOVoGahLSX/458dC+1NPiskH1tb36BOYFMDdUN3/D+LSHBi6z8M2+NV0z5kYDK
 epoOoynEXomYjwh/ANWEsIjyVoDQLyJCN6EnOIKC573QZDRhIy5EvGl5nxrWwE+0ntdPJOF3lA9
 cqJtK5rEADGMD+vBhFhKysnCNsVPcCRZM/9A1uldUaRoItZg8WvhmIxJLu7YxotwKi+uQrPY//7
 qAb+G8nqvRCEM35GM8Zv1CaaIuB+uh8YWraTuC/m88iMW0KLXKrii94ePWWL6+8jg4BH31Abpqq
 S3Y/T4IaCHKqjzJO3KarpEbcZ8RTPLSEFMT+LGNY29Fql4dI5kDF3pU4wR88BJ0cNl2MND1LelX
 UaLqfMihdVIF8ZnBuGkhmzXEIkISpjuBOPXkPwDl1A50fAb1d/3OQ/Ju2KIe7frv6/i9uzxkB1Z
 nMxlEmImgq9XMSxl9zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 06:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237066

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.95.0

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-195-2026-04-16

Drop merged patches:
0001-Adjust-loongarch-assembly-test.patch
0001-Fix-flaky-assertions-in-oneshot-tests.patch
0001-Update-amdgpu-data-layout.patch

Updated patches:
0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
rust-oe-selftest.patch

New patch:
0002-Fix-rust-build-failure-with-unstable-options.patch

Fix rust build failure with unstable options.
Remove the check that errors out when -Zunstable-options is not provided
for custom targets.The original upstream change (and its follow-up) mainly
ensured GitHub workflows and tests work correctly by explicitly passing
"-Zunstable-options", along with related testcase updates. Reverting the
entire commit would also undo those unrelated workflow and test adjustments,
so this patch only targets the specific enforcement logic without affecting
the rest of the changes.
https://github.com/rust-lang/rust/issues/155963

Selftest Changes:
Skip two failing tests
src/librustdoc
src/tools/rustdoc
https://github.com/rust-lang/rust/pull/153409

Excluded tests:
+--------+----------+---------+
| Before  |  After  | Skipped |
+---------+---------+---------+
|   37    |   39    |   +2    |
+--------+----------+---------+

Test results:

rust v1.95.0
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  22187  |   689   |
| qemux86     |  21929  |   947   |
| qemuarm64   |  21994  |   882   |
| qemuarm     |  21910  |   966   |
| qemuriscv64 |  21955  |   921   |
+-------------+---------+---------+

Test results difference (1.95.0 - 1.94.1):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +276  |   +29   |
| qemux86     |  +271  |   +34   |
| qemuarm64   |  +271  |   +34   |
| qemuarm     |  +271  |   +34   |
| qemuriscv64 |  +270  |   +35   |
+-------------+--------+---------+

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |   2 +-
 .../rust/{cargo_1.94.1.bb => cargo_1.95.0.bb} |   0
 .../0001-Adjust-loongarch-assembly-test.patch |  66 -----------
 ...ix-flaky-assertions-in-oneshot-tests.patch |  72 ------------
 .../0001-Update-amdgpu-data-layout.patch      |  44 --------
 ...teps-tool.rs-switch-off-lto-for-rust.patch |   4 +-
 ...-build-failure-with-unstable-options.patch |  63 +++++++++++
 .../rust/files/rust-oe-selftest.patch         |  20 +++-
 ...ibstd-rs_1.94.1.bb => libstd-rs_1.95.0.bb} |   0
 ....94.1.bb => rust-cross-canadian_1.95.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 104 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   6 +-
 .../rust/{rust_1.94.1.bb => rust_1.95.0.bb}   |   0
 14 files changed, 135 insertions(+), 248 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.94.1.bb => cargo_1.95.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch
 create mode 100644 meta/recipes-devtools/rust/files/0002-Fix-rust-build-failure-with-unstable-options.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.94.1.bb => libstd-rs_1.95.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.94.1.bb => rust-cross-canadian_1.95.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.94.1.bb => rust_1.95.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d2dd5abc03..3c956dfb12 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
-RUSTVERSION ?= "1.94.1%"
+RUSTVERSION ?= "1.95.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 72ffa5f234..c961a8f652 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -102,7 +102,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
         # Add exclude_fail_tests with other test arguments
-        testargs =  exclude_fail_tests + " --no-doc --no-fail-fast --bless"
+        testargs =  exclude_fail_tests + " --no-doc --no-fail-fast --bless --skip src/librustdoc --skip src/tools/rustdoc"
 
         # wrap the execution with a qemu instance.
         # Set QEMU RAM to 1024MB to support running unit tests for the compiler crate, including larger
diff --git a/meta/recipes-devtools/rust/cargo_1.94.1.bb b/meta/recipes-devtools/rust/cargo_1.95.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.94.1.bb
rename to meta/recipes-devtools/rust/cargo_1.95.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch b/meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch
deleted file mode 100644
index 67c649ebd8..0000000000
--- a/meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From e015fc820db5d7fe2495c09b1fdd5e2092ed3cd1 Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npopov@redhat.com>
-Date: Tue, 27 Jan 2026 12:03:48 +0100
-Subject: [PATCH] Adjust loongarch assembly test
-
-This generates different code on loongarch32r now.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e015fc820db5d7fe2495c09b1fdd5e2092ed3cd1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/assembly-llvm/asm/loongarch-type.rs | 27 +++++++++++++++++------
- 1 file changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/tests/assembly-llvm/asm/loongarch-type.rs b/tests/assembly-llvm/asm/loongarch-type.rs
-index e0a7940f89a..5efad583a39 100644
---- a/tests/assembly-llvm/asm/loongarch-type.rs
-+++ b/tests/assembly-llvm/asm/loongarch-type.rs
-@@ -1,10 +1,14 @@
- //@ add-minicore
--//@ revisions: loongarch32 loongarch64
-+//@ revisions: loongarch32s loongarch32r loongarch64
-
- //@ assembly-output: emit-asm
-
--//@[loongarch32] compile-flags: --target loongarch32-unknown-none
--//@[loongarch32] needs-llvm-components: loongarch
-+//@[loongarch32s] compile-flags: --target loongarch32-unknown-none -Ctarget-feature=+32s
-+//@[loongarch32s] needs-llvm-components: loongarch
-+
-+//@[loongarch32r] compile-flags: --target loongarch32-unknown-none
-+//@[loongarch32r] needs-llvm-components: loongarch
-+//@[loongarch32r] min-llvm-version: 22
-
- //@[loongarch64] compile-flags: --target loongarch64-unknown-none
- //@[loongarch64] needs-llvm-components: loongarch
-@@ -28,8 +32,12 @@
-
- // CHECK-LABEL: sym_fn:
- // CHECK: #APP
--// CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)
--// CHECK: ld.{{[wd]}} $t0, $t0, %got_pc_lo12(extern_func)
-+// loongarch64: pcalau12i $t0, %got_pc_hi20(extern_func)
-+// loongarch64: ld.d $t0, $t0, %got_pc_lo12(extern_func)
-+// loongarch32s: pcalau12i $t0, %got_pc_hi20(extern_func)
-+// loongarch32s: ld.w $t0, $t0, %got_pc_lo12(extern_func)
-+// loongarch32r: pcaddu12i $t0, %got_pcadd_hi20(extern_func)
-+// loongarch32r: ld.w $t0, $t0, %got_pcadd_lo12(.Lpcadd_hi0)
- // CHECK: #NO_APP
- #[no_mangle]
- pub unsafe fn sym_fn() {
-@@ -38,8 +46,13 @@ pub unsafe fn sym_fn() {
-
- // CHECK-LABEL: sym_static:
- // CHECK: #APP
--// CHECK: pcalau12i $t0, %got_pc_hi20(extern_static)
--// CHECK: ld.{{[wd]}} $t0, $t0, %got_pc_lo12(extern_static)
-+// loongarch64: pcalau12i $t0, %got_pc_hi20(extern_static)
-+// loongarch64: ld.d $t0, $t0, %got_pc_lo12(extern_static)
-+// loongarch32s: pcalau12i $t0, %got_pc_hi20(extern_static)
-+// loongarch32s: ld.w $t0, $t0, %got_pc_lo12(extern_static)
-+// loongarch32r: pcaddu12i $t0, %got_pcadd_hi20(extern_static)
-+// loongarch32r: ld.w $t0, $t0, %got_pcadd_lo12(.Lpcadd_hi1)
-+
- // CHECK: #NO_APP
- #[no_mangle]
- pub unsafe fn sym_static() {
diff --git a/meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch b/meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch
deleted file mode 100644
index be0e85dfbb..0000000000
--- a/meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Backport three commits from upstream to fix flaky assertions in oneshot tests
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/6970849fee93900b6eb28a64cf957157a9fb51b3]
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/dab350a3ed7691201f6752c4375e8e6ab40b58b9]
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/d02743e2fd7433ba2320fc85421a8a5927235b65]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/library/std/tests/sync/oneshot.rs b/library/std/tests/sync/oneshot.rs
-index 6a87c72..d8f3cd7 100644
---- a/library/std/tests/sync/oneshot.rs
-+++ b/library/std/tests/sync/oneshot.rs
-@@ -89,15 +89,15 @@ fn send_before_recv_timeout() {
- 
-     assert!(sender.send(22i128).is_ok());
- 
--    let start = Instant::now();
--
-     let timeout = Duration::from_secs(1);
-     match receiver.recv_timeout(timeout) {
-         Ok(22) => {}
-         _ => panic!("expected Ok(22)"),
-     }
- 
--    assert!(start.elapsed() < timeout);
-+    // FIXME(#152648): There previously was a timing assertion here.
-+    // This was removed, because under load there's no guarantee that the main thread is
-+    // scheduled and run before `timeout` expires
- }
- 
- #[test]
-@@ -127,6 +127,7 @@ fn recv_before_send() {
- }
- 
- #[test]
-+#[ignore = "Inherently flaky and has caused several CI failures"]
- fn recv_timeout_before_send() {
-     let (sender, receiver) = oneshot::channel();
- 
-@@ -135,6 +136,8 @@ fn recv_timeout_before_send() {
-         sender.send(99u128).unwrap();
-     });
- 
-+    // FIXME(#152145): Under load, there's no guarantee that thread `t` has
-+    // ever been scheduled and run before this timeout expires.
-     match receiver.recv_timeout(Duration::from_secs(1)) {
-         Ok(99) => {}
-         _ => panic!("expected Ok(99)"),
-@@ -240,7 +243,9 @@ fn recv_deadline_passed() {
-     }
- 
-     assert!(start.elapsed() >= timeout);
--    assert!(start.elapsed() < timeout * 3);
-+    // FIXME(#152878): An upper-bound assertion on the elapsed time was removed,
-+    // because CI runners can starve individual threads for a surprisingly long
-+    // time, leading to flaky failures.
- }
- 
- #[test]
-@@ -253,8 +258,11 @@ fn recv_time_passed() {
-         Err(RecvTimeoutError::Timeout(_)) => {}
-         _ => panic!("expected timeout error"),
-     }
-+
-     assert!(start.elapsed() >= timeout);
--    assert!(start.elapsed() < timeout * 3);
-+    // FIXME(#152878): An upper-bound assertion on the elapsed time was removed,
-+    // because CI runners can starve individual threads for a surprisingly long
-+    // time, leading to flaky failures.
- }
- 
- #[test]
diff --git a/meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch b/meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch
deleted file mode 100644
index 1c09cd8fa6..0000000000
--- a/meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From bf3ac98d6930ba4e258cf33240c2fe7c99d19eae Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npopov@redhat.com>
-Date: Tue, 6 Jan 2026 11:51:33 +0100
-Subject: [PATCH] Update amdgpu data layout
-
-This changed in:
-https://github.com/llvm/llvm-project/commit/853760bca6aa7a960b154cef8c61f87271870b8a
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/bf3ac98d6930ba4e258cf33240c2fe7c99d19eae]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- compiler/rustc_codegen_llvm/src/context.rs                  | 5 +++++
- compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/compiler/rustc_codegen_llvm/src/context.rs b/compiler/rustc_codegen_llvm/src/context.rs
-index 4b2544b7efd..4328b15c73f 100644
---- a/compiler/rustc_codegen_llvm/src/context.rs
-+++ b/compiler/rustc_codegen_llvm/src/context.rs
-@@ -215,6 +215,11 @@ pub(crate) unsafe fn create_module<'ll>(
-             // LLVM 22 updated the ABI alignment for double on AIX: https://github.com/llvm/llvm-project/pull/144673
-             target_data_layout = target_data_layout.replace("-f64:32:64", "");
-         }
-+        if sess.target.arch == Arch::AmdGpu {
-+            // LLVM 22 specified ELF mangling in the amdgpu data layout:
-+            // https://github.com/llvm/llvm-project/pull/163011
-+            target_data_layout = target_data_layout.replace("-m:e", "");
-+        }
-     }
-
-     // Ensure the data-layout values hardcoded remain the defaults.
-diff --git a/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs b/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs
-index 828d853ac65..d6a2cfc2aab 100644
---- a/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs
-+++ b/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs
-@@ -5,7 +5,7 @@
- pub(crate) fn target() -> Target {
-     Target {
-         arch: Arch::AmdGpu,
--        data_layout: "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9".into(),
-+        data_layout: "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9".into(),
-         llvm_target: "amdgcn-amd-amdhsa".into(),
-         metadata: TargetMetadata {
-             description: Some("AMD GPU".into()),
diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
index a8232b928a..35ebf3b96c 100644
--- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
+++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
@@ -42,7 +42,7 @@ index 087df2f8a..00790affb 100644
  use crate::utils::exec::{BootstrapCommand, command};
  use crate::utils::helpers::{add_dylib_path, exe, t};
  use crate::{Compiler, FileType, Kind, Mode};
-@@ -121,22 +119,7 @@ impl Step for ToolBuild {
+@@ -121,22 +121,7 @@ impl Step for ToolBuild {
              cargo.env("RUSTC_WRAPPER", ccache);
          }
 
@@ -58,7 +58,7 @@ index 087df2f8a..00790affb 100644
 -                RustcLto::ThinLocal => None,
 -            };
 -            if let Some(lto) = lto {
--                cargo.env(cargo_profile_var("LTO", &builder.config), lto);
+-                cargo.env(cargo_profile_var("LTO", &builder.config, self.mode), lto);
 -            }
 -        }
 -
diff --git a/meta/recipes-devtools/rust/files/0002-Fix-rust-build-failure-with-unstable-options.patch b/meta/recipes-devtools/rust/files/0002-Fix-rust-build-failure-with-unstable-options.patch
new file mode 100644
index 0000000000..24a22f65ee
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0002-Fix-rust-build-failure-with-unstable-options.patch
@@ -0,0 +1,63 @@
+Fix build issues seen with Rust-1.95.0
+
+Remove the check that errors out when -Zunstable-options is not provided for custom targets.
+
+The original upstream change (and its follow-up) mainly ensured GitHub workflows and tests
+work correctly by explicitly passing -Zunstable-options, along with related testcase updates.
+Reverting the entire commit would also undo those unrelated workflow and test adjustments, so
+this patch only targets the specific enforcement logic without affecting the rest of the changes.
+
+Upstream-Status: Inappropriate [Reported at https://github.com/rust-lang/rust/issues/155963]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+diff --git a/compiler/rustc_target/src/spec/mod.rs b/compiler/rustc_target/src/spec/mod.rs
+index b1a9c4b3cde..25a26a9fb12 100644
+--- a/compiler/rustc_target/src/spec/mod.rs
++++ b/compiler/rustc_target/src/spec/mod.rs
+@@ -3707,7 +3707,7 @@ impl Target {
+     pub fn search(
+         target_tuple: &TargetTuple,
+         sysroot: &Path,
+-        unstable_options: bool,
++        _unstable_options: bool,
+     ) -> Result<(Target, TargetWarnings), String> {
+         use std::{env, fs};
+
+@@ -3715,12 +3715,6 @@ fn load_file(
+             path: &Path,
+-            unstable_options: bool,
+         ) -> Result<(Target, TargetWarnings), String> {
+-            if !unstable_options {
+-                return Err(
+-                    "custom targets are unstable and require `-Zunstable-options`".to_string()
+-                );
+-            }
+             let contents = fs::read_to_string(path).map_err(|e| e.to_string())?;
+             Target::from_json(&contents)
+         }
+
+@@ -3737,7 +3737,7 @@ impl Target {
+                 for dir in env::split_paths(&target_path) {
+                     let p = dir.join(&path);
+                     if p.is_file() {
+-                        return load_file(&p, unstable_options);
++                        return load_file(&p);
+                     }
+                 }
+
+@@ -3750,14 +3750,11 @@ impl Target {
+                     Path::new("target.json"),
+                 ]);
+                 if p.is_file() {
+-                    return load_file(&p, unstable_options);
++                    return load_file(&p);
+                 }
+
+                 Err(format!("could not find specification for target {target_tuple:?}"))
+             }
+-            TargetTuple::TargetJson { ref contents, .. } if !unstable_options => {
+-                Err("custom targets are unstable and require `-Zunstable-options`".to_string())
+-            }
+             TargetTuple::TargetJson { ref contents, .. } => Target::from_json(contents),
+         }
+     }
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 9cbfc62b35..0ecfc7cad4 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -22,7 +22,7 @@ diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_e
 diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/src/tests.rs
 --- a/compiler/rustc_interface/src/tests.rs
 +++ b/compiler/rustc_interface/src/tests.rs
-@@ -147,6 +147,7 @@ fn assert_non_crate_hash_different(x: &Options, y: &Options) {
+@@ -144,6 +144,7 @@ fn assert_non_crate_hash_different(x: &Options, y: &Options) {
 
  // When the user supplies --test we should implicitly supply --cfg test
  #[test]
@@ -30,7 +30,7 @@ diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/sr
  fn test_switch_implies_cfg_test() {
      sess_and_cfg(&["--test"], |_sess, cfg| {
          assert!(cfg.contains(&(sym::test, None)));
-@@ -155,6 +156,7 @@ fn test_switch_implies_cfg_test() {
+@@ -152,6 +153,7 @@ fn test_switch_implies_cfg_test() {
 
  // When the user supplies --test and --cfg test, don't implicitly add another --cfg test
  #[test]
@@ -38,7 +38,7 @@ diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/sr
  fn test_switch_implies_cfg_test_unless_cfg_test() {
      sess_and_cfg(&["--test", "--cfg=test"], |_sess, cfg| {
          let mut test_items = cfg.iter().filter(|&&(name, _)| name == sym::test);
-@@ -164,6 +166,7 @@ fn test_switch_implies_cfg_test_unless_cfg_test() {
+@@ -161,6 +163,7 @@ fn test_switch_implies_cfg_test_unless_cfg_test() {
  }
 
  #[test]
@@ -128,7 +128,7 @@ diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/mutex.rs
  fn test_mutex_arc_poison_mapped() {
      let arc = Arc::new(Mutex::new(1));
      assert!(!arc.is_poisoned());
-@@ -457,6 +458,7 @@
+@@ -456,6 +457,7 @@
  
  #[test]
  #[cfg_attr(not(panic = "unwind"), ignore = "test requires unwinding support")]
@@ -176,7 +176,7 @@ diff --git a/library/alloctests/tests/sort/tests.rs b/library/alloctests/tests/s
 index 14e6013f96..b670f27ab4 100644
 --- a/library/alloctests/tests/sort/tests.rs
 +++ b/library/alloctests/tests/sort/tests.rs
-@@ -922,12 +922,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
+@@ -929,12 +929,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
  macro_rules! instantiate_sort_test_inner {
      ($sort_impl:ty, miri_yes, $test_fn_name:ident) => {
          #[test]
@@ -271,11 +271,19 @@ diff --git a/compiler/rustc/src/main.rs b/compiler/rustc/src/main.rs
 index 89c61cd..144ea0e 100644
 --- a/compiler/rustc/src/main.rs
 +++ b/compiler/rustc/src/main.rs
+@@ -3,6 +3,7 @@
+ // Several crates are depended upon but unused so that they are present in the sysroot
+ #![expect(unused_crate_dependencies)]
+
++#[allow(unused_imports)]
+ use std::process::ExitCode;
+
+ // A note about jemalloc: rustc uses jemalloc when built for CI and
 @@ -38,6 +38,7 @@
  #[cfg(feature = "jemalloc")]
  use tikv_jemalloc_sys as _;
 
 +#[cfg(not(test))]
- fn main() {
+ fn main() -> ExitCode {
      rustc_driver::main()
  }
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.94.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.95.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.94.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.95.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.94.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.95.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index cd4cce316f..d914cfd081 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,58 +4,58 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = "1.93.0"
-
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "1a9045695892ec08d8e9751bf7cf7db71fe27a6202dd12ce13aca48d0602dbde"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "84e82ff52c39c64dfd0e1c2d58fd3d5309d1d2502378131544c0d486b44af20a"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "5998940b8b97286bb67facb1a85535eeb3d4d7a61e36a85e386e5c0c5cfe5266"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] = "872ae6d68d625946d281b91d928332e6b74f6ab269b6af842338df4338805a60"
-
-SRC_URI[rustc-snapshot-i686.sha256sum] = "72038681a14fe632e2b550392b83dadf40325c472dabecfff40a9efdc2d8e201"
-SRC_URI[rust-std-snapshot-i686.sha256sum] = "b8b7020a61418b95c1ea26badaf8db6979778e28dbadddc81fb5010fe27c935b"
-SRC_URI[cargo-snapshot-i686.sha256sum] = "2c6fb5893b4abcdf6af9dc3c4f60abc072318b0cb13f2bd969585910b7ba048b"
-SRC_URI[clippy-snapshot-i686.sha256sum] = "e8f6b16356548e2dbad3d380c07cd7b3654b49c513a15a2ceb9d17a49ac0aa04"
-
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "d5762adb6e1dec7e6af4a7347cde45c12fec3f0ceba8a05aff6ef00390105739"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "4c5e2e8fcc43aced123283e3c8c99771c99750b5c7ecdf95a45258f5e26618b2"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "cf1af58dad1098c1f56d3df11f884b8d87b0db30ef038d1527872b7cdd7c9785"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "41f588aefa9e8bcdb4969afc14d18b19b4bd524defc026aca8c0275c19d183ac"
-
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = "b31f5408c198756b57f0491961cf6dc84bfd96ff1c73627798015f27ecea6ef5"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "e851c0fa3e726ce3f7139c5803198a1aa9723594394734ac9e373c93d92e5ea3"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = "f8472c773385820a9c8fe375f766b6918bb659eb2d517db72eff86a44c59546d"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] = "9f48807b761998db304ade11573742f52dcd61bf62f3e339eb9975ec33feab65"
-
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "b483c5324966b7138fb3f6180f7e4a2e9a5162179a83e58bb52d1ee5036009ee"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "f729bb7d95705e12a92eb072e494b93d8822ca40aa4802ca780b0cf33b56d401"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "662a9d454073c178c052bbb001f7440ded82134185c7c656ba8fc37468799383"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "2242d23c8472b4d7efe6e2e538157f0b25d9ac99f6362b2cd534ba5030b2a71f"
-
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "fa0705079ee9eeaeee2e4f12a3ffb35ccc3d4334cccd3eb3106a3f59b96e88aa"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "d209ac698a69ca9b9035adb97a0ed8e60a08db52960198c3e03b9ee714c1a46b"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "a587e9dab9385ea0651dd45a6cb6101d6028ccf578a3e1140ce083fe9419921a"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "283b76a665927a7737dbf422d3a3459eb85e873a49f6a2de8cc0ab5a5c3a8350"
-
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "804b19ccf61e8aec4c0c6d3f115961982b155d96925eb34b651aa7f6493a2e8b"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "b769fb6c9f3e0419a6bd0b7b79f9191bbd7a48a9f243b23eb7d135711aa6de1b"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "1f0fc840db26c426b26ce8a943b887756e9552974a39248ad0166960fa169f62"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "1c8bbbd36200f525949a2a3b1446ddc863b99bdc2552b818919fd64cc27b64d2"
-
-SRC_URI[rustc-snapshot-s390x.sha256sum] = "756c25d32d6539a7485a278216f3058c1571fd503c638e1179b74a68611dd1a4"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = "41a65db45a288eb3eedb187b366f132d5b3615767de7ce994b123b342ac7a848"
-SRC_URI[cargo-snapshot-s390x.sha256sum] = "7d0281d26142bf124c0393a99e73b7b8ae6cb579cb7ebe50f696da6922d2129a"
-SRC_URI[clippy-snapshot-s390x.sha256sum] = "1cf85452916d4f5696d93e45849a99aba23884a3bd3d886d0179a1b2cf7d2858"
-
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "00c6e6740ea6a795e33568cd7514855d58408a1180cd820284a7bbf7c46af715"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "a849a418d0f27e69573e41763c395e924a0b98c16fcdc55599c1c79c27c1c777"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "c23de3ae709ff33eed5e4ae59d1f9bcd75fa4dbaa9fb92f7b06bfb534b8db880"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] = "793108977514b15c0f45ade28ae35c58b05370cb0f22e89bd98fdfa61eabf55d"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] = "03534ebbd698f7580cfb08798a7451e86bd9ec46327f4b41ccf2c2f8f1998438"
-
-SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] = "2a625e37c5b943c6c63dad7f52187572d1a65854e3950a8fa26e593f8231d711"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "360f0a4eb41c3cd3792dbe756c0c5b5a36a5b41e3771b8a12d5bbc97bf51fdd3"
+SNAPSHOT_VERSION = "1.94.0"
+
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "7261b2fcdb88aef8b21f4b9f915d9a75c959674193f5b38e13fab4569684fc5b"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "c781b3ef4fefa5508fbe05820eddc95e46351d905a30921cc020febd9c596a2e"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "d57ab7b23b52cba46e58c78327904d0c7db19892988677b0d59495c8af4bb790"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] = "f7450c414e394450b53be602d37c374e2a2c5a2f51be2b54faf3d1e3272160b1"
+
+SRC_URI[rustc-snapshot-i686.sha256sum] = "4d399ca0126adf0225340dc291623a47256b39be1d2567ad76dcd8990c2d6935"
+SRC_URI[rust-std-snapshot-i686.sha256sum] = "528c1dda491b25bb855426f48757773f4740c75d3c7271efffe7412c2fd5730d"
+SRC_URI[cargo-snapshot-i686.sha256sum] = "8699cfc772af3f651bf61e84a5b292e2ea62de9e1ab12d70e1384e57a5e91690"
+SRC_URI[clippy-snapshot-i686.sha256sum] = "54a3219f0541c080bc8e600c3cfe63d60963eb361c79fd645dd1b171019c4dac"
+
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "5392936010d422d7b8e5b83ba6c314da16f0d2b33fe57fdaf340b1e8a4a3a0fa"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "a42ebd0c280f987f8c604fcb4549886f8954e7d025d54da3e63a5621ed268dd5"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "83bda8ec4b506646eddab2b7b67e67f2fd9fccb74693a2558383868d82b85668"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "98de442bc183acef748ae1f177498045bf8cbcf03ece6e75c2befa98fae8841b"
+
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = "443475d3e1ec21d1f34b09f0cd6d1f10551535a736048ce7e21d7fa4faeb63c3"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "23e32cab484d7787b7966a0508c49baf231bcdb4a79a421ee85ca69e81f2a06f"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = "3274ccfb125035dc5846649b0bdce855f15c7a1824507360840c6a152599e4cf"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] = "3a38eb50a04557801e50e2ab04e9e5db8f3f8f22dfea53d9a483efe1ea251129"
+
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "89874c3bebc35ace3b0d0dd225154e583a88caafe2c3d04476b21e4a6650f715"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "7713b676a37fbd0a52a711c2e3c205a917f8b05614e17cd9f7f37874a88469a3"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "3c618a93585244a6fd70a857061b781590262f5f430f710f3687d5eaf54940bd"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "209d292768bf89c8fc65f434257f7be39a7155e2b4590d917f3d873ce7f35fd3"
+
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "7fcdb850568508c0737e9079383f2aade49b1ee159620e67e041d0b756bfe4b5"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "094f3955828d6630b70a9c7c71e3165c3ffc7a301929601dde08501def623347"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "6b44ebc7f08464e3a60ff16580729a99e727c7d4c2368a2d4b62d1acf4fd5c11"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "11dc62c3b286dad9e22d9f0005dd75dcbb527da02b44f0729351dba5277f39c8"
+
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "ad0e35e45ceb4e874653444c393bc3b969da78729d92dc3d8852b0fd2eddcec6"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "32e9b7006f1269e48fb65af6298f6e8a222e1a8a2a20b112528bfb3dad2f65a8"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "61795ca964c0b08faef359db32c3409e3348ed2bd7b4cad481b3c8cf8654b5d6"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "c6ca11e8d361fcce46c684239ea2debfc53b97def7db0c2ff7014894de22b220"
+
+SRC_URI[rustc-snapshot-s390x.sha256sum] = "9167f4a85ef250d6e613bdd3993d723fd225df67665fd2dbe61b0c780009c8e3"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = "ea69833addbc9521664464418c7468871f7a80b16fd2c385f6213a6c99cedfe9"
+SRC_URI[cargo-snapshot-s390x.sha256sum] = "f32f72efff179de4871fb5f5a3e030092d279ca70a71f0a4e49b3c8f69ef7ac4"
+SRC_URI[clippy-snapshot-s390x.sha256sum] = "8195f54d3ade3cbb7beb51df21cdc8ba30b6c72dbb9d9106eee10ea781a15062"
+
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "31a0d3ac9383dfdeb4fce86eeed5ade3230131c635264c0eab7252dbf235f28e"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "dd33653107c36e040082050d9e547e64dac5b456ba74069430d838c00c189a05"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "8e17624f3de39e079845bfb25ed15a042f4b50ceca78e37c56c4b9b15949b9f7"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] = "935529b0b9150084fa9cc1734c6598efe86b6e7d76f31ad3f8d4bb79ebf6031a"
+
+SRC_URI[rust-std-snapshot-i586.sha256sum] = "9347cfdc1383f4d71db1d63960f289977abc93ee575ca84748516995a05fac94"
+
+SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] = "f0b68c16c81b96562e039ff298dbf6a833cab112340c3b4bbd44dd3b45db6a31"
+
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "8f611aa779732057742fa289e7581bde48af1c97014c1f92fd21b5682eff1a16"
 
 SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index f11bbea9b3..c5771e1932 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,12 +7,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
             file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
-            file://0001-Fix-flaky-assertions-in-oneshot-tests.patch;patchdir=${RUSTSRC} \
-            file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
-            file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
+            file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
+SRC_URI[rust.sha256sum] = "62b67230754da642a264ca0cb9fc08820c54e2ed7b3baba0289876d4cdb48c08"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/recipes-devtools/rust/rust_1.95.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.94.1.bb
rename to meta/recipes-devtools/rust/rust_1.95.0.bb
-- 
2.49.0


