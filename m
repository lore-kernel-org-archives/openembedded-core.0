Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9428FE94131
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:53:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web11.6640.1696629182013536525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=MhDz8k/m;
 spf=pass (domain: axis.com, ip: 40.107.20.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeHHPCMbzyps/VmJXq0pDPyQSh2CBKWyQ7ebyEz8cahRMMmj4HG9wxsa/Vjk8h2lM1fbczWaUMx02B1/CkjCzIXY0GWanfXDP1fJwInLiUzr/M51kv6h4Ex+d39zHMpiRzgf5nztccv0sv0Fi42JolKiqxhsbbgy0EuuRocOVIWAq3+qQ2Q+N/PYb9GI9W1lAZJIs8EPKIDOi0/esGyjNKYL4ipDlk0gBuH+b5r8vr29hrGMPUukjP1wSpFB5HPTxqtU8Uv7q6X8e8qB+wn83badOe21LdSrK7okEStbC3u47UJmj3gOy1TSKiFgeT49KTirh6M+/+Khhhh1P5KI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOnRZMrcoBmffSwx+Z4EOQCEXEnuQ8eTZGeO4vqMFao=;
 b=AWNMonzBwafech0o7Yl7pc1QFmufVuyBmMv7HH4B+H3jHHy9GI54Nk70uNs9t0ECu+Pw19kTRJ0ytoJ6VNK0BwEzlljuu+TfjC1QKN4u9rQVjfT2OtYjt/GdQjICSxXTk1l0svqqLkBnyqxjU0uk+dA41/Oevtsa1tWlqRveKzOBN4nAmSP3dU7TgSfTppuVtCDmB/zp+XrdEO8VMC+bQlYkzrI88BlKngp8mrwQ4DZRnbERE/e5XINMUrDGVT7r73P06if15sF+dvs7JS4ZRkqgdwBN0M+IE3LqCwcBZX9hi8qzSNDvCyzFnzihaLjbkFDlV8EEfYcZQn0EDO+1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOnRZMrcoBmffSwx+Z4EOQCEXEnuQ8eTZGeO4vqMFao=;
 b=MhDz8k/m9+jc5MZbxpbkCi7RFVcZXGjZEpKUyS+4unvM7jQWhTlRx1dizaxY7tPipKXJuUOqHPPxiguAL79OV8nHRAzgXLt/4lSoCHrJ1a/+L6ETv4YnB8WzHNjXDR7tZ3Jh0/50n2NKNKiA3cvUJFvWOKff2nz14cZ2eCxf2JY=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by DB8PR02MB5929.eurprd02.prod.outlook.com (2603:10a6:10:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Fri, 6 Oct
 2023 21:52:59 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::16:341:f686:c7b7]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::16:341:f686:c7b7%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 21:52:59 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "randy.macleod@windriver.com" <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V3] strace: skip so_peerpidfd test
Thread-Topic: [OE-core] [PATCH V3] strace: skip so_peerpidfd test
Thread-Index: AQHZ+JwEzxOcIJYYN0C9MWa7sRBi7bA9TVnA
Date: Fri, 6 Oct 2023 21:52:59 +0000
Message-ID: 
 <AS8PR02MB10201DD260B6B82D11F899279EFC9A@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20231006212751.95031-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20231006212751.95031-1-Randy.MacLeod@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DB8PR02MB5929:EE_
x-ms-office365-filtering-correlation-id: c2f8b59e-5186-4788-2404-08dbc6b69b25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DNiIRU0V39Z6FOXMbWRbA/eDighKirBuwN8JXV+6+Tw8ZqRM8ubanrObice9AxaBkFVh77u3WOi56PrGXtAsbdi8xCoKgnCuLHrb8bi7MrfzltlG1N+DRk1tI5ZLfkOyoGjY+z7awGcx0RvqhwaoY3Lb1zcvoXpweJuLTLXLB2Q6pQ7ZqxYq5UXKmAJAyq8WEYTocu5Q0tx8UT9r5zMpsRZFjDKs+rXNYdSuk4+YiqdKsFT7CDbiSbQxI0nRYQKjhIp5s+x+ovd8WNrtAtpRhiMJwAzjAzjry/o4zk1wOKDslUL6dhh7seBt9BVrhJNhn766Sq24jJhjHrb4+QtAOmieXsKXzBl3sYDQylfCAlts0IcDGopURBaO77eY0I6kGuM508mGWEs78UnhRwprO7SnYFgg8P8OlMYeoUJhIti1VVtaN1lbHos1fQOQ9P9b8uYT8uwwKCfILMQDKKLuI3Eoxbv/+UYUqkbR2HxgYt87TE/rLUK7vgl87IIQoqYjzsbr5CejOAjJRgoyOAqzOSie+fGPECNunfw1Lb4vcUQdSbyQxFwB8d//z5lkN8CYdlJiJs2rHfoJjRvDCIiR9piJEjPoUypINpGNXTf0hIQ5pbD+1IZ4xTDyk2vk8Wxe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(33656002)(44832011)(53546011)(38100700002)(86362001)(8936002)(8676002)(38070700005)(7696005)(122000001)(71200400001)(41300700001)(52536014)(5660300002)(9686003)(6506007)(478600001)(2906002)(83380400001)(64756008)(55016003)(26005)(76116006)(66946007)(110136005)(66556008)(66446008)(66476007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Rlu8nSJIUtHj1e5yWTnoJ6HXRVR792ATwxYBgAlOhvcw/zdObw+ypbFmQJBS?=
 =?us-ascii?Q?QZ2zrPcmYpoYoSEzItKddpdZvIDbs3TU1AJd0q5JUHANFVQCsCfNXfzCqjyX?=
 =?us-ascii?Q?PsTAex/VOj+TJXr6K28I1GyiJFvcZ9rEDqB9CQcVYouEFopdiaCva9vVIoLW?=
 =?us-ascii?Q?6iVM+DF+lebZLvPUfcxc9oeggyORV0qU3GS17+fU4Pep7h+bvG4zADYQ+tYA?=
 =?us-ascii?Q?4YvFIZue82MIfRO4SlwEr22NbZG/RbK9B2oM1Z+E97DmMBHJiF3brgb0knBP?=
 =?us-ascii?Q?/M2bYljdDYSSKCtE9uq3FUb8AT1PhnrRJIyytQcmnidx3CRNJv9dJTPRw0RH?=
 =?us-ascii?Q?xQlOuYJspj2xjc4ETNHaT8yuOS4FvqZrMXt/fVV7PV9YwwyIoFfyHWlQuAQz?=
 =?us-ascii?Q?wOVylcBs17OugaM4snSyLX5p8yMnYEdiY56zvlTCdxA/KCVvtF3OW0q1zXBU?=
 =?us-ascii?Q?TRAOcz/w3Az1T+1EqiQ4cM2Rm+R9bHst6MCJlkR37hEMDGPpGVzV4JCm//Gc?=
 =?us-ascii?Q?LltRCGYf8ZEzTpNEidi/BzxsE21luCPbMe2DsYOlclSWv3EcG0ShVFCffTXE?=
 =?us-ascii?Q?iFnJvPGVgkimARcLlLzdipifSpoS9iZ0T/L6S1naU6sKbh8gLXRm+0ZYDu47?=
 =?us-ascii?Q?6u2MFYNrJw6EPAGL0h2vi/LlDwTymBoGjSx4WdgbKnCL8M0e3sjdl5gc+PAJ?=
 =?us-ascii?Q?eYNTOH5IdYaK2zyxCHB26LyyPqr56Lm1p3z917ACkMaq8a56N8l3pnrKFuXo?=
 =?us-ascii?Q?oEnWo4qcRHT3kV7WBsqAGeyYFc8rEyjRiqUP+2YW67xGDvZa19SvQVX1UCLY?=
 =?us-ascii?Q?6ICUCjvDijDacPYU9LzBXxP/ZFcsw+xyN4YCdr+Yw3ccu0iRyvV6w33ebpY8?=
 =?us-ascii?Q?NmDlAk8qtchZTwb3kSX4EvHJxdDpOsmtJimYzkvZLbX4haMOqw8TAwJGUfbd?=
 =?us-ascii?Q?Zr8OQ9qJp5XWKkpEkoMjsW0Ox6epFc0Ip0BSToOApWbD7e0moiqZ3JFTeSfL?=
 =?us-ascii?Q?qf50YXLTj6NM1ZE4Wac2UHH6Poooc0Z/E1xyyxUbE3jgGzTryPBM3vXs7m97?=
 =?us-ascii?Q?ZQErz133Q6jaLTWgDRXNUrGiv0LxcfWC4AVwwYoUH/4uWPiBkoTyFU5t6LzK?=
 =?us-ascii?Q?inFfkuvv5C0rS+rcB1Dydp45XbkYdThEaV+fGgwNOzn2yxQYd8P5yPtzvtlb?=
 =?us-ascii?Q?1v0ZmWMOlUsmWW+J9euhSC+CzEalnoRwtYsqIncXtazh2sHhcQvCoflvgVwg?=
 =?us-ascii?Q?iT55f4Y3pbnmDbNLHZpz1cxlN9yt1BPwVU0RWfZOECOVbtVr0HKeIxaWu+Oa?=
 =?us-ascii?Q?nXhHEF0JtQ8YU+MlD0hJoGAdw4oEYjgpG+oPv1/eCn3mJRAvWjfKnGAIMI+s?=
 =?us-ascii?Q?gBQpnexrXJ5UH0GKFFGYvBHgQECWwlyEqemU8nAFte4ICYIv7TilUJYvQYQ7?=
 =?us-ascii?Q?wN9QDdh+OrCuxwX6RdBD7ou4sltvDj/s4j5euzK1QxtOMYqeX73UEsFEONEc?=
 =?us-ascii?Q?eH7X3RQCTjc4TzFv4+fpSFcHOKo4BJ2U+HHuKJGC8ORslc9wl0aAJZFBB20l?=
 =?us-ascii?Q?/CWTSdAIP4kIzab23Ng=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f8b59e-5186-4788-2404-08dbc6b69b25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 21:52:59.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4/+LOI0pngMWP/kZbFlad7yqESJSaUlmvD9Ek56qgmPbpg8BUNLEap2t8LgBiIx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188791

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Randy MacLeod via
> lists.openembedded.org
> Sent: den 6 oktober 2023 23:28
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V3] strace: skip so_peerpidfd test
>=20
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>=20
> The so_peerpidfd test is failing in every linux-yocto-6.5 ptest run
> due to a difference of square brackets in part of the log file.
>=20
> Skip the failing test until the difference is understood and fixed.
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
>  meta/recipes-devtools/strace/strace_6.5.bb    |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peer=
pidfd.gen.test.patch
>=20
> diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.g=
en.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.=
gen.test.patch
> new file mode 100644
> index 0000000000..76f93ab613
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test=
.patch
> @@ -0,0 +1,25 @@
> +From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
> +From: Randy MacLeod <Randy.MacLeod@windriver.com>
> +Date: Fri, 6 Oct 2023 12:08:23 -0700
> +Subject: [PATCH] skip tests/so_peerpidfd.gen.test
> +
> +Upstream-Status: Pending

Wasn't that supposed to be Inappropriate? ;)

> +
> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

//Peter


