Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F59CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:02:47 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12513.1764057765564196744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=mE+eR9kU;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=N3IkOUIT;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=417ea8bb2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764057765; x=1795593765;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5YLVN7DvYT34GgZj8j07M5nlROFWEWP5N18O1IIFbB8=;
  b=mE+eR9kUhtKVxljV0peQVR7YuogzgZLWZMpdQMDYGKkyx6wH3493wEh2
   alyrvjoe0fD+6k8LPHtlOzBj//WxNXwKOIeMaBjq09wUImI6QxVdnuraS
   oitDPXOzcm4rSzCyX14IE11Dc23GkyvyNN22X3UTNFRgXVMmBotqaTmGq
   o=;
X-CSE-ConnectionGUID: Tu8tEeBvT1Gxae5I9u33bA==
X-CSE-MsgGUID: HVe9T3OtSGe8uJ1xv8OkNw==
Received: from mail-norwayeastazon11013038.outbound.protection.outlook.com (HELO
 OSPPR02CU001.outbound.protection.outlook.com) ([40.107.159.38]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 25 Nov 2025 09:02:07 +0100
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 VI0PR09MB8239.eurprd09.prod.outlook.com (2603:10a6:800:2b5::10) with
 Microsoft SMTP Server (version=TLS; Tue, 25 Nov 2025 08:02:04 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2snc5Wwlq4BOaiQGD1v+/rrgf5IVrLUFpnvi2HmnU7CQC446dIPDYzzCAQfjrCl93YQGudx77puU1EWi1qhbsv8qxZ5LvLapt/Ev7QBwE+Epv7BZgx4Q24oearcVJrxY2gFTpJEvc423+qQV5T0L0e7G5WbUYE/psVze3K7IWhBqlNY+UFu6VXWxlP5ueXNcS5toCPkU7W1KKVy3b+WhcKbWp1XtQINoZzUOqquOPPZnx7aZGMUkT84jk7PGaPlG9OOCWJ9EtvGx682xPs5m9jaRdKhUZ5AYGqdhq5D2yDZdMtvPJjMR0MGOpJLLW7FxrMyC8sPcdgQqCwydEuNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YLVN7DvYT34GgZj8j07M5nlROFWEWP5N18O1IIFbB8=;
 b=jaWRhVwextFtJpWglNZwwewZ6Jbx86+/l7Hp0WVmYcjSsYdMFVDrRXhzkxLIz4UuUykjAlHeX3cUpFOBe0VSalmgAxB69y/+lBiiBmYXZnnpLLiOGqYKCNhFaDRDwbY3vV5BG8WP4US4BqROPdYXKqzsHVMM51ehvFnnVEq8qK3ED9w3PQyIeWd/NfRWwGjmy+S5UMqw4uJWL2uxC34EN5DAFg3xuwsxrZSwv1jUH7xtxSubWbDko4/KyqJcHBm/SrnQ1BvFSdC+abSVeDog8iYcq7XgsXwxJuhU35P677cmB7H2wYodyGWldWZzI9nbzMQY7oa17kWtFaxy3J0fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YLVN7DvYT34GgZj8j07M5nlROFWEWP5N18O1IIFbB8=;
 b=N3IkOUITAQXlaw9TyS1OsCaclc0NlpuU36XHe+jzpn8WkdsHqp5nkFc3VRa6GoGPUKFU3uoISWa+hkN7tC40aybrzCvBtISsdFaeNubDzB8lmartXly3SfF0p05cgoNCvkb1ek2hvd6vEA1ZMveTzMc/52VLQhQnzvRQ8eKOHIg=
From: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Peter.Marko@siemens.com" <peter.marko@siemens.com>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Topic: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Index: AQHcXd4a4JqGrneHwkiX+phh+Y2I2g==
Date: Tue, 25 Nov 2025 08:02:03 +0000
Message-ID: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Enabled=True;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SiteId=ce849bab-cc1c-465b-b62e-18f07c9ac198;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SetDate=2025-11-25T08:02:03.697Z;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Name=Vertraulich;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_ContentBits=1;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|VI0PR09MB8239:EE_
x-ms-office365-filtering-correlation-id: 1eb20c7d-b76c-44ac-9090-08de2bf8ebbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?oHX3p7Mk7lnSFL/kJR4tadQKOmLq++TjsEW4LRVFXBpkTqAVZgVjrUUY0R?=
 =?iso-8859-1?Q?x+nqJ8CjYciqquliAlHx5YDWv4JX4WR7/7GVpfLUt5l947H1em1cTFZ4gb?=
 =?iso-8859-1?Q?wv6THpfRdhDdIAT1W9JlkiewhuBlcrPDb5amtlpqd+dFTmK0CLkOVav761?=
 =?iso-8859-1?Q?kQqRXKByYo0rMNc1MOwl6gG7u3skUdm46/uIBFFmp184LdncrjVMOQHUrH?=
 =?iso-8859-1?Q?rINK3DSXDz5xpII/UisQezaEtL3OeYbB0Z6kbb/quL+Q08Iprz8SHTZghF?=
 =?iso-8859-1?Q?BdpAGR8TL2w7/Psso82zDgQ7D8lWCjNus4jcxqgiL3esVrmJ47HuLZolKM?=
 =?iso-8859-1?Q?e3PBsFPDl9V2y6prUR0avjsFgs3EOwgpy50WKUTV/IiSd4cwXNhtA2fsgj?=
 =?iso-8859-1?Q?SThKKeLs5SMRNmJFffxPQ094D33yuO3Qgb70+wYiQsmcE9FP2/8pc+0xx2?=
 =?iso-8859-1?Q?Hk6dvlAxHlFFmpH9tpn4Xd+p6IEEmHBxuuQ+uLTxwU5HX3rR8QRtmjAxsV?=
 =?iso-8859-1?Q?QUnUYT3rM3EFPKo2D1qfD18kEipi+xd1xTmEJjZ9VOitJyjVUJDkLAFgRN?=
 =?iso-8859-1?Q?9r/OCsjgJEkCs60mId1hvoxKyraQ11Un73qPA5z+vQRkf/OtyXGGMoYgNc?=
 =?iso-8859-1?Q?vdLLX4ofuuQHDsJs7lTP72cEGl0fTLCsCE10OmlO+VttPZ24rlDr5+/D7q?=
 =?iso-8859-1?Q?ZvMDaguOUOS5oFKDoRGBRt56YioFHQvNM5A/G0Xhdz7uEon1bViVUSFd2r?=
 =?iso-8859-1?Q?+LILz9EO8uu6US3PS0/Y25mfqdDIVkLNvAMebgJhvKETvdT7FnN8tpK53w?=
 =?iso-8859-1?Q?MluuJDJbpG9RZ726moNfhe3eqtMhWuwo+fgoK7CTrfH80GD6X//BQLq8HS?=
 =?iso-8859-1?Q?TyDyVQ/abq9eW3vWWuDuvsyg3M2M/Q5p/sjsl1QxWLj6agukzNq74ACYR+?=
 =?iso-8859-1?Q?cAHHvIssLNZOLCC0zEjUMA+0TjJVZpIiDzcsIZ2F0vlYl51E8cRfzvly3n?=
 =?iso-8859-1?Q?OTTpxJEaSHnI+KS/fZpR0ZecRYEW2V0dBn+1l1gFXJgbQRAnQH+3FxGZ1Q?=
 =?iso-8859-1?Q?kFzmPsVKQP0MxUKj+B9KSQeLzQQfwh30wD2lP4f7hbWx+T/HdfEJge5zsu?=
 =?iso-8859-1?Q?VvM5SJkI9UJrPUQYQW9zlLl2qb0wsrmvb0PwCA7FCe0oukaNXr9rwGeJ6h?=
 =?iso-8859-1?Q?4eJrbbYhZ2pmy1QeY3XWjlztnFKQY3Mwplzd1IEpvuC52iboeXGPTZf+y0?=
 =?iso-8859-1?Q?TY/r2HW41iROGBX4D2AqcEutUR9lYB4zZCB257YtuhVxhqvjzuD1N13UCt?=
 =?iso-8859-1?Q?rHuuHXHRROi1KV3Hy6pd6JJI+7u/PgorGTw7i1gHkd7+jVbqjFLR5x1NCS?=
 =?iso-8859-1?Q?/XqEIf4T9rwyaocI2udT1X9qfV6HmXumCISod2OGsPF6K9PZjoTrzW+VJ7?=
 =?iso-8859-1?Q?qJV6srYnY8YmXlEHYJlmN9wJHTN5HrLbbNJwrCZ7O/XsgfygRHXslVn+0d?=
 =?iso-8859-1?Q?dxZKetoWOuIF4lfU4xTel8QmDUCwhKxnOMzhRAGwG4Tw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?G5d78qnT6Ccc+qYGIaSLy8ZQsTfpyRDZRW3r39XnuEZFF7wvLc41IZK4ZN?=
 =?iso-8859-1?Q?EqKfs2xyZgdnM+wbMtDXb13QXSsVYaL2/GGSDwh0T7POVjzl3hIfEtRvr5?=
 =?iso-8859-1?Q?VO+2M0NBUJ9g0YsiqWneXxRITzvav3m7ODEdk5WTVpRrl5PSXKwDx8l6SL?=
 =?iso-8859-1?Q?vTl3DFQofJ0p37ACz+biCMocJnLn2E9ne/F1HIRbEDb9GSMnEMPiRJNpK4?=
 =?iso-8859-1?Q?llviOp221evMVSRDymcTFSokWurbO4ooa0/KK6GCvG58sCPuxA5HtBEDiP?=
 =?iso-8859-1?Q?iMOgsy5jD4Q/KTAm0i+Xd174ajgOhloZgJrxLqGYOr89zK7ERdiN6V+TRM?=
 =?iso-8859-1?Q?ii77p1sCORBCtybWo2XuhThZhrAcDlaqKcU+AaEeHg15zPfHcSWkgwYnNu?=
 =?iso-8859-1?Q?Of+vVXo9J6AwV4L7w2+VcofyPY1H2c4pUGlfn37SeBcmAlSOMnTFAad48P?=
 =?iso-8859-1?Q?js58ZEz7Us2t0UsGrdfxln7sJCteI3YwMJE7yklJldthYbL/r8RUnKAu45?=
 =?iso-8859-1?Q?g7mVnoPk4yEfQ/CjJm34SLhSy14SF7z7n+wa/QQpaLDdAFsS0gXKOe0Mg3?=
 =?iso-8859-1?Q?HQals62oSzArdwkaYTKSpvSvujEGW32HJ0MlgxBkv0jF/4VhKJYVXs/5dB?=
 =?iso-8859-1?Q?qKAMOSKy+3XqHgJA8H45pTtfVv3G9uN++RPWa9VdubZrDYLjvSVoy6IBmO?=
 =?iso-8859-1?Q?QrD5L2S2VYzUSvMOTtECD2DbyKKKqXJ6HRGaqpEi9dMjk7Aj/cvBRCdqYe?=
 =?iso-8859-1?Q?FlVmR+u0c4q/sCiNJTRftNwqvVigtwmTUlSQ1GL5YtQJRqhkq8v930YWId?=
 =?iso-8859-1?Q?foxC+z+c5KI4QTQQG3iC7lLjHrJPpLz7fAcPIWwAyhAy9hlPU5aiD97Zhf?=
 =?iso-8859-1?Q?v1PTJGbk3aqNzmo0O/bpYoqS/3rmMGhXCX3ZU/ya+U81S9nFFWm4nTGfzo?=
 =?iso-8859-1?Q?mFeHmXRYxD5p1ggcdy3ynJ5Snv58JGRFBOTrNfQf9bU5HRsNfKPaanXLob?=
 =?iso-8859-1?Q?FhM62tx47n5freqoCfHDPz1VXowXE+/fXYvCasGmyRWKHbR77bZQgYdHQK?=
 =?iso-8859-1?Q?cv6YIsyugS8fpT8B7v4+L1zCFJmyZgyqN81aOCPTdC/L2QFjgyy1k/kLsE?=
 =?iso-8859-1?Q?VwRUuqa6QWz5YIZxICnPF06PldSpGr5UiQP7VMPQBcycmbSyLVbYan8bH8?=
 =?iso-8859-1?Q?MwETi1f4rd3ytTs4J1ggTVAhIKIc0V4PoToT53Ky7smlFI4Ba2I/6Y4Npa?=
 =?iso-8859-1?Q?TNy2Oc3ym2MBGJTMyUk3ZBNnwYyJ5L64eAq2FZTvAXH4hEhkskNYeO65MD?=
 =?iso-8859-1?Q?HUSPkf72zuH0FStieOJwRIoGGjMZyrekdKjseedmUl5FeJzY5c+WyYO81m?=
 =?iso-8859-1?Q?ysGjVV4sLEQ6RoAub620srgc42oKUDTZOoW/uKx86wmAyhIFp7XOmmqhj2?=
 =?iso-8859-1?Q?eH8NPmEh+jWYe6eQkyCiCvf6To1G8I23IBOFiDG6toFnNyojpL5TKhgeHH?=
 =?iso-8859-1?Q?7wrl2f+Ds7U6uYYmeK8LpzgK37DIh6xRCqDaKoYP3LXzop838r0nkdKM44?=
 =?iso-8859-1?Q?oQz4nMPSaces9XwpbPxp2gQ5FXOLnIz4nNiv+ZtUVYFiuDsEcDRFtJ4zsq?=
 =?iso-8859-1?Q?JZUHcTR+z8rre3961QhH8DrbTdvdoFqsnv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fl/cccCPs+0mGRXBcoayhD/Hnv+z1c5OU4fyvvwGKBORDl9sn5CxyK1B9Fay5ebg+KF0yOwZoYWzJ+n98GCs9e40mcAvxUM+Oe/ZTCJkkL5BgRJjR2wSnIZ1SubryYDtyn4RhlS0Q7BXWfGsidLYvV6Yv+xXPAP08wf9nsC4Yj1vtUD+qsBWI9b/S4u87dHCc9e9YmP0LVakmU2a7amMKiGXTG70wLTxpM0naBDKOxZdyq3DB9YJEpq8PfbMmj0bSCAvgTqBBdZrPl0kT2LvcRCkynUjI/D4HVi0p5sSo6GImCjsxIOihehLVwxzvAb6/LskZKZ4Qb+yhvtM4CntSwVyvoPank+SUfQ9acMxCjJUopKojy7jp6LzgGrmul/HW/opMZOXDH+VlGfw/7j1NwNj24XbFSdX9v1/I2lfKS1PfKG3Gb8o1wR6OU6Zswz40Sag3nHSWgQtM/Pn1Ha60YuJkT7g8RQIsZ27FRCJu7DUqsBLpnMTHb0LayMHa8dqC2Qb2LmBYZESDaCBA+8dQedZXcdfxlFyuoVfzZwoDP4mSODI8F5LFWSEEOpnPsycLB8R2d0TSuIWuawFgK5JViscU6tzHllLgaCbUJfw1Ct7zVAcs2ily3EnlQjI7lr61zuClrASyTrBQvYsN1WFGA==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb20c7d-b76c-44ac-9090-08de2bf8ebbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 08:02:03.9590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWIF5ZZotpM5Yjc/7Odz7kuN0QJwnEz2luS6g5Wf1dxE+SYbBx5j7f+vxsPrDmob4qspJ6hI2NsAWBY/z3ZXKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB8239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226751

Hi,=0A=
=0A=
> In native/nativesdk builds, sysconfdir refers to a recipe sysroot=0A=
> directory, which will disappear once the workdir is cleaned up, breaking=
=0A=
> libcurl's HTTPS connections.=0A=
>=A0=0A=
> By simply not setting --with-ca-bundle at all in non-target builds, curl=
=0A=
> defaults to the host system's CA certificates, which is desirable anyways=
=0A=
> to allow builds in environments that require local CA certificates.=0A=
=0A=
this patch seems to have broken opkg in the SDK for us: It now fails to dow=
nload=0A=
packages via HTTPS (from a server with a "proper" certificate from a public=
 CA),=0A=
reporting:=0A=
=0A=
> SSL certificate problem: self-signed certificate in certificate chain=0A=
=0A=
It looks like the env variables set by [0] and others like 'SSL_CERT_(DIR|F=
ILE)'=0A=
(see [1]) are only taken into account by curl on the command line (see [2])=
, but=0A=
not by libcurl, which opkg uses. Removing the default CA bundle option from=
 the=0A=
build now means that libcurl doesn't have any CA certificates to verify aga=
inst=0A=
unless explicitly configured (previously it was using 'ca-certificates.crt'=
=0A=
shipped by the SDK). For opkg, that would be possible using the 'ssl_ca_fil=
e'=0A=
and 'ssl_ca_file' options in the config file, but those paths would need to=
 be=0A=
relocatable at SDK install time and there might be other programs using lib=
curl=0A=
that are affected by the same issue.=0A=
=0A=
Is there anything that I'm missing or an easier workaround to restore opkg'=
s=0A=
HTTPS transfer abilities?=0A=
=0A=
Thanks,=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-suppo=
rt/curl/curl/environment.d-curl.sh=0A=
[1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-conne=
ctivity/openssl/files/environment.d-openssl.sh=0A=
[2]: https://github.com/curl/curl/blob/de7b3e89218467159a7af72d58cea8425946=
e97d/src/tool_operate.c#L2586-L2623=

