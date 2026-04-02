Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD56D39402
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 09:24:51 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11601.1775121451550908648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=kZnh9bNj;
 spf=pass (domain: est.tech, ip: 52.101.72.25, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLWTOnnJTEAvR+T/ozslPUYWWW48fz14LQqrubwNAavtudQKB2G4Ps+fc3PCIuYy4NAeNM++5aJarNfhH6mTvzd2mcCQM5T9yFYZpmICT/uC57lgqw5WQMdpHManCu2C1e+d7gL9iAFq5+Fbc8u5VrIyP7E0B50B6LviEeQ7w28txzXTzwjpu2/FLdvaV/E5aE05YDo1N1i4AzvH6z6RFGx9+1+dJ2np3slCMUxfvW/x6oWsvrfMhthGKmE7RisfgPdRMRBDD5H43+HDRs8S7xG8t2WVwKlbPjlriCrSair8uDvoJlr4oApRorunX4QiluNClSZ5H33x9ZyTuBBMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB14Pj+KkkrHmYHVbf3gzXN8vBlWBXLZuluBzoHJxUU=;
 b=Jde6axmUMqyCyWukAmb0vg6XGCU4JV18ICuPKzTUB9HqHOLfDX3kykGz9E913/mNasSh/I6Kwb76qtjo6wZkXJNwyx+uTZvJ2SPacbZ8WrUMBUqxEcRfhgEzvt1GETFXLucGi+Dqn5HemMKCMKI4yY3nNFpnOVMNeB9knQPfq6sMf6AIx2GrQVe7Fx9xRPh4knaHKNfy5zAFVy+OV9p8l+qgoaUK4snVmKx1V5WX9RtHVZW3cQ3pBONx3+DlmYnyhrwA4rpnUciLHLuA7nGDGr8nVu8yhCj3fVBs9fTUFQ8lCqnTEO71VN0FBdGsbLWZb+MqOGbZ0o0+bSHXozIhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB14Pj+KkkrHmYHVbf3gzXN8vBlWBXLZuluBzoHJxUU=;
 b=kZnh9bNjH86NXutkxEL9haHBhSBjqMQSKyck9kvECt79tUDh+CQj1oCtK3E88ybuUqzEf16d3UhSu7Imq7QUV6CGuBq/sVSclxUwGsQXj2c5I0fc09QN9sAlcnJpcMt5bGvNZf9Mp8UFBE0EGetrVk4MW87BDhZfxo/ZYDDOEI2qL61IDH8DraU15TKOrTeWg5ZtnSgzMaV4Hn/fJn13d2mQjHXQkgK7YWNhIamL4y5YzP8c2a1y78YSP6juDSmF/b1wc0n0whcFGAcV0KdAW3kwmjOdiYsvJzlwJwVu6ORuC7jIn3NT9A8zRH0NhMFzsUm2an3PtUmZc1pjT50vgQ==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PAWP189MB2590.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:34e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.34; Thu, 2 Apr
 2026 09:17:28 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 09:17:28 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Thread-Topic: [OE-core][whinlatter][PATCH] binutils: mark CVE-2025-69650 and
 CVE-2025-69651 as disputed
Thread-Index: AQHcwQJHK9t9JLWjuUOPlosMwWvkSLXKxdyAgAC7A+U=
Date: Thu, 2 Apr 2026 09:17:28 +0000
Message-ID: 
 <AS8P189MB16723C67008387BF6CDD62F9B351A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260331113358.154901-1-adarsh.jagadish.kamini@est.tech>
 <DHI5SEGAUPG3.2IOU3KPLZ0G1B@smile.fr>
In-Reply-To: <DHI5SEGAUPG3.2IOU3KPLZ0G1B@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|PAWP189MB2590:EE_
x-ms-office365-filtering-correlation-id: 29397b63-0543-4aaa-b336-08de9098a95f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|13003099007|56012099003|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 TN4m97TTOjDZr4pXs0kan0XFQ5eAxhtBrpYZdsxYgqzzWsFcbMcE7bjqgvC/9ShNxWrAGQgOzwZXC2ZjyiAkjOzozDII5bz0jwctNoKkppE6EpdwiRp8Pdyl5xihe3AzMf1qQt6+R+bzp0wgAJxI/aZzF4fqnSCVLGAWG/D6GjIlsN8NWztmPhfziQyfHv7oUL6gD9dwmE2jzEqyYPMVId2+WLWEvO9sm5UiPdchM//vTcOGtElrV22FaiVKHrLgbxJ79bzuAlYHFpyRRsgf8f7/LyOWhiFDKs37Xnyx0Us8rcznFO39MWWk8oT2FWXWyJGlofliNcAfaJnPVCTK9sYSWFAby3sr+i33jmNvWDQVy1jJC8K4WnrObknliXi5hxPKX0ZiODkinzfnplNeUccVopGdwKzQ9AtIzfD7pgTntxZn7AsQP7h4Zc9grlsXzY2iZahvMtCCXIss/xdDMLN1Yj2vJzjaVtyTnBS+btnu+RXz1OmAod+rsAPwhe6aFM+KFDC1F2A8VzvF0tkRdOUlEU5cumgHIvdsNHdD0I09mdu1v7k8QLCJYzQeVNn+G0+aZHUDAgmSZ+5RZ3AP0OBLW4JYtIvYfZbDGyH5mDHnDllbiYglmFHfE0zme7oLuukAdvMA+7CLMlLlQ3Bmf2BYmF80QWhBVfrwpqDMGK5VihaL5EY/Zcxkzf96PZtJNZwTe7CAjxhi76ELNfSLiki1vLUAVD641Oi3ph0PRJgYCNdXq4zyOyWvZnw7kAF4GQqugpMfNAeuW/GVk8tH5gG1+Z/fIP83y413fspjyhI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(13003099007)(56012099003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nsstBXavTrt49FjUXo+epALUhXTHlQ96oWHZQKToZvQbIRMK6XQdPKyvX7MV?=
 =?us-ascii?Q?EOIewTiR66F/3IMdrGHMnXSn3tMZnr195iaOZrXcmuX0D5mjppF0fi+XqT/8?=
 =?us-ascii?Q?zLdtZbRGr2dt+e4BVpHwaao7N74m+1UMwqhiSFAzc479zQakeaAZXC5vEWuM?=
 =?us-ascii?Q?48zGXIR2eFr+Dq6RApVEELUu3Srwu2r6lG+jFt4ICXrE0+Vvp8NbxyAS056S?=
 =?us-ascii?Q?uorfzDWxCDlhVAbU4k5Y0ix1LKx3B8imEKEpOiG6vJtcZPap0SsBcMZQc6II?=
 =?us-ascii?Q?RFsPZaTdg4gws6zg4L0EYgiuOb0icPJZFxqSj+P7pasnfMiliDI505GZB8nq?=
 =?us-ascii?Q?w5ilv21hKD5XwvUgZqzADPK1eX1ogoyrj9XOcW+1RHINtwa+7YrgBQjuT5gk?=
 =?us-ascii?Q?iKYW4dUV6ChwIr6PG41yFO5oMHkvU1sCwrE/ejUKqk312g54r82+9PNnBqVV?=
 =?us-ascii?Q?FUHp2JLO8rO00wXoWHSu0TVPfESZAyC+hLYNyB3jLbNX5lotPfSDJ60l1X9i?=
 =?us-ascii?Q?rQsC4TKJfrIB/oRTSkCmgwD5X7pXhxvlBDzH/NqeX5WEg7pkyT9oWSfl6MR7?=
 =?us-ascii?Q?CqtJCzg2CWFuFv+PB4AOLBNqanTIRsdOPg6qhygOO3nB9WvF4pkVrt/DjChZ?=
 =?us-ascii?Q?y//PyD70+r3n7zeMZJ2UJqaCSSQaEvKmNlGP20JQLK6vq4urSGqkDxtJ6NAL?=
 =?us-ascii?Q?S1GVtpQ3HYkFmQqYZpUm6X1oeUw3XnXhwQGthuyZg3d3IOefZXn9nDthPBZG?=
 =?us-ascii?Q?plnVH7g4WgN7kNZ8lfDj9q9gAhncD6ZhbWH9Vb4PLl+qQP4tjQLI1k3OXqUv?=
 =?us-ascii?Q?MhXx07fDjulxjMS/2j47zpPDoLLwDsp0H3Pv3YQoLVK69uZKwmCi92ZUy9mR?=
 =?us-ascii?Q?tJH4tzoxRTBYJj2Z7kOh2pIn0aRNeNsabcnViUR6qGCtLIcTheDtXWMN5DEi?=
 =?us-ascii?Q?2AXxw9MBG0GYehJeP1fhdsbnBoSH0l1lQmKFgtvF378wH1KTZUQgjXyrIwyL?=
 =?us-ascii?Q?5IAeugZcmVlo8sMXp9H0o9sDfQIFqSZWQclzTLMbw7ZuAp32/OQEpnzXCq4Z?=
 =?us-ascii?Q?6A1HNLbxy5aJCXUZn08+uCMash/T/DpmbO1NzaWL2YlVpn47g4B+hTKzagew?=
 =?us-ascii?Q?zmg9TNhDpRIaPrPTBNorgDn7CudVSxmhnG4cPw7WAooDr8k8r/O28Bio5vqX?=
 =?us-ascii?Q?yp3ZiSLQhWKkS+OeyoZAWu6+uhZfWf9kz70onsM7bnxHrDkY4GUjxVeeJtDj?=
 =?us-ascii?Q?r7oZ9OdSh5qsNYxKWNJVLU/oXRosDWxo0ASVMNyjkYDHXkvwkheJZuc5pMcn?=
 =?us-ascii?Q?gVMdQ1p+qs9SKkJEGsYFkALAFYVelvlDS2fc8XMIcffliLGLag8yLl7I5bTL?=
 =?us-ascii?Q?YBzQOdVUOqfezXW16tytZDxG4pFvuGsLisIOtdWEsyA+IoiYNX3tUt+F8cvI?=
 =?us-ascii?Q?ibDDeYsDclb1oPxePf9BMMPyQ+qsecA0B8PYRkjWBLM71O389tIBly8WMXhL?=
 =?us-ascii?Q?1X76VmcYjTTIIw2DJrzg5VzQrb3j/RBQEGui5aVpOuGATIntJUCUTYJXaotF?=
 =?us-ascii?Q?vggPJXL950NfwxwLk5jb9bGD2v9PL3UBW8nL16wK1YKOFikj4etxqfIxYTj3?=
 =?us-ascii?Q?J168KKSsA0LHp54Gku2/CyvvHbbQpPzqVE5m9P7NF89u62LiDPPq/aUiBkkS?=
 =?us-ascii?Q?9Qz6UnzlUqfM8ckrbKl1+mhU7Z3v8SOIuGS1MCkhc1d5JrRxZ9ECBcDpYZ7C?=
 =?us-ascii?Q?naKtZjY8DGX/EhHVtQ87DEJFtMmHVIQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 29397b63-0543-4aaa-b336-08de9098a95f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 09:17:28.3761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfDEvWgtNQJmkSClo7TF9mYP6z1sSwn/eeDXvPH+lAlZaw3lal81YTkm8TyhPGyE0ldGGE9MPaDTLPEE296Q9JezXWy26f0sElvC8VHNO2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2590
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB16723C67008387BF6CDD62F9B351AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 09:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234508

--_000_AS8P189MB16723C67008387BF6CDD62F9B351AAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Just submitted the patch for master too.

Thanks!
/Adarsh
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Thursday, April 2, 2026 00:07
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH] binutils: mark CVE-2025-69650 and=
 CVE-2025-69651 as disputed

On Tue Mar 31, 2026 at 1:33 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Both CVEs are disputed by third parties. The observed behavior
> (double free / invalid pointer free in readelf) only occurred in
> pre-release code and did not affect any tagged version [1][2].
>
> CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-r=
elease code, does not affect any tagged version"
> CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-r=
elease code, does not affect any tagged version"
>
> [1] https://www.cve.org/CVERecord?id=3DCVE-2025-69650
> [2] https://www.cve.org/CVERecord?id=3DCVE-2025-69651
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
Hello,

As far as I can tell this patch is also needed for master where those 2
CVEs apply. Can you send this to master please?

Otherwise, the patch looks good.

Regards,

>  meta/recipes-devtools/binutils/binutils-2.45.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 16a63cabc5..5cd4d185ac 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
>
>  CVE_STATUS[CVE-2025-7545] =3D "cpe-stable-backport: fix available in use=
d git hash"
>  CVE_STATUS[CVE-2025-7546] =3D "cpe-stable-backport: fix available in use=
d git hash"
> +CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-=
release code, does not affect any tagged version"
> +CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-=
release code, does not affect any tagged version"
>
>  SRCREV ?=3D "2f028c6bb163a045db95439fb92e1dcbc919413c"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"


--
Yoann Congal
Smile ECS


--_000_AS8P189MB16723C67008387BF6CDD62F9B351AAS8P189MB1672EURP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Just submitted the patch for master too.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
/Adarsh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Thursday, April 2, 2026 00:07<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][whinlatter][PATCH] binutils: mark CVE-2025-69=
650 and CVE-2025-69651 as disputed</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Mar 31, 2026 at 1:33 PM CEST, Adarsh Jagadi=
sh Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Both CVEs are disputed by third parties. The observed behavior<br>
&gt; (double free / invalid pointer free in readelf) only occurred in<br>
&gt; pre-release code and did not affect any tagged version [1][2].<br>
&gt;<br>
&gt; CVE_STATUS[CVE-2025-69650] =3D &quot;disputed: observed behavior only =
in pre-release code, does not affect any tagged version&quot;<br>
&gt; CVE_STATUS[CVE-2025-69651] =3D &quot;disputed: observed behavior only =
in pre-release code, does not affect any tagged version&quot;<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2025-69650">http=
s://www.cve.org/CVERecord?id=3DCVE-2025-69650</a><br>
&gt; [2] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2025-69651">http=
s://www.cve.org/CVERecord?id=3DCVE-2025-69651</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
Hello,<br>
<br>
As far as I can tell this patch is also needed for master where those 2<br>
CVEs apply. Can you send this to master please?<br>
<br>
Otherwise, the patch looks good.<br>
<br>
Regards,<br>
<br>
&gt;&nbsp; meta/recipes-devtools/binutils/binutils-2.45.inc | 2 ++<br>
&gt;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.45.inc<br>
&gt; index 16a63cabc5..5cd4d185ac 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils-2.45.inc<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc<br>
&gt; @@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt=
;pver&gt;\d+_(\d_?)*)&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; CVE_STATUS[CVE-2025-7545] =3D &quot;cpe-stable-backport: fix ava=
ilable in used git hash&quot;<br>
&gt;&nbsp; CVE_STATUS[CVE-2025-7546] =3D &quot;cpe-stable-backport: fix ava=
ilable in used git hash&quot;<br>
&gt; +CVE_STATUS[CVE-2025-69650] =3D &quot;disputed: observed behavior only=
 in pre-release code, does not affect any tagged version&quot;<br>
&gt; +CVE_STATUS[CVE-2025-69651] =3D &quot;disputed: observed behavior only=
 in pre-release code, does not affect any tagged version&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRCREV ?=3D &quot;2f028c6bb163a045db95439fb92e1dcbc919413c&quot;=
<br>
&gt;&nbsp; BINUTILS_GIT_URI ?=3D &quot;git://sourceware.org/git/binutils-gd=
b.git;branch=3D${SRCBRANCH};protocol=3Dhttps&quot;<br>
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

--_000_AS8P189MB16723C67008387BF6CDD62F9B351AAS8P189MB1672EURP_--

