Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC86D2D8FD
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:20:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13618.1769527244974290763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YweMBlrI;
 spf=pass (domain: est.tech, ip: 52.101.65.71, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQA+/HOKsQhf/EjEi4i182Yo7d8cU8ObvW0iRyc9bC8JYFy2yFgvlDPcR4tGEY3MU1gwvwewSb0evB8etRmtBBqBzCVW5Z0EWTp0vYGseVlaiMwh5KIfxG1yCnpj+XbeaeYl/bkmO3rVtyWg2lylXOro91qkzBr0GE31c2SGMqlhhl2jUUcT0228LA3XWDnnLE1/4DGcp+H4VSZhXnVoXL2x5m4i8oZyF/wFYvI+o8qsZpvdCAUAUP7GptRR4giqWtntyENDsehhlOVSQvPYPDwspoOHxNmA9FgYheTnUUOQdLrBbE03/MkHDhyxLhOgyoRmydtfnS+uTQfzHCTnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UZYRIplu/xPfeRaRN8vv1j3493H3NMoF7LgyxrpMu8=;
 b=jNaY4DFZtemt8blaLEaE5bgF2mCQDhh+6aAY7gjfLDckuHNBXGqFPBLnWbU1RX/KydLznC4gpZ3tclkiJbgFyVshM1eIId4EcJmb8JcgfkPTsvevIlRhUD8MllYtzQbpJstEfU2Jhunw763NPy15yCWPU688QLKVpqRqNFifKfuqbQqsHLK2Z6VbN/tF4OMM4CkEL47RWZMqzRbPynwfzzk+Zo+y/8U2aq8a9iEI+aB+wA9mvqqGjDdvnnLTWrKIR7F5FgH5q8aV/rPA6xgRK5RB7Sfs+1/RQM4zTVKhilQbaR9OAMgM8pt2BGOjfRzd+udyrsybqMaTBbvlQEE/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UZYRIplu/xPfeRaRN8vv1j3493H3NMoF7LgyxrpMu8=;
 b=YweMBlrIfmH81aUwf6H4hosgxqBpJbGVIlZaLW7zOyHT1xXJUpNBbD09kabCphs3E+5euePH9shjJyZmiGQ4bZfw8FCv064QZv3a+6ydFDTfJgU8Qp/ceNznoBBl6eUnzlosIICedOXE9AhJUFiwbkG+WAlhS3vOeTf7F8jX5w0AVTcD8mYvWKsq9BLnNee1moASJs3vtjbarJq5VxjIIWEfJbsUNPU5ZdEQNJfpzr/hA61eLITPxsWHoOedq2oxeruDHFTZQEBzl8pOn/N3XM1iGdL93CJuc5QHanujFzvf8wkTEkq/wkQEOsEKEknx1CsIhRCvblUEMyEUPDiKuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM0P189MB0705.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 15:20:39 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:20:39 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [PATCH v2]  avahi: Backport fix CVE-2025-68276
Date: Tue, 27 Jan 2026 16:20:32 +0100
Message-ID: <20260127152035.94651-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM0P189MB0705:EE_
X-MS-Office365-Filtering-Correlation-Id: 11170ca3-3c82-46a6-5ca1-08de5db7a0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5/NxnmSbDBnrwaaDdkv/GUpnvoaHh7YqsAHZmEqQFha7UboH7Ys8FtwndMp2?=
 =?us-ascii?Q?mfF9sPa39tVftz+9rPj0AwpNuhG/675YWG9k1Y5mVsDSLAU8ei6URVKlsUZp?=
 =?us-ascii?Q?tg5ZfrtzIpOtOm71aR3/g9BqPYpp7LjSXE0B1+yGxcKeeUT+eq/L3VGgVSuG?=
 =?us-ascii?Q?KV9zCnEz7R6QNDBm+qyV6aij4IoI/CoNyJk/w5U88p3IfN8IWpk+DZkVYyes?=
 =?us-ascii?Q?2EOY9aOiesOfbDqngTVdWNdTzl1cuzdNNknPbI+DO55EoQvJjfkfAfXruM9O?=
 =?us-ascii?Q?QEQOBiaJHgiwRdLgKLuVmkK+49gierRFXwlfgp839Tu/I8JKKMMfoQ6q9WIq?=
 =?us-ascii?Q?tPYNCzXa/AERwnVX0V8mJPwGEwKh9Gbr+I+g/OuclkyFd2WLL2zh2++BM9v0?=
 =?us-ascii?Q?1x/YwiXAQzBo7l7T5GF6ekDTJpoF4DLxhCOXLdvseZmnqoO9VXNp34G3SAyQ?=
 =?us-ascii?Q?DpLuYhFx4+ui6awO9UVAU89xTKw+nvl6TBrvlIqc73dDuE/nEZwuIReQO97g?=
 =?us-ascii?Q?JpXypLW85FnF1NgdOqbmE8Q+gt/iQcE76e2oHH7ckeE2fR6BupEYbbmllBO0?=
 =?us-ascii?Q?+w4nZJqz2bcHToHWJ4rQDhvty6vcmW+5axiSxN7WXujfQL+JkFQiatAfC6Yk?=
 =?us-ascii?Q?QpHe4yRuqkJO4n9C1P+htXwo9h3E3scZ0SFE5cNhSA0ZV25isvUiOGoiqeNp?=
 =?us-ascii?Q?Oq18/VOn4i4hpXawJ97rumMwshsXaBaHAwxDr996Ft3l393QrfPbDntdX9hI?=
 =?us-ascii?Q?hCR0B9FxwHABu3EKaxWza/41WCDt2tebAtNBnIW47G8TG4hJgvJ+X0wZQFjN?=
 =?us-ascii?Q?ZiSb3sOC+DIcw2iwZpdUzfxAz7jmH49wg8DYJOSmmZYk2E4pf6LAUBOZQLPT?=
 =?us-ascii?Q?Dv8X9jqFW+lXtQb+5z/4BidOqe4WdBoPKQ3vISMsyfx9H20duKyZa0GwGpa1?=
 =?us-ascii?Q?5fmrL3wlNK2eNbgfy/0PIHdX2TJU/5Xbsh76xzcFT94cS1zAX3m2LXCd0pTN?=
 =?us-ascii?Q?BiGvGex7Gz1IZFpyBvHQRhk9Hk8jO+L/QngRcI0GZwIQhUabpuf7IPlCgbDN?=
 =?us-ascii?Q?gEU6ZhOISOguuGKNXJlsz8sE/oaU/tP5a3lRHJGsrMGmxpN89A6vvnTy1G1W?=
 =?us-ascii?Q?eUGyeB3D/80PaWnHfXL9bgynneKuCzF5rf/V2D8CJ0ahLLGIHPA3MMV3goOr?=
 =?us-ascii?Q?2C3A7/WwET+1jTHxiA/t1cvRkMVMXewFxiCFs8vtvIQ0TvuF9vDnP2wEqfnf?=
 =?us-ascii?Q?XM+39KT4CDWNgJzV+VC4rspmrFnupzLJ6bzz5ildmxyfEDPBs2yY50B3vUam?=
 =?us-ascii?Q?FwDzPhwVppvRs14cWgN4HLfdj0PP+XKxW28YLxI2CHJIqDW4C/DfEPqTaIk7?=
 =?us-ascii?Q?AhwzgvNpAvuARBfMU7ZGOc+X8hXrw2vTIasc3YmJtY9Lw0fus/oTMqLa+tVH?=
 =?us-ascii?Q?QNFO6DM4l/LQ4Ryo+4+9PgDTZMBqMNWRW3XKwwX7kvsQUUPj+5sUgBVK5ZFo?=
 =?us-ascii?Q?4ltuvosJ1qyvphd4DSdE/rqM0X8wSqrMrJtmU6JW7P1ebvg1uC2+G/JevBfR?=
 =?us-ascii?Q?W/YtCU5BgG+n/GdX3VmeZXC3gzYbo21hJjrAHGlT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+UWIr4+cauV2XghjVmgs4qefTCb/juHuKGs6VgN/V8EjGT71CnRJ5Z46MPl+?=
 =?us-ascii?Q?cSz71DH61MNpA6qJ7TbsIKSmEc8jypJQRE0Z4NBrFVGA+dhNn1Ag1u6GKnnc?=
 =?us-ascii?Q?sfLspaZ9ew4p8Ge1NfC62K3GTQSA0e740NDiM6iEew6dT/HCsVy7DhI23qz3?=
 =?us-ascii?Q?HXlveoxxgS+XU2+Af/aol9iaDAQEEVtXBATyNTK0KeT0aV11YphZJkbpsO1k?=
 =?us-ascii?Q?IlsLElFkQtlQPHlUrl/wHQ76GLcNr0LPjgFEqoHnBXrZ85QYRbKo8HYVe8/E?=
 =?us-ascii?Q?G0XNgVCuCvXRCKnaPrQ2waP05iDBRHkX8F6DLaTW0ad1c82S8QmlsQXHEyuX?=
 =?us-ascii?Q?g1TvJW9rnDTKETpJzBQd24+KsYS87N8ZRomehq+2X7vfQHS8hjUeWtGE8fYo?=
 =?us-ascii?Q?zZooGLyqSmajgVRsnAojOH+QNHitb8OLHmwi2ryrOcQreEYWZbc0paoHNkZK?=
 =?us-ascii?Q?IIvKjrt2QG8ZIlR7uFe6wo9/KiXMzgfm28gALFGoIsslagSO+f3XCk/eIscV?=
 =?us-ascii?Q?50OyhbpjlHEJn78P+s6ejfdrjtYO3pDQ4utiXjchg8fxgst/uCpbkH1H9OpQ?=
 =?us-ascii?Q?UratkKIC0/TIbpAFxOF+cibNBOccHomJhlK6EpyDBWLC6cMv0kohvmsQLmU6?=
 =?us-ascii?Q?HNB0h+a21mbz3qFO+8Wl+hyHHNbs3ZkcoHESQX7MY2uNZXNOx/5lIXCCT+vK?=
 =?us-ascii?Q?kpWO216TL7KxFDF1322i/AXrdKz6XD/oMUWlWyjC0fMwjz1SDfcwD3tvqhJw?=
 =?us-ascii?Q?8qhqtG8tN7GSKL1d4PwQy9RCVE65fuPh0s/oT2TnmcqAMj7JArTTDVDVYiYJ?=
 =?us-ascii?Q?cD+XTePRLL96GW7o3DcKeazVYicxSjBvzqdVqvdfW6EZvO9n+xIwFEMNjcZD?=
 =?us-ascii?Q?Q13FlEvXeErPm4s9l7KdKx2a1yAaCuJuDQ++FWr1J/mG+7ZBPErHkgCwD7/s?=
 =?us-ascii?Q?kBnN0QmpKPzaIqr/otv9B/VRjTE5S6654GCbY0/fnX5XSVYK14nUiXUN2OwI?=
 =?us-ascii?Q?fnsOi8srAoZAVDCHA8MBvl93BmB2iyWFCeLb42HGTK7cWlbyPRu699llifM0?=
 =?us-ascii?Q?TDyqLIbwxARXr+Ij/93TCE/LC0JdXV83od3TDjZgPfRdX760b36RMnBxc3R2?=
 =?us-ascii?Q?l4Vx9lQh46BZTGVtIRAgXOIgm02UWAGeT1xS2qN7juDR5sH6FErz12FVoAUG?=
 =?us-ascii?Q?aJxWqjTurCni0yFnXzNzQIjCKlbbKP28WcQ0pCkv7TFX1hu+pbXRd2Tpny9n?=
 =?us-ascii?Q?nh0b7CsCTimJYefvSKFAc1Dc4BvOMx+KhKMoEE4Pb/Q/9zQoKym+j3biJjUJ?=
 =?us-ascii?Q?2aXUUkAxiSizXC3VfD8/RDdZi0vsK3KAAy0C3rShqiFGj4n672w6G1LC6MdP?=
 =?us-ascii?Q?59TBxD3Jk3S7AMOEdRVoS5i0YuN5dNYNDq8KClD8TyP5APZp3i3zlaErV2MA?=
 =?us-ascii?Q?30OeQLlYvsJ8gSwgh0obphKEuzh7vc0+W99FYQ+yHMriS/OvVN4dXIOLafDz?=
 =?us-ascii?Q?eZnkW4wHMIA6NcJoNW6AjD6zAsojqFFUgEh1NNiT3LQwqFs8NWtZj/zmzwdc?=
 =?us-ascii?Q?db74SmQfbiFiBu7/gRE5MCb/EFGvVTI3jmBZ97tw4HsFbOIuj93643KcAaBo?=
 =?us-ascii?Q?QeHnI7nlUiZRaCdTUnVhdWo0WWCbVdP/IfHyby+vcM8NZVI7osXSpneCDCWV?=
 =?us-ascii?Q?EdhPHd4h3HE+3ytFNPIWHe/gt07x/dTGTbIDWchGOE5RUUnOSL8x6O5DtrLq?=
 =?us-ascii?Q?Cg6+vg8wfaH8F+vMv3241RqwuOMImU0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 11170ca3-3c82-46a6-5ca1-08de5db7a0be
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:20:39.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3hAud5ul2xPSJxCsCH8OVJ6cIrQS8txEPSpg9+GgD5zi9aRivYLLLpCndS69dRCF+0FhNZLkT1gCpTFqIxSwd0nxssiramu8UYnbRbRP1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 15:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230053

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/avahi/avahi/=
pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 7930bd3037..bb20fd17cc 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
new file mode 100644
index 0000000000..b3e11f9597
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,68 @@
+From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/servi=
ce
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --metho=
d org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient d=
isconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, membe=
r=3DResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' f=
ailed.
+=3D=3D307948=3D=3D
+=3D=3D307948=3D=3D Process terminating with default action of signal 6 (SI=
GABRT)
+=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pthread=
_kill.c:44)
+=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
+=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
+=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.=
c:725)
+=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
+=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
+=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
+=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple-wat=
ch.c:563)
+=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-watc=
h.c:605)
+=3D=3D307948=3D=3D
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commits=
/0c013e2e819be3bda74cecf48b5f64956cf8a760]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e..59d53cb 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVA=
HI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAG=
S);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_W=
IDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS=
);
+=20
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup=
_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;
+--=20
+2.34.1
+
--=20
2.44.0


