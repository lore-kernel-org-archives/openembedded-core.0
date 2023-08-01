Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3804EC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:24:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web11.17559.1690907049653435432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xG0bSpRv;
 spf=pass (domain: siemens.com, ip: 40.107.7.75, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPKUPoq1uV+O+0vy5knY3jxMxKuID2v4z/OP9QwATM7+xvA7YAr2qKRrcF8n/rOBbDUzHIdUjtE9oGYYKJ2vZm5HSIA45fCSbAcCPiUzD1c7DeTzz7HkAJILFhKjZYpSZBV0BGlC2Am5BZHt0/FmgJMHhjDVSfKye/dv5vYSZGdBtb7emTDif2uwWnuuMjbuOUOv1HdPBZWzb32VAzNphgOcxcWITvkzN6jhchXgUuTR7Dbi1FmD8IgxgUn9xrnuEIZWNosFsl2XjfBHz0n/PloJ0qGXHSIG3HkGaqXPDjF/l/sI82wmjOpwrKEWV2042XWUOT/RaHjp57K+pbW6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RVKeYPzix31HgHlWbhpGo7UE2kfJbIVCBnh/enz+gI=;
 b=F1mdOfVETtHi5DQEh0u/YUakL+/86bhNNpO5xoieCzixGyGQwLU1o/S2kBNb1noPiw4Bg2pByOVOFXNCzGPqDnbGjeFMPAagXprrQ6VAYF+xxa9hklmW9RJzBoFELgyR3yOVhqQeserysCRFqcbTtvcSbCvVWzJc/T6naGhAhwWvQafQougrnMWUPUDjot8tYDPs/MOupZL8tZktfPUp2G4rG58nqfqfmrMm+UUwDuYb3ZNAolpXOOTn8Ef4hmnNN/n4vvmO1exSZGYFkDD9Q2UX53zLk5xUQqM+SSChIFpElCZTgnwXg0iBSGBOyqT+nUWSiZnpxfe08MRE8I7SCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RVKeYPzix31HgHlWbhpGo7UE2kfJbIVCBnh/enz+gI=;
 b=xG0bSpRvXqNMon6NQl7YV+YDL4Fi9ZcEyvi/755z6IYWD3NxBxYUndFCl7EiUGWibQIj0ghOtX6ONNmBURm8pUrnnZL9Zujl1f1cn/bAngcVtuc65XCyJU4ZtFzjpXXx3+mx1u2IDk8heToTtA9prolHlkc4SyOx3cLtIjcnDDLfIDBbMNbEI+9lioEOumLuBQZNAD+qVrMiV83l7QtoJbSORv4iWRxN0KvsPagva3Ur4s7W/b91CD6Objt5yCb7wyiG54DEiXIADOTtCd8sywSWegcgMsBJKrSAphEtzCdDr6wuM4VAMJsftDK00jDU3mjI1QV/HX2an8RS1Em4xA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 16:24:06 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 16:24:06 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "narpat.mali@windriver.com" <narpat.mali@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "hari.gpillai@windriver.com" <hari.gpillai@windriver.com>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] openssl: fix for CVE-2023-2975 &
 CVE-2023-3446
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] openssl: fix for CVE-2023-2975 &
 CVE-2023-3446
Thread-Index: AQHZxJIcT8SPI9QG2kKJQQikKFX+iK/Vn5pg
Date: Tue, 1 Aug 2023 16:24:06 +0000
Message-ID: 
 <AS1PR10MB5697F5CEC45A35C6691F5724FD0AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230801160555.1469395-1-narpat.mali@windriver.com>
In-Reply-To: <20230801160555.1469395-1-narpat.mali@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6a051994-b1b8-4524-8ae0-675696938144;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-08-01T16:22:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6970:EE_
x-ms-office365-filtering-correlation-id: 00407661-1b55-4d79-1357-08db92abba22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qcq/k7+gzx60UBdONh9/2zAQmgDI96JvLcoMYSE69nuN7NbIt0m8r8EAf/KGugy2roiq8Mc3m5Wu29FI7qIXbRbqTjZ0uv/zQoFyBuhAQK1uMvMV7bcijPNqRj5L1JFZFmKJYSliSE8uwC1wimHf2y/ZjiCKYSyZn+1LcGIhFfwbnFKzGW7t+iWtpZWSryRO78TbLSKz5BQ2vXOYu2Q9+liZcq+Ss9SiGzU5t7HByMRuypo3aqYfLkQSSXrva89YIMFAggFYqXg8sz4eu3a+THyPVndX7OtzfvqhMHRXdX/k9l14LJ63xrxK81DvnPrV91dhTl/oMz49bjD4rJM4dLfyiFTmBYOU6aCeQ6n4XLLnuit+dFNwInIc9EDMXxxIj4irb5fG9ODZEua4vChZaS5ZC77/fbDqMBt6Zah8FcOjFuqmCQJocblhcZDcwGg4EN9BUea/UbiYIYlDlxnDTHYAkqvHX9KbY/QRN41CRr03gpC2upeMcXc+m5bGzPUuQxttkfrQL9lq+xeyBjGuxF3mUH8IHW9uJh+oh02Y7H5HkJjAUhRqYbIj725AYj9pvIqQOfodPDitiRmmpYDVtwlW+LMPsSSRheDUhA5mWJFUl132X4KAHV8VR9VvvCwrzX7fwP7Eys092fydhT8x4A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(5660300002)(52536014)(55236004)(6506007)(8936002)(53546011)(8676002)(76116006)(316002)(83380400001)(26005)(186003)(966005)(4326008)(66446008)(66556008)(110136005)(64756008)(66946007)(86362001)(7696005)(71200400001)(9686003)(41300700001)(478600001)(66476007)(38070700005)(82960400001)(55016003)(33656002)(2906002)(4744005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6UmnML+wFsb8lj5eby7+YDNetiH7XjwWnZtzE4BH3mII4Nnx8PELl3Sidvvw?=
 =?us-ascii?Q?Fx07loP9WwmGMjvKSfJa/gYcaWdzRCioeK8JWgs1sj4WXKxHNgd2vYVhj7Bt?=
 =?us-ascii?Q?FK75osEADlkiI1jQQPrJNxQLwG3X1WKG8HGLJhp5d9/w9iqXdzPb3THcROCt?=
 =?us-ascii?Q?Wg9hKXMRF/GREeafwaO4HBpzWw/N7exJWQC/xPQwTJ4iqHvGwViWuXYouYA7?=
 =?us-ascii?Q?wUUwvssf5e6Cn5l0VHeit5rZ0zyYI2t8HUnybupKb/nvu96QmEGbYQnCWrJ1?=
 =?us-ascii?Q?OUbPgoT3VTffeKeLdApyx1ARjTTaB9HuY1cFqik/CBOxutX0YLpSzN9H8vn7?=
 =?us-ascii?Q?cFfe8NiPefT7EpiriOLRrooHU+L30dPgXlGaeYnLyqal8Ishm4NRqeqDck9z?=
 =?us-ascii?Q?JZnuJzJqXCtynIyIiMpQSPY41FPCTRjiIEZQ1qQgwqFjZVcbIUwufLVrlPEq?=
 =?us-ascii?Q?1h8odGIcbYMHxkE+CmtOIFdSv/sPyLtv2L/ab/KH3D7LUW2gpgkY1KYNAD1X?=
 =?us-ascii?Q?5tqkm1G4lT3uJsi03RbeYpNfsiQo64t9+2Oyel9nWaywk44th4HUDlnZpI/3?=
 =?us-ascii?Q?XUpAcXxtf1PzUPQW8HhEMGZJDmlBgL34DV+zamYklsdfkHWxQJuGnY3FJo6B?=
 =?us-ascii?Q?xCzaoeEjYtGHuXwfioffoTgI6YUCizdcbGztFeI6kPc+N1rXPMK3Irfr1s5e?=
 =?us-ascii?Q?GAOMF2yphG/9CFf4MH5KRr7MxrMXvG0tAyRBzL95Qq9jIa6ZTfRPEsbM17Hv?=
 =?us-ascii?Q?szaYZESXEhyQd+SzM/zhquYKN+p22f/iXxJwR/YOCp7EoGEiDCoFCIo0FnEh?=
 =?us-ascii?Q?a0V4pR2bzv/ApTTiB7X4YAYlrpg8aKqkSN6pUwZm9WL5gGXLTXr494hPGSrU?=
 =?us-ascii?Q?vbCxI+NvuVAgnHUS4ODV5b7apjwydzXhp+3XHr54HDbemTCOSJx48SYQ6LEB?=
 =?us-ascii?Q?Q8ds4QFWB9rMclDRaLiBXGOZV8nu1WQPnwtsL52s8+3COXqMVM0L97VrhjzI?=
 =?us-ascii?Q?kfUuuBlybJl4WKwUjUL4NNDpXd+b8Q747w6s++1Xjn9AXHrQKidS+oQ06/88?=
 =?us-ascii?Q?3SzSZr7bDH9e1cPpESsSRj7YsQ/P9+FxlgPEpyYZtFljKnX5e5iwGgG/+dDU?=
 =?us-ascii?Q?5tKpu2FpXeI9dgC8FMYWWDxiIuprYXreS8IK5GPFjCe2f/hQiLoGFRf5r13+?=
 =?us-ascii?Q?y+GAznw+D5D3XqGlyiFKaqRrEOUfMXOtINa/HpAkGItnHYw3vzbazzNc8U+s?=
 =?us-ascii?Q?wNF6YsQLPcwMg+lTmTL8Xyn47bT+q2RhTx7z3gv/YLlCzU9pDEGqKjSY3mth?=
 =?us-ascii?Q?haonS+YMJqbeBb+i2xnvVCLGe2J5mXL4PcPVVlHVQvec2Czmr7xL1VlBFzfb?=
 =?us-ascii?Q?N8e0L7ZMxj366Kar7LbHdPoPu4rQiSBUscV3eSW3TGaw5gsuEQOTK7p9y4t4?=
 =?us-ascii?Q?Jgi3G7s3N3Sg49gxbbSsENpROyxGqWjVDGfabKniFpSp/F9e+r1YQ0Vt/Qqv?=
 =?us-ascii?Q?WbVyN8Ms8NUwiiERa9MVgt3tIFFa3+yaORTxMKMBpF59sBWxtlnQj7dXp0FV?=
 =?us-ascii?Q?sNLBPQ5a10RN+ssp4Xt81ABMo0n5aLbhXnSezKdm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00407661-1b55-4d79-1357-08db92abba22
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 16:24:06.2349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RF9mVcejikmmfx9zhpWSjck9zQAfAsZTHf0DjdMr/cx9wE6p0PbbpcgdOLPjMlMFuOC1OhTLrSNx+JRDfoHmKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185257

New openssl version was released 2 hours ago, I have sent an update which s=
hould make this patch obsolete.
Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Narpat Mali via lists.openembedded.org
Sent: Tuesday, August 1, 2023 18:06
To: openembedded-core@lists.openembedded.org
Cc: hari.gpillai@windriver.com
Subject: [OE-core][kirkstone][PATCH 1/1] openssl: fix for CVE-2023-2975 & C=
VE-2023-3446
>=20
> From: Narpat Mali <narpat.mali@windriver.com>
>
> CVE-2023-2975: AES-SIV implementation ignores empty associated data entri=
es
> https://nvd.nist.gov/vuln/detail/CVE-2023-2975
>
> CVE-2023-3446: Excessive time spent checking DH keys and parameters
> https://nvd.nist.gov/vuln/detail/CVE-2023-3446
>
> Have also tested openssl ptest with both the CVE patches and it has been =
successfully passed.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>

