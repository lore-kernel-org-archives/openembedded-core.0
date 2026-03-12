Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40714106ACC9
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25486.1773331891521486135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LXts70qw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9XEm6008800
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8HZQzy4XNOeQ7N2tsn01YN9BYHkyUN3KPgZAirZO2q0=; b=
	LXts70qwz7rrLUAY6Jj3gDBpZIyGxzgxCXNokY2m9TFzxMax//UjhM8DLo4k0oOk
	pPSLKepDVUEPnXKZHVAg9EwfWnq5q5slS/AOukxsN+R392B5cNhDM3yWU3nEmIpg
	JmiC4S9PPkL/lubWFoKPkgaXdD7o+rRWRH+8gNugaWT5CGBVHGpy3lNyjao3XBEZ
	e5pkq5uTD13aM9hW7qCY8I78v92Fm5b8Q/nnSEM2x/c8lNPHBoIRp27bJ0FQ4CfL
	Hq7nyze2COwdFhAe6ZOpMmCXiutpC/ku5NVycabahy+WWpjKj9f/Ar6GLNUPOPFd
	dirWrnvsYI3yqBAUEfynXA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqrewh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PupVRiLN6ECTkEnQID1em8QEJkDAGKdpaXR6dPeFeK+DwMZ3/qRIHnum7/kOFZSXif1qm5Oq31ncrQLWeKk2F4yNXNhOSmkLkExdfp7Dj2WiKuMLUJYzconMm6gf7M9Y67p7h9p/SNJoJbnirrrlkMc/CMxXwai5TnwR7liHFCoevr7UDZIc0M3gzeopRjHsfhHZECh/mk8wj7xs/WYg1+mjcEm7snh1LonTwr4KcGiMFAdXj1aIBrpLpdP5gP/tZE83Jo46w+mtvWrKSFg6t+UlQ5sDN/W+dUO9kHf4nWTteej4FQCpxSwXnGah3rBRfAVmVTTi8JUxM1pbZnUcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HZQzy4XNOeQ7N2tsn01YN9BYHkyUN3KPgZAirZO2q0=;
 b=dsEGbEMvgNQk1cklRnLqA6SWGfiiurWhxrPhcVOXgV71pPx9i7FJS2sGcqR3pyQe33v50n+lT5Xds69OJSAM4nUBpnmrx23RSwkFiONcnrMI0YeOTr4AA8/e+DLBGnAaSnvO4foISVjasS19Z2rXxp9tkm4M6kttOJU0Vt+uVhAAx7++kTqySnvY+k+pdnwcvwYOqVMfUVfT+HfytPV1GHRh4DQ19P82J94Jk5zSMRqd/yCQepUk3dphvIW4eygxD3BLfzG4NMHDhe9KQ6IYS4x4trEkbjrZRNjxUTqxij1vNOw2+Tq/L5t2G1S5bMLmjUiLmL0dbG+5OwowYkgxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:24 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:24 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 4/8] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Thu, 12 Mar 2026 09:10:19 -0700
Message-ID: <20260312161038.2578649-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a3ae87-f561-431b-36a4-08de805201bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	w5EL3SVhwnJ6o0E1YoTy1xnYbHcdeHFWB3XYzgO0WAOsuhNW0yqCkymmGk4n3eQbW+cElqHhgBNidp2r2NrcZMwYSHdoWrbpMrcbzbjGLKuM37bB9D505YUHX9R4roIHVeQVZ2i1/PYOIw7Yfc4bsaK7/ZUxvcxJyraXK5NpdK5QcQu/YKHw+zJGh5Xs+p3U5fAy29+jr3W+UlHHhTnqXks2yHTHzwRAUguT7XhzJPwDMF7HPZ265LTbOvfLulg5q7o1ZYzsrABG02QNdZQkDrNpaNXHq6My4vHfNez6gDCbtVqXU2Qj/t/X0p4TPEqIowOPsc4zthgRAZrBp73B5m2irxFzB7CO/laofFD1lSG5j05hYcaBHQVQGS+h2lcdB5XWZau3lW+klJHIoSC55cv9Y6xTg9wiQK2J+SfU/YWBapW46yjDH3BOPoJtHM9pg29FHL94TacA2cx5ngYVQgqGLVQ3ag5lbrMVEi7hts+asLD7bojYycm0XfpvRNDmdXBodLllc+Euh7dZkhbVyNTR8OP3XovCbsOU8pkg2fyFcB8k9sw2T2ORgEG+W2c3N9m9Y4TSJm22rPCer1f9/JPXZvkdf9NUnui4RZ5fUBmR8NAy9g75ds4QooirDeT+ToOqTNK4LmStT8sctYHcfLwv4ImqPXfs8QliQvKNo56W8JKkP/xToFVOQLX0dD2m6ZruKcQHgrwfMF7of3HaFPfE+xxzHn7BZ+tmvFmE8RKrdGavEUYuGQEB17RAfct6HoBlgPVgttnhDgQYdWmCYHWllZXouVnFxQR5GtEBbOU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aVjhwHN2+6PNP/8zLqVqa+P9lvCNCfdtFxT3RD63CmK87oADjljT32QURG/h?=
 =?us-ascii?Q?frJ7rHF3shTmXHlhBeMYEC9mAOhu9prrIuMjNHFNhDDTd2PfJUCzvDA0wVv5?=
 =?us-ascii?Q?W32N3Y6vwrh3Sv3k53UyAGMaaxZUMv4dMGPBVzZJc+KevJC05AYMdwHtVYvD?=
 =?us-ascii?Q?O0Xqf6O3/3zdfB/JvvDc91gfJ+IEnjl9Y0jjNEEszLWDBrKT8fAZJDqIjbSJ?=
 =?us-ascii?Q?FBDd1msDEOfZgh0gEdl7L8wKDyfdCbHLn9CcjA5eu8ucrMJ/LfNVT8HrBDiW?=
 =?us-ascii?Q?gddgLsFxtWL6YS+c+SHeuxZW8o66TMH+gPpqmUR5JH0chGa9i+yWxEY050e+?=
 =?us-ascii?Q?usT7v/S7K4TNsNyfAz8vSbggsx7t/xwUj70GFKP78xdvE38SwebL+rmHcapm?=
 =?us-ascii?Q?nehhd+i6QekS7FLoTAvB7BcRXbkWca3BG8kYUKAx7bWxGcbTIdhxePSkzHiy?=
 =?us-ascii?Q?9/oYulm1fgNJWaFlRYjJ9lLJ+76HrhRwax/pzin7SjjAO4bykRM5A3ayFgUo?=
 =?us-ascii?Q?uCQpIgiTglPZudsPaYjGh9uhABZcY9I+gwNpR4wYuTedPd1sfUYbdZXKaS7X?=
 =?us-ascii?Q?dIvkaVXe2V4vuXepx6zY2O1qb6B8F4ixN4Kd8RjOjn6+A01qmTbilVdSvOf7?=
 =?us-ascii?Q?hJA8XCeqyuKikQObl8JmpjAgwNcsP8uVUwOaulQbAl/xq0KMYWSKv+OWwCO2?=
 =?us-ascii?Q?UMkahn563jt+fOF+Vj3jP2pvZYUPZWRZnw1HamZN3nMsZazETd2I24tqS5/o?=
 =?us-ascii?Q?jGkmc4OyoArosZDIXmgretCrttQVry4HEt4Jb3hvHAGRtOQRbW1j49MMLZiE?=
 =?us-ascii?Q?OWZNGyAJWjaCT4Jxbix9t7vw07Z1wdEqdJmPS3UiqIrY+EJV7KJPKp6WwxkE?=
 =?us-ascii?Q?SDteo7UKRnOOa9SIwsgG7bu7AiiSMF6XYF+tkWIedt3B4aZqQWYaFQiuRFQT?=
 =?us-ascii?Q?zBktLrKORJVwu8jQl805X8nVXw8u3XlFTE7x+QeIPEGJdWTnTAmK2YznUCHd?=
 =?us-ascii?Q?dqeYTfNC/xjh0FJTRgvZ6z3fZ4Nract+sxmAGG4c2qb9+BZ7OboCwJrUCBoS?=
 =?us-ascii?Q?lN0Nk9CVEinHRHViz8rsAjATgIO/GLDC438TevDkVZ0mrVdbQb/Y87VxJFMq?=
 =?us-ascii?Q?DRyozPIyrWFMEki0VnzwLv0FHO29jKu+Q6zuMb41/npya99kBf1je/maIDIa?=
 =?us-ascii?Q?9hnTLy3I9PB5J571sUD14CHr4vjJ63D3i7ovLpIPuZ38as8gC70wkpdBHTxv?=
 =?us-ascii?Q?GlzyUCMIWBB6BsXVZ2koFDnj8CopE24tBUInhHgdCWPBxmChgzneEsgYVVsQ?=
 =?us-ascii?Q?Bj2F1SUWl6WdBwFEOowtJs7vdBUQWjFoSFsQ3RjDcEosW6m8lnxjq8MlJmbZ?=
 =?us-ascii?Q?Vq1x1Oh1ndehUvS3XqmPOgGwOMwFrFJIpShYZSXnl+pkX9NcElzLV/pKsSB5?=
 =?us-ascii?Q?yS3iiNDSZpx7Zp20UJRgwmpegh8oe7+ic+QN/goHfiUNQffo9pSKsNF7sbyd?=
 =?us-ascii?Q?WlysyasN09qZHD10/aDmPmr6EMOck/Qm8i2L5lSJyEIEXmiEJ8CENhDa3vd2?=
 =?us-ascii?Q?Qw7d/ucw64MsflgEU5Pr8pJdxyfmfScikFvH9Lx4FshskoxYz3X4YBQuGeya?=
 =?us-ascii?Q?/3Oezf5m6LAxXRT6mVCjncB6ZLr/pFXERwMO7FfhZXdgrj47C0IIiWuUaHQ1?=
 =?us-ascii?Q?v8rYiLqshaqGhnkm465Gc9ofrYNhPLgfW8ycLqhpiyQRoNHNX29w3M8pJD/F?=
 =?us-ascii?Q?L1yvk6gDVUg9hfyq83pdki01NbaedTk=3D?=
X-Exchange-RoutingPolicyChecked: 
	n1mTuS/L17Kr29mQ2V7hTwvWWFPOIUboxgmB/SLztCCZGP33sccfKkZ0rmsc8JaBAVt0GouPUGtM71+zKtQNZohp4dtYkg4mtCjVD/ikVumCD7kuD/YBJPiRku1PhFqZKcZ7GAfhh37Pf0wmSBAup9krd6KbGVEyUv9Me4H4KFersCbOauLoC2acLFqvLX2vTJ4+Rojt+aop6ku06/9rspKAq1v9na16rVbygmEO2wApFJpnvWC1IM6OhTOtrwBT7/flgTbJhdc3LGGTV4vPnVDV8ivFyjmgqbH6yvvlu+MdEWBLkrcgG7vstf45iEVHSgb1C3HaLGVM4IMiWojepg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a3ae87-f561-431b-36a4-08de805201bc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:24.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bw9GuerwsbT1Ym5X3xDdac9qgyaCdhsznOFL6hsaXPipawXudK5kJ65E5pRBKlge6j5hKDN7u8vpFqlG4wEnx7Gu8JPuEuGxiMPzlot8TC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Proofpoint-ORIG-GUID: 5U_2Ga0fC376OSVlr82KTVV-6WTmVCF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfX0DqHgDJ2vblT
 L2DonFNqyM5lycLY6U6W9Du6G5bfVVkbjodkimdBPZ45ZdycoppjKVipiYv28VM4eo4GimRheMH
 9duWuJqGUagat3f/3omnJUGrn7rMdTKebhleLRbds14vOStTyhYVr7g7hkXzMGTCPg0WnAy+CIN
 7BnrZkC/E1A4PeRaVvX17uInvYvhjOYaTTmHsar6CCzyDBmBql33cPM+8/oow8JWrT11joMCSHR
 p0ayrPTkvMvDVl4th72Zz5uLl2fF1jJFoL/5O1rMRGLz6CwrTOlpzNwY0vkZeRL6z/GLnAzcZ9P
 4wa+75rnxDG8yqnOS+lCQWPSs6q8+sn6VICIJJf90pW5C35ZvqIm9C7nGetc314xTWUcroIrJhS
 bv2VtYk6tublRK46vXYzNMTBDsDIjhj2tHNaoMHOEdrTB0XMlHMJRAtZ/uyvdHAgqeubGzmfwkt
 RNzEqPeqAlDrfFJNgNg==
X-Proofpoint-GUID: 5U_2Ga0fC376OSVlr82KTVV-6WTmVCF7
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2e5b2 cx=c_pps
 a=bC5vtrucsabJqGOS5glf1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=tMzWTzsgICAPQ4D7orcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232990

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9aed0b9d81..c9cd5e6ef4 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,6 +17,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
-- 
2.49.0


