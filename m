Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10767E81BD1
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:29:20 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48397.1770647355512765192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=qxSC9kBU;
 spf=pass (domain: est.tech, ip: 40.107.162.9, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0T2ZxOEwwRpFWxRpclHIjX5GvIm+Fubxls8wfV66pRXtiwZxPbRVCVpx/ZsQtJdnfzVvvSoGSMpPODBYdKByW+d7ZpdqXlFVWU09J6r456TzS5GorY4EQQJ3btmwFOxRKrICB+K9PIg1R6GIRX9SqqAZvo6Zilw9l8Fkwx2HzfUZS/MzgbMdGOZje4i2e5fsj9YfMWGujV6IGSwgrFw8p8zS2NmMz2VN9U8q6e3VuyO0Ab8EV1/A68VgzSBViEqcKYGVTKrnBlVQhqWrpqLA5aAnBwt58IANoSntLLtPSK5J+TjXLC/5CHlnKl2W49N7CmxKKex5cs5TiNgLjVQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQm5v2dRqlyh8yLdt0JeIXU7WuAX4b5XRFD8GWl68tE=;
 b=D1LbwGLEdf8cVDHylOMazIXfBzbAYdKJCiLsN26YJZO3iZOhsd0hDEu7rhjAZ4I74WQlS0OSdd4oMG5Z0bKynrHZ8wO9goohIUdo2XNqhQq+j0++Lm8RpZA0h5JjxvX7bbUXu4ABAx+InbBjj9sYhxnAkUdxVAiPrigW4/jdW6ccI9YnHLuffOfsIrzMBR2zx817M7sP5ooQl/Za/ipmUuISa6V6WLmZP13zuRZlMnAewXt95zW/K55no2WlklRDbE21i61RzIyd4y+c+cGcasfSlUCOSOoPUjtMCDYgMhJ3PxvGc6Z5jlVWOY3kgsY7VCkSr0HPbTxr8BgJQOi0FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQm5v2dRqlyh8yLdt0JeIXU7WuAX4b5XRFD8GWl68tE=;
 b=qxSC9kBU6wcxpJYdV2c+C+39AP2D1g3/wk9GkT8/zI5Wq7xCEswGEazBlnntU//cHc3bhChrbvSe8RUMLPsx9jVTTC3Q248/D/e3JPQJ37acGuUz6IN/R6finMSu5TSzSiegqapVsKtbJ1kGFFIdV535st/ZfWgUViuVCoeNwicEspEYylwkHnqnDFKSorvMF33NEDrjBkfzfbbBw6XqJYrF3YAHdgBPzoXb7ClyJB1DzmGJhyvWEfttNngAefiSA0ONR95ObmHDnvB6Cgqz6O8SpaTOspV8kpoUPWVjEwuyvq9GlvpC2szA0RygsnmZA1BTq9fVhc8hEzSXyRqSZQ==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by VE1P189MB1007.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:161::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 14:29:10 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%3]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 14:29:10 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
Thread-Topic: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
Thread-Index: AQHcjFRBG94s009+zkiaVFzeFtlDnrVycHGAgAgXm3Y=
Date: Mon, 9 Feb 2026 14:29:10 +0000
Message-ID: 
 <AMBP189MB319623FF519A834A108CF3DDF865A@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260123103715.32186-1-amaury.couderc@est.tech>
 <DG64E3A1Z773.2J4Y398TR4E3C@smile.fr>
In-Reply-To: <DG64E3A1Z773.2J4Y398TR4E3C@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|VE1P189MB1007:EE_
x-ms-office365-filtering-correlation-id: 4d61a7e5-3181-482b-f12b-08de67e7970b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?531jil081Quu+taZ+r0AXpYFLnqLukT96gsY27NfYltIKQ8WCUIDvFYG+YGU?=
 =?us-ascii?Q?JOHTz90i0/DYTB/456HYHGh+S12B3cEo9qL6q4ssHuYCfEHSzQMKzyOvDa69?=
 =?us-ascii?Q?9D78axBh6SAJpj7g3wiEGzU+tgz3zPo5lC0tONYxpY18plzmRy5NHTPwuu9e?=
 =?us-ascii?Q?GC80zytkySVQgBrlnqVx2Ganp/IFVI7wdmHxHtMNuoI0iz+Gj0iCDhSJpdQz?=
 =?us-ascii?Q?dfiCxvEH2YTEDgKud4huQwll2Tn1K5Zj+fwMRqOY2kTOL9n1/DISRpEZiaIf?=
 =?us-ascii?Q?oOG3VRzuqW513r4J+Ljg2g5pmMTuxl8dKwXBj7Q1ZFdQ/rD1M+9ORUzaBzzE?=
 =?us-ascii?Q?vV7s8ZoBMsln0/5fmpECgN1ZS+0OQyxGnpO/Pvi1GFPiCoQb0mqZIxbbJx35?=
 =?us-ascii?Q?QfnPoU6WgsQKo4XYlDHo034PqNIDlEjebue+beFxc/26Tt4XQ6Yge6ehyV1z?=
 =?us-ascii?Q?gMjlXYOk6ugxIphjPzbA2Hj0WyshhJbXassIdaLPUm2UA6Y70IR16WDnjDyw?=
 =?us-ascii?Q?0bIw8IczXGJQG/DBcuBF6Sz0lpB3vrCbr5hr5xRligbBXQGGdHeidqnjw/Fb?=
 =?us-ascii?Q?N4dawazovtgRReQYoRN0fW2aYxy8zmFnvIw8MJ5r39ji8cpa8pkvhCOmoLbP?=
 =?us-ascii?Q?LQhqSQT9bSyr5LMjKpJgKNmmiKdI1PbQ447toWvMzGDjnCUUxwjXDOPV3G9N?=
 =?us-ascii?Q?iCyQZ2Zpa1Ym09DHDRkCqXYwXmXDRmWHeEm2m553HtadkE7U0IuTllKNh9Hp?=
 =?us-ascii?Q?hcuMuBgEQ7lf+D76rI1lvp6Dq3JRWTnXqcKqp7zwKE/3bTzzkOAtYDVXLZta?=
 =?us-ascii?Q?NnJ2b8gG8TgEDOXsSwDtmfgEMXwcTMkhkmThKlDUSNu92j7LthFqtsb8oGO4?=
 =?us-ascii?Q?zHlQLaj84XfqA7/ZqIk2nBcfryM6dzNHxx1KIcE2Offa1JItBd53RypYd7JB?=
 =?us-ascii?Q?0+z1q0go1ni32PE3xiqrS3mQDwj7J6eeOylC3kkfwdxt/XO6XWxXCb0ntdAL?=
 =?us-ascii?Q?XbiyaVsvLqUuc2gOXu+7L5Ww1n6gd2p2wWZ+ZiXicxFCk4lwqsSfKLYIQ1bj?=
 =?us-ascii?Q?+vXatZp/cWobue9VTbEgYZizF/r5ksImXxsAN3IL4geXovBXgub6Aud6L80B?=
 =?us-ascii?Q?Rn1Xdm5P7qaDTP+8GGEUlF6DK7t6/28awTNvZcFHFtGIamXGP+AaudpKVEGQ?=
 =?us-ascii?Q?akUEH4rDsuEhym89G/rpoVBNFAiSRM/ChKKd+mKu0vpzkBpGhlEgoSBNijuZ?=
 =?us-ascii?Q?Dc7qWMTghDJoQy6PdXzs3cOvfabHDNOiWrcHMWcdpQtp49yYn607xI9fjQXg?=
 =?us-ascii?Q?I9465ryu5vXvMUxLuomHCXlZPMlobTLcDrtHCFt9wMpt+gEruEbbMUCf7XGx?=
 =?us-ascii?Q?5wl+HtuaY2QsI/Idb5E70Fz+A1uEWKfjAgt484tXaRhGzGMo8t5ZiyUxb9K8?=
 =?us-ascii?Q?ixvGfmZ1amGQrMdDj3Us1nHnWYdzwqNxi8QbWMEgkpXEqyYYht5MtCmkNMsP?=
 =?us-ascii?Q?RfBL7eMUCwcG4dAiUw7EswJTOyHQmi/cCxvyjMCasRR3m7gcOUht3grt6L8x?=
 =?us-ascii?Q?ADZymXFz4COWnEWv6B79smgynTnPTmi8Cp9THuhH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CpYjO4/OIgwEOJ0VACNIDe87+1ci2xCfe1wQMJJKfBdxL+o7qFUgEjA2zUBM?=
 =?us-ascii?Q?2peXJXuh1vTej1FnkP6ngyuGlg2CNVlSXl7Us7uvmAi7WiK+0Cvvitkl+OLj?=
 =?us-ascii?Q?qZL4+ICiOqzvuf9lJwmr5SuYk6fFmh5GyunIAS+HIXgmtH9C5xe2bpKpY/5X?=
 =?us-ascii?Q?ff+ZlnWe0Pv23CRSq94Qv4ghlDYsVJjwuJ5xg5sui6xntoKHux5/XG0emkLR?=
 =?us-ascii?Q?WMAcSNh7sbM4zSHJo6IAByPUSd0JZInZRV50vDyOBLRAJOW99A7j9UPotKyC?=
 =?us-ascii?Q?6B/G4Lmo0OPatxFZxWqqIytd7qABnZvr2rh7SW4/Ht6RejZMX9jHUsJpI2wS?=
 =?us-ascii?Q?CXbwwbCxRlAcSIPXJc9I2mWctB3e19JsPE53sNvs3zk71Fr1pTQEKBbNVewt?=
 =?us-ascii?Q?p/3jL0uR7sSp3FMDiMW71OeQIl0fESmRuVR2BuXFFdKsaOpoUAD9VkIuJQPZ?=
 =?us-ascii?Q?wBqCk7LMEZWsrgTIZJVLD+gc2mcAcSG++4f6fCS/9tzuG9e3JsB62dd3R39N?=
 =?us-ascii?Q?Ls8CbUes7LXcJoNlZ9mRT7AwnxF8FQYl9q+VdDkFD9b66hc5sUilddiz7co1?=
 =?us-ascii?Q?44uXSt5/oiDdIjDtPW98wcRE2BYWFzfDtXzHLOMef5a0qzwo4ymXvpyjUP8G?=
 =?us-ascii?Q?3uaP2hSOAhg+fJ0HhNZYH25Nx1eDXV3jTu+tGlYBTxTfC6S2HtZnKgFr0TE4?=
 =?us-ascii?Q?oweDTMQvBK/1PxHqQJVamD5oC3iqLt5cwYVcKKaiRz4u6z04wDtQb9p3Ps/F?=
 =?us-ascii?Q?YUtZtG0uDT4bOScFVsEq89GCyFEjCVKugHaQd20QnDK9FfYhXNMBzaxnTZ5c?=
 =?us-ascii?Q?UsZlBVqxb/7hugNm0RBhzNhkshixM/iQd/DRbkXLG5Jjm7YC3VE4yPu5CsI9?=
 =?us-ascii?Q?CY5C5FkDdgKIsKeIT+P036kvkZ12rToaCR6ofezNeREtl5I3H1+WcswaS+vF?=
 =?us-ascii?Q?n4goe/U31/cnVKpOyAsESK4kmd2bWd8MY8m3RZKlCvom3n8lrP9fRGn4oQMg?=
 =?us-ascii?Q?hbzosUuthodp25Mk2poyp8ILUazdkIBwqSy4NcEnWPsxm37E9q33G0xz88ye?=
 =?us-ascii?Q?Ph/i5Qt1pAXf/KH5y4267cZjdzHVBU6tVAedv7G/37cYuRl81uTkH0Rd0Oce?=
 =?us-ascii?Q?aLvpSECh3lFkFjKqsafu7XV2KgKmEcFueH5w8UPUSDhjx++MWfX0hXnLu/Uw?=
 =?us-ascii?Q?UjQCC9ppaPK+hTFi9QQDAa9Broh8S0E8ookdwIcqr+WZygnsuKZrGVxvGSgm?=
 =?us-ascii?Q?NtOOv6xErKP0+TEDFLQn0/XQMRev+08HUMLQjFmu4IUhxs6hw3N8nIXHvO2E?=
 =?us-ascii?Q?6J6+EOhSMxqWVSbrVzhfmopwknt9hMUKmGC9tBKWKhaGVHzq55cLCURBL4Om?=
 =?us-ascii?Q?fj2gvxPUYYKCJURoQZuMNAW5OLXtM7OQFuKthZjEvtF2FMUUs1NHNTQB+A3k?=
 =?us-ascii?Q?gC8Iz+4KUeJ4T6tUGaNnfIOeJYmAD2W8Dtjx7pDOHWEajArVN4lL/8Jsa7gN?=
 =?us-ascii?Q?k15gM5uooMgC1G3kZi/Ck5O9U//4RZegv8VsqYuwMKUZkgULpFaZTaD9a5TN?=
 =?us-ascii?Q?mLMEfiGRYMk8c/Jmvsz/l8/18f4cd2fCArWzhM+U7x82vbo7c6/oyHeZlK6g?=
 =?us-ascii?Q?NZNlXf4fQNKZWB2LcH5eTyJt2Asr6hyrmpnoWPh9in+vXHYoHx/vKlG+MztK?=
 =?us-ascii?Q?KgWcz/FKG616UjTj/DSFsafXmZ5J1XC5Jj/OvpTEU8sBNZRhm/e7bV28p8hG?=
 =?us-ascii?Q?QeNkPeHSdQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB319623FF519A834A108CF3DDF865AAMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d61a7e5-3181-482b-f12b-08de67e7970b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 14:29:10.2350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TwtDLFllgOzweuxfN7nxr5yEB5UWBfkmYows1dS39yIn69/pLr6EB9cFfqYXwuPYBtYKh3ucJR7kI431l1BEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230805

--_000_AMBP189MB319623FF519A834A108CF3DDF865AAMBP189MB3196EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the heads-up, just sent the patches to master and whinlatter.

Kind Regards,

Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, February 4, 2026 11:53 AM
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468

On Fri Jan 23, 2026 at 11:36 AM CET, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> avahi: fix DoS bug by removing incorrect assertion
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  2 +-
>  .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.=
patch

Hello,

If I'm not mistaken, this patch does not have a master equivalent.
Please fix CVE-2025-68468 on master and whinlatter (by upgrade or patch)
and, then, request a backport scarthgap.

Regards,

>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index ffda85c0e7..8f8f4a0d88 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2023-38473.patch \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
> +           file://CVE-2025-68468.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> new file mode 100644
> index 0000000000..3635cc8d53
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> @@ -0,0 +1,32 @@
> +From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
> +From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> +Date: Sun, 2 Mar 2025 18:06:24 +0100
> +Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
> +
> +Closes https://github.com/avahi/avahi/issues/683
> +
> +CVE: CVE-2025-68468
> +
> +Upstream-Status: Backport
> +[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b672401=
79d309a]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + avahi-core/browse.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> +index 86e4432..79595fe 100644
> +--- a/avahi-core/browse.c
> ++++ b/avahi-core/browse.c
> +@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
> +                 lookup_drop_cname(l, interface, protocol, 0, r);
> +             else {
> +                 /* It's a normal record, so let's call the user callbac=
k */
> +-                assert(avahi_key_equal(b->key, l->key));
> +
> +                 b->callback(b, interface, protocol, event, r, flags, b-=
>userdata);
> +             }
> +--
> +2.43.0
> +


--
Yoann Congal
Smile ECS


--_000_AMBP189MB319623FF519A834A108CF3DDF865AAMBP189MB3196EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hello,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the heads-up, just sent the patches to master and whinlatter.</d=
iv>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Kind Regards,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, February 4, 2026 11:53 AM<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-6846=
8</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Jan 23, 2026 at 11:36 AM CET, Amaury Couder=
c via lists.openembedded.org wrote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; avahi: fix DoS bug by removing incorrect assertion<br>
&gt;<br>
&gt; Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-connectivity/avahi/avahi_0.8.bb&nbsp; |&nbsp; 2 +-<=
br>
&gt;&nbsp; .../avahi/files/CVE-2025-68468.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 32 +++++++++++++++++++<br>
&gt;&nbsp; 2 files changed, 33 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-202=
5-68468.patch<br>
<br>
Hello,<br>
<br>
If I'm not mistaken, this patch does not have a master equivalent.<br>
Please fix CVE-2025-68468 on master and whinlatter (by upgrade or patch)<br=
>
and, then, request a backport scarthgap.<br>
<br>
Regards,<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recip=
es-connectivity/avahi/avahi_0.8.bb<br>
&gt; index ffda85c0e7..8f8f4a0d88 100644<br>
&gt; --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb<br>
&gt; +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb<br>
&gt; @@ -37,6 +37,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}=
/avahi-${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-38473.patch">file://CVE-2023-38473.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2024-52616.patch">file://CVE-2024-52616.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2024-52615.patch">file://CVE-2024-52615.patch</a> \=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-68468.patch">file://CVE-2025-68468.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/avahi/av=
ahi/releases/">https://github.com/avahi/avahi/releases/</a>&quot;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patc=
h b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3635cc8d53<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Hugo Muis &lt;198191869+friendlyhugo@users.noreply.github.com&g=
t;<br>
&gt; +Date: Sun, 2 Mar 2025 18:06:24 +0100<br>
&gt; +Subject: [PATCH] core: fix DoS bug by removing incorrect assertion<br=
>
&gt; +<br>
&gt; +Closes <a href=3D"https://github.com/avahi/avahi/issues/683">https://=
github.com/avahi/avahi/issues/683</a><br>
&gt; +<br>
&gt; +CVE: CVE-2025-68468<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806=
d226bf8b67240179d309a">https://github.com/avahi/avahi/commit/f66be13d7f31a3=
ef806d226bf8b67240179d309a</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + avahi-core/browse.c | 1 -<br>
&gt; + 1 file changed, 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
&gt; +index 86e4432..79595fe 100644<br>
&gt; +--- a/avahi-core/browse.c<br>
&gt; ++++ b/avahi-core/browse.c<br>
&gt; +@@ -295,7 +295,6 @@ static void lookup_multicast_callback(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; lookup_drop_cname(l, interface, protocol, 0, r)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* It's a normal record, so let's call the user=
 callback */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; assert(avahi_key_equal(b-&gt;key, l-&gt;key));<br>
&gt; + <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; b-&gt;callback(b, interface, protocol, event, r=
, flags, b-&gt;userdata);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AMBP189MB319623FF519A834A108CF3DDF865AAMBP189MB3196EURP_--

