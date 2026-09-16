Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8D4C982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:24:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17561.1789572234977239122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YdxQV01A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3719b62dd9=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFD9up2197626
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LWN43iG0gpZL6tFeC8ZaofSoacOdulL2ksdiHk0aRiI=; b=
	YdxQV01AbSqiW6KnC+xM59SoHzT5NQfEvZdxbycQeJven9sTJdbIa6eh67HUtwfG
	VeoE/h0BbEe71ik/4WL0nmzVcBgdHAyghpHezJ+oUVjupQ/5uvxBtlkOVWTVtwwU
	l8zzXNY4YBU1y+pYFTqdy77Kgv1m25bAmOcQTt8Syix8H3oCb6v6y1/2AI0HwQkp
	kQxFhbcM/6Wb6+kUJ+i3y01TLQ7IahABc6dRrm8mUGDA8/h2LJOjCVm1IME1TrXD
	tJXsWJOJvD8MzyOmcexg3qxBFtUgXKXRXRAUbOYfsiiTOWOGYIZ844kDyQpOp40b
	V7Bpl0XB7mJUByOdlPp3SQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021115.outbound.protection.outlook.com [40.107.208.115])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqc1nhmmb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:23:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9V1UpLpeIQT2uOzoImEPARJJ29656zLchaQHB20jyn86CxKQx1ug6b197smLePNOX0rnskDWo5zhxNGxj+BEeWhyLvB0bRfMYTnAQ2qYJVlJVOQePbcEOmg7WZi3y3zEpPNNAWLzZF/7EXTAUkHhhTeaCmDdNLE4O6WaUwoD4tmV2eaoY1sSKA7JBS1aEnxhJ+UNyv//TYEsimCmUtLTxzo2oZv1OskALhzuouXMR+365Yxh13+HNe0iztcozDEybI5g4suvqmG0ESTuvlMs55bSEB0R6dCwrNcwwgw7xSZO80cjUzZyygJOPwyY6Nx7bBHzhWvePp5OHzdzb3LcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWN43iG0gpZL6tFeC8ZaofSoacOdulL2ksdiHk0aRiI=;
 b=rPzS7Gg5bA6gX9y0i7QaBZ6NmpIr6+PkXeArzkdv9O5cHiNASyHh6Hvpj3KqXH+J0OaM1QSofHDwIOxVFA9AvYLBq5/W3GMw6SiclNtUjm7J88YfWmlVDXNhB0R16MV2FZsWEeKTXB6LB+doRgQjSqT3LtyP03c7J4BT0beBcqT6nhvZrJijN9rKzhe/EPsekIdjZFxJ9y5hHoi0ZZS5ZviWYITWRolJCYeot321m1b1RMIe71uKKoURJtcysNaKtBNVUUVE9/vIZCqvlvfrggWq/46q156Znxl6ezDChjhcvRqVQFhGwNYz0d40qMUzpPPpoqgyfRr8DHmVxh1rWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Wed, 16 Sep 2026 15:23:51 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:23:51 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, alejandro@enedino.org,
        antonin.godard@bootlin.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2 1/5] rust: drop the cc object-name reproducibility patch
Date: Wed, 16 Sep 2026 20:53:22 +0530
Message-ID: <20260916152327.1765623-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
References: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: aeeb9d09-db87-4389-61f5-08df14068346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|13003099007|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|12006099003|22082099003|18002099003|29003799003|25016099003;
X-Microsoft-Antispam-Message-Info: 
	lTF6V2T0izUV+NjzjbuI0NOf8o9TptGzuet5j6MnfaMB3k3SjHfEBcx9zPmiwlRMPNJ5OuHWNzyTW848K85kAVeh98l83kRkAVGcAucOh+/MRsDJ7q2tBs40/kwdItXO+EAB1CB9GAc0jFwNQ+3jJHknva6P3xjx2H98V64P69CjQZS5tkVFk4KX2hyBCmcVqwZSyTYh/nKDq24yGLzv3SlREhuOzlybuqr9/n5xMtaFddxUKF6XuVBSh5PVGtggmPiejv4cYfDB56H1YGDKsFbpZ/yGnK7zx1Sit/gLsd4LKS0UncV+lfOn+swgjHYPV5V2dJwE6rZ8HaQ9S9Ua/IJr76m5OW8kcO7mF9TLgESaZ4fnFhjTJowAdZxIQcjskWsyZHseDXo+yDM7r61OnVAJAIs3QnSu3JcKfvHhK0+O3zyOkPHzJ7vKAjMuBV83SOP3RkA6yW04t+eZkToUogGRgowjlEpYjh3GMDB3BZo4MpSOCF90AE6ylyKxxjTd6GaazSYi2W0mkg0p36/4LqPGrBhjShwIoUQI/BIgP2p8wsSyC5WE08CgfCRLtMd8M6i3cwI1bGGpS7rOH9hGrwrJr2UoR9z9CAvXRTzvqIZkc0xEyQHud5hNEePvEWnk/awGrYc9LevlNR4QL6IJu8sLTNgJ+wHB6ly3wCPWsCE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(13003099007)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(12006099003)(22082099003)(18002099003)(29003799003)(25016099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?roi83VYpjl+u3BGldZ6voXzlQvw28nPKWsgK5fUzAQeD0ONxAecfZ1k1vHkh?=
 =?us-ascii?Q?phh9BTnQBHju/RPd3f95PeCOmKjZpyV3z+rURumGEqqB6NQH0gEazRqxAtzB?=
 =?us-ascii?Q?hvzDU5xMdXnYO3jJNXkxcc/M59176H15GduVxG6BkXFjXk/OTOJt1fxrevVi?=
 =?us-ascii?Q?rr2ORViJwO983dfo8ABajSFtv1wtvb798oJSKZ/f9T0cePP3/ROl6m0mXxAN?=
 =?us-ascii?Q?5yQohPM6z41bhe/zVhtEj4tR/RgtLR2btZR1ZAkpuTtJw33DDlUykjkWS7oD?=
 =?us-ascii?Q?W4ioK/jrhuyXCvyDKgguP5WHuTaDVYda39v/2XzqmkMMmFewU7/AJlqtyOCp?=
 =?us-ascii?Q?xBWbJ90D4uMOH6DbF+HnFi14RYDF+xLG/VxLctn0Y+EeAyj2pDyoBQ1rDsQB?=
 =?us-ascii?Q?qRx2RLe8ve7z+QBS6sENhSQ3byETl9CJ340ogVF7AN5GfZRifptWVt3qzaoo?=
 =?us-ascii?Q?F19LFDeAMAyUoCviNq6UJeuBzg6T9D0f8mZBuOEvoDz8L+15u4noQHqKXYte?=
 =?us-ascii?Q?mtMxOTIy7az64A8CAOMrJR/5cop7p48bKu5oR0NmQG0gB3m5o7CsZlvwSYVw?=
 =?us-ascii?Q?RwUkmz9CO+GbdReduvUk9+DmpB62e10LSdo72gNbQWdtYVLI8DZ5FYe3dsGm?=
 =?us-ascii?Q?gtbblO6AEH7KKYBa+bf6JtR0TDCAiD9DsjLA0G03DvD414it2fn2hHZMtwnR?=
 =?us-ascii?Q?o2FSzbN+pbN0AvbwHmWYi5TmDyvgwnbT0ARlRyL8OpJBJsG5z/R2HaEh9+8y?=
 =?us-ascii?Q?dQxTqUuGFPUbJZHrwEyJQLmTj3wM96KHicPGXB/pcJ5qeRNUycu58Suvd31k?=
 =?us-ascii?Q?/QsZoCq9rP67qg9YyWblzZ5EIsmHlS2ETQBpGvhZIXbMDUMtzysL9BE6YZAN?=
 =?us-ascii?Q?cBYRsq5E06Dd9zRhaOIqeu0x3JxEYNUQ+HulqW4Cy37444bSVA+G4nuX0GDK?=
 =?us-ascii?Q?UM0FRQk3iXVBQT7tD1zp1MeMWj9bs5CgPFKabEwRGBKsxG/CxR4qi2iW6mc6?=
 =?us-ascii?Q?8f5I+oWw2FcZBJh9nItHmryPdUJlqbYZns9lsNYL1h1w2WZNEvE8Pnu47du6?=
 =?us-ascii?Q?CxVbzfjucH4c2O2EumQr69xs99ceg8mWswXwAbXW0oM9OdD+9b2uaGQlJ5cK?=
 =?us-ascii?Q?0nNaB5t+Lt9ISlw3diHaviCb1tHT8uG8R3+kq98PM1sjTzzac4/9BEqJ4Fwo?=
 =?us-ascii?Q?SHYqskmIa1OSuu3+dhXjjMSCEyaf+zjqS1x2k6UESEY2fxGxVXFl6/2nhfzl?=
 =?us-ascii?Q?4HeG3dzbmePCCUFiEojz0X8Cuj+mFfhTGSfqAz3UrLlkyo6FDq+UfWg3ZQ9/?=
 =?us-ascii?Q?88ugrNwKj+F4gV63mlFY48plHmhMRm+UjyBRaBgaqzE5LBn9VyrXdPWa0ogV?=
 =?us-ascii?Q?2wB0g/uxrYs2vUEdeVHNj6JeiVs8xTHsGrZwIwKXRFeFMpJK+Lm9aeSO+lze?=
 =?us-ascii?Q?CrTkOivFfwcClfyprXIImMvSkLtGBrfYFvqA4qprOFGXUli6z1KcQpCbuEgF?=
 =?us-ascii?Q?G9YBrN5nPgp0YD16WihkTNj5avGI2TnxUupNuDKU6c+/apNtdmwbFT9kRskX?=
 =?us-ascii?Q?yEK33V8zNT2SuD4u8zppRzQtRYhs5eFpzvY2MEuWzC47FM4EAfsepvPpb38I?=
 =?us-ascii?Q?0oSvGMDgU7MmNBTwMSRutU65V59nqoJVOeskWuN+Acj7uIavX6BV0NGkshXL?=
 =?us-ascii?Q?foVRjDsefyfBm0Qzyn5Na7Ynvee8Pkl6hy3/+j0tM42eu/Jrz91CoBFNdCPl?=
 =?us-ascii?Q?d/rL3BPpLCN9dbiPR3pYrIuyAet6s8E=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZV3TJQu56w3QvzQ6rq5GE0nMusUSe8/NyelAmioOF9jbYpPGDj02VpZchb/70mcGnSVjdoT3OLbHz/GiMvrOaaZ4e42+qEr5RRj7kEV2GXK0xLUSJjTMoHaeINJe0IcaRmG7oQ0UFofaAdmE6lSVjc7YTQHYAtOCM1NulTQX1WHg+pQoOlN4W2mTcCMtUXeBmS1LR7y+aQFldQ6jvh1QncWfNmr6DRsQc+DOAA0nyzaTx98by7WWOftMrjRdn8hgY+F5RC5LgeHfYSn97XSxo/NEKfljpjATlpnjZkXMOxLLdheUR7iUZVvESWpSytzq4CnTzHL1PwJpqfRxEL4c+w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeeb9d09-db87-4389-61f5-08df14068346
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:23:51.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEvFpncbjMH6oLBX3R4Wn9lG9ycvvit2hVCtaO8F9Dk6XILR9L/Wosw7OajOoybYcoz5VEvhspiJntpyJ/DlqI4joYn/JtOnxik5bT/Icr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: PgcHNL28UpoenwvCMB5qk0LEwQ6EAeb7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX3GGa6rcPHnHA
 Eb0noNctH61Ne4CcNxk3Sj0EOk+fscM+p44wQVsasb+AtvQbjb2ifPcUnlmuDn8/LXnxnlP+i22
 ZBdlxVSVkDrT2t/4WmGlBfp5xz6yxmEVgmVGzSz50v0D7lih+DRu
X-Authority-Analysis: v=2.4 cv=L+GI0OT8 c=1 sm=1 tr=0 ts=6aaab489 cx=c_pps
 a=gSwIq21hjLySy5HhNOa0Yw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=xZ-Vo6NjDGti9U_2Ia8A:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Oq4Vy3458gLamwXu4UIl:22
X-Proofpoint-GUID: El3dSBjdsyT83AJdn-Lf0UGATs1A2NCD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX7sTI505EAbD2
 wriwc8oJ69DUFZE284/AfZ1ijxCohdiTs980gM6bn6lfTLK5mQ+KVwg77An9wY4ihn8jL4p6uFW
 E4uWiPbfvFVHzQ6yxO1XylcauD5+K1mR7tUqWArLwJBBAV77wBqz2MXFcVn4m2zoTbTelDTvJH1
 ow2iqK1FFSCBP/JWUxAddQi+6R2PJOPgc5+5dj39Q4s8PepIY45V/a6dwvfYYySZgPgSODXqggR
 WNmwSXVeLnRGiuUIjZiaMeiAMYcbEK6Ofo/R0zeDayv2Gv90grqQ5nfAU2zASRcRJgtGaJH3LT5
 IyE8hA9t7dwDSYl/UERZTBGJ3Z/v+KX7XyOjUTEfi2lBK3D0xaxFcShz8El6pnXqQcExTYuM9EM
 baXCO0MhmjkT09NVrMxaifMopZgNfibgiskdV5TBH1snunWei5HXSZ9sTI2B+8LElzS8y8yzvlT
 cIEtLN+v+Us3GOL4EDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245982

From: Sunil Dora <sunilkumar.dora@windriver.com>

This patch trims the source directory at the string "rustc" before cc
hashes it into the object file names. After the shared source rework the
build no longer runs under rustc-*-src, so the sources that
compiler-builtins generates into OUT_DIR are not trimmed and the build
path ends up in their names.

Replaced by cc-hash-object-names-relative-to-source-roots.patch.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 67 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 2 files changed, 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/repro-issue-fix-with-c=
c-crate-hashmap.patch

diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
deleted file mode 100644
index efb379acb9..0000000000
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-rust: reproducibility issue fix with v1.84
-
-A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
-By the following changes same hash values will be genarted even for diffre=
nt build paths.
-
-Below are the links for detailed bug description & discusssion with upstre=
am rust.
-https://github.com/rust-lang/cc-rs/pull/1277
-
-Upstream-Status: Submitted [https://github.com/rust-lang/cc-rs/pull/1277]
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-diff --git a/vendor/cc-1.2.0/src/command_helpers.rs b/vendor/cc-1.2.0/src/=
command_helpers.rs
-index fe919a5239..2b1f442019 100644
---- a/vendor/cc-1.2.0/src/command_helpers.rs
-+++ b/vendor/cc-1.2.0/src/command_helpers.rs
-@@ -289,6 +289,7 @@
- /// and store them in the output Object.
- pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
-     let mut objects =3D Vec::with_capacity(files.len());
-+    let target_substring =3D ["rustc"];
-     for file in files {
-         let basename =3D file
-             .file_name()
-@@ -309,6 +310,26 @@
-             })?
-             .to_string_lossy();
-
-+        // Function to find the position of the first occurrence of the t=
arget substring
-+        fn find_target_position(s: &str, targets: &[&str]) -> Option<usiz=
e> {
-+            let mut pos =3D None;
-+            for target in targets {
-+                if let Some(index) =3D s.rfind(target) {
-+                    //If a target is found and pos is None, set it
-+                        if pos.is_none() || index < pos.unwrap() {
-+                            pos =3D Some(index);
-+                        }
-+                }
-+            }
-+            pos
-+        }
-+
-+        let filtered_dirname =3D if let Some(pos) =3D find_target_positio=
n(&dirname, &target_substring) {
-+            dirname[pos..].to_string()  //Keep everything from the target=
 substring onwards
-+        }  else {
-+            dirname.to_string()  //If target substring is not found, keep=
 the original dirname
-+        };
-+
-         // Hash the dirname. This should prevent conflicts if we have mul=
tiple
-         // object files with the same filename in different subfolders.
-         let mut hasher =3D hash_map::DefaultHasher::new();
-@@ -326,7 +347,7 @@
-             dirname
-         };
-
--        hasher.write(dirname.as_bytes());
-+        hasher.write(filtered_dirname.as_bytes());
-         let obj =3D dst
-             .join(format!("{:016x}-{}", hasher.finish(), basename))
-             .with_extension("o");
-diff --git a/vendor/cc-1.2.0/.cargo-checksum.json b/vendor/cc-1.2.0/.cargo=
-checksum.json
-index b070eeb322..ba768ff86f 100644
---- a/vendor/cc-1.2.0/.cargo-checksum.json
-+++ b/vendor/cc-1.2.0/.cargo-checksum.json
-@@ -1 +1 @@
--{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"b766a70e39b8ea7bb57afd288bcac205a23f6a26ac561=
9cb1d5b10f70c5dfdea","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
-\ No newline at end of file
-+{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"174101852b2633a2478cef20d063fb9c2f1b092eac479=
13a6e708c85663b8404","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 019e2585e2..28c6d0b1dc 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -3,7 +3,6 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux=
-g.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
-            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch=
;patchdir=3D${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.p=
atch;patchdir=3D${RUSTSRC} \
--=20
2.43.0


