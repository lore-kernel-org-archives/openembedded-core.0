Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7041C47072
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 04:21:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.95946.1703650857925349333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 20:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KuERG+/E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0725ab29a4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR418j6006540
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=B+sJS4MQugk0aohe7XyxEd7SoWIYi8Nw8cR7DD1TEwY=; b=
	KuERG+/Elfmxpu3uEB6NE4JqxGaMMmdH+zWs5JwrpPktm6qmQaL/hKU3XoPep4uV
	AjQk/nyPLxMEzzzPXvRzz0N2aOKRiMOvOSx829lFO2zqx0IEngpapvgD04cZ8Blw
	5lURFu2kTfJIYC2JV4UoxhiaPo0JanEfKEFAQcdWkPITzFpirILzO+FxK+/wsZCm
	IxQoiFCABnP0ALT9Uvwu1AKnW2osyKB6Ds4JYGq4Ub5sl2PencLxal5PVYjzsZEQ
	PHgpglF7gq2ZZHwqlZE0RoDB+dQG/jpaeShAfLkoEbUcHn5yUfdpOXs076TeHh8U
	Wvp9G4BqNy7oO8muJThPvA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5ph62u8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:20:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STPVmCATuKZ0PfYJnl26C0PEEerZOaINERm7A7b4LU6Fp7V85JVDEKuTVJ41whJ5zI5bCRi7dj0oQVqDlw03R6MT5XjpaJlmeDfgoP0L14Uguio/pgQ8RgAvsEYNGAUHvdUcVhMJ2DPDKK/WiUIn/5Ot5qINRp7PPCnsV4pLFqU3FVdnTtQF4l+zbZtv3mAh9dvG8HBbSiYpJi5S0O96CJG4sB1UkV0tckDR86ENqw6Nt2VgXH/eD55ueV4UP6zx4vTeitTIYgOecqqgR1oQdqehiBfRZbQza4+zxcpwrNL0oPwqbKwNNAP+JKbtPwbE3XOxSpZJ4jhc6E9JnuhFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+sJS4MQugk0aohe7XyxEd7SoWIYi8Nw8cR7DD1TEwY=;
 b=ivORWz6iPBin6nPnwoLKkPXsoTHdra8w/UGIimLgdVPNCGbFmw1cYZ3jDQSSKKMLlE4JqpKFFoacv5R9AP/Ro4z6YHFnVP4g1xkE4gUJWqK6j2LG8u0mD8di9twRc/Q9qI+7IOR4K0xChsNkBeIV3/ncoHCeDd/pgEr50PVNNy7yhzjCN5RImQdkWOHfSka+xmE2RIcer43IicILemmAab1ses74sz6vvLLv6g4RQVJWzwEX/BkbH454WkxHLBojF9BAYVOrBZQIzl2wwcDhEmkilv/qO7+d8uD8WFQ5YMjre0RJ97sE6BTDFa6XveeKuLEvjqmYQnw5a4wqRPfg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Wed, 27 Dec 2023 04:20:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 04:20:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] systemd-boot: upgrade to 255.1
Date: Wed, 27 Dec 2023 12:20:35 +0800
Message-Id: <20231227042036.2376255-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227042036.2376255-1-Qi.Chen@windriver.com>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: b6943523-e9c6-49c7-0f65-08dc0693376d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q+HVsq2hhC9flePo5cKrNlVy6+ruR+ZD04b/Nx3A0FDUl3DHS+lpIIdH9jAwdbxC4Y6i9If6PKdyYZnXPIn/gpKw5W1PfK09C837znkohAz2DJZ0ySNlJimXhVz543MSclLCelGoDKrdZPj7hpmT3xcjg2FM5bDfL9sjSK0gWax8AXeHRcKdcyt5PIvOHjEryYOcz6fJbfaq8uvuvyPfEepMCwR0/iyu2SA1Q1JbDP1BvhnEGzMwgtMPabfYbEsNXO+2XJ8ORrgn71XboPqvucENvu3atfH1hLtK0urnjSfr7ejCSRCwF2q5C1Ruou6hi01ETefLEkMi6B4XT1xuUX7to2PoLriqvQPBdKD1UWDDzoKXhz6UMOGBznnxt5WYftiFayqBCzMYZGk7fdDWvwW+JVWCz9oKSbns55+w9a4VF/uwxGCVbVAcUILaZbicQJo5yfqOrBNn+4A2ss9YNsrFSFjWvXYs45c5gsTRRXDsFByjp+Hj+ixvJn72flHeptbKobZXBCW3vqSPVNVGeN1Y4uzoBUIpCpWNd16uaOc+e9h/OkaY5M7bA+CZsmKaEewBAmM9biQSdxDFMhR0qEwAYarMfWeYeVL2XRsImF5R9TFSLTJ3VBZ6etMdzFxLi7T8KH4RO1iwyHtIHOQUpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39840400004)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(83380400001)(86362001)(2906002)(478600001)(5660300002)(6916009)(8676002)(316002)(41300700001)(8936002)(6666004)(6512007)(6506007)(52116002)(9686003)(6486002)(66556008)(66476007)(36756003)(66946007)(38350700005)(26005)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dt30ePeEiFhAi3weIICkuugprkPbpCQA+mXRuib6vDFg/P3Vtb/lw1+bJxTj?=
 =?us-ascii?Q?E7RcQG6VwWE7aFdgj58DBGDc72ZnLKADFJd6u+IdZQ5uyUmoN3i8DJiZ8Hjv?=
 =?us-ascii?Q?/Ah9nGMYJ+RljSN3E4Xs8ezSd9NMPFqqB8RVGsKz3iGoRcjjMXC9dnYs29pe?=
 =?us-ascii?Q?Y7oK8sMGNZqQkrhSkgGn0suFEIkCBG8ECSgdKS6PeUnm7T0781lBtHF9+kBp?=
 =?us-ascii?Q?I33f5xbJqqcFv1FZUfpOqt4rSfBT7aYKBgVhlHr65Di6UVDUyoESAVHpm6y7?=
 =?us-ascii?Q?PEZAdHWs6n944yMR833rBQKPMRr4M48PXEY0vNuJaDY/qa4mlYgJOVV1uoo+?=
 =?us-ascii?Q?lxbRZY67HlKqjPaF1sBZfHK6V8GZ3UI5EZjLyXvYPXdfEg8ed/kxS0rwf5ve?=
 =?us-ascii?Q?WM+IqLlXiuOVOhJt3fvW5xNbCsHO8iFIX21QFai7xLwnTguwP/OgP5iKegER?=
 =?us-ascii?Q?vxIcaw5xY+MdmJzz7jHiZQS+zNDMp50U29j5l/HIEsGaB4srRUdlxLoBfNCb?=
 =?us-ascii?Q?LF6FDz8JCTY33LM60X9KcBufNsNSAOnYYiQmTYXQNbLybbOiIX5uUYwlZQMg?=
 =?us-ascii?Q?4WRtr0rHpI2yxNoTEA7E5NzgPSwu5OhGcU3bkf2S0ujxRp2YYtq4Ab+bQnzp?=
 =?us-ascii?Q?+j1UaqtJb+QfYsjXfqbVfOjeko2Jmq2KdMhVccmGWlyOMSo5y1+lFuwzDT0A?=
 =?us-ascii?Q?zwNak1nUrmvBG2NwPiFuhtQTr4K3uRbi0aQLZRXfQZonucbNZFoI5V+zO3XJ?=
 =?us-ascii?Q?QrAnex35OmvOLrEs017RFuA90QnGkQnk/uHQzQzwSmHTN46GUnHQFYRu0n2N?=
 =?us-ascii?Q?0opjL+tmmjqyWDz1CVUe0GDu1emBjlMUySXtxzy15qUjPRhLLUM8BkAzX5hP?=
 =?us-ascii?Q?Tr0iH8BJn/DAo7EvnIFE2TTOhdd2rGz7dTO/B6SLODL3vg3EMrmt4qWmYYue?=
 =?us-ascii?Q?hoHxg/k6wGWnLZAKsBaygCVGV3cyoLpRo+KUmkOlgkEjxVQrdOkRKRXyc7Ow?=
 =?us-ascii?Q?+C5temSgG3sdMdRhAFs036rKrTBpFWjdg+UuWDE8R/ACfAkXHctbLotcXELa?=
 =?us-ascii?Q?PJA/F4nSD+pggiRUGRKVe2b/6BP6TjAvDWWe+q7VCPMb4Yk8OLPJ9f0JT4S1?=
 =?us-ascii?Q?aqZ6NryKl3GHyE8bjN9/2ZuCjkDDPLtPL63sO7YIyiyzRRhzDH5dJzXLUBjo?=
 =?us-ascii?Q?MjJMTEoZJTO/w1IFScrdmGxMVWV5ujz/eMyyrDmUNcT5PxYAlF0Iq+PCduGg?=
 =?us-ascii?Q?dakNqc0SoASjCdD+WGAUvNRY21dycQhJePGU7wCX21EElEp3cYAVtD0LiS74?=
 =?us-ascii?Q?Wtg6sdJXZI7bYGdX5MkH7d/WUIKzjHU9Xat7IawzzRA/DfGanJBA7jXQ8OCM?=
 =?us-ascii?Q?sbgXnxUgd+fZFcDrnqwHrKnP4Y/tee+YAeXCHS9iqj5XRdJNuuqDUOPSN7iy?=
 =?us-ascii?Q?OyBPxVUWzi8GhDuwQ+kbaoSWqdQ2dgCXdMhG6vfHWE+n+j+GIh2o3n2SwGQH?=
 =?us-ascii?Q?QwnXhOo0g9LRkr77vC+aSP+XrLWkMG9QLq77yKWPuuxm64KSzCPQgoKW2EF8?=
 =?us-ascii?Q?58Ay+fk+zcmNS+vrnXMz9AvkxNhxMRuhEXTnLVje?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6943523-e9c6-49c7-0f65-08dc0693376d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 04:20:54.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5trnnS8zIj1h86k1NuHracg4svCimpKhMBCHjyiusgi3GlXuyQ1gYyLbwwapRwC7Iwt8vXmOBE8QZHvQJ3kSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
X-Proofpoint-ORIG-GUID: adAo5ZUF_p_PU5p1SxeuoVHcTgfcrMu9
X-Proofpoint-GUID: adAo5ZUF_p_PU5p1SxeuoVHcTgfcrMu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=943 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192924

From: Chen Qi <Qi.Chen@windriver.com>

0030-meson-Pass-all-static-pie-args-to-linker.patch is dropped as
it's a backported patch and is now in the new 255.1 version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...md-boot_254.4.bb => systemd-boot_255.1.bb} |  4 ---
 ...n-Pass-all-static-pie-args-to-linker.patch | 35 -------------------
 2 files changed, 39 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.4.bb => systemd-boot_255.1.bb} (94%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_255.1.bb
similarity index 94%
rename from meta/recipes-core/systemd/systemd-boot_254.4.bb
rename to meta/recipes-core/systemd/systemd-boot_255.1.bb
index 2b43ccf243..4ee25ee72f 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.1.bb
@@ -8,10 +8,6 @@ DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native
 inherit meson pkgconfig gettext
 inherit deploy
 
-SRC_URI += " \
-           file://0030-meson-Pass-all-static-pie-args-to-linker.patch \
-           "
-
 LDFLAGS:prepend = "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
diff --git a/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch b/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
deleted file mode 100644
index 8e563238ef..0000000000
--- a/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f85a387a67900b02c69abccb88c2ef7191c67277 Mon Sep 17 00:00:00 2001
-From: Jan Janssen <medhefgo@web.de>
-Date: Sun, 1 Oct 2023 09:55:48 +0200
-Subject: [PATCH] meson: Pass all -static-pie args to linker
-
-Fixes: #29381
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/cecbb162a3134b43d2ca160e13198c73ff34c3ef]
-Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
----
- src/boot/efi/meson.build | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
-index 2773eaf286..9a60a57329 100644
---- a/src/boot/efi/meson.build
-+++ b/src/boot/efi/meson.build
-@@ -161,9 +161,14 @@ efi_c_ld_args = [
-         '-Wl,--entry=efi_main',
-         '-Wl,--fatal-warnings',
- 
--        # These flags should be passed by -static-pie, but seem to be missing sometimes.
--        '-Wl,--no-dynamic-linker',
--        '-z', 'text',
-+        # These flags should be passed by -static-pie, but for whatever reason the flag translation
-+        # is not enabled on all architectures. Not passing `-static` would just allow the linker to
-+        # use dynamic libraries, (which we can't/don't use anyway). But if `-pie` is missing and the
-+        # gcc build does not default to `-pie` we get a regular (no-pie) binary that will be
-+        # rightfully rejected by elf2efi. Note that meson also passes `-pie` to the linker driver,
-+        # but it is overridden by our `-static-pie`. We also need to pass these directly to the
-+        # linker as `-static`+`-pie` seem to get translated differently.
-+        '-Wl,-static,-pie,--no-dynamic-linker,-z,text',
- 
-         # EFI has 4KiB pages.
-         '-z', 'common-page-size=4096',
-- 
2.34.1


