Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4B8C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 23:37:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3187.1644449834760889829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kYAUinWo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90399e5faa=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 219Mn85G010613
	for <openembedded-core@lists.openembedded.org>;
 Wed, 9 Feb 2022 15:37:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HuHpisb3QYhB7IN/d+3Tw3u7H7gImv3SzO1Z7Ngi/DM=;
 b=kYAUinWooI9atrpZCBUqrFtr52C8+N6Q0OK4qx/Hskoh5SA8cOvojLFUnInHNA1dEC7C
 RgAN/PGp4TKeV0g33Jdr6va/hH24k138zeftg3IXKO+NyFb9YDFjjpslNNStN5UfyiUs
 FaoNhl6J8vx7osTM6bOD3pa0mxdC7v5QHPk3T6zMszasz2wavTSzECXAcoCH2OAMFP2Z
 W5b2ZCmjYJgpifn2J05CU7B8DbT6agU3aic8qDZq34pXslzNBrsgfiaVRpIlVW+YwHyY
 snj9o8YzyFKSWICQmwLUKNsip0yNazZEj4/OQjrGSyMD12bAc1lf9AAm8siZvCFsVKan Gw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e3575t7wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:37:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KynmEqNGpIkA3CB7kZuCZx8nwtfxh7qfoNTHP1NowINq2scpJYiR9MSRcuKaTwWgu6r1qUJVRBhbQNQHsFMdB34xqWkpXZ7BhJKmUsM1Lj3lhFkn/dM83iXbnJHrnZ0HJ6L7IBeEaSxpLjMJhX7J2ofOFqurQurBftlrFc29hmHuXkAOiXAwZLbAkS4CjaLKX6V464fy6ZtmVf21t9kcv9GnV97/YcAPqtn2ZiiC+fbozLWDqz5cQILODbWNod9Rzy/IymkPgv7nDjdpOowNUCvSs8AiTyif7vmvRbrXlPFLq/+9FGjxK6WmRp8karlnYGjM8qA6+XtubFIjzuTPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuHpisb3QYhB7IN/d+3Tw3u7H7gImv3SzO1Z7Ngi/DM=;
 b=YAn/K49FPD/mzBFZ8I+/Jxde3r5VfvB+Eoyj6N3dKg6zKZT3vUFGjaHjBz1zDmrvxX8aH7AKp5iVi10sJ4Ho3xfQtXgeXGSaioaEKznTWfzrMF7PPaiWqsTrdNAzNRmucXSkExnubNQ+fE/r+0y16eWeo3ebxq+DYkNTNXaXmSZoFvRtOnh8de63CJviXsYLTQoiCvgu4cQRwgx8Y1nFrXAv/Y36DTEIx10FytY18Ui0YLUSOdsl/OkhyhS8KUCw8z+9nNFP/vg2Hkr4W9C6KBfpAxVdVYjLxZQ0y4IGrgVhYpwNyu/4dI0dvTurGcA6RFNW//5eDL5SGc+VowBddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MWHPR11MB1936.namprd11.prod.outlook.com (2603:10b6:300:111::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 23:37:11 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::5417:1a37:dec1:13ff]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::5417:1a37:dec1:13ff%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 23:37:11 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] virglrenderer: fix CVE-2022-0135 and -0175
Date: Wed,  9 Feb 2022 15:36:50 -0800
Message-Id: <20220209233650.3901-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13174697-3845-4e6e-fcea-08d9ec251849
X-MS-TrafficTypeDiagnostic: MWHPR11MB1936:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB193687A8D1C192D4FBD33CF6882E9@MWHPR11MB1936.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4QmWv5W2NvKpofuL2Aexzb/Aeoz6NPQjiZEMiF6ktUUXuOsNQMNOYbuGtb4B35bDu1Pd1psJuTvUsM1iC1e1HIglN+kKYBqwxdAxHyeOnvNM5JmXZ8oCLZfl/62hIFX7TcgnJyeZB/Zc1XRst4LlvRccxhMZq8Q5HKK/yp8KN4XmB5XIGjD27Z9ud+prnsmu+CBY/reElIJ48MuwpSFow7qwN8mo6tqj4cjHmJQtT6nrxQOAnRf5+3C7WzoCWJxCu+G+Sm/tBj2EUHn3hASOh33ooj0VH+/jWVzaEnIs3w5HwLe/hz6voGavoZjEBGykalbIvl6rf3QrbyPowxFtMuMkeuEi4IiSqmdHEDuSY8Z4z3RSecbrtx3NU6zC62FFrGqOYpJv6Ext57wrU94dKAdnNZEB49j3AHgTjqACC4PB524+KA+u1fuzy/71J5bFYRUsWAdY5oENFnci8nIXbGNOYWY57bKRwq6H6QmdwCuXqjKyaKxZK/H7JMUFBAgpfl168+3KMwFSK+WnRWDclms3/NNiTpoZ0v2Wu41UoRv817z45+dvv2iPoNtFjahsQz55XvL07mZITmYHWq8Jot8V9yqQ/eilVHy5foa6yiy/CyrbrL7q0jGkiHqSeQrx7URwRrM56NYypCVs86eNndArSZYIB3+J923rywsJrCMXwAYErT1HqEFOId06+kk6mo3OKSIpTWTZKh9GGo8xVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38350700002)(966005)(6666004)(86362001)(316002)(6916009)(84970400001)(6506007)(6512007)(6486002)(8676002)(107886003)(1076003)(186003)(2616005)(36756003)(38100700002)(83380400001)(52116002)(2906002)(5660300002)(44832011)(4326008)(8936002)(66476007)(66946007)(66556008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nX6jZxusuazjUaRZamTgY2kKqH6NetX+AnYwnq0M8ioZ6snYItdOqX5ZQdeZ?=
 =?us-ascii?Q?lQiCn0K/C5N1mo8yLEb9HYRGVdPNjqRddTfjSSvVPUjN9yEeEBYs9PdHY8Kh?=
 =?us-ascii?Q?KJGw18eFIUK98YsMqE5dmvqKqAtGnk1tY7TE4K8jM3Ncd2qB3XFLGE2pLrGk?=
 =?us-ascii?Q?fj7Z5Act9RR/nyGQ2Mgu+4te4JM5gQiv1cBq8SY9ZhEURk7QurcOz80LhwRI?=
 =?us-ascii?Q?FyjvZ3jmNMNKKmG9XogVtEG/9w3tsYS0Go98IPAs11G+DB237Vj71agxLZ3G?=
 =?us-ascii?Q?czQzDE0ZbPU/W9BNSNDvBY6aFKUSZGcHwv5ropgftS3lncSm4PZrCHUHXVqb?=
 =?us-ascii?Q?5rkRGOLeP4SIrf3LunzOC28Mi3y+s9QoAI54mRFshbKDYNGYNdFhakvjXOy/?=
 =?us-ascii?Q?F2gYBi7IwYfhuwc/cbBGs4JM2Si43UHGrbfbs1Z/ORejfnlphZRtH0NovSeP?=
 =?us-ascii?Q?jf30KSBKkf63/R2S7ek4FExsKzyMdIua0a4tJy8hkxYUBHXAXMhkCZYcNWqd?=
 =?us-ascii?Q?SEqr+38uBEVi1onKz7svDpjh7ayzGxWLouNUI6ocpWtC6R3XryIV98NH97IE?=
 =?us-ascii?Q?Ll+A4cCrIDE7BfScFKANgeV3dj9I6ewV4d+Bx5PllGIjzj3xdpmh5KjileOH?=
 =?us-ascii?Q?tC6brpvUYvOvFTxaeWbYj76WFD4aaUaebJ6Uga6EsLxyxRc8xU62Uli99rN/?=
 =?us-ascii?Q?m+6y5hBXo5RuYADIBYaa2PKoiNW0K6EM+0VSq+xeeAYsRMij26zTVmE5Mbgu?=
 =?us-ascii?Q?aMRd0zGSytGlO98x7ym89J1kamocC4Q5ipSy5jdkaiGGMqV2ri7JwhI90MI5?=
 =?us-ascii?Q?BBx1hL77ttQ+Z6W/VI/TtkN1KNtuYkV/ecFAhRIB8va5rEQhF/tdgyF0EdKe?=
 =?us-ascii?Q?zUej4hlRBQnDChMtzcKeAliXN2ZjktBHkPycn7QE+fmvA5oWuM7MvL1yaEvJ?=
 =?us-ascii?Q?CwXfChflUdm+ECNdJ1Ts6Qbdiu3Nq4Tvj3CBpURcqgLvtfOmJCIp/rHA9pgX?=
 =?us-ascii?Q?oPuKgHxFvwGmea2lKYA7ZzcV6UgvwqKauVv7DX6qHqGuHM72u5FWaDmjghyg?=
 =?us-ascii?Q?/loCDC25yty3uGlsS1eXNn5TE7KYWeCPtKgjJ5+GIVd0i7knrnTnjoUu3ZO5?=
 =?us-ascii?Q?R4dR+RyVOgVMFl8sy1pyWfWb9Dpth13C4zuNU93/qNk6vleK59hH66J2Z4nh?=
 =?us-ascii?Q?7KdQyPWF3cTU3npEPu3yocyzBBAEcGLaAVxmi+XeJtst8uGMkcIBlFyCvESD?=
 =?us-ascii?Q?u0z9Cg5m2eobSPIYaEEcs2/vBMRcoy1KEvK9ouuF99kRwRWxqROFmF8Gv5em?=
 =?us-ascii?Q?cUetDe9Aznzyt4ziZ4Le5PO6E74RkSQIpr9hlwvky+W4c4XEtBs/7wIc7imp?=
 =?us-ascii?Q?yte+dz90/ivX4PEVcnIgbZAoKJRtmXh6XF4Eg55qDGdEfUoFoa9qEUoRhAxR?=
 =?us-ascii?Q?DLl3RoHiEw8jxstEEvIsN2x7yOphI8xvCE5ii1rQAtnhi82b5lgHLCNB5lj5?=
 =?us-ascii?Q?B3UyJxzZNGPlMOodszcQxP226+c7K3fFTDyBwd1282E1KV77zpDf/PXvUjDJ?=
 =?us-ascii?Q?mWLmjBNLtvKonbOZlKCcWBNJxAOel1WYTzBhm+SAup1dTGChFf826Wt3rkuN?=
 =?us-ascii?Q?/OTlekLbwDM2jZOBdOLZdYjIpYVB/v8keBLB+aRFJSzkwgKQ9uzDn0IhuqQF?=
 =?us-ascii?Q?DO5FkQlizn97ol4yfPxqOHR79hY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 13174697-3845-4e6e-fcea-08d9ec251849
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 23:37:11.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xLrYSKglUipQZIJkdmaQuMctMT+IxsUIj3r2YpCyIzK2OV0lcrngJDOxg/HEyLMGsblHrVdycDkbfOz9v4FX4VfY0zEQ0YyfZXQMi13bYBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1936
X-Proofpoint-ORIG-GUID: XFKBp5J6pKPPe9kRDCHfXw2TeQDneNl1
X-Proofpoint-GUID: XFKBp5J6pKPPe9kRDCHfXw2TeQDneNl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_12,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=493 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202090123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 23:37:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161595

CVE-2022-0135 concerns out-of-bounds writes in read_transfer_data().
CVE-2022-0175 concerns using malloc() instead of calloc().

We "cherry-pick" from upstream.  The actual cherry-picks are from
upstream master to branch-0.9.1 and are the patches entered here.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../virglrenderer/cve-2022-0135.patch         | 117 ++++++++++++++++++
 .../virglrenderer/cve-2022-0175.patch         | 107 ++++++++++++++++
 .../virglrenderer/virglrenderer_0.9.1.bb      |   2 +
 3 files changed, 226 insertions(+)
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
index 0000000000..7fbab75091
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
@@ -0,0 +1,107 @@
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
+---
+ src/vrend_renderer.c        |  2 +-
+ tests/test_virgl_transfer.c | 51 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 52 insertions(+), 1 deletion(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index b8b2a36..2650cf2 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -6788,7 +6788,7 @@ vrend_resource_alloc_buffer(struct vrend_resource *gr, uint32_t flags)
+    if (bind == VIRGL_BIND_CUSTOM) {
+       /* use iovec directly when attached */
+       gr->storage_bits |= VREND_STORAGE_HOST_SYSTEM_MEMORY;
+-      gr->ptr = malloc(size);
++      gr->ptr = calloc(1, size);
+       if (!gr->ptr)
+          return -ENOMEM;
+    } else if (bind == VIRGL_BIND_STAGING) {
+diff --git a/tests/test_virgl_transfer.c b/tests/test_virgl_transfer.c
+index bf7f438..3c53c3d 100644
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
+2.25.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index 65bd1af942..c18018759b 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -12,6 +12,8 @@ DEPENDS = "libdrm virtual/libgl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://cve-2022-0135.patch \
+           file://cve-2022-0175.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


