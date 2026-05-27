Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C4BCD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19599.1779885875118648608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QDmqmeup;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ki4V2757722
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:44:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t6Mpt3vslh6nfUBydXrcS4rySYYYBGmN68e5MpWLszI=; b=
	QDmqmeupujqhwc2N71pPbQz+Y4OlCQKjm017i9R7kbw9+m8Q+gl49hSHEMZdNzlL
	4aZyxhLloWLnlZfGpmUvhGbTRWOrJQP0gppGnqNH7cOpAd8M3w2gNzorUaC5K/qE
	MitMFJQaTJYkYIBzrE3luApwPjSeGYC1vsaQjmJbjWxapTvl0s9uL8wXb/NP38S/
	Vx/hn5aO2GzySHVIeHDo+qQhekZOSUTrxaR2wPcz+rtIhbsbe35kFnRAvQiK66lp
	i6XAsT4gAswvaIB+NHtmshGCDCUTNPGaeNGGDe2jGTrA59jI2JN4i6cyBaqYsFX6
	vFxcCyTGfG6LsoGkDlw1ig==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrenk0q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjvVhF10A6i0HmMHlXUhM2juBtvUEnDEsk8gT2djCMsCtjws1I2WTX0Hyngl+U3d78acO43ubJUMmYItTfbW0FeSK5VLU70I9ys3oVXf431blC7iNmKEpfHd/xNHmE2ZSgbmr/6L7z7WSBfayQ1D9SttCJG8p9gfJXvhsWOU3MiVOF0FkBZX3K/pR2PDQUMp1QUdy2Zicx7vccaFNXMBPrTrqRGmoUYckn82NE0NS3e90wTjqAw9VsTppJOb567QTsZLQfWHMniL132J8CXyZBYRBHkgJBZCuVtj6F0A2wezHWtgAU4hWn2GETCJUS3KxJowlEnnmBJH6RW5JvJBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6Mpt3vslh6nfUBydXrcS4rySYYYBGmN68e5MpWLszI=;
 b=OxUDBi0NjiuqsV5u9UFANoRddA5u34mAltAiSpS/BmWod3rjg2RbDQ/X0KCqC4wq8D3S6qVS3y0bHDrH5lEw/VZ3fmf4ah6SpH0wHf4dAwVO68JinkzpRKP4rLoTZoHHWt+JaTRANZrXoWETRRiS5q5hAccUcyghywLT1GrnqQsceMj4hmyas21zcYGgmJaM1w/KDTvIKOOg1cwc/CO1RPfQzkmatb8ZdJnsZYoQRusEO8hasqv1ofYn/0oHpd/PXu1LjfPZfafzJFwLh92B4HQQRWZtN5zIvSMuH97LHFV+1bYX6g80CmrSeOPYCg/vRrEBAJqvHql+M1g42FVOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SJ5PPF75B6D7B42.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::835) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 12:44:30 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:30 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 5/7] gcc: i386: fix ICE with -ffloat-store and SSE [PR125308]
Date: Wed, 27 May 2026 05:44:12 -0700
Message-ID: <20260527124414.1728434-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SJ5PPF75B6D7B42:EE_
X-MS-Office365-Filtering-Correlation-Id: 107927ca-4123-45b5-6d76-08debbedb1be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|22082099003|13003099007|18002099003|38350700014|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	wSBahJXlogcqaGPXgaVSRtlj1osQHxYwW4kFIPk/Me7pqVNkL4f6NKCXPPeuED30A++AhZUYAT3y1hOFQCfLUTtDdAVXBgC0V4fI7Do97A2JXwflgwjxLING9qMvnMrwqBIEtdKnFKhfc9rjk+VOvM8t01NhP2Dpaddg8qLsTaVh4oJr717YwjswNPGKoPLTTLVA2N8gG3q5KiQDmRcc3cAQ05Yznnt6JGDxmDbgw0DYQIxWy7Semk+3YRo7tvfttPNy+zJ/5iOk+m6wCCx99XXSNgEV8FzG6Y6EtFIyD91mA8435Jkm3XGHmBqTSwhMronKvBKsa5ZtmyLXnKaywyZMzUZZvQtVyiniajflqJdld1iRvn+hA7AwDr7D0XF+xRNHpXoNnLCRYnAg3fV+nBgAkc/uzZceGqz9tL1+fXGG/6awoRr0wS7Wocv6hTYmMoDKJrbDXK+qunj0pIL1eOFkDpRn5mrGrh2wzAuQedKuTgaoLQtZkMTFMYHiS9xj8PAmvnFk71l6RdS5vu0Y2N0hgQB+oHPOhWt/z8TXQOZEZxArzJJhXI4/9l6g1TAVqOqCQvUxCR4IW2sLoUNQD9TQVOfKA8IWqhghvgeD6y0s4vv2Uypo4x4jg++Sc6buGw9ZhdJakcd7Zt3hRiSV1vRvpqQhKhQzbqy5cG8PlU5UA5blGd3NjN+ZMVGblxNMfgqibOC6kvEna0ozsp5+vQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(22082099003)(13003099007)(18002099003)(38350700014)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W/ZOtaWJ2w6BgjAPypEvVQb8PTu13jXgsg8v534BwILd/0tmi7BirRRSkUP3?=
 =?us-ascii?Q?3ygcDNLRuBzD6Z3BgEKuZk3PHrOovShdLX68PdJQUEMv5RcT1oP1gyU0NSxF?=
 =?us-ascii?Q?El/YPX0ZqE+H4XyMJvlNr0tbvYBLFxQ/y96VoAqipoqsuYhz6Fw91RQS0iIS?=
 =?us-ascii?Q?q7ipvWoLPqO3Tu7rMZSk3uYvk7FaDP55InwcPJhFqKYnmSczv7a9X+NpGef6?=
 =?us-ascii?Q?VUP6T7sgIqvI9B1Pmvt980+QYX8h4m4FdC9aLEG7NZWndzAt/bg+Q4SAd3RE?=
 =?us-ascii?Q?iMG225bMPF8ZXDrHNj5dOecGne0Mxlun3J6FCKwbkTFVnqYrH6F7OaKGbxIP?=
 =?us-ascii?Q?mstDNeeBJyMMKmC6o7Odgo/4/31PVX6yWAt5E+u95Y/bKGmcjHkq4Jdt7QbV?=
 =?us-ascii?Q?baR6SD0UBSheuHSsOM9fhV6Z2RViW4Z15Wa7i38QjxYcNxwpWPESEqqiW6n/?=
 =?us-ascii?Q?8uEBiK2NTvA9N9Rbu9ts7PJ+tXY7EFvgCK4jkGgi0w/ylsro0g+BG/iHtl71?=
 =?us-ascii?Q?SFzSuDam0mGY0Tdt9hPETxvl3rCBJ3B7wcMDpPBSi3QIQjW9oVCuS0i6EjWa?=
 =?us-ascii?Q?KFHUCiC69JCNbJ749n8ThJVshP/n88wAMQDaOyJvnrjT8B2RtiSor4u57LTF?=
 =?us-ascii?Q?+nSwo0iqA2vU5BagzOKOZj6PATHYip5YpU36f2cxOa/JQzefQe5ZdEh5wPC/?=
 =?us-ascii?Q?NwnoGQOXXf286DZOeCEWEJsd06/MFETs2xW0VxvSLfSX0TEdB3yyiUhxSxMR?=
 =?us-ascii?Q?kAwTMKrNJLfWSz+eM5kYVa+9TsjXkxiMo2PWl2O37Cj9E4T6jZaMe/XXuG38?=
 =?us-ascii?Q?PdiC5w2nqqYG/QiyTNZUuZh8tBMjNFM/+uhnjyhoJCJPwCNPxtYH2RhGbdvI?=
 =?us-ascii?Q?JZ9Z8yU39RftJSmfiQ3aqUFfjTiA889V0Cs5pawa5olcMbfZ0XnSFuqWoeij?=
 =?us-ascii?Q?TgsJh6NOGRBSvkV92MP4qEom3mPDbYXAlRgYaN45gOwyJfK2ooCq++wS7Wi9?=
 =?us-ascii?Q?yBi8UDd/wiBlkAktTwptjyhx5KD6KxDQ6R9PX1CfTQUD+nE4/q4l1/KBWLtv?=
 =?us-ascii?Q?rdeiXGli2tbyxCAue1PFnaHpFYV/9WQ8RFGKvMdUP5TThsSRPbRLjS4F8+SF?=
 =?us-ascii?Q?qNMas1+z/9n+P5iZUHfG2OwGOZfmwB/HXPrh/1ccTF9jfJntZMTnu5oZ028o?=
 =?us-ascii?Q?+u3XyXjTFH3w1CsZCvAJn5gGNsGB0RMgv8y/yIrH2wET10rN1IXSCr7bbBi9?=
 =?us-ascii?Q?Or5DhFNRUcrDw6b75TAr7q7NX+mVqlhy3A2gVK4+vfU8SVXlXznEOG9cmPci?=
 =?us-ascii?Q?49hhmadtIoVlQxM85G/UYJqNGvW+bt0isTbrVYp/W7xaV/eQYjAeil7lUCzi?=
 =?us-ascii?Q?ivQtZ3ZfzmEanCW69yxqcuvjbDcx1xIpYJz0UBFMF0lbO/minDgHSRxKoSp/?=
 =?us-ascii?Q?jYKxoHJKaNj0fcQee3j05ExzS110v+Hpr82a6vugqc41i8L708erhzO3Rp8+?=
 =?us-ascii?Q?dpCq9+4H0g+P5xO2qwedvPlxMo2zH42jVLi4kMVuhNY9mmr38bzxPmKyyq+C?=
 =?us-ascii?Q?SW+HOUbr5guUYc3MrKOiZVotSLR+vYQz42k1NMpt/B9S+5Fr0Roh3ehbFWeA?=
 =?us-ascii?Q?nhxTGaFhFkN7TzlQMEAJByu2Hsor8zR6r//1ZaR7r3nuRCcDj81WPuIXG6HN?=
 =?us-ascii?Q?6Tkd3yUvc+/egFAQJ//pW7/OpnMFxgKSecFpKpXhwJRxYey+kanl5ARYTROd?=
 =?us-ascii?Q?u+3LhjKn5pv4hqOzAVtKUnd5lQMxDO0=3D?=
X-Exchange-RoutingPolicyChecked: 
	mQSrEW/jFO9qf35FHYuHtpRoVwRuxK+vPPszO6q4PNGPKCdVSi6HSUHmqyDIzDJ050KSBVw+eetDoG82I/a1HFS2kTDGQHXWUi5LHC0BosEbFb/23nvWCG9GIylKK15ZZa7WxWJYE4q4T2q8xYvZK8Afe+Vq2Rv/TuZwWCfGoPsmulaXZv1oTyevKbJU7J8JE35wgmVQrtZa8iE5vlmR/21+w2BhK70WlpOImSuZI00t6x5JElCvltrrMD/2WhGH7R2mH2q3PSvLg5xG+qS6+/fCPFLdmE7utYz/6ax15DFnQ+gvFAilYrJqAhMrAaXeY21atmUSpKmn6DtPuHaCfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107927ca-4123-45b5-6d76-08debbedb1be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:29.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOVLlrSyhixNNhsu9jdkkRbl40Qxiy5yVNWG2D/w8KdmGqsS0nsCrBDf3zL9WbzGJMUQphmaD+jO4rMWRxgyL26ha/+t3pkU/4K/NdUFqX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75B6D7B42
X-Proofpoint-GUID: 7NIWDIm79nVSgalSLvqOkEzNrAmxn7Hg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyNCBTYWx0ZWRfX755UcnTlZqSB
 hPst/fnR2kHnDOc/0ugMAOrI6IGzZO+t7ppRNyVke+3Qtdk7lhz9hGWduB/PocJfr6gwss3RzRS
 ycoM6xidW+hRoFpYd4kodjzWuggzTBk4ucEfk2PCCFMzAwKaOcG+maokMh0WIA+FW1LaxVlEo+A
 uHLQyLH4AOSGuo1hx5HTB8qwSxlmN2XF+uzNk1wROBD08pwwJVrZywAzpJJXzX4JAoIwVR305RK
 7ecucZ/KW9L2Z9oDv1kxuzHotRApyWvIaRz3O0Ec1dKPzX0S8Dhbv4HOzAwmMwmSDjCF2F+B+Xt
 2USdJKpHzrYae77j7UKLXGFjn5iZ7zAfj9MRFYKpVRapdUK/A0eAKaHAsOeed0iWCgD+nKrIEUW
 HUJc2cxcJvpdqBZjXpE/4S4wa6RJ+hfGUMFixbu2oNhs8nAsI9uGRKQpcINAU1O22ziADdjl9yF
 k7mpEbS8/iZo8lpGSuw==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a16e732 cx=c_pps
 a=VB8Rg5rwfRosJW56o453OA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=CUwP28Ib14oBlIJf2_AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7NIWDIm79nVSgalSLvqOkEzNrAmxn7Hg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237653

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Backport upstream commit c96589414eeb0e46d9fe9cc1d562e048230b5f67
to fix an ICE on i386 seen while building piglit with GCC 16.
The failure happens during the IRA pass in extract_insn() when
handling UNSPEC_IEEE_MAX patterns generated with -ffloat-store
and SSE enabled.

Link: https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.1.inc        |  1 +
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
index 3a96228631..4598aff045 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+           file://0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
new file mode 100644
index 0000000000..7ef8660ae0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
@@ -0,0 +1,85 @@
+From c96589414eeb0e46d9fe9cc1d562e048230b5f67 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 15 May 2026 09:55:40 +0200
+Subject: [PATCH] i386: Fix up *minmax<mode>3_4 [PR125308]
+
+IEEE min/max are not commutative and in the pattern
+(define_insn "ieee_<ieee_maxmin><mode>3<mask_name><round_saeonly_name>"
+  [(set (match_operand:VFH 0 "register_operand" "=x,v")
+        (unspec:VFH
+          [(match_operand:VFH 1 "register_operand" "0,v")
+           (match_operand:VFH 2 "<round_saeonly_nimm_predicate>" "xBm,<round_saeonly_constraint>")]
+          IEEE_MAXMIN))]
+the first operand is a register and only the second one is register/memory.
+Now, the *minmax<mode>3_3 define_insn_and_split does
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, tmp, operands[2]);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+where operands[3] is the const0_operand, so operands[2] can there be
+a memory, but in the *minmax<mode>3_4 case
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, operands[2], tmp);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+operands[2] goes into the operand which must be a REG, so it
+is incorrect to split it into something that won't work.
+Now, I've tried both disabling the define_insn_and_split and
+the following patch, the former to the latter results in
+        movaps  a, %xmm0
+        pxor    %xmm1, %xmm1
+-       cmpltps %xmm0, %xmm1
+-       andps   %xmm1, %xmm0
++       maxps   %xmm1, %xmm0
+        movaps  %xmm0, a
+        ret
+on the testcase, so I think it is better to match it and force_reg
+(it is a pre-reload splitter) than change "nonimmediate_operand"
+to "register_operand" because it won't match in that case.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67]
+2026-05-15  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/125308
+	* config/i386/sse.md (*minmax<mode>3_4): Force also
+	operands[2] into a REG.
+
+	* gcc.target/i386/pr125308.c: New test.
+---
+ gcc/config/i386/sse.md                   |  2 +-
+ gcc/testsuite/gcc.target/i386/pr125308.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/pr125308.c
+
+diff --git a/gcc/config/i386/sse.md b/gcc/config/i386/sse.md
+index 51d1e9b455a0..de092f4b9ae1 100644
+--- a/gcc/config/i386/sse.md
++++ b/gcc/config/i386/sse.md
+@@ -3468,7 +3468,7 @@
+      u = UNSPEC_IEEE_MAX;
+ 
+    rtx tmp = force_reg (<MODE>mode, operands[3]);
+-   rtvec v = gen_rtvec (2, operands[2], tmp);
++   rtvec v = gen_rtvec (2, force_reg (<MODE>mode, operands[2]), tmp);
+    operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+  })
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/pr125308.c b/gcc/testsuite/gcc.target/i386/pr125308.c
+new file mode 100644
+index 000000000000..0a4dd7c8ea6f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/pr125308.c
+@@ -0,0 +1,12 @@
++/* PR target/125308 */
++/* { dg-do compile } */
++/* { dg-options "-msse2 -O2 -ffloat-store" } */
++
++float a[4];
++
++void
++foo ()
++{
++  for (int i = 0; i < 4; i++)
++    a[i] = a[i] > 0 ? a[i] : 0;
++}
+-- 
+2.43.7
+
-- 
2.49.0


