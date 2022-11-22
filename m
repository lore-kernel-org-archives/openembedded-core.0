Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC05C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:38:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22264.1669131494211284964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e20Y9yn8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8325ca1ee6=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMCREO9004602
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:38:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=sHRwinWKynq+ef6QPQMtrGca+p2A40huOfoeORhrkq8=;
 b=e20Y9yn8pcCZjKNsHdj6MV30QDd19o39WuC+GcVeolwQHTZZDndF+5VXBpOqrsKO/o7N
 V93oZFSghx0/aXS1MALEK0N/QTkiulfAJkK08EVgaAckBV70S+Bn8GkNpMPkOvXd/lYR
 olat7Uq1l/eaD7olrPQSNOO98avCqBA4ZjwWHAh9b9B/WOf9kq125goebgKZJRS2ebFo
 w03aeRNdgusb8oi0O3rrn7+XunkTHckxKCJjmakjDC85UnjZVN6+CEGAgkQqmzpfMxN7
 Z1PtKFR09FJq4INl7y2n0AJPH0OksrYTcEgWLaqEoA5taOqNQ4F8T/Z3x4BaJfF4hJVP Cg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqad95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:38:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFzxdjsv0TLkspUN6ORLID6alHf8OB1trbGHT3dpmN0ZYYsmVIV/UUUeUDBS05OLcFUQwLsQ8fBog0XQAUJVXyc7XpOW/2Iz0xqgKrSirUMh8+iiW6vDLVQI3EOTYyEtNDHdXv/J/hsyiZyf7vT2TJcVbgiyohkqD72x5bF4sXlsXp5N/GRinbRkCW/rK4o8AAXLmTv+TJQZRKa6iq2t8PaBDr6fzdbEdm5KdzU8K1CIlb2XY5JTnzZfptJOYzJylWqvBdeddLeArRqZbSITNWat774EDZ5IsdWuZwYLbP4CR0QjNQeEAuvaN/CJZh8HwTVoZE3tBHYe1Pfxwg+I/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHRwinWKynq+ef6QPQMtrGca+p2A40huOfoeORhrkq8=;
 b=CaZQBgE0wH13GkQ/TxifN5lOUmjCy6E7KfekxUw1jvyq6kup3HwcGMnTScqi7h2ehKjmYZ9brCHYpABpZyRVld3mWrKyd+5uXngvwekg8n6nzp/1NW29EqcSMO5UzwULcsxgSG25dgh/uha0z3X4vxnpMJsO0YK9mZz4MQxv6yzg6AAO7Jx4+BVaMB5fdnXSd0FfKA6FlrTID6h3iJZjmkvhqWk5NA61f6w8Keb7lPmkvMSvQLADiE5RWrzfrfMm67+SLcgAIQyyohLF0RjUJqFZ1kRK9k4DsqJLI72BKfHiDVwcMghaPXlMWC5FHhU8vuIoRDby6ExWz+9Bb7SJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:38:11 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98%9]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:38:11 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH] tiff: Security fix for CVE-2022-3970
Date: Tue, 22 Nov 2022 10:37:57 -0500
Message-Id: <20221122153757.2287659-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::16) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db8b339-7465-4f0a-6b2e-08dacc9f8ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+pD9iFLtgSCecZ0RRTm7nPyji29eRrAuMBc4JdEsMj8ZkMp/KW9+gpO0RcqE+FoviImiLsxSTKCp6hqc1WxLaklNkRGfHXAXl/DLOhdAkPbE+1FTeZOJYlbF+v8UsGqFyUuxKyDFWOpdfZWj063P8vTYxe0RfRsmONdzylEZyIpxC/kcy6COe4mKqRWU45lgpP+hnS2FNZMXgRvUfzbv4yC79sTfPGNEqFztxH3jD6kyHJIERj2ioAmiI1iXt69dRAztapLdyQArG85gKqAGA0bTf/lksMVqB+nqaQJlm6LJcjBOJhKH0i675jy57rVNZUs2sA20UDQ1RcxgH2b4pr9pGydq7U3bctIzhw0N9Luf0cg7vfZ2G5zrTAD7OBdqYEeHP0aHOc1Ir9mD4RpleXOEXNmqmtFgd9cswlxv+0XSYi1nNEqtLXW95PT4HenE1Fmg9lKGOT4CGEhBmSKGOSm4eenkAm+Nht7i2hV2kxWTS2N/P5PWow9cMV3tP1swri2bJIToeEUydMKuT26reuc+qbXsgqR9FsmHvZPprGrZ3FeuZv2RX1jH3ndH848sdmO8fkw9ULWzrYJB+4KlBKyF0uiMVJ7IUXTi+zPNDxtKYxhnQMNDVMadWv+xCEpdwJhNcrTDszVI4Lbz49PlagEP9suLnWXUz9SPjs6j2BRQw9uQajnP8msAJ3k+nVZ2XPie277sFbY5XBd4X+Y5WIGlsGPUdYYkGoNnt74IUKGyJPsXjZ66nAGTcqzuiS0lDUIMKpIBuDOAM75lBo5FOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(451199015)(86362001)(36756003)(186003)(66946007)(38100700002)(52116002)(6916009)(41300700001)(2616005)(1076003)(66476007)(15650500001)(8676002)(44832011)(5660300002)(8936002)(4326008)(6666004)(478600001)(966005)(107886003)(6486002)(26005)(6512007)(316002)(38350700002)(66556008)(83380400001)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZqXYiywECgYvNTBgAiPXOoe32hyDVpBXO2EjXhOJQSKeLDL7aoPe75Tad9ds?=
 =?us-ascii?Q?m1LP8a8PY1G1DRfTcg5Hmg6P72FuvWFROabN3Tj4dIJBuA3sFJ0YrBAyWW/H?=
 =?us-ascii?Q?EBiS80iQxikiA2nq4mhuah/noSDYa4quDG+nCyeVm6TIkW0L1JOQC+srtyop?=
 =?us-ascii?Q?SiPOTHjqdZgq9L9xeLLpQvSWNpV1Axwqje2iUdxmJSGbBL9Q7CBTZ1wwTVye?=
 =?us-ascii?Q?yqzDBIL/HE6AxZT57SyD+MGxNQQTumCa3WlCStVBYPCyTKzXWIl5fQ0+uALL?=
 =?us-ascii?Q?PllarEMxJbhyDyZ/+XKFRi8rX4bxtUO248OuQwxmpebOi81pxrKk9UqniLgx?=
 =?us-ascii?Q?69VnBMyzmlETkRRLavPGPIxLHCs/QHKl61vtKUtUxSZJYeLnLMaTZLP8s+WK?=
 =?us-ascii?Q?cDwKgamuEIUUxa9LD+xSWR8cot3keuPXV+P5TfUpELBtkgJlSiKA0qnpGhue?=
 =?us-ascii?Q?s3qMz0IJ4/bWk1IRK0FgV89Y6iJITgwEN9kO6vKpd9Lw58yJ/fp90rStt/kc?=
 =?us-ascii?Q?jMLhMBRZN1F6lQeeVmw4ZrjaF4VQoYeAitfR/9hb+HX/tUeA3G7HZqP/EVJG?=
 =?us-ascii?Q?CGSt9d0yEjnqxEcx5DWbgqi2jsNjMgcUCvIXrRlAkWdnA2E1T9NRJh+sKp5k?=
 =?us-ascii?Q?DifQ+ZjYmEm2T/iX3uu6Pcqj1bMTSY4Q64oFhwXx8A95ETLxfDCVnOi1VvGZ?=
 =?us-ascii?Q?/WkdXc9VFNGltpV3/LDH+lRIBrCwT/cSQ1TC0Wj9El8/diO0TwY1v6NzuQm4?=
 =?us-ascii?Q?kAck9X4k5qd2WlxbcGbTdnLGc4asPPV4otYsfi0ywhQT2AthapKUp1RGsZMN?=
 =?us-ascii?Q?DuqpZzzoxOfdUdQdRd0Tndtzv/NDeeDEzhEFqJwJkMMI6vXOjzt16lFySDvI?=
 =?us-ascii?Q?TCUaWYu5P636n5dgoaG+KuUEsDUyfJQ+IWP6ERjziDmlSAwz4dsK8PWntWK+?=
 =?us-ascii?Q?HnjBqWljj7MwmJ/2ikSoLJk4PZgnoNLYcLLJZiZmDtrnHnGVlkacxu+GfBVS?=
 =?us-ascii?Q?zOTAewzU8r+OAl9OoN1x/hEQY6T53xQCY0lfpDOa4YiEWTXIDKEcKoxsYKwJ?=
 =?us-ascii?Q?nMQbtNRCSo3y/pASR65KbncRfm5KC9rWBPQoAJ8PK3S29hkOzxe/Y/Vj2Nzg?=
 =?us-ascii?Q?RVeHYOxwarCUBI7aNjfDqq6lEnYAVhzyWHZOb4N3O+L5Opknmv5v499YVcPy?=
 =?us-ascii?Q?2QNsoTXEYRcnZguw1Kx9eM16edoUYsB5lpdB0i+7XawN2Uqf6HTKzBBjmnpy?=
 =?us-ascii?Q?8kHxh7GYzFW7fv5RKy1UjzbFm8GvgDBmPqRba5t8QOTpIF6R3TS6RLnF0Jep?=
 =?us-ascii?Q?IDMwCUfx32ukN4iisRWo50itMTtVPDxN/TuM44H6e2Je0atYT5DaCFBkF5a6?=
 =?us-ascii?Q?Es1EHtwJinRiQdZ+9Z0x+oC6f5200eNHtDZaSshoI0grN6fQeuD0b5xt6XSx?=
 =?us-ascii?Q?fY6M7qgThtmuBFr0/M8TzM+r2FBsQGHgL/qeYqiBKwk0GrizsYO55PIDYWI2?=
 =?us-ascii?Q?ZN5cBs32Yv/eFhnENkAUzvDd9mRyzkLtxlmGWZIY914Y3iUH9nFR8U7xH6iU?=
 =?us-ascii?Q?H2gk0D5wE1m79DcX7AVQKQ+a35S+0QpjdiLupR8A6D2UGvbEqe8bQgtKEqrB?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db8b339-7465-4f0a-6b2e-08dacc9f8ff6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:38:11.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB4HnBYPGO6yP6I2fJZh7RJI747F0ID9aG/Pd7Bvz6nZCpFzkkrwdT3/fS7Pnd1o8nhwSRLlpcFZiBrjijaWoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
X-Proofpoint-ORIG-GUID: Z3i8nNPvTcgG1BwkIfDiTQZt_Q1MDH9R
X-Proofpoint-GUID: Z3i8nNPvTcgG1BwkIfDiTQZt_Q1MDH9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=363 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173686

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Upstream-Status: Accepted

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../libtiff/tiff/CVE-2022-3970.patch          | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
new file mode 100644
index 0000000000..e8f143933a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
@@ -0,0 +1,38 @@
+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a4d0c1d6..60b94d8e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index f84057c46b..0fbe515e9d 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2869.patch \
            file://CVE-2022-2867.patch \
+           file://CVE-2022-3970.patch \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            "
 
-- 
2.33.0


