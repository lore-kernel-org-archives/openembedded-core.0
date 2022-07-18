Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2506C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 08:32:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.24860.1658133138058091577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 01:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OIa0+9en;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4198963d11=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26I8WB7a004406
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 01:32:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=oGjd3bBbhUL9irUg8cXReS9NM/keWK6fAzZgyg4+Jlg=;
 b=OIa0+9en1U6fYpXEt6ZAmUmfNxyj91mmLr6xhwB2xMMozuoNQo6LpHD3gBLQQR2XRA+q
 BKbPz5d12w4dSgcdojfX3p9WgCqO8k/RVjpDLN8qqNFgwZrMJd9SA1KeE5MPKoPH///L
 RzqDyOTmnOu2Vv5L0jOTei1xB6eEE5Wj6JtecrpapDmUfUFiwF0epddgnTWwSLVHxmAK
 lLTfrnInbC3dP3JlmmiiVOxK8uAbUJ18Ii8oH1YXPo8OmquCXOgTxeb16uNnQvqfNJ/U
 cds9C92C5DBvwh37mpbMa0/CeSDvxR73Bz4E2AeniWP++BwIc02EkDbsnWcRpyFUg+rO OQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvuks0vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 01:32:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwBwBxiSUqZozjGpGl4Lsi+VpSqfHExvU20esX2MGXA8Zhinof7qCgb7rTa9hF1h3p4Uh31LdntDR4cPea6f1noRR83V1j/aQzuqEdccZBkbWpxxDGtfIg7rIrctZOQyh4s0/rL1HBj+0OmOwFlbbnxepY8mw0mJhqrCKAJswjOFmphD3dXDjJI1vayO/SicO8LZhVYQBZksneDieOliO33yMDNtqzWbmOxVZu/ORDZUnCsKHgaVenY41eWOvXFd0Yv3U5HU4FxaqfF8M5hd1gw35aixoKwOJuM9Ln76K2MLqBLWrFWbZsQzCUyhelBE2SzfGoa5UuytxpHygpfxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGjd3bBbhUL9irUg8cXReS9NM/keWK6fAzZgyg4+Jlg=;
 b=NBHUzb6YQGPmoZFvdpFIgzpzvN0C0Zi6RtH1nFYRusYqSsY9ycDN9nmDLpYKUgFjcSd9L4H8GV45YxwmsjE4uUEgLAqfNWegJUSrknK8wxAnQ4wpYtshvKuLZ7jR4+n/vz2PP4Go0hNKZ/8+P9rTUfGU68o0b8YJYWzrdoaiimbZcEW6id7CQ6Z/bAag8r4eEsVUCt1RzywDvZOd3RudZGw1+hUhGRHvFawjxQHnxicsrn7OkkFHvwer5GQ7vEZnjb+kbVaGMBslvFMGZFngaJd0qs2OvmOAvG9vn/PmdBgA5z4/A2GAuh7CYKIFt+I620l30LPB6XD6n5xhiriycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by BN6PR11MB4147.namprd11.prod.outlook.com (2603:10b6:405:80::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 08:32:15 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::5986:e5e1:9cc8:cdc0]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::5986:e5e1:9cc8:cdc0%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:32:15 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH] harfbuzz: Fix conditional
Date: Mon, 18 Jul 2022 01:32:04 -0700
Message-Id: <20220718083204.6069-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deee22bb-5c71-450e-7b88-08da689804f1
X-MS-TrafficTypeDiagnostic: BN6PR11MB4147:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GBsUeCZZOB6muCXzZfPLdCwdIdxhLKbsigclSfoOgppVakobtktyP15VRq7Ma8I6kHpDl7hd3bR4JJ0rtUWB/IpRX96DG05gTl4t+6mZ8ofjEm0dlhKlbyKzrMr4boZFmrg0Z37wxVPfndDtMPjDokBlcXdankTzwI4v403LN55g3/aedMKhwGXi9DKQtLGykB7KMArNhlpFL1vo4ZTtO2j+eKp9baxVCcvvoMjKLOgu6eyi0Ots45Y2NN9QGJnRafk1gNPD79cbVW/OFuZDw26T+QW7oDqx9r1sLSucNefna8nYJAkD9v8Q2ClgTFQOKRiEhqE9kz1GgUlxx4tgVpuaEYM++TZu+zlmZji6Bs5kfh9+Rbt+RnPO76+q3IlrsIyNJ5mCwpHuDBMcfisZ0JiOIJXc/TQPC/Wg+15m+mAzcqhgyI+sY4CYZFcXc7tapqgUzsZjcl6yhljdh+qiYE/ckWLk32Ag9lln8X98q6Fyo+92aioZ78ShZlFli+5s1pJW8ux+dYhBvtQO8fp140RuDNseNKRMEUGcpwENFyLUFxGoWapj/YkN1o8Gqf23phgGr7gdymyCzMEsoK2s4y+/tsPi6NIV9tVsR0rL/ZaJ2uUlQZFcYPaQ37ZbQHqhms4gVtqQCKhNay5Fdvxdc6u+mGs0ENvFgo3Mxam8wx7nrikwDTg0VmM2NTl9qod/6AJ3krvrzM4v0pYkYPNZC/tU6dP4irmlBRpjBzy/CzgjWPwGvo4I7z2ndHdJe2yM2AxqGNQ38vfh35ZB/v5sEdcXr9oDpmQrWv4VYcZUKFB7wTSFhmtRIYFOqA2bjAXJDqfY9xFSfpdgP2Ni2cBuI4xQrQbVegwgQL3h2AUtH8AUlz1VHPIoGTBFOn2a8zdL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39840400004)(366004)(396003)(316002)(38350700002)(6916009)(38100700002)(66946007)(66476007)(66556008)(8676002)(36756003)(186003)(44832011)(26005)(2906002)(6666004)(41300700001)(83380400001)(6512007)(2616005)(966005)(6486002)(5660300002)(8936002)(6506007)(86362001)(52116002)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?csbRiWH5a5ZVlIY7ZqfxLEPvQP4TheqJNf6bdZQMq/KBgXWdIneVXrMnV2Q/?=
 =?us-ascii?Q?xq2L0eKMYqfs4kCQ7oX4r6jlzYQ+1VP9gUL5H4iy1YK62nEPXLx3ReUtGLM8?=
 =?us-ascii?Q?rWCHFYKrcyygfvmZjJoxZLAiFz0HJqK8MOFlxxGOAlM3AzlEe7jyK2rzkaEm?=
 =?us-ascii?Q?2BF/RiiF0ROEK02Biw/7BNk3ZrJoMR+ZHqxVzN+hbuLiFpUZuRc+VaGJlDLP?=
 =?us-ascii?Q?Oox8tjS5FpuKTL3FI9YKjQajWHrZxa2xQi/1VoE3865cmqr5Cfl1wOL4mTL+?=
 =?us-ascii?Q?/4pNF3d6jOvZnuE1gccSKlamUNYfRjtN9ahuhhj4bhM0zPCHT607DYyQpF9M?=
 =?us-ascii?Q?PqUdISil6M59FEYMhrS8rt0IPPQY90znja0BkuW6DT0xqqzvt3uchyUBDKuH?=
 =?us-ascii?Q?ewintCdf4MslJZ0jkmSRKkypRTeBq+IHI6y1nvxvpXJbVXCM/VzED2D1XD4D?=
 =?us-ascii?Q?YhtrduXZIV1q4RZgsbY+T6E4xPG7Ed2R68xQFYRujUmvjOxeWF4xen4vpuMG?=
 =?us-ascii?Q?5EXZ/+cYso14I3AYc8bxlyAUGW41Wvhf/93X2ancD6cMorS9ZrngUR775iuT?=
 =?us-ascii?Q?bX46rdJzonRxzllVT03gGShMDN+YEMjnKoHcZc4JICrwLsyOemxGa1SiQhSd?=
 =?us-ascii?Q?6va/pyl47x04Wvnk0GV1EbI+N4sE3QuT+ymg5pEwvjYR5iEffvpkdbnDtqzT?=
 =?us-ascii?Q?lInu7s7IQkPbNKWaxFo7FgkVpY95Xh35K5TZN8ySGeeIvFYd5jLu251k5QY/?=
 =?us-ascii?Q?KlYXlywtWhs1I2m8tprNXeA7o0+qI0iUFsLcKmT4wLcJjDIFi03Ulv1VPpyb?=
 =?us-ascii?Q?ptToM2GBVxmpkcyjRx2zYi5bPdGndYvspuNLcrBSZL1DTQCPDNiW/XMN0J/L?=
 =?us-ascii?Q?HI9bu84WAncxvpFlJDsfLdeh/JKj+tWCHN9UPLgC9HeqS4P/EFNGllJmpNcG?=
 =?us-ascii?Q?B4S98GZbZRmDt8Q+4T6MA5eUjucAOiwIYmeUDswQyi8He/qL74dxRX2ME5ha?=
 =?us-ascii?Q?kh38bDqOu8gkf7OuR4RBE8EpSrKSBKixjrKkqKlEWd6GmB8G+3/uoHwmityF?=
 =?us-ascii?Q?Fi1xwnAZbLDvSpXZsN4KAAFgh8aaHmK1jAAKmq/TWAqqqbaL3YGL946SrrMA?=
 =?us-ascii?Q?pyof+QuI+agG7VXUko8eLnNAawildbOFoITpy+5b+8AJSYB+AaVVyGeQ/AVF?=
 =?us-ascii?Q?8I5eCFqtTM2irPjSD6zULEuTS0Sml51odyQO8eXReby62UZ38ckf3FEYgjpu?=
 =?us-ascii?Q?vljbUzTKvaoYTnN8k/djOTR0Ai7BMPk0UP5sLfz2leloIeonp1hLa4BKe4bR?=
 =?us-ascii?Q?LXYqzPoDKEkmpTejpgJSJUH/HhnsxTaeqfmbl3CnK69FgtZLxPZSV9ZBKXPt?=
 =?us-ascii?Q?wV1NHmVzO035dFWfY1CPnHIBLxVM1tN20iACtg8hGgMvhEUikMAXE1cPPJ7f?=
 =?us-ascii?Q?4ZW9Uk+T+mpBfEyy3AoJ4vGKtuuYRybydzQAkZD49JY6kDqRlWs8ciZQDEwz?=
 =?us-ascii?Q?2Y+qqN6QgkhHmNpyc3HxdKZ320jgjDxdk7rGlL2iTHQxexpgDtKwg0jS0fU9?=
 =?us-ascii?Q?BsMPJtwKpZOCRhzqw81njSgcGiUVegi68t7tR33mG1sqTJADVhyLjRnOIXGS?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 deee22bb-5c71-450e-7b88-08da689804f1
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:32:15.4692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /BtmVie5bK3tWNfUZTs7VxSmti+LrYx6cetsHnVkvheUI66IcN591+EUn/4yRwlATCvu2Valuf3+5t4s7CZd0hJeGsxZLtEGXameRE8AR7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4147
X-Proofpoint-GUID: vfUEXu2W_0xHJeTizmS8jokaYnreTfZM
X-Proofpoint-ORIG-GUID: vfUEXu2W_0xHJeTizmS8jokaYnreTfZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_08,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=863 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 08:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168194

From: Wentao Zhang <wzhang4@ala-lpd-susbld2.wrs.com>

Backport patch from
https://github.com/harfbuzz/harfbuzz/commit/e421613e8f825508afa9a0b54d33085557c37441

Signed-off-by: Wentao Zhang <wzhang4@ala-lpd-susbld2.wrs.com>
---
 .../harfbuzz/harfbuzz/Fix-conditional.patch   | 27 +++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/Fix-conditional.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/Fix-conditional.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/Fix-conditional.patch
new file mode 100644
index 0000000000..ed2b606c00
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/Fix-conditional.patch
@@ -0,0 +1,27 @@
+From e421613e8f825508afa9a0b54d33085557c37441 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Jun 2022 09:07:57 -0600
+Subject: [PATCH] [sbix] Fix conditional
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/e421613e8f825508afa9a0b54d33085557c37441]
+Signed-off-by: Wentao Zhang<Wentao.Zhang@windriver.com>
+---
+ src/hb-ot-color-sbix-table.hh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
+index 6efae43cd..d0e2235fb 100644
+--- a/src/hb-ot-color-sbix-table.hh
++++ b/src/hb-ot-color-sbix-table.hh
+@@ -298,7 +298,7 @@ struct sbix
+ 
+       const PNGHeader &png = *blob->as<PNGHeader>();
+ 
+-      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
++      if (png.IHDR.height >= 65536 || png.IHDR.width >= 65536)
+       {
+ 	hb_blob_destroy (blob);
+ 	return false;
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index 81518a53ea..54ac194eae 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -12,7 +12,8 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
-           file://CVE-2022-33068.patch"
+           file://CVE-2022-33068.patch\
+	   file://Fix-conditional.patch"
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.34.1


