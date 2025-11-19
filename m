Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E04CF3977
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11803.1763570908739221873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IAlKAbLd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJC6IXe318537
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6HO9vHHuMx3psjG/kviqcveXVQ6/PKotJDDaxi51fgs=; b=
	IAlKAbLdGdCKY99wMc1aKnaYSfc23Yq4Iu/gV5dlkShIev67Wb551dHUY3ZPPah1
	Hh71XDFLk1aaRvL4QTwthdZzhivMWdRcRlLnKlsDGU6Bbpzc6yUMeESURi1Hyfa4
	Ed0VehFDP7Hh3Ae5a+6uxme/0jeMm+blD5n2fls7p31rWlGr8Ae0hoq4ntMlrfea
	+SPHcwC2EYbXhs3eICPVBU3QMdzbVdNdi0HcbiWRXxiaSUaCnayHdvvJBTQAU275
	pm6xoJ4fYI+w4mO6bqTfdP/byglfKlcKrD6OHnm6hMUKq0xyl6gwlll3OxN30KNP
	p6WVsHrHrc3B3iexvLITNQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjXatv0/71tko0V4zBMgP74d96Scinr0cvMn20sSRABAgB9gY6vJXU1ozn3s12zTkCJ4JH9L0qIp/DGxJkZQS1HqZJaMXTrHjfUuVZ9BZmRzTtwk7m2v2vVyCtPsYBojo4ctV9UVfRm13fPOmc5lrGiE5BoYG5/5sSrL8PWM52npRim2ievNTkhY/WrmDNomvBFHThMRUoOT2DJhfg5Kz7im5EoPXdefT+dFcDn8Tsx1d+WUjT9aOGlrEuS4Mc+YtiLlE0PcetKf8qhZpAtUDjqgfBt0MT9cuI480XpARzsrc/dcoiMtnL2U117bInjoeS4ceMHR46+CHALf9x335A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HO9vHHuMx3psjG/kviqcveXVQ6/PKotJDDaxi51fgs=;
 b=t7LAqP4q+Nn+1ZT7+TMrROVlVf+qqWBv9bPioNxCLCbS0vZTjtnWjifyK6Is04k5JY1Y1ga08Pam2hSpW2n6LSD4lj4L9CPq9jKjvWW7M0+OxlB0gBMwQ5JMMRQBEZZ0xamq6NoB6DiVgR9dxYGbmuRIqRlYupL6SECGJQdE8SyLBVid7sun9hY5zAxT6H86BA1RnqFdOnZ4RZFAUmn6UTK4B3eqeW5RE+ekz7bqNopTsMhA3hjRXyV9pWnOt48DRl/DEItFN/IWQJuMC6BF237MdFQZtDpgo8oBc2jy5VoElz1+h2+8H+Ej9t6njL13hsBVw3mEmmHrj9nNZphRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 03/11] rust: install Rust library sources for 'make rustavailable' support
Date: Wed, 19 Nov 2025 08:47:55 -0800
Message-ID: <20251119164804.256364-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e68fff-2636-4e61-ea53-08de278b7404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TxMuqM0jcgsy3wX16uhNF++gNm/8OHVxNfGnXSssVQV0MSa+Gce856EkUf+q?=
 =?us-ascii?Q?Ll0GskXqr/zKT6+YpepPVSgGXb3PA9yyf8dM+MSP4Wr+aJ3bgLZ+1JmfrMYE?=
 =?us-ascii?Q?Hwjc08GyM1rPg0Ck+NT2TbfsNOEwZK6GWsoB1Iavi9Sw2jgEtsj9amR1Kl0v?=
 =?us-ascii?Q?pIh2zqSZ151MTsEtlsVrSs2yxDsZXA/k1HEljz4F8dlnDD7hY+p7T8JmoQyd?=
 =?us-ascii?Q?tjYp+Twu5nujdGSaBnotOqzpb7zOp2UN/taZKp0QhxKdBbJ1Boj8FbKN45y9?=
 =?us-ascii?Q?nk7gP0Z+cCgo2vwszV9eJ3CeOZNP4ziEc1EcoTxzYdtjQAFrd3aphApLga+e?=
 =?us-ascii?Q?DmUfQlONSDoLrF6L7SRD0RwH/2NLfJNF18S+Ioql0i+r2pkXcs0zoB6aJxNB?=
 =?us-ascii?Q?GmDFQz045WaPwblCT/U3tb6OBiaXADitV74lXFvmGKV7m/PvYDhC6POdiJah?=
 =?us-ascii?Q?JiyKNHzBV0E8XzV25QrkI1JeJB3XFgqOS6rlcCywcArvWzehYIfb48gYTeM/?=
 =?us-ascii?Q?g+y5I9ZHa1SjQsw+xzT9/4lB9xMaoA1UYpWZsmBgqJ6iwfxjF+mFz0H2iUbC?=
 =?us-ascii?Q?NdezfZsGfL31Lbw7zJrfMEp35CY4GiysKSgSNxUsh1VetTaWYJRSfm/V+eHu?=
 =?us-ascii?Q?zjibtESfzjnoR2z6QfGnLB15ju8SvTQXh+ta3tSlZ16b/nUEp3Ez1+25UtIq?=
 =?us-ascii?Q?Lp1SG3liDzezpDzlg3kWtVociqjJDLqudBV4Np71mJ4pw0p/K8E8mjZpZiTG?=
 =?us-ascii?Q?Smz/HnrK5r2KvuIITiXrV5UI1Iw/IcH9RF1XYFoIdNcLE8HO3BgKQ2BNrkqi?=
 =?us-ascii?Q?eK2DPhhNGKuEoDWiG2ClKeJ8zcZqN4wY7lHTPDD1LCazY0/IxUnDY1NXZPw3?=
 =?us-ascii?Q?K2wgggSr4U/lWQ7XFegiIMkzecUy51cl2wE9ZrDCbBrJO5fVztB5aNcF7hpv?=
 =?us-ascii?Q?QMT21YzyEkI2Q9VDs6HmSNABRbETVm09thrqEZaGH7VGCklca83+ZUaLdSA+?=
 =?us-ascii?Q?Lt6f3uk+IjQ4c2IpAUvIV2rOU/kG26EiFa11wkk2VOHUjFoQznxqjrjyfiEw?=
 =?us-ascii?Q?f6jTFG4ZWKHgPpl13V7Vcp2GQrumq7eBG3IBOiedaYlFEWzwCVPJMKOtt2hU?=
 =?us-ascii?Q?QBF3G4nM2A93zxNV8DMELEc8+tAS/9uq6gKguyB5v1tVCgITRuFbRqYTxevD?=
 =?us-ascii?Q?ncgTx1yECfamwA57Dq+vN+V7q2VaSixTw+IiStxm32U/LLXFDUHDNaYmxVrB?=
 =?us-ascii?Q?V00hiWXCehd625uVe3XWwbEflapISxVfn1Gxm4og+Brmjfl9Cbxkt6R9ZfCz?=
 =?us-ascii?Q?k6n1LBN52W5pKEajzk6YQQrdaJFMaxerVaktUsdQTk5sbO0GzW/PlLURyfEb?=
 =?us-ascii?Q?KKQtvBoGlQk285/Tlhq+BxkZLjvZhD4TqrKSiX71hoe/YH0oAXMmjCNK+nmZ?=
 =?us-ascii?Q?PLpLhtLi85T+HRjRAA0lxCGGDiel0b8e40AFRVmDSUipqdZtaqUg/5nj3n4t?=
 =?us-ascii?Q?H+fnIOSlDUpCk0iLbaue+rPZWhyPLLx3eI3V?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ziBlRy/VUc0L+vlI3FoxFnve83ebQ0F99EnrR/XbLIFA69AI0PEpYXV1djjr?=
 =?us-ascii?Q?n8/fis+O/5DVxK8lKkZGuE/QZFK2MiTGnjSaeBC8A6A3do1LP2y2QYRrxYHP?=
 =?us-ascii?Q?EKMR9c9MgbdfrOjH/ELXM8j63qlBiBC+dK99TSKYTBM7XGTFfYZK2smFF8gL?=
 =?us-ascii?Q?JJ99HSMsklTpUQ2fjL/ar3ZE8AmNUrwqMjb4PzNs31KG7Ds8DvhA0FVdacJu?=
 =?us-ascii?Q?XQLGNskBn8NDwciOwSXluow7wE6psAhJXpMYgH9Vc7ARa+o4NPO7oAmARaNF?=
 =?us-ascii?Q?vJgKRKkb2XNw4IFFraYxBE73z85kvwhYzTTGe4IjUtbo088RMac5hTQvQRAZ?=
 =?us-ascii?Q?zjbJMv6sygrLWM1Ba3gI/P7WVhGPJXPUS0+4TNF+ne8n6pd6d6TrjX8yXtKK?=
 =?us-ascii?Q?BTo1P1pHyXawv/L6bkOCLDwiiqxgnhVkrXRwY8tBaxMdKTrMpzdFkRJQH5mh?=
 =?us-ascii?Q?gxHnRzC8KV+CVng7iDK4kUMlW9sBDqsrVN7a7chxYzV72CCVx8Yhu2tCY7O+?=
 =?us-ascii?Q?jEJ5mI4MRa/ZZjO8m/8pa1NNZFnsJxQp2/4hLmvxKBHwkG7nHhUyNqjaeIgN?=
 =?us-ascii?Q?XI4fyUMUzNF53AsHmE7ODBcNONfWvWIJukCyf1TCIYz1XkIls3HNtQCT2oJp?=
 =?us-ascii?Q?iCY42pOyrccGZxw/AvZTnqbBzRGWIKk8u9gz1VC3ctz/ttZ/8fVG7HWGho9u?=
 =?us-ascii?Q?Lx/pB0OzD8MLvLqpJK8RTx4oXQBjcNx3qxwf45XRpcHGDByAso0u2OUajfgz?=
 =?us-ascii?Q?7lZmzhvXlydtfOv8g+n4VIs4ZRPDbJeUL1TJ43IIbs652tW0CBjg7XrfOllU?=
 =?us-ascii?Q?Nvt7ceEW5JuyrdbgMpOLD7Kz1LxMBCeGtdqZb1nDlXScPrBqgPDLw7MZlp4F?=
 =?us-ascii?Q?tfyxLOF8mJXJjzoKIKW8eePnFUvu4UW7W9x3QX9+AJPcn7c7v5LGcVvBy10e?=
 =?us-ascii?Q?oIr+EbXfqPwQuj+GUK2KBGaXXxA+FWsBkXG7LiakZomDMoFVqFuV81jsXOuu?=
 =?us-ascii?Q?SrPEouvONysOf2GHsduhjFZLZr6j0OVcWSIojAayio2LoiUcoUuqRJR011FR?=
 =?us-ascii?Q?BjrSYI72m8szw4/MaiV0NfMB8xcZ9j0o9UP4lvajVhX4qfIaTmihjf/QB/O2?=
 =?us-ascii?Q?Nrn/4nn75Xkc8eh/zPDXpcW58cEppgelMHYHnYnJLdcTGxBPC/DAFfFeONqX?=
 =?us-ascii?Q?FfuAQ6bak20JqW1xpw67svKyKv6JBJc1GDUQ+lqTK33qig4uWj60GBRLiplW?=
 =?us-ascii?Q?lY2QbuUYAlTgXKcRHv4zpJKI8zlxQOT7V72dXQFvJf6bkdTc1KPF3PaUwG7N?=
 =?us-ascii?Q?zE4EEymm3vYL1zo3Wtzr29PTwWPcAQwDx37pWGxVoKHnotnf+1LIrz12wBNQ?=
 =?us-ascii?Q?lwy7pR2EPgMv0h5O8JN12C4TZUx7gUyUyETR0eEyebKNkEAyubvYe//LIYql?=
 =?us-ascii?Q?CLPgoNUf3oIa7MphIPSggjlgXpAhyQu+APEW5aAAbRtXaJU9uUtlBgkkttpm?=
 =?us-ascii?Q?KT9O0qd2f7dFEvJf+23/KCV1dqgzyhyY+qhGJ76omY3bh7gCdwrDhvFZ2tz7?=
 =?us-ascii?Q?pXhA6q+1lR3LuVtIcoRUgwnp/TbBtrOZLOghpNcJ87fhSjW99CmcYIEK2gkD?=
 =?us-ascii?Q?FmmeTchQiz3L60JKaF5es90=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e68fff-2636-4e61-ea53-08de278b7404
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:23.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhpYqaLqWiiQAQ4DMI2Ujo8tvb2J3D8z2TRMfHYHTO3xU4aANlMNNo+k4NdjaQTGDbVaWvs8ZWQcMAp6JmjwSNnxgL6HCfYBiIHKAVz2NsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfXw46NrX5Lb2D3
 aMqT8Eer0r31vNfkOPEIYGtiYwtw3m65RxpOPcGw06Kxz2kwQ9PwQvqTnQDzEuLm0JcLk90D1Yg
 um179oY2GZLWdeGElyzJWQjz0iKtlT3PSU4g035aXuMMB31qVUukUmYJLC2YX8hJHUpMbLhX5o5
 xGdiqi7zvCvgBfXy48PDsqlP5IBoDPu24k6xmvE8q0tDtoSj3//fuA37lZ/TYsuIHli44H74S5s
 zf6tdFgzjSQxz0+xzbcYsXd/bdq0IgIZJGfYzVd7LR9hK3tTW+HKs3xZskdQQ01CEPU1qPM7fL0
 eX6a4T4aXJeUr99CybjWBlp04pggjhzLvWZPLLcL2v4AOHAX17A8U6wTkNaDr2lx+njR6JUSvzd
 iVlNApwICSIrEO47emcw8pLxhKnERQ==
X-Proofpoint-GUID: kkRhkIyyRzpGSfGjMhJYIZWtkqI8z6q3
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4db cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OoQ9noPLl9ZMKidtF7sb6Oa997VUEH7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226563

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index e7f3985332..f4cd2b923e 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
         done
     fi
 }
+
+do_rust_setup_snapshot:append:class-native () {
+   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
+                mkdir -p ${TMPDIR}/work-shared/rust
+                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+         fi
+   fi
+}
+
 addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
@@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+    
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+           fi
+    fi
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


