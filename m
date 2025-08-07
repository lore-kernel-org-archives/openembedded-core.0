Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A23C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:26:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.63])
 by mx.groups.io with SMTP id smtpd.web10.3280.1754591159429583857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vEcu4sJM;
 spf=pass (domain: siemens.com, ip: 52.101.72.63, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECeaCWI7gpZoDADdJhli1bfcxLo0hieY6SiBmC4T6TgwUWt9QIKKXvRfnSdhJWrxtiRpwePMyQSm79pLp47Wehvm/6HkQF7PmdmMegMUyDWWbNOcbm8T4al7CqKj2m1AJP+ab7I26t5p2j43o7jf5nwx5GsHPlzEG6+iUEa9Fs1pJasZWdSk/d7RYOdWGBgiJakTHkpumme5BcVcq4VqG2pM2XprsMEmt4rFDtLWEOjxstQFun0az3yacGfoBa9J0GWSpMpBQSwYI9Ol6NXT637fRtY3VRRAFSlUPaIaskrW07innKuxPL5uspry/6tG3n4+PlMFUSTWT+L33ED8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyBahVz5HpVcuyk5v8KKYJpn6ikpy5RmsU2C6u0qiJQ=;
 b=BFzSF8a/+gKZ/+N00cbY5zFro2l1ZwzlnRb6QARcU1AITGO9W0Uc3HAyvULnWtwCYCtAUMJcpnhiAVD+NTul9aM7P6NBQsreu3iZNszvLHZF7MOH1yFrThS2R6W+/rRluovJFDqYADDOZmAB+B6V2ISfI1wTTGDwAF18jFCc3enRynB/3ccCm9wsjPpa7GyjjdsgoJO2rRlD0nvqQE26do6IGj5iElEE+doLRpbZE/IGwkzxYwAy0jr+RTqk7zVQR+EjcEM6BFCeunTz48hM/7PkGr+/ma5tQbba+vv+QiXJ0JdZRqm7SYSAzlF+L5nHnF4ol2+BtZrFL01TcDqrZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyBahVz5HpVcuyk5v8KKYJpn6ikpy5RmsU2C6u0qiJQ=;
 b=vEcu4sJMIMqLrtTowOweGSAsbZuieS0T37Lhh0bB8ISj+6KSoiLmXrSGbshRX7Hi4bVXkIqCNvR1yBRkZCBnspjkWp0qNrYsMoaHDIr1BixUZLquR6KxwcuWW6jE6Hum9Df22YUWu+EnBzUIiA6XemMu5E+GlZb6EmMGFbJ6EmI/Nt1eJpPwnjKR7STtoQM5HPit8YzHbLvILUZWaklxk8ufrlIfyXmCGK01FSMFLNFjzG22g5h3kffLPtDfhnMGS0LPSpINqYDfvRcfdvacyRLmI9vliBFoy9KQkNQPJg+DdStqAOtza34Hn7ixbK8xj1TaU3VRrCK1ZL6yY/zd3w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 18:25:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8989.017; Thu, 7 Aug 2025
 18:25:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "valentin.boudevin@gmail.com" <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] Revert "cve-check: change the default feed"
Thread-Topic: [OE-core] [PATCH] Revert "cve-check: change the default feed"
Thread-Index: AQHcB8edlqdAd5HZ00Ck2+3cHGs5MLRXgZig
Date: Thu, 7 Aug 2025 18:25:55 +0000
Message-ID: 
 <AS1PR10MB5697DB1660CE5DEE0A853A6EFD2CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250807181742.696120-1-valentin.boudevin@gmail.com>
In-Reply-To: <20250807181742.696120-1-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=fce63c8d-b2ba-48bd-8979-1c6388fd0278;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-07T18:24:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6418:EE_
x-ms-office365-filtering-correlation-id: b10bec3d-1a20-4f2a-4379-08ddd5dfd900
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ML3lgGPWpinQfBY49j9+H9i50RlAGMs/rtBaTDVLGA12QqPddutVid/6yEW7?=
 =?us-ascii?Q?BafjhSq144gM4u0h4q8yiAcSyWNNCjsmYDw6GBE84khbGD0XpC0DPJx/Fvli?=
 =?us-ascii?Q?g8Lt0ccP31fqPVQZ3Tij1+ee3YUJ4F4nhyHxRUZ600nu/+SRGjFvZd1Jjrih?=
 =?us-ascii?Q?tuU0cOpye/P4NE9ktRanfF2d/RBJsXIrGARF/Hgd7STQzIi65dGsJgT5RJza?=
 =?us-ascii?Q?DNEeVU+5ToEpKUwsNc1Bic0pk1xnE/l8wirsa9qmS44s3IuTsWAExlxliRMI?=
 =?us-ascii?Q?OdsbhwfMBfICuGAS/cBqpH9K1i+AhcJ93QzVyRzD1kfsrhG8jAMfVcAZ2v9/?=
 =?us-ascii?Q?rAts8PIdhltCVgL3ungfIqPnn3azwM4i6HOZf9L0hG6MbNcEN3ClWiSyoTmI?=
 =?us-ascii?Q?jqiOA67EGS8OdMe6bt0p9P48Hc6hso1bT9v/ukJG4W9Tmg5X8fI/tcTrxUam?=
 =?us-ascii?Q?80jRBI57P4Hiv0VRrCJkpjxJ1RnFjF8+InkZOjLc+aOwpgzIDEh/T3UooFZm?=
 =?us-ascii?Q?ncEUAtERlQEupIhsG2MajZc/NUkjqmjKzwG8u9jcta+sz5YbOHlqCJrUGm1m?=
 =?us-ascii?Q?mvPhGVi7Hbml9/Iy/7Nkqfn51LmS/PhEfP6eVVPiMql/jzcMehixakCkqWh4?=
 =?us-ascii?Q?YFox+9rgLCSmaj+72o3JvYEeo8vdqFxQLRzR0j/sk7o/+kygsj5WIQ8jkskl?=
 =?us-ascii?Q?u0a6ZnvvSpiwhQkuGCR9QvDkTepPOJ1vMzttPrGCiL/+5JjJwQOCUmpxnAd4?=
 =?us-ascii?Q?pdhpYWhq6fX5CbiDiptVduzmqwGg2lzOtPxxcElXGpWOBbeinzk5T9IyXT9W?=
 =?us-ascii?Q?TQx+UvJHfRKxgjTACbvDIY7goow+J4YrRiJ3YNovsFQrWVthcKSJkvuHg+ay?=
 =?us-ascii?Q?l06nuhcK8qD6VjM17Syuc5CNusreWgcCWuL5pwOXXOoGpblQqIMV644eYd4t?=
 =?us-ascii?Q?BuxULuJcmoJJEIehU4Otpz1svpJFYB5wGz7ayEUgG8noOSHgNhwtwkhRxOAF?=
 =?us-ascii?Q?o0M8KMz8nxS1QyC4A1ys3Xg1gTDh1vbYLNtg5vR0XXCH+HGax+oNuHJGKQhy?=
 =?us-ascii?Q?JhLP9B2lpBl8LuEPjLkz9cqaGowfr+aPuUQqy6fTpJkTB1VxwSaPBadVI/IJ?=
 =?us-ascii?Q?AebRIOOT5v6Q8Ovxjbmvj8SS99J3SyOqnU02mU5c5y+VP+WqzxRPRgbnY/JY?=
 =?us-ascii?Q?o8jICiUkbmzT4aRIpncKxPTSqjXE+bRgaJme8phdldiCtVh8vNxN/PWIvEfK?=
 =?us-ascii?Q?ZU4396y9gJu0F4LMm1coUA6UwMd7Q3/lLOBBXINHEJttLTYI1D2dWoZgydnl?=
 =?us-ascii?Q?h0SfsblkvPm6GeofPilBF7WAWDm+3goOaj2WiV9EbE0iR09zQm9xC82IFDyq?=
 =?us-ascii?Q?aooCgdzSa3qKlBdjO7lFu92b76QbuKp6MDK65OxypqDnUcTwGJq2kjk5fxBt?=
 =?us-ascii?Q?tEYLavO8wbE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mdDAkIxJR/RQrOFx8jxNFOG9M5zvLh91HE2sElOUHiB2SW+AAPGoAJDOGJro?=
 =?us-ascii?Q?36Ibrx0yRlB8Xe3rosB8m2znb/dOVXfSyEocGqRXoZ+U/PEKHQ5t8/QIJjFR?=
 =?us-ascii?Q?1drlASn2BFjMNbR5Qc97WAmKdzTbmPAJ5VLD+ArFUhJ9oJ0jpG0++k1UhD/k?=
 =?us-ascii?Q?B58YdHappck/hnqWxS51eFuWSiD2Y0QCw7HnjNy9ejJJ00zMUCZXxuV1zM5F?=
 =?us-ascii?Q?xwCCyU3eLkJAWCmWtIB1jhuaU9rNlAqOCOrW44wecZjvbj2xn96t1rcE3LRg?=
 =?us-ascii?Q?4gjnB+1pnNxBmsWcU8r5q28rIiYLHIYK7SrAXQkbnZc6BGQcY4vva8O6PEty?=
 =?us-ascii?Q?zXJebs0UPyZmT2poMR6BuWT58enO7TTgwaI15AjAn9sI8PPDUMleuFkM8q2P?=
 =?us-ascii?Q?itefPO4K43QRtq7Xu+zKS1uWWfUNsOmbrVbZxqUrRsXCEtsriHm4/7+jJvuQ?=
 =?us-ascii?Q?fKOope1NUkzUmc2rZ2kqiZHaRW0HdNFfDEwhvAMLMxf+pnIsfP7sogjLptH1?=
 =?us-ascii?Q?kd7Pog4RJ2aBibtJiFYDacVxoKurdTIe0d5XJRmRjZA9VedFxpV4zOiraNmc?=
 =?us-ascii?Q?UiiW/QNfLvROmgAXTke8fX7UPNk1RexhTaq2onUJeZrX+4lofzqveJzmdvex?=
 =?us-ascii?Q?bIT4ZkDmhXrSiyvuA6xg0Ibngd9jkiJwhw4d9ojLR3ZABPIBccrKutiUWUNW?=
 =?us-ascii?Q?q52esa6WFsQxELKuHk3J9W3TfQcah/HAN2SY0EIN8I8q9ORUrh6sJcF1dKn4?=
 =?us-ascii?Q?3ydwDdcdQuqBeApDgZ3Dk1CGKrQ6rrqZnSG9noSDUqzeOC88gpgwFGRy/Hvr?=
 =?us-ascii?Q?Ypefs4y4LcEE8fhK1/WQDDibcuUkfFBHg6RKt2ZQ6y/1iaViPw1qrT5KVcsg?=
 =?us-ascii?Q?atOSj8LknYWKEVmH/oqIGpierhYyOQNbovbbftjlSPxw+LN6PVBnKnkiiFzo?=
 =?us-ascii?Q?HQ29hq0mImC02b6ArszUMS59VOE7dOk5UrbqiZOiQs8y/+kZytZXYCASiKA6?=
 =?us-ascii?Q?rl38lGovj++TRwXRGA/9uRg0U96c7MKs/nwzkZFcei8daOm1buUP9wrZHKQA?=
 =?us-ascii?Q?0ks0QJvg9M4rhCMAjPKK1LtO2Kp+Eu+35T1ika3Ku0jZPtfo3lU72w37nFZa?=
 =?us-ascii?Q?WbVFlbYvh9S5GaMlw0gRSpdLwmemrpOSF8rc8GBu/0ouZcTxCA+/XiGEaRaR?=
 =?us-ascii?Q?jki0vNU2kbXvlx9BNSCqIkb3l31DOlWl9vvjPQ82yobefUT7i7IWs05/oZWo?=
 =?us-ascii?Q?f5nWv9gYf4re4qmiuUUrqiyPI7XuXPauhJUIVG39CjdP8QSZd96EdyKbMH23?=
 =?us-ascii?Q?Rpt2TPB6ysCM/v4o6kWE01NZJZtIJ9Sgvj/GTyHAMobGDGrXdGGFLJpkXa61?=
 =?us-ascii?Q?+a0IqXqYaT7G/y2YM+aish7dpAh8IZosYVXNO1pHdDWPBlKsDyo+a7oRWURB?=
 =?us-ascii?Q?JEbQv+X/UP4/vgIjIzcYnBRY4ABS8AkNpahPOR9sIbjXHZW5Hgo4oSLS1alx?=
 =?us-ascii?Q?LP9psqwLpumaQ80tujI6GzxHEap4aiwNhkDl0Yu3nBAihkuDAys8isNtzKD/?=
 =?us-ascii?Q?jIta07F8oxxggcHxfvlqPa/bXVlwlEk/AVAe7oIz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b10bec3d-1a20-4f2a-4379-08ddd5dfd900
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 18:25:55.1337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6NNOp3x0MXVWrp37fg1nKf9x1QjYVnzVjcp6xXZ+YgPtNpQ560+zvw+06IwcArluqeuMx3kPiJJtq6KSN/Ihrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6418
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221577

Maybe it would be better to fix FKIE fetcher instead of giving-up on it?
See https://lists.yoctoproject.org/g/poky/message/13702

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of vboudevin via
> lists.openembedded.org
> Sent: Thursday, August 7, 2025 20:18
> To: openembedded-core@lists.openembedded.org
> Cc: vboudevin <valentin.boudevin@gmail.com>
> Subject: [OE-core] [PATCH] Revert "cve-check: change the default feed"
>=20
> This reverts commit 8e11797a563066da97ffac639d3173281a8c1ca9.
>=20
> Reverted the value from FKIE to NVD2, because the FKIE CVE database is
> not read properly by the cve-check script.
>=20
> A lot of CVE entries are incomplete and incorrect. From what I can see, t=
he
> majority of the CVEs are not correct with FKIE.
>=20
> I can provide a simple example with CVE-2024-6119
> (https://nvd.nist.gov/vuln/detail/CVE-2024-6119).
>=20
> On the official database the severity for this CVE, with CVSS Version 3.x=
, is: 7.5
> (HIGH)
>=20
> On a build with the FKIE database we have the following result: sqlite3 n=
vdfkie_1-
> 1.db .dump | grep CVE-2024-6119
>=20
> INSERT INTO NVD VALUES('CVE-2024-6119',replace('Issue summary:
> Applications performing certificate name checks
> (e.g., TLS\nclients checking server certificates) may attempt to read an =
invalid
> memory\naddress resulting in abnormal termination of t
> he application process.\n\nImpact summary: Abnormal termination of an
> application can a cause a denial of\nservice.
> \n\nApplications performing certificate name checks (e.g., TLS clients
> checking\nserver certificates)
> may attempt to read an invalid memory address when\ncomparing the expecte=
d
> name with an `otherName` subject alternative name of an\nX.509 certificat=
e.
> This may result in an exception that terminates the\napplication program.=
\n\nNote
> that basic certificate chain validation (signatures, dates, ...)
> is not\naffected, the denial of service can occur only when the applicati=
on
> also\nspecifies an expected DNS name, Email address or IP address.\n\n
> TLS servers rarely solicit client certificates, and even when they do,
> they\ngenerally don''t perform a name check against a reference identifie=
r
> (expected\nidentity), but rather extract the presented identity after che=
cking
> the\ncertificate chain.  So TLS servers are generally not affected
> and the severity\nof the issue is Moderate.\n\nThe FIPS modules in 3.3, 3=
.2, 3.1
> and 3.0 are not affected by this issue.','\n',char(10))
> ,'0.0','0.0','0.0','2025-06-03T10:51:54.117','UNKNOWN',NULL);
>=20
> You can see that the rode severity for CVSS Version 2.0, 3.0 and 4.0 are =
all set to
> '0.0', which is incorrect.
>=20
> Now, with the NVD2 database: sqlite3 nvdcve_2-2.db .dump | grep CVE-2024-
> 6119
>=20
> INSERT INTO NVD VALUES('CVE-2024-6119',replace('Issue summary:
> Applications performing certificate name checks
> (e.g., TLS\nclients checking server certificates) may attempt to read an =
invalid
> memory\naddress resulting in abnormal
> termination of the application process.\n\nImpact summary: Abnormal termi=
nation
> of an application can a cause a denial of\nservice.
> \n\nApplications performing certificate name checks (e.g., TLS clients
> checking\nserver certificates)
> may attempt to read an invalid memory address when\ncomparing the expecte=
d
> name with an `otherName`
> subject alternative name of an\nX.509 certificate. This may result in an =
exception
> that terminates
> the\napplication program.\n\nNote that basic certificate chain validation
> (signatures, dates, ...) is not\naffected,
> the denial of service can occur only when the application also\nspecifies=
 an
> expected DNS name, Email address or IP address.
> \n\nTLS servers rarely solicit client certificates, and even when they do=
,
> they\ngenerally don''t perform a name check against a reference identifie=
r
> (expected\nidentity), but rather extract the presented identity after che=
cking
> the\ncertificate chain.
> So TLS servers are generally not affected and the severity\nof the issue =
is
> Moderate.\n\nThe FIPS modules in 3.3, 3.2, 3.1 and 3.0 are not affected
> by this issue.','\n',char(10))
> ,'0.0','7.5','0.0','2025-06-
> 03T10:51:54.117','NETWORK','CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H'=
);
>=20
> This is the correct severity for CVE-2024-6119.
>=20
> The base issue does NOT come from the FKIE databse : https://github.com/f=
kie-
> cad/nvd-json-data-feeds/blob/main/CVE-2024/CVE-2024-61xx/CVE-2024-
> 6119.json
>=20
> We can see for this CVE a "baseScore": 7.5.
>=20
> It seems like poky is not reading the FKIE database correctly, so we reve=
rt the
> change to NVD2 with a working and complete database.
>=20
> Note: I only gave the example of CVE-2024-6119 with CVSS example, but as =
you
> can see other fields are not correct either with "UNKNOWN" status.
> ---
>  meta/classes/cve-check.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index c63ebd56e1..2125eb5dd7 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -32,7 +32,7 @@ CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>=20
>  # Possible database sources: NVD1, NVD2, FKIE
> -NVD_DB_VERSION ?=3D "FKIE"
> +NVD_DB_VERSION ?=3D "NVD2"
>=20
>  # Use different file names for each database source, as they synchronize=
 at
> different moments, so may be slightly different
>  CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD1' else 'nvdfkie_1-1.db'}"
> --
> 2.43.0


