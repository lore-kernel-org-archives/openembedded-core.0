Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A41BC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 09:01:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34944.1789635694289978945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 02:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HB0hx3FE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3720f20244=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H6032S3739224
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jDiCaLzLJ
	d4EnxMneLp1P8CpmsEmeNNHZfn7BiEMzh4=; b=HB0hx3FEE6d2SIgNSopuQMXEm
	qE+Qm4qfk1a38nX+PYFIH3J9E2MpfRqalTTdrdjIKQ2W2UwT1zVfCJ68BAyXCvql
	9dRKHF1h64cCJXqKP7WxORmslkxTgYYO0U13zuI8kb7RE5kgNURMLhnKaNJ0aOPG
	W4PDPwIfwMPeU7ujiWnwOIxEskDupFUiuhspNCZAKIa5AP4FTzYkBJrWvioYT/Xu
	F4FQhAF9+meyaJHaprXal1K2XKMtoj2hHhsHUVdx1d/YwYejiAK/eqmQ2kYcAtor
	2mg8Fp+MqMLFFnGylsTk8FYggMUf4MnJ4p1QD6Plk0DT4Z/P3wbSy72UoquLQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020103.outbound.protection.outlook.com [40.93.198.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqc1nkf7m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 09:01:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyEaYu/qse4zL785pQD5oMeaIdViZo2r7UG8sHmvcjOSqLYbkMzv7Y6I7rgbqr4wJT0zLYKrowLjzylCBDUbX7WPglfygXW/jBGuPROUdAqbACdOYrNjgLE22kyUUixhr0k361X1lzQ1B6GxTDHoMbdqihf7nm7CR4aQjyQTnQJ7fU56XorF5T7kp8dGRDnOg/JUNG801+IuAP0oykIUOn5bA/OZOcKvFX2/gEUmQPIpFVp2ZfIBYXN4YHoH23k41YfnG5pv8b1vH1sw9VTxJPKGPSDOyxLBinZ0WGIhjTU54fOj0ikGmpdP/6WeXCufqCLqkMF8jkVB+nK6b7JaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDiCaLzLJd4EnxMneLp1P8CpmsEmeNNHZfn7BiEMzh4=;
 b=JCQ1SQnTl+bJlNuyUqGox4RXXs6syTuk5L2LQIyIV6xSZcUccivpZXn9GLbJ53rzMSGZOkilC+JZUbh9P+553BTNthIs4RNEgNNKPju3xCY144z+qlKmArpwlUGlITQ1SlkmXf7w9IiMfinevX1jkwoTGiiO8/DXazmP+R7HIFCA1VFkcPnjfDdS8AxyeD1MAr1CnxRJ6+FeSpdE+BFEvE8a3Y7ING1mfTKI/aFQ9xbD+8CMqKQNFQovQ58N08SV3JJ+uxmQrcc6WlVfRlGuCwAD9/VyndBbObAspDvGnzmagyfJmiSvbHAAL3/l1bRFfS1TGH9Xe1hM+ZYEnjcdAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 09:01:29 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 09:01:29 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [scarthgap][PATCH] gcc: Upgrade to GCC 13.5
Date: Thu, 17 Sep 2026 02:00:43 -0700
Message-ID: <20260917090043.492894-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0018.namprd21.prod.outlook.com
 (2603:10b6:a03:114::28) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cac17b-780e-4792-ff44-08df149a432e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|18002099003|10067099003|56012099006|6133799003|20052099010|11063799006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	iHE3jJI+OlNBgfh8Q4ibgiIhyh/1lHerDqEBQp2jU9BNfTfLTByzRZYR7dMPtJyeOEOvQpqW/vVbZCdUPUR/u1Fq+bg5FyT3Ft0qZ+usDlOPfVxqUBxUrv8t7ruDarKwJcP6mC5Ze/obk7MlK6m2eo8V16OPpV+wXChZMKHTR46M9MHgcPYSYYTuBG6KHAcvD1euVwG88pOW5Mz/IhQadc885YdTnOgaBP0b56VxgS+ZdqfAUpRAY+5r2nEH3KKMGIsXcbL3IvqfA2p1rlrGMy6Tt2QVDUZjNsVUw5cKB2mI/ubc9QugfdEqcMIepgOYVSw/2YN3ss201lq6s+D3z24bH0LTZBef1Eeyi5vwLyxs5wU9B8CCHmjE+xE8L758OhRAwaGaUCpUmXveSvMjUiIWX/2T26pQb72BDyvzw6C7GiDwtTxuhzjHe9jRo62l81AYsSznlTTtd0NVhxQPCxPJoiSnsTZyhKHaarQVCfQsHyhbcIOVGte57GCO0Y2xZvU3xiGbKfrVMOg8oL9srD6mqVjlTu2t2ubua1ncMy4eRzN9142/fjgonY4+PTLu9kyp7xUUo3gYKRnpWMmlMdVNzFweN0dguaIXnk2Mv5JNi2+fF86z6vk2rd+fEvPPdgQbGzOqzAEKxmMbdYqmtKqaFTV2sF9GabbfAKL16oZqEauKSzZ3OgHiZ1CLN+PGvaKphpOYJ5ckNoLn5CNPEe+ITCAGtd06ZhC8vzny1QQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(18002099003)(10067099003)(56012099006)(6133799003)(20052099010)(11063799006)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N50CKz4obX4XSVfx/aefb9kjZkfiL2l3CqXE/UgbuT3qU9MxBhx43Y9JP0XL?=
 =?us-ascii?Q?XqktRdS2KYEbQViVYqz2mR0S9L0HS6VMsgDjcdA53nBCbleuPhT5Xd4p+NAM?=
 =?us-ascii?Q?1hExtPuKtpHWK79pwwJD0actTubp+vdmrtzpQIdb/bQaVmCZ0w3+zt/VDiHX?=
 =?us-ascii?Q?bikm5k6TyeMYQIK6yHMrAo8o35MOvfRjQKdP7lYuulONNV0VVnWozrrD29eb?=
 =?us-ascii?Q?oAdfkHzi7iC9KLjTcGJc2g0en4aRDGC2raZTzjFFA9P6n54v9BJRJPSLFdWM?=
 =?us-ascii?Q?2D2CvKCQl6zre5JbEQitiQxJC6QQKXA5ZpbsW9dUruRnwciRm7oMTV/5w7O4?=
 =?us-ascii?Q?YB5hbxqKd2HBGGmWj9TiLVSgRz6hAgAtvswMo63hcsx9BkqtNoP+0sYKLT3K?=
 =?us-ascii?Q?poYVUD6TU1BbQc2wweAUBzOClLCFh/XozWhLwfpUPN+4X6R5+yt/zawMBwI7?=
 =?us-ascii?Q?Kgv+aO820pKBDp/HAn/2bR+kJCOmuvIlXJQQabukCifUDg5CU7AXhY1lhf46?=
 =?us-ascii?Q?Fgy9vgvaytd4HqHoW2lMpaNUoo5D8Tu0ezb8ZRL/Rh2Wj/2HN3io6WHQ2+Oc?=
 =?us-ascii?Q?kFAAgPuJHP/KCjTVAMKdmNXQTVmUmVvIc0OtJrVPo6KwIUZOCIrAlT2s5U+b?=
 =?us-ascii?Q?jRrhaIlnhcjTWcvRLERrSWFT0nZ+mp78Wllel3tnuC4QiZZ+DIP5aAlzpaOB?=
 =?us-ascii?Q?cFNsDKpI5yUPVlXrCy3gwZD9QIZScWqnywKuCF9sCY8vNChm1I0XLWWAbGki?=
 =?us-ascii?Q?ehBnWXqTh36zwNLF66SuVObIjQQP4QOGkoRUjwCcesXVOYbK7B3JGe7Tp05f?=
 =?us-ascii?Q?EW5OQ4UnWvNKyS1oplt/6GeS3RfV92EbJ5m04wWIM+PJfQ8MMbnWZ90/G3m6?=
 =?us-ascii?Q?qX6ZEk3Sg87idOSeB9EsTvgMizaGRADM0DgEiEhdgLFiWxozUTQ5yvezpXEs?=
 =?us-ascii?Q?0vvKYWngyZtPLH/i05DzB3MVG/WoPWeQpKyOxMLGy6cw7Rpmkr1aSnCO+nLn?=
 =?us-ascii?Q?UG2ve0iaV7PiKyHJEGbadko/OQeOBgUOqhnncYYO2ALcQ4NyLp2M/pKSsayl?=
 =?us-ascii?Q?mYBgF6zWc5DlNLjhJBNc0pN8QP99tOp9SbwIDzC00e+vMWCcclABIO1muy2y?=
 =?us-ascii?Q?mOgxM4BayxnqGRtUbnKJvm2TmLJn1J/d4J58XGGiYyjTDaDnavxJnr005i34?=
 =?us-ascii?Q?HNvYmw2NPjIOyePVm/mOcewNVI5/ODXqZ9FUs9ohkxOq9ZWW5JvFGVjuMoze?=
 =?us-ascii?Q?77wuU1eJgwhILW5dRRvvL0hZjjelZ+UpUpB8ecN+GP07IfZfi/9nBMuaHK+5?=
 =?us-ascii?Q?sdHU3k5oOsYm9xZzlsfOpr1o2Vo7zpmNsXaSB6h/bp7oke/SL6mFZIAwtTDn?=
 =?us-ascii?Q?ys8mrozE7Gc+hbRKk8t3JtUfsdMfIQs+UvTrWsk4BAwdEJCFkrxeOf1kmHa9?=
 =?us-ascii?Q?PNRmxLEju6CngJqPvdgaJpxgiqF3BlTiWMUxozTHh9kJoMYJF6RQAqr1OS92?=
 =?us-ascii?Q?SI3e9E3vwUj+EEvFhGXqV7dwTKKLQO05UF3cd+nTwqY4kd25VaRUo+vbwtXt?=
 =?us-ascii?Q?k97uzjzg9fZw0lQW3P1px2nLNLc4Up/stFm2PhAkRkVbubmtvYlqXTOs5fOh?=
 =?us-ascii?Q?A3ZRtz8zqys+L1YgijYmvRwxIXVEW0p0H7ox2FceOylkt9OuX9oHFaib5CYm?=
 =?us-ascii?Q?vZetchhg2e0+Z21oIL8EcbJ5BSuZgRhWGuh0hKe4V0Do0pQLWMeygttU5w2Z?=
 =?us-ascii?Q?jQ39Iov6S1GY1nt7K6qHGCHnfrNnuBU=3D?=
X-Exchange-RoutingPolicyChecked: 
	i5fvSnm1GuKnPbhf+vxWjRUDxAi6NZzlO0nKVUHjGkfWmfTM4FFWcMo50Ta1rK00VxRATuIuiYlJKYlMnJ3lrjXFOgg311kjH3CTrna99KOglIfcguzifhmYacFdYL3GFSAiPWQ7BJ8Qo1Hu2MKSfRBU+tkG2BAXAt9V0a7UD6Slc1L6AI1yNuLoIKPYIju+v6S5Ks2/YDqrmQNsYpNms1G3vX4GJjnFwqaBf+8dKZBlTtU+RtL9WirmRcppR/pKVbfURU92Q9UVwL5CaXRRB5FZsgiJFnJSAG6zLH5vfaYhihJpTuG7Q8k1CBKyRubCBe+3mX5xHbXG8L9XDKAsvA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cac17b-780e-4792-ff44-08df149a432e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:01:29.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPK7qbRoy06N2MSg7IBILtH0eLd1+HRnfPFj42k8T0zXCSbU4Hq2ovttZELNwgPZ8AM1upFB8Zh3Oafo0WhdW0+UMfM3TK61rW3La29yzRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-ORIG-GUID: rE4_uSUrEgvCztiQo7BFXtGCkEJaDsSs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX2YI8MzaBj8uz
 lr/LZAq8QXqiT/ynYQGNUh6w7fRlKgY+Rsyxpd9HGFqvX+BM7kB+OcXX/pkPowRrYeOp1Kls9XS
 uVkXpik5EJESttX1NcbOKlhpSBLDDNfmzL3MrGSV8OKKb6Bv40Bf
X-Authority-Analysis: v=2.4 cv=L+GI0OT8 c=1 sm=1 tr=0 ts=6aabac6c cx=c_pps
 a=4nRh7bImp0HScQD0nwvrcQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8
 a=20KFwNOVAAAA:8 a=COk6AnOGAAAA:8 a=aW_Z1E4S6AGfzCYL-CIA:9
 a=ZPyWRJmCWtWoZPN-:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rE4_uSUrEgvCztiQo7BFXtGCkEJaDsSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX6PpIcdlztqEU
 DfUQne7O0ffrQvUlYEI4Qs5/08cmTjByW5fu7n4yDj8zc2CsY3qE7GaoWxVQDPtn0TPdcDCrKOU
 r9Qy72p/Q8J6FXSYpuwOeCa0tL+jQB36d1Nq+Kgq9PFzXsuXlhS+Vkld65yAfEf6m5ku8/LlW0C
 pElsX8JLKw5cnSdrHE8CNOjvK6IHfd9CdYlIQgK5SrYH/E21OtWvI1o4cIno8LbBIDKuvnvInoe
 4hf//NH5ebKhF8YdBwoOOQv5G8hAmvosXM7lWuwlDIzBCcRA1Tt7i9aoXohYasZsOuUYh4ciKhX
 uKbp7SZzBLAYUKocF5Esr9QLP1BTZ2QTqtW8XtZ7EiKcD56x7/rPVjC5CXwcXZXC+POuj97EQdY
 7RYhA2FqjiqMrVDGO2taPRovUwzz86CDREjZK9XWYiG25UATO5xQSyVwz0tAXnHAq1wdoOgpiNG
 XY8oYzwx2tazVOGubQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 09:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246049

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This is a bugfix release in GCC-13 release series with 266 bugfixes

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.5
Docs: https://gcc.gnu.org/onlinedocs/13.5.0/

Dropped the following patches:

0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
https://github.com/gcc-mirror/gcc/commit/51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54

0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
https://github.com/gcc-mirror/gcc/commit/9239757a9c6e3a6e8d94d56803329d556ec914d7

0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
https://github.com/gcc-mirror/gcc/commit/9239757a9c6e3a6e8d94d56803329d556ec914d7

                                 GCC 13.4         GCC 13.5       Diff

No. of expected passes            179388         179928         +540
No. of unexpected failures        26             27             +1
No. of expected failures          1416           1416            0
No. of unsupported tests          2230           2241           +11

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-13.4.inc => gcc-13.5.inc}        |   9 +-
 ...ian_13.4.bb => gcc-cross-canadian_13.5.bb} |   0
 .../{gcc-cross_13.4.bb => gcc-cross_13.5.bb}  |   0
 ...-crosssdk_13.4.bb => gcc-crosssdk_13.5.bb} |   0
 ...cc-runtime_13.4.bb => gcc-runtime_13.5.bb} |   0
 ...itizers_13.4.bb => gcc-sanitizers_13.5.bb} |   0
 ...{gcc-source_13.4.bb => gcc-source_13.5.bb} |   0
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ------------------
 ...build-Remove-INCLUDE_MEMORY-PR117737.patch |  46 ----
 ...am-include-above-safe-ctype.h-PR1177.patch |  54 ----
 .../gcc/{gcc_13.4.bb => gcc_13.5.bb}          |   0
 ...initial_13.4.bb => libgcc-initial_13.5.bb} |   0
 .../gcc/{libgcc_13.4.bb => libgcc_13.5.bb}    |   0
 ...ibgfortran_13.4.bb => libgfortran_13.5.bb} |   0
 15 files changed, 4 insertions(+), 364 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-13.4.inc => gcc-13.5.inc} (93%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.4.bb => gcc-cross-canadian_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.4.bb => gcc-cross_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.4.bb => gcc-crosssdk_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.4.bb => gcc-runtime_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.4.bb => gcc-sanitizers_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.4.bb => gcc-source_13.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
 rename meta/recipes-devtools/gcc/{gcc_13.4.bb => gcc_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.4.bb => libgcc-initial_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.4.bb => libgcc_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.4.bb => libgfortran_13.5.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3a51ad2139..a9b7be3bf7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -190,7 +190,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-13.4.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-13.5.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-13.4.inc b/meta/recipes-devtools/gcc/gcc-13.5.inc
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-13.4.inc
rename to meta/recipes-devtools/gcc/gcc-13.5.inc
index 2017c44498..13fbfa5a98 100644
--- a/meta/recipes-devtools/gcc/gcc-13.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.5.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "13.4.0"
+PV = "13.5.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "13.4.0"
+BINV = "13.5.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -66,11 +66,8 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
-           file://0029-build-Remove-INCLUDE_MEMORY-PR117737.patch \
-           file://0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch \
 "
-SRC_URI[sha256sum] = "9c4ce6dbb040568fdc545588ac03c5cbc95a8dbf0c7aa490170843afb59ca8f5"
+SRC_URI[sha256sum] = "ec3df0015ed01411f91f9a9cd5b4da3070eb1222b02fadf4133c30c090399855"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_13.4.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_13.4.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_13.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_13.4.bb b/meta/recipes-devtools/gcc/gcc-cross_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_13.4.bb
rename to meta/recipes-devtools/gcc/gcc-cross_13.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_13.4.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_13.4.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_13.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_13.4.bb b/meta/recipes-devtools/gcc/gcc-runtime_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_13.4.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_13.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_13.4.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_13.4.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_13.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_13.4.bb b/meta/recipes-devtools/gcc/gcc-source_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_13.4.bb
rename to meta/recipes-devtools/gcc/gcc-source_13.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index 431facb011..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb77..147fecdbe500 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b75..93bce93aa94d 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb933..c18469fae843 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
diff --git a/meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch b/meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
deleted file mode 100644
index d784edefd7..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b3f1b9e2aa079f8ec73e3cb48143a16645c49566 Mon Sep 17 00:00:00 2001
-From: Andrew Pinski <quic_apinski@quicinc.com>
-Date: Fri, 22 Nov 2024 09:31:44 -0800
-Subject: [PATCH] build: Remove INCLUDE_MEMORY [PR117737]
-
-Since diagnostic.h is included in over half of the sources, requiring to `#define INCLUDE_MEMORY`
-does not make sense. Instead lets unconditionally include memory in system.h.
-
-The majority of this patch is just removing `#define INCLUDE_MEMORY` from the sources which currently
-have it.
-
-This should also fix the mingw build issue but I have not tried it.
-
-Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [gcc-15.1.0 b3f1b9e2aa07 partial, only the gcc/system.h change]
----
- gcc/system.h | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/gcc/system.h b/gcc/system.h
-index c18c7c5ec58d..c209871df72d 100644
---- a/gcc/system.h
-+++ b/gcc/system.h
-@@ -222,6 +222,7 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
- #ifdef INCLUDE_FUNCTIONAL
- # include <functional>
- #endif
-+# include <memory>
- # include <cstring>
- # include <initializer_list>
- # include <new>
-@@ -758,13 +759,6 @@ private:
- #define LIKELY(x) (__builtin_expect ((x), 1))
- #define UNLIKELY(x) (__builtin_expect ((x), 0))
- 
--/* Some of the headers included by <memory> can use "abort" within a
--   namespace, e.g. "_VSTD::abort();", which fails after we use the
--   preprocessor to redefine "abort" as "fancy_abort" below.  */
--
--#ifdef INCLUDE_MEMORY
--# include <memory>
--#endif
- 
- #ifdef INCLUDE_MUTEX
- # include <mutex>
diff --git a/meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch b/meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
deleted file mode 100644
index 270c91c345..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ac90b5c413c1565fb37cf79b92f6859b3852254a Mon Sep 17 00:00:00 2001
-From: Andrew Pinski <quic_apinski@quicinc.com>
-Date: Mon, 25 Nov 2024 14:03:27 -0800
-Subject: [PATCH] build: Move sstream include above safe-ctype.h {PR117771]
-
-sstream in some versions of libstdc++ include locale which might not have been
-included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
-c++ header files needed to be included before hand as comment in system.h says:
-/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
-   poisoning the ctype macros through safe-ctype.h */
-
-I don't understand how it was working before when memory was included after
-safe-ctype.h rather than before. But this makes sstream consistent with the
-other C++ headers.
-
-Pushed as obvious after a build for riscv64-elf.
-
-gcc/ChangeLog:
-
-	PR target/117771
-	* system.h: Move the include of sstream above safe-ctype.h.
-
-Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [gcc-15.1.0 f6e00226a4ca63e76e3e0b3a09a4ce6223980981]
----
- gcc/system.h | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/gcc/system.h b/gcc/system.h
-index 33245e76a986..ff983986153c 100644
---- a/gcc/system.h
-+++ b/gcc/system.h
-@@ -222,6 +222,9 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
- #ifdef INCLUDE_FUNCTIONAL
- # include <functional>
- #endif
-+#ifdef INCLUDE_SSTREAM
-+# include <sstream>
-+#endif
- # include <memory>
- # include <cstring>
- # include <initializer_list>
-@@ -742,10 +745,6 @@ extern int vsnprintf (char *, size_t, const char *, va_list);
- # include <mutex>
- #endif
- 
--#ifdef INCLUDE_SSTREAM
--# include <sstream>
--#endif
--
- #ifdef INCLUDE_MALLOC_H
- #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
- #include <malloc.h>
diff --git a/meta/recipes-devtools/gcc/gcc_13.4.bb b/meta/recipes-devtools/gcc/gcc_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_13.4.bb
rename to meta/recipes-devtools/gcc/gcc_13.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.4.bb b/meta/recipes-devtools/gcc/libgcc-initial_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_13.4.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_13.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_13.4.bb b/meta/recipes-devtools/gcc/libgcc_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_13.4.bb
rename to meta/recipes-devtools/gcc/libgcc_13.5.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_13.4.bb b/meta/recipes-devtools/gcc/libgfortran_13.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_13.4.bb
rename to meta/recipes-devtools/gcc/libgfortran_13.5.bb
-- 
2.49.0


