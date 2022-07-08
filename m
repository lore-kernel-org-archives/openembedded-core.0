Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342FEC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 00:48:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2282.1657241316472059496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 17:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nSSAqbde;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41886ecc8e=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2680dQA6028617
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Jul 2022 00:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=l2/+NiD55KJDlTik72gmLXj//7sCKxirYnhVFQa8CO8=;
 b=nSSAqbdeRj/xxcy1fGXhcuOafkhz/fqioHOQeFKrHlysmqgwy6kA7zg89zrGeQ+ejn8d
 lgtmfFJjLnO77V8fnrRS4aSdGnwq4vkvUlORbU5vrSTvI3hCUjsfBT6DeKy7N2Wj9rEA
 hky79jcMa5zRV5LVTrU7REohffp/ZipWSk70uUi+4ri6ynVCCdVywlXAD9M/jafg9rdj
 PxeunxVUrh+i5K+VXH+qB04Nn8ATbdz1usKG5Y20xldmEnaqrIVyVYiHwQLHbSNDl7YU
 7dFz4K4rx/8JdXVXKMJ2J8LqTj5K9DzmSQsn/faOhE/C9+9kVlKyypG+2VI/QWosgDLR 8g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uh0su5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 00:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRgqMCJGObqwKsKz4SXh+cwNc12/OptWagRE242Ck2f6wAsKIs0gwJO7ErvIzrB3C1GsSS/Hg77QOiDj7kVUkGD0pUrJp/jCe0zfkBBzbMB/vR/yIaLtfoGKpzQHrwLe4u2bpHA+4WDnDZhNwYj5wY1TQHUqxCmCeSRKk/nrwo8JUnjmOKtyCTpdSgLk6T2t/60eL+eJaih2K2N5SOsrMUcpdGQc7HPTa7URY+nA/J8yAFHQweyYUuivqQbt2NLZZcTrldit5upslKjrfdxA3CFgbloeJ/RCmkuctVKwMjHHhs/mhA6ebcS0zVvbL6FzDkkAQw9cl/zMzXNqSS14lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2/+NiD55KJDlTik72gmLXj//7sCKxirYnhVFQa8CO8=;
 b=itT5I2NoDK5BsXh7F6W6BNMjbDUI4eYfWUUczzhRs35cdI5p69x9GiwzfebT1ceGE5y/98KPaqawm52dGwXW+TkGC250nzINYmQqD7UB5LFRU/5L8tTpZA+Ib63Ln1BaDQkPU5B6k3SEzmP2IuqaJnk2WHwc+rxdlFAjnpXCrGJLcd2jk8X21vhn8kHr4j22CKkXz1zXaygI2OGyvsd5TRrwGf+YqG3Vd9Wujpl8isvas4xXXaapFLI+dHX2XVunLCXXl1hhMIhYmU9OkpvDa8EMRPv4Z1XJ1IPGehuuOHPrz1rwbEqz92fjoOTTu2VuMcofy8gvXBEtAewkRSPCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by MWHPR11MB1328.namprd11.prod.outlook.com (2603:10b6:300:2b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Fri, 8 Jul
 2022 00:48:33 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::5986:e5e1:9cc8:cdc0]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::5986:e5e1:9cc8:cdc0%7]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 00:48:33 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH] harfbuzz: fix CVE-2022-33068
Date: Fri,  8 Jul 2022 08:48:16 +0800
Message-Id: <20220708004816.2164145-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fde419c5-c207-430a-f058-08da607b957e
X-MS-TrafficTypeDiagnostic: MWHPR11MB1328:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bCX3KWPoE5wnArshvk+jADrO8MYCtj6QVZ0hpd1tpnNOnAS6yrkDdm+rfZmXE3s2j5KclpHiIvOhon+gS5VSVliHD1KkCapjFxL3ueYg4mUEA4NY6SRRNszKsjBJ3waZIgI91FmifK2QlHStpNr221n5inuugwmSnyZ//ITY05J1qhL9y1lRB4pHc1vfdUSPSYoqVB33RxnikR3byJZF/MIGp1F7x7C8Q4fM/1sNPZRCOODVANWnAMUqivUCWAU413zQg8g510nJjN9NmeFmNqUxf80WhnYMPgiRYXDokkckLkay1ocM5ikhzPMLeGwU5fwmpRemmmS/XSQ61MfdS39/h4RedXZZmlC6P+JWpHGMJCGM+h0dw98BUpUu9fQQP+RjALPojptD0SQDNqcyCLCrHbIsFsYvokDT1RnsNYuPYiowug1A2L2FXczF53XcQe9yaJleFRGCdQLO/leVyiG8AumcCvFOZAaLkSbNM+zHg1kgiwUJmOOx/WDo5EMt+Fi9NyXqtQhh/c9JhsjeDKYo+taC9dJopZh65oUa1cBswc+U7htETm4kVD8M044OoRdLDuJLMYgCCPQLHrTGBHlckVPI1WzhSOtsDEjINl7QXbbn9C5su229CdNDMHCn3xf+PctNlLyq+/aXXC1hz1nKoEOZoNjS88wgdJQ9xdxsdqC9i0pKd6ZScHCvKGzxwkX9lDxrMIYKeSkd5Hl3QjiMjDpDJ9U2ExijA41mPj2tbgrJ5mb61Dg88V7y9VKJaQC9mINiq4u1lCei+9fOk8dq1xohZEuf3907C9rQGtTLXSud2QY0MXNbnwbJbhEulVxxTBiemxOnPFhSWgp9yCGAQEjtdOxHbhdjvp7lkiBr1hBbNPjje2jbj3jgt8ZS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(66556008)(83380400001)(6666004)(6916009)(38100700002)(36756003)(38350700002)(41300700001)(2906002)(186003)(1076003)(8676002)(2616005)(6506007)(44832011)(52116002)(8936002)(26005)(86362001)(316002)(478600001)(66476007)(966005)(6486002)(5660300002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EwYkeFeUdMEaBOVT6c/Kutg2NrxDlKLswaUJYMisfY3sR26GvR2e1yolchhd?=
 =?us-ascii?Q?0EsXMBrGZLAtFNn3FMJtOZSnE8BNYbCKacEfXg1Uc2p7iZjf3ppQlIRa5xMf?=
 =?us-ascii?Q?QNjVPO3GD/sXKJq20LF+KjFx61HrnmoWYeHKU9Snk9UkFVDMOScH3wUDY4nY?=
 =?us-ascii?Q?gfiyOgPwTburUToCrEMec8NOsB3CGFrihflxAXEjhoGBOAXXuWfkj2eaVjSb?=
 =?us-ascii?Q?ECGRnlQW3B+QUIp24qd6v2EGn3KHP35Zss5Ze+xTDkChlxZ+wnmlCNtA3Blg?=
 =?us-ascii?Q?nLSCkMTlaKg0u7291LjOnBqwRH/BPFAYAj4+XNe1kXK/augLmEFBR/Exxgfn?=
 =?us-ascii?Q?c/pbl/AjtdoJroYg06ltv+f41YPz+JLkzeEdvLpKZhr4x61A5jYKffha6TyU?=
 =?us-ascii?Q?PMc1dXCr+3W1BCwG/rklkhfHyGb658VeX51W04oDI+1IHOTQ+cjrPGsq562r?=
 =?us-ascii?Q?B83nA4a+T/refHVntzR6Az2nokQoS8g8RAoRdYTfmYcRHOjA6JO9A+Nx6lUC?=
 =?us-ascii?Q?Jx1EVSAaeMyrtcQDUMVEFIFswocwnO9Y2UrqJI/T3QfRwh8XIv+mc9OZnBDC?=
 =?us-ascii?Q?PHvuRUGKbFkJpxdLtWZ0g6kRHd1hhD3zu2N0iSRrSKKxDwCL5v7rEB6CkZAE?=
 =?us-ascii?Q?iqt0WdI6ivLRcltNkRuv2jrDL/e5B9EUbDCMPb45Lm2DioAchIWju9LqcR/y?=
 =?us-ascii?Q?0FreZxeGfQg0GOjgsjCQe301WDsH9MAkhWHHJmqDxzKrwz//J4W80aLD6qlP?=
 =?us-ascii?Q?sDGQHKPQ6mA7JcFn2T3HN7vq9Pl8CeNrXxqZmAR2Jh0gBrjvRfMdy2w/eL6Q?=
 =?us-ascii?Q?i8kkpL4r6xhRRiryvisjqPN56H4J9QWW6aBczzd3C2LkONadFaAGE8Z2mBBt?=
 =?us-ascii?Q?xrqcfMoj25TIlBUlFvB3sR9ScW0TDNMCpwm8aQ2klB9tJTZ3YtxRk2eCxCD1?=
 =?us-ascii?Q?T/X+hi2e0X4P1nDtPvIERX72JEa3ynPXi3UtSrCqJpl7i4Z1p8c4RxeFgUt8?=
 =?us-ascii?Q?DaA4IdAIuuIurvSO6nPzEGa3gnuqkZmrRqB8LhDWDhNkyvaQjJyXuU9Mklq7?=
 =?us-ascii?Q?k7BZmZpPsoomda2wZEhj+Z3ogZXPulHsE6Fnm+jaI699cqbmghaIH7nb+CvI?=
 =?us-ascii?Q?k/wkh+J9Rvm6w4GUJnz/9HvZslfkJmBb22e2JyID2zUp/sZClaQLDqpLU0Sg?=
 =?us-ascii?Q?/cuQeZKFKdUFBIzmpLscv8BPsXeGu1JHsUwQdy5BrpSNKQq3dsU4pK7CxnaH?=
 =?us-ascii?Q?TCCwY260A6POS+o7bi1YwWiRFOpwTcKBrCe+0ZmTaa9M9xdNqnKWplx15Njy?=
 =?us-ascii?Q?rbsge/eBlHQxDlQRBByn558yFoPezmfv/L27qjQhV7/bxSsHkNKg8arQz+1p?=
 =?us-ascii?Q?cYcwRPEu52X+N3zBuG2T8jiZePdgYLj26auUCebTPE7+9vb2k5khx9aM+jaz?=
 =?us-ascii?Q?UmSZQpRK6Nh/PhO0VrpPZ9dE8FAWcoIgIO7XRq4kwz/7mNAQtxp5FABCQIFr?=
 =?us-ascii?Q?A1iR0SzJUUKgP1a9n/DLPldmvljrL5JJtaNtJVLMDMtPuAAix9GvaIW/ZEzG?=
 =?us-ascii?Q?JtBZezSBjmlQyGSm8xvjUn57Hs3Bf3BPjFK6yvvrFvOgvsQDCFnRSvN607WN?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fde419c5-c207-430a-f058-08da607b957e
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 00:48:33.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tFjG3lIIYhtx7mib8V1651nlx67TpHwG9omvoF2LCUnPZVUnnAe8z55I1jR385GtuCpiK60QiVv93THEe6m67/ch2pzVNXEG/Ziv8bivxmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1328
X-Proofpoint-GUID: 2dZW8c46yPFLWTYkT1pPqbU3AOsj2pxl
X-Proofpoint-ORIG-GUID: 2dZW8c46yPFLWTYkT1pPqbU3AOsj2pxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_19,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=979 suspectscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207080001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 00:48:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167813

Backport patch from
https://github.com/harfbuzz/harfbuzz/commit/62e803b36173fd096d7ad460dd1d1db9be542593

The 'tff' file in upstream patch is for testing only which cause error during do_patch so need be dropped.
File test/fuzzing/fonts/sbix-extents.ttf: git binary diffs are not supported.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 .../harfbuzz/harfbuzz/CVE-2022-33068.patch    | 35 +++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
new file mode 100644
index 0000000000..931b9abe1e
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
@@ -0,0 +1,35 @@
+From 62e803b36173fd096d7ad460dd1d1db9be542593 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Jun 2022 07:38:21 -0600
+Subject: [PATCH] [sbix] Limit glyph extents
+
+Fixes https://github.com/harfbuzz/harfbuzz/issues/3557
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/62e803b36173fd096d7ad460dd1d1db9be542593]
+CVE:CVE-2022-33068
+Signed-off-by: Wentao Zhang<Wentao.Zhang@windriver.com>
+
+---
+ src/hb-ot-color-sbix-table.hh | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
+index 9741ebd45..6efae43cd 100644
+--- a/src/hb-ot-color-sbix-table.hh
++++ b/src/hb-ot-color-sbix-table.hh
+@@ -298,6 +298,12 @@ struct sbix
+ 
+       const PNGHeader &png = *blob->as<PNGHeader>();
+ 
++      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
++      {
++	hb_blob_destroy (blob);
++	return false;
++      }
++
+       extents->x_bearing = x_offset;
+       extents->y_bearing = png.IHDR.height + y_offset;
+       extents->width     = png.IHDR.width;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index bf77a5e56c..81518a53ea 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
+           file://CVE-2022-33068.patch"
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.25.1


