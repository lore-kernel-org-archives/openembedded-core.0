Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C37CA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:52:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.40])
 by mx.groups.io with SMTP id smtpd.web10.39397.1756129965630594133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=egt4iNT3;
 spf=pass (domain: siemens.com, ip: 52.101.69.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ovexw4gKl18ljkN3q7u8KpEwygHVvLsPNWZWPJa4Zq/wQc4CU1m+B6ElshwJohm0akfddZGx/TIdWfMYmqd+RLYj8zZkfKl4/KcN2pOuYtlup/scjCDRtpIYcjGIV4w1L1PciY00lxbOcQ7RjMsvjw/m1lKXn7F/f8++KvhDpnlCs4/q6k1Ml4d2/LJTnhfR+8wNxnM1mWf+p13Mrf3Z0aVcibquElFy1bdfc3MaTLN2GnYwLtya1/QCmSA6B+276BS0x9mdMwVOWgiUGz2cc7O61ilvtgpqvK6XDhYK16C+pCjlyn9BKyDWd6jE8Sx10bxnRsCNS68XZE+TbgodhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqVoQFRuWGG/yCfM04RYPQNlTVmbvo5S9YMzpsABRQg=;
 b=BjqP6jqwq9AE+y5sSIg0S95R+jgPvDwnx3rPbD+OuhnZeDXLfk2c4jzoQgbyOdsLpYwS5KY8xK4aaPfqhLudt0q50SUgn55oX4HACPUohxp32wn0dxuIfQwfxyluixIqrC+vFvHhG6rm05WV4WmIa5plzKecoaXtKAOFrJofVCAgI7Jpn3PTS408xJ7WBJWMN7iU3An9xhjFmx2Q5nIxiTIjB98u3xTeaIG9isFj+WSMVlsIBiXWwj/bK0tKVxKeM1ZleTt4veYo1k7SYH1q07kN2gLmNTPVMVyDsCXX465Hl64eI8RjD5oHjt0qLzHyxJYIPIDa60D9C5+o1bq/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqVoQFRuWGG/yCfM04RYPQNlTVmbvo5S9YMzpsABRQg=;
 b=egt4iNT3qJJ9Re9mE36n1gQgudBl8VipRND4+nS/47JJiIUqDxU6lsOoW3Y/PDWQqopqpYU19lTrLB+NNIHySAmONk6aB+Sc4eQ8PGjYVaKeQZCdPEjxZcT3SmSyjmwe+9UUuB1jEkUb2lLTl/VkQ1bgSRL6xL92MWPKFoPnOYQAkoGJsNayC+BW7wLrDjhdIT+p4XEmf6EnwN1CPnoFhSZ4sU1yG5jrbWIF5Zb2I8XrNQPLW+6A+7f9JCpT1QMWAI2lG5n9XyGT5j0fw+IwIyoa4Pd7RIdXf4t9DfXN5hBX9WX9qSx1ny5riGFc6Q0mMTeO4r6K7WXXMjl+jCAgoA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 13:52:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Mon, 25 Aug 2025
 13:52:40 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar][PATCH] nginx: patch CVE-2025-53859
Thread-Topic: [OE-core][walnascar][PATCH] nginx: patch CVE-2025-53859
Thread-Index: AQHcFcdWUcHHn/xiOk29Q8+QU6hBsrRzY2og
Date: Mon, 25 Aug 2025 13:52:40 +0000
Message-ID: 
 <AS1PR10MB5697BD5B1ED887BD87781C0AFD3EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <185F06D00E5149CB.25356@lists.openembedded.org>
In-Reply-To: <185F06D00E5149CB.25356@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=efdc345e-3b85-4d30-8422-9fd1e405f83c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-25T13:52:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7315:EE_
x-ms-office365-filtering-correlation-id: 462d8480-078e-453e-07b2-08dde3dea8b2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?1QLgFqBkp2IPK6UZ5jeP3ENyyXtUroyDRXaQ+WRaxsfCcbmQ1SEbNpAmdxjp?=
 =?us-ascii?Q?xvNWXDgGjGGvmB1H8dWgk/nn2w+BUgvDALrCXeU6yXUHd6FMbj5t83PvKTt0?=
 =?us-ascii?Q?QRR9i6Eql+ZOPRgKPbcWeqPNsj2TTwebuJRiRwh2Mg+WzZsDtFgn8fxpLH1c?=
 =?us-ascii?Q?2B+d67fRmVIffTjTWkmaosB5pExhDTiult3Dsmm8dOiBBZZKp3GiarF45k9O?=
 =?us-ascii?Q?L+vtBYtdsrD0WlRiC/85+qRKPKNtuRqxogb+v3ysuU8EYbCU2sLNhKX86Z5f?=
 =?us-ascii?Q?6huCzjvW0UAsoHRyvZyG1RNZ6Sk9XJivOOI377uUu+JEfd86LSmkibvvVSt2?=
 =?us-ascii?Q?Q1vp2/lp44tOcCtlWiNz9+yDuQezcHO2yCVG9ZUWPdcBPwv5UDQhqT/8OxPk?=
 =?us-ascii?Q?QBzoVTtrzCWxH7QoHSKErt+SD9UXevmndlyYFn3T7YjnE3beMxgd7ol9TlK+?=
 =?us-ascii?Q?iLXxvJdVfDetk62AVmFH2jBlJ7avBOqoxaSgdlvKF6YXy9iYN/0oOKf/6H5y?=
 =?us-ascii?Q?4RhOUnNE5y24n/muNyZnX38IsN+wxZYUOkvmODNPrRb/RQ1QBkbYbWo2cAMm?=
 =?us-ascii?Q?i7LiFkXhyoKIAHyWrI0CwPu+JXtA5pYuN3rcXJtICViIFzUOZi9fdo46KumL?=
 =?us-ascii?Q?y28CavmGBX4aJzkQU5cXlsTgh+ppFP2LJchZxNlSdDdgO8ZctAMuf2K7B2XA?=
 =?us-ascii?Q?Ai7rlL3kcu7xOEVzgUuNWIV2VHoLS8IvE+ewQf/i1ijd+fSNHFz6Xfzf7iwW?=
 =?us-ascii?Q?B0cEbJPW3Rmk+PpR/2jNBEMEKpGSxnGS+TL7iNskjkIF4rLYT+voDprJ3LKz?=
 =?us-ascii?Q?K+W5R1ZZiowqCR1Vfw/oetdnIqCobkpLSSZSp5OS9t0z/yneK5m2hl/K5jh5?=
 =?us-ascii?Q?puF+EFHphnOb6/dOcPv1IQ8KIWecj9dyVj37C76emm3Vl6M0v4JaJg9N/TN5?=
 =?us-ascii?Q?Z9HPXK9AmQS5bEhrbR0FdSQyUjA7hShdYtyTIKfsFd04/HTyZw28XdfgmLKi?=
 =?us-ascii?Q?IABLYE09nP7RVvC5OY8dmFNuzIUxGe/bSE0IA3sxURcXOYuO6r39yWe5tQA8?=
 =?us-ascii?Q?ZgA6N0TcCoknw5t8BNrJiWLls3xse8Ys5CqAhbMRgTSg4WXeCp5s8re5EmAL?=
 =?us-ascii?Q?c38lX05CS/n3viP3c/KEv9Us4uAP+IDsKfubDxCloxL52VMN0HBZZGBXgGn6?=
 =?us-ascii?Q?VNhcS4Qqg0+ppULrJWdp1d7vWV8yYM+9RZHDg3HpeXeiAsE+3uonXfcT+bx8?=
 =?us-ascii?Q?YSqfbZ/HLdfDFIgBkDkVNP5SH3nGMYT36Z7VT0coNl52trfOnEeyZbImtS43?=
 =?us-ascii?Q?1IPC+OgW/Why+yWpAydys1uCxhE1j2sIVGanEMTXsKze/i2Sd8uKqYb4Bv9z?=
 =?us-ascii?Q?rZpTNLbDu7lv7xkDsIqPkJVtc2xqKee5JIHaigESm444ksqsjPuOQZkcVGR2?=
 =?us-ascii?Q?jRyqfqeWeyywG7dnFYhx75gX6NDI29gDDJerh8c7dOOC7bZI9oQENkF87SjX?=
 =?us-ascii?Q?LGR3/4O/tp1Sa+c=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1PuKVK8v4mfHOY6je49uWt2BV9uZXMRQpDyNTtgWAWvkZ/meGuoYEg9xzA2n?=
 =?us-ascii?Q?olqW3+VEV0Z4bDmbsS9f4T4Dt1O9suhJ/blvYx95qeidHovgVQj9ri/btXHE?=
 =?us-ascii?Q?vPuaQONWhh5OU+FvkIm6/65WtvTHyzcq/o3EvUmwyWZ6ky8dVKNv0pd1tmdN?=
 =?us-ascii?Q?G32sQVYCyyvxArOjGo3xKK93N62CJ8GIDvx+iv0hDN6WM8xMnaFFEP93HTtL?=
 =?us-ascii?Q?dKVWoy58CREPoaIRgRgXwdOm6bErlSfJSZ6tVFQpS1qMs46TZZznlgVsXEJ6?=
 =?us-ascii?Q?s4VG/K4m8wRIkU1IYbSP/oP8AWUOjGVIcchmWChWGyv4TgKqCCw6+UsUuV2D?=
 =?us-ascii?Q?r29aVOgsN8yPP1iy/39RE6AyLolLzsBT9R3/jL8qGVpIQSTXHexR2yD8e8Qo?=
 =?us-ascii?Q?dAVUajelNdJt/92CZyUtaiVHHQnby7sgQOAhCw3ExHd+10001vjx5alRiSBi?=
 =?us-ascii?Q?q91UG2CAq+bjw+aiO/mGDLvT1HCQWzzmqF9toCmnbboNUx6ZkDT3uhDtYFbL?=
 =?us-ascii?Q?+CU7pte1FNswrwIKTlZoLZplIRfTHED2hVlss0GAzVd8im8ClARhl2U/Jnrb?=
 =?us-ascii?Q?P2oG+sc4+vVkbykGTtYeg+b/8V2v/67mVrWB1MVr791nYfiCLjmOS5pxyPjq?=
 =?us-ascii?Q?oX7REcJV/kZdqNQlp6AGpWVZK87JuICVC9JijhuoiPQtDJ/9ZzxhjULVKZxi?=
 =?us-ascii?Q?5RUm4+5gaN5v3QYi2iLUwvGeLTzdxt+mW7U2BgJPsbgiwXQB1cpfdA1OWd7n?=
 =?us-ascii?Q?c63gKsZa7k5U8/1E/6BSx80ensNp1Al+Fziv3zoYZlPsiIxHITHzyWpFIOBx?=
 =?us-ascii?Q?TblZFf5k6wLeMY+zSIShe4hjbRjM501l9+97B2a54wXaa+a1sWJ2QdTXf7Df?=
 =?us-ascii?Q?ciBbJWi0NLSbkXXrOA3BtgaN/I5uuceY7E+WDGaZYYl/g/BkzlrXtSmBh/5b?=
 =?us-ascii?Q?J4xM8NyTGs6uvi6I4G1+DldO0efQsQjeXGJsSuFIvaJB8anT2fQ/2JaHCbhA?=
 =?us-ascii?Q?AoV5o69BR1Py+CRVP8sh4CT22z1g7TPQYm/cpV3r3hq2jC2Hyz0oiyW6buBA?=
 =?us-ascii?Q?XcRUxQigebZUQ/0NLZkh3CK2UuYvbWDUfuR6m0w/1Tg+OVHcs7peJFH+z7ye?=
 =?us-ascii?Q?DK1mjS746MC5JTf/OYXRWlIlObOVsVXNSE6g2iZshFTb9IzsRDQVjbg7BG1Q?=
 =?us-ascii?Q?xXh7lZp/9vCEMd1ON7Z6cKKY+5Y6iJwMKxq0sIK73eNFfTG7ohARZMSB3dNa?=
 =?us-ascii?Q?7dsNd6eGP3MvFXxqdzsEKTHT7Bnzb5+LIl3v1aso3G/52mO+RxEi3YojF0A7?=
 =?us-ascii?Q?BZ2tje8PWo525FuQ+GXXjhmgF73iM6iWVofgVqww8NgX5r2LPvdsu3dEZVrb?=
 =?us-ascii?Q?AaHHrwLlVdyCYp4x8I5OrHqbFx7xPO0/l7TP79mZuuKfxBOPoeC5jgyVhQHF?=
 =?us-ascii?Q?x8KYk9R7JxZHOt8h5Pz+2wvPiaiCPiXWkaigo1yx2h8iH9b4JGReORRAtjyb?=
 =?us-ascii?Q?i8KnYOHT7QKiCy8M/CBi5GaD6YOyTHONTM9kdIoJK1h/qxGCXMMTtK7Ghhd4?=
 =?us-ascii?Q?kJzKU5NIJ/M3wwVgPTMyT1M0ybp5JdVk5pfMPunW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 462d8480-078e-453e-07b2-08dde3dea8b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 13:52:40.8909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hpE/rPqF1ju8INvKgPVDcb3PqBHOoXbCgygcympK2gREcPlnX81j+rz3TkLvP3PoPFvxccMiNg3r6IwzH8Jghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 13:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222409

Please ignore, wrong mailing list.
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Monday, August 25, 2025 15:50
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][walnascar][PATCH] nginx: patch CVE-2025-53859
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patch from nginx site which is also mentioned in [1].
>=20
> [1] https://security-tracker.debian.org/tracker/CVE-2025-53859
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../nginx/files/CVE-2025-53859.patch          | 131 ++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
>  2 files changed, 132 insertions(+)
>  create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-
> 53859.patch
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patc=
h
> b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
> new file mode 100755
> index 0000000000..6f689938f4
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
> @@ -0,0 +1,131 @@
> +CVE: CVE-2025-53859
> +Upstream-Status: Backport [https://nginx.org/download/patch.2025.smtp.tx=
t]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +
> +diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
> +index 1167df3fb..d3be7f3b3 100644
> +--- a/src/mail/ngx_mail_handler.c
> ++++ b/src/mail/ngx_mail_handler.c
> +@@ -523,7 +523,7 @@ ngx_mail_starttls_only(ngx_mail_session_t *s,
> ngx_connection_t *c)
> + ngx_int_t
> + ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uin=
t_t n)
> + {
> +-    u_char     *p, *last;
> ++    u_char     *p, *pos, *last;
> +     ngx_str_t  *arg, plain;
> +
> +     arg =3D s->args.elts;
> +@@ -555,7 +555,7 @@ ngx_mail_auth_plain(ngx_mail_session_t *s,
> ngx_connection_t *c, ngx_uint_t n)
> +         return NGX_MAIL_PARSE_INVALID_COMMAND;
> +     }
> +
> +-    s->login.data =3D p;
> ++    pos =3D p;
> +
> +     while (p < last && *p) { p++; }
> +
> +@@ -565,7 +565,8 @@ ngx_mail_auth_plain(ngx_mail_session_t *s,
> ngx_connection_t *c, ngx_uint_t n)
> +         return NGX_MAIL_PARSE_INVALID_COMMAND;
> +     }
> +
> +-    s->login.len =3D p++ - s->login.data;
> ++    s->login.len =3D p++ - pos;
> ++    s->login.data =3D pos;
> +
> +     s->passwd.len =3D last - p;
> +     s->passwd.data =3D p;
> +@@ -583,24 +584,26 @@ ngx_int_t
> + ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c=
,
> +     ngx_uint_t n)
> + {
> +-    ngx_str_t  *arg;
> ++    ngx_str_t  *arg, login;
> +
> +     arg =3D s->args.elts;
> +
> +     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
> +                    "mail auth login username: \"%V\"", &arg[n]);
> +
> +-    s->login.data =3D ngx_pnalloc(c->pool,
> ngx_base64_decoded_length(arg[n].len));
> +-    if (s->login.data =3D=3D NULL) {
> ++    login.data =3D ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n=
].len));
> ++    if (login.data =3D=3D NULL) {
> +         return NGX_ERROR;
> +     }
> +
> +-    if (ngx_decode_base64(&s->login, &arg[n]) !=3D NGX_OK) {
> ++    if (ngx_decode_base64(&login, &arg[n]) !=3D NGX_OK) {
> +         ngx_log_error(NGX_LOG_INFO, c->log, 0,
> +             "client sent invalid base64 encoding in AUTH LOGIN command"=
);
> +         return NGX_MAIL_PARSE_INVALID_COMMAND;
> +     }
> +
> ++    s->login =3D login;
> ++
> +     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
> +                    "mail auth login username: \"%V\"", &s->login);
> +
> +@@ -611,7 +614,7 @@ ngx_mail_auth_login_username(ngx_mail_session_t *s,
> ngx_connection_t *c,
> + ngx_int_t
> + ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c=
)
> + {
> +-    ngx_str_t  *arg;
> ++    ngx_str_t  *arg, passwd;
> +
> +     arg =3D s->args.elts;
> +
> +@@ -620,18 +623,19 @@ ngx_mail_auth_login_password(ngx_mail_session_t
> *s, ngx_connection_t *c)
> +                    "mail auth login password: \"%V\"", &arg[0]);
> + #endif
> +
> +-    s->passwd.data =3D ngx_pnalloc(c->pool,
> +-                                 ngx_base64_decoded_length(arg[0].len))=
;
> +-    if (s->passwd.data =3D=3D NULL) {
> ++    passwd.data =3D ngx_pnalloc(c->pool,
> ngx_base64_decoded_length(arg[0].len));
> ++    if (passwd.data =3D=3D NULL) {
> +         return NGX_ERROR;
> +     }
> +
> +-    if (ngx_decode_base64(&s->passwd, &arg[0]) !=3D NGX_OK) {
> ++    if (ngx_decode_base64(&passwd, &arg[0]) !=3D NGX_OK) {
> +         ngx_log_error(NGX_LOG_INFO, c->log, 0,
> +             "client sent invalid base64 encoding in AUTH LOGIN command"=
);
> +         return NGX_MAIL_PARSE_INVALID_COMMAND;
> +     }
> +
> ++    s->passwd =3D passwd;
> ++
> + #if (NGX_DEBUG_MAIL_PASSWD)
> +     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
> +                    "mail auth login password: \"%V\"", &s->passwd);
> +@@ -674,24 +678,26 @@ ngx_int_t
> + ngx_mail_auth_cram_md5(ngx_mail_session_t *s, ngx_connection_t *c)
> + {
> +     u_char     *p, *last;
> +-    ngx_str_t  *arg;
> ++    ngx_str_t  *arg, login;
> +
> +     arg =3D s->args.elts;
> +
> +     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
> +                    "mail auth cram-md5: \"%V\"", &arg[0]);
> +
> +-    s->login.data =3D ngx_pnalloc(c->pool,
> ngx_base64_decoded_length(arg[0].len));
> +-    if (s->login.data =3D=3D NULL) {
> ++    login.data =3D ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0=
].len));
> ++    if (login.data =3D=3D NULL) {
> +         return NGX_ERROR;
> +     }
> +
> +-    if (ngx_decode_base64(&s->login, &arg[0]) !=3D NGX_OK) {
> ++    if (ngx_decode_base64(&login, &arg[0]) !=3D NGX_OK) {
> +         ngx_log_error(NGX_LOG_INFO, c->log, 0,
> +             "client sent invalid base64 encoding in AUTH CRAM-MD5 comma=
nd");
> +         return NGX_MAIL_PARSE_INVALID_COMMAND;
> +     }
> +
> ++    s->login =3D login;
> ++
> +     p =3D s->login.data;
> +     last =3D p + s->login.len;
> +
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-
> webserver/recipes-httpd/nginx/nginx.inc
> index bcc384bd8a..4a7be2f99a 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -23,6 +23,7 @@ SRC_URI =3D " \
>      file://nginx.service \
>      file://nginx-fix-pidfile.patch \
>      file://0001-configure-libxslt-conf.patch \
> +    file://CVE-2025-53859.patch \
>  "
>=20
>  inherit siteinfo update-rc.d useradd systemd

