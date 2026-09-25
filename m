Return-Path: <Suresh.HA@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1E3C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:44:07 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2649.1790318636884660064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=zm/V/gZA;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.26, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q61zMgRWI6VsT9aYAWPdahgRKZlxqKB69T2ujUde1+jmhznoyFIMDA8Tf8VCekpKGU5ccfVLxDQsBhpf6IO84tSbndiUBLYIvlJ1yF4Z5t7ZtpM7OCsf87/XbvYCufjXocMCd8aZ6y97MVL3L7JQyE9IjAf/Qi/dj3jAqEHAoayBfCbw5dSQ/+aIMw0nYuSdhETrF6eM5+RdPH3vchdL+wOzI90fZTnSPcjrFBb9lEj7bRUoy+EH0emAlWoUdwyWb++wyckLwTBZfkPd12888eAoZmF7k+y7dUSVMrxcyx8F+lF4Cr/BvJLeFutEFa0CHS4WdW2mLfEVxkRHI8Stwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5dKzbTJmQAKPOIGjqqZ1u4da90TkL96dr/w0fql4LM=;
 b=ssjsXj2MJ2qXZpWqa2eQ1pBliQdVJr/5C7r/HbaJpGSRoKXHw0gxzYNsYbvl0+SbWfv2Dln7ZR0BTpBDgDc0lgN5Zhf8cRgw/w7WMikJAdCFaYs5SzMX/aUb+J26Aq7Fq+R+WQnqm/8Q1z++HBOy5N5HhNWzsjP6QRN10zDuFhvDYm+mY8rh4H6QbAbyRtof7RrarUcnu+XwQj+gLHLyHGBj/KKaV7aT7bUrrgospcw995G4hwBkibQrjLHTToTB4GIVrLNAZ9TTr80Xiciau2jGREn15nM9dNEgy5gvXiKxyTcmzR1wKGanZOiZzLr/STTP+N5GmCPy4a+K2r+oTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5dKzbTJmQAKPOIGjqqZ1u4da90TkL96dr/w0fql4LM=;
 b=zm/V/gZAPRGJzkpwL6FwNrRE0zNLMwM1lLfWdqrApR8h7YMAV188uBabx9yLg8g67sEtjHqXed0DHCr+xMLJbTDqoxTA1EvP/gDMPcCKzSh3lFW5fCq9Sp10Bo9auV6gDxyPbH9gVpuJt//Ud98iBCEm3xgS0ceZFKUf9TjPHufbDp3C8Bs+Bo0gscOP8yl98pDbl8PKh/lfTDWIJ33mCf10ZUcsf3CHKQ9EC/IuqfgzPQ2sV9gajL+bEL/6m6xmUxJH7yph8No1sdniEXAt9tUiyVHU4AInmJpt2F77YDwflTyqMR9GsgVKDlYwE/pc8Zf0EMamRoVE4AbvcoFoKw==
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by PNWP287MB6306.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:33c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 06:43:49 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 06:43:49 +0000
From: Suresh H A <Suresh.HA@bmwtechworks.in>
To: Yoann Congal <yoann.congal@smile.fr>, Suresh H A - UpStream
	<UpStream_IP-SH@bmwtechworks.in>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for
 access_fd() first
Thread-Topic: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for
 access_fd() first
Thread-Index: AQHdOsUyFrzDeZ+QH0iHlz8zIYY50LbanC0AgARejbE=
Date: Fri, 25 Sep 2026 06:43:49 +0000
Message-ID: 
 <MAXP287MB42404C1A7233A3D773FFA7DFEE802@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
References: <20260902102403.4010166-1-UpStream_IP-SH@bmwtechworks.in>
 <DLLTOCN1XYN3.12L0QQ45RSBW8@smile.fr>
In-Reply-To: <DLLTOCN1XYN3.12L0QQ45RSBW8@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-Mentions: yoann.congal@smile.fr
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXP287MB4240:EE_|PNWP287MB6306:EE_
x-ms-office365-filtering-correlation-id: 72d55e20-bc29-479b-ce22-08df1ad05b05
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|39142699007|31052699007|8096899003|11063799006|5023799004|56012099006|4133799003|3023799007|18002099003|38070700021|4143699003|55112099003|22082099003|10067099003|13003099007|6133799003;
x-microsoft-antispam-message-info: 
 JxVJasPbzitD3MjkItB6L7I4V9J4HMe3AQZg6tJfYc1L6TdNvw9OeYoRnpYdzSRh1l1ZBnWDMHKdqkLtszZwROYdBsSdmAz1qPglb58Avjb2deg5y3HDW943c0v0Tdpyqt+AqZuYSgV30KYTT+nIliWY2C3Yhbj++QfcsLUXfff9tfFnLA5Fcc4EP6ADKMTBkWpYwLlk4L7vkXB4887DDiB8EWQqKrDneTDgtBfKGHlA8RPLSyH8viz0J757EvuHsEwMnzHazIw1IyvPAS3LoPN4tns8pV5RhClkyCLafYI6UvGB0VhgJML9Ls65XG8H8ZVOfuyXY2otwldO59RLQ1poeLF0WeBzjBI1UYjyS4ddhvn2HWQAbcR5Y7xhRhZUBflJus1diou9+z3HEJvGmF7sS1FI/Ivn70O5v1bIFxcrLwkQz9lemKfUMw58jVStNvs+DSvdyaUvYGRK0nt4nc1PBwRvKyrnN23cw5RHEp4S5ZkDkuLKoscqkSvEsjYrSmTgtZj6hHi+x+Mebeya5r9ncDjEc0aK4H1dZ6U3F3/eew1HQ4N7prZOKpLlHV5zmMnkU3JY0S/LnZxjvYKmTg5qZZHrJOAweM1dbYMH6lMIC4/dWzLmfqia38IP34XYwhNRckxXe6g9ewKwYeO0G+uqoqVrmBHSKNqFbstX1E21c6rCGoybYhnPQ3HYOrCY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(39142699007)(31052699007)(8096899003)(11063799006)(5023799004)(56012099006)(4133799003)(3023799007)(18002099003)(38070700021)(4143699003)(55112099003)(22082099003)(10067099003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?poiAT+9QZ+YUINCKGZVipHMsY5P4jac/JbgfyLvNzWjXISa04Wc1HSOO/Mqg?=
 =?us-ascii?Q?bSyi8F5CN0qJequzjwnFHPZF6aYEzqr2U2Fx0Emeru/Fq6G6Ke/ODv6IOVhH?=
 =?us-ascii?Q?hPDNsTw7CM0CwQDo1yo1blVqUCWiz+/MKxVxNOPuN4ZaWhANeJ8+7CipWvfL?=
 =?us-ascii?Q?REMGhCrwu93WgR/39DKNHhVLFeUkoDm7bp3a2XHZ9vn/1ag2yg6cs6Kf264F?=
 =?us-ascii?Q?706m75fmMLMOmuaLJRgBiObDubs+9C7BqFWK900wSsxwh3ZNcNERQPeHOHzZ?=
 =?us-ascii?Q?Eg9KQ+YQKTz9UflqSmEHwg7LNr4hLYonckPmA93Ja00sjS8NmsPGmSQfoWhQ?=
 =?us-ascii?Q?UUUw3oG+6I+XLcwmtBH0sJY/y1DRMLEMKWCUU1N6jLj0/os/KlIL8ocnn9rb?=
 =?us-ascii?Q?CRt+fRMcQtnOg9X/oI6YJCEsffh2xD/q6CrCsIZxVgJYvPfl3F55l/vJ976e?=
 =?us-ascii?Q?dZhiInvggUtopSE+ZmnT55soVo2q88qP9lTTOakwRK8Vnim87j7qPAiHefk0?=
 =?us-ascii?Q?0pGV8YyuqJnB6tlAwg4HpQxqsRHbfgD3um/8ua2cPACLiE1ujrx7ASOVQyQt?=
 =?us-ascii?Q?PrcsLdxpV3oEWvrAvKnQl9i0QzAywsk+vaFp1XL98P/6ybiRyjCl9avMqcLG?=
 =?us-ascii?Q?hgT9LrH/JndcqGY1jcuZSn8NTHQttGy7IdbWcS4fXDAupEZOSBytu9yEQQRO?=
 =?us-ascii?Q?86yVs1oL4aQASYpcBKJDlV6sIA/cHYThmT+2EDHGyZrVQ8t7EaoD4bknf1j/?=
 =?us-ascii?Q?A3jblH4J7JMHHUKaMLP5YXE5+YO7ZvQFCJakF3hfe8Bjsrzqfjb4YrXBZYaH?=
 =?us-ascii?Q?qmYl9Lz/haojJcHPSl8rWg21ilU7bkSxF8iPhWeMNSAXdB0huyIfOiDHAxdH?=
 =?us-ascii?Q?WGQIJzPC0EvdaYKflnUjq165NPIrrHpXfAh5dm1VgqJYZNZqLCAzRYDQR0GJ?=
 =?us-ascii?Q?sIwAjzFjLjw5FmHRFUTNIfkn/ziEdBfxIfRpZ75cwiWpNKpI0Ek6TzFk9fqR?=
 =?us-ascii?Q?j4oKDJvhx43+2cYQUzIKPOUhW7jNG/p8oAO3qqKe/SHlEWvTGfHxlYrf1V2B?=
 =?us-ascii?Q?mpEpgdGC1hf/a0UxMAIOI39FwLFsQXKGnRiUCO8kP6ayptnxVmSuy1YmTJOJ?=
 =?us-ascii?Q?7KrvvRJ3oyfQ5fLuKdFEWXY8QBnKvs+nVva1NGnFgR9Bn5q0sFNrqF+Ilm3D?=
 =?us-ascii?Q?KHv+sEvb958va5HPoQuIdP+fJnAKtdktbrIAJJ1491zhfRV2MlFwcPUi6cRo?=
 =?us-ascii?Q?2jEuAc0eH+nOXNSk201wbym7vW2cxbMhT0zir0B3Iya/wud8Ap2fPDIPWtTu?=
 =?us-ascii?Q?ZFieifLIp5F2lIyaEYYlJ3GByDAmyhxs5A1E7WQS5we2JjxoYLytBbsi6Rkx?=
 =?us-ascii?Q?WthU9b9HwdoUn6egS5Jl0qURUCYnxifHpzS4yBZrI8zKmjD15yG7u6b+MPdJ?=
 =?us-ascii?Q?Vq0SfMpuxgGYwrwUbA9m/1NRbio8Wki+i4JOnSHpYY47G3y5HmMHGBY6BjvX?=
 =?us-ascii?Q?J9QhPweA7P8R1eMXhf4YKXkbu3w4GzoJTZIYA6lUGq1VGbdipn6oeC9a+QUE?=
 =?us-ascii?Q?nKQJytpZJ3xWTYgJVYTNMKNvxHsP4YV2STLJfCcleDG+pdi4MqPTH5wZ4PTK?=
 =?us-ascii?Q?kYmD3kv9wuN5G9kR5xn8m+TjmLIUGUJhJxr5V5D+9CvGYJRCFgvhTPj90S6f?=
 =?us-ascii?Q?V9CZ8nFd6RMQpU83JZ26/TnaYkH8P37sHuOXfzbMplpSkbdXBr+MtxMwu5dB?=
 =?us-ascii?Q?bjrwqNp3Qw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAXP287MB42404C1A7233A3D773FFA7DFEE802MAXP287MB4240INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d55e20-bc29-479b-ce22-08df1ad05b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 06:43:49.2120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wug0YTqS5yeixNI2NziGT0v0blRPN+j8OK1NKa867rQIYKHnyCM9VDI3X//V5aW1LezrYaZQvFCh8qptpeC0LGhPXleqS8i6wep5lZk9qFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6306
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246599

--_000_MAXP287MB42404C1A7233A3D773FFA7DFEE802MAXP287MB4240INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello @Yoann Congal<mailto:yoann.congal@smile.fr>,

Thanks for the review. Addressing your comments:


  *
v2 will use the system: prefix in the patch title.
  *
The Upstream-Status URL will be kept on a single line.
  *
I'll drop the "refreshed as per codebase of v255" comment, since there is n=
o functional delta worth calling out.

On the justification,

This isn't a pure cleanup - it fixes a boot-time race that we can reproduce=
 deterministically and also have observed on our platform running Linux ker=
nel 6.6 with systemd 255 (Yocto Scarthgap).

Deterministic reproduction, independent of exec timing:

Terminal A: while true; do mount -o remount /proc; done
Terminal B: start/restart a service whose access_fd() check races against t=
he ongoing procfs remount

This reliably reproduces -ESRCH from access_fd(). We also see the same fail=
ure mode at real boot, correlated with systemd-remount-fs.service running i=
n parallel with, or immediately before, another service's exec. We instrume=
nted access_fd()/check_x_access() to pin down the exact failure point, and =
captured this alongside systemd's own (unmodified) log output:

systemd[1]: sd: u=3Dsys-kernel-tracing.mount, active_enter=3D3275058
systemd[1]: sd: u=3Dmodprobe@configfs.service, inactive_enter=3D3276766

[instrumentation added around access_fd()/check_x_access() for this investi=
gation]
check_x_access: returned ESRCH - proc task lookup failed; PID namespace mis=
match or TGID thread owner exited: No such process

[systemd output, immediately following]
DEBUG: Failed to locate executable: /usr/lib/systemd/systemd-modules-load

The first instrumented message identifies the root cause of the failure: pi=
d_task() returns NULL during resolution of /proc/self/fd/<fd>. The second m=
essage is unmodified systemd output showing the resulting effect, namely th=
at the executable lookup fails. Tracing the execution path (exec_invoke() -=
> check_x_access() -> access_fd() -> proc_fd_permission() -> pid_task()) sh=
ows that the unpatched access_fd() validates access by resolving a /proc pa=
th rather than operating directly on the file descriptor, leaving it vulner=
able to races caused by concurrent procfs remounts or PID table changes.

The upstream AT_EMPTY_PATH implementation avoids this dependency by perform=
ing the access check directly on the file descriptor via faccessat(), falli=
ng back to the legacy mechanism only on kernels that do not support AT_EMPT=
Y_PATH.

For that reason, we are requesting this backport as a fix for a reproducibl=
e race affecting service startup reliability, rather than as a cleanup-only=
 change.

I'll send v2 shortly with the requested updates.

Thanks,
Suresh H A
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 22 September 2026 17:22
To: Suresh H A - UpStream <UpStream_IP-SH@bmwtechworks.in>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>; Sures=
h H A <Suresh.HA@bmwtechworks.in>
Cc: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for ac=
cess_fd() first

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

Hello,

This is a patch for systemd, so the title should start with "systemd:".

On Wed Sep 2, 2026 at 12:24 PM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: Suresh H A <Suresh.HA@bmwtechworks.in>
>
> Backport a fix to try AT_EMPTY_PATH for access_fd() first

What issue does this patch fix?

> Fix is already available since systemd v257-rc1.
>
> Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> ---
>  ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 37 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-fs-util-try-AT=
_EMPTY_PATH-for-access_fd-first.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_=
PATH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0023-fs-=
util-try-AT_EMPTY_PATH-for-access_fd-first.patch
> new file mode 100644
> index 0000000000..29dd86c850
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PATH-fo=
r-access_fd-first.patch
> @@ -0,0 +1,37 @@
> +From 55453c9671934fc7ee369788eb0a1a9c8c850e8f Mon Sep 17 00:00:00 2001
> +From: Mike Yuan <me@yhndnzj.com>
> +Date: Mon, 20 May 2024 19:33:26 +0800
> +Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
> +
> +Upstream-Status: Backport
> +[https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fsystemd%2Fsystemd%2Fpull%2F32933%2Fcommits%2Fc675851d5fd503c1ae5d=
244f041d43ae9e3ab79b&data=3D05%7C02%7CSuresh.HA%40bmwtechworks.in%7C216323c=
a653b48458b8808df18a0018d%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C6392=
56747628732198%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAu=
MDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
=3D7D7T33ZCYO013f%2Ft3%2FJyP7ATqYsT1o%2BtivCg8QVjdFw%3D&reserved=3D0<https:=
//github.com/systemd/systemd/pull/32933/commits/c675851d5fd503c1ae5d244f041=
d43ae9e3ab79b>]
Please don't split the line here.

This patch comes from a PR titled "fs-util: several cleanups": Cleanups
are not usually acceptable on stables. You will need to argue why we
need to merge this patch.

> +Comment: Patch is refreshed as per codebase of v255

I don't see any change with upstream. No need to add a comment like this
if there is no meaningful change.

> +Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> +---
> + src/basic/fs-util.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
> +index ee38e0266a..0f65af1a07 100644
> +--- a/src/basic/fs-util.c
> ++++ b/src/basic/fs-util.c
> +@@ -664,6 +664,14 @@ int unlink_or_warn(const char *filename) {
> + int access_fd(int fd, int mode) {
> +         /* Like access() but operates on an already open fd */
> +
> ++        if (faccessat(fd, "", mode, AT_EMPTY_PATH) >=3D 0)
> ++                return 0;
> ++        if (errno !=3D EINVAL)
> ++                return -errno;
> ++
> ++        /* Support for AT_EMPTY_PATH is added rather late (kernel 5.8),=
 so fall back to going through /proc/
> ++         * if unavailable. */
> ++
> +         if (access(FORMAT_PROC_FD_PATH(fd), mode) < 0) {
> +                 if (errno !=3D ENOENT)
> +                         return -errno;

You can either:
- send a v2 with the missing justification for merging the patch
- discuss it here first.

Thanks,
--
Yoann Congal
Smile ECS


--_000_MAXP287MB42404C1A7233A3D773FFA7DFEE802MAXP287MB4240INDP_
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
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Hello <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM882150" class=3D"=
tWKOu mention ms-bgc-nlr ms-fcl-b">
@Yoann Congal</a>,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for the review. Addressing your comments:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" style=
=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: disc;">
<li style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eu=
ropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; col=
or: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">v2 will use the system:=
 prefix in the patch title.</div>
</li><li style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (We=
st European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">The Upstream-Status URL=
 will be kept on a single line.</div>
</li><li style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (We=
st European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation">I'll drop the &quot;refreshed as per codebase of=
 v255&quot; comment, since there is no functional delta worth calling out.<=
/div>
</li></ul>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
On the justification,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
This isn't a pure cleanup - it fixes a boot-time race that we can reproduce=
 deterministically and also have observed on our platform running Linux ker=
nel 6.6 with systemd 255 (Yocto Scarthgap).</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Deterministic reproduction, independent of exec timing:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Terminal A: while true; do mount -o remount /proc; done</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Terminal B: start/restart a service whose access_fd() check races against t=
he ongoing procfs remount</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
This reliably reproduces -ESRCH from access_fd(). We also see the same fail=
ure mode at real boot, correlated with systemd-remount-fs.service running i=
n parallel with, or immediately before, another service's exec. We instrume=
nted access_fd()/check_x_access()
 to pin down the exact failure point, and captured this alongside systemd's=
 own (unmodified) log output:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
systemd[1]: sd: u=3Dsys-kernel-tracing.mount, active_enter=3D3275058</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
systemd[1]: sd: u=3Dmodprobe@configfs.service, inactive_enter=3D3276766</di=
v>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
[instrumentation added around access_fd()/check_x_access() for this investi=
gation]</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
check_x_access: returned ESRCH - proc task lookup failed; PID namespace mis=
match or TGID thread owner exited: No such process</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
[systemd output, immediately following]</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
DEBUG: Failed to locate executable: /usr/lib/systemd/systemd-modules-load</=
div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
The first instrumented message identifies the root cause of the failure: pi=
d_task() returns NULL during resolution of /proc/self/fd/&lt;fd&gt;. The se=
cond message is unmodified systemd output showing the resulting effect, nam=
ely that the executable lookup fails.
 Tracing the execution path (exec_invoke() -&gt; check_x_access() -&gt; acc=
ess_fd() -&gt; proc_fd_permission() -&gt; pid_task()) shows that the unpatc=
hed access_fd() validates access by resolving a /proc path rather than oper=
ating directly on the file descriptor, leaving
 it vulnerable to races caused by concurrent procfs remounts or PID table c=
hanges.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
The upstream AT_EMPTY_PATH implementation avoids this dependency by perform=
ing the access check directly on the file descriptor via faccessat(), falli=
ng back to the legacy mechanism only on kernels that do not support AT_EMPT=
Y_PATH.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
For that reason, we are requesting this backport as a fix for a reproducibl=
e race affecting service startup reliability, rather than as a cleanup-only=
 change.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);">
I'll send v2 shortly with the requested updates.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);">
Suresh H A</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 22 September 2026 17:22<br>
<b>To:</b> Suresh H A - UpStream &lt;UpStream_IP-SH@bmwtechworks.in&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;; Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Cc:</b> Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH=
 for access_fd() first</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: &quot;External email, be cautious especia=
lly with link(s), attachment(s) or QR code(s)&quot;.<br>
<br>
Hello,<br>
<br>
This is a patch for systemd, so the title should start with &quot;systemd:&=
quot;.<br>
<br>
On Wed Sep 2, 2026 at 12:24 PM CEST, Suresh H A via lists.openembedded.org =
wrote:<br>
&gt; From: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt;<br>
&gt; Backport a fix to try AT_EMPTY_PATH for access_fd() first<br>
<br>
What issue does this patch fix?<br>
<br>
&gt; Fix is already available since systemd v257-rc1.<br>
&gt;<br>
&gt; Signed-off-by: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 37 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-core/systemd/systemd_255.21.bb&nbsp;&nbsp; |&nbsp; =
1 +<br>
&gt;&nbsp; 2 files changed, 38 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/systemd/systemd/0023-fs-uti=
l-try-AT_EMPTY_PATH-for-access_fd-first.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMP=
TY_PATH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0023-=
fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..29dd86c850<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PATH=
-for-access_fd-first.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 55453c9671934fc7ee369788eb0a1a9c8c850e8f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Mike Yuan &lt;me@yhndnzj.com&gt;<br>
&gt; +Date: Mon, 20 May 2024 19:33:26 +0800<br>
&gt; +Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://github.com/systemd/systemd/pull/32933/commits/c67=
5851d5fd503c1ae5d244f041d43ae9e3ab79b">https://ind01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fpull%2F329=
33%2Fcommits%2Fc675851d5fd503c1ae5d244f041d43ae9e3ab79b&amp;data=3D05%7C02%=
7CSuresh.HA%40bmwtechworks.in%7C216323ca653b48458b8808df18a0018d%7C970fa6fd=
10314cc68c56488f3c61cd05%7C0%7C0%7C639256747628732198%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp=
bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D7D7T33ZCYO013f%2Ft3%2FJyP7ATq=
YsT1o%2BtivCg8QVjdFw%3D&amp;reserved=3D0</a>]<br>
Please don't split the line here.<br>
<br>
This patch comes from a PR titled &quot;fs-util: several cleanups&quot;: Cl=
eanups<br>
are not usually acceptable on stables. You will need to argue why we<br>
need to merge this patch.<br>
<br>
&gt; +Comment: Patch is refreshed as per codebase of v255<br>
<br>
I don't see any change with upstream. No need to add a comment like this<br=
>
if there is no meaningful change.<br>
<br>
&gt; +Signed-off-by: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt; +---<br>
&gt; + src/basic/fs-util.c | 8 ++++++++<br>
&gt; + 1 file changed, 8 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c<br>
&gt; +index ee38e0266a..0f65af1a07 100644<br>
&gt; +--- a/src/basic/fs-util.c<br>
&gt; ++++ b/src/basic/fs-util.c<br>
&gt; +@@ -664,6 +664,14 @@ int unlink_or_warn(const char *filename) {<br>
&gt; + int access_fd(int fd, int mode) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Like access() but=
 operates on an already open fd */<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (faccessat(fd, &quot;&=
quot;, mode, AT_EMPTY_PATH) &gt;=3D 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno !=3D EINVAL)<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return -errno;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Support for AT_EMPTY_P=
ATH is added rather late (kernel 5.8), so fall back to going through /proc/=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * if unavailable. *=
/<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (access(FORMAT_PR=
OC_FD_PATH(fd), mode) &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno !=3D ENOENT)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 return -errno;<br>
<br>
You can either:<br>
- send a v2 with the missing justification for merging the patch<br>
- discuss it here first.<br>
<br>
Thanks,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXP287MB42404C1A7233A3D773FFA7DFEE802MAXP287MB4240INDP_--

