Return-Path: <ccasciato@21sw.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9B4C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 22:51:22 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.97])
 by mx.groups.io with SMTP id smtpd.web11.313.1718319077633138545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 15:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@21sw.us header.s=selector1 header.b=hagVgoq7;
 spf=pass (domain: 21sw.us, ip: 40.107.237.97, mailfrom: ccasciato@21sw.us)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxgXBiI8uigc2DCaY1LKtbz/rTHUpL8//I+wZkyxWbI29N35mxX7IdBYKmNKNdwZpfqBbf4e/O3MC6Y/hriNVzV8RhmJrxvctWuhFHwiiGMRFt4K++gC6i159sWAq71W68mwAHbZEVrCBe3CiFpkpJCWo706xWhUiUI1Ei/3+viSPFNG9iZCc4T76AEd0wIrrRpWxiCNDf/CxgoXI31wGFaCDg1jSbUGnr5DIJDvUcliKHT1caKsNUVnvi7ot9IbFkD/5rQ3/kTo36K319wu5h5+FnqtdbgIx2ptZuJ7KYzF9W/8oskrotDRSjo+hxbn+aXUe9VC43g0505m8XfyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+SI6Bbk9Zh7k7uGLor4gnN3s4/q3UPyKM+PVdzKgBE=;
 b=K+rH0HTUY5w0ZnIZE0C4eQim9PeQjcdTbY8m9RtvUWkCw3qqqUxuSfvzDvahkyyayqaMhMJ6igBXShEkpJUYgrqk07y7r4j72U23OX/ViGRki6vRqXkwuix6qR7LMuzSb6ZbxQFAxPgdRmXwJCds+Gxuio+NyCo8Sfv+RaYOMSp5L1PjTmSJWljyDPUgdUYEK3SmqzHA6V92Zv8dazsWU2UEdvEImpGZrL8BjkP6JFwZUq41lLl668RlaS+L64my4ZXAO+P0BKbZphpjmmxwZbVrzhjxhhrNNPKrJ1QEgL1zbxkbwZSiTUY7huSlUz+vXgKOV3zFY1tz+ognVtievQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=21sw.us; dmarc=pass action=none header.from=21sw.us; dkim=pass
 header.d=21sw.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=21sw.us; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+SI6Bbk9Zh7k7uGLor4gnN3s4/q3UPyKM+PVdzKgBE=;
 b=hagVgoq7wYriwdEGmZEWlnDi04FSLU0DJV6vp90vV20yflvxJG9YcnadTApRzW8F9+2pJzN9JSGrf1bQyIK15mL8ppIVRPvLU3vbSu6JQcLUTiOoCN3okwC6uBNZcR5yZ78ExWbHXl14irJlFlcp+SZB9opUl53MNtfqQlB/E0ojLBpYG44y+r4HhP5YmrWjnKGjkflXGy6WoLzDNYnWoceuI0YH7CfngRw1dlze6p8b8UxzeVgJaCq25GNZhfXPe+s14/372TqGtPhjWKQqa5oq5V9NVW6WQlZiA9HfMPkFrkZjH34ICa/3hu1wLEYp7UUJav0QmuLuEJn8lV0pgw==
Received: from BY5PR22MB1761.namprd22.prod.outlook.com (2603:10b6:a03:21c::21)
 by EA2PR22MB5054.namprd22.prod.outlook.com (2603:10b6:303:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 13 Jun
 2024 22:51:14 +0000
Received: from BY5PR22MB1761.namprd22.prod.outlook.com
 ([fe80::f9d1:8fb:9ce:3fa6]) by BY5PR22MB1761.namprd22.prod.outlook.com
 ([fe80::f9d1:8fb:9ce:3fa6%4]) with mapi id 15.20.7677.021; Thu, 13 Jun 2024
 22:51:13 +0000
From: Clayton Casciato <ccasciato@21sw.us>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: gnupg CVE-2022-3515 #kirkstone
Thread-Topic: gnupg CVE-2022-3515 #kirkstone
Thread-Index: AQHaveCdTj8TIpieBkqwXe+EzCBOkA==
Date: Thu, 13 Jun 2024 22:51:13 +0000
Message-ID: 
 <BY5PR22MB176117D8743C536E8A1C85DAB7C12@BY5PR22MB1761.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=21sw.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR22MB1761:EE_|EA2PR22MB5054:EE_
x-ms-office365-filtering-correlation-id: debe6f53-efd0-4002-4820-08dc8bfb53aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230035|376009|1800799019|366011|38070700013|80162016;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?1p7goFvyp4vGXYcBpF8VDSeLllnDdBz5zEZQbRgRYZugTWa+V7RKsEwpAV?=
 =?iso-8859-1?Q?4eOwYnGQVbRQvNhUIMsya7/c4zUnHzU8OnLt/EfcRkU3ZDl76W96WXxGoM?=
 =?iso-8859-1?Q?LpnOmCYusAgo0oIz1BP+pEI3HQsgNOpH/qwiumoOA0Y8v/3Ke9mHjFNWBK?=
 =?iso-8859-1?Q?DVSw3L/iWkFDLrhJihYnzA3BVCEMIMIPOBa6TVBvJTg5RQquD/mEZGcM5l?=
 =?iso-8859-1?Q?aFPyvztNA6QLW/sWbDHgqxRpuCtH46bgGEttTG6g7HeUqVKhVHluGv3fg5?=
 =?iso-8859-1?Q?V0PCZwB+jIgzn38PNjyJ4wVYK5mfd2THBAPYF+r89sTskN/Gs8AhnEQIwd?=
 =?iso-8859-1?Q?YCsEkeHXHLivndsHQ0v+iRhjzRbbL6CooSI0+rs/p1P3TosCbePlatf8nh?=
 =?iso-8859-1?Q?6EkbMHnJL6GauqA2u4w8MHkaoz3+q/GQm9+y9UGxuhV7WXSPxHKxbnc4LQ?=
 =?iso-8859-1?Q?bzTCYPx5eub2OzFJiira8psBik/rbkFapsJac4AmKbvj7MDNz07gW/ZWhz?=
 =?iso-8859-1?Q?95Sji1RHrrH8Fz/ZVSxR/5/sJ4V+j8ND+HXP5MejwQa2O5+MnYb/Kn5HDn?=
 =?iso-8859-1?Q?NcswoV9SUQglNMuF7augUNgDDLgfrRqyPAsXswxknllsw4FyCMpfVaSmWk?=
 =?iso-8859-1?Q?gm8/IL2UbBF85hpRMc7wBggbRXaNHAXr8JoY8HKAjlMRKP40BMG6uJWPeO?=
 =?iso-8859-1?Q?3ij89MQxe4K/uoZ/wGjCd3RBtH0WVHaK0bHVXaCFf65opD7ieVuzlGfnRK?=
 =?iso-8859-1?Q?DSp1/Gq2UA4Zb4/bAF6gXaZ0Zpa5G0vTNiIc1PHDrEzxhlImBeIWSz/Sbp?=
 =?iso-8859-1?Q?ZLtZuIl4fUbUuuMByZbWHg1Pnua1TF/XekXnsVVnKCt1oeaui2nj08jf8Y?=
 =?iso-8859-1?Q?cCF8cTtKO8EdXZrBa9ZqnhvmuuDHw80ZmU/Seag99qdU21HtyXZp3iTaNi?=
 =?iso-8859-1?Q?MHExRzv1j3czwk6nByNatzeZJpoyxlO7JynvEta5YUq3ST0iO39/YvWeM7?=
 =?iso-8859-1?Q?sKqpTG8RS/dzBYhqkXEpxrCBdUhMDGpS3YA9g9sDkix1Zu8G3Q3E2YxkxH?=
 =?iso-8859-1?Q?Aunidl5Qez/TsUpPvB4i56oDGLw2ChbMgkVGP1fgEuMxeENBq3O/uUdIUp?=
 =?iso-8859-1?Q?ccUxXPZajgkBVIOYJY0UYiqoQfoweL4DDs1mVIUhB2BChuNmlIH25UYUcg?=
 =?iso-8859-1?Q?UXecBN0DrVK7m5o6nEi8l9YQ51G7WMp8Kf6n26dmrNa5tlOLyu3Klx1kQp?=
 =?iso-8859-1?Q?Z1GUoa8yoLH/1fOQ5G2aHQ5RMsk+Zf7E7my9OzoS43sGgQizC3jWMvp9L4?=
 =?iso-8859-1?Q?tChdhxqr83Tduccex51CmHjIhSPUAHa5fDLlulppMy3IwbJsjD4OVRGu8z?=
 =?iso-8859-1?Q?MPyFI2ZTV1zs0OdORYjLK8ZytZD1IUuQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR22MB1761.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011)(38070700013)(80162016);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CdPKmw2UTzEDwpn1mLkAdRbTsqZ0fxbN/6a2A0dYYVyEiB+Oha2eoUzUZf?=
 =?iso-8859-1?Q?aEL+iEXQ78R6g4GK7e8dbf4txcqBI5V+Vb4bRBzWwJZif4JB22Zy+GG1+m?=
 =?iso-8859-1?Q?Cq8uKklhLAKswJ5SZRZv5QjE4hWGbkpQiGrzpokKv4gPCWBBtl1PtfDkje?=
 =?iso-8859-1?Q?XqmG1suHas3T3URZzILOZtQLnfQD9Z43G4c53iYFIsHW0jTDrBJtlVkSev?=
 =?iso-8859-1?Q?uV0IHGW7o+X9RdzfEb/V+yaxPiRfAZT5I2kxvopUHW2+f9p1KweOAwllHX?=
 =?iso-8859-1?Q?NW5WxomFdQLGhC4pmWR7jco82GHumiUyq1Rhi/Po9Hh9WV9KkVDTKU2z2c?=
 =?iso-8859-1?Q?YApQTxF0YiTXlA6t6cGvazsrmDWmcmszXh08uUQIA5lIXSpcBrksHy0AYz?=
 =?iso-8859-1?Q?DCqsLqAAAR6S8xqTI89LfFBUg/FQZQ1uT55Z0CXLwTaOS7X8taueUAimrb?=
 =?iso-8859-1?Q?xGAXGg4SRXwsiShfcvle9AXNlibtnLNpx6axp8OU4uKFW/Z2COTPZKB9da?=
 =?iso-8859-1?Q?wP6+40pM2JwFtBxqtwJ6rzywaDE7qzdbr72Jem5ZUIGg5lAmZBHrZkAh9j?=
 =?iso-8859-1?Q?vIB7cQa6l6Z0uc3fnLoC8eoYcdEoaMlgn2uH/SXMLMF1qceSkvPxv2dgbm?=
 =?iso-8859-1?Q?2VCso+gOceHelFPHqdYjPLzGm2X64/mWdJ8veCLzE3bVKkN3zt/KcDwaMU?=
 =?iso-8859-1?Q?e635Py2kcaCesX3w6ve6sQq3nvCWQPjJ0mWxwF6BchePDIl6BmBrrtFuNY?=
 =?iso-8859-1?Q?eJdHP1xSV7qifdQy1drqWGVeGzT8RXY/jZDG/oS6FvuvzTa/8BhIa8j4J4?=
 =?iso-8859-1?Q?LjAcEgqKpB2/iu+AogVTHFQXcEKA5mtLvXVVcJ79bN9Nb6yQtG+EPU9BvH?=
 =?iso-8859-1?Q?1CRP/V4XXSgzbdyqJYPUh6HQNa2+qV1OGhnqOYp0HnsUdNTBjwk3ThjRX0?=
 =?iso-8859-1?Q?26crjC55PcIAGUhxcDImGpU78hXil40ax9542hG1bp+Bh+h1l+CX+nCZQU?=
 =?iso-8859-1?Q?mdbl8zj26y0RLdwo9t2657Mknbq4igvU0MLYZRhhzX1lQDjZ84NsbBXhaf?=
 =?iso-8859-1?Q?LThr55lHZnIIY0Fc62buZVRzz2Znz4ndenTMjyA8eJnTAMVatjkrkSn1S8?=
 =?iso-8859-1?Q?S/6q5reP9aiPJ7PTb/E7QTuZSoT2nLkfVVpQIckMlQV2h7r4Nzsrwto5FH?=
 =?iso-8859-1?Q?Oi6+wlSPLCwVQFqXDpezhglT+a1c8Bo/xsdn7C7aA5YodgJ40W3mxRh6/M?=
 =?iso-8859-1?Q?4plF8420/DiDgqhFi38Jm+vMe8jvKId52DwnPLrr9b2Ieoo5K9BvP1CwGQ?=
 =?iso-8859-1?Q?qLAl8UwjEiqKurosNWhE0NdrMVgtefR2F7ExfUChFp9Rn2wRFogffpq66Q?=
 =?iso-8859-1?Q?Wi5HWoUm1sOyDgf2gAddCrPnuyZDLHFwsvSjZ71xXuBftU/qt8+Gkqpg2l?=
 =?iso-8859-1?Q?/FhxDhjSgXe+oaQNtXdRiIB4rL7MNvf4MnNAAilYtQQBaVdzkJDjKyVEmu?=
 =?iso-8859-1?Q?tEgxJgS4EmSHR1ZjR0pbKiVjkJ/TF+D3UTHt36ioCT570W8vwktmMHuDB0?=
 =?iso-8859-1?Q?WDFwNEFU80vDbO/i5LKpgA/tiJLG7KHbWGFbCnVrXk1wZ4ZJT0J2cd6q82?=
 =?iso-8859-1?Q?8bc5EksYh6TA4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY5PR22MB176117D8743C536E8A1C85DAB7C12BY5PR22MB1761namp_"
MIME-Version: 1.0
X-OriginatorOrg: 21sw.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR22MB1761.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debe6f53-efd0-4002-4820-08dc8bfb53aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 22:51:13.6066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4ac144-0fc5-4d2d-b796-d7cf051f555a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6Y9uchT+S8qpxQDg9EzRFJ1yfZk8BI9qCVQMRlUruggyqKM3tHQGCzZaDk2ptqBZq6ZJvD1HTwpp+N7AP7Xfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 22:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200642

--_000_BY5PR22MB176117D8743C536E8A1C85DAB7C12BY5PR22MB1761namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello!

"OE-core CVE metrics for kirkstone on Sun 09 Jun 2024 02:00:01 AM HST" repo=
rts CVE-2022-3515<https://nvd.nist.gov/vuln/detail/CVE-2022-3515> as "unpat=
ched", as do local builds with "cve-check".

NIST lists GnuPG as vulnerable from 2.3.0 to 2.4.0, which is why this is re=
ported as a CVE.

This vulnerability was fixed in Libksba 1.6.2 (upstream issue<https://dev.g=
nupg.org/T6230>, upstream patch<https://dev.gnupg.org/rK4b7d9cd4a018898d771=
4ce06f3faf2626c14582b>).

meta/recipes-support/gnupg/gnupg_2.3.7.bb<https://git.openembedded.org/open=
embedded-core/tree/meta/recipes-support/gnupg/gnupg_2.3.7.bb?h=3Dkirkstone>=
 DEPENDS libksba

meta/recipes-support/libksba/libksba_1.6.4.bb<https://git.openembedded.org/=
openembedded-core/tree/meta/recipes-support/libksba/libksba_1.6.4.bb?h=3Dki=
rkstone>

I manually verified the upstream patch exists in the fetched libksba-1.6.4.=
tar.bz2.
$ sed -n '185,190p' libksba-1.6.4/src/ber-help.c

Should this CVE be added to meta/conf/distro/include/cve-extra-exclusions.i=
nc?

Thank you!

NB: This is my first time interacting.
Please feel free to provide additional feedback such as typical processes o=
r procedures.

--
Clayton Casciato

--_000_BY5PR22MB176117D8743C536E8A1C85DAB7C12BY5PR22MB1761namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&quot;OE-core CVE metrics for kirkstone on Sun 09 Jun 2024 02:00:01 AM HST&=
quot; reports <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-3515" id=
=3D"LPlnk184553" class=3D"OWAAutoLink" title=3D"https://nvd.nist.gov/vuln/d=
etail/CVE-2022-3515">
CVE-2022-3515</a>&nbsp;as &quot;unpatched&quot;, as do local builds with &q=
uot;cve-check&quot;.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
NIST lists GnuPG as vulnerable from 2.3.0 to 2.4.0, which is why this is re=
ported as a CVE.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This vulnerability was fixed in Libksba 1.6.2 (<a href=3D"https://dev.gnupg=
.org/T6230" id=3D"LPlnk274212" class=3D"OWAAutoLink" title=3D"https://dev.g=
nupg.org/T6230">upstream issue</a>,
<a href=3D"https://dev.gnupg.org/rK4b7d9cd4a018898d7714ce06f3faf2626c14582b=
" id=3D"LPlnk767851" class=3D"OWAAutoLink" title=3D"https://dev.gnupg.org/r=
K4b7d9cd4a018898d7714ce06f3faf2626c14582b">
upstream patch</a>).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-support/gnupg/gnupg_2.3.7.bb?h=3Dkirkstone" id=3D"LPlnk337654" class=3D"OW=
AAutoLink" title=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/recipes-support/gnupg/gnupg_2.3.7.bb?h=3Dkirkstone">meta/recipes-support/=
gnupg/gnupg_2.3.7.bb</a>&nbsp;DEPENDS
 libksba</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-support/libksba/libksba_1.6.4.bb?h=3Dkirkstone" id=3D"LPlnk948742" class=
=3D"OWAAutoLink" title=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/recipes-support/libksba/libksba_1.6.4.bb?h=3Dkirkstone">meta/recipe=
s-support/libksba/libksba_1.6.4.bb</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I manually verified the upstream patch exists in the fetched libksba-1.6.4.=
tar.bz2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos Mono, Aptos_Embed=
dedFont, Aptos_MSFontService, monospace; font-size: 12pt; color: rgb(0, 0, =
0);">
$ sed -n '185,190p' libksba-1.6.4/src/ber-help.c</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Should this CVE be added to meta/conf/distro/include/cve-extra-exclusions.i=
nc?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thank you!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
NB: This is my first time interacting.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please feel free to provide additional feedback such as typical processes o=
r procedures.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Clayton Casciato</div>
</body>
</html>

--_000_BY5PR22MB176117D8743C536E8A1C85DAB7C12BY5PR22MB1761namp_--

