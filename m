Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E295FCCD18D
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 12:15:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14271.1760444133703548304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 05:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mT5Fm+EL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382757b62=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5DgFf2937678
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:15:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mHbIiMoWf3NGZIIjsgGR
	kSSKdeylV+/YutcjwbQkwLU=; b=mT5Fm+ELIC767EEQjGMmpn9RP06AtpYVCOJm
	J/MDKa4FoCV1/cVFDnKREhTn69j6aKHMQs+GU6pVREeKOXwW9+hyqV/VglGDLqjI
	b7spoPJH6scE6T/dZ30g+OMRLQKB0CLsxY1HsrL5W+nPoU93XydHQNFJh/TzmkyD
	ub4FX1jbhBbEcSddpv9/0n80601F3rROlnVvaGyBbtYfwCC1QoREoUHkYbSoraTN
	dze2NXR0MRF8Zh3+27QdLlktbvI8b7UdC/ZIBvy3f64O6pXgzwvdNBDzzdcRb5Sh
	+fSNQHBuPQFCzY9Zvb9P4Wld3nMZhm3o7cv+WW74ODkePM1xuA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1jx1r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLAgCqJGYeDIhg96OXM4b53941xXwxQpakFY6X8u9JHIwR7+RK8CP3WiOr1hx7JjRrSgs7GxANXj55xsSfV8lLZAh1Pyip1jgpsWauRhBTxrWkkE5/8iTqUWnSrO0E6WuuZMeNhMvDr3//h/DaOV7/2FnYK28lKo7u6eJkGebGZhvWC3XIlcNmb4VBc68TvHRdgcwLlkHt+B91XEYjBOKhVjJ2MXs6+m36eFdjijTktEXhKVkNaomH6fzGKicRZ0AcT6e+wdCf1bsA+3GJ45XB15+p72XkKCYvuCbuCPOVwQH37FVxJOhqnI1RzDFgXd1PmbIG1CIj0RJVsZR25c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHbIiMoWf3NGZIIjsgGRkSSKdeylV+/YutcjwbQkwLU=;
 b=fBjre/zi+YN9ZnIJ3pB9G05gadD9qyQsTY8lYngsqZOeOaxq63qrFSjnpHUFQczD1YNMtosU/5eTtSgeLCj+aaaLROPvgax+Z2EdOqDBv75Jwzm5yfhaHjM1U+2CMASBSL2MGIcza2ItApPXy5zPrrR+r+meNbby6BuZ14CyDFMuFgM/SzQLVrmIhvScgObeGby42QGz2Qo8wXsXXHuN+weuJdNzCsm31db/m3flaVzcbDrLp+Zo4Oy6PBLix7eKgrG1JSRK6EF3QkXOYEY+Gp1MSG5fSJoWaRfR+BBKSmEEKP18fvjoM/j3apBbe9v/9Aphu09S1NJW5LGO63OEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 12:15:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 12:15:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] musl: avoid redefinition error on ethhdr
Date: Tue, 14 Oct 2025 20:15:12 +0800
Message-Id: <20251014121513.2606389-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0248.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c63fd1e-7ba9-4fe8-205a-08de0b1b5e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hyZ8wlAFpiDtMbbhVCoQuEZXyhq9B09fWrbutXXeN1O4sFokCRnCxXVCLIBE?=
 =?us-ascii?Q?MeGa0P1hvjXOkzIONb3tsw+AWAbCkqn+IYpyyQ9gxjosprD4lYLg5AxGTp1m?=
 =?us-ascii?Q?+wk9Ey3VEAF7QPVyd6FBukCxTNOna8LNCjGzBHK+Tk9LOYeT5kWX771jkfd0?=
 =?us-ascii?Q?+0sxseKAvEzW/EVznhJPciuyTYjs4EeGApLRyEr+Rzr7gXxjPjGquQv+pebA?=
 =?us-ascii?Q?wArP61BQXjrkI5wH8CYhzqXD+55Rq8VACe2FqbRX00WhtoCLudI478wEwQGY?=
 =?us-ascii?Q?WuZHlzzLgviQbnyvK/zEk4DSkVWRzycAZnFfGoZq8rs8s3rhji8heJO1Zj41?=
 =?us-ascii?Q?lNx6dk5a2JFmDKLgs84kP65BWVxJkdtH5e0feiLwY48b/emWAWbCDBrpmBdD?=
 =?us-ascii?Q?O6BonjI7cbbrj0tRlyq848H1rQmgVvp4b6hAmb+KEpzPV5/u7A88o3o58/6q?=
 =?us-ascii?Q?BXuOHMpTrjXSta78NY/XL+6iOHvACt4xAWTXEweJTzSZWwH1biFJLQr4stQN?=
 =?us-ascii?Q?gERUYFgDdDJ2bIunXhvxikyE3c0uOExB60cpe1gN5af5zwj12vdmXWVw7bwV?=
 =?us-ascii?Q?HoVpq3sgEst28MqzBujg6LEyX5el4C1YcQxqh7buNCCkGFJdJ/62PNBUFbYB?=
 =?us-ascii?Q?h/XE2gVFmYjmfp9AWAoVlH2SuuQks8k1OJlYDssnFFcscIiF7sVjnh8CV86j?=
 =?us-ascii?Q?pX9He6dqhAz5RYpTwV/AwvajHHPLfwvJZbuPuDuTLswoRhL00Z7214d19x7+?=
 =?us-ascii?Q?BByFP4ItNRziWNxL0FU2AH0zyC6g7+X1bKsdpH2j87HCPsItfZwGSWDsmy1g?=
 =?us-ascii?Q?pS3AVAF4aecWB91Qx2+yIucp7G9ZLeegKa78n09QIyDUuReQ4vVUytyGAGTa?=
 =?us-ascii?Q?bwJ86CwNyi4mwtXZaDmTKzi6K+wYbRR3xE94TR8jjn2SnxlzG63j4J4MKxDg?=
 =?us-ascii?Q?SwC/Fs27bRNZ/4HEhFhkGyxxaGchyvL+cCJdQPW6yfxR45BbJV8p9g16lEor?=
 =?us-ascii?Q?2alMmKQJ1HmN5EFYOx9X0H5MSARD9xUxtV0WkwDCy9M0nH0mxe6SmM3S08zG?=
 =?us-ascii?Q?KDuu1wvLACal/BfjHPuwPE2LzuSKZXrla8s349WLeVmR8Oh+OYMA6iMneuTR?=
 =?us-ascii?Q?nAjzkhVKRkZcZ1WIn+sqGBJuRdHEfL2HlNzus8ebIhw5LDgqzwqHmXdAfalV?=
 =?us-ascii?Q?m3ALaXxfItwCQdGov5J7xHAJZES9sX5rJ95HdmdwV352I2l8hUBpSFNLsk6j?=
 =?us-ascii?Q?hg0WWbkWYbhqVc/fUMmR9cSrx2QGDp7edUBEacPEt0nxM3opF0no779Xckr6?=
 =?us-ascii?Q?sgtFDJkrYpBFCpP+EwZQROI1i6twbOBJXYzCF3cYQJiItgme90WnsKZmj5qh?=
 =?us-ascii?Q?r3o4TUvvPnSGR335DoUFDTfhCI43r+zBsCpoukosIb6E/TPUXMbf2Zu5Gg+u?=
 =?us-ascii?Q?5r6pf23uvQO8+ePvqrtmhXvRn1psj+1NApROiDSYf8L3DZETFePIM3g0t4n2?=
 =?us-ascii?Q?v3ogyVMKduVUAPpT8BKx8xowaF2ozNI5KXCG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oL67wIk8tGZN7QllopMOC4oRUlvHG6n5QQftYZTfc9XP7OCxppay8QfLWK4U?=
 =?us-ascii?Q?oBDolAF3zaKGLKWXzJJPnN0USRH3vuK5pvOdCJncI3ZZisKmYdRrdy7T+ZlJ?=
 =?us-ascii?Q?v1eo2SMPX1XpK5QJL75+s6KpY0S8TrUsgxVpYJzBZoldSXTjF8RQCYaTT/vQ?=
 =?us-ascii?Q?JD5vu79o9SPpSw7b9t+kY/pHlndA+QevE/vxO7+E7r2yg0n2Spg3kXQTOmbn?=
 =?us-ascii?Q?QgsnABNIe8jT3yLIgWn6rMrIIy/iN48Ai1eg7WzOk0H3SkUNa6Nj6z9UUeqi?=
 =?us-ascii?Q?0/wiuVhwxj6G//0Zw732vWnDsiWJVV/hAO3PJ0ikXCd6FgB26Y9WTIcYdKdZ?=
 =?us-ascii?Q?9OTZbAhSvIkRTUQaoRDD9UGl+6wnmC06DwfBZpoIiaoSQ1XkqGJ7RUi7u/z5?=
 =?us-ascii?Q?40zCh6iaQJHkPAHxtj9/+SgxFx9vVpB7ETgjiFVB1M4vh8a5Wr/XgCJ2ezcW?=
 =?us-ascii?Q?8hz99lYQo3PFbTEN2at6b18kt6EmefPeRlSK8XqWVRPfLXWMjnfb7pDj3IrO?=
 =?us-ascii?Q?LuHWjWlP8N6aJBcQ6e0qXM/0Jzdv6VUmknjwVlSLvuDre4EGdly99vMGKXPX?=
 =?us-ascii?Q?OdhDORiONrEiJsKwkbOZ9ktLshb0+qRZFluL6gyT1XpPOgAYlIEV35lFF+9O?=
 =?us-ascii?Q?d0AapqeimUpiGI7jPU3CucdzGTbd2Z+vDcA3XmQLUJFQkF8Ab2CG9FDIw9xh?=
 =?us-ascii?Q?6b9mUtN7Us4PNa/tMgz01f0bnquUzx6KjTqmerAjbV/DLNJLVCjQnM8Q8jdi?=
 =?us-ascii?Q?WU7wnPrB3w9N3W24C4oBqRcKdkjRg2oyhDFz4N+Gl0DbvDwCUW23boVFEEmM?=
 =?us-ascii?Q?+l2jsfNmFkWadGh9PXJlPijH9jcTx9ODPa/iELTuA7Aqs2WZJ6m9AGGWx79x?=
 =?us-ascii?Q?nHLIzAI0W8cqUEQtXipzJXzym3KmWOTH2ZBF4+GgVCp/PPkfA5+y9RJX0YuH?=
 =?us-ascii?Q?zVX/mqSFj4DraifnXCbDNmYtbJ0VCVlCudmj/yqgPgcHZ09Vc6G8LR6/n2kS?=
 =?us-ascii?Q?Tyj3HNljE2yhRwNVpw782ogBFY7D81O96dEoNc0yHATyr8SIl4ei4u7Rh4Yh?=
 =?us-ascii?Q?fGd9++TGzIcFBaR4DdgwtrhNzCxT9ZM4+TtpKFDZ3xjHTgYCXZQRnajPTzhY?=
 =?us-ascii?Q?TFyQ5o5yuZygU8pYVWNSZqPBfUxHonOOv/O2S3qvrQA4NCfX0t46JmpIKa8j?=
 =?us-ascii?Q?NboLLYHKxxJDn+GrKYf/FvwxZonwtFlFv5iIqnVNmEtWPlcKVEp6Ju/kcBsE?=
 =?us-ascii?Q?VeDQ91x2XXeCxrTE99VXU8RrUimZO1I3/G6NU0eMljw9zRRCF+QzgyWPmHNH?=
 =?us-ascii?Q?fK7XsUluni2zXz9oeIpI6xoCmunsN5ohMt+usfK5qxH/SZP3WS2EI0a5PsrL?=
 =?us-ascii?Q?Ukto+4v2m4G0P2WsVpCGOL+N9K5u8oxrafyW4d0TdtHVRBMunTBvTrAbWL8I?=
 =?us-ascii?Q?cHs26MsDGnxZTB75ZRuUqO37lvapT3VCbwngIkKq4GnQ5xkI/LK8gvDjGUfX?=
 =?us-ascii?Q?4If5hfH2DEUrK9LYDFaG0642D/AwXxJI8LHBWTYSCAwtN/sdSZiTi/L1BlE1?=
 =?us-ascii?Q?WTI1Wrob/1xTFPb1OvRQHxnCOt6AhBA904TklRXm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c63fd1e-7ba9-4fe8-205a-08de0b1b5e00
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 12:15:30.6843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+HbFkHyufKrZB1KM+bZgCTI1VpB2xAQfYTcxwV6QP3Ag7cGzZHWhtDZCNXTnA356V0p1WA24aETGKq3Ewr7xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA5NiBTYWx0ZWRfX0RhrG5l8LkS/
 NVmrPVWrkPsVmcK8QeWcXqo/oqYtlT35i3TpNiB3nrsFPYLWkaQKeg5f5yCVc0LqVBfC591n1GA
 XdmJTv5ueD2AsQOvMTqx8QQloe2HlLdsOfSgb3/7Z3PH9/GRy1dGEVSfHdZnO7fu2iONqpTIG6A
 Liyyoa+4jLDABlTI2Fh73N7If+y+QF6T+EXIVwR5wFr/n5thx54dybINz5+W5LIodXYsfVi2wm3
 S26rnSRKy4K6MFov4YUxKMKr4r2jdesmqR/HS9zXEHgmMt+xBfq+sdyh9ON7G595W14JuqGiQ42
 Btmiqtsha598jDtpXBmYdm8d5eBQTnxqSVv3HxYKbs7yJNLnZgKlCWGr61qZ4sW3JWDbsM7fWsE
 NxXeWhfIrNpsOQk++JxWQ2A0yDeKEw==
X-Proofpoint-GUID: oIelDrJqMq83HW1S2X2xABSzm1lNFZqp
X-Proofpoint-ORIG-GUID: oIelDrJqMq83HW1S2X2xABSzm1lNFZqp
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee3ee5 cx=c_pps
 a=4FhRDsKUqNVV+vA+egT0Jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XkRKQH6RAAAA:8 a=t7CeM3EgAAAA:8 a=5KEJ3k9QAAAA:8 a=h49p7MfJki9Oi6RixA8A:9
 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 12:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224817

From: Chen Qi <Qi.Chen@windriver.com>

This __UAPI_DEF_ETHHDR macro should be defined right after
the definition of 'struct ethhdr', otherwise, we'll get
re-definition error in some case. This is because the
lines under 'struct ethhdr' definition are header file inclusion
lines and those header files might also check __UAPI_DEF_ETHHDR
and define ethhdr, resulting in redefinition error.

Another problem is that if_ether.h in musl should also consider
the possibility that other header files included before it also
defines struct ethhdr and __UAPI_DEF_ETHHDR.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...if_ether.h-define-__UAPI_DEF_ETHHDR-.patch | 39 +++++++++++++++++++
 ...if_ether.h-guard-ethhdr-definition-t.patch | 39 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  2 +
 3 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
 create mode 100644 meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch

diff --git a/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
new file mode 100644
index 0000000000..800273612d
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
@@ -0,0 +1,39 @@
+From 5ab64f7e08ea0325d83d446dd4015f82b4c179dd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 29 Sep 2025 21:39:01 +0800
+Subject: [PATCH] include/netinet/if_ether.h: define __UAPI_DEF_ETHHDR early
+
+After 'struct ethhdr' is defined, we should immediately define
+__UAPI_DEF_ETHHDR. Because the following lines are header inclusion
+lines which might introduce header files checking __UAPI_DEF_ETHHDR.
+If we don't define this macro early, we will get redefinition error.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/09/30/1]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ include/netinet/if_ether.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
+index 3479f511..b1646f6f 100644
+--- a/include/netinet/if_ether.h
++++ b/include/netinet/if_ether.h
+@@ -117,6 +117,7 @@ struct ethhdr {
+ 	uint8_t h_source[ETH_ALEN];
+ 	uint16_t h_proto;
+ };
++#define __UAPI_DEF_ETHHDR       0
+ 
+ #include <net/ethernet.h>
+ #include <net/if_arp.h>
+@@ -144,6 +145,4 @@ do { \
+ 	(enaddr)[5] = ((uint8_t *)ipaddr)[3]; \
+ } while(0)
+ 
+-#define __UAPI_DEF_ETHHDR       0
+-
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch
new file mode 100644
index 0000000000..343b0976ed
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch
@@ -0,0 +1,39 @@
+From 67976391887c3c65138a3b6fc306f2f5b490aeb4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 30 Sep 2025 10:42:51 +0800
+Subject: [PATCH] include/netinet/if_ether.h: guard ethhdr definition to better
+ work with other header files
+
+The unconditional definition of 'struct ethhdr' has the implicit
+requirement on this header file, that is, it needs to be included
+before other header files defining ethhdr.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/09/30/2]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ include/netinet/if_ether.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
+index b1646f6f..e5a1ebd0 100644
+--- a/include/netinet/if_ether.h
++++ b/include/netinet/if_ether.h
+@@ -112,12 +112,14 @@
+ #define ETH_P_XDSA	0x00F8
+ #define ETH_P_MAP	0x00F9
+ 
++#ifndef __UAPI_DEF_ETHHDR
+ struct ethhdr {
+ 	uint8_t h_dest[ETH_ALEN];
+ 	uint8_t h_source[ETH_ALEN];
+ 	uint16_t h_proto;
+ };
+ #define __UAPI_DEF_ETHHDR       0
++#endif
+ 
+ #include <net/ethernet.h>
+ #include <net/if_arp.h>
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3f5fa37fba..ab4655b378 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
+           file://0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch \
+           file://0001-include-netinet-if_ether.h-guard-ethhdr-definition-t.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
-- 
2.34.1


