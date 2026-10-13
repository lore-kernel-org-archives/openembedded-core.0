Return-Path: <abiswas@lynx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9C6CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 05:15:32 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.704.1791868525150552778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 22:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@Lynx.com header.s=selector1 header.b=pFhnzlFN;
 spf=pass (domain: lynx.com, ip: 40.107.200.126, mailfrom: abiswas@lynx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTb3+k8XijLFZ6SWkhv7uuLjxrNrXRLuX+vrAAZrPZb7k7naCArReUbCDhLnLoItVoRu8edsZP/4c/ACo4tcc2KmqhrNLyqg3bqh+f6HuH0Wjw2X38QUVrjMMSssoJnZRS5EuGJvIonk4+Y2p07hmClZwEpcG9D7LViV2Mb+weTV36ZWbv3uzBN/brvEoitTKBKPmgL5ek+7PoSEKXAINtgU+UOsVaxvDCDryst3Z0QZJMMVpvGzcAaViTPMJ+/8jwHsPkTJVxyxGHwUz6/h2MeOFMnDFmsWXdqwn8r85in00+LTMQ5LIBSSLHlbRK8O3JzPr9Tt+IjYCeUGJYByPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EV4BKFWggLxw5mikL2BhpkjYE3ewMSaL+3YxdKQ/tY=;
 b=AFiSHSsmIXoVdpBZRZ7ZR6kjOg0RTgyULZafJeQqCOx1cPWIQq5eHpE19/70hhx+KGAvpoS1qPQcNt4GE1seAaLXuztxoYs3H5sR/bqTF7H1oTeH6LRGEegAiCVO/QxPknWS3La0NcnPg5M04Rj8QzXVJwu1AR3/V+w50zTQWPeOuRhkS5gZA86UAIHVcVKtIhIPOqMSMyKZw7iy3B27YHhVgqHIrbTUuGPcLaBBCMLpdTuw/OvB2EplPXc3gThWpx3cFYsFkPFyw//Ud1aMpsSjCBTGdxI9WaK24LgnSsBWC7VHRCGWK4GSjkYbpsjIEyJIktt/9cmQS0Z5L13XYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lynx.com; dmarc=pass action=none header.from=lynx.com;
 dkim=pass header.d=lynx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Lynx.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EV4BKFWggLxw5mikL2BhpkjYE3ewMSaL+3YxdKQ/tY=;
 b=pFhnzlFNGzIZnxBgw3Fpg5VBWJodUZYFBgBl0CH05hCg5Wf+wf6vZOWbJhaERBlwbQaWwRZ79u4KQG80nOdQ4mpwQw3ioP+QZht0nrlAIPqeFKVgwj5xexFQUEn21P9Sd1PihRKFMLGK/s0R5qa6yau+1Fw4A/irTmO2Ba+sWuQmXJKYVjLSGraFNs4y5HDEwJsTRH07AT2HmlcUaYyEf66E7fw4j2v3t576fCJVMX4ri55tfyHjAIFhtkwEnyCHWOIYC6gZ1NChNrR6gcNPbsVwTWANo1+W4MyyE7/6bqcv2lUSQPLjLzkGAlydVwoDvjqxwrkhcKN3L79qRLlqhQ==
Received: from CH2PR22MB2038.namprd22.prod.outlook.com (2603:10b6:610:5c::19)
 by MW4PR22MB3473.namprd22.prod.outlook.com (2603:10b6:303:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:15:19 +0000
Received: from CH2PR22MB2038.namprd22.prod.outlook.com
 ([fe80::c5a6:d5fc:b7aa:e3d1]) by CH2PR22MB2038.namprd22.prod.outlook.com
 ([fe80::c5a6:d5fc:b7aa:e3d1%3]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 05:15:18 +0000
From: Ansh Biswas <abiswas@lynx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Harish Bansal <hbansal@lynx.com>
Subject: Walnascar: enquiry about backporting the pseudo openat2 fix
Thread-Topic: Walnascar: enquiry about backporting the pseudo openat2 fix
Thread-Index: AQHdWs8Y54QvUUSfcE+ldAO+z/+Vkg==
Date: Tue, 13 Oct 2026 05:15:18 +0000
Message-ID: 
 <CH2PR22MB2038668BD49A629158C12893CA9E2@CH2PR22MB2038.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lynx.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR22MB2038:EE_|MW4PR22MB3473:EE_
x-ms-office365-filtering-correlation-id: 5e312bb5-04d7-4a1a-54eb-08df28e8f93d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|18002099003|10067099003|8096899003|38070700021|11063799006|261009223027099003|56012099006;
x-microsoft-antispam-message-info: 
 iIDGmMQs9C2JflrQG0tDe2V2XopMEeDOjSR7RdSzY9XRiJ+V499pGUPa7PB8yu8REfpKwGBz+/2uAE1hCdwGu0xHqXlUOBWco5XKnF0FOSukH4dqhGIBxWwnWO6lPEOPBYbUTU3EKJhVzWnC6nMwFON2ROEmAdIYC9S/qiCtQMQ5QzziPbls7LX+B0Nrc46uwZD1gzpUYfPySLJNI5iV6cA0ioZCE4MCaCodMp4gXA0/n/nmBERgmG+0XJn9L0UNFC3pSP3kZA5/hJqWp8rKkuEcjBMByZHBpmSp9h17L4ozhMS7Kg2nP89VDqn1ZIodsuwjC0HzqovPwHeopsdAEBLJ5iVmK670PDmesZESk7tCFUrRWkE47+I6gBaC8/L8PS8znrw2HadIqwqzPYURY3ryhKrp2oEdCL4aSdtTscMaRmxpWLB1c9Jba48L+u0IuptKQX0JhZkzSglh1NW1kttrvBj8F/iRzqWlzW0+1Sl3D76DEtH58L0db6Zq4dLLfWMaVqsuoSlkEhRBL4bT0exdJ2aCRgYzc3+gtrotMgVBZx1IzVfXP7otniF0ce17IRMMK6PRtylDW4ABk4c34BbO6/i8FMhoDdDpp/c/fSL2pWMIW4GakYMn8Plhqcmw6Bs5eQchUrIQWCf6TLU8+b21hlU8izBxqhoHS06i/EYPuOuca9uGru9dfRMHAzlUBZCkvZtjFOTW5iIGaCD6wMmd3BoSJavEMIF0XTTTJC0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR22MB2038.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(18002099003)(10067099003)(8096899003)(38070700021)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?LZ3AmVaLnneQsIUkAjGWpKCxFl7Vhrnw0vmHjDYJAVaqwToUJXftmCXE?=
 =?Windows-1252?Q?zRy3H8SP7jvNrJpkRSIAKyCrVV36KmEgcb2wf+zhZ7M1K71oliPbAfdz?=
 =?Windows-1252?Q?YsySa4Y3Zy1WHZy/GxrWeHUyowV1Ck7IFbmRa2EE6k637p7jPY2rsd3h?=
 =?Windows-1252?Q?qvIlgm7kwN2pHdTfTlNi+LcfXb+rq7V61Lzgz22EANPCOC2eeo0rw9tD?=
 =?Windows-1252?Q?RUzb30UbZfDqraE0uvTlHrQ0KRv0agmsdmXHn50Q7Ekp0hF+iyXXp2Sz?=
 =?Windows-1252?Q?lRZmFloCYKRecdPyId/AlmhpuHynAhph+E7XypHtYNjlvVWp+dxZSnd7?=
 =?Windows-1252?Q?tWxETeZcZ/Whzx1GNwiRaMx/SeIKVEHCetiO3HBEgRWqdu2JMMH7L0t/?=
 =?Windows-1252?Q?HHgGFBrb+Nyu9Pr+GV+wGt87iQnAP88ofQo1qfJe6DAwcnug7f7Y+YS1?=
 =?Windows-1252?Q?5/enyoZQTtMDGb0KZ96foHN0PUh0afNWRzgq1siut4WoLPxk81N9bhYr?=
 =?Windows-1252?Q?5r39XkfzSe/7kK+93h96GSWzKkfBMr/Y+8pTwRmN+6Jgop56Axm0FN1S?=
 =?Windows-1252?Q?qHCg6iMQ++ZE71Gc4xuGg4LtwdJOl6bo3f49f44anY30edZ/i6Z6YM1a?=
 =?Windows-1252?Q?1c7u2+pDJf4d7lMFUSaJeQOLNpfe1YHkjDLb3IZLB4jtofDmVSlPw7vK?=
 =?Windows-1252?Q?ES4Lv3zoIHIirfM2fQ2WtUSVF6oGrrbayVKruKCgbtHr8JpzhAopWvT2?=
 =?Windows-1252?Q?3ndDFyn60USf4cHRXTeqmNDsZ9qxSSC8kHhSx+vF7nP7qJmtaLeDDCX2?=
 =?Windows-1252?Q?kjmOXetZF5qb+htTcQkIRw2+hwxwgxJ8/3sXUjAFK1mByeX/jOMxxaW7?=
 =?Windows-1252?Q?uSCCIqRXLK7oMbk7AnTtWXGnhPxXwtHhlorKxM+ptWVGPW/ikpwjnO5f?=
 =?Windows-1252?Q?MV2PokuNih0V5NZYAphWbFpVl45WUTMlnWvhXATOXrpBdtIlRuZbIPoO?=
 =?Windows-1252?Q?Bc6O0t/PW8bhfgr1wUUXrRImNC9nMS3LbzVZz4fNJR6svGFmbQblxGh1?=
 =?Windows-1252?Q?f8OkacsXTiOTkybedsCBZuPJyV1aF5Z7aNj8/pTpyyaF/s+8sF6piRdl?=
 =?Windows-1252?Q?9itPHE6pnd15TIyFWWJGMhRvv/WsoLHFe5NUyq5oT66Nm72x7WyNmcLY?=
 =?Windows-1252?Q?2hwLc096u46LLbRqzvrFd8lEUjSeehLi+dm7orrkjOvhyiDhYug1P49B?=
 =?Windows-1252?Q?NdsUR32CsnKb5OJgAUhy3GPbMkiDFPm+Okcb8sAGcSAIVRNhOGK1ThZL?=
 =?Windows-1252?Q?zwWxktUOuGgZ/nzEKZCh6ftLbFBlQHTsFUSVGXhNDJDJChkvafp9i2/2?=
 =?Windows-1252?Q?vRjxfBt+7XALyweEfaCR+LnCVtEOzPHZyE/WYx3Vw0PrG8iCRNBTr7PJ?=
 =?Windows-1252?Q?hjFKVBLaRpdtYN+/dXz+P5W4Zf6oQG3l787ftu+fbjZ49Kg5+mKAa1Es?=
 =?Windows-1252?Q?2A/denb6A3/nPuTgMO1XtG6SZvCBNAcB89Rwha0uk6QFC291KWRw9Y5w?=
 =?Windows-1252?Q?KTZGgrdpMdVDqzYZwf0omRikqUr54qYj6/ZO11czu7HQ7PhtXL684yeO?=
 =?Windows-1252?Q?s8tNLBTvkpcB81uTnkSMBgljewVPshkEpFiFTEgAiMjekY1iMwWGRtLS?=
 =?Windows-1252?Q?I9cdtoymOT46RXu6mYXxFlQYEhJfB6n481kYShDKuutB9w75a9I2wcaI?=
 =?Windows-1252?Q?0XspokDMOSopAH95IZvmX7spmH2dUmEU2SihqKFy8mAmsYagVDm8yKzg?=
 =?Windows-1252?Q?BKWkYWnfa3b572NWrhH1VTzeMoI7rMvpjBowF+oPEyKoLpmD?=
Content-Type: multipart/alternative;
	boundary="_000_CH2PR22MB2038668BD49A629158C12893CA9E2CH2PR22MB2038namp_"
MIME-Version: 1.0
X-OriginatorOrg: Lynx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB2038.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e312bb5-04d7-4a1a-54eb-08df28e8f93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 05:15:18.8336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 76f7f3b2-94a1-4806-8168-1230a353cde3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yeV68Hmev1faSm7zlnpNIDXD6DtukNxyecK/+859GmIXxnAs5pknn7jONxx+GcvGAAfLh2S2DPaENpvYT7sTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR22MB3473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 05:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247694

--_000_CH2PR22MB2038668BD49A629158C12893CA9E2CH2PR22MB2038namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

We encountered a linux-libc-headers failure on Walnascar during tar extract=
ion, with errors including =93unknown base path for fd=94 and =93Cannot mkd=
ir: Bad address=94.
Updating pseudo to SRCREV 9ab513512d8b5180a430ae4fa738cb531154cdef resolved=
 the observed failure in our tests. The forced packaging task was completed=
 successfully on Ubuntu 22.04 with GNU tar 1.34 and Ubuntu 24.04 with GNU t=
ar 1.35, using BitBake 2.12.1.
This pseudo revision is already included in OE-Core master through commit 2=
c20c05b324e5d6564c8554381019170839509bb.
I understand Walnascar is EOL and backports are normally not accepted. Woul=
d you consider a backport for this issue, or should we maintain it downstre=
am?
Thanks,
Ansh


--_000_CH2PR22MB2038668BD49A629158C12893CA9E2CH2PR22MB2038namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</p>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
We encountered a linux-libc-headers failure on Walnascar during tar extract=
ion, with errors including =93<i>unknown base path for fd</i>=94 and =93<i>=
Cannot mkdir: Bad address</i>=94.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Updating pseudo to SRCREV 9ab513512d8b5180a430ae4fa738cb531154cdef resolved=
 the observed failure in our tests. The forced packaging task was completed=
 successfully on Ubuntu 22.04 with GNU tar 1.34 and Ubuntu 24.04 with GNU t=
ar 1.35, using BitBake 2.12.1.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This pseudo revision is already included in OE-Core master through commit 2=
c20c05b324e5d6564c8554381019170839509bb.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I understand Walnascar is EOL and backports are normally not accepted. Woul=
d you consider a backport for this issue, or should we maintain it downstre=
am?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
Ansh</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_CH2PR22MB2038668BD49A629158C12893CA9E2CH2PR22MB2038namp_--

