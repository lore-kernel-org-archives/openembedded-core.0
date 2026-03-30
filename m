Return-Path: <Suresh.HA@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3299FFF4939
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 03:41:13 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42627.1774842068853460761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 20:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=Skhr3NAt;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.36, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktKSLDX0YsKF+GD2WlasU+7yWif0gpRel8zc43uF9T5YWJLuRWZEz4OoFg9BoiUL92/ZmdkDlbVjKU9A7gnJRDG2EcBoQorxxQMV8CbCOi1N6KBvRffgrXlgVLfA5W5rkOAx2BVXT0RF8F+oniq6xkHGQqww4MtdOy25zRlU49b+EYXfxSZc59C4d9u1CRa339THn3D6Kdfpr1JNA70T5lRHwfG3uxHIG+A+CtuihqMjIGsPamYAgT2E8Bvr7AdM3O6fUByuXu44Ai8XB/cpzQRXsEBbX01/aYDrwkJqbSto/7rD94p61IBUKy/lovPfWv6Zf3OK2Rw2eBbfhRJB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8Or88K7hHSN+jWTNb+jrg9d8CVI9JURV6ml13WkQ3o=;
 b=rGiPnEzyZy9DYZUvKuUcUPbXXBsuaficC5u1Ol2gqowzxZQCB6utb5z3nKJ6eoW9SnmjRYU5rOHV1qr3Kr75eot7er/b+g44vWseBLaR97GXO3JBpRCJ/k7+lZRhurCa4MzxTefUWHWcFZImgZrx0ZPXBaN9HTweIV2t8w3Xc6D5PFr0i3+b52feSk1kUQZDB1lowzH2lFS5cuPUiNYmH1ILjXDn7ijr9RJQhuBEwXJ1YRiAl++9WsaBbeVfYxm7uFRfJwTT49xjRY1txpT1+Hq0VKvhs6TD3Ejs0CTa5yaL+X3auSa1XTD/K0Op1twqB4bkm9/ydyS5dm7lKkOjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8Or88K7hHSN+jWTNb+jrg9d8CVI9JURV6ml13WkQ3o=;
 b=Skhr3NAtgQiR9K9KUxV60DWp9QThMfBqtD8y/Dl0y/z2dkdXQ1BeBBGHusExvBBZtA/YlPyLz+aLGWjSdAbTcL6OD5cUf5x4hL5l32dl5DkTDFZSQY9OF9qbkxygy+k4tH3z7BQtbGObHh29Rr6sMoW9msl8C1SLCrLg4XqHvmmsTcSVfBYlconW9i3zr5K8y3EoOpVJUcpB0v37lE0pijz3QJYzjYgTtfR4KCZyITXE6Y7beTpPvNl1pIDvuDWF7nTqK12aWCabLiUWZSvarbVZjOE68csb0gvpNpkqqMbTMMmlk04U8QKRvmMbP1zYnxPXH3Ekt5Ig7FD2jo8mTg==
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by MAUP287MB5487.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.25; Mon, 30 Mar
 2026 03:41:02 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc%7]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 03:41:02 +0000
From: Suresh H A <Suresh.HA@bmwtechworks.in>
To: Yoann Congal <yoann.congal@smile.fr>, GitHub Send patches
	<git-patches@bmwtechworks.in>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: sureshha <suresh.ha@bti.bmwgroup.com>
Subject: Re: [OE-core][scarthgap][PATCH] systemd: backport patch to fix
 journal-file issue
Thread-Topic: [OE-core][scarthgap][PATCH] systemd: backport patch to fix
 journal-file issue
Thread-Index: AQHcvPOnjFwBrOK5ZEec0dyMk+HPNrXDCyWAgANot7g=
Date: Mon, 30 Mar 2026 03:41:02 +0000
Message-ID: 
 <MAXP287MB4240B28D59FD845A8BF2219AEE52A@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
References: <20260326073855.2075702-1-git-patches@bmwtechworks.in>
 <DHDYJPLHXWYQ.3J88UZRXHD7MN@smile.fr>
In-Reply-To: <DHDYJPLHXWYQ.3J88UZRXHD7MN@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXP287MB4240:EE_|MAUP287MB5487:EE_
x-ms-office365-filtering-correlation-id: b483fd3e-bd65-47e0-dbd6-08de8e0e2a2f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|31052699007|39142699007|366016|1800799024|376014|38070700021|13003099007|18002099003|22082099003|56012099003|8096899003|55112099003;
x-microsoft-antispam-message-info: 
 fXvggQRKMnNCKZrQcJdBBrx3gHT4Qvy8Tau5glJJeYFM1c0O/HpxXNrDOh4Dlr7PZIQgfoGQLlxlFPhu6f0n/cYf2g8YfuoNcBqJqCGDyOf/h3ayovWIt5mygrtwEI90XDWjhhZWAGwATYwqVNR1Dy0sJS5bOKJ4Mcn9PU1COULgYnzp7Irxc8pB5MQV/YSm7rGc7/sUjw5BENrdJwaohir9snP7PpE6MyPrtZPCMwO8f4skwNIkIB6D7PeoarwQWcQQu+xKiXjg994BzZb8xJpwzdKE98/IjPaT9RZk7k8NpEhTT+eb7djr6tFKr5IkU+DQA0Px6YDlmqL3XWKPbU31bCl5j5RPEWBB0zVaAgRConb93B/vsAXdu2A633MX3W+2qLB9jYb1rzdL3b4FwoJ/p66oTtxcPXWHKLD4ZhnSdWpo5kYr9jEIqPdMe7lU9NEWg42klRr3fVCq2iNGRw/fHYSetnPYsPINmAyJ1yxX7q087wBn/LOyjLMUSwiQPuZoqA0ODjs/PxDBa1VrdeMSxCEiQWx6WEoXwgR+H3TU1lGAqy5iKjMeKphLKZLhli4/N7mvVKy+lsIQtbBUv4ae5Yl8Ty1KLZkY7/lF6d4Qaht80jAEnjPBjQPjOvmToBxLMHVLFMvFZCYOYhXkr+doH0IzAHHxGwuyjg4CFgVmxY7AC+orsBeTvaR/aPJ4kx0rqXASgE6lKNdxVe38OuwAxdnFCgzUCqDzfe8sihg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(39142699007)(366016)(1800799024)(376014)(38070700021)(13003099007)(18002099003)(22082099003)(56012099003)(8096899003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?D3E5KkWBS7YrPqpunOP7Bfolib0aAMJkRWOlMXo93Pxqs7vVMB26a9845547?=
 =?us-ascii?Q?evh2oVXSx6vjsRDGnbotRWS0YHJccP+I6Xl547ETmCrrdwPgJ1tJz78nuTNe?=
 =?us-ascii?Q?UQM7HKnWA7tVXikUVRv0zMr9vANNFfsfsCocvbhAPhnPkHNaD0Or516R+FKT?=
 =?us-ascii?Q?WqqiWcTPIOJv37xprVrtQXGrmy5YZ9g5POH7BJiFFlfFhbgWoZe21EEFQFl0?=
 =?us-ascii?Q?N5VYAHBAcAIB+tKoQ40UkdIzIFlcUls8HIcqERz15F5dIHLWO4YQetlBElX5?=
 =?us-ascii?Q?5cEKLwj3KMOEMevuMtbfEcwWBRiaLVD/p5MEmD0lNWdr2m+Z9JrL40QK1int?=
 =?us-ascii?Q?MX+B6y3eccOtL5iOJ8RIv0bfgpTIb9Qnw4UVLQXQWQuHiiK52GC4gCyY2SD+?=
 =?us-ascii?Q?wQYhGMRDPlkpvcVOr05mUgHRKIOgzCXNDvfrWcNXxOk14/EXjAlt7241qk1s?=
 =?us-ascii?Q?6N283nyKqhZAotym70uOU264wc47Cnl6zPJi1EwUzJpjRhDXf/Z0wRcgqF3r?=
 =?us-ascii?Q?d9XBADvT7eXtRV9SFk4xJSihKyDZMoFVkKXL0kwruM+UhGe0cG6UlWXDj1+L?=
 =?us-ascii?Q?S7/LQYLiLQTGxD22I79tBdKLWveNzpb0zm1xMuI7DxIJilJ29TRZ7yVOZYAj?=
 =?us-ascii?Q?dPUl98IP8vTasPGLD/RbDNTAlTtY4Cbnan7osLOBkXwK0alC1hERUqb4H58l?=
 =?us-ascii?Q?O5nfRcuYumSXSxJya790YTJn4pQpFBxGV/5aojp14OIUE8TwRgRmiB/DqNQd?=
 =?us-ascii?Q?eyRCrlty+zgEj4VyBzEaUKKe0Pfrho8Y/jHzZFfQfvTlexmHSKAAGO2wCVeV?=
 =?us-ascii?Q?I+tWH9hYpPYKrVI5Zl5BUe60QSpVqp18e137b8rK8018raQ4pTadEDDuo6MO?=
 =?us-ascii?Q?L/z/I5YxPHLyf2XFeFag87G39Om/FbS4LW7UxLJJLjTI6fq+IShmEVhtpj1d?=
 =?us-ascii?Q?J/eIhg8zsxsxFOO+zl1ysjVbDDispNuN89nhjq5WQ4VWemUjC50aJxKYZJId?=
 =?us-ascii?Q?5jbDVftlkY7yiEyQaRgD/XHyfUEWvBx3MXjxBjwHaYdXRp7LgenZrNG2BEZ2?=
 =?us-ascii?Q?j1UqvJf3hUnJg0cwqy+W8HZOGCt9Wxc4IpOL0gC0MH55YiH5jp03sMMnXgWc?=
 =?us-ascii?Q?7l1AgGJiJzWoM5HQqpCHTi9sEBuhHIbhN4mbM3TNqUeIbWcBtpiQUHvBCVck?=
 =?us-ascii?Q?vzFxSWyDeg8Ww8mXqiDJ8LQJmEPSpR5PyVORKsPiMULC0a/srNhlkCnwzCx/?=
 =?us-ascii?Q?7FertTNtRbCXf9JfKgLHXbEbV4YbaUcEwoNTF73PI6D6Qytr6rZR0nSXetyi?=
 =?us-ascii?Q?gYutX/4Sa7ic63OjlA8qvQZAfyK6wFM13bvr7MJFWIIFku3wJgtrrmYMmiYv?=
 =?us-ascii?Q?9AxkGwWdT4jLN+8zi/s1aOHFl2fk0jqYCQmPMSz09MUUX9d2+HNyQtDNkttT?=
 =?us-ascii?Q?bN+RTqbFsG+Nqp9BqAUHbJvrh2JvRGlg4cN68uCGUJRsmxxI0CDSuYH6veKA?=
 =?us-ascii?Q?JabJSlL7xXFPepoO4LBPWamNBA9z2LQh/fEd3Hki/+XMYiEtNQQFcnz/UDB9?=
 =?us-ascii?Q?bqGUdLWhutPgsRAWfDErDSlwmmYyIVLwQHFQ+dXyzQ2OOLnEai3+J6ke9xcp?=
 =?us-ascii?Q?XBZksr3SsIL39UHK6aQQIH9fXX8vakyZ/8U/b+HASmvdm2qAVM1FNFKp2OUs?=
 =?us-ascii?Q?OSMWSeL3dATExWCTpVzNpGAaOZ3v+NARBAD9gpw9Gfc59Sr9ij0XmQEWe0f+?=
 =?us-ascii?Q?yh9rPzandg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAXP287MB4240B28D59FD845A8BF2219AEE52AMAXP287MB4240INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b483fd3e-bd65-47e0-dbd6-08de8e0e2a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 03:41:02.1044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7MTsKd0UOrZI2kLbNwwoea9b+qQWhGoJjNyDkAgSkGVQX5HxQYTer62baRjHNEgzJfC24IK3O5NEHhFj2K/6f5LlBYAXKLNz70Tvif8o6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5487
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 03:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234195

--_000_MAXP287MB4240B28D59FD845A8BF2219AEE52AMAXP287MB4240INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure, will provide the patches for whinlatter and master.

Thanks,
Suresh H A
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 28 March 2026 05:06
To: GitHub Send patches <git-patches@bmwtechworks.in>; openembedded-core@li=
sts.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: sureshha <suresh.ha@bti.bmwgroup.com>; Suresh H A <Suresh.HA@bmwtechwor=
ks.in>
Subject: Re: [OE-core][scarthgap][PATCH] systemd: backport patch to fix jou=
rnal-file issue

[You don't often get email from yoann.congal@smile.fr. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On Thu Mar 26, 2026 at 8:38 AM CET, Suresh H A via lists.openembedded.org w=
rote:
> From: sureshha <suresh.ha@bti.bmwgroup.com>
>
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files
>
> Extracted from systemd MR:
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fsystemd%2Fsystemd%2Fpull%2F40378&data=3D05%7C02%7Csuresh.ha%40bmwte=
chworks.in%7Cde821bb1bc804569944f08de8c59abcd%7C970fa6fd10314cc68c56488f3c6=
1cd05%7C0%7C0%7C639102513948436427%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki=
OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3=
D%7C0%7C%7C%7C&sdata=3DeCA1bKiWVhr71752KM1cSzcFWuvML4MUpyBr6dcduDI%3D&reser=
ved=3D0<https://github.com/systemd/systemd/pull/40378>
>
> Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> ---

Hello,

Thanks for the patch. It looks like this is also needed in whinlatter
and master. You need to send this fix there first, before I can take
this on scarthgap.

>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-t=
rigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0=
023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
> new file mode 100644
> index 0000000000..5f5551870a
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-=
assertion-on-removed-or-.patch
> @@ -0,0 +1,65 @@
> +From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Sun, 18 Jan 2026 19:15:31 +0900
> +Subject: [PATCH] journal-file: do not trigger assertion on removed or
> + corrupted journal file
> +
> +When a journal file is removed or corrupted, then the value `p`, which i=
s
> +read from Object.data.entry_offset, may be zero.
> +
> +Note, journal_file_move_to_object() checks the passed offset and return
> +-EBADMSG if it is invalid.
> +
> +Fixes the issue reported at
> +https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fsystemd%2Fsystemd%2Fpull%2F40372%23issuecomment-3762907261&data=3D=
05%7C02%7Csuresh.ha%40bmwtechworks.in%7Cde821bb1bc804569944f08de8c59abcd%7C=
970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639102513948454648%7CUnknown%7CT=
WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO=
IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dm1w07Fr3ZqgcLxyCWOhvGvP9p=
pf%2Fb8y0zv1c7AfCba8%3D&reserved=3D0.
> +
> +Upstream-Status: Backport [https://ind01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fcommit%2F2185c30de3=
33b09f46ef28b743b123f45e774738&data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in=
%7Cde821bb1bc804569944f08de8c59abcd%7C970fa6fd10314cc68c56488f3c61cd05%7C0%=
7C0%7C639102513948467501%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DNysT%2FxRixv3o3%2Fmyw0JcWOVPwItEav2ZI9dDWDDC8ug%3D&reserved=3D=
0<https://github.com/systemd/systemd/commit/2185c30de333b09f46ef28b743b123f=
45e774738>]
That URL point to an unmerged commit.
I think you want this one: https://ind01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%2Fsystemd%2Fcommit%2F112cbc37906fb=
97afe0ad04164262cf62d0af5e9&data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in%7C=
de821bb1bc804569944f08de8c59abcd%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0=
%7C639102513948479759%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO=
iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7=
C&sdata=3D3e11ATD0T%2FGIB4Qmii4ElwYX96iGYHJbZgcG2loWzcQ%3D&reserved=3D0<htt=
ps://github.com/systemd/systemd/commit/112cbc37906fb97afe0ad04164262cf62d0a=
f5e9>

Thanks!

> +
> +Comment: Patch is refreshed as per codebase of v255
> +
> +Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/s=
d-journal/journal-file.c
> +index 08f3b82..633de5b 100644
> +--- a/src/libsystemd/sd-journal/journal-file.c
> ++++ b/src/libsystemd/sd-journal/journal-file.c
> +@@ -3305,7 +3305,9 @@ use_extra:
> +
> + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t need=
le) {
> +         assert(f);
> +-        assert(p > 0);
> ++
> ++        if (p <=3D 0)
> ++                return -EBADMSG;
> +
> +         if (p =3D=3D needle)
> +                 return TEST_FOUND;
> +@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint=
64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, ui=
nt64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, u=
int64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +--
> +2.34.1
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 87e186bbfa..504d6cbef6 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.Se=
tNT.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://0023-journal-file-do-not-trigger-assertion-on-removed-=
or-.patch \
>             "
>
>  # patches needed by musl


--
Yoann Congal
Smile ECS


--_000_MAXP287MB4240B28D59FD845A8BF2219AEE52AMAXP287MB4240INDP_
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
Sure, will provide the patches for whinlatter and master.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Suresh H A</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 28 March 2026 05:06<br>
<b>To:</b> GitHub Send patches &lt;git-patches@bmwtechworks.in&gt;; openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;<br>
<b>Cc:</b> sureshha &lt;suresh.ha@bti.bmwgroup.com&gt;; Suresh H A &lt;Sure=
sh.HA@bmwtechworks.in&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH] systemd: backport patch to =
fix journal-file issue</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from yoann.congal@smile=
.fr. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Caution: &quot;External email, be cautious especially with link(s), attachm=
ent(s) or QR code(s)&quot;.<br>
<br>
On Thu Mar 26, 2026 at 8:38 AM CET, Suresh H A via lists.openembedded.org w=
rote:<br>
&gt; From: sureshha &lt;suresh.ha@bti.bmwgroup.com&gt;<br>
&gt;<br>
&gt; Backport patch to fix systemd journal-file assertion on removed or cor=
rupted files<br>
&gt;<br>
&gt; Extracted from systemd MR:<br>
&gt; <a href=3D"https://github.com/systemd/systemd/pull/40378">https://ind0=
1.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fsystem=
d%2Fsystemd%2Fpull%2F40378&amp;data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in=
%7Cde821bb1bc804569944f08de8c59abcd%7C970fa6fd10314cc68c56488f3c61cd05%7C0%=
7C0%7C639102513948436427%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&amp;sdata=3DeCA1bKiWVhr71752KM1cSzcFWuvML4MUpyBr6dcduDI%3D&amp;reserve=
d=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: sureshha &lt;suresh.ha@bmwtechworks.in&gt;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
Thanks for the patch. It looks like this is also needed in whinlatter<br>
and master. You need to send this fix there first, before I can take<br>
this on scarthgap.<br>
<br>
&gt;&nbsp; ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-core/systemd/systemd_255.21.bb&nbsp;&nbsp; |&nbsp; =
1 +<br>
&gt;&nbsp; 2 files changed, 66 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/systemd/systemd/0023-journa=
l-file-do-not-trigger-assertion-on-removed-or-.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-no=
t-trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/system=
d/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5f5551870a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigg=
er-assertion-on-removed-or-.patch<br>
&gt; @@ -0,0 +1,65 @@<br>
&gt; +From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Yu Watanabe &lt;watanabe.yu+github@gmail.com&gt;<br>
&gt; +Date: Sun, 18 Jan 2026 19:15:31 +0900<br>
&gt; +Subject: [PATCH] journal-file: do not trigger assertion on removed or=
<br>
&gt; + corrupted journal file<br>
&gt; +<br>
&gt; +When a journal file is removed or corrupted, then the value `p`, whic=
h is<br>
&gt; +read from Object.data.entry_offset, may be zero.<br>
&gt; +<br>
&gt; +Note, journal_file_move_to_object() checks the passed offset and retu=
rn<br>
&gt; +-EBADMSG if it is invalid.<br>
&gt; +<br>
&gt; +Fixes the issue reported at<br>
&gt; +https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Fsystemd%2Fsystemd%2Fpull%2F40372%23issuecomment-3762907261&amp;=
data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in%7Cde821bb1bc804569944f08de8c59=
abcd%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639102513948454648%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dm1w07Fr3ZqgcLx=
yCWOhvGvP9ppf%2Fb8y0zv1c7AfCba8%3D&amp;reserved=3D0.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/systemd/syst=
emd/commit/2185c30de333b09f46ef28b743b123f45e774738">https://ind01.safelink=
s.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fsystemd%2Fsystem=
d%2Fcommit%2F2185c30de333b09f46ef28b743b123f45e774738&amp;data=3D05%7C02%7C=
suresh.ha%40bmwtechworks.in%7Cde821bb1bc804569944f08de8c59abcd%7C970fa6fd10=
314cc68c56488f3c61cd05%7C0%7C0%7C639102513948467501%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbC=
IsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DNysT%2FxRixv3o3%2Fmyw0JcWOVPwIt=
Eav2ZI9dDWDDC8ug%3D&amp;reserved=3D0</a>]<br>
That URL point to an unmerged commit.<br>
I think you want this one: <a href=3D"https://github.com/systemd/systemd/co=
mmit/112cbc37906fb97afe0ad04164262cf62d0af5e9">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fsystemd%2Fsystemd%2Fcommit%2F112cbc37906fb97afe0ad04164262cf62d0af5e9=
&amp;data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in%7Cde821bb1bc804569944f08d=
e8c59abcd%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639102513948479759%7=
CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJX=
aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D3e11ATD0T=
%2FGIB4Qmii4ElwYX96iGYHJbZgcG2loWzcQ%3D&amp;reserved=3D0</a><br>
<br>
Thanks!<br>
<br>
&gt; +<br>
&gt; +Comment: Patch is refreshed as per codebase of v255<br>
&gt; +<br>
&gt; +Signed-off-by: sureshha &lt;suresh.ha@bmwtechworks.in&gt;<br>
&gt; +---<br>
&gt; + src/libsystemd/sd-journal/journal-file.c | 7 +++----<br>
&gt; + 1 file changed, 3 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystem=
d/sd-journal/journal-file.c<br>
&gt; +index 08f3b82..633de5b 100644<br>
&gt; +--- a/src/libsystemd/sd-journal/journal-file.c<br>
&gt; ++++ b/src/libsystemd/sd-journal/journal-file.c<br>
&gt; +@@ -3305,7 +3305,9 @@ use_extra:<br>
&gt; +<br>
&gt; + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t n=
eedle) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(f);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(p &gt; 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p &lt;=3D 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return -EBADMSG;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D needle)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; return TEST_FOUND;<br>
&gt; +@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, u=
int64_t p, uint64_t needle) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(f);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(p &gt; 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D journal_file_m=
ove_to_object(f, OBJECT_ENTRY, p, &amp;o);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r &lt; 0)<br>
&gt; +@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f,=
 uint64_t p, uint64_t needle) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(f);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(p &gt; 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D journal_file_m=
ove_to_object(f, OBJECT_ENTRY, p, &amp;o);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r &lt; 0)<br>
&gt; +@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f=
, uint64_t p, uint64_t needle) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(f);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(p &gt; 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D journal_file_m=
ove_to_object(f, OBJECT_ENTRY, p, &amp;o);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r &lt; 0)<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipe=
s-core/systemd/systemd_255.21.bb<br>
&gt; index 87e186bbfa..504d6cbef6 100644<br>
&gt; --- a/meta/recipes-core/systemd/systemd_255.21.bb<br>
&gt; +++ b/meta/recipes-core/systemd/systemd_255.21.bb<br>
&gt; @@ -29,6 +29,7 @@ SRC_URI +=3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0002-binfmt-Don-t-install-dependency-links-at-install-t=
im.patch">
file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0003-timedated-Respond-on-org.freedesktop.timedate1.Set=
NT.patch">
file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0008-implment-systemd-sysv-install-for-OE.patch">file:/=
/0008-implment-systemd-sysv-install-for-OE.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch"=
>
file://0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; # patches needed by musl<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXP287MB4240B28D59FD845A8BF2219AEE52AMAXP287MB4240INDP_--

