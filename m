Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14838D3568E
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 08:15:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14103.1769527791231641186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KoDl2WCL;
 spf=pass (domain: est.tech, ip: 52.101.66.35, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuEqalZukZqg8bK2GcXw9YndZnnUEzsF1GQJfC+yZjh0FOml4fGxejJ9PfXlSr1xykvBX8m5x4JoqGsIFFhuO7HYSM1GC7DduzHrE+MBLrOYVs6YzMwFTB1B4Q6X2zwJB4caxsF8TgQlXGbu4q2+IZ/KwaWwPQTa87EZ3/3ZcAwjYLdoHCbPQdNllm9guqi1j9TDTRMWxRZLe8RF4tpQnhiTQNpZvhMM5d74I3zaqc/BpUiGzvQV8auM2Wm10OzfwuEdzqUrobjvxQk54DTsqINA0R2Nqblu9g3PKYTV1BBSoEw/6KxOqe1mE6WqranQSZhQVt6O8PZWxT2PZgB7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UZYRIplu/xPfeRaRN8vv1j3493H3NMoF7LgyxrpMu8=;
 b=rzIRQIp1WI48qp2epARaJ1ZUFq2bqiMyKt+TOad7jBhnLno+GohX+7JkL+TH0qBVeE0+b3GcoHhIo4EiaWzN8EfWCwRyO7c5eJ+GQ7SYlOkLKAkPBfl8Q743qJizjJw2dVDd3ApITWhyM2JQscIm8JOeN/DjDj1Hgkk9wG5qkJD8c7G8nHaBWduAfQpMcyXc4/IaFGsN8cQuk8i8IoHUCdSJhfSW+xsE7qLOAqfzT1qdUkckzTasTgIjMl8wj6sYzTOup7fohENAjRTz9s9hid4i7gF714w/OhVbO5cWKgGCC2c8ZKejGD3opE6aIyjcfNudbIY/oKAhOyCej6Qkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UZYRIplu/xPfeRaRN8vv1j3493H3NMoF7LgyxrpMu8=;
 b=KoDl2WCL+9YRkrA/mnP8n87klPlxbugt6gy1m88ICsGWbigh8rRGOO7vV1j7jPxWo2LktKOGSRcNfhwtd/EAn84tQ7Mlc14X1Rdp4deFTF1Mjm8LaPfd2Q1SxD6Oau7UZlME5gaAboJ+JiGYtMcxNaVguEGfmpecSK7Pc78IDrheCQ94WXyDPGmVFhRP+diegDVHAWMItzgrYYJJMK6zN3pEgDP4j4uMMx6Ix7ySdfglbi7A9zX0WdP/6akz/lG/SEW6/5RilW0wpGGtjkWLLruPnRtLR2bYO6lcXoiNB+xBLWoCVaPt8HBDsLTSzzik4IRZqWWAi8cZJ88vq8Yexw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VE1P189MB0975.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 15:29:46 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:29:46 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v2] avahi: Backport fix CVE-2025-68276
Date: Tue, 27 Jan 2026 16:29:33 +0100
Message-ID: <20260127152944.95922-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0455.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::10) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|VE1P189MB0975:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed46d80-31a5-402e-d5f9-08de5db8e6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WDgBUUSeTf4mOJdXaT7+Zu214Vx9lzTi6pdNwVNkh23P9m6K+erkAlmBp7XU?=
 =?us-ascii?Q?3e8gLoVf3yJ1L68y9IyFQ5ZEckv4KROLrlXgwtSZEBuZMM3aSEk+Fy4oMVIm?=
 =?us-ascii?Q?prijOM0OTCL7619HXzSLoY7JsQZ1hs/UvS/HXe4FoF4cwHw3MXR7BmC3dmID?=
 =?us-ascii?Q?zY0RTdNERJCQD7jRHso9RoZUbBhpT5pzTCE90KKL91MB1aha19XBFyovmsQv?=
 =?us-ascii?Q?4tKTMwow2ZbKAgmp2rJhs4IZnrX7g3nPzyHO4y1qC/T1009TGAvMqNH4gFJ8?=
 =?us-ascii?Q?TniwK6xyNZxXsM3KRTdORP8+3YJQrL24pjMqAatkmiCYUoHD5sXekUDcabmB?=
 =?us-ascii?Q?A999NRKhvXyXHxRMk4X11nR9wEu9SkeWm5kIbvp/qrE+qv0GGyBjz9akODtc?=
 =?us-ascii?Q?FY8uLGCfEbwTXnjUCUOH9caMMxyK4urvagYXnSvffjv3M9fCgYXIUN0j4UIu?=
 =?us-ascii?Q?N+uKw2QfFWHpeHp3/G9g4L9vO7PoOKXlQKi/iMZIe/oJJzOP+NXA/s42jRAM?=
 =?us-ascii?Q?/2/F8Y1zsWkeyUmxT9NkOsxIPbRRFCWBbfxGy4ruKXJXOaTwlI11JH519pkw?=
 =?us-ascii?Q?sgeDQy1tUO9sB6K9mLXJdqyNgOt/OIAuyPyioXg/AwaL0uyU9fAmivM48m8i?=
 =?us-ascii?Q?Zt55kxNgfpY+zuZqJu0wxo1ck76qVl/hOq0vrn2w32vFFoZ1CTZl6BanUCpO?=
 =?us-ascii?Q?+fHhlm6+xaxWUW4zd3/3qIx+CaaGvPsbWx7lT+CLJf34A+sAUw0fKE2rC69z?=
 =?us-ascii?Q?j8khAU8nTCKwNm1GV4MgmaXw7IDnP+7Jf80sO0U/zrkLhSUcOF/ZJJx6wXqB?=
 =?us-ascii?Q?/Kl4MJsUZCHB6g1J2tGRmrlDnTgIAL4nRlQ15SDVM8ZwOzk2u3An4qGZV/+m?=
 =?us-ascii?Q?CIf/AG4Ey4Bt4ilzO0bloNm9YiS8GO+dCWSq5hc7iYOmIdl2GCM3Nj2JTlc9?=
 =?us-ascii?Q?Vw0yPSXSVypxz+S+3xReJ2kTdI+1nhbNo1r9nl+/UgCV14MCwRWL6ee5HuBm?=
 =?us-ascii?Q?+Ap4/vuml7UI5zvqDuRZxePEklo1YeCr/kbf8neeseEJQ8PqoCULxZAW9uN2?=
 =?us-ascii?Q?IB0M2onrO0IC0/0Tms5l39IPi7sDdec2ffujaHOlZE2f+y+gQJgs40ioqykT?=
 =?us-ascii?Q?AKIJSChbFY/s8NAGEDhuA0f6BeSWsHyVFHwsLQC83fHQpEInveGFOgw3V/Nn?=
 =?us-ascii?Q?+hRFhGosc8tm1SIWplBBE66Vxcd1D2SO2Bz1NJamGil0mE9T/lPbwCJCh2F2?=
 =?us-ascii?Q?HwsMWjMCzftnCk4ONN89nG0VkdvnLtjwwcHvRhBmldxxCxEanLvnLKwB26xJ?=
 =?us-ascii?Q?a1HxAnhxJ8OpjxPO1fpZtucUMi63UkOfCH7Vm5S9ty6MAkoCrvD527GzVAyc?=
 =?us-ascii?Q?nrHY3Ri51LHRI0YxDQPl350yadx7qqt+LKERU5oHIa0JmVxZMlcewTxWOy4i?=
 =?us-ascii?Q?vKNJtcoTCMs6+Mxdsn3+AXBDRLvnv1xJTxFd1fvjuTn0KoBJwPS2k2IPQKSc?=
 =?us-ascii?Q?tFpiU6Q5PD8VjCr0v3KhlNbctN0T8W3ObRzTIi9jSmq0+jtX2sykdGyRQB19?=
 =?us-ascii?Q?kxJlvKGZL3WdgvJo3J77KVNNAyDylHErpA36nMo4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vw+gomTSMmRDwmOkAQnlIf8auc2Ox+1GDLfysmEYrGQiqExCTnA//Fntkl7L?=
 =?us-ascii?Q?dLGWUJQoC1qpQf2ffYb/n7iFyDh/sxY3G8fPFDJmyWdeMZ0kQqhjzx5N2RgJ?=
 =?us-ascii?Q?25/ZsimfgrpzoHZdPphzgIiAMOmI9n+aCBU1NlSrn6J+Y7Pkdfupcx7nwRKv?=
 =?us-ascii?Q?hUqlklq2o+6WA2rCbpavxbDcX23petu3tSLt7G2SiObU7naL+GX7/MTXrps6?=
 =?us-ascii?Q?/tOjClwubzMG1po7e1Dsx4Nw8DNlX6C5cxaiyLEai0roIc3bqmBvwSaeKh15?=
 =?us-ascii?Q?0JSPEfIHhlJ5ku312ZADC8Q3A+KA9J+WqAohbGSg2Zm0y9sepICTgtLxB1Qm?=
 =?us-ascii?Q?56CcdG6G6IMSN+RN+I+Xz7JY+6F9DpjT78mcV+hq7EAbB6ZCmZyAerExYxJq?=
 =?us-ascii?Q?ZJnxuOIIvgxyp789IvRWwZuDzOvFl+Ev/TWrxOlsPDsFljEKXoH5WsaQHkDh?=
 =?us-ascii?Q?/djWiY0TtXLJZKGO44ebbxvYcXM45A8XVhhAaMi55kWqqjDLFyt79MEVhXnR?=
 =?us-ascii?Q?bUhTPtK9waj270dfmH6lOryXAEDuTpPbI1t64LGuU1eAtQBUCImxipeXbD0x?=
 =?us-ascii?Q?doLzLMAMwM09l9vSt8n21W7gwH4wGipRPvKT4sJC8pVQCDMSI5QLnOtaq2uP?=
 =?us-ascii?Q?YIZYDADmzAljlbPkBjZMXkd4wRxegafHQzTfKdWGPFwG8y88NoSd5vecAP2B?=
 =?us-ascii?Q?eDuGJPgRK9Xbw4zTiGufstIcG54fZraj207BgPyojrWheQQ4xqWzsQXuEZg/?=
 =?us-ascii?Q?yRD5tNtETLIrXgnP13ScdBZB6y8zqqP9fhXSeeX7ZMzzz04TYJv3RfYe0gf+?=
 =?us-ascii?Q?bO606HwGmhkf7SFgOFiBFv5rqyURX22ntP/0AVq3eloc5PPJtNI/yZ4uLJVz?=
 =?us-ascii?Q?/b2E0/gqE1ioSbIRUwgFj+TUWBO52f+K6A5LVBKC8BtyJkcS4IP8763cSLwB?=
 =?us-ascii?Q?sjRQ/ukKSlO1tbN8u02tDNy162jY+G4+Ks3nMR3kDge/jDhvIlfA9kSzCfeF?=
 =?us-ascii?Q?1gMkPELkhEkyvg+IuwigzYN5z5DPxQnhC6rJnxaorlroZBW2ISTIySqtm1hw?=
 =?us-ascii?Q?X2AbT7vEeOMLKeR5UKmZb4EvEwXxI7qKVq4ejdA6WK2hAA9quiReBM79urzJ?=
 =?us-ascii?Q?4hTY2CJl35q/jzTv0REb7XwTjYolICCHn7Xb7V3IbaG8JCopobekk8Q1Q2t5?=
 =?us-ascii?Q?2232hFTWMW+GrgAdTICpd8zLD2Gu8o8FWedGji63X1ZdvOeN92Ku4TmJoLVU?=
 =?us-ascii?Q?oZpWuZlpVPSVEML+aMRLkWX6CY/xk9IAjtk6UDvzOH05KKcF6oOnHDl7uVuD?=
 =?us-ascii?Q?NaBn81uqF97zsXlveulzOjwBCLbciyNu6xdOyTNTLDCcysVC37PZqUJhU9ct?=
 =?us-ascii?Q?DZWjGEMzifPMnKd6ArOkq2jjVsoTx1Qd8j+UCskxvBYR44IeYus5YQuZ8DWt?=
 =?us-ascii?Q?Ee7Lu2AUwBjdW/eh7sQ6OmMjimCs0u+H6+TtFY5YxeCSekvB5aGxJPTdYJMA?=
 =?us-ascii?Q?EYcvNSt5mmT0dPaWI1YY1j3df8tsQEmGxohK3UTqGhU0prvXCwffWKGB/es3?=
 =?us-ascii?Q?SwthJ42WiP58WPXnQYUJLVMFretjPOu9tt6QiGl0fEbgjU2icEuECtl2pw4K?=
 =?us-ascii?Q?0i11mbba/AjxeoKXMNLhLvdoDF+J/EuA7UvH/8CP5kVg2bmXJXCWD7JmRH4X?=
 =?us-ascii?Q?+nKoxO9TsU/2DI5Fi+lk4g4cxZcXj/b0/+Trh7A4kjg3l0ciSZj1w3NlWmdh?=
 =?us-ascii?Q?apcDqXHwkBlQzUn98HgJ7iQnuLptOL8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed46d80-31a5-402e-d5f9-08de5db8e6e5
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:29:46.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5Sgv9qiE/sM+suTpcez7WTM0vLnt7V6Pq13tc7TQs+l5GB5O/W1Ke9HkCfbVS7vCKyzyDgV+DJAWPRemnoOA1PTK4onElDai635hdjrI9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0975
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 08:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230082

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


