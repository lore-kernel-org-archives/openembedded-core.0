Return-Path: <claussen.j@eppendorf.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE8CC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 11:56:30 +0000 (UTC)
Received: from smail-epp.dts-security.de (smail-epp.dts-security.de
 [81.89.246.136])
 by mx.groups.io with SMTP id smtpd.web12.11552.1654602983739931106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 04:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@eppendorfaghamburg.onmicrosoft.com
 header.s=selector1-eppendorfaghamburg-onmicrosoft-com header.b=hNusDL3h;
 spf=pass (domain: eppendorf.de, ip: 81.89.246.136,
 mailfrom: claussen.j@eppendorf.de)
Received: from pps.filterd (smail-epp.dts-security.de [127.0.0.1])
	by smail-epp.dts-security.de (8.16.1.2/8.16.1.2) with SMTP id 257BsbHR032393
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Jun 2022 13:56:20 +0200
Received: from mail-hh-05.emea.epglobal.org ([172.16.0.5])
	by smail-epp.dts-security.de with ESMTP id 3ggfhw05gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:56:20 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZzixWGjouja6eC8kfWHu0u/wEPkdx/cFAAAshlwE6agprypw0tbYyYrJXm03+3Fh4EzMMMAVsrkmzQx1DPJmwCrHf2ZO+fzmX7mgJov5SZ4ak6FuYXqWMM7kVOj66lxtDX1/k4+SV5RxzhhNPLarHS7rchpBoZXgtGiXhG3YW/fRn8NXawPINmkQLDFSMZ01QNUq8R7g+ZzNKrzRV+RkdGYOuNYpd2CXlTCxU7eIr5KxMUxrhZZ3690BDfn5JIlb744HEzBBhmD/BwJc90Ea5MoNVgAFSLI4oQGyqm4Be3Mn5T0aBrKNcE3mevkf3n3hNKVbmfbAOIzEMx6cmJ18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXAeYb3NgZ7GxNJVF/3MaFlSFaViB6vB4GidiQWBcUE=;
 b=L4OvjFQfH+nA8fCL/Ffopnq/khux53uydFM9iPRpPe0fo4C375aAbbcTTpVX9pn3UcbHLXmn1oqN67ypf01Ol9sc84J3oNQXE7F1r9MsYR6aReuwebT7YuEJGbGu8eFqvsqB7TittmtXaF2a2i7mkR0jKpbg2ZhoVQ7OqDec3YB0XC+RrNVAvzqa36eizWp3yr09vjZKCU7LnIIxnRY/5I1F+APxBQp/UxY5d/0aC9oGlnQaEsvbtdSPTzYylVwyMiy1CLWBl9l+4RUXUEUDBnDxLAbAJOCatpyjRIRjXTMxZQhckMLkecjGWgaiKOWQ3bMCuGPhRlZXJZourEK+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eppendorf.de; dmarc=pass action=none header.from=eppendorf.de;
 dkim=pass header.d=eppendorf.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eppendorfAGHamburg.onmicrosoft.com;
 s=selector1-eppendorfAGHamburg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXAeYb3NgZ7GxNJVF/3MaFlSFaViB6vB4GidiQWBcUE=;
 b=hNusDL3hXHIhm6yxRjJ8ActV4oOXGnEAHnVRVo9VIFvJt6MD6QTWuOVYJO7jLobBOkPamI8oM6EHHVNeXOlWxrR9Z5jJoEa0BjJqSR3A2AAj4E89pPKgd0tG7stCm6ZewBMQtYCgKEAcKdjqI53BwXU8ybDfKP9qXGrfz7fNqrI=
From: Jan Claussen <Claussen.J@eppendorf.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 0001-dropbear-Allow-root-login-fix.patch
Thread-Topic: 0001-dropbear-Allow-root-login-fix.patch
Thread-Index: AQHYemVuw/N91tNR806RriU7tQIvqw==
Date: Tue, 7 Jun 2022 11:56:18 +0000
Message-ID: 
 <AS8PR02MB83920BF4108BDFCB2FCE492EF0A59@AS8PR02MB8392.eurprd02.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c835574f-b4f0-7669-a27d-f383e2e46db8
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aa5fbce-d770-4276-9179-08da487cbb4f
x-ms-traffictypediagnostic: DB6PR02MB2981:EE_
x-microsoft-antispam-prvs: 
 <DB6PR02MB2981F0BCFC24B777883E3865F0A59@DB6PR02MB2981.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b4bruxvEuGBzLX82t2QWafQKjQbHscbbhdSEHotvuqpuAxNMtLc/ICnVIU96u1GZgUugGP2SUYDWfl1pVwfy+CYVeTWlwjDNBpdVgEmHkHnRqhVMMg7mVAupnJhd7seXalvlNVgVWfegwgCw5zEKtDQq/Ovgu0/+Sai4oMxbp0kT5s3LvueZYfuARVkHvvAvvIvEL7jkplI7NV09BHPC+KxFATG4blfwX4EHyZijMESxirdGwfShLDXPNV7CobcVbp+T4l3BIAENYf3aYKbv902bVZuEegxhZs23vsywX2Ztw1AHooHNR+qdbn++/5W2pgNJkn8fBj7jzLwz8N7qOBP5FZlZ3HspnJJzXBPiHWqMBQcb2q7x2RN/Z5uo+yupKIdkb0nMng0V6Ik6FniL5dBloIj8rZYUmd4SEMTfXd47m5LfTOFPCQZIpGFOjOz2F++nJp5DiEYg5j06xOYbOMMnHzXaL9mWRBfWBM3k9FGbKo/XYO5ssue6FHvME/yr5YTYfW7L6+XHm4ah0yc1yB1rAcZTUOO8EvreMrWHXgo+2UPIV0JOie3Su9DmiOQAl71n/pdL4QLKiWNilM3QH/kJ42ejCzJkilrtoKUj6bvHPiiucwBiUu9hUwQwcA2YODXrWSq/aYKh1zZpqG414QPHNttSr/QSNBM2WW0XgVo0WTE8BhtnXUkVf66ZQMs0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB8392.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(508600001)(86362001)(38070700005)(122000001)(26005)(9686003)(8936002)(55016003)(52536014)(38100700002)(83380400001)(5660300002)(64756008)(66476007)(8676002)(33656002)(66946007)(76116006)(19627405001)(99936003)(316002)(6916009)(6506007)(7696005)(186003)(558084003)(71200400001)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Jndvk4o0thDJ8MNSJf015HuWMSM1GZJfmmS3QSKXqbNUdWCOXEGuNtnRML?=
 =?iso-8859-1?Q?kJ14nEso6fka9uWkvPW1iUorAEUJ03V4imG5+Nc/4NSkIwkVGRDcKqkmr2?=
 =?iso-8859-1?Q?F4C5Qw8jPfNAJaMTe8lAW7pshmoaqKr5n95tk/KykUSXE9gX8ttFKX0o6w?=
 =?iso-8859-1?Q?iWSICmd4Z9mESu0VQwBIFEoMfKlzJvPg3nMAzUVdR2NzgYtFCPEsxDKW71?=
 =?iso-8859-1?Q?c1Qfe8gA7qLcQfeVtQsVcJoqSUAUcbszutmkyvPj4eOZZ7wCKeqGydAW3m?=
 =?iso-8859-1?Q?zB9XMuuNtYyzRD06xuX5cFPZURImXU9av8EqhpAisOoioIAf0+IzI+m8Gt?=
 =?iso-8859-1?Q?YKQ4BCrfZHWP6LjPMjlexWHKtcUDYe3mSiuFSSjMGNlXDsemx716WGTDnj?=
 =?iso-8859-1?Q?mwDRgrV2MI237yPedbm56nVAxtc9EQMZpseMxfVHDh+mJL6V2T/x6T1uuS?=
 =?iso-8859-1?Q?Z5CHUhrz9hhEet1E2O69Z9YFO79QSXk+OWqQTh/9Zc/GyUEIVVwckuicyw?=
 =?iso-8859-1?Q?R25pYFDi3ZvTxU3bnOpGrdVC14kJCpU0A6PY2CMGfzqPHyHrzc/CDcA1Oa?=
 =?iso-8859-1?Q?7tIxY2EH/xC7wqrLhLSZzB8PjnZCv8gt7vujJYYkL7JZRwgjQ5YSpK1Rmf?=
 =?iso-8859-1?Q?jSs/u6TsIAXNhRVRHvZHI08pjsZudAD0N7fWzlf6KTHa75+ErVdupXXH9J?=
 =?iso-8859-1?Q?sxFdfhKLDHf+y2KyjIFJXNlRxNbdXqfLmJjtc3Nye9BS0r5Rb2l+UynCfS?=
 =?iso-8859-1?Q?Kkft09wLKZXaFQz6XIjkMFn7BRw5pLU2fHe7mudD8pNztVHCk66qdntCIf?=
 =?iso-8859-1?Q?pNODXDucFmET1Og30NSs9V3atHxAlDkzZHCveZtNr7KFglWHMmYAXS7MMW?=
 =?iso-8859-1?Q?X6vTi/gnuIi3715APVB0Lsy2Iu2GarkTxVODcQcAKmqZqJB5PzDzuv8dSQ?=
 =?iso-8859-1?Q?RmSlD1DYwuPjGMyFyVL1m5M4X7M4Y2mM17xFbKfEGA1IT5+hvv8o4ozqgk?=
 =?iso-8859-1?Q?U6iPqRhwUf+tRa5xBSyUN4xwzizh+K+5GezldboC24KHHUweSnx1LOJEGu?=
 =?iso-8859-1?Q?/wFsOE/Megq9VOg6+zva5oUg9BkY4VIAtuQRb7NNdTH83YaZwC5GOnpxC8?=
 =?iso-8859-1?Q?M5LT7NOycY762eZkUz4DCOETpmwL9ek63jbseyzB6gCTjnBHn9mxBDB98F?=
 =?iso-8859-1?Q?/rmwAT1h2o53pQcFUF5Rr4ev3RPsWtqiwl/rMpvXBNCEDxmzzUaazQRyMT?=
 =?iso-8859-1?Q?YS+Dk+VymAuxlJRaHXGVX6R6M75MD+KSev3g2QsVNxl1q/J7pWmjQGOZhu?=
 =?iso-8859-1?Q?eihk93EzRv8H9Mc/r2IIf7fZYvUeRyKy29i8h5+QDFLaj7c7lV71LQaION?=
 =?iso-8859-1?Q?HAiARwR/AsEXSw/17jDv94xteuitbiEHQ/5fCSkF2vL2Lak8wgroeZZOCC?=
 =?iso-8859-1?Q?8V4PAm/isStfX+h6WjECgRgpanHHihjCzqGGHXp6halpTXKl5NP6EMN1bp?=
 =?iso-8859-1?Q?q9aa/MnFFdDJq5E3pvfBk1q9yZ3LLmwI3uCkkKBLt4CIumHQQhZ9cyu8XF?=
 =?iso-8859-1?Q?OuA5TkGUPW6vkWuHgGsBkGUvGAQNDBLgrVk/7xN7Pmvuor5CtekP9vO0Fx?=
 =?iso-8859-1?Q?UCpGWhbJENKdBcFgg4fOY4ylki0PQo4Q1SFVT0Cj4OUzkfmt4rwSsxRJMS?=
 =?iso-8859-1?Q?5tSqeXbUI94V/s5HOjvYQmo6Lf/VpnCPZ/XtSaYtA86QlqyigQLNAlCjat?=
 =?iso-8859-1?Q?Z7seUYwk1/oVDiCMfVub2299HHtP5QxkMocwF7cGbfWuULgdEAvGEIp4OL?=
 =?iso-8859-1?Q?HpKZ4ScL1A=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_004_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB8392.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5aa5fbce-d770-4276-9179-08da487cbb4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 11:56:18.1576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 30d50150-9a5a-43db-b809-ff90d7ab4fd6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CSQME2TNHEIs84CggfwoKoDqw8RK0TtQ3QfEfkVBFQ/O8Zdp0+kAwjsO1llvtvFCN1xmcem37wD2rSjgtGL3SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB2981
X-OriginatorOrg: eppendorf.de
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-07_04:2022-06-07,2022-06-07 signatures=0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 11:56:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166659

--_004_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_
Content-Type: multipart/alternative;
	boundary="_000_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_"

--_000_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

    dropbear: Allow root login fix

    This enables root login when either "allow-root-login" or "debug-tweaks=
"
    were set in EXTRA_IMAGE_FEATURES.

    Signed-off-by: Jan Claussen <claussen.j@eppendorf.de>
________________________________
This email including its attachments is intended for the person or entity o=
nly to which it is addressed. It may contain confidential and/or privileged=
 material. Any review, forwarding, dissemination, other use of, or taking o=
f any action in reliance upon this information by persons or entities other=
 than the intended recipient is prohibited. If you received this email in e=
rror, please contact the sender and delete the material from any computer s=
ystem.
________________________________


Eppendorf SE, Hamburg, Barkhausenweg 1, 22339 Hamburg, Amtsgericht Hamburg =
HRB 171526
Vors. des Aufsichtsrats: Philipp von Loeper
Vorstand: Eva van Pelt (Co-Vorsitzende), Dr. Peter Fruhstorfer (Co-Vorsitze=
nder), Axel Jaeger und Dr. Wilhelm Pl=FCster

Eppendorf Instrumente GmbH, Hamburg, Amtsgericht Hamburg, HRB 69077
Gesch=E4ftsf=FChrer: Dr. Bernd Petersen und Dr. Alexander Papra

Eppendorf Liquid Handling GmbH, Hamburg, Amtsgericht Hamburg, HRB 92250
Gesch=E4ftsf=FChrer: Dietmar Stadler


________________________________
According to the general high quality approach of Eppendorf, we apply to ou=
r mail traffic the latest protection technologies and methods, including ex=
tensive scanning and DMARC, to help our communication partners in protectin=
g their IT environment.
Privacy information according to Articles 13 and 14 GDPR can be found here:=
 www.eppendorf.com/gdpr
<http://www.eppendorf.com/gdpr>
________________________________

--_000_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<div>&nbsp; &nbsp; dropbear: Allow root login fix</div>
<div>&nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; This enables root login when either &quot;allow-root-log=
in&quot; or &quot;debug-tweaks&quot;</div>
<div>&nbsp; &nbsp; were set in EXTRA_IMAGE_FEATURES.</div>
<div>&nbsp; &nbsp; </div>
&nbsp; &nbsp; Signed-off-by: Jan Claussen &lt;claussen.j@eppendorf.de&gt;</=
div>
<span style=3D"font-size:8.0pt;font-family:Arial;color:#000000">
<hr>
This email including its attachments is intended for the person or entity o=
nly to which it is addressed. It may contain confidential and/or privileged=
 material. Any review, forwarding, dissemination, other use of, or taking o=
f any action in reliance upon this
 information by persons or entities other than the intended recipient is pr=
ohibited. If you received this email in error, please contact the sender an=
d delete the material from any computer system.<br>
<hr>
<br>
<br>
Eppendorf SE, Hamburg, Barkhausenweg 1, 22339 Hamburg, Amtsgericht Hamburg =
HRB 171526
<br>
Vors. des Aufsichtsrats: Philipp von Loeper <br>
Vorstand: Eva van Pelt (Co-Vorsitzende), Dr. Peter Fruhstorfer (Co-Vorsitze=
nder), Axel Jaeger und Dr. Wilhelm Pl=FCster
<br>
<br>
Eppendorf Instrumente GmbH, Hamburg, Amtsgericht Hamburg, HRB 69077<br>
Gesch=E4ftsf=FChrer: Dr. Bernd Petersen und Dr. Alexander Papra<br>
<br>
Eppendorf Liquid Handling GmbH, Hamburg, Amtsgericht Hamburg, HRB 92250<br>
Gesch=E4ftsf=FChrer: Dietmar Stadler<br>
</span><span style=3D"font-size:8.0pt;font-family:Arial;color:#000000"><br>
<br>
<hr>
According to the general high quality approach of Eppendorf, we apply to ou=
r mail traffic the latest protection technologies and methods, including ex=
tensive scanning and DMARC, to help our communication partners in protectin=
g their IT environment.<br>
Privacy information according to Articles 13 and 14 GDPR can be found here:=
 <a href=3D"http://www.eppendorf.com/gdpr">
www.eppendorf.com/gdpr <br>
<hr>
</span></a>
</body>
</html>

--_000_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_--

--_004_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_
Content-Type: text/x-patch; name="0001-dropbear-Allow-root-login-fix.patch"
Content-Description: 0001-dropbear-Allow-root-login-fix.patch
Content-Disposition: attachment;
	filename="0001-dropbear-Allow-root-login-fix.patch"; size=1113;
	creation-date="Tue, 07 Jun 2022 11:55:09 GMT";
	modification-date="Tue, 07 Jun 2022 11:55:37 GMT"
Content-Transfer-Encoding: base64

Y29tbWl0IGM3NjQwNjQ4NTc4ZTVmYzNiN2U1ODllM2YxYjQyMGE0N2YxMjZhZWUKQXV0aG9yOiBK
YW4gQ2xhdXNzZW4gPGNsYXVzc2VuLmpAZXBwZW5kb3JmLmRlPgpEYXRlOiAgIFR1ZSBKdW4gNyAx
MzozNDo0MSAyMDIyICswMjAwCgogICAgZHJvcGJlYXI6IEFsbG93IHJvb3QgbG9naW4gZml4Cgog
ICAgVGhpcyBlbmFibGVzIHJvb3QgbG9naW4gd2hlbiBlaXRoZXIgImFsbG93LXJvb3QtbG9naW4i
IG9yICJkZWJ1Zy10d2Vha3MiCiAgICB3ZXJlIHNldCBpbiBFWFRSQV9JTUFHRV9GRUFUVVJFUy4K
CiAgICBTaWduZWQtb2ZmLWJ5OiBKYW4gQ2xhdXNzZW4gPGNsYXVzc2VuLmpAZXBwZW5kb3JmLmRl
PgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLmluYyBi
L21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLmluYwppbmRleCA3OGY5ZjlhZGJk
Li5lNTQ1YzQyNWFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9w
YmVhci5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jCkBA
IC0xMDUsNiArMTA1LDEzIEBAIGRvX2luc3RhbGwoKSB7CiAJCS1lICdzLEBCSU5ESVJALCR7Ymlu
ZGlyfSxnJyBcCiAJCS1lICdzLEBTQklORElSQCwke3NiaW5kaXJ9LGcnIFwKIAkJJHtEfSR7c3lz
dGVtZF9zeXN0ZW1fdW5pdGRpcn0vZHJvcGJlYXIuc29ja2V0ICR7RH0ke3N5c3RlbWRfc3lzdGVt
X3VuaXRkaXJ9Lyouc2VydmljZQorCisgICAgIyBFbmFibGUgcm9vdCBsb2dpbiBmb3IgZHJvcGJl
YXIgd2hlbiBkZWJ1Zy10d2Vha3Mgb3IgYWxsb3ctcm9vdC1sb2dpbiBhcmUgc2V0CisgICAgaWYg
WyAiJHtAYmIudXRpbHMuZmlsdGVyKCdFWFRSQV9JTUFHRV9GRUFUVVJFUycsICdkZWJ1Zy10d2Vh
a3MnLCBkKX0iIFwKKyAgICAgICAgIHx8ICIke0BiYi51dGlscy5maWx0ZXIoJ0VYVFJBX0lNQUdF
X0ZFQVRVUkVTJywgJ2FsbG93LXJvb3QtbG9naW4nLCBkKX0iIF07IHRoZW4KKyAgICAgICAgICAg
IHNlZCAtaSAncy8tdy8vZycgJHtEfS9ldGMvZGVmYXVsdC9kcm9wYmVhcgorICAgIGZpCisKIH0K
CiBpbmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMK

--_004_AS8PR02MB83920BF4108BDFCB2FCE492EF0A59AS8PR02MB8392eurp_--

