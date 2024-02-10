Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF520C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 23:57:44 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web10.27666.1707609455848281598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 15:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HVUb62M+;
 spf=pass (domain: axis.com, ip: 40.107.8.75, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDHd1c7JjiIWooy5bygGFVR8djufNrGBVFKJMhq48bHvHaO8ZFv1raMEYWchLEIHPsA6pPgbeoBXi7paadZ7Mbo9bM29xl6kuUy2dT+P8Jp3E5USFlnCcbMnFsKzW5E57qN+z5WHxJdG9NBwiXEUVUSmscAZ0qD2v48SmFDnAbb7heGtQTj+VKh0Fdf44Aiay8X8gknWEm0Hhb7gshGNkWvk+OCf3/MwDX22VFk82zf9/nwBxk7fLHbX/qO7hrYn2Ekzk8YA+/DwGGIqNp4/N14M5K1fI6OZxQdyLpsVNI5WhEEKd8Ld2A8g3BeVV93RpH59aWk31l3kWE0lhRnITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4aHPJonhw7JG7bdGFBg2u3RpQM2Zmg2v8c3VapzuTg=;
 b=FO9F4yZVuz93b4JMuKi5bu7BT2mb8WnYFv/4qtPVyZbzZJqzmRDLBxT81zz2WALALX5bXYQpCzhLROsRYfA/1V/rxbUBZd2b5nRc+V2m1z6UZWxVZ09Umt2ykXe64H4OFV9NJrURp2p5DdRU8hMIZ00kI1NkDD4cwsDhHK8irOJ0soEAjDwFv2xXwiDYoBNHgXFYvIlAYNbAaG6lVRa01+7o+BiVJ3WrZNHCicmxmMmvZHE3zXULb+V5mcrpghgsbVgxgmkE3RbDa5DKfi6bMRFRSG+aCuynRjeTDFQJRsL1UNxmuQ56O0W3RsT1qITB93+0uLkb/yhhdDqSVm5Fig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4aHPJonhw7JG7bdGFBg2u3RpQM2Zmg2v8c3VapzuTg=;
 b=HVUb62M+hwfwtfR4PVEPZIupKpBlDSjtqbR+PpSFs1E8kTPwrsXRPWBL+2kkBE+hEjNUPy0zgQAeTPc+VdjgUEmukb+5Q8aAxt9CN2MYRDxnAArysWXIEpcSTQ9TtvPCfMWQ1+Zu2oCG9WuTjSDfOm3EtJiax2lzsccXSGeobJM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9722.eurprd02.prod.outlook.com (2603:10a6:102:318::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Sat, 10 Feb
 2024 23:57:31 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7270.033; Sat, 10 Feb 2024
 23:57:31 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Patchtest <patchtest@automation.yoctoproject.org>, Trevor Gamblin
	<tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-Core][kirkstone][PATCH] curl: don't
 enable debug builds
Thread-Topic: Patchtest results for [OE-Core][kirkstone][PATCH] curl: don't
 enable debug builds
Thread-Index: AQHaXD7cCdPoViKA+Uam2aIGpbjaP7EEPstg
Date: Sat, 10 Feb 2024 23:57:31 +0000
Message-ID: 
 <DB5PR02MB102136AE90A908156D2BE5464EF4A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 20240210161234.12849-1-alex.kiernan@gmail.com
 <0101018d93dd81a4-0099bd71-a0eb-4f94-8ca3-51d9a9f2d323-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018d93dd81a4-0099bd71-a0eb-4f94-8ca3-51d9a9f2d323-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9722:EE_
x-ms-office365-filtering-correlation-id: cd439a02-d7d6-4b22-059b-08dc2a940b9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BTK4jmh8POn2iyufJpPQjnRVkHydpffMenU/+dem/28qmzXaIkEwbyVVzatu3tfe8dQweoxWCGwLOS8mMxPVXgME0oSoqtlsdZOdeeOV4cBjYjxgL299XSrIK+syxjpuEadQraCnKoK1CDnzdInximQqQIO/WhhpMp9OkdbRuyu6+UcZ4Esi/0ZJD0G/ZcdZc+bUGGXSy70n6ugUoe+YHvp89vgdxH4uXiZVxS2tRky93uC6IHEYBmhjZ8wGsePMWliN+KRQ2ko6n2Lvufmpe+EMY++tBcyyj+/xLTQh2kPAjqO434CLggsrGPI6vj2/Eb1ac1tPIFmijX/HLu5WKodRm4BIkHpjXAkPwSPYgvkRH861sj6nMj4+K6zrvv+gvF4CEajSYpjFIy3uO8ic8zZ/4Vn4bMSBe7ak9p8KRamfmg+2u8GEVtMj1TKp2lTTLMPG3lZZb7kbALVbEiXGJuBoT01KWggUIYtzXMS8/IVxvETnSMLCd4jdAGuzRlto+eQ0d+eopQSyWnUpUzFWWFMolRxfiva5aBNBNS+Z3doXDcwC0AaUHpRoDAl3jsocA/8gkw0svZ/g150bcgAL2tC/bm8dlsKtUVe5Y2+0svQ7/rzXcS3pB2cCFe8vUw5S
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(39850400004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(33656002)(44832011)(2906002)(7696005)(38070700009)(9686003)(6506007)(71200400001)(53546011)(316002)(110136005)(478600001)(26005)(41300700001)(83380400001)(8936002)(8676002)(4326008)(52536014)(66556008)(66476007)(66446008)(64756008)(86362001)(66946007)(76116006)(5660300002)(4744005)(38100700002)(122000001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vOCtUPaH/lj/QNfGunIte513jaev8tZu34ZGZPReMPdQ6UMSh9fElW4+bm3Z?=
 =?us-ascii?Q?qQMuSQ8+tiPk8jNbAH7zfz3IpulpYD8ft1hdJPNkeE1W2+VFuMNrIn1sh3sq?=
 =?us-ascii?Q?fOC7upEeKdMOFpGDvBqXwTkas40ZZNimatzd1TI9Rp8Ad0kb6ib+STagu07N?=
 =?us-ascii?Q?N+WrQo8JUqz5SdI0HfVW0uyQ6oeyMuFv6/M5vikSCYQd9gGZZcxwMRbtgkFx?=
 =?us-ascii?Q?d77pVAZkZW9DUJ65BQ7nmogGatdRysPOLb1p3QJUeg5ga9eHmi8G0CFuieh3?=
 =?us-ascii?Q?g95CWqdby7PKXGcD0kzNF8rOAz2HrfGnlyKL+EjLLSZOpfbgHRRHGR2Bo0rO?=
 =?us-ascii?Q?2FlXAGTj/fM2qNWfEpRBv58sGzLSDDWWI4S+rxsa4GYB7FKrDRrn7qRY1kO7?=
 =?us-ascii?Q?2o5lrcNqV9LjydBQPEqNzywVU1zIpppV7VkQD7tNSLR5v59y5d4lzybvuTjA?=
 =?us-ascii?Q?qGg5GuN0ZWLBI9elEit0nGvH8FLc/URmAUm1BRma4Io7hOpmVDF8DpN+f5Om?=
 =?us-ascii?Q?hD/QmD8mcR6XLPxIVUd+ZCmeYuB3YLJ76GBMf1P6+SuWQJDOTx9JqE6smbgU?=
 =?us-ascii?Q?3gJuqvkpv2gNvoihdYAomqYOfn3mXox6o2RUV+QP2aDMy0nwLF1Jd+LUtSj9?=
 =?us-ascii?Q?9tYofaXzEtXLhYgsLKmLxAbfuEiM7BNV3dcSKMHCT8GrK/emO4JoTE0eWcoD?=
 =?us-ascii?Q?6Mqz+uQ/i1l4AAMeiLyw2OU56WBtUJTOSMhbGeagGFgD8r9ZdwbM/mXLd4yY?=
 =?us-ascii?Q?BCqU3j3McKKYm7cYL4WmbV2q3hLnK6DDhVB0p8XFB7Tdater1dNSqXT7DYp+?=
 =?us-ascii?Q?0Ox5jNtYQb+zMLvQQM2pf7R54SOOZReDBpukMJueyEnwvMjklirKQTDEI6oj?=
 =?us-ascii?Q?XXiSOebyyuc1DfvsYpUxKSkkCKw7kQFAEQdpXRXss3X59j2tveWD7FweWaEA?=
 =?us-ascii?Q?3t4yIIP9fgbBcFCqhh/J7lTIPnJ3SmsmHUAXqgjz182zDSWsZ0ct2Lvq3JGR?=
 =?us-ascii?Q?+sIjGD2TDm0Q9FUunkjrCtUIL8M2NWf3rkI7EE/0kqrBvxKKE5rW3oFGEpG7?=
 =?us-ascii?Q?j92KdbWXqv4zlnzxXksU9OiVxUZIjpfSBaIDetIZtQCzDOz05WO4D07O/2sk?=
 =?us-ascii?Q?zEzc+cLsO8y58whK+YUzNI4PPYfehKjurLL5cdeJ8wzl2jAtFycaiWTGh8XY?=
 =?us-ascii?Q?rrKYpw4ZCzmBgawoK0v5pN3z/iHECbYIVGeXwEazY/HM2vcP7XXikWdwfXfT?=
 =?us-ascii?Q?6EEenQ1lFJdStBFnaAhgWt483CET78s3lM8U7l0o7ka7TVa//LjjncBI8qG6?=
 =?us-ascii?Q?OV6gHvDIq7VzW8SXLDF+nWjzPnpEamo1PYSjpDcXBJ0Jh0mfsqp2uavZsyj5?=
 =?us-ascii?Q?jZfnXhdu19brrnqbOeiy9TWxJos+xDQsz3etNLhrloVSzBExlKC8CtVVwE1B?=
 =?us-ascii?Q?Sb1JnYueIjPvqvnnfdr9GYmri2TqsBie0Kb4+0Hqkrf4ScY8DBt+156Lifu7?=
 =?us-ascii?Q?lnAmDjvFdEDG6tHEC74ir+E7rqbAV689neicXgBoYUD7gzhBJMEpGknV0oyl?=
 =?us-ascii?Q?Zdahg+izlgq37spEPjA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd439a02-d7d6-4b22-059b-08dc2a940b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2024 23:57:31.7801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDVrxPgq1fvFy8Pqe6roJWkUDf+/gpwPuBAy3CHkWaGW4vBsVptOwZqKCxjpbfUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9722
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 23:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195280

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Patchtest
> Sent: den 10 februari 2024 17:33
> To: Alex Kiernan <alex.kiernan@gmail.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-Core][kirkstone][PATCH] curl: don't
> enable debug builds
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/kirkstone-curl-don-t-enable-
> debug-builds.patch
>=20
> FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be
> replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)

Would it be possible to disable this test for patches that are aimed for=20
Kirkstone or Dunfell? They still use CVE_CHECK_IGNORE, and at least Kirksto=
ne=20
will be around for another two years...

//Peter


