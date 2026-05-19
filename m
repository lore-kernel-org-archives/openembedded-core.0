Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1455ECD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 06:28:23 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15225.1779169261567185694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 22:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=oRyuyK3C;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.67, mailfrom: aditya.gs@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYJyKHY4XeCya7dchRy5XyRhFJVtBpD/fRjz7M8cV+qHPaMu45CltphGGDwfQbtKqYRUz9F868yz8FXVvPg9tNJ6W5DogE5fvvMgNWVF3jDbGUehAV3ZPUiVpmZYYF8miSDjP2f38K1DmXfBiHhkSYIfpUQWyx2Es+ja8/xCj1thMXnTKUNkiIZXVwnzSHPerc22Unt0TiB4/vAw0hetX0eccajFknXJa61d7O3LfQjg3eyhbpjZFcnPZUrRxNrjIejJo0cfv1zr7d3zPox23oeRaowM2uJadSKRvELh/nv7x3fnyIFejkEDg+xLEz8fW4w57AjO2V30x62XZnKrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPfl+jePsIlwXta3XCnv/0FKTabmBjzuC9DHkC3GbBc=;
 b=YEqSx0R7xcIN0JIWsCAKran/wQeaewE/zh2ml1DrcTxaX26JYshjKXjufCuFsOKO1ziY7hjX0PF/h21RgiuqvMUWCRmkMN9EGmo1XVaNas3wPvFfbyHg1EyD5w56A+DQtOuGPmEnSAQpbJmq2Fsv4BgQyd3i/9hSTtjznp23IQKyVEiza5etX/mQJDImjy88X31Lk9ddi+7dvXrAcm0XGeCSQzHGnoJ0YYs2BDlN19Oy0BDiHeIwnzC+EIh/BB1Av8YOGILFpojPv1n7GujGTjef1xG9Xl0uwEsBNvcP6ABtJbp7NFvR+cAnX8BoU6ddrEblWvmWYVq+fIWfo7K50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPfl+jePsIlwXta3XCnv/0FKTabmBjzuC9DHkC3GbBc=;
 b=oRyuyK3CJ4rgVHgoQ25T+4ZD1tp7z2FuCc7cdJWN04QJRdd10VbEOo/cWOJTlN1ocGgubf46yQdVX6N4xTIKF0DREfhU3ogpyxBqNhE1Mr3n1A3btmpPP7NJzciZnj/Qzl18G53XXEhyMIistn4YKmvc+CWB1UPbIY59jpEZ+Lou6ygQw8v76wXtgNHDsc2kn6OQOKoYSXl1zfKTN5Def9l0ZqWpXDmCGDeG1G6scrdT1jsz49VN8r/cRX1/gW+PCjxDS8qVcijHxc0aY3CzKdoyKtyum+nMyF5RW0Vr9W5PHek2g8Hf6mMrF/S4dKXgC2zq72dhgGjPc6k92Z5jCw==
Received: from PN0P287MB1221.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:190::13)
 by PN3P287MB0990.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 05:40:55 +0000
Received: from PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9fe:b41c:e003:e0b1]) by PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9fe:b41c:e003:e0b1%3]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 05:40:55 +0000
From: Aditya GS <Aditya.GS@bmwtechworks.in>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: PATCH gawk: ptest: disable randtest due to nondeterministic behavior
Thread-Topic: PATCH gawk: ptest: disable randtest due to nondeterministic
 behavior
Thread-Index: AQHc51B2sOZPpaxnTkWE5/d2mhg6o7YU1Vtv
Date: Tue, 19 May 2026 05:40:55 +0000
Message-ID: 
 <PN0P287MB12216100F6BD06F97EE239DDF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
References: 
 <PN0P287MB12212AB74C67E209174CD01BF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PN0P287MB12212AB74C67E209174CD01BF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB1221:EE_|PN3P287MB0990:EE_
x-ms-office365-filtering-correlation-id: 2380e368-eba8-4ada-ad4e-08deb569322c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|31052699007|39142699007|56012099003|38070700021|11063799003|18002099003|22082099003|8096899003|55112099003;
x-microsoft-antispam-message-info: 
 9KDa19W5BjbskotFPf35FGXo79vx++BbbR5do2/Q5t52TKjM25I3TQ6/3F03Jp4PRnYUPgW3Lbh+ciRrRNfBBqDiMGU005qeITnlwCfdNri03UHgfFSfz9ws52BDyXS2VyW2BPX+SYra81H7icLf1JTG32nBNmS8yh+yR1PwwLVRZsIDJRqeEi1Szn+Zg6T7yoMVsr7wwqFBH/FTv+JwGnKBFlajUO3K/vXDNdWb0KMcwpKMwvGfjrgDOjmWxlOlu5BWpI2zHgWvHZ8pdUJWHbqJyVk/nGAVJKV5Z+WtZyiHmd+HAE5lOLm0lRG5s7MeoYyQ3NjKM4ARGx2vHwwdz1l6EC2za2/t+MClkg17zoCyxntKRbZPCBYSpUqJSKdKZpBrzAauQjZcHsQrP8rRRR2Ac+fqb+u99Bg689wxD1Iw57SJgYK8EfgULAwBLRJ0AG7sol5YP6YkbFGbhp5LhQgH19spx3xA534Gf4OtmjC/hnXUPJ2vxRW+l06kinmj9hQfZ6idiZMP8kgj/uBVfsrU7dkPXD0ZPEiqo5bcQ9hablKTCxQ2fsR/AK6UOiWTBKgN4RupTbKu+GbuihPyaVml9bhe8QwhzCpsZmHA/uXM8zwKjV40I3yTBJYSTiYAz20HjCFREuwAcBlUDB30re5BDotA/YxSBg6BxaFzPYaH5NZdkZpPC+qhMogIdgUXmZftqhCQQnOQymnEdm05aLJg3b9JUWCpcRt0H2qjMnQgdCMNJ5q3gKztUo7vTJyX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1221.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(31052699007)(39142699007)(56012099003)(38070700021)(11063799003)(18002099003)(22082099003)(8096899003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PJsfbKZKOPEUyoTb0pYaZm3dDz8K12X4xS/YYZJktyCNetGFQODcLAcFwb3M?=
 =?us-ascii?Q?9MywEYxGRT60AQO75L9qFBBNJYp6IODQe6nvB7p2NSSDM9tNmEt6fRVu0CWp?=
 =?us-ascii?Q?iA767zBjlCcK3YlEl+hfcvbwksPUj3jJrEjnS5szcE3jtiT2/tRDf3BuRVTl?=
 =?us-ascii?Q?+dcFtLGNmCjksLkhGMW1+tKHgtDWqcB+rWdN37QMlX2Pln8UumhkAAYxJfv0?=
 =?us-ascii?Q?AfMk+OSHBAC3yIrRqKBRjuLENb7OVMGYOEkBNbRazbLSEBIXG+Tiqw5yLi82?=
 =?us-ascii?Q?/QrrQuMIvaQb302lAvpn2XVIu+VljHwZn6Xsiqbu8fucDHXd7EcD728Dppk6?=
 =?us-ascii?Q?ILRmX6Z9AuLWEfF9TtW0BCaNEIm1grTIa1gP2k+gdLLePeIaKrqSeBFWO9y1?=
 =?us-ascii?Q?YnuY8bVwbl5V7oagYzpWlqvFAZMR9FZCYU4ejt8R9qDq8pPiC+RzusoYRAOl?=
 =?us-ascii?Q?xO1mEDyyY4Elxh7NyH8CZkO7eeHC7XXwOjKe6UeToXPFFIYJQI82vyOh7UqQ?=
 =?us-ascii?Q?NfEPM1jrsN/NpLX8nuZLW6NgmG41j7DaIlCDGjEC46t0jDOhxX4llsKhNZDR?=
 =?us-ascii?Q?tfvXcOArBiyNHES+qFRtM/MabqhaLuBMOi4zEQmBTHCIuFB9BFVgFpbOMbma?=
 =?us-ascii?Q?nUoa9hyob+fnnVJA9CxS6nZWbcZyBtZ7LBuuiRVYoTtIeN0HgoEYOvxrWCdZ?=
 =?us-ascii?Q?VphidY/TCHO0W1hE1pHtju+//hkFAWFG3t/7WFTs3uLKwI5eeYfeimLn1Crl?=
 =?us-ascii?Q?dDLSaB4wHvCzAVSSjNl3tr1nUEX02KwwTFgMHqFrBR6no/PUdXRRiOWpiqLH?=
 =?us-ascii?Q?uN3QShvuKsz3ymkTsBHeUfrVMN+2xRCy52k+aRASjk62INT/gSlRaEjJ8NOw?=
 =?us-ascii?Q?cTIQ0XtiT+QMTl3NmJfODuHb82PlchLpi66ANno5ZcLjwF47G1snsxO29smO?=
 =?us-ascii?Q?7mTRgc2oOm6w9p7m42kALln/chRwrYVoF7STsW39gbPCMV2MmFZjc6y21XKl?=
 =?us-ascii?Q?8357b8Fiyh9Jehe9vSDEA7JvgkM51Ui5TcUyqLpvzo7Ymp2w0Bv8Rwy71WWF?=
 =?us-ascii?Q?ldaaKgXs6RDv5h6FE31iG/cGl9AaAjdbPsBMgrBAj2qsfC8WCecH20bmEus8?=
 =?us-ascii?Q?85e/y9qiCD7pBsmCz9Rp5cqhJgPyGrnPVU9BiWJnzmyBbP9qGD56x1P+CeTN?=
 =?us-ascii?Q?DP3WFSDyLLhVF8DvEnuGBTm1PcSo3XdKjW7I0JPvTaHBip0CI+OtGto571WJ?=
 =?us-ascii?Q?2pvczeczKpeP1SQizJlALRP5lg/A6nQD+/lEJsHqAwrZ17REPQS5gIoGg3As?=
 =?us-ascii?Q?TeeHwLGxL5Vz5bd6ZU9QC9ZYG/0/CBsYjIBas3ttzN/CQmEkiGwF2zmmawcT?=
 =?us-ascii?Q?eqU6qGiVeKCqZmLIsqaUSpvBKCFawDM21lorIwpklxPfruvogT8MiZ+yPbgi?=
 =?us-ascii?Q?c3aXDOAj/sa9hpBWDA7LUZxYbCkx4dsRv6WqUjV0CRqquADIhXAfU5rr+ufz?=
 =?us-ascii?Q?c7dRyLmZmRJ2IjbCcmQs3p0MJrItXUcfd8VzNpFwXfksn+fEzFYlzL367JLG?=
 =?us-ascii?Q?0BYWj8xRSkAPKH5hJW2/4ETwu1Mou+F1RcQf0L9v+UuAR6PiLXFlcu4BOp9s?=
 =?us-ascii?Q?wZXaqWIu19PyzYJUO7u6JLkjYjVRa3GOPmA7W30yKYu3Dm511T+B+tUWB4Tj?=
 =?us-ascii?Q?5VjsgLVlElTSfITfvvmbdzqQ2OWlubk+nwzo6a/7dsIr0QlYbNsT4A/XgJlp?=
 =?us-ascii?Q?f+qmrUsaIg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2380e368-eba8-4ada-ad4e-08deb569322c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 05:40:55.1067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSQ5wllZOwOwokAtkpHAAluePn5Bx0IKaY4ePkrOdn2hTszxshL5Bw72BocaVk/pJRANNkdzJBD/2xgZM24itTUVeOVZzaGxRrrcuOxjSFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0990
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PN0P287MB12216100F6BD06F97EE239DDF9002PN0P287MB1221INDP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 06:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237270

--_000_PN0P287MB12216100F6BD06F97EE239DDF9002PN0P287MB1221INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Sorry, I forgot to mention the bug reference in my earlier mail. This p=
atch is for Bug 16254. This is v2 of the patch that disables the randtest i=
n the gawk ptest suite. This version includes the detailed debugging analys=
is showing that the intermittent randtest failures are caused by sensitivit=
y in the statistical threshold used in the autocorrelation check. Small var=
iations in sigma, floating-point behavior, entropy availability, or timing =
conditions (particularly on QEMU / autobuilder) can cause abs(corr[tau]/sig=
ma) to exceed the threshold even when the randomness is valid. This aligns =
with the AB-INT failures reported in the autobuilder.

Thanks,
Aditya GS

________________________________
From: Aditya GS
Sent: Tuesday, May 19, 2026 11:06 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: PATCH gawk: ptest: disable randtest due to nondeterministic behavi=
or

Hi, This is a patch for disabling randtest in the gawk ptest suite. This ve=
rsion includes the debugging analysis.

Thanks,
Aditya GS


--_000_PN0P287MB12216100F6BD06F97EE239DDF9002PN0P287MB1221INDP_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Hi, Sorry, I forgot to mention the bug reference in my earlier mail. This p=
atch is for Bug 16254. This is v2 of the patch that disables the randtest i=
n the gawk ptest suite. This version includes the detailed debugging analys=
is showing that the intermittent
 randtest failures are caused by sensitivity in the statistical threshold u=
sed in the autocorrelation check. Small variations in sigma, floating-point=
 behavior, entropy availability, or timing conditions (particularly on QEMU=
 / autobuilder) can cause abs(corr[tau]/sigma)
 to exceed the threshold even when the randomness is valid. This aligns wit=
h the AB-INT failures reported in the autobuilder.
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Aditya GS</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Aditya GS<br>
<b>Sent:</b> Tuesday, May 19, 2026 11:06 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> PATCH gawk: ptest: disable randtest due to nondeterministic=
 behavior</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"line-height:20px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
Hi, This is a patch for disabling randtest in the gawk ptest suite. This ve=
rsion includes the debugging analysis.
</div>
<div class=3D"x_elementToProof" style=3D"line-height:20px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"line-height:20px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
Thanks,</div>
<div class=3D"x_elementToProof" style=3D"line-height:20px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
Aditya GS</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
</div>
</body>
</html>

--_000_PN0P287MB12216100F6BD06F97EE239DDF9002PN0P287MB1221INDP_--

