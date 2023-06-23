Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527F5EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 09:31:04 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.50])
 by mx.groups.io with SMTP id smtpd.web11.38432.1687512658420176180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 02:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=PEHjO/y/;
 spf=pass (domain: navimatix.de, ip: 40.107.15.50, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt5tDLzmKIpd1/b6Z2XTy+tiwpLWcsHnc5wmQWujBcW3WABbqV0K4XMlKshpX3EfkMaB5p6M+8WGz3+N6i+3T8FeUqPvSMLHr2e4JSR4NToCXfKESCESTFmMpptybR0CuSpV6vGRK18u7w3iHLZgVma6MvVARs5U9kl9LhxQv/MdBPMKgGM8bzIfgw/CwE8WHL6GW0DYNPzTgNwnKw2nIJ+kfBtLlMzpogS24K9u2/GS9GtYegkQ1683JOFjl6lZijoVx20xe7yRoeJ037wmmIZh4yGXMNyq+mnHlNaEoUNMoEWIxnNX9Jop37z63yOVZka5pvv3SLdTvRCYG6L6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ5QESCGGPkCTBDoSX3DYXs2jkWw6phKpNEVHnyfrbo=;
 b=YPWGG3CPGdSAirE4KYDPOiXBOH9+77Fc1gfL07PoZUSkZoY9c3gzpYdIPW8w8x6CWKj4Q5+/wqJQFGqKo9Ab0N7SyS0O0s32L+vIeNqEpN4mmQrjwNhHUimcJQw3gEmFeAKPrtwXzzZdvAwMm9o+5ULdCOKT+CuZmiknJpFY0QFhvQGffOPDVLvPFBgwv+KfhGIKga82Ei6FZtun1KYFaqk0HQT3LdNse+eAwbwyD7GZ/4XD8FnhCxhwqF4vZbZvtHgbcm7IoTKND1ythixKbrJXTm2TW4wJKMAGb5I33WJMYbpz7ql7fgBy7A8qUI8cJr/E9egNjnd8Kwmb7TG0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZ5QESCGGPkCTBDoSX3DYXs2jkWw6phKpNEVHnyfrbo=;
 b=PEHjO/y/NQ7i7sZttepIMux63ES4nkpHRFZQ/vEtDtuRnZ2Fjuzb4wfJz7BzJ4hijwE2KNz2uhT6ir3udm79Q3PvSyGAY4YHieLpSgK2g6XF5VzOJ86SjuBKGVNXCp2CdLTuPj5wdyPPl0o/+kIeha299IcjoXUnvNWhlIc3HWc=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by GV1PR01MB8642.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:29::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 09:30:53 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::c7e1:753a:b31b:9135]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::c7e1:753a:b31b:9135%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 09:30:53 +0000
From: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
CC: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH 1/9] runqemu-ifup: remove uid parameter
Thread-Topic: [OE-core] [PATCH 1/9] runqemu-ifup: remove uid parameter
Thread-Index: AQHZpSyOHw7+dYOM9EmD5auUm3llDq+YHoRV
Date: Fri, 23 Jun 2023 09:30:52 +0000
Message-ID: 
 <VI1PR0102MB313661740E953109CED0526EFC23A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
 <20230622170946.10082-2-adrian.freihofer@siemens.com>
In-Reply-To: <20230622170946.10082-2-adrian.freihofer@siemens.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|GV1PR01MB8642:EE_
x-ms-office365-filtering-correlation-id: d7e60bb0-5824-4c55-0bc6-08db73cc8a10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rN6P6O0c6qx2rr7nepP5E1DjGOi1VX9OPb1lQIxqBi9PDT3ocPDNdP6KaGhlW+PJs3mZwyVPSwWFQsorN9gwnt1+UzhZQbCLZhTtZ2g5DZzn0V8f0V8LNc0/XZdqsdfIv8M9PXyBLqdHxt0MYfIFhWce8Xrq22iI7OwOHfn0j2X+dXs+4H30mvlMNecWLBdhv4LCfQSStUmnBvXbHoWfT/c7/lVKV7W5GJeIGNDxPlFlphRKkWTAh/b/tjEu+ZYBnpDhAA0NSlgHYJ3GJPUlbzDxOVkSdSxaS4T7aKTTL7bVFhguo0AlS0njds2C8QqjHPCo4lRadAOxDcIWr38X7eTA1D59UofABaKVFLbIrwYS70rsAx1hFlkpNNf+0AnWCnMN7N2Zp8OnuTAnfof1fy2l4JBwDJBGV2XJ/2pFAdpdl35UAZ8QILAnT/VqoaCziz8uR0wgmZhiIYGrEgaX100dBMW10OAOjt871Klaq8GGoIQkQDqt71lIVwvYPY/i2zOtW/0M5u+1vm80ajR2GYOOVRtMAypZ9hXC6d9Q5iKlWZNi3jMha4nIL6I3HCKaMhGKuW1sqa+0xIultnb1rzPfeiCQCEqvnE7YWp9sFCM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39840400004)(366004)(376002)(396003)(451199021)(19627405001)(66946007)(4326008)(91956017)(76116006)(66476007)(66446008)(33656002)(8936002)(8676002)(66556008)(64756008)(508600001)(316002)(5660300002)(52536014)(55016003)(110136005)(41300700001)(86362001)(38070700005)(7696005)(2906002)(9686003)(53546011)(186003)(26005)(66574015)(6506007)(38100700002)(71200400001)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?T8l3yLEXx9zcZ7vvCy5vSRb5mHGRfRFL/CawVKO2wxm9ZbU2szcp52M7Wo?=
 =?iso-8859-1?Q?uxsWvXt9XGn9QE9A0bgKRxQnJ5wC7upPRJvB59C+sA7nlm9iTFHZ8jpSd8?=
 =?iso-8859-1?Q?/W17KMUnNuuSZLJkukg+G93zelc9MPZoPOVQvtjpA8xPetfpMGXgsK642L?=
 =?iso-8859-1?Q?o8C2PUwh2mDVPlN6PQN2hyqjpuyK+rW6fuAgykd84IgEc3QhHX4VBFY4/v?=
 =?iso-8859-1?Q?wzu3i9K5vYazbhIeOZW7gICBorG9ATcaK4ZKvY8wOdcVaai8+3KAAoPX3x?=
 =?iso-8859-1?Q?PEM/R2all8Rp7Xro4O18Ninzf5+n/EaddlBj/UMZfN3bl/KAi+C6E9U59r?=
 =?iso-8859-1?Q?onqElwV4gTWj8AaVeTcLe7XUvoBwdyNqPw9nuWQ3crTS7i/irWwdsmqPbo?=
 =?iso-8859-1?Q?4i5uNaFGea89RHpWcbVJGR153RmH3dFR2ThMGE13SpYK9zmg5LatwDw+sv?=
 =?iso-8859-1?Q?wUPcc9elKjr/SuP6iAU4ArJujar0L779W/ms358c5G9KLKiAT7l1DTSGe+?=
 =?iso-8859-1?Q?G8OhLlBS/ETfAlk/ADLxciiSslsDgibpzvlUS1mqU4VlAMRx5sSpHJFolw?=
 =?iso-8859-1?Q?WdK1HySdZcia4X6lp2AutuV5dYNA5jvLtp8Eu/AGcijbOpjFz9MkYEtgAg?=
 =?iso-8859-1?Q?Evlj/FaYOUHfmiPsx8hWJEWEs9M3BxPMBRZicbldFwpI89zMNcTQO8IEPU?=
 =?iso-8859-1?Q?NO/zyiJLMaa/kWBEKIY2JXu0iRo0NK/BzMNWglwcN3t3Xj3pHl3Ch25DhN?=
 =?iso-8859-1?Q?3U2KFauailR6g3dnLwGRTeBrRytInVMt0qEfiziA8wldjInhY5r8teFzbo?=
 =?iso-8859-1?Q?XarB0eQwbn6VSwk779iT/Eoxz8Bva5ZBKlw+++5ZXuC0YBdo8HArNqXpi4?=
 =?iso-8859-1?Q?k0ETwP0s1HRvrT4r75aKB9FrLbQHd6yPM015+WtzoM9/jM15wl8Ihc0pUJ?=
 =?iso-8859-1?Q?HJF/8fM0+auwOjCM8oCZlcOlZ0sjyQdQ02vXQGrKPrZQz2fr9+rYjka1jz?=
 =?iso-8859-1?Q?cbWJsLlWTVAu/4B8aavy9RCTwLPqRbNcR6m2hjdPAU/sxHxnMqlGwEgu4u?=
 =?iso-8859-1?Q?t7y0PBPlokgXauqvDq/cxgrRzuTjaRiFDB+UixqbTtd3wprw8gCKG8fQG4?=
 =?iso-8859-1?Q?VkX0MBtZo75Vr91dtUehAPgXtF5w5ry8U9jlLKe6a0TgJy6RLWk++hmipt?=
 =?iso-8859-1?Q?XH79V+bP0YHFguVmJ0yLlqH3oqemlO+koLLFZ+GksgmypriocrFFZmcYhr?=
 =?iso-8859-1?Q?DKR+DA2Y5Q8aroX5H2TD22MYb+YuM62Tkw8IPofpcYDVh9koZjoj39oxhu?=
 =?iso-8859-1?Q?Si/VV0IfdynE7NoI394ncDg2MveFdJZhKDZoWMRBx+1qTiLjvnj3UKMkOr?=
 =?iso-8859-1?Q?oCwVy32XdB9NhjI6c6MvMNikMjEefWpIXXQdNQSjI2OFwR2qGqJNa/dXI8?=
 =?iso-8859-1?Q?harWsoASq4GomS5aKmLoUZ/JgKY744awIm+O6qXoSVTDjlkSA7pWSbfXlc?=
 =?iso-8859-1?Q?KNwpbLe9BpuoFIP7idWtMsGo6drcICB3Dp7Fmz++cV2W0s9FC11xYe1TDs?=
 =?iso-8859-1?Q?v73J4n8Mkhp2NAsoVxvySArxlXz1VuaDDojYyhlH6FgYcUIQjc6lwrL9iK?=
 =?iso-8859-1?Q?QmnGO7TMseFkvMhUOMt7n4zeR1nFiDVHIb?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0102MB313661740E953109CED0526EFC23AVI1PR0102MB3136_"
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e60bb0-5824-4c55-0bc6-08db73cc8a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 09:30:52.9398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghz2CzueOLkiCAToMGZOALnF61IIJFw/pRRPLeTDysnPeNPDTPnsXiDjukYxVTHVdzoQ9lv9QFuyx62ASFpA2RaWOCa3dLLy/BxQGB8Kjus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 09:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183312

--_000_VI1PR0102MB313661740E953109CED0526EFC23AVI1PR0102MB3136_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 22 June 2023 19:01, openembedded-core@lists.openembedded.org wrote:
> ip tuntap does not need the uid, it was an unused variable/parameter.
> Backward compatibility should be fine.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> scripts/runqemu-ifup | 13 ++++++++-----
> 1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index 5dc765dee82..26714518020 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -21,7 +21,7 @@
> #
>
> usage() {
> -       echo "sudo $(basename $0) <uid> <gid>"
> +       echo "sudo $(basename $0) <gid>"
> }
>
> if [ $EUID -ne 0 ]; then
> @@ -29,17 +29,20 @@ if [ $EUID -ne 0 ]; then
> exit 1
> fi
>
> -if [ $# -ne 2 ]; then
> +if [ $# -eq 2 ]; then
> +       echo "Warning: uid parameter is ignored. It is no longer needed."

Would it be better to send this message to stderr (use `>&2`)?

Regards

J=F6rg Sommer

Software Developer / Programmierer
--

Navimatix GmbH

Tatzendpromenade 2

07745 Jena


T: 03641 - 327 99 0

F: 03641 - 526 306

M: joerg.sommer@navimatix.de

www.navimatix.de




Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley

Registergericht: Amtsgericht Jena, HRB 501480



--_000_VI1PR0102MB313661740E953109CED0526EFC23AVI1PR0102MB3136_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
On 22 June 2023 19:01, openembedded-core@lists.openembedded.org wrote:
<div>&gt; ip tuntap does not need the uid, it was an unused variable/parame=
ter.</div>
<div>&gt; Backward compatibility should be fine.</div>
<div>&gt; </div>
<div>&gt; Signed-off-by: Adrian Freihofer &lt;adrian.freihofer@siemens.com&=
gt;</div>
<div>&gt; ---</div>
<div>&gt; scripts/runqemu-ifup | 13 ++++++++-----</div>
<div>&gt; 1 file changed, 8 insertions(+), 5 deletions(-)</div>
<div>&gt; </div>
<div>&gt; diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup</div>
<div>&gt; index 5dc765dee82..26714518020 100755</div>
<div>&gt; --- a/scripts/runqemu-ifup</div>
<div>&gt; +++ b/scripts/runqemu-ifup</div>
<div>&gt; @@ -21,7 +21,7 @@</div>
<div>&gt; #</div>
<div>&gt; </div>
<div>&gt; usage() {</div>
<div>&gt; - &nbsp; &nbsp; &nbsp; echo &quot;sudo $(basename $0) &lt;uid&gt;=
 &lt;gid&gt;&quot;</div>
<div>&gt; + &nbsp; &nbsp; &nbsp; echo &quot;sudo $(basename $0) &lt;gid&gt;=
&quot;</div>
<div>&gt; }</div>
<div>&gt; </div>
<div>&gt; if [ $EUID -ne 0 ]; then</div>
<div>&gt; @@ -29,17 +29,20 @@ if [ $EUID -ne 0 ]; then</div>
<div>&gt; exit 1</div>
<div>&gt; fi</div>
<div>&gt; </div>
<div>&gt; -if [ $# -ne 2 ]; then</div>
<div>&gt; +if [ $# -eq 2 ]; then</div>
<div class=3D"elementToProof">&gt; + &nbsp; &nbsp; &nbsp; echo &quot;Warnin=
g: uid parameter is ignored. It is no longer needed.&quot;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Would it be better to send this message to stderr (use `&gt;&amp;2`)?</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards</div>
<div><br>
</div>
<div>J=F6rg Sommer</div>
<div><br>
</div>
<div>Software Developer / Programmierer</div>
<div class=3D"elementToProof">--&nbsp;</div>
<div><br>
</div>
<div>Navimatix GmbH</div>
<div><br>
</div>
<div>Tatzendpromenade 2</div>
<div><br>
</div>
<div>07745 Jena</div>
<div><br>
</div>
<div><br>
</div>
<div>T: 03641 - 327 99 0</div>
<div><br>
</div>
<div>F: 03641 - 526 306</div>
<div><br>
</div>
<div>M: joerg.sommer@navimatix.de</div>
<div><br>
</div>
<div>www.navimatix.de</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley</div>
<div><br>
</div>
<div>Registergericht: Amtsgericht Jena, HRB 501480</div>
<div><br>
</div>
<div><br>
</div>
</body>
</html>

--_000_VI1PR0102MB313661740E953109CED0526EFC23AVI1PR0102MB3136_--

