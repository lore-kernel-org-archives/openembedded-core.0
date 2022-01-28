Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239B1C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 16:53:53 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.47])
 by mx.groups.io with SMTP id smtpd.web10.920.1643388831017706566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 08:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=v8bRYdpU;
 spf=pass (domain: kpit.com, ip: 40.107.138.47,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMbIuMvALi/5WZL3UBnSOps/E+D3VKaY6sjxUjNSYU6ZdCp26t+DU5ZeMVDYq3SZ1hrweHQBCh2Ly53HMt33wBX7rTbo99e7kx2eMr2swp+RCmby6n8iAt3mCXdONuw2NRXdL6ObCV/PdTvUcA7XzVbHeA79Fyhn7A9U/gs1DpOnEzFsSjaQAeb/07ecJRXEwkV/Al97LB5MK4OIWo60dWFdQMDyAwlkuKpnV0ANYcO0TpZX+Wv+5QJeJc+L52YtaQDiXza4jnXZgFxYv0WolPes91NSNl9/FoyyMTRwyXxRwQ7pxZzdvDq2dO9PYGJ4QjbE4krxIIpwMPUxUNPiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lFRYD49u8WYJlNvF9VtuPTKtT+O0Cc2XQCI1lmAbhE=;
 b=X2HP+xdsJ4kFW0bODgi0s4A8ThqJZzkksGmhxXvHYATVlv9sbU5WbI8Z4PKAr+cQARxsslj7nHsX70nrsOtQN8SxpY4A4Z0Fqxyy+P0iUbgZMMVDlGaNBnzY6y9XueJ8pAZWy58/p2IFN9wId/u7PdBWLtxIJ9OD6N2XpRDG29A8O64n+sUzRmlCzGu+nwCqxomiWzB5wcrpdQtROMRM9kBaAoKYgoPVhWfCk6VzhZQ+VNLnspjh5F8te23cDj7WF1SsXYkm7kMZdX/uO6kDI/1WTACAHcHstJn4yn67cKCclqUSRo3PuptAjl85YVqt8j9/x3U/i/s2hfN/qY0yUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lFRYD49u8WYJlNvF9VtuPTKtT+O0Cc2XQCI1lmAbhE=;
 b=v8bRYdpUWkJGljFud7GiOobQ+/UJTmrIfeTli5VbvXI6Cfn/bTYhEEaViIGtAVWpyZBOdqhqT/ov7wL2oL3CsD2YhTJ2T1MBy2FdmzPdzi14rs2Ww5H4CPPYzN4uk8fDqRURIbLt9mSa3CJWwRznQURSY+T1gIMQ3vAqdaPVLDg=
Received: from MA0PR01MB7378.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:38::11)
 by MAXPR0101MB1211.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:15::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Fri, 28 Jan
 2022 16:53:40 +0000
Received: from MA0PR01MB7378.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e525:ef1d:3d2b:b9f2]) by MA0PR01MB7378.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e525:ef1d:3d2b:b9f2%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 16:53:39 +0000
From: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
To: Steve Sakoman <steve@sakoman.com>, "ranjitsinhrathod1991@gmail.com"
	<ranjitsinhrathod1991@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Akash Hadke
	<Akash.Hadke@kpit.com>, Purushottam Choudhary
	<Purushottam.Choudhary@kpit.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] util-linux: Fix for
 CVE-2021-3995 and CVE-2021-3996
Thread-Topic: [OE-core] [meta][dunfell][PATCH] util-linux: Fix for
 CVE-2021-3995 and CVE-2021-3996
Thread-Index: AQHYFE3caarorIP6FU+cRwLLXtsbdKx4ivEAgAAZOgCAAAHz6w==
Date: Fri, 28 Jan 2022 16:53:39 +0000
Message-ID: 
 <MA0PR01MB7378CBEBD17291564E58BED98F229@MA0PR01MB7378.INDPRD01.PROD.OUTLOOK.COM>
References: <20220128134551.14630-1-ranjitsinhrathod1991@gmail.com>
 <CAOSpxdabAT=TvmL=-QUNGJA5Kq8v5qOjDoDjbZ9mdnumNp61cQ@mail.gmail.com>
 <CACpMEhMNNwxDe-YNHYE73kPD_hdQ2f2oijA6QoqV7ibZ_k35gw@mail.gmail.com>
In-Reply-To: 
 <CACpMEhMNNwxDe-YNHYE73kPD_hdQ2f2oijA6QoqV7ibZ_k35gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5bbe641d-d470-0c12-c0da-d85f70103a3a
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00a18b05-bacb-4019-e938-08d9e27ebc26
x-ms-traffictypediagnostic: MAXPR0101MB1211:EE_
x-microsoft-antispam-prvs: 
 <MAXPR0101MB121111FD6752A3F20C8AB0E78F229@MAXPR0101MB1211.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:167;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F+FWOVY6DWFnvpCEv58snqpqwMYnBgHb55xYouPwttDVnT3+9ic6hnhdYvJnVkcr1vzce8CPMYcfVzezCrRdx91BFBatiryzFw3Ief8pxiGJ/fmg5B0mWLLKcjkEjCyHT/TrCzMr/yf7RgzHjBMp2+rtvrQ491IgzYJita1thU8w7f+kfyOoJj5jyVM9FrSAZdT2cpLrChdzP98XZAT0oGlTw1KMe9Jo6FA7DgN6HF5ByX0crhwLn2/Wd26DnYUaE6a/cCt1UU003rGkUw48/rIx59p4j5gbKOGAsyw/eRggV8C4ZlLxjVtRa5ddxCXBnQ5WvzQQ5MROp4Kfx8GXtkVnAQRn3T40ynzmBEhXWbQSpoyURxOYQCKJuOPJqngnajBjMYCPCBIcyupJ9G/JJJutvGa9fDiySFOTF9ykng3RyBFmBg8yWcraUHaqXlg/muVz8RDihi1YJA/vHWPU9VUJU66SoNte6m27vJvVVsptglvpibyFIBP8RIe6kTJ+ui49DcEBIbG8a0rxcFeDV9a3ibBD1X5Mk9O9hUBgJYppqD14fAxyPXYQncJVFco2teqqMglvFufnO/Tml+UskH+EkZGH5jJ7cYp/ncCLjnSZdHFGCGsrjFcl3T0FKH8DKbYmpM1vrql9kjAFeVxoRjQjQxBssWK7tcD1/ULYhcmfxNaa/WEfdhgFWZwKECxke6/PLv2ekvNksJXYqQmEyCzw/T+xeDhEfdmUpU0yxI5ieE7sop8SHYSLCacVhmz9bY9rU8SRR0M6lHTVmUCpm1ScIhJrNpyHqKa2KqZ72PJJK8QWt1B6AxoigTQpeYNEmvwQO1r6VqGZYxWnVA2Yaw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB7378.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(52536014)(8936002)(38070700005)(76116006)(316002)(26005)(66946007)(83380400001)(166002)(33656002)(91956017)(2906002)(107886003)(110136005)(66574015)(66556008)(6506007)(53546011)(7696005)(186003)(99936003)(508600001)(54906003)(45080400002)(66476007)(7066003)(30864003)(86362001)(19627405001)(5660300002)(71200400001)(122000001)(966005)(55016003)(9686003)(64756008)(4326008)(38100700002)(66446008)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FR5w8ueIw0dEdQ2SIiQJEk6RLlQSyN/z9fwn6c11woH2b/oSDEOkDBp+tLTx?=
 =?us-ascii?Q?QmjifB3kpEOB9fES6Y0SR5TD/4US54Yg7X6wgVYlOvNP/5S8hPB304YDM2Gw?=
 =?us-ascii?Q?TRPUrqSE4jIoMh+rWVuO8kmUYsmoLm2fqo0iGR4B7MooQl4FXW0hWaxJPGGv?=
 =?us-ascii?Q?TIxIr74OXGlWMCvUMcWBYCuyoRcz7ab2vIWVcQcSnixJRA/h0QiRpvqBMYTe?=
 =?us-ascii?Q?eayynQEb1K3gSonRlu2WeZjWMjhIrRvVj3KDF0itA6LiHlUhMmOnwTtlMTyj?=
 =?us-ascii?Q?0Zy307U+BFfWSyWSbPnod4k9eozrUrXx6HkjxkC01L2LbmIpgm7y3bQLA63w?=
 =?us-ascii?Q?ZwTdeTCj2sNvAMZo63AXAxMFldm4DVWkVTEglU+50lFGB/SGGtcIoBoyCJy6?=
 =?us-ascii?Q?Iles9f3ET4W7AkazC+XRBClB1Ecy+FeywIDKzDTwsz8MP6az+nrwYMSWg5NA?=
 =?us-ascii?Q?NSEN+Rv1Ab2YW3c1KcgU7hvqrgq9ZoJyG6Y8EHhOC4sSA3ExxI5tzG1WUABH?=
 =?us-ascii?Q?BjjYOCN/0R1SeKsG1XkbrvDHaE5jH1RG80BfalNWXI2hMzyFGJet5wC3ngF7?=
 =?us-ascii?Q?fmUAAnzT5qJkS7/hq+h8jro3zAFPVR5Xxp1PeyH5HjVV40Qfnr3ypBk5A7YS?=
 =?us-ascii?Q?yfBSItGp/51ApMNYFJxCXVf7B1QlyTdwD288kEKcgOLXASZ1cBTGxfbw6Nxd?=
 =?us-ascii?Q?WrdTLX5E8yVA916tQPbLobtgC6n1ohbzrIzziGNKRIFfLhgcvx4wxphDshEC?=
 =?us-ascii?Q?dHpX7d7czww3Ed1cOPOe0FbU6ZBfeT9IwGLIptWBQEn6L5F1XY4Z3e05hO5R?=
 =?us-ascii?Q?7k6WKoHZxa1YyLbos7EgflOBoVV2erLnpHIN1FCHvOnatKERB8XAscekWIEr?=
 =?us-ascii?Q?hkJzDfhsLcSDCoiDzr/hl4KZ+L4Zor9/gQ+yQNsy0KAx4kZ6vep/T+GM1uxS?=
 =?us-ascii?Q?WR2AMbcEtfzGN/dMjoh47QOcBkZd9fhR5uUD/+Syil9QM7pydVcqvnVu67Eo?=
 =?us-ascii?Q?PFl4kkELuvkB6qIaXfK5pf3aL6Ckv6w9R/EE4I3zI/sVcvJxcOn0ORYGbMPA?=
 =?us-ascii?Q?aXCRUGpxH9YmTCem9VEZ6hkRS+/TFdVZCy09uQ/+jx0Y/PzpxYhsw6oSXbsl?=
 =?us-ascii?Q?t3aQ7IDYLazYRx03YPeINN10+/PkdLKhDQPXH1PLlFRDFBykg93C1hfAC930?=
 =?us-ascii?Q?237+yDmUYK04HmgcEtGlzjVLkq3vZqIrgvgQROEQiHPzKmUWGJbaI6ula0Z1?=
 =?us-ascii?Q?oNXA90wgWTP8U9icuQjptUJ1obh1f09GfQf2EsVW9lzDObUrWzRqLurHhT3J?=
 =?us-ascii?Q?pHWhTdCAl3s9kFO0NkzR9WJKX1pWZlQ9M0OEhxkOx+9B8iUHZkUH15HemWsO?=
 =?us-ascii?Q?DHd6mz3/AUJ/F7g5QHuqS5Lk1S404z0vZ1eHu2lqBX8HhWjMqPnpr/e86xZF?=
 =?us-ascii?Q?gSY8C3mlM991DmEK7dEmoMZcRNb5XE61wW2RQIPJ6psRlN9UKtQmx7SgsQOq?=
 =?us-ascii?Q?z1NQnFJYBXfGjW3QqVuQvc5j8qoW0WsRM0Ej4fYd646bOot68tVGr2uwQTAt?=
 =?us-ascii?Q?VKj817p84Y0Oi6RClD31n8e/HipFsf14GSelv1pmRWhQJoX/DtC8A0jtWEHP?=
 =?us-ascii?Q?dw=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_006_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB7378.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 00a18b05-bacb-4019-e938-08d9e27ebc26
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 16:53:39.8015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 TbKO51Z7vr/HbOVQwXcf5qs3HKXJh8gzPIpBJQPk1r35qmSAv0epf63UwHEEZ1cuvn5DldpNTUoNO+uUFPWTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161082

--_006_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_
Content-Type: multipart/related;
	boundary="_005_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_";
	type="multipart/alternative"

--_005_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_"

--_000_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Steve,

Can you try this attached file instead which was the output of git format-p=
atch -1 only?


Thanks,

Best Regards,

Ranjitsinh Rathod
Technical Leader |  | KPIT Technologies Ltd.
Cellphone: +91-84606 92403
__________________________________________
KPIT<http://www.kpit.com/> | Follow us on LinkedIn<http://www.kpit.com/link=
edin>

[cid:4d916ca5-48fc-4e0b-977e-d7c45aaa0102]<https://www.kpit.com/TheNewBrand=
>

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Ranjitsinh Rathod via lists.openembedded.org <r=
anjitsinhrathod1991=3Dgmail.com@lists.openembedded.org>
Sent: Friday, January 28, 2022 10:15 PM
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@list=
s.openembedded.org>; Akash Hadke <Akash.Hadke@kpit.com>; Purushottam Choudh=
ary <Purushottam.Choudhary@kpit.com>; Ranjitsinh Rathod <Ranjitsinh.Rathod@=
kpit.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] util-linux: Fix for CVE-2021-=
3995 and CVE-2021-3996

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.
Hi Steve,

I have also faced this problem during the patch test. Actually, this is due=
 to the code itself has next line character between 'foo' and 'bar'.

This is maybe because of the below change
https://github.com/util-linux/util-linux/commit/5b13d6a1c905e1e425e6b7ca340=
a410c580f0f75<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2Fcommit%2F5b13d6a1c905e1e425e6=
b7ca340a410c580f0f75&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8=
aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637=
789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DihTsKjOfUsoulkJrfsKxyTIPLvWd=
rhFs8eXvZZftWbo%3D&reserved=3D0>

Then I have manually added '^M' character as line break between 'foo' and '=
bar' and it worked.

Do you know anything else to avoid these errors?

Thanks,
Ranjitsinh

On Fri, 28 Jan, 2022, 8:44 pm Steve Sakoman, <steve@sakoman.com<mailto:stev=
e@sakoman.com>> wrote:
On Fri, Jan 28, 2022 at 3:46 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com<mailto:ranjitsinhrathod1991@gmail.com>> wro=
te:
>
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranjitsinh.rat=
hod@kpit.com>>
>
> Add patches to fix CVE-2021-3995 and CVE-2021-3996
> Also, add support include-strutils-cleanup-strto-functions.patch to
> solve compilation error where `ul_strtou64` function not found which is
> used in CVE-2021-3995.patch
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranji=
tsinh.rathod@kpit.com>>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com<mailto:r=
anjitsinhrathod1991@gmail.com>>
> ---
>  .../util-linux/util-linux/CVE-2021-3995.patch | 139 +++++++++
>  .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++++
>  ...ude-strutils-cleanup-strto-functions.patch | 270 ++++++++++++++++++
>  .../util-linux/util-linux_2.35.1.bb<https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&data=3D04%7C01%7Cran=
jitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sd=
ata=3DrVq25G4Vy8bhj%2B8eQ7CDtHPnBK4wIa%2FOxOOMYyRB8ms%3D&reserved=3D0>     =
      |   3 +
>  4 files changed, 638 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3995=
.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3996=
.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/include-strut=
ils-cleanup-strto-functions.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch =
b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
> new file mode 100644
> index 0000000000..1dcb66ad1d
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
> @@ -0,0 +1,139 @@
> +From f3db9bd609494099f0c1b95231c5dfe383346929 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com<mailto:kzak@redhat.com>>
> +Date: Wed, 24 Nov 2021 13:53:25 +0100
> +Subject: [PATCH] libmount: fix UID check for FUSE umount [CVE-2021-3995]
> +
> +Improper UID check allows an unprivileged user to unmount FUSE
> +filesystems of users with similar UID.
> +
> +Signed-off-by: Karel Zak <kzak@redhat.com<mailto:kzak@redhat.com>>
> +
> +CVE: CVE-2021-3995
> +Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/f3db9bd609494099f0c1b95231c5dfe383346929<https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2=
Fcommit%2Ff3db9bd609494099f0c1b95231c5dfe383346929&data=3D04%7C01%7Cranjits=
inh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=
=3DxiT2SCJcuF%2FUEMvwyxCiFnlQRdimA0TdZnV5nJ3ovr4%3D&reserved=3D0>]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranj=
itsinh.rathod@kpit.com>>
> +
> +---
> + include/strutils.h            |  2 +-
> + libmount/src/context_umount.c | 14 +++---------
> + libmount/src/mountP.h         |  1 +
> + libmount/src/optstr.c         | 42 +++++++++++++++++++++++++++++++++++
> + 4 files changed, 47 insertions(+), 12 deletions(-)
> +
> +diff --git a/include/strutils.h b/include/strutils.h
> +index 6e95707ea9..a84d29594d 100644
> +--- a/include/strutils.h
> ++++ b/include/strutils.h
> +@@ -91,8 +91,8 @@ static inline char *mem2strcpy(char *dest, const void =
*src, size_t n, size_t nma
> +       if (n + 1 > nmax)
> +               n =3D nmax - 1;
> +
> ++      memset(dest, '\0', nmax);
> +       memcpy(dest, src, n);
> +-      dest[nmax-1] =3D '\0';
> +       return dest;
> + }
> +
> +diff --git a/libmount/src/context_umount.c b/libmount/src/context_umount=
.c
> +index 173637a15a..8773c65ffa 100644
> +--- a/libmount/src/context_umount.c
> ++++ b/libmount/src/context_umount.c
> +@@ -393,10 +393,7 @@ static int is_fuse_usermount(struct libmnt_context =
*cxt, int *errsv)
> +       struct libmnt_ns *ns_old;
> +       const char *type =3D mnt_fs_get_fstype(cxt->fs);
> +       const char *optstr;
> +-      char *user_id =3D NULL;
> +-      size_t sz;
> +-      uid_t uid;
> +-      char uidstr[sizeof(stringify_value(ULONG_MAX))];
> ++      uid_t uid, entry_uid;
> +
> +       *errsv =3D 0;
> +
> +@@ -413,11 +410,7 @@ static int is_fuse_usermount(struct libmnt_context =
*cxt, int *errsv)
> +       optstr =3D mnt_fs_get_fs_options(cxt->fs);
> +       if (!optstr)
> +               return 0;
> +-
> +-      if (mnt_optstr_get_option(optstr, "user_id", &user_id, &sz) !=3D =
0)
> +-              return 0;
> +-
> +-      if (sz =3D=3D 0 || user_id =3D=3D NULL)
> ++      if (mnt_optstr_get_uid(optstr, "user_id", &entry_uid) !=3D 0)
> +               return 0;
> +
> +       /* get current user */
> +@@ -434,8 +427,7 @@ static int is_fuse_usermount(struct libmnt_context *=
cxt, int *errsv)
> +               return 0;
> +       }
> +
> +-      snprintf(uidstr, sizeof(uidstr), "%lu", (unsigned long) uid);
> +-      return strncmp(user_id, uidstr, sz) =3D=3D 0;
> ++      return uid =3D=3D entry_uid;
> + }
> +
> + /*
> +diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
> +index d43a835418..22442ec55e 100644
> +--- a/libmount/src/mountP.h
> ++++ b/libmount/src/mountP.h
> +@@ -400,6 +400,7 @@ extern const struct libmnt_optmap *mnt_optmap_get_en=
try(
> +                            const struct libmnt_optmap **mapent);
> +
> + /* optstr.c */
> ++extern int mnt_optstr_get_uid(const char *optstr, const char *name, uid=
_t *uid);
> + extern int mnt_optstr_remove_option_at(char **optstr, char *begin, char=
 *end);
> + extern int mnt_optstr_fix_gid(char **optstr, char *value, size_t valsz,=
 char **next);
> + extern int mnt_optstr_fix_uid(char **optstr, char *value, size_t valsz,=
 char **next);
> +diff --git a/libmount/src/optstr.c b/libmount/src/optstr.c
> +index 921b9318e7..16800f571c 100644
> +--- a/libmount/src/optstr.c
> ++++ b/libmount/src/optstr.c
> +@@ -1090,6 +1090,48 @@ int mnt_optstr_fix_user(char **optstr)
> +       return rc;
> + }
> +
> ++/*
> ++ * Converts value from @optstr addressed by @name to uid.
> ++ *
> ++ * Returns: 0 on success, 1 if not found, <0 on error
> ++ */
> ++int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t *uid=
)
> ++{
> ++      char *value =3D NULL;
> ++      size_t valsz =3D 0;
> ++      char buf[sizeof(stringify_value(UINT64_MAX))];
> ++      int rc;
> ++      uint64_t num;
> ++
> ++      assert(optstr);
> ++      assert(name);
> ++      assert(uid);
> ++
> ++      rc =3D mnt_optstr_get_option(optstr, name, &value, &valsz);
> ++      if (rc !=3D 0)
> ++              goto fail;
> ++
> ++      if (valsz > sizeof(buf) - 1) {
> ++              rc =3D -ERANGE;
> ++              goto fail;
> ++      }
> ++      mem2strcpy(buf, value, valsz, sizeof(buf));
> ++
> ++      rc =3D ul_strtou64(buf, &num, 10);
> ++      if (rc !=3D 0)
> ++              goto fail;
> ++      if (num > ULONG_MAX || (uid_t) num !=3D num) {
> ++              rc =3D -ERANGE;
> ++              goto fail;
> ++      }
> ++      *uid =3D (uid_t) num;
> ++
> ++      return 0;
> ++fail:
> ++      DBG(UTILS, ul_debug("failed to convert '%s'=3D to number [rc=3D%d=
]", name, rc));
> ++      return rc;
> ++}
> ++
> + /**
> +  * mnt_match_options:
> +  * @optstr: options string
> diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch =
b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
> new file mode 100644
> index 0000000000..1610b5a0fe
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
> @@ -0,0 +1,226 @@
> +From 018a10907fa9885093f6d87401556932c2d8bd2b Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com<mailto:kzak@redhat.com>>
> +Date: Tue, 4 Jan 2022 10:54:20 +0100
> +Subject: [PATCH] libmount: fix (deleted) suffix issue [CVE-2021-3996]
> +
> +This issue is related to parsing the /proc/self/mountinfo file allows an
> +unprivileged user to unmount other user's filesystems that are either
> +world-writable themselves or mounted in a world-writable directory.
> +
> +The support for "(deleted)" is no more necessary as the Linux kernel doe=
s
> +not use it in /proc/self/mountinfo and /proc/self/mount files anymore.
> +
> +Signed-off-by: Karel Zak <kzak@redhat.com<mailto:kzak@redhat.com>>
> +
> +CVE: CVE-2021-3996
> +Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/018a10907fa9885093f6d87401556932c2d8bd2b<https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2=
Fcommit%2F018a10907fa9885093f6d87401556932c2d8bd2b&data=3D04%7C01%7Cranjits=
inh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=
=3DrofDL8ZaFp0Jpxd%2Buwptwox6BGpQlWuI7n6DURdBXyU%3D&reserved=3D0>]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranj=
itsinh.rathod@kpit.com>>
> +
> +---
> + libmount/src/tab_parse.c                            |  5 -----
> + tests/expected/findmnt/filter-options               |  1 -
> + tests/expected/findmnt/filter-options-nameval-neg   |  3 +--
> + tests/expected/findmnt/filter-types-neg             |  1 -
> + tests/expected/findmnt/outputs-default              |  3 +--
> + tests/expected/findmnt/outputs-force-tree           |  3 +--
> + tests/expected/findmnt/outputs-kernel               |  3 +--
> + tests/expected/libmount/tabdiff-mount               |  1 -
> + tests/expected/libmount/tabdiff-move                |  1 -
> + tests/expected/libmount/tabdiff-remount             |  1 -
> + tests/expected/libmount/tabdiff-umount              |  1 -
> + tests/expected/libmount/tabfiles-parse-mountinfo    | 11 -----------
> + tests/expected/libmount/tabfiles-py-parse-mountinfo | 11 -----------
> + tests/ts/findmnt/files/mountinfo                    |  1 -
> + tests/ts/findmnt/files/mountinfo-nonroot            |  1 -
> + tests/ts/libmount/files/mountinfo                   |  1 -
> + 16 files changed, 4 insertions(+), 44 deletions(-)
> +
> +diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
> +index 917779ab6d..4407f9c9c7 100644
> +--- a/libmount/src/tab_parse.c
> ++++ b/libmount/src/tab_parse.c
> +@@ -225,11 +225,6 @@ static int mnt_parse_mountinfo_line(struct libmnt_f=
s *fs, const char *s)
> +               goto fail;
> +       }
> +
> +-      /* remove "\040(deleted)" suffix */
> +-      p =3D (char *) endswith(fs->target, PATH_DELETED_SUFFIX);
> +-      if (p && *p)
> +-              *p =3D '\0';
> +-
> +       s =3D skip_separator(s);
> +
> +       /* (6) vfs options (fs-independent) */
> +diff --git a/tests/expected/findmnt/filter-options b/tests/expected/find=
mnt/filter-options
> +index 2606bce76b..97b0ead0ad 100644
> +--- a/tests/expected/findmnt/filter-options
> ++++ b/tests/expected/findmnt/filter-options
> +@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE  =
              OPTIONS
> + /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon rw,=
nosuid,nodev,relatime,user_id=3D500,group_id=3D500
> + /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs            rw,=
relatime
> + /mnt/sounds                  //foo.home/bar/  cifs                  rw,=
relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,nofo=
rceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsi=
ze=3D16384,wsize=3D57344
> +-/mnt/foo                     /fooooo          bar                   rw,=
relatime
> + rc=3D0
> +diff --git a/tests/expected/findmnt/filter-options-nameval-neg b/tests/e=
xpected/findmnt/filter-options-nameval-neg
> +index 5471d65af1..f0467ef755 100644
> +--- a/tests/expected/findmnt/filter-options-nameval-neg
> ++++ b/tests/expected/findmnt/filter-options-nameval-neg
> +@@ -29,6 +29,5 @@ TARGET                         SOURCE                F=
STYPE                OPTIO
> + |-/home/kzak                   /dev/mapper/kzak-home ext4              =
    rw,noatime,barrier=3D1,data=3Dordered
> + | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-dae=
mon rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
> + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs        =
    rw,relatime
> +-|-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> +-`-/mnt/foo                     /fooooo               bar               =
    rw,relatime
> ++`-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> + rc=3D0
> +diff --git a/tests/expected/findmnt/filter-types-neg b/tests/expected/fi=
ndmnt/filter-types-neg
> +index 2606bce76b..97b0ead0ad 100644
> +--- a/tests/expected/findmnt/filter-types-neg
> ++++ b/tests/expected/findmnt/filter-types-neg
> +@@ -28,5 +28,4 @@ TARGET                       SOURCE           FSTYPE  =
              OPTIONS
> + /home/kzak/.gvfs             gvfs-fuse-daemon fuse.gvfs-fuse-daemon rw,=
nosuid,nodev,relatime,user_id=3D500,group_id=3D500
> + /var/lib/nfs/rpc_pipefs      sunrpc           rpc_pipefs            rw,=
relatime
> + /mnt/sounds                  //foo.home/bar/  cifs                  rw,=
relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,nofo=
rceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsi=
ze=3D16384,wsize=3D57344
> +-/mnt/foo                     /fooooo          bar                   rw,=
relatime
> + rc=3D0
> +diff --git a/tests/expected/findmnt/outputs-default b/tests/expected/fin=
dmnt/outputs-default
> +index 59495797bd..01599355ec 100644
> +--- a/tests/expected/findmnt/outputs-default
> ++++ b/tests/expected/findmnt/outputs-default
> +@@ -30,6 +30,5 @@ TARGET                         SOURCE                F=
STYPE                OPTIO
> + |-/home/kzak                   /dev/mapper/kzak-home ext4              =
    rw,noatime,barrier=3D1,data=3Dordered
> + | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-dae=
mon rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
> + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs        =
    rw,relatime
> +-|-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> +-`-/mnt/foo                     /fooooo               bar               =
    rw,relatime
> ++`-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> + rc=3D0
> +diff --git a/tests/expected/findmnt/outputs-force-tree b/tests/expected/=
findmnt/outputs-force-tree
> +index 59495797bd..01599355ec 100644
> +--- a/tests/expected/findmnt/outputs-force-tree
> ++++ b/tests/expected/findmnt/outputs-force-tree
> +@@ -30,6 +30,5 @@ TARGET                         SOURCE                F=
STYPE                OPTIO
> + |-/home/kzak                   /dev/mapper/kzak-home ext4              =
    rw,noatime,barrier=3D1,data=3Dordered
> + | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-dae=
mon rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
> + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs        =
    rw,relatime
> +-|-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> +-`-/mnt/foo                     /fooooo               bar               =
    rw,relatime
> ++`-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> + rc=3D0
> +diff --git a/tests/expected/findmnt/outputs-kernel b/tests/expected/find=
mnt/outputs-kernel
> +index 59495797bd..01599355ec 100644
> +--- a/tests/expected/findmnt/outputs-kernel
> ++++ b/tests/expected/findmnt/outputs-kernel
> +@@ -30,6 +30,5 @@ TARGET                         SOURCE                F=
STYPE                OPTIO
> + |-/home/kzak                   /dev/mapper/kzak-home ext4              =
    rw,noatime,barrier=3D1,data=3Dordered
> + | `-/home/kzak/.gvfs           gvfs-fuse-daemon      fuse.gvfs-fuse-dae=
mon rw,nosuid,nodev,relatime,user_id=3D500,group_id=3D500
> + |-/var/lib/nfs/rpc_pipefs      sunrpc                rpc_pipefs        =
    rw,relatime
> +-|-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> +-`-/mnt/foo                     /fooooo               bar               =
    rw,relatime
> ++`-/mnt/sounds                  //foo.home/bar/       cifs              =
    rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=
=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverin=
o,acl,rsize=3D16384,wsize=3D57344
> + rc=3D0
> +diff --git a/tests/expected/libmount/tabdiff-mount b/tests/expected/libm=
ount/tabdiff-mount
> +index 420aeacd5e..3c18f8dc4f 100644
> +--- a/tests/expected/libmount/tabdiff-mount
> ++++ b/tests/expected/libmount/tabdiff-mount
> +@@ -1,3 +1,2 @@
> + /dev/mapper/kzak-home on /home/kzak: MOUNTED
> +-/fooooo on /mnt/foo: MOUNTED
> + tmpfs on /mnt/test/foo
> bar: MOUNTED

This patch fails to apply due to the above line wrap error (and
several more like it below)

Perhaps your mailer?

Steve

> +diff --git a/tests/expected/libmount/tabdiff-move b/tests/expected/libmo=
unt/tabdiff-move
> +index 24f9bc791b..95820d93ef 100644
> +--- a/tests/expected/libmount/tabdiff-move
> ++++ b/tests/expected/libmount/tabdiff-move
> +@@ -1,3 +1,2 @@
> + //foo.home/bar/ on /mnt/music: MOVED to /mnt/music
> +-/fooooo on /mnt/foo: UMOUNTED
> + tmpfs on /mnt/test/foo
> bar: UMOUNTED
> +diff --git a/tests/expected/libmount/tabdiff-remount b/tests/expected/li=
bmount/tabdiff-remount
> +index 82ebeab390..876bfd9539 100644
> +--- a/tests/expected/libmount/tabdiff-remount
> ++++ b/tests/expected/libmount/tabdiff-remount
> +@@ -1,4 +1,3 @@
> + /dev/mapper/kzak-home on /home/kzak: REMOUNTED from 'rw,noatime,barrier=
=3D1,data=3Dordered' to 'ro,noatime,barrier=3D1,data=3Dordered'
> + //foo.home/bar/ on /mnt/sounds: REMOUNTED from 'rw,relatime,unc=3D\\foo=
.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,nofor=
cegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D5=
7344' to 'ro,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP=
,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serv=
erino,acl,rsize=3D16384,wsize=3D57344'
> +-/fooooo on /mnt/foo: UMOUNTED
> + tmpfs on /mnt/test/foo
> bar: UMOUNTED
> +diff --git a/tests/expected/libmount/tabdiff-umount b/tests/expected/lib=
mount/tabdiff-umount
> +index a3e0fe48a1..c7be725b92 100644
> +--- a/tests/expected/libmount/tabdiff-umount
> ++++ b/tests/expected/libmount/tabdiff-umount
> +@@ -1,3 +1,2 @@
> + /dev/mapper/kzak-home on /home/kzak: UMOUNTED
> +-/fooooo on /mnt/foo: UMOUNTED
> + tmpfs on /mnt/test/foo
> bar: UMOUNTED
> +diff --git a/tests/expected/libmount/tabfiles-parse-mountinfo b/tests/ex=
pected/libmount/tabfiles-parse-mountinfo
> +index 47eb770061..d5ba5248e4 100644
> +--- a/tests/expected/libmount/tabfiles-parse-mountinfo
> ++++ b/tests/expected/libmount/tabfiles-parse-mountinfo
> +@@ -351,17 +351,6 @@ id:     47
> + parent: 20
> + devno:  0:38
> + ------ fs:
> +-source: /fooooo
> +-target: /mnt/foo
> +-fstype: bar
> +-optstr: rw,relatime
> +-VFS-optstr: rw,relatime
> +-FS-opstr: rw
> +-root:   /
> +-id:     48
> +-parent: 20
> +-devno:  0:39
> +------- fs:
> + source: tmpfs
> + target: /mnt/test/foo
> bar
> + fstype: tmpfs
> +diff --git a/tests/expected/libmount/tabfiles-py-parse-mountinfo b/tests=
/expected/libmount/tabfiles-py-parse-mountinfo
> +index 47eb770061..d5ba5248e4 100644
> +--- a/tests/expected/libmount/tabfiles-py-parse-mountinfo
> ++++ b/tests/expected/libmount/tabfiles-py-parse-mountinfo
> +@@ -351,17 +351,6 @@ id:     47
> + parent: 20
> + devno:  0:38
> + ------ fs:
> +-source: /fooooo
> +-target: /mnt/foo
> +-fstype: bar
> +-optstr: rw,relatime
> +-VFS-optstr: rw,relatime
> +-FS-opstr: rw
> +-root:   /
> +-id:     48
> +-parent: 20
> +-devno:  0:39
> +------- fs:
> + source: tmpfs
> + target: /mnt/test/foo
> bar
> + fstype: tmpfs
> +diff --git a/tests/ts/findmnt/files/mountinfo b/tests/ts/findmnt/files/m=
ountinfo
> +index 475ea1a337..ff1e664a84 100644
> +--- a/tests/ts/findmnt/files/mountinfo
> ++++ b/tests/ts/findmnt/files/mountinfo
> +@@ -30,4 +30,3 @@
> + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse=
-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500
> + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
> + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=3D\\=
foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,no=
forcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=
=3D57344
> +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
> +diff --git a/tests/ts/findmnt/files/mountinfo-nonroot b/tests/ts/findmnt=
/files/mountinfo-nonroot
> +index e15b467016..87b421d2ef 100644
> +--- a/tests/ts/findmnt/files/mountinfo-nonroot
> ++++ b/tests/ts/findmnt/files/mountinfo-nonroot
> +@@ -29,4 +29,3 @@
> + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse=
-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500
> + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
> + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=3D\\=
foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,no=
forcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=
=3D57344
> +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
> +diff --git a/tests/ts/libmount/files/mountinfo b/tests/ts/libmount/files=
/mountinfo
> +index c063071833..2b01740481 100644
> +--- a/tests/ts/libmount/files/mountinfo
> ++++ b/tests/ts/libmount/files/mountinfo
> +@@ -30,5 +30,4 @@
> + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-fuse=
-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500
> + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc rw
> + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=3D\\=
foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,no=
forcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=
=3D57344
> +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw
> + 49 20 0:56 / /mnt/test/foo
> bar rw,relatime shared:323 - tmpfs tmpfs rw
> diff --git a/meta/recipes-core/util-linux/util-linux/include-strutils-cle=
anup-strto-functions.patch b/meta/recipes-core/util-linux/util-linux/includ=
e-strutils-cleanup-strto-functions.patch
> new file mode 100644
> index 0000000000..5d5a370821
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-st=
rto-functions.patch
> @@ -0,0 +1,270 @@
> +From 84825b161ba5d18da4142893b9789b3fc71284d9 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com<mailto:kzak@redhat.com>>
> +Date: Tue, 22 Jun 2021 14:20:42 +0200
> +Subject: [PATCH] include/strutils: cleanup strto..() functions
> +
> +* add ul_strtos64() and ul_strtou64()
> +* add simple test
> +
> +Addresses: https://github.com/karelzak/util-linux/issues/1358<https://ap=
c01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fkare=
lzak%2Futil-linux%2Fissues%2F1358&data=3D04%7C01%7Cranjitsinh.rathod%40kpit=
.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26a242ff61502855c7%=
7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DZlY4VLjjK4WKkZ6=
eU07RktzDgt%2Fwq73Oxe7bfsQf1SU%3D&reserved=3D0>
> +Signed-off-by: Karel Zak <kzak@redhat.com<mailto:kzak@redhat.com>>
> +
> +Upstream-Backport: [https://github.com/util-linux/util-linux/commit/8482=
5b161ba5d18da4142893b9789b3fc71284d9<https://apc01.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2Fcommit=
%2F84825b161ba5d18da4142893b9789b3fc71284d9&data=3D04%7C01%7Cranjitsinh.rat=
hod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DN7Vbe=
VsYMM3uisEETTym7xnltreEB1VwcTm57stM3Fg%3D&reserved=3D0>]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranj=
itsinh.rathod@kpit.com>>
> +
> +---
> + include/strutils.h |   3 +
> + lib/strutils.c     | 174 ++++++++++++++++++++++++++-------------------
> + 2 files changed, 105 insertions(+), 72 deletions(-)
> +
> +diff --git a/include/strutils.h b/include/strutils.h
> +index e75a2f0e17..389e849905 100644
> +--- a/include/strutils.h
> ++++ b/include/strutils.h
> +@@ -19,6 +19,9 @@ extern int parse_size(const char *str, uintmax_t *res,=
 int *power);
> + extern int strtosize(const char *str, uintmax_t *res);
> + extern uintmax_t strtosize_or_err(const char *str, const char *errmesg)=
;
> +
> ++extern int ul_strtos64(const char *str, int64_t *num, int base);
> ++extern int ul_strtou64(const char *str, uint64_t *num, int base);
> ++
> + extern int16_t strtos16_or_err(const char *str, const char *errmesg);
> + extern uint16_t strtou16_or_err(const char *str, const char *errmesg);
> + extern uint16_t strtox16_or_err(const char *str, const char *errmesg);
> +diff --git a/lib/strutils.c b/lib/strutils.c
> +index ee2c835495..d9976dca70 100644
> +--- a/lib/strutils.c
> ++++ b/lib/strutils.c
> +@@ -319,39 +319,80 @@ char *strndup(const char *s, size_t n)
> + }
> + #endif
> +
> +-static uint32_t _strtou32_or_err(const char *str, const char *errmesg, =
int base);
> +-static uint64_t _strtou64_or_err(const char *str, const char *errmesg, =
int base);
> ++/*
> ++ * convert strings to numbers; returns <0 on error, and 0 on success
> ++ */
> ++int ul_strtos64(const char *str, int64_t *num, int base)
> ++{
> ++      char *end =3D NULL;
> +
> +-int16_t strtos16_or_err(const char *str, const char *errmesg)
> ++      errno =3D 0;
> ++      if (str =3D=3D NULL || *str =3D=3D '\0')
> ++              return -EINVAL;
> ++      *num =3D (int64_t) strtoimax(str, &end, base);
> ++
> ++      if (errno || str =3D=3D end || (end && *end))
> ++              return -EINVAL;
> ++      return 0;
> ++}
> ++
> ++int ul_strtou64(const char *str, uint64_t *num, int base)
> + {
> +-      int32_t num =3D strtos32_or_err(str, errmesg);
> ++      char *end =3D NULL;
> +
> +-      if (num < INT16_MIN || num > INT16_MAX) {
> +-              errno =3D ERANGE;
> +-              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> +-      }
> +-      return num;
> ++      errno =3D 0;
> ++      if (str =3D=3D NULL || *str =3D=3D '\0')
> ++              return -EINVAL;
> ++      *num =3D (uint64_t) strtoumax(str, &end, base);
> ++
> ++      if (errno || str =3D=3D end || (end && *end))
> ++              return -EINVAL;
> ++      return 0;
> + }
> +
> +-static uint16_t _strtou16_or_err(const char *str, const char *errmesg, =
int base)
> ++/*
> ++ * Covert strings to numbers and print message on error.
> ++ *
> ++ * Note that hex functions (strtox..()) returns unsigned numbers, if yo=
u need
> ++ * something else then use ul_strtos64(s, &n, 16).
> ++ */
> ++int64_t strtos64_or_err(const char *str, const char *errmesg)
> + {
> +-      uint32_t num =3D _strtou32_or_err(str, errmesg, base);
> ++      int64_t num =3D 0;
> +
> +-      if (num > UINT16_MAX) {
> +-              errno =3D ERANGE;
> +-              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      if (ul_strtos64(str, &num, 10) !=3D 0) {
> ++              if (errno =3D=3D ERANGE)
> ++                      err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++
> ++              errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> +       }
> +       return num;
> + }
> +
> +-uint16_t strtou16_or_err(const char *str, const char *errmesg)
> ++uint64_t strtou64_or_err(const char *str, const char *errmesg)
> + {
> +-      return _strtou16_or_err(str, errmesg, 10);
> ++      uint64_t num =3D 0;
> ++
> ++      if (ul_strtou64(str, &num, 10)) {
> ++              if (errno =3D=3D ERANGE)
> ++                      err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++
> ++              errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      }
> ++      return num;
> + }
> +
> +-uint16_t strtox16_or_err(const char *str, const char *errmesg)
> ++uint64_t strtox64_or_err(const char *str, const char *errmesg)
> + {
> +-      return _strtou16_or_err(str, errmesg, 16);
> ++      uint64_t num =3D 0;
> ++
> ++      if (ul_strtou64(str, &num, 16)) {
> ++              if (errno =3D=3D ERANGE)
> ++                      err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++
> ++              errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      }
> ++      return num;
> + }
> +
> + int32_t strtos32_or_err(const char *str, const char *errmesg)
> +@@ -365,9 +406,9 @@ int32_t strtos32_or_err(const char *str, const char =
*errmesg)
> +       return num;
> + }
> +
> +-static uint32_t _strtou32_or_err(const char *str, const char *errmesg, =
int base)
> ++uint32_t strtou32_or_err(const char *str, const char *errmesg)
> + {
> +-      uint64_t num =3D _strtou64_or_err(str, errmesg, base);
> ++      uint64_t num =3D strtou64_or_err(str, errmesg);
> +
> +       if (num > UINT32_MAX) {
> +               errno =3D ERANGE;
> +@@ -376,66 +417,48 @@ static uint32_t _strtou32_or_err(const char *str, =
const char *errmesg, int base)
> +       return num;
> + }
> +
> +-uint32_t strtou32_or_err(const char *str, const char *errmesg)
> +-{
> +-      return _strtou32_or_err(str, errmesg, 10);
> +-}
> +-
> + uint32_t strtox32_or_err(const char *str, const char *errmesg)
> + {
> +-      return _strtou32_or_err(str, errmesg, 16);
> ++      uint64_t num =3D strtox64_or_err(str, errmesg);
> ++
> ++      if (num > UINT32_MAX) {
> ++              errno =3D ERANGE;
> ++              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      }
> ++      return num;
> + }
> +
> +-int64_t strtos64_or_err(const char *str, const char *errmesg)
> ++int16_t strtos16_or_err(const char *str, const char *errmesg)
> + {
> +-      int64_t num;
> +-      char *end =3D NULL;
> +-
> +-      errno =3D 0;
> +-      if (str =3D=3D NULL || *str =3D=3D '\0')
> +-              goto err;
> +-      num =3D strtoimax(str, &end, 10);
> +-
> +-      if (errno || str =3D=3D end || (end && *end))
> +-              goto err;
> ++      int64_t num =3D strtos64_or_err(str, errmesg);
> +
> +-      return num;
> +-err:
> +-      if (errno =3D=3D ERANGE)
> ++      if (num < INT16_MIN || num > INT16_MAX) {
> ++              errno =3D ERANGE;
> +               err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> +-
> +-      errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      }
> ++      return num;
> + }
> +
> +-static uint64_t _strtou64_or_err(const char *str, const char *errmesg, =
int base)
> ++uint16_t strtou16_or_err(const char *str, const char *errmesg)
> + {
> +-      uintmax_t num;
> +-      char *end =3D NULL;
> +-
> +-      errno =3D 0;
> +-      if (str =3D=3D NULL || *str =3D=3D '\0')
> +-              goto err;
> +-      num =3D strtoumax(str, &end, base);
> +-
> +-      if (errno || str =3D=3D end || (end && *end))
> +-              goto err;
> ++      uint64_t num =3D strtou64_or_err(str, errmesg);
> +
> +-      return num;
> +-err:
> +-      if (errno =3D=3D ERANGE)
> ++      if (num > UINT16_MAX) {
> ++              errno =3D ERANGE;
> +               err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> +-
> +-      errx(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      }
> ++      return num;
> + }
> +
> +-uint64_t strtou64_or_err(const char *str, const char *errmesg)
> ++uint16_t strtox16_or_err(const char *str, const char *errmesg)
> + {
> +-      return _strtou64_or_err(str, errmesg, 10);
> +-}
> ++      uint64_t num =3D strtox64_or_err(str, errmesg);
> +
> +-uint64_t strtox64_or_err(const char *str, const char *errmesg)
> +-{
> +-      return _strtou64_or_err(str, errmesg, 16);
> ++      if (num > UINT16_MAX) {
> ++              errno =3D ERANGE;
> ++              err(STRTOXX_EXIT_CODE, "%s: '%s'", errmesg, str);
> ++      }
> ++      return num;
> + }
> +
> + double strtod_or_err(const char *str, const char *errmesg)
> +@@ -1051,15 +1051,25 @@ static int test_strutils_cmp_paths(int a
> +
> + int main(int argc, char *argv[])
> + {
> +-      if (argc =3D=3D 3 && strcmp(argv[1], "--size") =3D=3D 0)
> ++      if (argc =3D=3D 3 && strcmp(argv[1], "--size") =3D=3D 0) {
> +               return test_strutils_sizes(argc - 1, argv + 1);
> +
> +-      else if (argc =3D=3D 4 && strcmp(argv[1], "--cmp-paths") =3D=3D 0=
)
> ++      } else if (argc =3D=3D 4 && strcmp(argv[1], "--cmp-paths") =3D=3D=
 0) {
> +               return test_strutils_cmp_paths(argc - 1, argv + 1);
> +
> ++      } else if (argc =3D=3D 3 && strcmp(argv[1], "--str2num") =3D=3D 0=
) {
> ++              uint64_t n;
> ++
> ++              if (ul_strtou64(argv[2], &n, 10) =3D=3D 0) {
> ++                      printf("'%s' --> %ju\n", argv[2], (uintmax_t) n);
> ++                      return EXIT_SUCCESS;
> ++              }
> ++      }
> ++
> +       else {
> +               fprintf(stderr, "usage: %1$s --size <number>[suffix]\n"
> +-                              "       %1$s --cmp-paths <path> <path>\n"=
,
> ++                              "       %1$s --cmp-paths <path> <path>\n"
> ++                              "       %1$s --num2num <str>\n",
> +                               argv[0]);
> +               exit(EXIT_FAILURE);
> +       }
> diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb<https://ap=
c01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.=
bb%2F&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e8238350=
8d9e27d940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811409381=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000&sdata=3DrVq25G4Vy8bhj%2B8eQ7CDtHPnBK4wIa%2FOxOOMYyR=
B8ms%3D&reserved=3D0> b/meta/recipes-core/util-linux/util-linux_2.35.1.bb<h=
ttps://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linu=
x_2.35.1.bb%2F&data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c=
4e82383508d9e27d940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852=
811409381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DrVq25G4Vy8bhj%2B8eQ7CDtHPnBK4wIa%2=
FOxOOMYyRB8ms%3D&reserved=3D0>
> index 731f0618eb..96d5eca518 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb<https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&d=
ata=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d=
940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811564924%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000&sdata=3D7heK58sipGftLbbZeiLs2FkKcL5giAoyX1FDGy%2FBIJk%3D&r=
eserved=3D0>
> +++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb<https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&d=
ata=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d=
940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811564924%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000&sdata=3D7heK58sipGftLbbZeiLs2FkKcL5giAoyX1FDGy%2FBIJk%3D&r=
eserved=3D0>
> @@ -12,6 +12,9 @@ SRC_URI +=3D "file://configure-sbindir.patch \
>              file://0001-kill-include-sys-types.h-before-checking-SYS_pid=
fd_s.patch \
>              file://0001-include-cleanup-pidfd-inckudes.patch \
>              file://CVE-2021-37600.patch \
> +            file://include-strutils-cleanup-strto-functions.patch \
> +            file://CVE-2021-3995.patch \
> +            file://CVE-2021-3996.patch \
>  "
>  SRC_URI[md5sum] =3D "7f64882f631225f0295ca05080cee1bf"
>  SRC_URI[sha256sum] =3D "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83=
e1922c3597f1d7f9"
> --
> 2.17.1
>
>
>
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can you try this attached file instead which was the output of git format-p=
atch -1 only?</div>
<div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"><br>
</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important">Thanks,</span><br>
</span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt">Best Regards,</span><br>
</p>
<p style=3D"margin:0in 0in 12pt; font-size:11pt; font-family:Calibri,sans-s=
erif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,255,2=
55)">
<span lang=3D"EN-IN" style=3D"margin:0px; font-family:&quot;Work Sans Mediu=
m&quot;; color:rgb(89,89,89)"><b>Ranjitsinh Rathod</b></span><span lang=3D"=
EN-IN" style=3D"margin:0px; font-size:14pt; font-family:&quot;Work Sans&quo=
t;; color:rgb(0,137,207)"><br>
</span><span lang=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family=
:&quot;Work Sans&quot;; color:rgb(127,127,127)">Technical Leader |&nbsp;&nb=
sp;| KPIT Technologies Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><b><sup><span lang=3D"EN-IN" style=3D"margin:0px; font-size:14pt; fo=
nt-family:&quot;Work Sans&quot;; color:rgb(176,255,69)">___________________=
_______________________<br>
</span></sup></b><span style=3D"margin:0px; color:rgb(31,73,125)"><a href=
=3D"http://www.kpit.com/" target=3D"_blank" rel=3D"noopener noreferrer" sty=
le=3D"margin:0px"><span lang=3D"EN-IN" style=3D"margin:0px; font-size:12pt;=
 font-family:&quot;Work Sans Medium&quot;; color:gray">KPIT</span></a></spa=
n><span style=3D"margin:0px; font-family:&quot;Work Sans&quot;; color:gray"=
><span>&nbsp;</span></span><span lang=3D"EN-IN" style=3D"margin:0px; font-s=
ize:12pt; font-family:&quot;Work Sans&quot;; color:gray">|</span><span lang=
=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&=
quot;; color:gray"><span>&nbsp;</span></span><span style=3D"margin:0px; col=
or:rgb(31,73,125)"><a href=3D"http://www.kpit.com/linkedin" target=3D"_blan=
k" rel=3D"noopener noreferrer" style=3D"margin:0px"><span lang=3D"EN-IN" st=
yle=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&quot;; color:=
gray">Follow
 us on LinkedIn</span></a></span><span style=3D"margin:0px; font-size:9pt; =
font-family:&quot;Work Sans&quot;; color:rgb(89,89,89)"></span><span style=
=3D"margin:0px; font-size:12pt; font-family:&quot;Times New Roman&quot;,ser=
if"></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<a href=3D"https://www.kpit.com/TheNewBrand" target=3D"_blank" rel=3D"noope=
ner noreferrer" style=3D"margin:0px"><span style=3D"margin:0px; color:rgb(3=
1,73,125)"><img class=3D"EmojiInsert" width=3D"621" height=3D"120" style=3D=
"margin:0px; width:6.4687in; height:1.25in" data-outlook-trace=3D"F:1|T:1" =
src=3D"cid:4d916ca5-48fc-4e0b-977e-d7c45aaa0102"></span></a></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Ranjitsinh Rathod via lists.openembedded.org
 &lt;ranjitsinhrathod1991=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, January 28, 2022 10:15 PM<br>
<b>To:</b> Steve Sakoman &lt;steve@sakoman.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedded=
-core@lists.openembedded.org&gt;; Akash Hadke &lt;Akash.Hadke@kpit.com&gt;;=
 Purushottam Choudhary &lt;Purushottam.Choudhary@kpit.com&gt;; Ranjitsinh R=
athod &lt;Ranjitsinh.Rathod@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta][dunfell][PATCH] util-linux: Fix for CV=
E-2021-3995 and CVE-2021-3996</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"background-color:#F7F4A9"><span style=3D"font-size:12pt; font=
-weight:bold; font-family:'Cambria','times new roman','garamond',serif; col=
or:#ff0000">Caution:
<span style=3D"font-size:8 pt; font-weight:normal; font-family:'times new r=
oman',serif; color:#ff0000">
This email originated from outside of the KPIT. Do not click links or open =
attachments unless you recognize the sender and know the content is safe.
</span></span></div>
<div>
<div dir=3D"auto">Hi Steve,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I have also faced this problem during the patch test. Act=
ually, this is due to the code itself has next line character between 'foo'=
 and 'bar'.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This is maybe because of the below change</div>
<div dir=3D"auto"><a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2Fcommit%2F5b13d=
6a1c905e1e425e6b7ca340a410c580f0f75&amp;data=3D04%7C01%7Cranjitsinh.rathod%=
40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DihTsK=
jOfUsoulkJrfsKxyTIPLvWdrhFs8eXvZZftWbo%3D&amp;reserved=3D0" originalsrc=3D"=
https://github.com/util-linux/util-linux/commit/5b13d6a1c905e1e425e6b7ca340=
a410c580f0f75" shash=3D"LxDGGsgPHmBa9yGSOEjm+zzCsToIrMKuOQ5cwVbpCFrwDeWt+b/=
+iN90dbFjn5yx8tcsjioDInA5iYzmEGXtJTT0aBxT/aV4ABYa0gIFhuz6AYPdBWr9yAG90yrouJ=
n8W/IwLeKq5HUJGB1uOe60B1OhG539IHrtG3KvmIIO3io=3D">https://github.com/util-l=
inux/util-linux/commit/5b13d6a1c905e1e425e6b7ca340a410c580f0f75</a></div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Then I have manually added '^M' character as line break b=
etween 'foo' and 'bar' and it worked.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Do you know anything else to avoid these errors?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks,</div>
<div dir=3D"auto">Ranjitsinh</div>
<div dir=3D"auto"><br>
</div>
<div class=3D"x_gmail_quote" dir=3D"auto">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Fri, 28 Jan, 2022, 8:44 pm Steve=
 Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt=
; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-left=
:1px #ccc solid; padding-left:1ex">
On Fri, Jan 28, 2022 at 3:46 AM Ranjitsinh Rathod<br>
&lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">ranjitsinhrathod1991@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.c=
om" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>&gt;=
<br>
&gt;<br>
&gt; Add patches to fix CVE-2021-3995 and CVE-2021-3996<br>
&gt; Also, add support include-strutils-cleanup-strto-functions.patch to<br=
>
&gt; solve compilation error where `ul_strtou64` function not found which i=
s<br>
&gt; used in CVE-2021-3995.patch<br>
&gt;<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rath=
od@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.co=
m</a>&gt;<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhratho=
d1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../util-linux/util-linux/CVE-2021-3995.patch | 139 +++++++++<br=
>
&gt;&nbsp; .../util-linux/util-linux/CVE-2021-3996.patch | 226 ++++++++++++=
+++<br>
&gt;&nbsp; ...ude-strutils-cleanup-strto-functions.patch | 270 ++++++++++++=
++++++<br>
&gt;&nbsp; .../util-linux/<a href=3D"https://apc01.safelinks.protection.out=
look.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&amp;data=3D04%7C01%7Cr=
anjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&=
amp;sdata=3DrVq25G4Vy8bhj%2B8eQ7CDtHPnBK4wIa%2FOxOOMYyRB8ms%3D&amp;reserved=
=3D0" originalsrc=3D"http://util-linux_2.35.1.bb/" shash=3D"f10Ff9ys4UDJ46n=
dBTtdnl2vAXHSo8rl+3nfdSI1aZJu5A6LhQMyP7p1sluBsRSmBF56DqSYnZ8+4ok52HuFifEHY4=
kRC5ozuuy263KJHKYzOVUoXunPnRgzJDxkWHiYpOb8/YfGWBS9tUlT99JrDCRA77IcHDhPtTHQr=
4h/pRc=3D" rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux_2.35.=
1.bb</a>&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;3 +<br>
&gt;&nbsp; 4 files changed, 638 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2=
021-3995.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2=
021-3996.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/util-linux/util-linux/inclu=
de-strutils-cleanup-strto-functions.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.pat=
ch b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1dcb66ad1d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch<br>
&gt; @@ -0,0 +1,139 @@<br>
&gt; +From f3db9bd609494099f0c1b95231c5dfe383346929 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 24 Nov 2021 13:53:25 +0100<br>
&gt; +Subject: [PATCH] libmount: fix UID check for FUSE umount [CVE-2021-39=
95]<br>
&gt; +<br>
&gt; +Improper UID check allows an unprivileged user to unmount FUSE<br>
&gt; +filesystems of users with similar UID.<br>
&gt; +<br>
&gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2021-3995<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2=
Fcommit%2Ff3db9bd609494099f0c1b95231c5dfe383346929&amp;data=3D04%7C01%7Cran=
jitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am=
p;sdata=3DxiT2SCJcuF%2FUEMvwyxCiFnlQRdimA0TdZnV5nJ3ovr4%3D&amp;reserved=3D0=
" originalsrc=3D"https://github.com/util-linux/util-linux/commit/f3db9bd609=
494099f0c1b95231c5dfe383346929" shash=3D"en6bRL7OHfxX7U5ruwcdLgyUEpxHiHpo/2=
wOpQoCGlcvY+IKBDA1FyNB7/TCdjsRYSWaOhSpvQLq4GSQQw1sIsalnUToJpYxvafSJvM+RMASb=
liKWpjqDcf+rVbTZSfUy9QIe5xlQ+SGH4qKHEPH41MeHlVsDGAAJAlwQSrP3Ag=3D" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://github.com/util-linux/util-=
linux/commit/f3db9bd609494099f0c1b95231c5dfe383346929</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.c=
om</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + include/strutils.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; =
2 +-<br>
&gt; + libmount/src/context_umount.c | 14 +++---------<br>
&gt; + libmount/src/mountP.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<b=
r>
&gt; + libmount/src/optstr.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 42 ++++++++=
+++++++++++++++++++++++++++<br>
&gt; + 4 files changed, 47 insertions(+), 12 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/include/strutils.h b/include/strutils.h<br>
&gt; +index 6e95707ea9..a84d29594d 100644<br>
&gt; +--- a/include/strutils.h<br>
&gt; ++++ b/include/strutils.h<br>
&gt; +@@ -91,8 +91,8 @@ static inline char *mem2strcpy(char *dest, const vo=
id *src, size_t n, size_t nma<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (n + 1 &gt; nmax)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;n =3D nmax - 1=
;<br>
&gt; +<br>
&gt; ++&nbsp; &nbsp; &nbsp; memset(dest, '\0', nmax);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;memcpy(dest, src, n);<br>
&gt; +-&nbsp; &nbsp; &nbsp; dest[nmax-1] =3D '\0';<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return dest;<br>
&gt; + }<br>
&gt; +<br>
&gt; +diff --git a/libmount/src/context_umount.c b/libmount/src/context_umo=
unt.c<br>
&gt; +index 173637a15a..8773c65ffa 100644<br>
&gt; +--- a/libmount/src/context_umount.c<br>
&gt; ++++ b/libmount/src/context_umount.c<br>
&gt; +@@ -393,10 +393,7 @@ static int is_fuse_usermount(struct libmnt_conte=
xt *cxt, int *errsv)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;struct libmnt_ns *ns_old;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;const char *type =3D mnt_fs_get_fstype(cxt=
-&gt;fs);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;const char *optstr;<br>
&gt; +-&nbsp; &nbsp; &nbsp; char *user_id =3D NULL;<br>
&gt; +-&nbsp; &nbsp; &nbsp; size_t sz;<br>
&gt; +-&nbsp; &nbsp; &nbsp; uid_t uid;<br>
&gt; +-&nbsp; &nbsp; &nbsp; char uidstr[sizeof(stringify_value(ULONG_MAX))]=
;<br>
&gt; ++&nbsp; &nbsp; &nbsp; uid_t uid, entry_uid;<br>
&gt; +<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;*errsv =3D 0;<br>
&gt; +<br>
&gt; +@@ -413,11 +410,7 @@ static int is_fuse_usermount(struct libmnt_conte=
xt *cxt, int *errsv)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;optstr =3D mnt_fs_get_fs_options(cxt-&gt;f=
s);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (!optstr)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (mnt_optstr_get_option(optstr, &quot;user_id=
&quot;, &amp;user_id, &amp;sz) !=3D 0)<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (sz =3D=3D 0 || user_id =3D=3D NULL)<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (mnt_optstr_get_uid(optstr, &quot;user_id&qu=
ot;, &amp;entry_uid) !=3D 0)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
&gt; +<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;/* get current user */<br>
&gt; +@@ -434,8 +427,7 @@ static int is_fuse_usermount(struct libmnt_contex=
t *cxt, int *errsv)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; snprintf(uidstr, sizeof(uidstr), &quot;%lu&quot=
;, (unsigned long) uid);<br>
&gt; +-&nbsp; &nbsp; &nbsp; return strncmp(user_id, uidstr, sz) =3D=3D 0;<b=
r>
&gt; ++&nbsp; &nbsp; &nbsp; return uid =3D=3D entry_uid;<br>
&gt; + }<br>
&gt; +<br>
&gt; + /*<br>
&gt; +diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h<br>
&gt; +index d43a835418..22442ec55e 100644<br>
&gt; +--- a/libmount/src/mountP.h<br>
&gt; ++++ b/libmount/src/mountP.h<br>
&gt; +@@ -400,6 +400,7 @@ extern const struct libmnt_optmap *mnt_optmap_get=
_entry(<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; const struct libmnt_optmap **mapent);<br>
&gt; +<br>
&gt; + /* optstr.c */<br>
&gt; ++extern int mnt_optstr_get_uid(const char *optstr, const char *name, =
uid_t *uid);<br>
&gt; + extern int mnt_optstr_remove_option_at(char **optstr, char *begin, c=
har *end);<br>
&gt; + extern int mnt_optstr_fix_gid(char **optstr, char *value, size_t val=
sz, char **next);<br>
&gt; + extern int mnt_optstr_fix_uid(char **optstr, char *value, size_t val=
sz, char **next);<br>
&gt; +diff --git a/libmount/src/optstr.c b/libmount/src/optstr.c<br>
&gt; +index 921b9318e7..16800f571c 100644<br>
&gt; +--- a/libmount/src/optstr.c<br>
&gt; ++++ b/libmount/src/optstr.c<br>
&gt; +@@ -1090,6 +1090,48 @@ int mnt_optstr_fix_user(char **optstr)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return rc;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/*<br>
&gt; ++ * Converts value from @optstr addressed by @name to uid.<br>
&gt; ++ *<br>
&gt; ++ * Returns: 0 on success, 1 if not found, &lt;0 on error<br>
&gt; ++ */<br>
&gt; ++int mnt_optstr_get_uid(const char *optstr, const char *name, uid_t *=
uid)<br>
&gt; ++{<br>
&gt; ++&nbsp; &nbsp; &nbsp; char *value =3D NULL;<br>
&gt; ++&nbsp; &nbsp; &nbsp; size_t valsz =3D 0;<br>
&gt; ++&nbsp; &nbsp; &nbsp; char buf[sizeof(stringify_value(UINT64_MAX))];<=
br>
&gt; ++&nbsp; &nbsp; &nbsp; int rc;<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num;<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; assert(optstr);<br>
&gt; ++&nbsp; &nbsp; &nbsp; assert(name);<br>
&gt; ++&nbsp; &nbsp; &nbsp; assert(uid);<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; rc =3D mnt_optstr_get_option(optstr, name, &amp=
;value, &amp;valsz);<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (rc !=3D 0)<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto fail;<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (valsz &gt; sizeof(buf) - 1) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -ERANGE;<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto fail;<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; mem2strcpy(buf, value, valsz, sizeof(buf));<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; rc =3D ul_strtou64(buf, &amp;num, 10);<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (rc !=3D 0)<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto fail;<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (num &gt; ULONG_MAX || (uid_t) num !=3D num)=
 {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D -ERANGE;<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto fail;<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; *uid =3D (uid_t) num;<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; return 0;<br>
&gt; ++fail:<br>
&gt; ++&nbsp; &nbsp; &nbsp; DBG(UTILS, ul_debug(&quot;failed to convert '%s=
'=3D to number [rc=3D%d]&quot;, name, rc));<br>
&gt; ++&nbsp; &nbsp; &nbsp; return rc;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +&nbsp; * mnt_match_options:<br>
&gt; +&nbsp; * @optstr: options string<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.pat=
ch b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1610b5a0fe<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch<br>
&gt; @@ -0,0 +1,226 @@<br>
&gt; +From 018a10907fa9885093f6d87401556932c2d8bd2b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +Date: Tue, 4 Jan 2022 10:54:20 +0100<br>
&gt; +Subject: [PATCH] libmount: fix (deleted) suffix issue [CVE-2021-3996]=
<br>
&gt; +<br>
&gt; +This issue is related to parsing the /proc/self/mountinfo file allows=
 an<br>
&gt; +unprivileged user to unmount other user's filesystems that are either=
<br>
&gt; +world-writable themselves or mounted in a world-writable directory.<b=
r>
&gt; +<br>
&gt; +The support for &quot;(deleted)&quot; is no more necessary as the Lin=
ux kernel does<br>
&gt; +not use it in /proc/self/mountinfo and /proc/self/mount files anymore=
.<br>
&gt; +<br>
&gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2021-3996<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2=
Fcommit%2F018a10907fa9885093f6d87401556932c2d8bd2b&amp;data=3D04%7C01%7Cran=
jitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am=
p;sdata=3DrofDL8ZaFp0Jpxd%2Buwptwox6BGpQlWuI7n6DURdBXyU%3D&amp;reserved=3D0=
" originalsrc=3D"https://github.com/util-linux/util-linux/commit/018a10907f=
a9885093f6d87401556932c2d8bd2b" shash=3D"JtkAi6yOxtSBWJp/Dfp2QjtYI03rkFKsTM=
MynlHHvuF4rJnFYWGnOQDjt3v3sYmAUBdEY9Rf5hGOjYyoQkXqrfqa9kydQlrzMilDBfYL2GVLx=
MA0b8qWmAzgeQsB/5KUDxB/ZttWXQJqYc3GwFJuknedL23g5/j7PJ4ZtVTXpVs=3D" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://github.com/util-linux/util-=
linux/commit/018a10907fa9885093f6d87401556932c2d8bd2b</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.c=
om</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + libmount/src/tab_parse.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 5 -----<br>
&gt; + tests/expected/findmnt/filter-options&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 -<br>
&gt; + tests/expected/findmnt/filter-options-nameval-neg&nbsp; &nbsp;|&nbsp=
; 3 +--<br>
&gt; + tests/expected/findmnt/filter-types-neg&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;|&nbsp; 1 -<br>
&gt; + tests/expected/findmnt/outputs-default&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; |&nbsp; 3 +--<br>
&gt; + tests/expected/findmnt/outputs-force-tree&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;|&nbsp; 3 +--<br>
&gt; + tests/expected/findmnt/outputs-kernel&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 +--<br>
&gt; + tests/expected/libmount/tabdiff-mount&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 -<br>
&gt; + tests/expected/libmount/tabdiff-move&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; |&nbsp; 1 -<br>
&gt; + tests/expected/libmount/tabdiff-remount&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;|&nbsp; 1 -<br>
&gt; + tests/expected/libmount/tabdiff-umount&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; |&nbsp; 1 -<br>
&gt; + tests/expected/libmount/tabfiles-parse-mountinfo&nbsp; &nbsp; | 11 -=
----------<br>
&gt; + tests/expected/libmount/tabfiles-py-parse-mountinfo | 11 -----------=
<br>
&gt; + tests/ts/findmnt/files/mountinfo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 -<br>
&gt; + tests/ts/findmnt/files/mountinfo-nonroot&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; |&nbsp; 1 -<br>
&gt; + tests/ts/libmount/files/mountinfo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 -<br>
&gt; + 16 files changed, 4 insertions(+), 44 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c<br>
&gt; +index 917779ab6d..4407f9c9c7 100644<br>
&gt; +--- a/libmount/src/tab_parse.c<br>
&gt; ++++ b/libmount/src/tab_parse.c<br>
&gt; +@@ -225,11 +225,6 @@ static int mnt_parse_mountinfo_line(struct libmn=
t_fs *fs, const char *s)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto fail;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; /* remove &quot;\040(deleted)&quot; suffix */<b=
r>
&gt; +-&nbsp; &nbsp; &nbsp; p =3D (char *) endswith(fs-&gt;target, PATH_DEL=
ETED_SUFFIX);<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (p &amp;&amp; *p)<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *p =3D '\0';<br>
&gt; +-<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;s =3D skip_separator(s);<br>
&gt; +<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;/* (6) vfs options (fs-independent) */<br>
&gt; +diff --git a/tests/expected/findmnt/filter-options b/tests/expected/f=
indmnt/filter-options<br>
&gt; +index 2606bce76b..97b0ead0ad 100644<br>
&gt; +--- a/tests/expected/findmnt/filter-options<br>
&gt; ++++ b/tests/expected/findmnt/filter-options<br>
&gt; +@@ -28,5 +28,4 @@ TARGET&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOURCE&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;FSTYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OPT=
IONS<br>
&gt; + /home/kzak/.gvfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gvfs=
-fuse-daemon fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=3D500,g=
roup_id=3D500<br>
&gt; + /var/lib/nfs/rpc_pipefs&nbsp; &nbsp; &nbsp; sunrpc&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;rpc_pipefs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
rw,relatime<br>
&gt; + /mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; //foo.home/bar/&nbsp; cifs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=
=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posix=
paths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-/mnt/foo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;/fooooo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bar&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rw,relatime<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/filter-options-nameval-neg b/test=
s/expected/findmnt/filter-options-nameval-neg<br>
&gt; +index 5471d65af1..f0467ef755 100644<br>
&gt; +--- a/tests/expected/findmnt/filter-options-nameval-neg<br>
&gt; ++++ b/tests/expected/findmnt/filter-options-nameval-neg<br>
&gt; +@@ -29,6 +29,5 @@ TARGET&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOURCE&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; FSTYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; OPTIO<br>
&gt; + |-/home/kzak&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;/dev/mapper/kzak-home ext4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gvfs-fu=
se-daemon&nbsp; &nbsp; &nbsp; fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs&nbsp; &nbsp; &nbsp; sunrpc&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc_pipefs&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; rw,relatime<br>
&gt; +-|-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;/fooooo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;bar&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;rw,relatime<br>
&gt; ++`-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/filter-types-neg b/tests/expected=
/findmnt/filter-types-neg<br>
&gt; +index 2606bce76b..97b0ead0ad 100644<br>
&gt; +--- a/tests/expected/findmnt/filter-types-neg<br>
&gt; ++++ b/tests/expected/findmnt/filter-types-neg<br>
&gt; +@@ -28,5 +28,4 @@ TARGET&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOURCE&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;FSTYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OPT=
IONS<br>
&gt; + /home/kzak/.gvfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gvfs=
-fuse-daemon fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=3D500,g=
roup_id=3D500<br>
&gt; + /var/lib/nfs/rpc_pipefs&nbsp; &nbsp; &nbsp; sunrpc&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;rpc_pipefs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
rw,relatime<br>
&gt; + /mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; //foo.home/bar/&nbsp; cifs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=
=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posix=
paths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-/mnt/foo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;/fooooo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bar&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rw,relatime<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/outputs-default b/tests/expected/=
findmnt/outputs-default<br>
&gt; +index 59495797bd..01599355ec 100644<br>
&gt; +--- a/tests/expected/findmnt/outputs-default<br>
&gt; ++++ b/tests/expected/findmnt/outputs-default<br>
&gt; +@@ -30,6 +30,5 @@ TARGET&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOURCE&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; FSTYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; OPTIO<br>
&gt; + |-/home/kzak&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;/dev/mapper/kzak-home ext4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gvfs-fu=
se-daemon&nbsp; &nbsp; &nbsp; fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs&nbsp; &nbsp; &nbsp; sunrpc&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc_pipefs&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; rw,relatime<br>
&gt; +-|-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;/fooooo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;bar&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;rw,relatime<br>
&gt; ++`-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/outputs-force-tree b/tests/expect=
ed/findmnt/outputs-force-tree<br>
&gt; +index 59495797bd..01599355ec 100644<br>
&gt; +--- a/tests/expected/findmnt/outputs-force-tree<br>
&gt; ++++ b/tests/expected/findmnt/outputs-force-tree<br>
&gt; +@@ -30,6 +30,5 @@ TARGET&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOURCE&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; FSTYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; OPTIO<br>
&gt; + |-/home/kzak&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;/dev/mapper/kzak-home ext4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gvfs-fu=
se-daemon&nbsp; &nbsp; &nbsp; fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs&nbsp; &nbsp; &nbsp; sunrpc&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc_pipefs&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; rw,relatime<br>
&gt; +-|-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;/fooooo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;bar&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;rw,relatime<br>
&gt; ++`-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/findmnt/outputs-kernel b/tests/expected/f=
indmnt/outputs-kernel<br>
&gt; +index 59495797bd..01599355ec 100644<br>
&gt; +--- a/tests/expected/findmnt/outputs-kernel<br>
&gt; ++++ b/tests/expected/findmnt/outputs-kernel<br>
&gt; +@@ -30,6 +30,5 @@ TARGET&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOURCE&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; FSTYPE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; OPTIO<br>
&gt; + |-/home/kzak&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;/dev/mapper/kzak-home ext4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; rw,noatime,barrier=3D1,data=3Dordered<br>
&gt; + | `-/home/kzak/.gvfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gvfs-fu=
se-daemon&nbsp; &nbsp; &nbsp; fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatim=
e,user_id=3D500,group_id=3D500<br>
&gt; + |-/var/lib/nfs/rpc_pipefs&nbsp; &nbsp; &nbsp; sunrpc&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc_pipefs&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; rw,relatime<br>
&gt; +-|-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; +-`-/mnt/foo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;/fooooo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;bar&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;rw,relatime<br>
&gt; ++`-/mnt/sounds&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; //foo.home/bar/&nbsp; &nbsp; &nbsp; &nbsp;cifs&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rw,relatime,unc=3D\\foo.home\bar,=
username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=
=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=3D57344<br>
&gt; + rc=3D0<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-mount b/tests/expected/l=
ibmount/tabdiff-mount<br>
&gt; +index 420aeacd5e..3c18f8dc4f 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-mount<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-mount<br>
&gt; +@@ -1,3 +1,2 @@<br>
&gt; + /dev/mapper/kzak-home on /home/kzak: MOUNTED<br>
&gt; +-/fooooo on /mnt/foo: MOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: MOUNTED<br>
<br>
This patch fails to apply due to the above line wrap error (and<br>
several more like it below)<br>
<br>
Perhaps your mailer?<br>
<br>
Steve<br>
<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-move b/tests/expected/li=
bmount/tabdiff-move<br>
&gt; +index 24f9bc791b..95820d93ef 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-move<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-move<br>
&gt; +@@ -1,3 +1,2 @@<br>
&gt; + //foo.home/bar/ on /mnt/music: MOVED to /mnt/music<br>
&gt; +-/fooooo on /mnt/foo: UMOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: UMOUNTED<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-remount b/tests/expected=
/libmount/tabdiff-remount<br>
&gt; +index 82ebeab390..876bfd9539 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-remount<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-remount<br>
&gt; +@@ -1,4 +1,3 @@<br>
&gt; + /dev/mapper/kzak-home on /home/kzak: REMOUNTED from 'rw,noatime,barr=
ier=3D1,data=3Dordered' to 'ro,noatime,barrier=3D1,data=3Dordered'<br>
&gt; + //foo.home/bar/ on /mnt/sounds: REMOUNTED from 'rw,relatime,unc=3D\\=
foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=3D0,no=
forcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384,wsize=
=3D57344' to 'ro,relatime,unc=3D\\foo.home\bar,username=3Dkzak,domain=3DSRG=
ROUP,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,=
serverino,acl,rsize=3D16384,wsize=3D57344'<br>
&gt; +-/fooooo on /mnt/foo: UMOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: UMOUNTED<br>
&gt; +diff --git a/tests/expected/libmount/tabdiff-umount b/tests/expected/=
libmount/tabdiff-umount<br>
&gt; +index a3e0fe48a1..c7be725b92 100644<br>
&gt; +--- a/tests/expected/libmount/tabdiff-umount<br>
&gt; ++++ b/tests/expected/libmount/tabdiff-umount<br>
&gt; +@@ -1,3 +1,2 @@<br>
&gt; + /dev/mapper/kzak-home on /home/kzak: UMOUNTED<br>
&gt; +-/fooooo on /mnt/foo: UMOUNTED<br>
&gt; + tmpfs on /mnt/test/foo<br>
&gt; bar: UMOUNTED<br>
&gt; +diff --git a/tests/expected/libmount/tabfiles-parse-mountinfo b/tests=
/expected/libmount/tabfiles-parse-mountinfo<br>
&gt; +index 47eb770061..d5ba5248e4 100644<br>
&gt; +--- a/tests/expected/libmount/tabfiles-parse-mountinfo<br>
&gt; ++++ b/tests/expected/libmount/tabfiles-parse-mountinfo<br>
&gt; +@@ -351,17 +351,6 @@ id:&nbsp; &nbsp; &nbsp;47<br>
&gt; + parent: 20<br>
&gt; + devno:&nbsp; 0:38<br>
&gt; + ------ fs:<br>
&gt; +-source: /fooooo<br>
&gt; +-target: /mnt/foo<br>
&gt; +-fstype: bar<br>
&gt; +-optstr: rw,relatime<br>
&gt; +-VFS-optstr: rw,relatime<br>
&gt; +-FS-opstr: rw<br>
&gt; +-root:&nbsp; &nbsp;/<br>
&gt; +-id:&nbsp; &nbsp; &nbsp;48<br>
&gt; +-parent: 20<br>
&gt; +-devno:&nbsp; 0:39<br>
&gt; +------- fs:<br>
&gt; + source: tmpfs<br>
&gt; + target: /mnt/test/foo<br>
&gt; bar<br>
&gt; + fstype: tmpfs<br>
&gt; +diff --git a/tests/expected/libmount/tabfiles-py-parse-mountinfo b/te=
sts/expected/libmount/tabfiles-py-parse-mountinfo<br>
&gt; +index 47eb770061..d5ba5248e4 100644<br>
&gt; +--- a/tests/expected/libmount/tabfiles-py-parse-mountinfo<br>
&gt; ++++ b/tests/expected/libmount/tabfiles-py-parse-mountinfo<br>
&gt; +@@ -351,17 +351,6 @@ id:&nbsp; &nbsp; &nbsp;47<br>
&gt; + parent: 20<br>
&gt; + devno:&nbsp; 0:38<br>
&gt; + ------ fs:<br>
&gt; +-source: /fooooo<br>
&gt; +-target: /mnt/foo<br>
&gt; +-fstype: bar<br>
&gt; +-optstr: rw,relatime<br>
&gt; +-VFS-optstr: rw,relatime<br>
&gt; +-FS-opstr: rw<br>
&gt; +-root:&nbsp; &nbsp;/<br>
&gt; +-id:&nbsp; &nbsp; &nbsp;48<br>
&gt; +-parent: 20<br>
&gt; +-devno:&nbsp; 0:39<br>
&gt; +------- fs:<br>
&gt; + source: tmpfs<br>
&gt; + target: /mnt/test/foo<br>
&gt; bar<br>
&gt; + fstype: tmpfs<br>
&gt; +diff --git a/tests/ts/findmnt/files/mountinfo b/tests/ts/findmnt/file=
s/mountinfo<br>
&gt; +index 475ea1a337..ff1e664a84 100644<br>
&gt; +--- a/tests/ts/findmnt/files/mountinfo<br>
&gt; ++++ b/tests/ts/findmnt/files/mountinfo<br>
&gt; +@@ -30,4 +30,3 @@<br>
&gt; + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-f=
use-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500<br>
&gt; + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc=
 rw<br>
&gt; + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344<br>
&gt; +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw<br>
&gt; +diff --git a/tests/ts/findmnt/files/mountinfo-nonroot b/tests/ts/find=
mnt/files/mountinfo-nonroot<br>
&gt; +index e15b467016..87b421d2ef 100644<br>
&gt; +--- a/tests/ts/findmnt/files/mountinfo-nonroot<br>
&gt; ++++ b/tests/ts/findmnt/files/mountinfo-nonroot<br>
&gt; +@@ -29,4 +29,3 @@<br>
&gt; + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-f=
use-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500<br>
&gt; + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc=
 rw<br>
&gt; + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344<br>
&gt; +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw<br>
&gt; +diff --git a/tests/ts/libmount/files/mountinfo b/tests/ts/libmount/fi=
les/mountinfo<br>
&gt; +index c063071833..2b01740481 100644<br>
&gt; +--- a/tests/ts/libmount/files/mountinfo<br>
&gt; ++++ b/tests/ts/libmount/files/mountinfo<br>
&gt; +@@ -30,5 +30,4 @@<br>
&gt; + 44 41 0:36 / /home/kzak/.gvfs rw,nosuid,nodev,relatime - fuse.gvfs-f=
use-daemon gvfs-fuse-daemon rw,user_id=3D500,group_id=3D500<br>
&gt; + 45 20 0:37 / /var/lib/nfs/rpc_pipefs rw,relatime - rpc_pipefs sunrpc=
 rw<br>
&gt; + 47 20 0:38 / /mnt/sounds rw,relatime - cifs //foo.home/bar/ rw,unc=
=3D\\foo.home\bar,username=3Dkzak,domain=3DSRGROUP,uid=3D0,noforceuid,gid=
=3D0,noforcegid,addr=3D192.168.111.1,posixpaths,serverino,acl,rsize=3D16384=
,wsize=3D57344<br>
&gt; +-48 20 0:39 / /mnt/foo\040(deleted) rw,relatime - bar /fooooo rw<br>
&gt; + 49 20 0:56 / /mnt/test/foo<br>
&gt; bar rw,relatime shared:323 - tmpfs tmpfs rw<br>
&gt; diff --git a/meta/recipes-core/util-linux/util-linux/include-strutils-=
cleanup-strto-functions.patch b/meta/recipes-core/util-linux/util-linux/inc=
lude-strutils-cleanup-strto-functions.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5d5a370821<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/util-linux/util-linux/include-strutils-cleanup=
-strto-functions.patch<br>
&gt; @@ -0,0 +1,270 @@<br>
&gt; +From 84825b161ba5d18da4142893b9789b3fc71284d9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +Date: Tue, 22 Jun 2021 14:20:42 +0200<br>
&gt; +Subject: [PATCH] include/strutils: cleanup strto..() functions<br>
&gt; +<br>
&gt; +* add ul_strtos64() and ul_strtou64()<br>
&gt; +* add simple test<br>
&gt; +<br>
&gt; +Addresses: <a href=3D"https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Fkarelzak%2Futil-linux%2Fissues%2F1358&amp=
;data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e2=
7d940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000&amp;sdata=3DZlY4VLjjK4WKkZ6eU07RktzDgt%2Fwq73Oxe7bfsQf1S=
U%3D&amp;reserved=3D0" originalsrc=3D"https://github.com/karelzak/util-linu=
x/issues/1358" shash=3D"MYQcucKuMZ53CxATlxlKvYd7xNCLZDjTSk04QZY/9UDeXTgctS0=
a3TtFof8JDnAprdnpUr++w2freHWL88iF9pVOf++N8IlUeRXggerwO5sZq5GifA5d+FliCaR36t=
ogIskBZM2h0Xt52FkgU0zIcnOdz61SupLIo5Z1d0V+aNA=3D" rel=3D"noreferrer norefer=
rer" target=3D"_blank">
https://github.com/karelzak/util-linux/issues/1358</a><br>
&gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Backport: [<a href=3D"https://apc01.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Futil-linux%2Futil-linux%2Fcommit=
%2F84825b161ba5d18da4142893b9789b3fc71284d9&amp;data=3D04%7C01%7Cranjitsinh=
.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DN7VbeVsYMM3uisEETTym7xnltreEB1VwcTm57stM3Fg%3D&amp;reserved=3D0" origina=
lsrc=3D"https://github.com/util-linux/util-linux/commit/84825b161ba5d18da41=
42893b9789b3fc71284d9" shash=3D"B38ixftcZ/YWkIbx9wlodhT0Zo6Uycf4gwqHjbECMRI=
8BsMooBHv5W4kgRC5nVPAHMpsBE0t6S093xFnEC3OyzymD0NbYifFZnQUMG/vSxh56tG4UOAHFM=
GkDvXa2Z+WxJVpk+Sl5FEGzQh9AHXJ+FPMjLj52li6ukzzUuoDH7w=3D" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/util-linux/util-linux/com=
mit/84825b161ba5d18da4142893b9789b3fc71284d9</a>]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.c=
om</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + include/strutils.h |&nbsp; &nbsp;3 +<br>
&gt; + lib/strutils.c&nbsp; &nbsp; &nbsp;| 174 ++++++++++++++++++++++++++--=
-----------------<br>
&gt; + 2 files changed, 105 insertions(+), 72 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/include/strutils.h b/include/strutils.h<br>
&gt; +index e75a2f0e17..389e849905 100644<br>
&gt; +--- a/include/strutils.h<br>
&gt; ++++ b/include/strutils.h<br>
&gt; +@@ -19,6 +19,9 @@ extern int parse_size(const char *str, uintmax_t *r=
es, int *power);<br>
&gt; + extern int strtosize(const char *str, uintmax_t *res);<br>
&gt; + extern uintmax_t strtosize_or_err(const char *str, const char *errme=
sg);<br>
&gt; +<br>
&gt; ++extern int ul_strtos64(const char *str, int64_t *num, int base);<br>
&gt; ++extern int ul_strtou64(const char *str, uint64_t *num, int base);<br=
>
&gt; ++<br>
&gt; + extern int16_t strtos16_or_err(const char *str, const char *errmesg)=
;<br>
&gt; + extern uint16_t strtou16_or_err(const char *str, const char *errmesg=
);<br>
&gt; + extern uint16_t strtox16_or_err(const char *str, const char *errmesg=
);<br>
&gt; +diff --git a/lib/strutils.c b/lib/strutils.c<br>
&gt; +index ee2c835495..d9976dca70 100644<br>
&gt; +--- a/lib/strutils.c<br>
&gt; ++++ b/lib/strutils.c<br>
&gt; +@@ -319,39 +319,80 @@ char *strndup(const char *s, size_t n)<br>
&gt; + }<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +-static uint32_t _strtou32_or_err(const char *str, const char *errmes=
g, int base);<br>
&gt; +-static uint64_t _strtou64_or_err(const char *str, const char *errmes=
g, int base);<br>
&gt; ++/*<br>
&gt; ++ * convert strings to numbers; returns &lt;0 on error, and 0 on succ=
ess<br>
&gt; ++ */<br>
&gt; ++int ul_strtos64(const char *str, int64_t *num, int base)<br>
&gt; ++{<br>
&gt; ++&nbsp; &nbsp; &nbsp; char *end =3D NULL;<br>
&gt; +<br>
&gt; +-int16_t strtos16_or_err(const char *str, const char *errmesg)<br>
&gt; ++&nbsp; &nbsp; &nbsp; errno =3D 0;<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (str =3D=3D NULL || *str =3D=3D '\0')<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;<br>
&gt; ++&nbsp; &nbsp; &nbsp; *num =3D (int64_t) strtoimax(str, &amp;end, bas=
e);<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;<br>
&gt; ++&nbsp; &nbsp; &nbsp; return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int ul_strtou64(const char *str, uint64_t *num, int base)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; int32_t num =3D strtos32_or_err(str, errmesg);<=
br>
&gt; ++&nbsp; &nbsp; &nbsp; char *end =3D NULL;<br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (num &lt; INT16_MIN || num &gt; INT16_MAX) {=
<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errno =3D ERANGE;<b=
r>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err(STRTOXX_EXIT_CO=
DE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; +-&nbsp; &nbsp; &nbsp; }<br>
&gt; +-&nbsp; &nbsp; &nbsp; return num;<br>
&gt; ++&nbsp; &nbsp; &nbsp; errno =3D 0;<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (str =3D=3D NULL || *str =3D=3D '\0')<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;<br>
&gt; ++&nbsp; &nbsp; &nbsp; *num =3D (uint64_t) strtoumax(str, &amp;end, ba=
se);<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;<br>
&gt; ++&nbsp; &nbsp; &nbsp; return 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static uint16_t _strtou16_or_err(const char *str, const char *errmes=
g, int base)<br>
&gt; ++/*<br>
&gt; ++ * Covert strings to numbers and print message on error.<br>
&gt; ++ *<br>
&gt; ++ * Note that hex functions (strtox..()) returns unsigned numbers, if=
 you need<br>
&gt; ++ * something else then use ul_strtos64(s, &amp;n, 16).<br>
&gt; ++ */<br>
&gt; ++int64_t strtos64_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; uint32_t num =3D _strtou32_or_err(str, errmesg,=
 base);<br>
&gt; ++&nbsp; &nbsp; &nbsp; int64_t num =3D 0;<br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (num &gt; UINT16_MAX) {<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errno =3D ERANGE;<b=
r>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err(STRTOXX_EXIT_CO=
DE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (ul_strtos64(str, &amp;num, 10) !=3D 0) {<br=
>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (errno =3D=3D ER=
ANGE)<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; err(STRTOXX_EXIT_CODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errx(STRTOXX_EXIT_C=
ODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint16_t strtou16_or_err(const char *str, const char *errmesg)<br>
&gt; ++uint64_t strtou64_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; return _strtou16_or_err(str, errmesg, 10);<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num =3D 0;<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (ul_strtou64(str, &amp;num, 10)) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (errno =3D=3D ER=
ANGE)<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; err(STRTOXX_EXIT_CODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errx(STRTOXX_EXIT_C=
ODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint16_t strtox16_or_err(const char *str, const char *errmesg)<br>
&gt; ++uint64_t strtox64_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; return _strtou16_or_err(str, errmesg, 16);<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num =3D 0;<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (ul_strtou64(str, &amp;num, 16)) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (errno =3D=3D ER=
ANGE)<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; err(STRTOXX_EXIT_CODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errx(STRTOXX_EXIT_C=
ODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; + int32_t strtos32_or_err(const char *str, const char *errmesg)<br>
&gt; +@@ -365,9 +406,9 @@ int32_t strtos32_or_err(const char *str, const ch=
ar *errmesg)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static uint32_t _strtou32_or_err(const char *str, const char *errmes=
g, int base)<br>
&gt; ++uint32_t strtou32_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; uint64_t num =3D _strtou64_or_err(str, errmesg,=
 base);<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num =3D strtou64_or_err(str, errmesg);=
<br>
&gt; +<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (num &gt; UINT32_MAX) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errno =3D ERAN=
GE;<br>
&gt; +@@ -376,66 +417,48 @@ static uint32_t _strtou32_or_err(const char *st=
r, const char *errmesg, int base)<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint32_t strtou32_or_err(const char *str, const char *errmesg)<br>
&gt; +-{<br>
&gt; +-&nbsp; &nbsp; &nbsp; return _strtou32_or_err(str, errmesg, 10);<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + uint32_t strtox32_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; return _strtou32_or_err(str, errmesg, 16);<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num =3D strtox64_or_err(str, errmesg);=
<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (num &gt; UINT32_MAX) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errno =3D ERANGE;<b=
r>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err(STRTOXX_EXIT_CO=
DE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-int64_t strtos64_or_err(const char *str, const char *errmesg)<br>
&gt; ++int16_t strtos16_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; int64_t num;<br>
&gt; +-&nbsp; &nbsp; &nbsp; char *end =3D NULL;<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; errno =3D 0;<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (str =3D=3D NULL || *str =3D=3D '\0')<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>
&gt; +-&nbsp; &nbsp; &nbsp; num =3D strtoimax(str, &amp;end, 10);<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>
&gt; ++&nbsp; &nbsp; &nbsp; int64_t num =3D strtos64_or_err(str, errmesg);<=
br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; return num;<br>
&gt; +-err:<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (errno =3D=3D ERANGE)<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (num &lt; INT16_MIN || num &gt; INT16_MAX) {=
<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errno =3D ERANGE;<b=
r>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err(STRTOXX_EX=
IT_CODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; errx(STRTOXX_EXIT_CODE, &quot;%s: '%s'&quot;, e=
rrmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static uint64_t _strtou64_or_err(const char *str, const char *errmes=
g, int base)<br>
&gt; ++uint16_t strtou16_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; uintmax_t num;<br>
&gt; +-&nbsp; &nbsp; &nbsp; char *end =3D NULL;<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; errno =3D 0;<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (str =3D=3D NULL || *str =3D=3D '\0')<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>
&gt; +-&nbsp; &nbsp; &nbsp; num =3D strtoumax(str, &amp;end, base);<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (errno || str =3D=3D end || (end &amp;&amp; =
*end))<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err;<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num =3D strtou64_or_err(str, errmesg);=
<br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; return num;<br>
&gt; +-err:<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (errno =3D=3D ERANGE)<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (num &gt; UINT16_MAX) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errno =3D ERANGE;<b=
r>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err(STRTOXX_EX=
IT_CODE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; +-<br>
&gt; +-&nbsp; &nbsp; &nbsp; errx(STRTOXX_EXIT_CODE, &quot;%s: '%s'&quot;, e=
rrmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-uint64_t strtou64_or_err(const char *str, const char *errmesg)<br>
&gt; ++uint16_t strtox16_or_err(const char *str, const char *errmesg)<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; return _strtou64_or_err(str, errmesg, 10);<br>
&gt; +-}<br>
&gt; ++&nbsp; &nbsp; &nbsp; uint64_t num =3D strtox64_or_err(str, errmesg);=
<br>
&gt; +<br>
&gt; +-uint64_t strtox64_or_err(const char *str, const char *errmesg)<br>
&gt; +-{<br>
&gt; +-&nbsp; &nbsp; &nbsp; return _strtou64_or_err(str, errmesg, 16);<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (num &gt; UINT16_MAX) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; errno =3D ERANGE;<b=
r>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err(STRTOXX_EXIT_CO=
DE, &quot;%s: '%s'&quot;, errmesg, str);<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; return num;<br>
&gt; + }<br>
&gt; +<br>
&gt; + double strtod_or_err(const char *str, const char *errmesg)<br>
&gt; +@@ -1051,15 +1051,25 @@ static int test_strutils_cmp_paths(int a<br>
&gt; +<br>
&gt; + int main(int argc, char *argv[])<br>
&gt; + {<br>
&gt; +-&nbsp; &nbsp; &nbsp; if (argc =3D=3D 3 &amp;&amp; strcmp(argv[1], &q=
uot;--size&quot;) =3D=3D 0)<br>
&gt; ++&nbsp; &nbsp; &nbsp; if (argc =3D=3D 3 &amp;&amp; strcmp(argv[1], &q=
uot;--size&quot;) =3D=3D 0) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return test_st=
rutils_sizes(argc - 1, argv + 1);<br>
&gt; +<br>
&gt; +-&nbsp; &nbsp; &nbsp; else if (argc =3D=3D 4 &amp;&amp; strcmp(argv[1=
], &quot;--cmp-paths&quot;) =3D=3D 0)<br>
&gt; ++&nbsp; &nbsp; &nbsp; } else if (argc =3D=3D 4 &amp;&amp; strcmp(argv=
[1], &quot;--cmp-paths&quot;) =3D=3D 0) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return test_st=
rutils_cmp_paths(argc - 1, argv + 1);<br>
&gt; +<br>
&gt; ++&nbsp; &nbsp; &nbsp; } else if (argc =3D=3D 3 &amp;&amp; strcmp(argv=
[1], &quot;--str2num&quot;) =3D=3D 0) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uint64_t n;<br>
&gt; ++<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ul_strtou64(arg=
v[2], &amp;n, 10) =3D=3D 0) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; printf(&quot;'%s' --&gt; %ju\n&quot;, argv[2], (uintmax_t) n);<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; return EXIT_SUCCESS;<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&gt; ++&nbsp; &nbsp; &nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;else {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr=
, &quot;usage: %1$s --size &lt;number&gt;[suffix]\n&quot;<br>
&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;&nbsp; &nbsp; &nbsp; &nbsp;%1$s =
--cmp-paths &lt;path&gt; &lt;path&gt;\n&quot;,<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;&nbsp; &nbsp; &nbsp; &nbsp;%1$s =
--cmp-paths &lt;path&gt; &lt;path&gt;\n&quot;<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;&nbsp; &nbsp; &nbsp; &nbsp;%1$s =
--num2num &lt;str&gt;\n&quot;,<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argv[0]);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;exit(EXIT_FAIL=
URE);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; diff --git a/meta/recipes-core/util-linux/<a href=3D"https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&a=
mp;data=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9=
e27d940d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C3000&amp;sdata=3DrVq25G4Vy8bhj%2B8eQ7CDtHPnBK4wIa%2FOxOOMYy=
RB8ms%3D&amp;reserved=3D0" originalsrc=3D"http://util-linux_2.35.1.bb/" sha=
sh=3D"f10Ff9ys4UDJ46ndBTtdnl2vAXHSo8rl+3nfdSI1aZJu5A6LhQMyP7p1sluBsRSmBF56D=
qSYnZ8+4ok52HuFifEHY4kRC5ozuuy263KJHKYzOVUoXunPnRgzJDxkWHiYpOb8/YfGWBS9tUlT=
99JrDCRA77IcHDhPtTHQr4h/pRc=3D" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">util-linux_2.35.1.bb</a>
 b/meta/recipes-core/util-linux/<a href=3D"https://apc01.safelinks.protecti=
on.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&amp;data=3D04%7C=
01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940d%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811409381%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000&amp;sdata=3DrVq25G4Vy8bhj%2B8eQ7CDtHPnBK4wIa%2FOxOOMYyRB8ms%3D&amp;re=
served=3D0" originalsrc=3D"http://util-linux_2.35.1.bb/" shash=3D"f10Ff9ys4=
UDJ46ndBTtdnl2vAXHSo8rl+3nfdSI1aZJu5A6LhQMyP7p1sluBsRSmBF56DqSYnZ8+4ok52HuF=
ifEHY4kRC5ozuuy263KJHKYzOVUoXunPnRgzJDxkWHiYpOb8/YfGWBS9tUlT99JrDCRA77IcHDh=
PtTHQr4h/pRc=3D" rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux=
_2.35.1.bb</a><br>
&gt; index 731f0618eb..96d5eca518 100644<br>
&gt; --- a/meta/recipes-core/util-linux/<a href=3D"https://apc01.safelinks.=
protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&amp;data=
=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940=
d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811564924%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000&amp;sdata=3D7heK58sipGftLbbZeiLs2FkKcL5giAoyX1FDGy%2FBIJk%3D&=
amp;reserved=3D0" originalsrc=3D"http://util-linux_2.35.1.bb/" shash=3D"VUS=
m2A3m5A2pLDS5VQ2XJFzu8FCBeYJgcO3KN7bJQ9RtjLz8yR4nGG6cknP5PXPp+KhGJqz5NzS3/1=
Jk/4VogzLINDmADLuDrwJMo/E0APkVHr0BKsbL49IOM+m/0zYj2Q3ABHszZ7rw11Bnef4DVOOB8=
netW3eASBwuXOIi+bA=3D" rel=3D"noreferrer noreferrer" target=3D"_blank">util=
-linux_2.35.1.bb</a><br>
&gt; +++ b/meta/recipes-core/util-linux/<a href=3D"https://apc01.safelinks.=
protection.outlook.com/?url=3Dhttp%3A%2F%2Futil-linux_2.35.1.bb%2F&amp;data=
=3D04%7C01%7Cranjitsinh.rathod%40kpit.com%7C2e73f8aa2c9c4e82383508d9e27d940=
d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637789852811564924%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000&amp;sdata=3D7heK58sipGftLbbZeiLs2FkKcL5giAoyX1FDGy%2FBIJk%3D&=
amp;reserved=3D0" originalsrc=3D"http://util-linux_2.35.1.bb/" shash=3D"VUS=
m2A3m5A2pLDS5VQ2XJFzu8FCBeYJgcO3KN7bJQ9RtjLz8yR4nGG6cknP5PXPp+KhGJqz5NzS3/1=
Jk/4VogzLINDmADLuDrwJMo/E0APkVHr0BKsbL49IOM+m/0zYj2Q3ABHszZ7rw11Bnef4DVOOB8=
netW3eASBwuXOIi+bA=3D" rel=3D"noreferrer noreferrer" target=3D"_blank">util=
-linux_2.35.1.bb</a><br>
&gt; @@ -12,6 +12,9 @@ SRC_URI +=3D &quot;file://configure-sbindir.patch \<=
br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-kill-inclu=
de-sys-types.h-before-checking-SYS_pidfd_s.patch \<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-include-cl=
eanup-pidfd-inckudes.patch \<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2021-37600.=
patch \<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://include-strutils-cle=
anup-strto-functions.patch \<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2021-3995.patch =
\<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2021-3996.patch =
\<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;7f64882f631225f0295ca05080cee1bf&quot;=
<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;d9de3edd287366cd908e77677514b9387b2=
2bc7b88f45b83e1922c3597f1d7f9&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote>
</div>
</div>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_--

--_005_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_
Content-Type: image/png; name="Outlook-ltsymegg.png"
Content-Description: Outlook-ltsymegg.png
Content-Disposition: inline; filename="Outlook-ltsymegg.png"; size=22485;
	creation-date="Fri, 28 Jan 2022 16:53:39 GMT";
	modification-date="Fri, 28 Jan 2022 16:53:39 GMT"
Content-ID: <4d916ca5-48fc-4e0b-977e-d7c45aaa0102>
Content-Transfer-Encoding: base64

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC

--_005_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_--

--_006_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_
Content-Type: text/x-patch;
	name="0001-util-linux-Fix-for-CVE-2021-3995-and-CVE-2021-3996.patch"
Content-Description: 
 0001-util-linux-Fix-for-CVE-2021-3995-and-CVE-2021-3996.patch
Content-Disposition: attachment;
	filename="0001-util-linux-Fix-for-CVE-2021-3995-and-CVE-2021-3996.patch";
	size=29553; creation-date="Fri, 28 Jan 2022 16:53:27 GMT";
	modification-date="Fri, 28 Jan 2022 16:53:39 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMGNlZTIyMzMyMWFmZDY3NGFjN2IzOTBhODgzMWUwNGU5YjUzYTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RA
a3BpdC5jb20+CkRhdGU6IFRodSwgMjcgSmFuIDIwMjIgMTQ6NTY6NTYgKzA1MzAKU3ViamVjdDog
W1BBVENIXSB1dGlsLWxpbnV4OiBGaXggZm9yIENWRS0yMDIxLTM5OTUgYW5kIENWRS0yMDIxLTM5
OTYKCkFkZCBwYXRjaGVzIHRvIGZpeCBDVkUtMjAyMS0zOTk1IGFuZCBDVkUtMjAyMS0zOTk2CkFs
c28sIGFkZCBzdXBwb3J0IGluY2x1ZGUtc3RydXRpbHMtY2xlYW51cC1zdHJ0by1mdW5jdGlvbnMu
cGF0Y2ggdG8Kc29sdmUgY29tcGlsYXRpb24gZXJyb3Igd2hlcmUgYHVsX3N0cnRvdTY0YCBmdW5j
dGlvbiBub3QgZm91bmQgd2hpY2ggaXMKdXNlZCBpbiBDVkUtMjAyMS0zOTk1LnBhdGNoCgpTaWdu
ZWQtb2ZmLWJ5OiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RAa3BpdC5jb20+
ClNpZ25lZC1vZmYtYnk6IFJhbmppdHNpbmggUmF0aG9kIDxyYW5qaXRzaW5ocmF0aG9kMTk5MUBn
bWFpbC5jb20+Ci0tLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9DVkUtMjAyMS0zOTk1LnBh
dGNoIHwgMTM5ICsrKysrKysrKwogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9DVkUtMjAyMS0z
OTk2LnBhdGNoIHwgMjI2ICsrKysrKysrKysrKysrKwogLi4udWRlLXN0cnV0aWxzLWNsZWFudXAt
c3RydG8tZnVuY3Rpb25zLnBhdGNoIHwgMjcwICsrKysrKysrKysrKysrKysrKwogLi4uL3V0aWwt
bGludXgvdXRpbC1saW51eF8yLjM1LjEuYmIgICAgICAgICAgIHwgICAzICsKIDQgZmlsZXMgY2hh
bmdlZCwgNjM4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvQ1ZFLTIwMjEtMzk5NS5wYXRjaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9DVkUtMjAy
MS0zOTk2LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2luY2x1ZGUtc3RydXRpbHMtY2xlYW51cC1zdHJ0by1mdW5jdGlvbnMu
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvQ1ZFLTIwMjEtMzk5NS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9DVkUtMjAyMS0zOTk1LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLjFkY2I2NmFkMWQKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvQ1ZFLTIwMjEtMzk5NS5wYXRjaApAQCAtMCwwICsxLDEz
OSBAQAorRnJvbSBmM2RiOWJkNjA5NDk0MDk5ZjBjMWI5NTIzMWM1ZGZlMzgzMzQ2OTI5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+CitE
YXRlOiBXZWQsIDI0IE5vdiAyMDIxIDEzOjUzOjI1ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1vdW50OiBmaXggVUlEIGNoZWNrIGZvciBGVVNFIHVtb3VudCBbQ1ZFLTIwMjEtMzk5NV0KKwor
SW1wcm9wZXIgVUlEIGNoZWNrIGFsbG93cyBhbiB1bnByaXZpbGVnZWQgdXNlciB0byB1bm1vdW50
IEZVU0UKK2ZpbGVzeXN0ZW1zIG9mIHVzZXJzIHdpdGggc2ltaWxhciBVSUQuCisKK1NpZ25lZC1v
ZmYtYnk6IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgorCitDVkU6IENWRS0yMDIxLTM5OTUK
K1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4
L3V0aWwtbGludXgvY29tbWl0L2YzZGI5YmQ2MDk0OTQwOTlmMGMxYjk1MjMxYzVkZmUzODMzNDY5
MjldCitTaWduZWQtb2ZmLWJ5OiBSYW5qaXRzaW5oIFJhdGhvZCA8cmFuaml0c2luaC5yYXRob2RA
a3BpdC5jb20+CisKKy0tLQorIGluY2x1ZGUvc3RydXRpbHMuaCAgICAgICAgICAgIHwgIDIgKy0K
KyBsaWJtb3VudC9zcmMvY29udGV4dF91bW91bnQuYyB8IDE0ICsrKy0tLS0tLS0tLQorIGxpYm1v
dW50L3NyYy9tb3VudFAuaCAgICAgICAgIHwgIDEgKworIGxpYm1vdW50L3NyYy9vcHRzdHIuYyAg
ICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKKyA0IGZpbGVz
IGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zdHJ1dGlscy5oIGIvaW5jbHVkZS9zdHJ1dGlscy5oCitpbmRleCA2ZTk1NzA3
ZWE5Li5hODRkMjk1OTRkIDEwMDY0NAorLS0tIGEvaW5jbHVkZS9zdHJ1dGlscy5oCisrKysgYi9p
bmNsdWRlL3N0cnV0aWxzLmgKK0BAIC05MSw4ICs5MSw4IEBAIHN0YXRpYyBpbmxpbmUgY2hhciAq
bWVtMnN0cmNweShjaGFyICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBuLCBzaXplX3Qg
bm1hCisgCWlmIChuICsgMSA+IG5tYXgpCisgCQluID0gbm1heCAtIDE7CisgCisrCW1lbXNldChk
ZXN0LCAnXDAnLCBubWF4KTsKKyAJbWVtY3B5KGRlc3QsIHNyYywgbik7CistCWRlc3Rbbm1heC0x
XSA9ICdcMCc7CisgCXJldHVybiBkZXN0OworIH0KKyAKK2RpZmYgLS1naXQgYS9saWJtb3VudC9z
cmMvY29udGV4dF91bW91bnQuYyBiL2xpYm1vdW50L3NyYy9jb250ZXh0X3Vtb3VudC5jCitpbmRl
eCAxNzM2MzdhMTVhLi44NzczYzY1ZmZhIDEwMDY0NAorLS0tIGEvbGlibW91bnQvc3JjL2NvbnRl
eHRfdW1vdW50LmMKKysrKyBiL2xpYm1vdW50L3NyYy9jb250ZXh0X3Vtb3VudC5jCitAQCAtMzkz
LDEwICszOTMsNyBAQCBzdGF0aWMgaW50IGlzX2Z1c2VfdXNlcm1vdW50KHN0cnVjdCBsaWJtbnRf
Y29udGV4dCAqY3h0LCBpbnQgKmVycnN2KQorIAlzdHJ1Y3QgbGlibW50X25zICpuc19vbGQ7Cisg
CWNvbnN0IGNoYXIgKnR5cGUgPSBtbnRfZnNfZ2V0X2ZzdHlwZShjeHQtPmZzKTsKKyAJY29uc3Qg
Y2hhciAqb3B0c3RyOworLQljaGFyICp1c2VyX2lkID0gTlVMTDsKKy0Jc2l6ZV90IHN6OworLQl1
aWRfdCB1aWQ7CistCWNoYXIgdWlkc3RyW3NpemVvZihzdHJpbmdpZnlfdmFsdWUoVUxPTkdfTUFY
KSldOworKwl1aWRfdCB1aWQsIGVudHJ5X3VpZDsKKyAKKyAJKmVycnN2ID0gMDsKKyAKK0BAIC00
MTMsMTEgKzQxMCw3IEBAIHN0YXRpYyBpbnQgaXNfZnVzZV91c2VybW91bnQoc3RydWN0IGxpYm1u
dF9jb250ZXh0ICpjeHQsIGludCAqZXJyc3YpCisgCW9wdHN0ciA9IG1udF9mc19nZXRfZnNfb3B0
aW9ucyhjeHQtPmZzKTsKKyAJaWYgKCFvcHRzdHIpCisgCQlyZXR1cm4gMDsKKy0KKy0JaWYgKG1u
dF9vcHRzdHJfZ2V0X29wdGlvbihvcHRzdHIsICJ1c2VyX2lkIiwgJnVzZXJfaWQsICZzeikgIT0g
MCkKKy0JCXJldHVybiAwOworLQorLQlpZiAoc3ogPT0gMCB8fCB1c2VyX2lkID09IE5VTEwpCisr
CWlmIChtbnRfb3B0c3RyX2dldF91aWQob3B0c3RyLCAidXNlcl9pZCIsICZlbnRyeV91aWQpICE9
IDApCisgCQlyZXR1cm4gMDsKKyAKKyAJLyogZ2V0IGN1cnJlbnQgdXNlciAqLworQEAgLTQzNCw4
ICs0MjcsNyBAQCBzdGF0aWMgaW50IGlzX2Z1c2VfdXNlcm1vdW50KHN0cnVjdCBsaWJtbnRfY29u
dGV4dCAqY3h0LCBpbnQgKmVycnN2KQorIAkJcmV0dXJuIDA7CisgCX0KKyAKKy0Jc25wcmludGYo
dWlkc3RyLCBzaXplb2YodWlkc3RyKSwgIiVsdSIsICh1bnNpZ25lZCBsb25nKSB1aWQpOworLQly
ZXR1cm4gc3RybmNtcCh1c2VyX2lkLCB1aWRzdHIsIHN6KSA9PSAwOworKwlyZXR1cm4gdWlkID09
IGVudHJ5X3VpZDsKKyB9CisgCisgLyoKK2RpZmYgLS1naXQgYS9saWJtb3VudC9zcmMvbW91bnRQ
LmggYi9saWJtb3VudC9zcmMvbW91bnRQLmgKK2luZGV4IGQ0M2E4MzU0MTguLjIyNDQyZWM1NWUg
MTAwNjQ0CistLS0gYS9saWJtb3VudC9zcmMvbW91bnRQLmgKKysrKyBiL2xpYm1vdW50L3NyYy9t
b3VudFAuaAorQEAgLTQwMCw2ICs0MDAsNyBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGxpYm1udF9v
cHRtYXAgKm1udF9vcHRtYXBfZ2V0X2VudHJ5KAorIAkJCSAgICAgY29uc3Qgc3RydWN0IGxpYm1u
dF9vcHRtYXAgKiptYXBlbnQpOworIAorIC8qIG9wdHN0ci5jICovCisrZXh0ZXJuIGludCBtbnRf
b3B0c3RyX2dldF91aWQoY29uc3QgY2hhciAqb3B0c3RyLCBjb25zdCBjaGFyICpuYW1lLCB1aWRf
dCAqdWlkKTsKKyBleHRlcm4gaW50IG1udF9vcHRzdHJfcmVtb3ZlX29wdGlvbl9hdChjaGFyICoq
b3B0c3RyLCBjaGFyICpiZWdpbiwgY2hhciAqZW5kKTsKKyBleHRlcm4gaW50IG1udF9vcHRzdHJf
Zml4X2dpZChjaGFyICoqb3B0c3RyLCBjaGFyICp2YWx1ZSwgc2l6ZV90IHZhbHN6LCBjaGFyICoq
bmV4dCk7CisgZXh0ZXJuIGludCBtbnRfb3B0c3RyX2ZpeF91aWQoY2hhciAqKm9wdHN0ciwgY2hh
ciAqdmFsdWUsIHNpemVfdCB2YWxzeiwgY2hhciAqKm5leHQpOworZGlmZiAtLWdpdCBhL2xpYm1v
dW50L3NyYy9vcHRzdHIuYyBiL2xpYm1vdW50L3NyYy9vcHRzdHIuYworaW5kZXggOTIxYjkzMThl
Ny4uMTY4MDBmNTcxYyAxMDA2NDQKKy0tLSBhL2xpYm1vdW50L3NyYy9vcHRzdHIuYworKysrIGIv
bGlibW91bnQvc3JjL29wdHN0ci5jCitAQCAtMTA5MCw2ICsxMDkwLDQ4IEBAIGludCBtbnRfb3B0
c3RyX2ZpeF91c2VyKGNoYXIgKipvcHRzdHIpCisgCXJldHVybiByYzsKKyB9CisgCisrLyoKKysg
KiBDb252ZXJ0cyB2YWx1ZSBmcm9tIEBvcHRzdHIgYWRkcmVzc2VkIGJ5IEBuYW1lIHRvIHVpZC4K
KysgKgorKyAqIFJldHVybnM6IDAgb24gc3VjY2VzcywgMSBpZiBub3QgZm91bmQsIDwwIG9uIGVy
cm9yCisrICovCisraW50IG1udF9vcHRzdHJfZ2V0X3VpZChjb25zdCBjaGFyICpvcHRzdHIsIGNv
bnN0IGNoYXIgKm5hbWUsIHVpZF90ICp1aWQpCisreworKwljaGFyICp2YWx1ZSA9IE5VTEw7Cisr
CXNpemVfdCB2YWxzeiA9IDA7CisrCWNoYXIgYnVmW3NpemVvZihzdHJpbmdpZnlfdmFsdWUoVUlO
VDY0X01BWCkpXTsKKysJaW50IHJjOworKwl1aW50NjRfdCBudW07CisrCisrCWFzc2VydChvcHRz
dHIpOworKwlhc3NlcnQobmFtZSk7CisrCWFzc2VydCh1aWQpOworKworKwlyYyA9IG1udF9vcHRz
dHJfZ2V0X29wdGlvbihvcHRzdHIsIG5hbWUsICZ2YWx1ZSwgJnZhbHN6KTsKKysJaWYgKHJjICE9
IDApCisrCQlnb3RvIGZhaWw7CisrCisrCWlmICh2YWxzeiA+IHNpemVvZihidWYpIC0gMSkgewor
KwkJcmMgPSAtRVJBTkdFOworKwkJZ290byBmYWlsOworKwl9CisrCW1lbTJzdHJjcHkoYnVmLCB2
YWx1ZSwgdmFsc3osIHNpemVvZihidWYpKTsKKysKKysJcmMgPSB1bF9zdHJ0b3U2NChidWYsICZu
dW0sIDEwKTsKKysJaWYgKHJjICE9IDApCisrCQlnb3RvIGZhaWw7CisrCWlmIChudW0gPiBVTE9O
R19NQVggfHwgKHVpZF90KSBudW0gIT0gbnVtKSB7CisrCQlyYyA9IC1FUkFOR0U7CisrCQlnb3Rv
IGZhaWw7CisrCX0KKysJKnVpZCA9ICh1aWRfdCkgbnVtOworKworKwlyZXR1cm4gMDsKKytmYWls
OgorKwlEQkcoVVRJTFMsIHVsX2RlYnVnKCJmYWlsZWQgdG8gY29udmVydCAnJXMnPSB0byBudW1i
ZXIgW3JjPSVkXSIsIG5hbWUsIHJjKSk7CisrCXJldHVybiByYzsKKyt9CisrCisgLyoqCisgICog
bW50X21hdGNoX29wdGlvbnM6CisgICogQG9wdHN0cjogb3B0aW9ucyBzdHJpbmcKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9DVkUtMjAyMS0zOTk2
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L0NWRS0yMDIx
LTM5OTYucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTYxMGI1
YTBmZQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9DVkUtMjAyMS0zOTk2LnBhdGNoCkBAIC0wLDAgKzEsMjI2IEBACitGcm9tIDAxOGEx
MDkwN2ZhOTg4NTA5M2Y2ZDg3NDAxNTU2OTMyYzJkOGJkMmIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KK0RhdGU6IFR1ZSwgNCBKYW4g
MjAyMiAxMDo1NDoyMCArMDEwMAorU3ViamVjdDogW1BBVENIXSBsaWJtb3VudDogZml4IChkZWxl
dGVkKSBzdWZmaXggaXNzdWUgW0NWRS0yMDIxLTM5OTZdCisKK1RoaXMgaXNzdWUgaXMgcmVsYXRl
ZCB0byBwYXJzaW5nIHRoZSAvcHJvYy9zZWxmL21vdW50aW5mbyBmaWxlIGFsbG93cyBhbgordW5w
cml2aWxlZ2VkIHVzZXIgdG8gdW5tb3VudCBvdGhlciB1c2VyJ3MgZmlsZXN5c3RlbXMgdGhhdCBh
cmUgZWl0aGVyCit3b3JsZC13cml0YWJsZSB0aGVtc2VsdmVzIG9yIG1vdW50ZWQgaW4gYSB3b3Js
ZC13cml0YWJsZSBkaXJlY3RvcnkuCisKK1RoZSBzdXBwb3J0IGZvciAiKGRlbGV0ZWQpIiBpcyBu
byBtb3JlIG5lY2Vzc2FyeSBhcyB0aGUgTGludXgga2VybmVsIGRvZXMKK25vdCB1c2UgaXQgaW4g
L3Byb2Mvc2VsZi9tb3VudGluZm8gYW5kIC9wcm9jL3NlbGYvbW91bnQgZmlsZXMgYW55bW9yZS4K
KworU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+CisKK0NWRTogQ1ZF
LTIwMjEtMzk5NgorVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29t
L3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvMDE4YTEwOTA3ZmE5ODg1MDkzZjZkODc0MDE1
NTY5MzJjMmQ4YmQyYl0KK1NpZ25lZC1vZmYtYnk6IFJhbmppdHNpbmggUmF0aG9kIDxyYW5qaXRz
aW5oLnJhdGhvZEBrcGl0LmNvbT4KKworLS0tCisgbGlibW91bnQvc3JjL3RhYl9wYXJzZS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgLS0tLS0KKyB0ZXN0cy9leHBlY3RlZC9maW5k
bW50L2ZpbHRlci1vcHRpb25zICAgICAgICAgICAgICAgfCAgMSAtCisgdGVzdHMvZXhwZWN0ZWQv
ZmluZG1udC9maWx0ZXItb3B0aW9ucy1uYW1ldmFsLW5lZyAgIHwgIDMgKy0tCisgdGVzdHMvZXhw
ZWN0ZWQvZmluZG1udC9maWx0ZXItdHlwZXMtbmVnICAgICAgICAgICAgIHwgIDEgLQorIHRlc3Rz
L2V4cGVjdGVkL2ZpbmRtbnQvb3V0cHV0cy1kZWZhdWx0ICAgICAgICAgICAgICB8ICAzICstLQor
IHRlc3RzL2V4cGVjdGVkL2ZpbmRtbnQvb3V0cHV0cy1mb3JjZS10cmVlICAgICAgICAgICB8ICAz
ICstLQorIHRlc3RzL2V4cGVjdGVkL2ZpbmRtbnQvb3V0cHV0cy1rZXJuZWwgICAgICAgICAgICAg
ICB8ICAzICstLQorIHRlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYtbW91bnQgICAgICAg
ICAgICAgICB8ICAxIC0KKyB0ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJkaWZmLW1vdmUgICAg
ICAgICAgICAgICAgfCAgMSAtCisgdGVzdHMvZXhwZWN0ZWQvbGlibW91bnQvdGFiZGlmZi1yZW1v
dW50ICAgICAgICAgICAgIHwgIDEgLQorIHRlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYt
dW1vdW50ICAgICAgICAgICAgICB8ICAxIC0KKyB0ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJm
aWxlcy1wYXJzZS1tb3VudGluZm8gICAgfCAxMSAtLS0tLS0tLS0tLQorIHRlc3RzL2V4cGVjdGVk
L2xpYm1vdW50L3RhYmZpbGVzLXB5LXBhcnNlLW1vdW50aW5mbyB8IDExIC0tLS0tLS0tLS0tCisg
dGVzdHMvdHMvZmluZG1udC9maWxlcy9tb3VudGluZm8gICAgICAgICAgICAgICAgICAgIHwgIDEg
LQorIHRlc3RzL3RzL2ZpbmRtbnQvZmlsZXMvbW91bnRpbmZvLW5vbnJvb3QgICAgICAgICAgICB8
ICAxIC0KKyB0ZXN0cy90cy9saWJtb3VudC9maWxlcy9tb3VudGluZm8gICAgICAgICAgICAgICAg
ICAgfCAgMSAtCisgMTYgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlv
bnMoLSkKKworZGlmZiAtLWdpdCBhL2xpYm1vdW50L3NyYy90YWJfcGFyc2UuYyBiL2xpYm1vdW50
L3NyYy90YWJfcGFyc2UuYworaW5kZXggOTE3Nzc5YWI2ZC4uNDQwN2Y5YzljNyAxMDA2NDQKKy0t
LSBhL2xpYm1vdW50L3NyYy90YWJfcGFyc2UuYworKysrIGIvbGlibW91bnQvc3JjL3RhYl9wYXJz
ZS5jCitAQCAtMjI1LDExICsyMjUsNiBAQCBzdGF0aWMgaW50IG1udF9wYXJzZV9tb3VudGluZm9f
bGluZShzdHJ1Y3QgbGlibW50X2ZzICpmcywgY29uc3QgY2hhciAqcykKKyAJCWdvdG8gZmFpbDsK
KyAJfQorIAorLQkvKiByZW1vdmUgIlwwNDAoZGVsZXRlZCkiIHN1ZmZpeCAqLworLQlwID0gKGNo
YXIgKikgZW5kc3dpdGgoZnMtPnRhcmdldCwgUEFUSF9ERUxFVEVEX1NVRkZJWCk7CistCWlmIChw
ICYmICpwKQorLQkJKnAgPSAnXDAnOworLQorIAlzID0gc2tpcF9zZXBhcmF0b3Iocyk7CisgCisg
CS8qICg2KSB2ZnMgb3B0aW9ucyAoZnMtaW5kZXBlbmRlbnQpICovCitkaWZmIC0tZ2l0IGEvdGVz
dHMvZXhwZWN0ZWQvZmluZG1udC9maWx0ZXItb3B0aW9ucyBiL3Rlc3RzL2V4cGVjdGVkL2ZpbmRt
bnQvZmlsdGVyLW9wdGlvbnMKK2luZGV4IDI2MDZiY2U3NmIuLjk3YjBlYWQwYWQgMTAwNjQ0Cist
LS0gYS90ZXN0cy9leHBlY3RlZC9maW5kbW50L2ZpbHRlci1vcHRpb25zCisrKysgYi90ZXN0cy9l
eHBlY3RlZC9maW5kbW50L2ZpbHRlci1vcHRpb25zCitAQCAtMjgsNSArMjgsNCBAQCBUQVJHRVQg
ICAgICAgICAgICAgICAgICAgICAgIFNPVVJDRSAgICAgICAgICAgRlNUWVBFICAgICAgICAgICAg
ICAgIE9QVElPTlMKKyAvaG9tZS9remFrLy5ndmZzICAgICAgICAgICAgIGd2ZnMtZnVzZS1kYWVt
b24gZnVzZS5ndmZzLWZ1c2UtZGFlbW9uIHJ3LG5vc3VpZCxub2RldixyZWxhdGltZSx1c2VyX2lk
PTUwMCxncm91cF9pZD01MDAKKyAvdmFyL2xpYi9uZnMvcnBjX3BpcGVmcyAgICAgIHN1bnJwYyAg
ICAgICAgICAgcnBjX3BpcGVmcyAgICAgICAgICAgIHJ3LHJlbGF0aW1lCisgL21udC9zb3VuZHMg
ICAgICAgICAgICAgICAgICAvL2Zvby5ob21lL2Jhci8gIGNpZnMgICAgICAgICAgICAgICAgICBy
dyxyZWxhdGltZSx1bmM9XFxmb28uaG9tZVxiYXIsdXNlcm5hbWU9a3phayxkb21haW49U1JHUk9V
UCx1aWQ9MCxub2ZvcmNldWlkLGdpZD0wLG5vZm9yY2VnaWQsYWRkcj0xOTIuMTY4LjExMS4xLHBv
c2l4cGF0aHMsc2VydmVyaW5vLGFjbCxyc2l6ZT0xNjM4NCx3c2l6ZT01NzM0NAorLS9tbnQvZm9v
ICAgICAgICAgICAgICAgICAgICAgL2Zvb29vbyAgICAgICAgICBiYXIgICAgICAgICAgICAgICAg
ICAgcncscmVsYXRpbWUKKyByYz0wCitkaWZmIC0tZ2l0IGEvdGVzdHMvZXhwZWN0ZWQvZmluZG1u
dC9maWx0ZXItb3B0aW9ucy1uYW1ldmFsLW5lZyBiL3Rlc3RzL2V4cGVjdGVkL2ZpbmRtbnQvZmls
dGVyLW9wdGlvbnMtbmFtZXZhbC1uZWcKK2luZGV4IDU0NzFkNjVhZjEuLmYwNDY3ZWY3NTUgMTAw
NjQ0CistLS0gYS90ZXN0cy9leHBlY3RlZC9maW5kbW50L2ZpbHRlci1vcHRpb25zLW5hbWV2YWwt
bmVnCisrKysgYi90ZXN0cy9leHBlY3RlZC9maW5kbW50L2ZpbHRlci1vcHRpb25zLW5hbWV2YWwt
bmVnCitAQCAtMjksNiArMjksNSBAQCBUQVJHRVQgICAgICAgICAgICAgICAgICAgICAgICAgU09V
UkNFICAgICAgICAgICAgICAgIEZTVFlQRSAgICAgICAgICAgICAgICBPUFRJTworIHwtL2hvbWUv
a3phayAgICAgICAgICAgICAgICAgICAvZGV2L21hcHBlci9remFrLWhvbWUgZXh0NCAgICAgICAg
ICAgICAgICAgIHJ3LG5vYXRpbWUsYmFycmllcj0xLGRhdGE9b3JkZXJlZAorIHwgYC0vaG9tZS9r
emFrLy5ndmZzICAgICAgICAgICBndmZzLWZ1c2UtZGFlbW9uICAgICAgZnVzZS5ndmZzLWZ1c2Ut
ZGFlbW9uIHJ3LG5vc3VpZCxub2RldixyZWxhdGltZSx1c2VyX2lkPTUwMCxncm91cF9pZD01MDAK
KyB8LS92YXIvbGliL25mcy9ycGNfcGlwZWZzICAgICAgc3VucnBjICAgICAgICAgICAgICAgIHJw
Y19waXBlZnMgICAgICAgICAgICBydyxyZWxhdGltZQorLXwtL21udC9zb3VuZHMgICAgICAgICAg
ICAgICAgICAvL2Zvby5ob21lL2Jhci8gICAgICAgY2lmcyAgICAgICAgICAgICAgICAgIHJ3LHJl
bGF0aW1lLHVuYz1cXGZvby5ob21lXGJhcix1c2VybmFtZT1remFrLGRvbWFpbj1TUkdST1VQLHVp
ZD0wLG5vZm9yY2V1aWQsZ2lkPTAsbm9mb3JjZWdpZCxhZGRyPTE5Mi4xNjguMTExLjEscG9zaXhw
YXRocyxzZXJ2ZXJpbm8sYWNsLHJzaXplPTE2Mzg0LHdzaXplPTU3MzQ0CistYC0vbW50L2ZvbyAg
ICAgICAgICAgICAgICAgICAgIC9mb29vb28gICAgICAgICAgICAgICBiYXIgICAgICAgICAgICAg
ICAgICAgcncscmVsYXRpbWUKKytgLS9tbnQvc291bmRzICAgICAgICAgICAgICAgICAgLy9mb28u
aG9tZS9iYXIvICAgICAgIGNpZnMgICAgICAgICAgICAgICAgICBydyxyZWxhdGltZSx1bmM9XFxm
b28uaG9tZVxiYXIsdXNlcm5hbWU9a3phayxkb21haW49U1JHUk9VUCx1aWQ9MCxub2ZvcmNldWlk
LGdpZD0wLG5vZm9yY2VnaWQsYWRkcj0xOTIuMTY4LjExMS4xLHBvc2l4cGF0aHMsc2VydmVyaW5v
LGFjbCxyc2l6ZT0xNjM4NCx3c2l6ZT01NzM0NAorIHJjPTAKK2RpZmYgLS1naXQgYS90ZXN0cy9l
eHBlY3RlZC9maW5kbW50L2ZpbHRlci10eXBlcy1uZWcgYi90ZXN0cy9leHBlY3RlZC9maW5kbW50
L2ZpbHRlci10eXBlcy1uZWcKK2luZGV4IDI2MDZiY2U3NmIuLjk3YjBlYWQwYWQgMTAwNjQ0Cist
LS0gYS90ZXN0cy9leHBlY3RlZC9maW5kbW50L2ZpbHRlci10eXBlcy1uZWcKKysrKyBiL3Rlc3Rz
L2V4cGVjdGVkL2ZpbmRtbnQvZmlsdGVyLXR5cGVzLW5lZworQEAgLTI4LDUgKzI4LDQgQEAgVEFS
R0VUICAgICAgICAgICAgICAgICAgICAgICBTT1VSQ0UgICAgICAgICAgIEZTVFlQRSAgICAgICAg
ICAgICAgICBPUFRJT05TCisgL2hvbWUva3phay8uZ3ZmcyAgICAgICAgICAgICBndmZzLWZ1c2Ut
ZGFlbW9uIGZ1c2UuZ3Zmcy1mdXNlLWRhZW1vbiBydyxub3N1aWQsbm9kZXYscmVsYXRpbWUsdXNl
cl9pZD01MDAsZ3JvdXBfaWQ9NTAwCisgL3Zhci9saWIvbmZzL3JwY19waXBlZnMgICAgICBzdW5y
cGMgICAgICAgICAgIHJwY19waXBlZnMgICAgICAgICAgICBydyxyZWxhdGltZQorIC9tbnQvc291
bmRzICAgICAgICAgICAgICAgICAgLy9mb28uaG9tZS9iYXIvICBjaWZzICAgICAgICAgICAgICAg
ICAgcncscmVsYXRpbWUsdW5jPVxcZm9vLmhvbWVcYmFyLHVzZXJuYW1lPWt6YWssZG9tYWluPVNS
R1JPVVAsdWlkPTAsbm9mb3JjZXVpZCxnaWQ9MCxub2ZvcmNlZ2lkLGFkZHI9MTkyLjE2OC4xMTEu
MSxwb3NpeHBhdGhzLHNlcnZlcmlubyxhY2wscnNpemU9MTYzODQsd3NpemU9NTczNDQKKy0vbW50
L2ZvbyAgICAgICAgICAgICAgICAgICAgIC9mb29vb28gICAgICAgICAgYmFyICAgICAgICAgICAg
ICAgICAgIHJ3LHJlbGF0aW1lCisgcmM9MAorZGlmZiAtLWdpdCBhL3Rlc3RzL2V4cGVjdGVkL2Zp
bmRtbnQvb3V0cHV0cy1kZWZhdWx0IGIvdGVzdHMvZXhwZWN0ZWQvZmluZG1udC9vdXRwdXRzLWRl
ZmF1bHQKK2luZGV4IDU5NDk1Nzk3YmQuLjAxNTk5MzU1ZWMgMTAwNjQ0CistLS0gYS90ZXN0cy9l
eHBlY3RlZC9maW5kbW50L291dHB1dHMtZGVmYXVsdAorKysrIGIvdGVzdHMvZXhwZWN0ZWQvZmlu
ZG1udC9vdXRwdXRzLWRlZmF1bHQKK0BAIC0zMCw2ICszMCw1IEBAIFRBUkdFVCAgICAgICAgICAg
ICAgICAgICAgICAgICBTT1VSQ0UgICAgICAgICAgICAgICAgRlNUWVBFICAgICAgICAgICAgICAg
IE9QVElPCisgfC0vaG9tZS9remFrICAgICAgICAgICAgICAgICAgIC9kZXYvbWFwcGVyL2t6YWst
aG9tZSBleHQ0ICAgICAgICAgICAgICAgICAgcncsbm9hdGltZSxiYXJyaWVyPTEsZGF0YT1vcmRl
cmVkCisgfCBgLS9ob21lL2t6YWsvLmd2ZnMgICAgICAgICAgIGd2ZnMtZnVzZS1kYWVtb24gICAg
ICBmdXNlLmd2ZnMtZnVzZS1kYWVtb24gcncsbm9zdWlkLG5vZGV2LHJlbGF0aW1lLHVzZXJfaWQ9
NTAwLGdyb3VwX2lkPTUwMAorIHwtL3Zhci9saWIvbmZzL3JwY19waXBlZnMgICAgICBzdW5ycGMg
ICAgICAgICAgICAgICAgcnBjX3BpcGVmcyAgICAgICAgICAgIHJ3LHJlbGF0aW1lCistfC0vbW50
L3NvdW5kcyAgICAgICAgICAgICAgICAgIC8vZm9vLmhvbWUvYmFyLyAgICAgICBjaWZzICAgICAg
ICAgICAgICAgICAgcncscmVsYXRpbWUsdW5jPVxcZm9vLmhvbWVcYmFyLHVzZXJuYW1lPWt6YWss
ZG9tYWluPVNSR1JPVVAsdWlkPTAsbm9mb3JjZXVpZCxnaWQ9MCxub2ZvcmNlZ2lkLGFkZHI9MTky
LjE2OC4xMTEuMSxwb3NpeHBhdGhzLHNlcnZlcmlubyxhY2wscnNpemU9MTYzODQsd3NpemU9NTcz
NDQKKy1gLS9tbnQvZm9vICAgICAgICAgICAgICAgICAgICAgL2Zvb29vbyAgICAgICAgICAgICAg
IGJhciAgICAgICAgICAgICAgICAgICBydyxyZWxhdGltZQorK2AtL21udC9zb3VuZHMgICAgICAg
ICAgICAgICAgICAvL2Zvby5ob21lL2Jhci8gICAgICAgY2lmcyAgICAgICAgICAgICAgICAgIHJ3
LHJlbGF0aW1lLHVuYz1cXGZvby5ob21lXGJhcix1c2VybmFtZT1remFrLGRvbWFpbj1TUkdST1VQ
LHVpZD0wLG5vZm9yY2V1aWQsZ2lkPTAsbm9mb3JjZWdpZCxhZGRyPTE5Mi4xNjguMTExLjEscG9z
aXhwYXRocyxzZXJ2ZXJpbm8sYWNsLHJzaXplPTE2Mzg0LHdzaXplPTU3MzQ0CisgcmM9MAorZGlm
ZiAtLWdpdCBhL3Rlc3RzL2V4cGVjdGVkL2ZpbmRtbnQvb3V0cHV0cy1mb3JjZS10cmVlIGIvdGVz
dHMvZXhwZWN0ZWQvZmluZG1udC9vdXRwdXRzLWZvcmNlLXRyZWUKK2luZGV4IDU5NDk1Nzk3YmQu
LjAxNTk5MzU1ZWMgMTAwNjQ0CistLS0gYS90ZXN0cy9leHBlY3RlZC9maW5kbW50L291dHB1dHMt
Zm9yY2UtdHJlZQorKysrIGIvdGVzdHMvZXhwZWN0ZWQvZmluZG1udC9vdXRwdXRzLWZvcmNlLXRy
ZWUKK0BAIC0zMCw2ICszMCw1IEBAIFRBUkdFVCAgICAgICAgICAgICAgICAgICAgICAgICBTT1VS
Q0UgICAgICAgICAgICAgICAgRlNUWVBFICAgICAgICAgICAgICAgIE9QVElPCisgfC0vaG9tZS9r
emFrICAgICAgICAgICAgICAgICAgIC9kZXYvbWFwcGVyL2t6YWstaG9tZSBleHQ0ICAgICAgICAg
ICAgICAgICAgcncsbm9hdGltZSxiYXJyaWVyPTEsZGF0YT1vcmRlcmVkCisgfCBgLS9ob21lL2t6
YWsvLmd2ZnMgICAgICAgICAgIGd2ZnMtZnVzZS1kYWVtb24gICAgICBmdXNlLmd2ZnMtZnVzZS1k
YWVtb24gcncsbm9zdWlkLG5vZGV2LHJlbGF0aW1lLHVzZXJfaWQ9NTAwLGdyb3VwX2lkPTUwMAor
IHwtL3Zhci9saWIvbmZzL3JwY19waXBlZnMgICAgICBzdW5ycGMgICAgICAgICAgICAgICAgcnBj
X3BpcGVmcyAgICAgICAgICAgIHJ3LHJlbGF0aW1lCistfC0vbW50L3NvdW5kcyAgICAgICAgICAg
ICAgICAgIC8vZm9vLmhvbWUvYmFyLyAgICAgICBjaWZzICAgICAgICAgICAgICAgICAgcncscmVs
YXRpbWUsdW5jPVxcZm9vLmhvbWVcYmFyLHVzZXJuYW1lPWt6YWssZG9tYWluPVNSR1JPVVAsdWlk
PTAsbm9mb3JjZXVpZCxnaWQ9MCxub2ZvcmNlZ2lkLGFkZHI9MTkyLjE2OC4xMTEuMSxwb3NpeHBh
dGhzLHNlcnZlcmlubyxhY2wscnNpemU9MTYzODQsd3NpemU9NTczNDQKKy1gLS9tbnQvZm9vICAg
ICAgICAgICAgICAgICAgICAgL2Zvb29vbyAgICAgICAgICAgICAgIGJhciAgICAgICAgICAgICAg
ICAgICBydyxyZWxhdGltZQorK2AtL21udC9zb3VuZHMgICAgICAgICAgICAgICAgICAvL2Zvby5o
b21lL2Jhci8gICAgICAgY2lmcyAgICAgICAgICAgICAgICAgIHJ3LHJlbGF0aW1lLHVuYz1cXGZv
by5ob21lXGJhcix1c2VybmFtZT1remFrLGRvbWFpbj1TUkdST1VQLHVpZD0wLG5vZm9yY2V1aWQs
Z2lkPTAsbm9mb3JjZWdpZCxhZGRyPTE5Mi4xNjguMTExLjEscG9zaXhwYXRocyxzZXJ2ZXJpbm8s
YWNsLHJzaXplPTE2Mzg0LHdzaXplPTU3MzQ0CisgcmM9MAorZGlmZiAtLWdpdCBhL3Rlc3RzL2V4
cGVjdGVkL2ZpbmRtbnQvb3V0cHV0cy1rZXJuZWwgYi90ZXN0cy9leHBlY3RlZC9maW5kbW50L291
dHB1dHMta2VybmVsCitpbmRleCA1OTQ5NTc5N2JkLi4wMTU5OTM1NWVjIDEwMDY0NAorLS0tIGEv
dGVzdHMvZXhwZWN0ZWQvZmluZG1udC9vdXRwdXRzLWtlcm5lbAorKysrIGIvdGVzdHMvZXhwZWN0
ZWQvZmluZG1udC9vdXRwdXRzLWtlcm5lbAorQEAgLTMwLDYgKzMwLDUgQEAgVEFSR0VUICAgICAg
ICAgICAgICAgICAgICAgICAgIFNPVVJDRSAgICAgICAgICAgICAgICBGU1RZUEUgICAgICAgICAg
ICAgICAgT1BUSU8KKyB8LS9ob21lL2t6YWsgICAgICAgICAgICAgICAgICAgL2Rldi9tYXBwZXIv
a3phay1ob21lIGV4dDQgICAgICAgICAgICAgICAgICBydyxub2F0aW1lLGJhcnJpZXI9MSxkYXRh
PW9yZGVyZWQKKyB8IGAtL2hvbWUva3phay8uZ3ZmcyAgICAgICAgICAgZ3Zmcy1mdXNlLWRhZW1v
biAgICAgIGZ1c2UuZ3Zmcy1mdXNlLWRhZW1vbiBydyxub3N1aWQsbm9kZXYscmVsYXRpbWUsdXNl
cl9pZD01MDAsZ3JvdXBfaWQ9NTAwCisgfC0vdmFyL2xpYi9uZnMvcnBjX3BpcGVmcyAgICAgIHN1
bnJwYyAgICAgICAgICAgICAgICBycGNfcGlwZWZzICAgICAgICAgICAgcncscmVsYXRpbWUKKy18
LS9tbnQvc291bmRzICAgICAgICAgICAgICAgICAgLy9mb28uaG9tZS9iYXIvICAgICAgIGNpZnMg
ICAgICAgICAgICAgICAgICBydyxyZWxhdGltZSx1bmM9XFxmb28uaG9tZVxiYXIsdXNlcm5hbWU9
a3phayxkb21haW49U1JHUk9VUCx1aWQ9MCxub2ZvcmNldWlkLGdpZD0wLG5vZm9yY2VnaWQsYWRk
cj0xOTIuMTY4LjExMS4xLHBvc2l4cGF0aHMsc2VydmVyaW5vLGFjbCxyc2l6ZT0xNjM4NCx3c2l6
ZT01NzM0NAorLWAtL21udC9mb28gICAgICAgICAgICAgICAgICAgICAvZm9vb29vICAgICAgICAg
ICAgICAgYmFyICAgICAgICAgICAgICAgICAgIHJ3LHJlbGF0aW1lCisrYC0vbW50L3NvdW5kcyAg
ICAgICAgICAgICAgICAgIC8vZm9vLmhvbWUvYmFyLyAgICAgICBjaWZzICAgICAgICAgICAgICAg
ICAgcncscmVsYXRpbWUsdW5jPVxcZm9vLmhvbWVcYmFyLHVzZXJuYW1lPWt6YWssZG9tYWluPVNS
R1JPVVAsdWlkPTAsbm9mb3JjZXVpZCxnaWQ9MCxub2ZvcmNlZ2lkLGFkZHI9MTkyLjE2OC4xMTEu
MSxwb3NpeHBhdGhzLHNlcnZlcmlubyxhY2wscnNpemU9MTYzODQsd3NpemU9NTczNDQKKyByYz0w
CitkaWZmIC0tZ2l0IGEvdGVzdHMvZXhwZWN0ZWQvbGlibW91bnQvdGFiZGlmZi1tb3VudCBiL3Rl
c3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYtbW91bnQKK2luZGV4IDQyMGFlYWNkNWUuLjNj
MThmOGRjNGYgMTAwNjQ0CistLS0gYS90ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJkaWZmLW1v
dW50CisrKysgYi90ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJkaWZmLW1vdW50CitAQCAtMSwz
ICsxLDIgQEAKKyAvZGV2L21hcHBlci9remFrLWhvbWUgb24gL2hvbWUva3phazogTU9VTlRFRAor
LS9mb29vb28gb24gL21udC9mb286IE1PVU5URUQKKyB0bXBmcyBvbiAvbW50L3Rlc3QvZm9vDWJh
cjogTU9VTlRFRAorZGlmZiAtLWdpdCBhL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYt
bW92ZSBiL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYtbW92ZQoraW5kZXggMjRmOWJj
NzkxYi4uOTU4MjBkOTNlZiAxMDA2NDQKKy0tLSBhL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3Rh
YmRpZmYtbW92ZQorKysrIGIvdGVzdHMvZXhwZWN0ZWQvbGlibW91bnQvdGFiZGlmZi1tb3ZlCitA
QCAtMSwzICsxLDIgQEAKKyAvL2Zvby5ob21lL2Jhci8gb24gL21udC9tdXNpYzogTU9WRUQgdG8g
L21udC9tdXNpYworLS9mb29vb28gb24gL21udC9mb286IFVNT1VOVEVECisgdG1wZnMgb24gL21u
dC90ZXN0L2Zvbw1iYXI6IFVNT1VOVEVECitkaWZmIC0tZ2l0IGEvdGVzdHMvZXhwZWN0ZWQvbGli
bW91bnQvdGFiZGlmZi1yZW1vdW50IGIvdGVzdHMvZXhwZWN0ZWQvbGlibW91bnQvdGFiZGlmZi1y
ZW1vdW50CitpbmRleCA4MmViZWFiMzkwLi44NzZiZmQ5NTM5IDEwMDY0NAorLS0tIGEvdGVzdHMv
ZXhwZWN0ZWQvbGlibW91bnQvdGFiZGlmZi1yZW1vdW50CisrKysgYi90ZXN0cy9leHBlY3RlZC9s
aWJtb3VudC90YWJkaWZmLXJlbW91bnQKK0BAIC0xLDQgKzEsMyBAQAorIC9kZXYvbWFwcGVyL2t6
YWstaG9tZSBvbiAvaG9tZS9remFrOiBSRU1PVU5URUQgZnJvbSAncncsbm9hdGltZSxiYXJyaWVy
PTEsZGF0YT1vcmRlcmVkJyB0byAncm8sbm9hdGltZSxiYXJyaWVyPTEsZGF0YT1vcmRlcmVkJwor
IC8vZm9vLmhvbWUvYmFyLyBvbiAvbW50L3NvdW5kczogUkVNT1VOVEVEIGZyb20gJ3J3LHJlbGF0
aW1lLHVuYz1cXGZvby5ob21lXGJhcix1c2VybmFtZT1remFrLGRvbWFpbj1TUkdST1VQLHVpZD0w
LG5vZm9yY2V1aWQsZ2lkPTAsbm9mb3JjZWdpZCxhZGRyPTE5Mi4xNjguMTExLjEscG9zaXhwYXRo
cyxzZXJ2ZXJpbm8sYWNsLHJzaXplPTE2Mzg0LHdzaXplPTU3MzQ0JyB0byAncm8scmVsYXRpbWUs
dW5jPVxcZm9vLmhvbWVcYmFyLHVzZXJuYW1lPWt6YWssZG9tYWluPVNSR1JPVVAsdWlkPTAsbm9m
b3JjZXVpZCxnaWQ9MCxub2ZvcmNlZ2lkLGFkZHI9MTkyLjE2OC4xMTEuMSxwb3NpeHBhdGhzLHNl
cnZlcmlubyxhY2wscnNpemU9MTYzODQsd3NpemU9NTczNDQnCistL2Zvb29vbyBvbiAvbW50L2Zv
bzogVU1PVU5URUQKKyB0bXBmcyBvbiAvbW50L3Rlc3QvZm9vDWJhcjogVU1PVU5URUQKK2RpZmYg
LS1naXQgYS90ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJkaWZmLXVtb3VudCBiL3Rlc3RzL2V4
cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYtdW1vdW50CitpbmRleCBhM2UwZmU0OGExLi5jN2JlNzI1
YjkyIDEwMDY0NAorLS0tIGEvdGVzdHMvZXhwZWN0ZWQvbGlibW91bnQvdGFiZGlmZi11bW91bnQK
KysrKyBiL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmRpZmYtdW1vdW50CitAQCAtMSwzICsx
LDIgQEAKKyAvZGV2L21hcHBlci9remFrLWhvbWUgb24gL2hvbWUva3phazogVU1PVU5URUQKKy0v
Zm9vb29vIG9uIC9tbnQvZm9vOiBVTU9VTlRFRAorIHRtcGZzIG9uIC9tbnQvdGVzdC9mb28NYmFy
OiBVTU9VTlRFRAorZGlmZiAtLWdpdCBhL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmZpbGVz
LXBhcnNlLW1vdW50aW5mbyBiL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmZpbGVzLXBhcnNl
LW1vdW50aW5mbworaW5kZXggNDdlYjc3MDA2MS4uZDViYTUyNDhlNCAxMDA2NDQKKy0tLSBhL3Rl
c3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmZpbGVzLXBhcnNlLW1vdW50aW5mbworKysrIGIvdGVz
dHMvZXhwZWN0ZWQvbGlibW91bnQvdGFiZmlsZXMtcGFyc2UtbW91bnRpbmZvCitAQCAtMzUxLDE3
ICszNTEsNiBAQCBpZDogICAgIDQ3CisgcGFyZW50OiAyMAorIGRldm5vOiAgMDozOAorIC0tLS0t
LSBmczoKKy1zb3VyY2U6IC9mb29vb28KKy10YXJnZXQ6IC9tbnQvZm9vCistZnN0eXBlOiBiYXIK
Ky1vcHRzdHI6IHJ3LHJlbGF0aW1lCistVkZTLW9wdHN0cjogcncscmVsYXRpbWUKKy1GUy1vcHN0
cjogcncKKy1yb290OiAgIC8KKy1pZDogICAgIDQ4CistcGFyZW50OiAyMAorLWRldm5vOiAgMDoz
OQorLS0tLS0tLSBmczoKKyBzb3VyY2U6IHRtcGZzCisgdGFyZ2V0OiAvbW50L3Rlc3QvZm9vDWJh
cgorIGZzdHlwZTogdG1wZnMKK2RpZmYgLS1naXQgYS90ZXN0cy9leHBlY3RlZC9saWJtb3VudC90
YWJmaWxlcy1weS1wYXJzZS1tb3VudGluZm8gYi90ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJm
aWxlcy1weS1wYXJzZS1tb3VudGluZm8KK2luZGV4IDQ3ZWI3NzAwNjEuLmQ1YmE1MjQ4ZTQgMTAw
NjQ0CistLS0gYS90ZXN0cy9leHBlY3RlZC9saWJtb3VudC90YWJmaWxlcy1weS1wYXJzZS1tb3Vu
dGluZm8KKysrKyBiL3Rlc3RzL2V4cGVjdGVkL2xpYm1vdW50L3RhYmZpbGVzLXB5LXBhcnNlLW1v
dW50aW5mbworQEAgLTM1MSwxNyArMzUxLDYgQEAgaWQ6ICAgICA0NworIHBhcmVudDogMjAKKyBk
ZXZubzogIDA6MzgKKyAtLS0tLS0gZnM6Cistc291cmNlOiAvZm9vb29vCistdGFyZ2V0OiAvbW50
L2ZvbworLWZzdHlwZTogYmFyCistb3B0c3RyOiBydyxyZWxhdGltZQorLVZGUy1vcHRzdHI6IHJ3
LHJlbGF0aW1lCistRlMtb3BzdHI6IHJ3Cistcm9vdDogICAvCistaWQ6ICAgICA0OAorLXBhcmVu
dDogMjAKKy1kZXZubzogIDA6MzkKKy0tLS0tLS0gZnM6Cisgc291cmNlOiB0bXBmcworIHRhcmdl
dDogL21udC90ZXN0L2Zvbw1iYXIKKyBmc3R5cGU6IHRtcGZzCitkaWZmIC0tZ2l0IGEvdGVzdHMv
dHMvZmluZG1udC9maWxlcy9tb3VudGluZm8gYi90ZXN0cy90cy9maW5kbW50L2ZpbGVzL21vdW50
aW5mbworaW5kZXggNDc1ZWExYTMzNy4uZmYxZTY2NGE4NCAxMDA2NDQKKy0tLSBhL3Rlc3RzL3Rz
L2ZpbmRtbnQvZmlsZXMvbW91bnRpbmZvCisrKysgYi90ZXN0cy90cy9maW5kbW50L2ZpbGVzL21v
dW50aW5mbworQEAgLTMwLDQgKzMwLDMgQEAKKyA0NCA0MSAwOjM2IC8gL2hvbWUva3phay8uZ3Zm
cyBydyxub3N1aWQsbm9kZXYscmVsYXRpbWUgLSBmdXNlLmd2ZnMtZnVzZS1kYWVtb24gZ3Zmcy1m
dXNlLWRhZW1vbiBydyx1c2VyX2lkPTUwMCxncm91cF9pZD01MDAKKyA0NSAyMCAwOjM3IC8gL3Zh
ci9saWIvbmZzL3JwY19waXBlZnMgcncscmVsYXRpbWUgLSBycGNfcGlwZWZzIHN1bnJwYyBydwor
IDQ3IDIwIDA6MzggLyAvbW50L3NvdW5kcyBydyxyZWxhdGltZSAtIGNpZnMgLy9mb28uaG9tZS9i
YXIvIHJ3LHVuYz1cXGZvby5ob21lXGJhcix1c2VybmFtZT1remFrLGRvbWFpbj1TUkdST1VQLHVp
ZD0wLG5vZm9yY2V1aWQsZ2lkPTAsbm9mb3JjZWdpZCxhZGRyPTE5Mi4xNjguMTExLjEscG9zaXhw
YXRocyxzZXJ2ZXJpbm8sYWNsLHJzaXplPTE2Mzg0LHdzaXplPTU3MzQ0CistNDggMjAgMDozOSAv
IC9tbnQvZm9vXDA0MChkZWxldGVkKSBydyxyZWxhdGltZSAtIGJhciAvZm9vb29vIHJ3CitkaWZm
IC0tZ2l0IGEvdGVzdHMvdHMvZmluZG1udC9maWxlcy9tb3VudGluZm8tbm9ucm9vdCBiL3Rlc3Rz
L3RzL2ZpbmRtbnQvZmlsZXMvbW91bnRpbmZvLW5vbnJvb3QKK2luZGV4IGUxNWI0NjcwMTYuLjg3
YjQyMWQyZWYgMTAwNjQ0CistLS0gYS90ZXN0cy90cy9maW5kbW50L2ZpbGVzL21vdW50aW5mby1u
b25yb290CisrKysgYi90ZXN0cy90cy9maW5kbW50L2ZpbGVzL21vdW50aW5mby1ub25yb290CitA
QCAtMjksNCArMjksMyBAQAorIDQ0IDQxIDA6MzYgLyAvaG9tZS9remFrLy5ndmZzIHJ3LG5vc3Vp
ZCxub2RldixyZWxhdGltZSAtIGZ1c2UuZ3Zmcy1mdXNlLWRhZW1vbiBndmZzLWZ1c2UtZGFlbW9u
IHJ3LHVzZXJfaWQ9NTAwLGdyb3VwX2lkPTUwMAorIDQ1IDIwIDA6MzcgLyAvdmFyL2xpYi9uZnMv
cnBjX3BpcGVmcyBydyxyZWxhdGltZSAtIHJwY19waXBlZnMgc3VucnBjIHJ3CisgNDcgMjAgMDoz
OCAvIC9tbnQvc291bmRzIHJ3LHJlbGF0aW1lIC0gY2lmcyAvL2Zvby5ob21lL2Jhci8gcncsdW5j
PVxcZm9vLmhvbWVcYmFyLHVzZXJuYW1lPWt6YWssZG9tYWluPVNSR1JPVVAsdWlkPTAsbm9mb3Jj
ZXVpZCxnaWQ9MCxub2ZvcmNlZ2lkLGFkZHI9MTkyLjE2OC4xMTEuMSxwb3NpeHBhdGhzLHNlcnZl
cmlubyxhY2wscnNpemU9MTYzODQsd3NpemU9NTczNDQKKy00OCAyMCAwOjM5IC8gL21udC9mb29c
MDQwKGRlbGV0ZWQpIHJ3LHJlbGF0aW1lIC0gYmFyIC9mb29vb28gcncKK2RpZmYgLS1naXQgYS90
ZXN0cy90cy9saWJtb3VudC9maWxlcy9tb3VudGluZm8gYi90ZXN0cy90cy9saWJtb3VudC9maWxl
cy9tb3VudGluZm8KK2luZGV4IGMwNjMwNzE4MzMuLjJiMDE3NDA0ODEgMTAwNjQ0CistLS0gYS90
ZXN0cy90cy9saWJtb3VudC9maWxlcy9tb3VudGluZm8KKysrKyBiL3Rlc3RzL3RzL2xpYm1vdW50
L2ZpbGVzL21vdW50aW5mbworQEAgLTMwLDUgKzMwLDQgQEAKKyA0NCA0MSAwOjM2IC8gL2hvbWUv
a3phay8uZ3ZmcyBydyxub3N1aWQsbm9kZXYscmVsYXRpbWUgLSBmdXNlLmd2ZnMtZnVzZS1kYWVt
b24gZ3Zmcy1mdXNlLWRhZW1vbiBydyx1c2VyX2lkPTUwMCxncm91cF9pZD01MDAKKyA0NSAyMCAw
OjM3IC8gL3Zhci9saWIvbmZzL3JwY19waXBlZnMgcncscmVsYXRpbWUgLSBycGNfcGlwZWZzIHN1
bnJwYyBydworIDQ3IDIwIDA6MzggLyAvbW50L3NvdW5kcyBydyxyZWxhdGltZSAtIGNpZnMgLy9m
b28uaG9tZS9iYXIvIHJ3LHVuYz1cXGZvby5ob21lXGJhcix1c2VybmFtZT1remFrLGRvbWFpbj1T
UkdST1VQLHVpZD0wLG5vZm9yY2V1aWQsZ2lkPTAsbm9mb3JjZWdpZCxhZGRyPTE5Mi4xNjguMTEx
LjEscG9zaXhwYXRocyxzZXJ2ZXJpbm8sYWNsLHJzaXplPTE2Mzg0LHdzaXplPTU3MzQ0CistNDgg
MjAgMDozOSAvIC9tbnQvZm9vXDA0MChkZWxldGVkKSBydyxyZWxhdGltZSAtIGJhciAvZm9vb29v
IHJ3CisgNDkgMjAgMDo1NiAvIC9tbnQvdGVzdC9mb28NYmFyIHJ3LHJlbGF0aW1lIHNoYXJlZDoz
MjMgLSB0bXBmcyB0bXBmcyBydwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2luY2x1ZGUtc3RydXRpbHMtY2xlYW51cC1zdHJ0by1mdW5jdGlvbnMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvaW5jbHVkZS1z
dHJ1dGlscy1jbGVhbnVwLXN0cnRvLWZ1bmN0aW9ucy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi41ZDVhMzcwODIxCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2luY2x1ZGUtc3RydXRpbHMtY2xlYW51
cC1zdHJ0by1mdW5jdGlvbnMucGF0Y2gKQEAgLTAsMCArMSwyNzAgQEAKK0Zyb20gODQ4MjViMTYx
YmE1ZDE4ZGE0MTQyODkzYjk3ODliM2ZjNzEyODRkOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgorRGF0ZTogVHVlLCAyMiBKdW4gMjAy
MSAxNDoyMDo0MiArMDIwMAorU3ViamVjdDogW1BBVENIXSBpbmNsdWRlL3N0cnV0aWxzOiBjbGVh
bnVwIHN0cnRvLi4oKSBmdW5jdGlvbnMKKworKiBhZGQgdWxfc3RydG9zNjQoKSBhbmQgdWxfc3Ry
dG91NjQoKQorKiBhZGQgc2ltcGxlIHRlc3QKKworQWRkcmVzc2VzOiBodHRwczovL2dpdGh1Yi5j
b20va2FyZWx6YWsvdXRpbC1saW51eC9pc3N1ZXMvMTM1OAorU2lnbmVkLW9mZi1ieTogS2FyZWwg
WmFrIDxremFrQHJlZGhhdC5jb20+CisKK1Vwc3RyZWFtLUJhY2twb3J0OiBbaHR0cHM6Ly9naXRo
dWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvODQ4MjViMTYxYmE1ZDE4ZGE0MTQy
ODkzYjk3ODliM2ZjNzEyODRkOV0KK1NpZ25lZC1vZmYtYnk6IFJhbmppdHNpbmggUmF0aG9kIDxy
YW5qaXRzaW5oLnJhdGhvZEBrcGl0LmNvbT4KKworLS0tCisgaW5jbHVkZS9zdHJ1dGlscy5oIHwg
ICAzICsKKyBsaWIvc3RydXRpbHMuYyAgICAgfCAxNzQgKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tCisgMiBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygr
KSwgNzIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL3N0cnV0aWxzLmggYi9p
bmNsdWRlL3N0cnV0aWxzLmgKK2luZGV4IGU3NWEyZjBlMTcuLjM4OWU4NDk5MDUgMTAwNjQ0Cist
LS0gYS9pbmNsdWRlL3N0cnV0aWxzLmgKKysrKyBiL2luY2x1ZGUvc3RydXRpbHMuaAorQEAgLTE5
LDYgKzE5LDkgQEAgZXh0ZXJuIGludCBwYXJzZV9zaXplKGNvbnN0IGNoYXIgKnN0ciwgdWludG1h
eF90ICpyZXMsIGludCAqcG93ZXIpOworIGV4dGVybiBpbnQgc3RydG9zaXplKGNvbnN0IGNoYXIg
KnN0ciwgdWludG1heF90ICpyZXMpOworIGV4dGVybiB1aW50bWF4X3Qgc3RydG9zaXplX29yX2Vy
cihjb25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIgKmVycm1lc2cpOworIAorK2V4dGVybiBpbnQg
dWxfc3RydG9zNjQoY29uc3QgY2hhciAqc3RyLCBpbnQ2NF90ICpudW0sIGludCBiYXNlKTsKKytl
eHRlcm4gaW50IHVsX3N0cnRvdTY0KGNvbnN0IGNoYXIgKnN0ciwgdWludDY0X3QgKm51bSwgaW50
IGJhc2UpOworKworIGV4dGVybiBpbnQxNl90IHN0cnRvczE2X29yX2Vycihjb25zdCBjaGFyICpz
dHIsIGNvbnN0IGNoYXIgKmVycm1lc2cpOworIGV4dGVybiB1aW50MTZfdCBzdHJ0b3UxNl9vcl9l
cnIoY29uc3QgY2hhciAqc3RyLCBjb25zdCBjaGFyICplcnJtZXNnKTsKKyBleHRlcm4gdWludDE2
X3Qgc3RydG94MTZfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZyk7
CitkaWZmIC0tZ2l0IGEvbGliL3N0cnV0aWxzLmMgYi9saWIvc3RydXRpbHMuYworaW5kZXggZWUy
YzgzNTQ5NS4uZDk5NzZkY2E3MCAxMDA2NDQKKy0tLSBhL2xpYi9zdHJ1dGlscy5jCisrKysgYi9s
aWIvc3RydXRpbHMuYworQEAgLTMxOSwzOSArMzE5LDgwIEBAIGNoYXIgKnN0cm5kdXAoY29uc3Qg
Y2hhciAqcywgc2l6ZV90IG4pCisgfQorICNlbmRpZgorIAorLXN0YXRpYyB1aW50MzJfdCBfc3Ry
dG91MzJfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZywgaW50IGJh
c2UpOworLXN0YXRpYyB1aW50NjRfdCBfc3RydG91NjRfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwg
Y29uc3QgY2hhciAqZXJybWVzZywgaW50IGJhc2UpOworKy8qCisrICogY29udmVydCBzdHJpbmdz
IHRvIG51bWJlcnM7IHJldHVybnMgPDAgb24gZXJyb3IsIGFuZCAwIG9uIHN1Y2Nlc3MKKysgKi8K
KytpbnQgdWxfc3RydG9zNjQoY29uc3QgY2hhciAqc3RyLCBpbnQ2NF90ICpudW0sIGludCBiYXNl
KQorK3sKKysJY2hhciAqZW5kID0gTlVMTDsKKyAKKy1pbnQxNl90IHN0cnRvczE2X29yX2Vycihj
b25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIgKmVycm1lc2cpCisrCWVycm5vID0gMDsKKysJaWYg
KHN0ciA9PSBOVUxMIHx8ICpzdHIgPT0gJ1wwJykKKysJCXJldHVybiAtRUlOVkFMOworKwkqbnVt
ID0gKGludDY0X3QpIHN0cnRvaW1heChzdHIsICZlbmQsIGJhc2UpOworKworKwlpZiAoZXJybm8g
fHwgc3RyID09IGVuZCB8fCAoZW5kICYmICplbmQpKQorKwkJcmV0dXJuIC1FSU5WQUw7CisrCXJl
dHVybiAwOworK30KKysKKytpbnQgdWxfc3RydG91NjQoY29uc3QgY2hhciAqc3RyLCB1aW50NjRf
dCAqbnVtLCBpbnQgYmFzZSkKKyB7CistCWludDMyX3QgbnVtID0gc3RydG9zMzJfb3JfZXJyKHN0
ciwgZXJybWVzZyk7CisrCWNoYXIgKmVuZCA9IE5VTEw7CisgCistCWlmIChudW0gPCBJTlQxNl9N
SU4gfHwgbnVtID4gSU5UMTZfTUFYKSB7CistCQllcnJubyA9IEVSQU5HRTsKKy0JCWVycihTVFJU
T1hYX0VYSVRfQ09ERSwgIiVzOiAnJXMnIiwgZXJybWVzZywgc3RyKTsKKy0JfQorLQlyZXR1cm4g
bnVtOworKwllcnJubyA9IDA7CisrCWlmIChzdHIgPT0gTlVMTCB8fCAqc3RyID09ICdcMCcpCisr
CQlyZXR1cm4gLUVJTlZBTDsKKysJKm51bSA9ICh1aW50NjRfdCkgc3RydG91bWF4KHN0ciwgJmVu
ZCwgYmFzZSk7CisrCisrCWlmIChlcnJubyB8fCBzdHIgPT0gZW5kIHx8IChlbmQgJiYgKmVuZCkp
CisrCQlyZXR1cm4gLUVJTlZBTDsKKysJcmV0dXJuIDA7CisgfQorIAorLXN0YXRpYyB1aW50MTZf
dCBfc3RydG91MTZfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZywg
aW50IGJhc2UpCisrLyoKKysgKiBDb3ZlcnQgc3RyaW5ncyB0byBudW1iZXJzIGFuZCBwcmludCBt
ZXNzYWdlIG9uIGVycm9yLgorKyAqCisrICogTm90ZSB0aGF0IGhleCBmdW5jdGlvbnMgKHN0cnRv
eC4uKCkpIHJldHVybnMgdW5zaWduZWQgbnVtYmVycywgaWYgeW91IG5lZWQKKysgKiBzb21ldGhp
bmcgZWxzZSB0aGVuIHVzZSB1bF9zdHJ0b3M2NChzLCAmbiwgMTYpLgorKyAqLworK2ludDY0X3Qg
c3RydG9zNjRfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZykKKyB7
CistCXVpbnQzMl90IG51bSA9IF9zdHJ0b3UzMl9vcl9lcnIoc3RyLCBlcnJtZXNnLCBiYXNlKTsK
KysJaW50NjRfdCBudW0gPSAwOworIAorLQlpZiAobnVtID4gVUlOVDE2X01BWCkgeworLQkJZXJy
bm8gPSBFUkFOR0U7CistCQllcnIoU1RSVE9YWF9FWElUX0NPREUsICIlczogJyVzJyIsIGVycm1l
c2csIHN0cik7CisrCWlmICh1bF9zdHJ0b3M2NChzdHIsICZudW0sIDEwKSAhPSAwKSB7CisrCQlp
ZiAoZXJybm8gPT0gRVJBTkdFKQorKwkJCWVycihTVFJUT1hYX0VYSVRfQ09ERSwgIiVzOiAnJXMn
IiwgZXJybWVzZywgc3RyKTsKKysKKysJCWVycngoU1RSVE9YWF9FWElUX0NPREUsICIlczogJyVz
JyIsIGVycm1lc2csIHN0cik7CisgCX0KKyAJcmV0dXJuIG51bTsKKyB9CisgCistdWludDE2X3Qg
c3RydG91MTZfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZykKKyt1
aW50NjRfdCBzdHJ0b3U2NF9vcl9lcnIoY29uc3QgY2hhciAqc3RyLCBjb25zdCBjaGFyICplcnJt
ZXNnKQorIHsKKy0JcmV0dXJuIF9zdHJ0b3UxNl9vcl9lcnIoc3RyLCBlcnJtZXNnLCAxMCk7Cisr
CXVpbnQ2NF90IG51bSA9IDA7CisrCisrCWlmICh1bF9zdHJ0b3U2NChzdHIsICZudW0sIDEwKSkg
eworKwkJaWYgKGVycm5vID09IEVSQU5HRSkKKysJCQllcnIoU1RSVE9YWF9FWElUX0NPREUsICIl
czogJyVzJyIsIGVycm1lc2csIHN0cik7CisrCisrCQllcnJ4KFNUUlRPWFhfRVhJVF9DT0RFLCAi
JXM6ICclcyciLCBlcnJtZXNnLCBzdHIpOworKwl9CisrCXJldHVybiBudW07CisgfQorIAorLXVp
bnQxNl90IHN0cnRveDE2X29yX2Vycihjb25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIgKmVycm1l
c2cpCisrdWludDY0X3Qgc3RydG94NjRfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hh
ciAqZXJybWVzZykKKyB7CistCXJldHVybiBfc3RydG91MTZfb3JfZXJyKHN0ciwgZXJybWVzZywg
MTYpOworKwl1aW50NjRfdCBudW0gPSAwOworKworKwlpZiAodWxfc3RydG91NjQoc3RyLCAmbnVt
LCAxNikpIHsKKysJCWlmIChlcnJubyA9PSBFUkFOR0UpCisrCQkJZXJyKFNUUlRPWFhfRVhJVF9D
T0RFLCAiJXM6ICclcyciLCBlcnJtZXNnLCBzdHIpOworKworKwkJZXJyeChTVFJUT1hYX0VYSVRf
Q09ERSwgIiVzOiAnJXMnIiwgZXJybWVzZywgc3RyKTsKKysJfQorKwlyZXR1cm4gbnVtOworIH0K
KyAKKyBpbnQzMl90IHN0cnRvczMyX29yX2Vycihjb25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIg
KmVycm1lc2cpCitAQCAtMzY1LDkgKzQwNiw5IEBAIGludDMyX3Qgc3RydG9zMzJfb3JfZXJyKGNv
bnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZykKKyAJcmV0dXJuIG51bTsKKyB9Cisg
Cistc3RhdGljIHVpbnQzMl90IF9zdHJ0b3UzMl9vcl9lcnIoY29uc3QgY2hhciAqc3RyLCBjb25z
dCBjaGFyICplcnJtZXNnLCBpbnQgYmFzZSkKKyt1aW50MzJfdCBzdHJ0b3UzMl9vcl9lcnIoY29u
c3QgY2hhciAqc3RyLCBjb25zdCBjaGFyICplcnJtZXNnKQorIHsKKy0JdWludDY0X3QgbnVtID0g
X3N0cnRvdTY0X29yX2VycihzdHIsIGVycm1lc2csIGJhc2UpOworKwl1aW50NjRfdCBudW0gPSBz
dHJ0b3U2NF9vcl9lcnIoc3RyLCBlcnJtZXNnKTsKKyAKKyAJaWYgKG51bSA+IFVJTlQzMl9NQVgp
IHsKKyAJCWVycm5vID0gRVJBTkdFOworQEAgLTM3Niw2NiArNDE3LDQ4IEBAIHN0YXRpYyB1aW50
MzJfdCBfc3RydG91MzJfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVz
ZywgaW50IGJhc2UpCisgCXJldHVybiBudW07CisgfQorIAorLXVpbnQzMl90IHN0cnRvdTMyX29y
X2Vycihjb25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIgKmVycm1lc2cpCisteworLQlyZXR1cm4g
X3N0cnRvdTMyX29yX2VycihzdHIsIGVycm1lc2csIDEwKTsKKy19CistCisgdWludDMyX3Qgc3Ry
dG94MzJfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZykKKyB7Cist
CXJldHVybiBfc3RydG91MzJfb3JfZXJyKHN0ciwgZXJybWVzZywgMTYpOworKwl1aW50NjRfdCBu
dW0gPSBzdHJ0b3g2NF9vcl9lcnIoc3RyLCBlcnJtZXNnKTsKKysKKysJaWYgKG51bSA+IFVJTlQz
Ml9NQVgpIHsKKysJCWVycm5vID0gRVJBTkdFOworKwkJZXJyKFNUUlRPWFhfRVhJVF9DT0RFLCAi
JXM6ICclcyciLCBlcnJtZXNnLCBzdHIpOworKwl9CisrCXJldHVybiBudW07CisgfQorIAorLWlu
dDY0X3Qgc3RydG9zNjRfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVz
ZykKKytpbnQxNl90IHN0cnRvczE2X29yX2Vycihjb25zdCBjaGFyICpzdHIsIGNvbnN0IGNoYXIg
KmVycm1lc2cpCisgeworLQlpbnQ2NF90IG51bTsKKy0JY2hhciAqZW5kID0gTlVMTDsKKy0KKy0J
ZXJybm8gPSAwOworLQlpZiAoc3RyID09IE5VTEwgfHwgKnN0ciA9PSAnXDAnKQorLQkJZ290byBl
cnI7CistCW51bSA9IHN0cnRvaW1heChzdHIsICZlbmQsIDEwKTsKKy0KKy0JaWYgKGVycm5vIHx8
IHN0ciA9PSBlbmQgfHwgKGVuZCAmJiAqZW5kKSkKKy0JCWdvdG8gZXJyOworKwlpbnQ2NF90IG51
bSA9IHN0cnRvczY0X29yX2VycihzdHIsIGVycm1lc2cpOworIAorLQlyZXR1cm4gbnVtOworLWVy
cjoKKy0JaWYgKGVycm5vID09IEVSQU5HRSkKKysJaWYgKG51bSA8IElOVDE2X01JTiB8fCBudW0g
PiBJTlQxNl9NQVgpIHsKKysJCWVycm5vID0gRVJBTkdFOworIAkJZXJyKFNUUlRPWFhfRVhJVF9D
T0RFLCAiJXM6ICclcyciLCBlcnJtZXNnLCBzdHIpOworLQorLQllcnJ4KFNUUlRPWFhfRVhJVF9D
T0RFLCAiJXM6ICclcyciLCBlcnJtZXNnLCBzdHIpOworKwl9CisrCXJldHVybiBudW07CisgfQor
IAorLXN0YXRpYyB1aW50NjRfdCBfc3RydG91NjRfb3JfZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29u
c3QgY2hhciAqZXJybWVzZywgaW50IGJhc2UpCisrdWludDE2X3Qgc3RydG91MTZfb3JfZXJyKGNv
bnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZykKKyB7CistCXVpbnRtYXhfdCBudW07
CistCWNoYXIgKmVuZCA9IE5VTEw7CistCistCWVycm5vID0gMDsKKy0JaWYgKHN0ciA9PSBOVUxM
IHx8ICpzdHIgPT0gJ1wwJykKKy0JCWdvdG8gZXJyOworLQludW0gPSBzdHJ0b3VtYXgoc3RyLCAm
ZW5kLCBiYXNlKTsKKy0KKy0JaWYgKGVycm5vIHx8IHN0ciA9PSBlbmQgfHwgKGVuZCAmJiAqZW5k
KSkKKy0JCWdvdG8gZXJyOworKwl1aW50NjRfdCBudW0gPSBzdHJ0b3U2NF9vcl9lcnIoc3RyLCBl
cnJtZXNnKTsKKyAKKy0JcmV0dXJuIG51bTsKKy1lcnI6CistCWlmIChlcnJubyA9PSBFUkFOR0Up
CisrCWlmIChudW0gPiBVSU5UMTZfTUFYKSB7CisrCQllcnJubyA9IEVSQU5HRTsKKyAJCWVycihT
VFJUT1hYX0VYSVRfQ09ERSwgIiVzOiAnJXMnIiwgZXJybWVzZywgc3RyKTsKKy0KKy0JZXJyeChT
VFJUT1hYX0VYSVRfQ09ERSwgIiVzOiAnJXMnIiwgZXJybWVzZywgc3RyKTsKKysJfQorKwlyZXR1
cm4gbnVtOworIH0KKyAKKy11aW50NjRfdCBzdHJ0b3U2NF9vcl9lcnIoY29uc3QgY2hhciAqc3Ry
LCBjb25zdCBjaGFyICplcnJtZXNnKQorK3VpbnQxNl90IHN0cnRveDE2X29yX2Vycihjb25zdCBj
aGFyICpzdHIsIGNvbnN0IGNoYXIgKmVycm1lc2cpCisgeworLQlyZXR1cm4gX3N0cnRvdTY0X29y
X2VycihzdHIsIGVycm1lc2csIDEwKTsKKy19CisrCXVpbnQ2NF90IG51bSA9IHN0cnRveDY0X29y
X2VycihzdHIsIGVycm1lc2cpOworIAorLXVpbnQ2NF90IHN0cnRveDY0X29yX2Vycihjb25zdCBj
aGFyICpzdHIsIGNvbnN0IGNoYXIgKmVycm1lc2cpCisteworLQlyZXR1cm4gX3N0cnRvdTY0X29y
X2VycihzdHIsIGVycm1lc2csIDE2KTsKKysJaWYgKG51bSA+IFVJTlQxNl9NQVgpIHsKKysJCWVy
cm5vID0gRVJBTkdFOworKwkJZXJyKFNUUlRPWFhfRVhJVF9DT0RFLCAiJXM6ICclcyciLCBlcnJt
ZXNnLCBzdHIpOworKwl9CisrCXJldHVybiBudW07CisgfQorIAorIGRvdWJsZSBzdHJ0b2Rfb3Jf
ZXJyKGNvbnN0IGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZXJybWVzZykKK0BAIC0xMDUxLDE1ICsx
MDUxLDI1IEBAIHN0YXRpYyBpbnQgdGVzdF9zdHJ1dGlsc19jbXBfcGF0aHMoaW50IGEKKyAKKyBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorIHsKKy0JaWYgKGFyZ2MgPT0gMyAmJiBz
dHJjbXAoYXJndlsxXSwgIi0tc2l6ZSIpID09IDApCisrCWlmIChhcmdjID09IDMgJiYgc3RyY21w
KGFyZ3ZbMV0sICItLXNpemUiKSA9PSAwKSB7CisgCQlyZXR1cm4gdGVzdF9zdHJ1dGlsc19zaXpl
cyhhcmdjIC0gMSwgYXJndiArIDEpOworIAorLQllbHNlIGlmIChhcmdjID09IDQgJiYgc3RyY21w
KGFyZ3ZbMV0sICItLWNtcC1wYXRocyIpID09IDApCisrCX0gZWxzZSBpZiAoYXJnYyA9PSA0ICYm
IHN0cmNtcChhcmd2WzFdLCAiLS1jbXAtcGF0aHMiKSA9PSAwKSB7CisgCQlyZXR1cm4gdGVzdF9z
dHJ1dGlsc19jbXBfcGF0aHMoYXJnYyAtIDEsIGFyZ3YgKyAxKTsKKyAKKysJfSBlbHNlIGlmIChh
cmdjID09IDMgJiYgc3RyY21wKGFyZ3ZbMV0sICItLXN0cjJudW0iKSA9PSAwKSB7CisrICAgICAg
ICAJdWludDY0X3QgbjsKKysKKysgICAgICAgIAlpZiAodWxfc3RydG91NjQoYXJndlsyXSwgJm4s
IDEwKSA9PSAwKSB7CisrICAgICAgICAgICAgICAgIAlwcmludGYoIiclcycgLS0+ICVqdVxuIiwg
YXJndlsyXSwgKHVpbnRtYXhfdCkgbik7CisrICAgICAgICAgICAgICAgIAlyZXR1cm4gRVhJVF9T
VUNDRVNTOworKyAgICAgICAgCX0KKysJfQorKworIAllbHNlIHsKKyAJCWZwcmludGYoc3RkZXJy
LCAidXNhZ2U6ICUxJHMgLS1zaXplIDxudW1iZXI+W3N1ZmZpeF1cbiIKKy0JCQkJIiAgICAgICAl
MSRzIC0tY21wLXBhdGhzIDxwYXRoPiA8cGF0aD5cbiIsCisrCQkJCSIgICAgICAgJTEkcyAtLWNt
cC1wYXRocyA8cGF0aD4gPHBhdGg+XG4iCisrCQkJCSIgICAgICAgJTEkcyAtLW51bTJudW0gPHN0
cj5cbiIsCisgCQkJCWFyZ3ZbMF0pOworIAkJZXhpdChFWElUX0ZBSUxVUkUpOworIAl9CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi4zNS4xLmJi
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuMzUuMS5iYgppbmRl
eCA3MzFmMDYxOGViLi45NmQ1ZWNhNTE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXhfMi4zNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eF8yLjM1LjEuYmIKQEAgLTEyLDYgKzEyLDkgQEAgU1JDX1VSSSAr
PSAiZmlsZTovL2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWtpbGwtaW5jbHVkZS1zeXMtdHlwZXMuaC1iZWZvcmUtY2hlY2tpbmctU1lTX3BpZGZkX3Mu
cGF0Y2ggXAogICAgICAgICAgICAgZmlsZTovLzAwMDEtaW5jbHVkZS1jbGVhbnVwLXBpZGZkLWlu
Y2t1ZGVzLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMS0zNzYwMC5wYXRjaCBc
CisgICAgICAgICAgICBmaWxlOi8vaW5jbHVkZS1zdHJ1dGlscy1jbGVhbnVwLXN0cnRvLWZ1bmN0
aW9ucy5wYXRjaCBcCisgICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtMzk5NS5wYXRjaCBcCisg
ICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtMzk5Ni5wYXRjaCBcCiAiCiBTUkNfVVJJW21kNXN1
bV0gPSAiN2Y2NDg4MmY2MzEyMjVmMDI5NWNhMDUwODBjZWUxYmYiCiBTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDlkZTNlZGQyODczNjZjZDkwOGU3NzY3NzUxNGI5Mzg3YjIyYmM3Yjg4ZjQ1YjgzZTE5
MjJjMzU5N2YxZDdmOSIKLS0gCjIuMTcuMQoK

--_006_MA0PR01MB7378CBEBD17291564E58BED98F229MA0PR01MB7378INDP_--

