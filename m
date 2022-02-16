Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224F1C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:12:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.733.1645053163784539372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nXzls3Ct;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9046268e58=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21GMedOP032224
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7QwUhH+rg0pzB1uy3xn9JRPfWVBcKC5Rxh4s49zaRcc=;
 b=nXzls3CtF3eyEq9i9vO/5LyzuHU93/9MX7/JbMWeJ5baVSBdt+XQ1W4R6vmAdqokFQQu
 KQUULY28VPTfX+bv2auXzhtMFR29CEBVsngrSdENsDVeoaVbUXAUTT5fYfD5wDEpXAak
 hK7HI2WvW0aNK02WN8HSsKa7pdTTvpAT+FtIUiTi8zV+tLa8CWh6YO3Euk3AISuLOOFa
 +geBplhkPSVBXopIm4NepKfOr2Rwm2WCY6dznse6ksvzY4prlxLxhz2Wjlhq2Ri+8cWI
 HhOXaonyYakwgGvoDagayjaxHy9KYLKuHuf/us9cziCMl7cBuEfhJEidDrZTtFN/8w+R nA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8nc3rwy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 23:12:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/MzHrebFWtubuM+llsmtICySUA82glhoBLxnF0MMVmNHMtmxgvvOtIQ6xiIZjS7CJg5viBU3SsSiQ53SuuJHhsGIt4EcmMApJpWHYufzoiPPFmSrMNCSJxoVLn4TQg4mdIlUVzqMcaP8HfJLr+w4ZvSBNf4C0ZblXPZq/xMUkXOUckcMfYj0wwLPBqccaI3ZRMBlv3aK+rwe/OweRgJE+JmQOdrUgMY0NITD+ihMl7I0DYS/GlGMCL64ptUlX4WZHso2D1yPtNrrx9RyJ24TyX5qhWM314T3hV+cCEm0/mIXEXLEjO2YhffUyZA/TH59+zny3xe89w6qNasYt/PIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QwUhH+rg0pzB1uy3xn9JRPfWVBcKC5Rxh4s49zaRcc=;
 b=ZCpgBY9zqlov8qSLF50U0W6m3gjiRxarKvIZyW5YsZ6F047GdDhUUwMOlj8E5KnRtI/PfstthfPHqPTBUWHXAPHFG/CPT2r0y7aafxGNa+7GMN4gHPahqBMS/aVSihdjYCX4oLfGHGvaQXfu9oln0lNP073TUISkNmgwFSoa+cHhOjkPBD7Kbw3haEoYQIe8Rarx0hfVeOUrNBN45TcW4FFMMwxSqvZc4W52pFuVFB1YwTj029f90ByYFgpvMnRw1Gqac1/Qjd3+KQ9ljTMTBOp1rjSht3qJKb2eq3hGXvdvXcs3pO6sjY+sgk9w7lg8yfeOzg05fui8NIqdWcBB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 23:12:40 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b5ab:c064:2e46:4726]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b5ab:c064:2e46:4726%6]) with mapi id 15.20.4995.015; Wed, 16 Feb 2022
 23:12:40 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] virglrenderer: fix CVE-2022-0135 and
 -0175
Date: Wed, 16 Feb 2022 15:12:04 -0800
Message-Id: <20220216231204.21131-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea5c4e4-6fc1-4b0e-68fa-08d9f1a1d42e
X-MS-TrafficTypeDiagnostic: MN2PR11MB4534:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB453494A6400A7331B569C78A88359@MN2PR11MB4534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:217;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oEP1OX2OXofRwvcc08F8psHwKxxx5r70qlPwGN3igBM4IMkwqCxBE4ZcAkqbiDGk2tfDmL0tzQSlWExOk112WYCB9gmg/fC9UYiBqBkb3sb9HUgfri3h44CZ4wThxMOJXclWm6JZDfW9ZxG+1MitnW77Fr/KbRNRVx4gps5sc0doMyrfQ4/aW4k/NBTyHW7g/s0GKgQYLTPXe78WL67XDruXqN9puqm9Geri7JgjQk+5kX/tp1qDjgq/zSrdrRnGT1Ed7YyLqcrDCK7QPpCMvbtLR41UZkgfh6xNfwF68kfIUYnkeKSgwBR2yZ/yeDxGJVZ+dax8TGxbiL+LvRF4nVy1gRuzkVoav4hWBKaLOQpizUslclJq63g0oEjFX6cxQAREHTfx8vBaM8ADjcTpFWvWUoOMQGRWY6YvzPXQCNqJiHNgWY73H6zLz5gfydmUlLlCzAha5tESnvMIEj3FnFzUB+EgHLNEsklgj1IWsAgC/zEV6pqvqEu0HZoxqLlD92wscQijtsDNn2OYz0jsjYyaNUVHTtP8yYZc2cc8TusbSaIA6L1/KWKerrcJFLdMFeHJX5mv6Ml2MNdandNJikYLn3ih4/fmpz5sSffQvuv2Zb4ab3WqZ8qC9x2DJ6ayqSrJ4+XIdclEpErUWFZzDMoMR7drNpLTQWHiYESGj8o9QSdE+RJbfIiLeGAWosRIO3/ZuuW2Vq2vmbb4mSb+CA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(52116002)(83380400001)(36756003)(38350700002)(2906002)(38100700002)(8936002)(5660300002)(44832011)(6506007)(86362001)(966005)(186003)(66476007)(66556008)(8676002)(66946007)(6512007)(1076003)(26005)(2616005)(316002)(84970400001)(6916009)(6666004)(107886003)(508600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9o09lWGm1/J6GxT/52cnyrMtpoQ122prJ3Pxcpj843Oqo0AiJk69DOKTenmc?=
 =?us-ascii?Q?91d7RQFsKCPphwg5Xnb5nuoGr4GzhbID+oNU1l89Oeh1L4stn5PNaFbJDGxF?=
 =?us-ascii?Q?w19KsUy9+fG0Qa/iEqa6uj8Sx3UCCP7fu13JRgYbTBeEJ75Tfk+BSixrm7SE?=
 =?us-ascii?Q?iqkXztBnMBaAGsDcOLDW3lDvui8m5bQ4/HF1jCGf8DsGBdNJzDr8EqAEX6BN?=
 =?us-ascii?Q?/XsizknYp764wNMhXFTUy6Dbvk5XgoGGML8+asCAmr5ejvDJQ/UDQp7KWKwG?=
 =?us-ascii?Q?p5kJJY0zQxCYc0YGtllzIMjkbYS2/9f9vuJCxxO/O2jf6/SUnIejy7mkRyWh?=
 =?us-ascii?Q?25v9cTiOGuIza4NGQT5RZzitF62oczWCwVC32lEGnLOczMZ1IWaAmVbAGw1y?=
 =?us-ascii?Q?WxsdPN8Ao+RRqK55J4XHdg4n+ItEY3eKC4eZdIcEE5vzxCsGuL2f2zUsCiwn?=
 =?us-ascii?Q?rmF6ypKeiZ7RB06w7WhqaWGmMxTYprBlcarsFa95bVuYr/oBMsPCMO3lm1so?=
 =?us-ascii?Q?wLWI8IRNbVhgKv+k9TYV4D89L6V8e9M1iuI+vTNwQ1Qr5ycEWVmCuLK6O7oF?=
 =?us-ascii?Q?usb6pASUy4q2+fuspwsHBp3Q5XDOcyuuSoUlLBLCn4DNxXgAzFsC1RQ98Wd0?=
 =?us-ascii?Q?607LvI2tp8DWTIzgBHByvbniNSlFwOwzm5nJOsaW3gVGJ00Burm00IqyuJqu?=
 =?us-ascii?Q?ONiyedCTEPPHAiyBBVjafgp/0HKd5L35sT2GTX6GRfgwfMdEraoiywKvRAZ0?=
 =?us-ascii?Q?wDCwItLmLfXM5g56YToAwnoOn2bjaR8CExMZiJcDRqLiuV2F8nF9VQK30JV5?=
 =?us-ascii?Q?pNqrVf9EN3fKKP+HTO4GV7aQpeKwlOVoGM7ptYHZsB3TAx7L3gI3GnknN52t?=
 =?us-ascii?Q?dzClWtYIB0z78Ju+kpi49WE1aISdF+rLJvWj/1y4Mr0gXzX1lnvGsK53v7hD?=
 =?us-ascii?Q?V5ide6ORnIaJi6UtQjhwYo0K1rXGofajXFuwPrnsFRLpVL+KxOPsyheQRckt?=
 =?us-ascii?Q?OQttRaxzMO/gF+i1/L970/b6C4XISSqWmasvZeLe4HNJ265G5/FycLbqOO22?=
 =?us-ascii?Q?3ZwMW5TchdRL5VHmvsRYGfe8NPgelsSB6E9augjBX6icVbS6MBJE05Xh4QUg?=
 =?us-ascii?Q?09cWbXpEqUVUvKz2msAQWD8vTggspzP0d8nXupwoqPzPpEOAafoKPN9n0GLS?=
 =?us-ascii?Q?i9Kw1IkAOvd61jYv8W+3UmJad11OzwNMhKxIwdFNkl0FMNPLDEymmrFYCu52?=
 =?us-ascii?Q?2a2nQA54pARAG78cI+mtI+Z1lqHw9iQdtK1AXwvqDqM6JNFQOG9/VPIM3p0D?=
 =?us-ascii?Q?1ps7sfu2eT/R/7WiiuWyKpU7GLyLcoXnrRHWCLgnl4gu5hM19ltvbWemDNzn?=
 =?us-ascii?Q?CAjOR/nckIKU3I3MzxOq+DFLIt5i5zZm7KMK80ggYWo9XApxqJU6QFYBt+Fx?=
 =?us-ascii?Q?LZZCgy1qG0To29LOBOewHh4hBeamKw3fetQv91mLfj0nxB+9mR4fCs3fNkug?=
 =?us-ascii?Q?jor4reaJCc/a+GdzpBqCE+g2bZrjYhmcY5yb+2D/kIWULa9yXjChlBkSnevq?=
 =?us-ascii?Q?UX8mEgbJ2bxXf9LhSt1a2I281nuSMdbz/v2+iAOSvNksZtV/zPTvVipxqHZb?=
 =?us-ascii?Q?M8nmTnn2Opo3AYKkKvShOkkBxNCMJqBg5Cw9Voqm9mlrRFO/HVvFAVwzSYZJ?=
 =?us-ascii?Q?qoNx1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ea5c4e4-6fc1-4b0e-68fa-08d9f1a1d42e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 23:12:40.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZzGET9WGD3MAQ4fBTJQWVVGoxagrVSekn0O7uY7Ck1efYTTzjc3mmIAajHSx/MkaPhsda3/xX2uksbXCqf8d2HE0aEFYIx1MoeaNszGuExw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
X-Proofpoint-ORIG-GUID: r8IM0SyFmhPkm5nzEdhuXRzFR3nB1k0E
X-Proofpoint-GUID: r8IM0SyFmhPkm5nzEdhuXRzFR3nB1k0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_11,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=672
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:12:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161784

CVE-2022-0135 concerns out-of-bounds writes in read_transfer_data().
CVE-2022-0175 concerns using malloc() instead of calloc().

We cherry-pick from master.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91f7511df79c5c1f93add9f2827a5a266453614e)

Modify -0175 patch to apply to hardknott branch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../virglrenderer/cve-2022-0135.patch         | 117 ++++++++++++++++++
 .../virglrenderer/cve-2022-0175.patch         | 112 +++++++++++++++++
 .../virglrenderer/virglrenderer_0.8.2.bb      |   2 +
 3 files changed, 231 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
new file mode 100644
index 0000000000..ae42dc8f6c
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
@@ -0,0 +1,117 @@
+From 63aee871365f9c9e7fa9125672302a0fb250d34d Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 30 Nov 2021 09:16:24 +0100
+Subject: [PATCH 2/2] vrend: propperly check whether the shader image range is
+ correct
+
+Also add a test to check the integer underflow.
+
+Closes: #251
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
+
+cherry-pick from anongit.freedesktop.org/virglrenderer
+commit 2aed5d4...
+
+CVE: CVE-2022-0135
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/vrend_decode.c          |  3 +-
+ tests/test_fuzzer_formats.c | 57 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/src/vrend_decode.c b/src/vrend_decode.c
+index 91f5f24..6771b10 100644
+--- a/src/vrend_decode.c
++++ b/src/vrend_decode.c
+@@ -1249,8 +1249,9 @@ static int vrend_decode_set_shader_images(struct vrend_context *ctx, const uint3
+    if (num_images < 1) {
+       return 0;
+    }
++
+    if (start_slot > PIPE_MAX_SHADER_IMAGES ||
+-       start_slot > PIPE_MAX_SHADER_IMAGES - num_images)
++       start_slot + num_images > PIPE_MAX_SHADER_IMAGES)
+       return EINVAL;
+ 
+    for (uint32_t i = 0; i < num_images; i++) {
+diff --git a/tests/test_fuzzer_formats.c b/tests/test_fuzzer_formats.c
+index 154a2e5..e32caf0 100644
+--- a/tests/test_fuzzer_formats.c
++++ b/tests/test_fuzzer_formats.c
+@@ -958,6 +958,61 @@ static void test_vrend_set_signle_abo_heap_overflow() {
+     virgl_renderer_submit_cmd((void *) cmd, ctx_id, 0xde);
+ }
+ 
++static void test_vrend_set_shader_images_overflow()
++{
++    uint32_t num_shaders = PIPE_MAX_SHADER_IMAGES + 1;
++    uint32_t size = num_shaders * VIRGL_SET_SHADER_IMAGE_ELEMENT_SIZE + 3;
++    uint32_t cmd[size];
++    int i = 0;
++    cmd[i++] = ((size - 1)<< 16) | 0 << 8 | VIRGL_CCMD_SET_SHADER_IMAGES;
++    cmd[i++] = PIPE_SHADER_FRAGMENT;
++    memset(&cmd[i], 0, size - i);
++
++    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
++}
++
++/* Test adapted from yaojun8558363@gmail.com:
++ * https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/250
++*/
++static void test_vrend_3d_resource_overflow() {
++
++    struct virgl_renderer_resource_create_args resource;
++    resource.handle = 0x4c474572;
++    resource.target = PIPE_TEXTURE_2D_ARRAY;
++    resource.format = VIRGL_FORMAT_Z24X8_UNORM;
++    resource.nr_samples = 2;
++    resource.last_level = 0;
++    resource.array_size = 3;
++    resource.bind = VIRGL_BIND_SAMPLER_VIEW;
++    resource.depth = 1;
++    resource.width = 8;
++    resource.height = 4;
++    resource.flags = 0;
++
++    virgl_renderer_resource_create(&resource, NULL, 0);
++    virgl_renderer_ctx_attach_resource(ctx_id, resource.handle);
++
++    uint32_t size = 0x400;
++    uint32_t cmd[size];
++    int i = 0;
++    cmd[i++] = (size - 1) << 16 | 0 << 8 | VIRGL_CCMD_RESOURCE_INLINE_WRITE;
++    cmd[i++] = resource.handle;
++    cmd[i++] = 0; // level
++    cmd[i++] = 0; // usage
++    cmd[i++] = 0; // stride
++    cmd[i++] = 0; // layer_stride
++    cmd[i++] = 0; // x
++    cmd[i++] = 0; // y
++    cmd[i++] = 0; // z
++    cmd[i++] = 8; // w
++    cmd[i++] = 4; // h
++    cmd[i++] = 3; // d
++    memset(&cmd[i], 0, size - i);
++
++    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
++}
++
++
+ int main()
+ {
+    initialize_environment();
+@@ -980,6 +1035,8 @@ int main()
+    test_cs_nullpointer_deference();
+    test_vrend_set_signle_abo_heap_overflow();
+ 
++   test_vrend_set_shader_images_overflow();
++   test_vrend_3d_resource_overflow();
+ 
+    virgl_renderer_context_destroy(ctx_id);
+    virgl_renderer_cleanup(&cookie);
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
new file mode 100644
index 0000000000..8bbb9eb579
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
@@ -0,0 +1,112 @@
+From 5ca7aca001092c557f0b6fc1ba3db7dcdab860b7 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 30 Nov 2021 09:29:42 +0100
+Subject: [PATCH 1/2] vrend: clear memory when allocating a host-backed memory
+ resource
+
+Closes: #249
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
+
+cherry-pick from anongit.freedesktop.org/virglrenderer
+commit b05bb61...
+
+CVE: CVE-2022-0175
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+Patch to vrend_renderer.c modified to apply to version used by hardknott.
+Patch to test_virgl_transfer.c unchanged.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/vrend_renderer.c        |  2 +-
+ tests/test_virgl_transfer.c | 51 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 52 insertions(+), 1 deletion(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index ad7a351..d84f785 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -6646,7 +6646,7 @@ int vrend_renderer_resource_create(struct vrend_renderer_resource_create_args *a
+       if (args->bind == VIRGL_BIND_CUSTOM) {
+          /* use iovec directly when attached */
+          gr->storage_bits |= VREND_STORAGE_HOST_SYSTEM_MEMORY;
+-         gr->ptr = malloc(args->width);
++         gr->ptr = calloc(1, args->width);
+          if (!gr->ptr) {
+             FREE(gr);
+             return ENOMEM;
+diff --git a/tests/test_virgl_transfer.c b/tests/test_virgl_transfer.c
+index 2c8669a..8f8e98a 100644
+--- a/tests/test_virgl_transfer.c
++++ b/tests/test_virgl_transfer.c
+@@ -952,6 +952,56 @@ START_TEST(virgl_test_transfer_near_res_bounds_with_stride_succeeds)
+ }
+ END_TEST
+ 
++START_TEST(test_vrend_host_backed_memory_no_data_leak)
++{
++   struct iovec iovs[1];
++   int niovs = 1;
++
++   struct virgl_context ctx = {0};
++
++   int ret = testvirgl_init_ctx_cmdbuf(&ctx);
++
++   struct virgl_renderer_resource_create_args res;
++   res.handle = 0x400;
++   res.target = PIPE_BUFFER;
++   res.format = VIRGL_FORMAT_R8_UNORM;
++   res.nr_samples = 0;
++   res.last_level = 0;
++   res.array_size = 1;
++   res.bind = VIRGL_BIND_CUSTOM;
++   res.depth = 1;
++   res.width = 32;
++   res.height = 1;
++   res.flags = 0;
++
++   uint32_t size = 32;
++   uint8_t* data = calloc(1, size);
++   memset(data, 1, 32);
++   iovs[0].iov_base = data;
++   iovs[0].iov_len = size;
++
++   struct pipe_box box = {0,0,0, size, 1,1};
++
++   virgl_renderer_resource_create(&res, NULL, 0);
++   virgl_renderer_ctx_attach_resource(ctx.ctx_id, res.handle);
++
++   ret = virgl_renderer_transfer_read_iov(res.handle, ctx.ctx_id, 0, 0, 0,
++                                          (struct virgl_box *)&box, 0, iovs, niovs);
++
++   ck_assert_int_eq(ret, 0);
++
++   for (int i = 0; i < 32; ++i)
++      ck_assert_int_eq(data[i], 0);
++
++   virgl_renderer_ctx_detach_resource(1, res.handle);
++
++   virgl_renderer_resource_unref(res.handle);
++   free(data);
++
++}
++END_TEST
++
++
+ static Suite *virgl_init_suite(void)
+ {
+   Suite *s;
+@@ -981,6 +1031,7 @@ static Suite *virgl_init_suite(void)
+   tcase_add_test(tc_core, virgl_test_transfer_buffer_bad_strides);
+   tcase_add_test(tc_core, virgl_test_transfer_2d_array_bad_layer_stride);
+   tcase_add_test(tc_core, virgl_test_transfer_2d_bad_level);
++  tcase_add_test(tc_core, test_vrend_host_backed_memory_no_data_leak);
+ 
+   tcase_add_loop_test(tc_core, virgl_test_transfer_res_read_valid, 0, PIPE_MAX_TEXTURE_TYPES);
+   tcase_add_loop_test(tc_core, virgl_test_transfer_res_write_valid, 0, PIPE_MAX_TEXTURE_TYPES);
+-- 
+2.31.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 7f035f820a..d92359565a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -13,6 +13,8 @@ SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://cve-2022-0135.patch \
+           file://cve-2022-0175.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


