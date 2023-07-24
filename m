Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F97AEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 18:46:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.44])
 by mx.groups.io with SMTP id smtpd.web11.2516.1690224403754419691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 11:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=IxDme3Um;
 spf=pass (domain: welotec.com, ip: 40.107.8.44, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDsR/lnYfKzMu/rHXgFcIxtwVmujiBzEu+eCmzr6Od8zbNSZPlFWCqy2RgCda7o2s3NXNJ5aKUMDo2fn3BIOjlHbcHGgdWHZDD8mA8GUc/sSywC5PEpSVqga+TRneNk8an441VFIy41hwO3Qw/dQTu5duayAMyACA4FmZDJS38uv7/fxB+m8Hq+LaQ7qVownXb+wlQOUg0YWxEbI7PKC0da08H8W1YOuPFrNTAdebLx2F5kdJeFBCfyVFiCVjrMYKtWM9FMMgJsSTJPnAWbi1BcEopZkzUatxUkzPK/zkwFVfYbYV3zJIj5S1b2HHaXfmCNUlOYwsj04GPp7D6i+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGU+hWiCOZsZ7MW1a1OqFnTY+FuoWkliyLUSYSRt6+w=;
 b=PyhjnG1cSPkMtlEQIGFALX2W2Zdcrnkqite9orOWv/PvGhKM5CTVNoo+MLDZb/b3GqLileNjif3vS5F9TqY7T3tOPL49GkLflLe9gCairdCPHYPNj31LQtxdWWdnCH1AgynhYVFBGtfmjfK0SU3ufai5yXQKRDRmFdn/BRXjW9CSY1wAY7axhaHGCVXfGQfxsZscZ23B+RAjZv+bKHwAAWP9jHEOUQW4cckDk42/pU2xtJn/wjMLaHwqXW4I8fxrXtlgMivKVS3tdQ719tWO+q+qFdroAfJ1QIVaUac7deOX51wbzBLb/qgCdjECzIJ8BFFdJ337HUvzdpWPsaJaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGU+hWiCOZsZ7MW1a1OqFnTY+FuoWkliyLUSYSRt6+w=;
 b=IxDme3UmOoSnUjq6uaCMCGlOm9TlhLwcRg3lNq7QhSDdYgwIOK2OnQKMhhG9YxtkS9XhdVqhHvchhuSqKIWoJPujNAz+cPrSIaPyCuwGN0MxMCe38+8s5Sg+hFWdQzUZV7WQEFX1IfsndfdfJxje3PDp3F17DbJdG3YPk/3rS0Q=
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM9PR04MB8421.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 18:46:40 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 18:46:40 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZvkq6BTfQ5MLlqUOJ3kl6p3S0F6/JGQtxgAAoAzw=
Date: Mon, 24 Jul 2023 18:46:40 +0000
Message-ID: 
 <AM6PR04MB536840899157FAB06EE656E09102A@AM6PR04MB5368.eurprd04.prod.outlook.com>
References: <20230724162007.3701193-1-p.lobacz@welotec.com>
 <1774DA7525950C99.4774@lists.openembedded.org>
In-Reply-To: <1774DA7525950C99.4774@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5368:EE_|AM9PR04MB8421:EE_
x-ms-office365-filtering-correlation-id: 21d389df-0104-48ee-9543-08db8c76515f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +qzRW6M24ELlWRqpSzgEDbBWfr0ixuXUVA8PambswpDnoncUaRD3fObgBwmqZOWAWNMSW6cMTo0dvzMVLdDHKaLNonkPq/dquJesSIuYX77p9W4/eKKYHNuPnxdtdCcTddXrVhB/r3cW1u3kyXH/eSp9VwZ9Xb29WWyuB5vmtjt40bpSIuXO02guBki/+EQncvZIgZHxIihRFu5YSmK/p+y93crrSP140aep8zlXOMnvrZAtbyZHF4nmRjdN4CwGO7ot8O2h+bFl2z3DjUI3j+H/pjDBeuJPjjdxNkHRaFhgwhrNTPKrh9VE+Dmc3nMHTrU3xDgauNFL38d3bQ+VcVXgDW5THSmO4CVI+1Wnmi8acfgQi1fL9q0kx9iCV3r21EM3cynkwYNIWCmQTNZ+PF4pidrGPIIEwYB30yOt1bzgBNQxlN+AfGi94uGLjrkrWba+qJKYroUktnHcv9f/GAF8S2yCHIUyMd2zdv9u9s5AxeOczhmNqb/JGlj4/VtRuIl0F5xhdSUhthJTOfkOKOjKwQb+07rXup2ekxxlB5ncYiDF+ggvG3qzl/FC77pq0F6RVVeGnS3PehA5rHyZwTrO90m66DdsRBqTNPa4HNk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(39840400004)(376002)(136003)(451199021)(38100700002)(122000001)(166002)(55016003)(66556008)(66574015)(83380400001)(8936002)(8676002)(5660300002)(52536014)(478600001)(66476007)(6916009)(66446008)(4326008)(64756008)(316002)(66946007)(76116006)(41300700001)(186003)(6506007)(71200400001)(45080400002)(2906002)(966005)(7696005)(9686003)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?bES09tq/I4+Vd75loCi/WUKpZhtDEzSt0GrzVQOn4eadqoFxnHPLS0cvHh?=
 =?iso-8859-2?Q?FYaEX27BlgQLh4lLmUM05sr345mI5WXaq1XuDFVmtWWG7VecVcFWCYz3w9?=
 =?iso-8859-2?Q?she+BxaV9MWkt/D9Tfea1nUxSHD3gQSC5rJn47EppwXIgrgOEYmfvpIfsH?=
 =?iso-8859-2?Q?VnB9YLhk4Mj918Wb3lwvZjB67XZoy86zgIfHVYgGFBOSqFz5IzHHniNkMY?=
 =?iso-8859-2?Q?9yOKd6G3KUCWubohWP/xY3kfV29lNovWepBxQs5pI0qd4seD5WzjI8f/em?=
 =?iso-8859-2?Q?dJ2sCBzX5LdbmGdvOLglRmlA3BPjqgsR5XaQ/c6gacaVcw1IvJB/5+QpeC?=
 =?iso-8859-2?Q?UDyf6CcUNJA8HTO74kaJU5kUy7H6Oudy0qItB1YKTrSAOtI2POjP7g47H8?=
 =?iso-8859-2?Q?WappEqFYUYXlVCJGbWKMni+99pcJ2aGoQA3Ere+3lEwAjRf/bJ7XqtyMko?=
 =?iso-8859-2?Q?gAtKZSrLUF52csSzN2GzTNeQpIR9HNGyvBYtkftxuPUbjr5bdOOG8o9wvj?=
 =?iso-8859-2?Q?U8t6G4ztGxB0+JHVyPqYKAq0W7LD+SJOQniTvbdTmVCjsNmICb16FKtCqn?=
 =?iso-8859-2?Q?RkEw2yURPrTBSZ9z+EnnYpCFahttbxhb9zGc0fwOb3obWl+idWNkyq6ARq?=
 =?iso-8859-2?Q?yBGAD9IpRZcAExZ3kIQPJ107m5BOJbCLekAF+Ss2W5GTBr3TToFLBg+cGN?=
 =?iso-8859-2?Q?8E84iAhzpI90UFvwFAwaExUlex1IXUUNvuqN2gGRxBnFXz64CZX+qMr/92?=
 =?iso-8859-2?Q?F9mfLH5bY+iqaSepUv4rArzJMIuewi5FBmfHhohNjaI4+DJRsPU7aDh5ci?=
 =?iso-8859-2?Q?OFSVjEXiA14Js0ZqfHIYfw81aq/RN2fuoNMkthpTPKWau7+cz0XuQYow7x?=
 =?iso-8859-2?Q?5webO2vxK/XUAcgrycHMrUfNkkA7hRWAr6cz91Hfu+dP3NZhikzVH1HHHQ?=
 =?iso-8859-2?Q?2SU5JLgO61w0JRB21CC2x4CLFUpz714/O07vGfMXjZh34GA4pPGJAHEx0C?=
 =?iso-8859-2?Q?N+MSZ649z/qMhyVaUC6/YEZkipoxgi2lQ1tRcyY4SbSoGtResyK3jL1mwm?=
 =?iso-8859-2?Q?edM1ZHxZF399fSnIRuz43hRgU6sofZ2nTzN4VKtDAmHJLpv/B/ELErRwN1?=
 =?iso-8859-2?Q?2LtKIUpIHdVRBsbMpj54+xSVJ4xL0zlINc6qVaO0WhoVqrppsA1A4C+W63?=
 =?iso-8859-2?Q?moqWWlA5aelaCrQipwJy55yevxRWOZemSJ/tMJmWWYF1v/+PA/EvzAVjFW?=
 =?iso-8859-2?Q?Ho8luSBar5g3Qhnkbmaz5lTStAdBntVCPW5rIShmHqn6DXZTW4lnIdVPz9?=
 =?iso-8859-2?Q?fbrb3/yfiSOIJsxYwYOQRgehwLvT9wLTXOibEsbCF+bK8Cv1IpQvZRkuPe?=
 =?iso-8859-2?Q?HNcncX9oQ6hVQKJk0S+J1b+Hortg+E/ZCWw5502tnQNBn30mrtqzYUYI8g?=
 =?iso-8859-2?Q?31c+MmQmjc13Wa3rd4S0LCnbG1MTJX3HaBFKFVX3ICs1TStvZ7voKnQcoe?=
 =?iso-8859-2?Q?q6rNiDRlYTxFu6YkOW7iqZSGQscZRadbr0H13ucsuOYJFv1FVyX+AZBGes?=
 =?iso-8859-2?Q?Jbi5gHRErWiGXudDsrYETMBazzCY8NNQYF9vTvihyeTO15T/YfbURppZt7?=
 =?iso-8859-2?Q?RHtVpe15ZYZu5dLkRUIXg3NYVYWOQrKfjDaYUrDa5IzrTQLENtWCtkKIh3?=
 =?iso-8859-2?Q?W7l8CQ8XB/CxJzh6RB6BgZmu+91uG4wmfkClDUXt8+qc36P2eA9ka6Cxk3?=
 =?iso-8859-2?Q?RFAA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM6PR04MB536840899157FAB06EE656E09102AAM6PR04MB5368eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d389df-0104-48ee-9543-08db8c76515f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 18:46:40.1886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++JJaIi9vif70ujvl+A8hCnO19usFn1HjChxa1ZAwhGLtgLCdVz+TuYSiiScd4bHaYLefxdlqLsHZcengCD0Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 18:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184804

--_000_AM6PR04MB536840899157FAB06EE656E09102AAM6PR04MB5368eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Ok after getting support from tar team I have it fixed, so if you can hold =
on with testing I will re-send next patchset with additional fixes for posi=
x as well.

BR
Piotr
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: Monday, July 24, 2023 6:25:53 PM
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
DW: alexandre.belloni@bootlin.com <alexandre.belloni@bootlin.com>
Temat: ODP: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add s=
upport for ACLs and xattr

Hi,
I have modified the patch for opkg-build to however have this gnu format, b=
ut only if acl and/or xattr features in DISTRO_FEATURES are removed,
meaning that now in your case packages will be generated without posix form=
at and the reproducible build will pass.

Unfortunately, the issue itself is for 99% in tar hosttool binary and I nee=
d to find it, which for you at this moment is unnecessary.

BR
Piotr

Od: Piotr =A3obacz <p.lobacz@welotec.com>
Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 18:20
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
DW: Piotr =A3obacz <p.lobacz@welotec.com>
Temat: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add suppor=
t for ACLs and xattr

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.=
google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%40w=
elotec.com%7C8341748ceb69442102c408db8c62aa12%7C25111a7f1d5a4c51a4ca7f8e440=
11b39%7C0%7C0%7C638258127645424803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
NpAOmSjca1VTDycL2TryVyacW%2FsuqRZJycHZ9OSDmU4%3D&reserved=3D0<https://group=
s.google.com/g/opkg-devel/c/dYNHrLjDwg8>
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"

 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'

 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--
2.34.1

--_000_AM6PR04MB536840899157FAB06EE656E09102AAM6PR04MB5368eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>
<div dir=3D"ltr">Ok after getting support from tar team I have it fixed, so=
 if you can hold on with testing I will re-send next patchset with addition=
al fixes for posix as well.</div>
</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> Monday, July 24, 2023 6:25:53 PM<br>
<b>Do:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>DW:</b> alexandre.belloni@bootlin.com &lt;alexandre.belloni@bootlin.com&=
gt;<br>
<b>Temat:</b> ODP: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass=
: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
I have modified the patch for opkg-build to however have this gnu format, b=
ut only if acl and/or xattr features in DISTRO_FEATURES are removed,<br>
meaning that now in your case packages will be generated without posix form=
at and the reproducible build will pass.<br>
<br>
Unfortunately, the issue itself is for 99% in tar hosttool binary and I nee=
d to find it, which for you at this moment is unnecessary.<br>
<br>
BR<br>
Piotr<br>
<br>
Od: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 18:20<br>
Do: openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.op=
enembedded.org&gt;<br>
DW: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
Temat: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add suppor=
t for ACLs and xattr
<br>
&nbsp;<br>
Extend OPKGBUILDCMD variable, with additional parameters, depending<br>
on target distro features, in order to support ACLs and xattr.<br>
<br>
With fix pushed to the opkg-devel:<br>
<a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8">https://eu=
r04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com=
%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz%40welotec=
.com%7C8341748ceb69442102c408db8c62aa12%7C25111a7f1d5a4c51a4ca7f8e44011b39%=
7C0%7C0%7C638258127645424803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DNp=
AOmSjca1VTDycL2TryVyacW%2FsuqRZJycHZ9OSDmU4%3D&amp;reserved=3D0</a><br>
opkg-build is able to create tar archives with ACLs and xattr.<br>
<br>
Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
---<br>
&nbsp;meta/classes-global/package_ipk.bbclass | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass<br>
index b4b7bc9ac2..a0f106e4ad 100644<br>
--- a/meta/classes-global/package_ipk.bbclass<br>
+++ b/meta/classes-global/package_ipk.bbclass<br>
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-target.=
conf&quot;<br>
&nbsp;PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&nbsp;<br>
&nbsp;# Program to be used to build opkg packages<br>
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot;'<br>
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; ${@bb.u=
tils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains(=
'DISTRO_FEATURES', 'xattr', '-X', '', d)}'<br>
&nbsp;<br>
&nbsp;OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-version&quo=
t;<br>
&nbsp;OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.getVar(&quo=
t;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
-- <br>
2.34.1<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR04MB536840899157FAB06EE656E09102AAM6PR04MB5368eurp_--

