Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F6CCD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 12:30:07 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.124])
 by mx.groups.io with SMTP id smtpd.web11.48733.1725453004671364758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 05:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=MbD1agvZ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.124, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/7nS+kZuVUCSU1/GUrmUB98UNCdmWWZTwnHsVC2iLsqG+KPKPV64jS964WRKGTDTwirpo2Mw2pRO8eFbXIb/40QTPV5uGoKqtf8xgHtHjte1+RUzwNq6rlHKYkcVuYoGmHyN/pYJucSA2dxg3r0lnZSzvB49LuJeFz7XTAKBALfZZuIYqpio7I/sm/O2/B8no/ow+o/reU8jE8tFqQ8d2/W2QyvdzFud8zlZ97GpIHejOx9c3duoGEjhxV0JUMpaPljd9pEt6u1glqC6opolN43CNe0ILR+G8PjDXSpbb3UOLwGcQXd0hlpIRlWvKZJpXJysolCl11KBHg2JK7aYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89JCY9+SdNtGK8p9I/HlemGavWZYcABEScgHW8BgwCA=;
 b=YSjK4fBcRwz2D9iXtgIbCXZXniFKlHvbP1UWTKVCj/7d+lJLZkbIEZzTNOmtq4s0dec0gUwSsAWRO52KpXR+Nv2PLVbb9bCkI9S+NuR/y6sRflpAVKbVOq+6k2BJzBBzAL0b/0ToFyja7rF3C+qsHk4HlD35fHZjuoE3mHOAOzQQtrx+VNQoVDmRBgfvrY5eJfoUR3pC7vdS6VFshrdW7Ltfq3d4uEEljoN58xjl1ZKw+fV2uEAzbdTCKtrcCZwwNwUkxgj4T2iN8Be2A0XndSwVODqV8BzaOp8cL3+nIHquKmyt5/O5lsi2r65enXLAtQMtdv7Es/ka06BR2ibmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89JCY9+SdNtGK8p9I/HlemGavWZYcABEScgHW8BgwCA=;
 b=MbD1agvZBdm2Be5dO3bjBGGx71XCAdmDASuvuPDAiutsRAgGl+HQ4/cEwE24Cvk79vEXHz7HAbliAbrmGUvdm7GgAIqrvUsy5xuoQRraH/KOyYzFMe9PKeSBQPGRQKkl0TBo8XIjyuSXAUHcTe3KFYnH4epnhm8mgLxGOn3k0geIE8KgYrCwspwBudYqZM6RUwSbdNJfx1GjuHv5JftdAAOP1SfBwY8Jj5FEG4z5/iNMVL+tyoXcWHi9p5DBwIPc/9QVxTBOMs+Ev/QxSSA8RGORf774edPX9vKm6CgcjOCYJ0mvhGvBKtfAigOIB/TPUtqSjaCTM/F5J8XYHNIkFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB8045.eurprd06.prod.outlook.com (2603:10a6:102:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 12:30:01 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:30:01 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] gcr: Fix LICENSE
Date: Wed,  4 Sep 2024 12:29:46 +0000
Message-ID: <20240904122946.999799-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0100.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::14) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ec4b55-b8ba-4133-cb18-08dcccdd4ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t/mzaof4KiQTvZ7I/PhBBKEFwe7k6rxnB4nfTXuyDticRqJP5/ueIAbn3Epo?=
 =?us-ascii?Q?YXpaS+HQPsckM41oPYRGCb1H4XL2R7PbVszBYIHRnQSBRp39U+VnjdeKTnnS?=
 =?us-ascii?Q?MyDLDYs38UHvLm2CshMIDw72HKSBsmMWypTuiW0AEatPhyzaEZueSp8RP8Rj?=
 =?us-ascii?Q?hoWiuGJbNL0zFD2N6JuLFp7n3c9s+xE37BcP+9Snb/R8ElShxL1ze4s/46eV?=
 =?us-ascii?Q?6YEHyO93BSZrqJJf26YRfgw60Hm7NQQE2gdYb2xHnHlVsubPcU8au25RNClZ?=
 =?us-ascii?Q?kwrKUnwWOdmpmqeNCpxw4DZ2w9i2O93ns5Lu9IokjycHQ426nZzIlGXVmDvx?=
 =?us-ascii?Q?AVunL5ylm4LLBI2PVipeM6WV5IU6ppsmRjJgbjyVeZhHWjR+1R1RtREO5DzN?=
 =?us-ascii?Q?2LGzwgw7b3FRRfc/0FDXQ7KN7i3Sv6lrAbOTtNYv0GxELM6iQVEFoPj1o+2m?=
 =?us-ascii?Q?5UEC5Pv9jIyRz7KqIhH8bC/hxmy095RORSa4cs/driY2fE3WGPyaPszLjliG?=
 =?us-ascii?Q?skb+xbMLt+HQXtb6u6bbGZN/Jx42SP4K+O3T97n4w6uyM7AbBmwcmrPXvL1R?=
 =?us-ascii?Q?DwF8X7vqJ5zcOlgukcYJUfqgr5gQzlx9AXy0g6XD6F+peankAXekL5cCUJ7P?=
 =?us-ascii?Q?IewGje158jTjovMk/7vl+VjaEtO7X4vMLks9MMNZJtr+pYdKHrRyEWrSiJ3V?=
 =?us-ascii?Q?lTy5tkOo4pp4rT/pr+FohnqH/Yq6vULjUmMM2G2c7Veq4aW1JR0q6Guk8VUK?=
 =?us-ascii?Q?QMiByN3cLGV+bm2neK9hO6UL1dXJ9/ypjoPyB9VMfFaIMo72djKUJ0EhYKo/?=
 =?us-ascii?Q?04nJA4xSeLd/SeYtj8VtAX4hKBXz63p4LqfZd5ZhXoctVfT2KKNe/NlPiwob?=
 =?us-ascii?Q?QP3hQzY4sGEJAYL3K9DRNSjU9W6Ic6NNPpzOEHVl0VIQtf295OdQwbS7YPNZ?=
 =?us-ascii?Q?tI9krlvXMNSOZujlU0t8c3gnh2OqeiF5Jas7pdiAnHjl3ZiqBeYJgwRrvg1Z?=
 =?us-ascii?Q?j37nhGzRV9/n2WCtGx2oGRjsqjO6Fqd+FkSxXNBV+KBiHSBZ81YRwqz342gE?=
 =?us-ascii?Q?ZIWR2mPzevKIbCUuh8iKYL53/zghMRiHKOcyp1WPCofpYAMW/Nbgrj6doxo9?=
 =?us-ascii?Q?Ign+QgTQfgy9m9+stIM+P2a6ejS4aoTCwzdYjsr9ga3/89V8m9L3W9tDZfZ0?=
 =?us-ascii?Q?gtPyrSuR3G21Of6IlTT4DLlZgv4LUSoXF9Ut+ubOFHhGkv1RBxBV1esqa4oa?=
 =?us-ascii?Q?4RhZWzybFyNs1QlJ7wRgOkxsMIuMHGpU5AKL6HIrXUM2fXfodw0F8YjWgDqW?=
 =?us-ascii?Q?s+FfKurSrgLEIFQnf/E+ToGCMhSWFxNbYFtLqoPJsve3ERUEbSZCaEyRGNGL?=
 =?us-ascii?Q?pT5Ahpw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E65MSyGs17I5jTlPfp7jVTcX2z8OhjJEA4SYk3BNHdDq/tfpFDnmhLaY+/KN?=
 =?us-ascii?Q?Jh/S9swrgXyQ6DnjeqzNeVubjS0NziHYXpFMhRAUeJhAEVwMWO8GoKu2C1jB?=
 =?us-ascii?Q?lIpPFdJD3tT7SLw5xOzVnhVxOMbcQ5jAMom+cRfKFz2o1gJfrgLWGxYGmD4m?=
 =?us-ascii?Q?tpYP62KJK9KrDSWeeWLeyJMmpfCLy1Vbt7n/xt6yDY6VCaZWF9PXwEn9Ffoi?=
 =?us-ascii?Q?gRx11poRfsqHbkssTggh9y7sOD1ebZZuYO2prPygcNN72I2+i4uBz+q7mGpX?=
 =?us-ascii?Q?ytvFEro6sfICpXhCiFsgSUJYJyNuxqlHw/smKx9Cio8oTkLubgQUg1QpCE9S?=
 =?us-ascii?Q?fQirLUrLFFAMHHhQ5ufUx2MWk3HjyGMs09baFBVWii3ZjiUIovsxUTJ1bqYV?=
 =?us-ascii?Q?TKL3MRdYCnqq9QzZ+UExXeClp6cOR3OQ2BC/qj1irWtQ/IOjZcrNF1CR0/X0?=
 =?us-ascii?Q?5GGkHqpOyt8x7SEEWHWfx1z5qnanP5tX91SI48TXiNlaivoPElIRMWXNrQmR?=
 =?us-ascii?Q?YTshfE+e6//XkBIlppLyyH8dF1kL4nRks/ypXVE3I4YyBFeZlFtEpOVKWET8?=
 =?us-ascii?Q?0ssZTrrOrwJDFMS1Due33bRtnz0bX+9vbmD4qdm5eWAjhU6ygL0BzrCvKLhm?=
 =?us-ascii?Q?NPxS1lIGCmipFtXP8PDjTdOPBHXTjIMx6JcDFLl+IwwtRsTW7Pu+5xatfI5h?=
 =?us-ascii?Q?ezm4bebIW2FITIDe8+4ZhAABEVG5Vi9c1+kN2Rm1YCd4pTVFKSmMi48ufa7n?=
 =?us-ascii?Q?TXS6JIRhpprd62uDHJkFkEV95l1pko/xt3l2aAS9bpLUfz3WSCUz5HXmuFrg?=
 =?us-ascii?Q?izXvLOa+WHxe1sxi+XyVRPbSCK09nhrCqLtilf68G3mgcxFe0TrUHtZneh9U?=
 =?us-ascii?Q?6TDl6zG/aJaELx4+Jw7e/bdl9n9gF0GzwQt+D3DvAPUc71SNQGfKRY04cRW4?=
 =?us-ascii?Q?ow+M8T1s4Ek/V/wAmIo2O63KhRWc2JbiwGyeElHxxMid5grxrJ/Rfh8wBB4v?=
 =?us-ascii?Q?st+EB+t6NAwoR/QAA4CXRwwhLronnVGOuP59ILKDpvFBdRE9bLxIyx8tqtF8?=
 =?us-ascii?Q?MdGgCq3YbujWoiDxevoztctILJe01FDyxqwEJC2nI9nJ1g+FldkO+puEnCF1?=
 =?us-ascii?Q?peY363qrpe+TF5VP/kxsQmnIcRjohpwEdcrmGB77QxJetpiUxQc18FEhtPMf?=
 =?us-ascii?Q?mtp9uQ6cq883cV0cS5tjNjTsMIcm7LEz/XXmvVvT07KfTzGu99kqZw3e9IsM?=
 =?us-ascii?Q?+4R7MQBNH+QA1+wLINzt+YkR0RUgtGsg9naTXCmIMxQA/fwhh/EWQpr+nyj0?=
 =?us-ascii?Q?wproIfEeGbeYxVLFGm+LeelMxKFs9VzfXM4kXKoYW6Y4jIggpCKXvq6vWUk/?=
 =?us-ascii?Q?+5BBc3bNknKk7oM5QGzaYavek4lujvWwYllNehqfE3LwW6oWMTE0KCCRMAQH?=
 =?us-ascii?Q?1uWB6rW5NMBCns8KjVETWrA/07OGQRLKc5NRbWvu/1dvOYNdbOZqu1gaSVSV?=
 =?us-ascii?Q?CdXzqheHEIFDiC/6/slbM8app+EzsF6seHNhKzj19Kd4a0wGthRe84jZ7axs?=
 =?us-ascii?Q?5Bw7GkcdiXGW2gtRlOXerJHavvNIK18foycxkxa59HP9YXL2f8c69btXiOB+?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ec4b55-b8ba-4133-cb18-08dcccdd4ba2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:30:01.0161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OP4JJ9VCpvCNsYNLFUTANn2kVxc3aRVUwQwFNSWsqYwOTd6m6Y5V1SGEe65VhZSHouFU0KGE3BF9A5xaE6WcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 12:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204204

The contents of the COPYING file included in the current source code
package match those of LGPL-2.0 license, which seems to have been the
case since 2011 commit
https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab9bd9914e1=
d5e81fa14

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-gnome/gcr/gcr_4.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/g=
cr_4.3.0.bb
index 50c8cfe8d6..73b36a3dea 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
=20
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc60=
5"
=20
 DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
--=20
2.39.2


