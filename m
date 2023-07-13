Return-Path: <Wolfgang.Brehm@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BAEC001B0
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 09:29:32 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.4564.1689240566796348899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=s-dkim-20210427 header.b=lrY2sGoc;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: wolfgang.brehm@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36D2ipRE027588
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com; h=from : to :
 subject : date : message-id : content-type : mime-version;
 s=S-DKIM-20210427; bh=naPBx/Un1u08HXMv5dV12o/Du2Di6rEbQ7OoteioVVk=;
 b=lrY2sGocVBeBDchktY1HfZkhUNWq93cfkytsCmZ9w8hxsogOu1oFjf9QpCKdh0wMS9/O
 xRgUHaAYBzi7zz2Ma8REBBtTqsQJ1FVZFbzhMTffWgOIvePC2aN+XecI2wp+Fq8s8JrM
 QvJCiWAymB6X6TpZDduHfLS43/fXrF+EK5zFz+HXI6IMqIpv9HWgAh6+jy5Ns6N9ThZF
 6t9MOH7KS49tI2CCPgWttPji0BUIA5Klx5DZ/8PVjDDPfIR6qt4jSNELS+OYnCl4Fj16
 A6Bj6jMTbfQo/PA6XYpFkyLRPS8iT+ZTPCvYqNv8vPcR+QniLmc83Ofv5Yj+fYEIdWEE Tg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3rt6bx96yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 09:29:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJuR9ecJCdmpcjB/8DRmOWh2neQb542j+6gV+QqFpKagadvwC3MRAis0yfQN2cM4GwD+tZMgKvUAugJIgpfcClTacF/0olmb9ldgWUTn37O2y551EKRK9uIAbNsIsVpakygWbhnm9lYHeXa8/xGO8tHuvJXL5m6P7/khdQj12jkpuei6idD20sC+vZIAR26DwJhLAl83q90xvyrlkIc9Gew9qC6kBa2Pe/wupu++xM6ZKNoUpp473C5WPMVMWdO/HVdGJXGNtfH9cWaJJNyIq2X5NsQr5B1NWdxb3z4GYiQlO9pFgmVmXKg1VGcb5VvKORf9rVHNbZiBjSJ0zBHBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naPBx/Un1u08HXMv5dV12o/Du2Di6rEbQ7OoteioVVk=;
 b=kXcW0CAFtfadXVcZm96eG7OK1dn+9amOGbjIgBPB/FHs42/I6qaWKkhwekF6xkuljcYfrwu3bVChktCxDpHcIIj3Rkp7k2ufgUWYCm24zOKxib/UEXl7tzwIaeYgA8RQwctOAgE6nGnt+hxQpWyReRe3SbSNmm5Baix5PS65hgJwXFPAi9FwlDjnUxstP0ZKJtUK3weU25pd43jd9EWGJ/hTX1wjVJ+wiHBdEf8dxVR7sM68VZbtaTxNWXmmTyyt9PqY7jZvyvDhgqezbbJHDcx4AnvjGG7LSe32+FwZda4PFFiH98Hh2KgJDzM+W9ei05+NleaNZ4dmMuJnCtvSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from SN7PR19MB7573.namprd19.prod.outlook.com (2603:10b6:806:34e::15)
 by SJ0PR19MB8160.namprd19.prod.outlook.com (2603:10b6:a03:485::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 09:29:19 +0000
Received: from SN7PR19MB7573.namprd19.prod.outlook.com
 ([fe80::363d:2141:a4e1:6bb9]) by SN7PR19MB7573.namprd19.prod.outlook.com
 ([fe80::363d:2141:a4e1:6bb9%5]) with mapi id 15.20.6565.034; Thu, 13 Jul 2023
 09:29:19 +0000
From: "Brehm, Wolfgang" <Wolfgang.Brehm@karlstorz.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: extractedText for every License in SPDX
Thread-Topic: extractedText for every License in SPDX
Thread-Index: AQHZtWxjZo9z0ErBekC6rUua5Zu7dw==
Date: Thu, 13 Jul 2023 09:29:18 +0000
Message-ID: 
 <SN7PR19MB757312F779E1255862F293EE8237A@SN7PR19MB7573.namprd19.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR19MB7573:EE_|SJ0PR19MB8160:EE_
x-ms-office365-filtering-correlation-id: 555b8aa4-f50a-467b-e1ea-08db8383a22e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TEZ1kl1KRmomZziKQF+JOXFkwPTbJ84OaEWUZ7zeLEALQ5dLBlhdOLC8I1N8S/Ps17PvFIrWthAbTooF+C4BJnmpDm27lwC8NvfGuHth9rF8RvFAlWJNR/P8ZRGAcDozhIcYvxN2eAin9bOK1eOpzqCEazu5yBeW9BonnaFeIbA8VebWxc18xev14wR4fqQrltSK3wrwqW6U6yaTs2p+4VJvYhplC8YqlMTxBDaFuuXDHZb6PX7BZzfofi63fnPgWcO3z7jVaitbabypv6mBXdshL7iEA2MVXmwjfEefB0gXeJZPRxPmSe/RptYs17vZKqNYxgFDZ5Wl5v1FnTed2avTFvavUo5esXMIE437m657orwAF6PnYGA39KkhPazchiPoQHLyMVdvslGvIMqjJQvx2PFD8MoVeNFhLA1QLr5sD3+WRTEEe+GEw0wf7F7PGQu20WkrfZcmoo4sn00hrs0My4FEVFYC3ymVz68VLeOFd79SXIP2c+4yWGmWFNZUZEufsiuy3tFDxU8454DCIwqOJLXRq/sfbWb0yI7C1sZVAc43YLBOHGC5f6QXobEXmMPc0eNSaMivnvTUdvAOE5Uu4x1+JDU62MpV8Q4GyJE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR19MB7573.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(19627405001)(41300700001)(66574015)(83380400001)(2906002)(186003)(5660300002)(33656002)(122000001)(52536014)(6916009)(55016003)(66446008)(8676002)(8936002)(6506007)(66556008)(66476007)(38100700002)(64756008)(316002)(966005)(66946007)(38070700005)(71200400001)(86362001)(91956017)(76116006)(478600001)(7696005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qZDM5jxTxMYSURrNhPVf3yKo0AR7xgCs/YD2A7Y+59roPUb143d14J9ZVE?=
 =?iso-8859-1?Q?18BiQKtxFNX6J+awP6HPNbYgPRov+KA01tHcptUDqmmk3jSPMWRgrhWkDJ?=
 =?iso-8859-1?Q?/ced9g0hHPid4nIoIotacry4IhMBzptArGG+WnveXQPF0yvafHDu2bEBCz?=
 =?iso-8859-1?Q?3ZAC3UGNluOasAK2Dq3pE/j6mkcn+mKQlk2C9wv5tw9+97M6qDY7PhjgnO?=
 =?iso-8859-1?Q?fNVNuDMPy9Koib7RChZjhIllvZgLypWGnA0d53KXEBYxR300I1FNcu/NTU?=
 =?iso-8859-1?Q?N/n23sDuZUko2Zk7lJz+mGVEAS/Erq0ajqSx9qpl9EA7V+9sipXFW5h2ZB?=
 =?iso-8859-1?Q?Zri1Sg8nLKM4xZl9WFL0dDrXYuwOM7/8pl0oGSnhl8NrFRA2BPdHHbtTFd?=
 =?iso-8859-1?Q?LdBMXiSNoz7F+lw1XTwbBpPserxPMGbCzq//UqLJWBYgZSypf5wz5pF7Xx?=
 =?iso-8859-1?Q?f4WcfCG62/wxc1QjbEuOHMilMn6/zDycbaVVVb3HJV0mreNcrG+VvDLfIh?=
 =?iso-8859-1?Q?VK3p97f2XgleJ1JxQjlU92EkVcwlLTslXDF+hx1MZPQD8/MeVnecN0P4PU?=
 =?iso-8859-1?Q?im5fR4J4HqwV95AX0y17/OaI0BuWCgCKqyc2CnKNQF1yipdIFL3EQ81Wr4?=
 =?iso-8859-1?Q?3MFy8jA1IuYI2RH7NO/RP4ZIrSSlwhpdCX1ef+e+fWPhPtm/M7b9QF404j?=
 =?iso-8859-1?Q?dH7Yk0AVASZ/g4tkBLjDAbnEW91Zr93jElg8c2xLydNwvPadoyyJ2ZFXrD?=
 =?iso-8859-1?Q?7ZXjyYX+nf7tYcOwwdGYDwtJ+C23fFwzU/SY2DpQwht5Cdv5cKbypxnX9H?=
 =?iso-8859-1?Q?rI0Usw6CU4/ufjmoZicdLPTSc58mAguRYUkEWCbgydkmHI5B/5EfSwROUm?=
 =?iso-8859-1?Q?3fduzlid++dB9b2c0eCJaa54qy/AKBWKZcKzgKQN694+cuihvE6gPeG7JY?=
 =?iso-8859-1?Q?daCF84zzzp5iICTBtH2TZx8zHiyMm59chy9+rBIlc93slWBez7A4cOqbBc?=
 =?iso-8859-1?Q?Q4Y6mhNeNH6TrW/1cXp2eH5j91BVetoXS3bacwgRw23EObfg36qCjW05nE?=
 =?iso-8859-1?Q?Q5lUmwguFhtjTlHjZYrHOFv2Lq+MHJaY73HxmLTm8Wtlfy++puhzgwMAfx?=
 =?iso-8859-1?Q?v99yT9OtOkgRBwWe6yoDixuUaOepFQukSIE5kTlYtd8G3EZ75aUM8yB0Oj?=
 =?iso-8859-1?Q?qoUsQmwpswLf1yTpPaWEVSHnDrmzs9dJRy5NWI+vHbaM4EKKdiWYNPuWsW?=
 =?iso-8859-1?Q?SA7B/lk0PHkHVkSUgJhnvl5VJ2X+9m7r0JKbefZORtPhUWdnCk7vOhIFYG?=
 =?iso-8859-1?Q?hGvJfHqjSm0p/8mmQqXzYOkUWxaKOghVOp9PQQOx57+G3rKODOUzKsWvk8?=
 =?iso-8859-1?Q?Y6NwRq72JVo7Tm3isfKEOsBOxF50QELNpNeLvUZ1VmfC/seHhJoNC1VPR9?=
 =?iso-8859-1?Q?rwuN8r/267GxWdmhELuMfQf479qvVkaltIuwA3yqSDo6g/AnRPUBxafwk2?=
 =?iso-8859-1?Q?aDePaowwUl6Wnfw2emVI1cd/SfV95dxihftCy/QydFXPftL6x0snavEgi3?=
 =?iso-8859-1?Q?muEAOEvLMKFYIl2QhG54KKG65FtZwLSLyBhK526smkgywvP61WShJxNLp6?=
 =?iso-8859-1?Q?ctHJhElUkr1Ipue6ox5mo5ueYldtBjf037cS1qKbv9/3c3IEzoeemjOn/2?=
 =?iso-8859-1?Q?xM2Q7X56ROtDEEftDanAnwA9V8PwnlIXtiAaJLS1?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR19MB757312F779E1255862F293EE8237ASN7PR19MB7573namp_"
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB7573.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555b8aa4-f50a-467b-e1ea-08db8383a22e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 09:29:18.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7lEwAxWBuR+oRy4GRzB10hVw39DAfy5EAZfKpGUkJD4+HObkOoqAIRC450Cx+IKa5fJYHVLI+5gX4WDzcJ0LrVpjdq5bbwESDQxlI1A5Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB8160
X-Proofpoint-ORIG-GUID: 6dEFD5e2eNfrYbE_ORW3BkCxfaw-3d_m
X-Proofpoint-GUID: 6dEFD5e2eNfrYbE_ORW3BkCxfaw-3d_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_04,2023-07-11_01,2023-05-22_02
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 09:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184235

--_000_SN7PR19MB757312F779E1255862F293EE8237ASN7PR19MB7573namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear openembedded developers,

We at Karl Storz need to provide the literal license text for each software=
 component we use, for legal reasons. There is a property "extractedText" i=
n the SPDX documents, but it is only meant to be populated when the license=
 is not a standard license. However even for non-standard licenses like MIT=
, the license text can differ from project to project.
I'm about to modify create-spdx-2.2.bbclass so that it would always extract=
 the license no matter what, similar to what they did in Mend (formerly Whi=
teSource):
https://github.com/whitesource-ps/ws-sbom-generator/issues/96
Would you be open for a patch and what do I need to do to improve the chanc=
es of a patch being accepted, other than sticking to the style obviously?

With the best regards,

STORZ Endoskop Produktions GmbH

i. A. Wolfgang Brehm
Softwareentwickler
Software Components & Multimedia
_____________________________________
Tel.:     +41 (0)52 640 35 67
Mobil:  +41 (0)76 361 57 07
E-Mail: wolfgang.brehm@karlstorz.com
www.karlstorz.com

Hausadresse:
STORZ Endoskop Produktions GmbH
Tuttlingen (D)
Zweigniederlassung Schaffhausen
Schneckenackerstrasse 1
CH- 8200 Schaffhausen

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
STORZ Endoskop Produktions GmbH
Dr.-Karl-Storz-Strasse 34
D-78532 Tuttlingen/Germany
Sitz der Gesellschaft/ Place of Business: Tuttlingen
Handelsregister/ Commercial Register: Stuttgart HRB 451 142
USt.-ID-Nr./ VAT-ID-No.: DE 142931059
WEEE-Reg.-Nr./ WEEE Reg.-No.: DE 74465858

Gesch=E4ftsf=FChrer / Managing Director:
Karl-Christian Storz
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Datenschutzmitteilung f=FCr Gesch=E4ftspartner / Business Partner Data Prot=
ection Notice

--_000_SN7PR19MB757312F779E1255862F293EE8237ASN7PR19MB7573namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Dear openembedded developers,
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">We at Karl Storz need to provide the literal =
license text for each software component we use, for legal reasons. There i=
s a property &quot;extractedText&quot; in the SPDX documents, but it is onl=
y meant to be populated when the license is
 not a standard license. However even for non-standard licenses like MIT, t=
he license text can differ from project to project.</div>
<div class=3D"ContentPasted0">I'm about to modify create-spdx-2.2.bbclass s=
o that it would always extract the license no matter what, similar to what =
they did in Mend (formerly WhiteSource):</div>
<div class=3D"ContentPasted0">https://github.com/whitesource-ps/ws-sbom-gen=
erator/issues/96</div>
<div class=3D"ContentPasted0">Would you be open for a patch and what do I n=
eed to do to improve the chances of a patch being accepted, other than stic=
king to the style obviously?</div>
<div class=3D"ContentPasted0"><br>
</div>
<div class=3D"ContentPasted0">With the best regards, </div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">STORZ Endoskop Produktions GmbH &nbsp;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">i. A. Wolfgang Brehm &nbsp;</div>
<div class=3D"ContentPasted0">Softwareentwickler</div>
<div class=3D"ContentPasted0">Software Components &amp; Multimedia </div>
<div class=3D"ContentPasted0">_____________________________________ &nbsp;<=
/div>
<div class=3D"ContentPasted0">Tel.: &nbsp; &nbsp; +41 (0)52 640 35 67</div>
<div class=3D"ContentPasted0">Mobil: &nbsp;+41 (0)76 361 57 07</div>
<div class=3D"ContentPasted0">E-Mail: wolfgang.brehm@karlstorz.com </div>
<div class=3D"ContentPasted0">www.karlstorz.com </div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Hausadresse: </div>
<div class=3D"ContentPasted0">STORZ Endoskop Produktions GmbH </div>
<div class=3D"ContentPasted0">Tuttlingen (D) </div>
<div class=3D"ContentPasted0">Zweigniederlassung Schaffhausen </div>
<div class=3D"ContentPasted0">Schneckenackerstrasse 1 </div>
<div class=3D"ContentPasted0">CH- 8200 Schaffhausen &nbsp;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
</div>
<div class=3D"ContentPasted0">STORZ Endoskop Produktions GmbH </div>
<div class=3D"ContentPasted0">Dr.-Karl-Storz-Strasse 34 </div>
<div class=3D"ContentPasted0">D-78532 Tuttlingen/Germany </div>
<div class=3D"ContentPasted0">Sitz der Gesellschaft/ Place of Business: Tut=
tlingen </div>
<div class=3D"ContentPasted0">Handelsregister/ Commercial Register: Stuttga=
rt HRB 451 142
</div>
<div class=3D"ContentPasted0">USt.-ID-Nr./ VAT-ID-No.: DE 142931059 </div>
<div class=3D"ContentPasted0">WEEE-Reg.-Nr./ WEEE Reg.-No.: DE 74465858 </d=
iv>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Gesch=E4ftsf=FChrer / Managing Director: </di=
v>
<div class=3D"ContentPasted0">Karl-Christian Storz </div>
<div class=3D"ContentPasted0">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
</div>
Datenschutzmitteilung f=FCr Gesch=E4ftspartner / Business Partner Data Prot=
ection Notice
<br>
</div>
</body>
</html>

--_000_SN7PR19MB757312F779E1255862F293EE8237ASN7PR19MB7573namp_--

