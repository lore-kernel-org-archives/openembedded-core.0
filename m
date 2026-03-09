Return-Path: <eduardo.barbosa@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB96F41812
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 16:57:15 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19637.1773075428412708397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 09:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=cesI6o+u;
 spf=pass (domain: toradex.com, ip: 194.104.111.113, mailfrom: eduardo.barbosa@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1773075426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ny/J6j4BmAziWxbVvgHsGutvu+oF7u7Gn14oNypdEcw=;
	b=cesI6o+um3tHB0XkXgoNQ3OAQ9xucHZfFoKojItRdGDH8YlPvj+HmmrHBYq2Zct7MWP9+d
	9r9Q3fBfhiwpGFtVzGsGQuvjSInn8ikSH2FckUfG9xIf6wtAYxmC833fXKkbhVx9wq2ZdF
	mYvySVg2WTed8AMbyQyoO/tmcPCAHyw=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11022072.outbound.protection.outlook.com
 [40.107.168.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-62-21lXJNJ9MAC9rEwjGAKmbA-1; Mon, 09 Mar 2026 17:57:04 +0100
X-MC-Unique: 21lXJNJ9MAC9rEwjGAKmbA-1
X-Mimecast-MFC-AGG-ID: 21lXJNJ9MAC9rEwjGAKmbA_1773075424
Received: from GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:52::13)
 by ZR0P278MB0025.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:17::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 16:56:59 +0000
Received: from GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 ([fe80::46ec:170a:9f40:3d07]) by GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 ([fe80::46ec:170a:9f40:3d07%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 16:56:59 +0000
From: Eduardo Ferreira Barbosa <eduardo.barbosa@toradex.com>
To: Yoann Congal <yoann.congal@smile.fr>, "eduardo.f120@yahoo.com"
	<eduardo.f120@yahoo.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable
 ordering
Thread-Topic: [OE-core] [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable
 ordering
Thread-Index: AQHcrZQ66ztdtwCIlEOR/DvWvTcmh7WmPwOAgAAw2S4=
Date: Mon, 9 Mar 2026 16:56:59 +0000
Message-ID: <GV0P278MB076770EB9792CD5ED3FC195EE879A@GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM>
References: <20260306180605.1047779-1-eduardo.f120@yahoo.com>
 <20260306180605.1047779-2-eduardo.f120@yahoo.com>
 <DGYB0XNUQ64D.1A0JTYTK6YFW8@smile.fr>
In-Reply-To: <DGYB0XNUQ64D.1A0JTYTK6YFW8@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV0P278MB0767:EE_|ZR0P278MB0025:EE_
x-ms-office365-filtering-correlation-id: 7fd5dcec-e3b0-43c2-f9a1-08de7dfce101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700021|13003099007|8096899003|7053199007
x-microsoft-antispam-message-info: jszrMhM8Uq483EufHKHnC+uXIKPoFKqViF1Hce1ZzQjH0ywCb9yhgfXzY2kelZRmJTroo0MUqX5/vB9KJbjDpkP5Vv38rVZ11T6Z5ea/UYZurCfEquunUL597OL7CvBoTMC2UzyQN2rl5W2oRTzSTaat4Pw6/xduTNTBy1YvSXArgWn4YNbCrckF1KkKayVgYMx+uTf/g2LMnxNxHNJuRj5Oi1s2yIpEhbN7DMFEuip5k4kMd3ZNO6D8LgJ0IVRM75rj9NHkaKfPUW0DZeTQHFw/9+oLIJ9Ub0ZQ9D+SHqv8V0qf/ZvMg9E9knGGY2osREspkNtLZbbmVJtKrLRg8RWGTphojapQAzoKx9ayuearPpNgV6ZY3i5QLq+OrpCs71M9b2FFMnx9U8d9AFuNon8U23IQ3WrkafSgxBLnDTGUbt/331mo8rXYLcw//Y28AaqjmIzWTJdgk/v8uNBVwyw38WOKztlcdhqsuoPM+IiF84zmmbBGaEIYVV0GD0BxoYkH3sM499kKuPLgo4Ba2eskd9Cp5nTaC+uf9FXWk6prwXw7ZUOgHKsqIvpXBq6qHFfdMxY1w0a4DZCwVEufl3BLzYu9u/jNWsXQRBBR0xE4YjSWVVQ5aB8mF/HFMXwNwvBH2S553Sv4Rnz3t4FSZDs8DbhtJxd8aK7hKz9fFRMWRmdqZEl0r1WmMhZTC9jqJal9btz/dCqPRDxUd5MGUYQklHK2oTdmhkQ6czWxM48oiKrQb1kLeHGNfUK/IAut
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W5RdIeDeo5Jj6y30Imh+0TTfNNg1BLqnnMeRzq/mFHmJw+fYRrxgKAjbxUrN?=
 =?us-ascii?Q?1Y6WPS1OUCXHcxeTK7eusksUf3H/ehd+JZbINECbhkFS9feZ8Da6a7syQMvg?=
 =?us-ascii?Q?QI4QtRQuA7sjmRJLnm9FkxTbUCT2enh/TQOJOXe3fAieNYqTv9aI2YL+jN8D?=
 =?us-ascii?Q?hcizJ2Zf7KjyDkuYICsnWIAyqUNN4wVFrT05bSvRorH571Bc/j+TtM0NTRUw?=
 =?us-ascii?Q?xngubrX5iXLDtwjvl5v1L7MrJq2sbpDYd5BJSJvvviYgZ7mCcc4X+DXd+sKT?=
 =?us-ascii?Q?lVjh6jVDu/KAsGRZX3k475n/DK16K4Upd9ewL10RLHRM/4mHXx7avWNpBbwT?=
 =?us-ascii?Q?XpyE+89hf8y7HD1aKKi9+DaF6vxvHi6qSGpx7m6odAYFygrUugvZ9ySCbiIB?=
 =?us-ascii?Q?wQ0mZtwP48x4kkaXwNPOIPK4LrI7XX9L++PTTsNUc5FmDLvJChyIpmYPiXP7?=
 =?us-ascii?Q?oFg+n+Za2AWsohiCyxLwfQXqNq/jhOR6ayBAeiCwVNXrToQDz/o/kv1jf3RJ?=
 =?us-ascii?Q?OIsB4ZohGNNmFhd9TXwkIYKqEYulEe5WwyrvPTJ1JPIvNI5ayjDCl7vo6UjY?=
 =?us-ascii?Q?04rlLwPx1AFlF5y7gp+35lpyUxClt9KuFd81Cm/5jnn2fClB1iX6ZgEMWQaD?=
 =?us-ascii?Q?EDcXZqFolXrR87sfcHThGXh2u2ohsaYWZgoK0R6UDi21NwuhJ/zRa3VaG5MC?=
 =?us-ascii?Q?G8sv9cL7DbIqh82kShb2vwnjwUq8NxGMhY2u6YKJGblEB+YVqTuIRayF5uti?=
 =?us-ascii?Q?1f/j/aPimJiBY6C1kkt8LxrRQeXBJ/gKvv/7QMaHxStBvJ1Jp3qpzaMwnbJR?=
 =?us-ascii?Q?xysJ6D0c76MJuH4bFq2NVABMayChxn7LFHk1tL6eR0oqoSTia3Z6tovJeSWy?=
 =?us-ascii?Q?tZ5HJdmCB43ixxRv5Mm0KbSplkBzs6BmLnqb/B+uE3ddVGGAtM2EvNRw7r1y?=
 =?us-ascii?Q?fdWBRlHMFqrnBngXFDltXIhd1mnDprFDZFWE2Ju8txtfhzxdPwXQu9MI+5vV?=
 =?us-ascii?Q?C0ubcU3LQmbBsuzKkg/dnHitkTLvnND8kPa/mnKHxc8TGy+KPuVEpu+MRJRe?=
 =?us-ascii?Q?rX/LAGsOA8Qz2m3IbtdH7b4Re+F+u8rZqhHNrvVgnCIkvwGqVaOjsPUyCCAR?=
 =?us-ascii?Q?WTVoRgspl+uk3QLfKxi7tOzjrH1Sg0baaxtHZbBzIExxR/146LXEs2ORQI8T?=
 =?us-ascii?Q?VXlgM+kgWmqRJeSbWUzzbfwnGO7wNRIH154Og4ZX44N2gR0OpEpqhZBEP4d/?=
 =?us-ascii?Q?Ukb+v058GX52pKJnsi4ddpYIQh3wt9qB92tRPpjWJ3RtEVe1DXalEvoByZ/n?=
 =?us-ascii?Q?jtkyaup/toIlR1HUVcTW2QEsr/Fu0SpSPl02hKVDWq9bgwBG12+ZzKVxsLbX?=
 =?us-ascii?Q?JOEtkzL2GNBtp+5bcOynbNMD4hteeTaanX0mNkGyY2IOawpq6ymjk3tr6mVI?=
 =?us-ascii?Q?gHjaF45A74nXLHMZYXk5JJ29EAPlK2ZXxmb+KgmBNlV/ZaTPH7CIeRg9UaHJ?=
 =?us-ascii?Q?9CqApetq8d8V92tdiHsVMdbDwjNvmZwNhK6TQtHYvMd0GljqOL7J8jSB1m03?=
 =?us-ascii?Q?8h7r5EaT+U9knFLaMLe0rYbwREoZ5VgWzdvxPi730iXVEqU/x8ZDSiA4EqSe?=
 =?us-ascii?Q?ZDzTdMGgOABTu3xo9y8uaN+9uAXI8xzT8e8+jdjEOaohhaW5Ra/s4ZZE7ztc?=
 =?us-ascii?Q?TvS8Dks4wDdF6TuM+t3/9MPx9iddI490AfX7cPCZWIkka/76w+kVhJaSh6fM?=
 =?us-ascii?Q?QumidiMkF4/qHwZhK/DGcEQpuSkKWTlffLytCdQokJK0Mn5GMdPcOx1Mbdfs?=
x-ms-exchange-antispam-messagedata-1: Av7GmkQqSlbr0A==
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YHC5a25XMa7DMt23fmbeaOLD/cfmh+X2/YWxbdaheaGDVdz+ydINpLc0u5HjUPrxeILcT4oAyfv2giTm8lD7KYfw9VkzAj525uWwCXuw3rIr8JYBjw3W0M9dtm9FIQIOrEddJvOgWT1g/E+EE2NFnjZEh8J1G1KyfVkV2A1UD8+aQkjIpWiYS6An1p4fGbIJcUXpM5NhGWziB8d9rSte0xdu1NTRTY28oSOznMvZncjS8iJogj9skSgchzxr+1FAevdrgLjcbO5NHcNcv9TU87pvbbTzuj9USlKnQzsa1tsQmU1Do7m5BpgMvvXYogK66Ch5QyCn0hxrUXx+gQWaOw==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd5dcec-e3b0-43c2-f9a1-08de7dfce101
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 16:56:59.2874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1uczoVboFeKF5V3AwsBJP4roHHx/00gg7h2umtADpPYY6HtvToN2VkklwQN3ZgCLlc4n4OhdbBKYOrYoGD1ov+CkbBvbmjkOyH413hO+tfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0025
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cLQ_s8Muv5bccmXwRX7s56fZHfTIBgfdUNCBhReecp0_1773075424
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_GV0P278MB076770EB9792CD5ED3FC195EE879AGV0P278MB0767CHEP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 16:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232731

--_000_GV0P278MB076770EB9792CD5ED3FC195EE879AGV0P278MB0767CHEP_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I've made the changed and submitted a new patch there.
Hopefully I got the tags right this time. This is my first time trying to c=
ontribute to a mailing list, so please let me know if I'm doing it wrong.

Thanks for the review,
Eduardo
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, March 9, 2026 11:00 AM
To: eduardo.f120@yahoo.com <eduardo.f120@yahoo.com>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Eduardo Ferreira Barbosa <eduardo.barbosa@toradex.com>
Subject: Re: [OE-core] [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variabl=
e ordering

This message originated from outside your organization

Hello,

Reviewing for scarthgap:

On Fri Mar 6, 2026 at 7:06 PM CET, eduardo.f120 via lists.openembedded.org =
wrote:
> From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> Subject: [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering

The tag in the subject does not usualy contain the version (I missed
that in the last go patches :( ). Just "go: Fix CVE-2025-61726.patch
variable ordering" is fine.
>
> Commit 6a1ae4e79252f9a896faa702e4a8b3e27529a474 introduced a patch

When referencing a patch, I suggest to add the title for context. The
kernel has a nice rule about it and that look like:
commit 6a1ae4e79252 ("go 1.22.12: Fix CVE-2025-61726")

git also has a nice option built-in:
$ git log -1 --format=3Dreference 6a1ae4e79252f9a896faa702e4a8b3e27529a474
6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)

> backporting a fix for CVE-2025-61726, but this patch also introduced
> a bug.
>
> From Go's source code[1], they say that the 'All' table from 'godebugs'
> should be populated alphabetically by Name. And 'Lookup'[2] function uses
> binary search to try and find the variable.
>
> Here's the trace:
> Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker A=
pplication Container Engine.
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:=
34:53 http: panic serving @: godebug: Value of name not listed in godeb
> ugs.All: urlmaxqueryparams
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [=
running]:
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*con=
n).serve.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/serve=
r.go:1903 +0xb0
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.=
go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()<http://go.openteleme=
try.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()>
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk@v1.19.0/trace/span.go:383<http://go.opentelemetry.io/otel/sd=
k@v1.19.0/trace/span.go:383> +0x2c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End<http://go.opentelemetry.io/otel/s=
dk/trace.(*recordingSpan).End>(0x40011b4a80, {0x0, 0x0, 0x40
> 006441c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk@v1.19.0/trace/span.go:421<http://go.opentelemetry.io/otel/sd=
k@v1.19.0/trace/span.go:421> +0x898
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.=
go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug/godebug.go:141 +0xd8
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).d=
oSlow(0x22?, 0x55748a9b60?)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:7=
4 +0x100
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).D=
o(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:6=
5
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value(0x5575b21be0)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug/godebug.go:138 +0x50
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlPar=
amsWithinMax(0x1)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go=
:968 +0x3c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQ=
uery(0x400069a630, {0x0, 0x0})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go=
:985 +0xdc
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQ=
uery(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go=
:958
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Req=
uest).ParseForm(0x4000bdab40)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/reque=
st.go:1317 +0x33c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/doc=
ker/docker/api/server/httputils.ParseForm(0x0?)<http://github.com/docker/do=
cker/api/server/httputils.ParseForm(0x0?)>
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/doc=
ker/docker/api/server/httputils/httputils.go:104<http://github.com/docker/d=
ocker/api/server/httputils/httputils.go:104> +0x20
>
> The 'Lookup' function was failing due to the wrong ordering and returning=
 'nil',
> which was not being checked properly and caused this issue.
>
> The fix was to just reorder the line where 'urlmaxqueryparams' is being
> added to respect the alphabetical ordering. And for that the whole CVE
> patch was generated again.
>
> This change was validated with docker-moby (original issue), where a cont=
ainer
> run successfully and no traces in the logs.
>
> Fixes: 6a1ae4e792 ("go 1.22.12: Fix CVE-2025-61726.patch variable orderin=
g")
^ Is this commit fixing itself?
FYI, I don't know any Yocto Project tooling that uses this line. You
might just remove it...

>
> [1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L20<https://github.com/golang/go/blob/master/src/internal/godebugs/table=
.go#L20>
> [2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L100<https://github.com/golang/go/blob/master/src/internal/godebugs/tabl=
e.go#L100>
>
> Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---
> .../go/go/CVE-2025-61726.patch | 25 ++++++++++---------
> 1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/reci=
pes-devtools/go/go/CVE-2025-61726.patch
> index ab053ff55c..65fe62a4da 100644
> --- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> +++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> @@ -1,6 +1,6 @@
> -From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
> -From: Damien Neil <dneil@google.com>
> -Date: Mon, 3 Nov 2025 14:28:47 -0800
> +From a41ff6cac6acdb8a55708d9f1e40efd8c4f87421 Mon Sep 17 00:00:00 2001
> +From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> +Date: Fri, 6 Mar 2026 13:38:46 +0000
^ You can't really take ownership of the patch like that. Please keep
the original author.

> Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
> GODEBUG to limit the number of query parameters
>
> @@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
> TryBot-Bypass: Michael Pratt <mpratt@google.com>
> (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---
> doc/godebug.md | 7 +++++
> src/internal/godebugs/table.go | 1 +
> @@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> 5 files changed, 85 insertions(+)
>
> diff --git a/doc/godebug.md b/doc/godebug.md
> -index ae4f0576b4..635597ea42 100644
> +index ae4f057..635597e 100644
> --- a/doc/godebug.md
> +++ b/doc/godebug.md
> @@ -126,6 +126,13 @@ for example,
> @@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644
> to concerns around VCS injection attacks. This behavior can be renabled w=
ith the
> setting `allowmultiplevcs=3D1`.
> diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table=
.go
> -index 33dcd81fc3..4ae043053c 100644
> +index 33dcd81..7178df6 100644
> --- a/src/internal/godebugs/table.go
> +++ b/src/internal/godebugs/table.go
> -@@ -52,6 +52,7 @@ var All =3D []Info{
> +@@ -51,6 +51,7 @@ var All =3D []Info{
> + {Name: "tlsmaxrsasize", Package: "crypto/tls"},
> {Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
> {Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
> - {Name: "x509sha1", Package: "crypto/x509"},
> + {Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
> + {Name: "x509sha1", Package: "crypto/x509"},
> {Name: "x509usefallbackroots", Package: "crypto/x509"},
> {Name: "x509usepolicies", Package: "crypto/x509"},
> - {Name: "zipinsecurepath", Package: "archive/zip"},
> diff --git a/src/net/url/url.go b/src/net/url/url.go
> -index d2ae03232f..5219e3c130 100644
> +index d2ae032..f796077 100644
> --- a/src/net/url/url.go
> +++ b/src/net/url/url.go
> @@ -13,6 +13,7 @@ package url
> @@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644
> var key string
> key, query, _ =3D strings.Cut(query, "&")
> diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
> -index fef236e40a..b2f8bd95fc 100644
> +index fef236e..b2f8bd9 100644
> --- a/src/net/url/url_test.go
> +++ b/src/net/url/url_test.go
> @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
> @@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644
> url *URL
> out string
> diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
> -index 517ec0e0a4..335f7873b3 100644
> +index 517ec0e..2efb13a 100644
> --- a/src/runtime/metrics/doc.go
> +++ b/src/runtime/metrics/doc.go
> @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered=
 lexicographically.
> @@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644
> The number of non-default behaviors executed by the crypto/x509
> package due to a non-default GODEBUG=3Dx509sha1=3D... setting.
> --
> -2.35.6
> +2.34.1

And, remember, when sending your next version to add the [scarthgap]
tag.

Thanks!
--
Yoann Congal
Smile ECS

--_000_GV0P278MB076770EB9792CD5ED3FC195EE879AGV0P278MB0767CHEP_
Content-Type: text/html; charset=WINDOWS-1252
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
Hi Yoann,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I've made the changed and submitted a new patch there.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hopefully I got the tags right this time. This is my first time trying to c=
ontribute to a mailing list, so please let me know if I'm doing it wrong.</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the review,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Eduardo</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, March 9, 2026 11:00 AM<br>
<b>To:</b> eduardo.f120@yahoo.com &lt;eduardo.f120@yahoo.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Cc:</b> Eduardo Ferreira Barbosa &lt;eduardo.barbosa@toradex.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] go 1.22.12: Fix CVE-2025-61726.patch =
variable ordering</font>
<div>&nbsp;</div>
</div>
<div>This message originated from outside your organization<br>
<br>
Hello,<br>
<br>
Reviewing for scarthgap:<br>
<br>
On Fri Mar 6, 2026 at 7:06 PM CET, eduardo.f120 via lists.openembedded.org =
wrote:<br>
&gt; From: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<br>
&gt; Subject: [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable orderin=
g<br>
<br>
The tag in the subject does not usualy contain the version (I missed<br>
that in the last go patches :( ). Just &quot;go: Fix CVE-2025-61726.patch<b=
r>
variable ordering&quot; is fine.<br>
&gt;<br>
&gt; Commit 6a1ae4e79252f9a896faa702e4a8b3e27529a474 introduced a patch<br>
<br>
When referencing a patch, I suggest to add the title for context. The<br>
kernel has a nice rule about it and that look like:<br>
commit 6a1ae4e79252 (&quot;go 1.22.12: Fix CVE-2025-61726&quot;)<br>
<br>
git also has a nice option built-in:<br>
$ git log -1 --format=3Dreference 6a1ae4e79252f9a896faa702e4a8b3e27529a474<=
br>
6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)<br>
<br>
&gt; backporting a fix for CVE-2025-61726, but this patch also introduced<b=
r>
&gt; a bug.<br>
&gt;<br>
&gt; From Go's source code[1], they say that the 'All' table from 'godebugs=
'<br>
&gt; should be populated alphabetically by Name. And 'Lookup'[2] function u=
ses<br>
&gt; binary search to try and find the variable.<br>
&gt;<br>
&gt; Here's the trace:<br>
&gt; Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docke=
r Application Container Engine.<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 =
11:34:53 http: panic serving @: godebug: Value of name not listed in godeb<=
br>
&gt; ugs.All: urlmaxqueryparams<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 7=
8 [running]:<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*=
conn).serve.func1()<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/se=
rver.go:1903 +0xb0<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55=
743e8740?, 0x4000b526c0?})<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/pan=
ic.go:770 +0x124<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"=
http://go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()=
">
go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()</a><br=
>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"=
http://go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:383">
go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:383</a> +0x2c<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"=
http://go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End">
go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End</a>(0x40011b4a80, {=
0x0, 0x0, 0x40<br>
&gt; 006441c0?})<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"=
http://go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:421">
go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:421</a> +0x898<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55=
743e8740?, 0x4000b526c0?})<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/pan=
ic.go:770 +0x124<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/go=
debug.(*Setting).Value.func1()<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/go=
debug/godebug.go:141 +0xd8<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once=
).doSlow(0x22?, 0x55748a9b60?)<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.g=
o:74 +0x100<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once=
).Do(...)<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.g=
o:65<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/go=
debug.(*Setting).Value(0x5575b21be0)<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/go=
debug/godebug.go:138 +0x50<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.url=
ParamsWithinMax(0x1)<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url=
.go:968 +0x3c<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.par=
seQuery(0x400069a630, {0x0, 0x0})<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url=
.go:985 +0xdc<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.Par=
seQuery(...)<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url=
.go:958<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*=
Request).ParseForm(0x4000bdab40)<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/re=
quest.go:1317 +0x33c<br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"=
http://github.com/docker/docker/api/server/httputils.ParseForm(0x0?)">
github.com/docker/docker/api/server/httputils.ParseForm(0x0?)</a><br>
&gt; Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"=
http://github.com/docker/docker/api/server/httputils/httputils.go:104">
github.com/docker/docker/api/server/httputils/httputils.go:104</a> +0x20<br=
>
&gt;<br>
&gt; The 'Lookup' function was failing due to the wrong ordering and return=
ing 'nil',<br>
&gt; which was not being checked properly and caused this issue.<br>
&gt;<br>
&gt; The fix was to just reorder the line where 'urlmaxqueryparams' is bein=
g<br>
&gt; added to respect the alphabetical ordering. And for that the whole CVE=
<br>
&gt; patch was generated again.<br>
&gt;<br>
&gt; This change was validated with docker-moby (original issue), where a c=
ontainer<br>
&gt; run successfully and no traces in the logs.<br>
&gt;<br>
&gt; Fixes: 6a1ae4e792 (&quot;go 1.22.12: Fix CVE-2025-61726.patch variable=
 ordering&quot;)<br>
^ Is this commit fixing itself?<br>
FYI, I don't know any Yocto Project tooling that uses this line. You<br>
might just remove it...<br>
<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/golang/go/blob/master/src/internal/g=
odebugs/table.go#L20">
https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20=
</a><br>
&gt; [2] <a href=3D"https://github.com/golang/go/blob/master/src/internal/g=
odebugs/table.go#L100">
https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L10=
0</a><br>
&gt;<br>
&gt; Signed-off-by: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<br=
>
&gt; ---<br>
&gt; .../go/go/CVE-2025-61726.patch | 25 ++++++++++---------<br>
&gt; 1 file changed, 13 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/r=
ecipes-devtools/go/go/CVE-2025-61726.patch<br>
&gt; index ab053ff55c..65fe62a4da 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; -From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Damien Neil &lt;dneil@google.com&gt;<br>
&gt; -Date: Mon, 3 Nov 2025 14:28:47 -0800<br>
&gt; +From a41ff6cac6acdb8a55708d9f1e40efd8c4f87421 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<br>
&gt; +Date: Fri, 6 Mar 2026 13:38:46 +0000<br>
^ You can't really take ownership of the patch like that. Please keep<br>
the original author.<br>
<br>
&gt; Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparam=
s<br>
&gt; GODEBUG to limit the number of query parameters<br>
&gt; <br>
&gt; @@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao &lt;shaojunyang@google.com=
&gt;<br>
&gt; TryBot-Bypass: Michael Pratt &lt;mpratt@google.com&gt;<br>
&gt; (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)<b=
r>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +Signed-off-by: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<b=
r>
&gt; ---<br>
&gt; doc/godebug.md | 7 +++++<br>
&gt; src/internal/godebugs/table.go | 1 +<br>
&gt; @@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com=
&gt;<br>
&gt; 5 files changed, 85 insertions(+)<br>
&gt; <br>
&gt; diff --git a/doc/godebug.md b/doc/godebug.md<br>
&gt; -index ae4f0576b4..635597ea42 100644<br>
&gt; +index ae4f057..635597e 100644<br>
&gt; --- a/doc/godebug.md<br>
&gt; +++ b/doc/godebug.md<br>
&gt; @@ -126,6 +126,13 @@ for example,<br>
&gt; @@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644<br>
&gt; to concerns around VCS injection attacks. This behavior can be renable=
d with the<br>
&gt; setting `allowmultiplevcs=3D1`.<br>
&gt; diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/ta=
ble.go<br>
&gt; -index 33dcd81fc3..4ae043053c 100644<br>
&gt; +index 33dcd81..7178df6 100644<br>
&gt; --- a/src/internal/godebugs/table.go<br>
&gt; +++ b/src/internal/godebugs/table.go<br>
&gt; -@@ -52,6 +52,7 @@ var All =3D []Info{<br>
&gt; +@@ -51,6 +51,7 @@ var All =3D []Info{<br>
&gt; + {Name: &quot;tlsmaxrsasize&quot;, Package: &quot;crypto/tls&quot;},<=
br>
&gt; {Name: &quot;tlsrsakex&quot;, Package: &quot;crypto/tls&quot;, Changed=
: 22, Old: &quot;1&quot;},<br>
&gt; {Name: &quot;tlsunsafeekm&quot;, Package: &quot;crypto/tls&quot;, Chan=
ged: 22, Old: &quot;1&quot;},<br>
&gt; - {Name: &quot;x509sha1&quot;, Package: &quot;crypto/x509&quot;},<br>
&gt; + {Name: &quot;urlmaxqueryparams&quot;, Package: &quot;net/url&quot;, =
Changed: 24, Old: &quot;0&quot;},<br>
&gt; + {Name: &quot;x509sha1&quot;, Package: &quot;crypto/x509&quot;},<br>
&gt; {Name: &quot;x509usefallbackroots&quot;, Package: &quot;crypto/x509&qu=
ot;},<br>
&gt; {Name: &quot;x509usepolicies&quot;, Package: &quot;crypto/x509&quot;},=
<br>
&gt; - {Name: &quot;zipinsecurepath&quot;, Package: &quot;archive/zip&quot;=
},<br>
&gt; diff --git a/src/net/url/url.go b/src/net/url/url.go<br>
&gt; -index d2ae03232f..5219e3c130 100644<br>
&gt; +index d2ae032..f796077 100644<br>
&gt; --- a/src/net/url/url.go<br>
&gt; +++ b/src/net/url/url.go<br>
&gt; @@ -13,6 +13,7 @@ package url<br>
&gt; @@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644<br>
&gt; var key string<br>
&gt; key, query, _ =3D strings.Cut(query, &quot;&amp;&quot;)<br>
&gt; diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go<br>
&gt; -index fef236e40a..b2f8bd95fc 100644<br>
&gt; +index fef236e..b2f8bd9 100644<br>
&gt; --- a/src/net/url/url_test.go<br>
&gt; +++ b/src/net/url/url_test.go<br>
&gt; @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {<br>
&gt; @@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644<br>
&gt; url *URL<br>
&gt; out string<br>
&gt; diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go<b=
r>
&gt; -index 517ec0e0a4..335f7873b3 100644<br>
&gt; +index 517ec0e..2efb13a 100644<br>
&gt; --- a/src/runtime/metrics/doc.go<br>
&gt; +++ b/src/runtime/metrics/doc.go<br>
&gt; @@ -328,6 +328,11 @@ Below is the full list of supported metrics, orde=
red lexicographically.<br>
&gt; @@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644<br>
&gt; The number of non-default behaviors executed by the crypto/x509<br>
&gt; package due to a non-default GODEBUG=3Dx509sha1=3D... setting.<br>
&gt; --<br>
&gt; -2.35.6<br>
&gt; +2.34.1<br>
<br>
And, remember, when sending your next version to add the [scarthgap]<br>
tag.<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
</div>
</body>
</html>

--_000_GV0P278MB076770EB9792CD5ED3FC195EE879AGV0P278MB0767CHEP_--


