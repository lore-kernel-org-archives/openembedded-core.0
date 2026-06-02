Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7CBCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 07:42:09 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19569.1780386122327846576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 00:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rO0+7Y5p;
 spf=pass (domain: siemens.com, ip: 40.107.159.67, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg1KlhHduDXtejTEhvlHcFceAxpM7VcyqZBd/fgPjoSICVIq5oQlyb+LN1BFHPKHYqiMb0TnV7BqkU/kHTlBuxkbn8g2PoGlu+k7FZa8lJPJ6Bu/WpqTodQCUNDeYYSmGo4RaDGqRRJhYDz5edz8fqg0venNnuoGE1jblpSIIoL43cXb2rkt3AZGEjcthPd5twagjQyLUTPRHP/9YBeey1wJD7ZVShFGywUAxQiexpvcBEtusN915zQ4FH0tfkKK2n89G/rEQf8uSP/Z7gVIdWYWG8pAAQksOXkMCLUqq605CKLoxOdWyZzk1BJKRD45eEiIiIcHvIsqpmk9eQxmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eutJRvO0xa25kyUY/sXu3W6hW367HC5UFZ5bJypgGB8=;
 b=umzgFudMW0Ony1t0Jep5htnUASF9U2qIyvUpX+ANcC1Xpl+UtzOrvBi+LBP2gwwzt9xLFvWB7Q37RYnbSe1maEDvUTbCDPWI55nMQgKQvLBGJPgKRB7XikB3LWxI+qHf/Yf4HTAhJBxahn6zqY5P+UopgBF5xgw8gWJ9FI/K5Xa0XIFcEOCrX8yZuh3+RGYzBTQ+Y/S0sTYeLxcaBDQFM1tuKnudq4vY1NEbi1qNSWQHn9fv1TAbobAqExiG7BKH08ypm5AQDT6+NBNoE1qKWaTU+j+Nk9mXkdAvAdCnfIdClY/Ggv/483H3+Qd2z1hcFYuJOkEIsKON2iyOO4mkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eutJRvO0xa25kyUY/sXu3W6hW367HC5UFZ5bJypgGB8=;
 b=rO0+7Y5pBBtK1U14GMReD0XfZm59faVMWf7ZBjwD+ReYR/xNI2q1B/h0EV+7E/XZhJz49Y2Ttr44fXzUYcwxmXZhpGBZuGhApoWPMJqAVLkcrvD9TTVA4MBsVazQ3FtYztLmzaq6CKmy+yyvtLd5nAMHrOJcWQ8H00Fq/qRvpyLzIqUDnhTkuJb8trZDKGkngBNMFlbMu5+am/qWvQ1R4Pbc0TK1RRnPZd/3Y2yOPIJkMvm6dtvErZWN6kNt8An4t4iF5iP5KsdLTK5ChoNY93gd7QujOY5l9KhxSOBuufIe4G6yt39tKIZRgzVRlSBAYfat+PPbjqMhB6JIkgLKzA==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by AS1PR10MB5337.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 07:41:57 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 07:41:57 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH v2] time64: enable 64-bit time/file-offset flags for
 32-bit nativesdk
Thread-Topic: [PATCH v2] time64: enable 64-bit time/file-offset flags for
 32-bit nativesdk
Thread-Index: AQHc8mNKK6c6eTekeE+gxY/V71YTYA==
Date: Tue, 2 Jun 2026 07:41:57 +0000
Message-ID: 
 <AS2PR10MB7347107401203B3EC64BFA50DB122@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
 <20260529170117.2241639-1-peter.tatrai.ext@siemens.com>
 <CANNYZj8USQFXd+T0F718vuGcN_4j0kOg9NRAVNk-FbXe=HV67A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8USQFXd+T0F718vuGcN_4j0kOg9NRAVNk-FbXe=HV67A@mail.gmail.com>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=15c8394e-dde8-4fa9-b62d-6c593e76cc6d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-02T07:33:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|AS1PR10MB5337:EE_
x-ms-office365-filtering-correlation-id: 1505611e-0d7b-44ba-bff9-08dec07a6c94
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 TgGNvC3UG7XJ8Ie+Z9yszp/iBx/kWm4x1NYtsmJDbDmd2dPbCOtV46C1Ftm/4P85EQdwLbE4EsHvUK87aeEvGNuWaThNKbODgAcX/5CuDacxRTjB7jszInDguGXr5BxzI8JAdzxtGwZ+eLfGvlr4ghc5YjLtWsN9w15rXmjSWaGsqlQxgS5o7uaP1fsLn5+qwJ3VWH8xqkpvKs8n8dt7tDLwfw/7WlsGxceGr1FcCnqCA6k32GciSc5GGGEVr7GRTbfZt9Hn0t0pnkjUzb7x1zNz4l8azVgFgny5T18vvpfkME5irS5rQeUk18VGzEaaWZjigkEmNS4y0fCkgsM3v1zrHjGtnlz852PiKA+sxH7qRZ5EdcIecHccYriOiv2YDQqN1TUvPsbEkIEULeDDW5zYTsQwVYy8HABbuN22+SwEmB7I4z2RtF+EBdOEvDmrcmQeY5jMovCX2FDia6R+nKkXVK+Fb0jqKsuW+hEw4zb3SPuISLJNkboTuIk34h+ErdXI/COfYHBDYrYpejc3hXeZnsauXAv4jC8LAeqPordZmx1gmrI2e7lRF2Y+lCEPsXFtiAtJZBB3slwtr2bN6JI9ohMGhYui2HNCIP3tfxwiXmGMYz2Dd17Erug9PbPRMZL6YcPqaoiLsqzcHf7pPjQPi2envlEah9E2XcLKcVQ50Gk/BEQ9g2PdOtVhx/gxPMj1GY3+T0NrjyJJqnIzudfBVI3kNfTu4FepwI2zkJRU42AZ4ZvgRECgB/TVineg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7hv5ZE8fDbnD1VRXMwKjVyZ7fMxUjcWZv8inFZN5T0tAzNFscwaJDV1YHFBF?=
 =?us-ascii?Q?OoSfYR/4rYAMJbobFZQbuKSj9O9yv2jfvYllXijF4BBS3kD7K0ptJd5KkMbU?=
 =?us-ascii?Q?xtR63sNvAQwMxvFIR4j8bjYi+lVyaO5TRCX+tiv87mHzaLLEuwWl9vN1TvZm?=
 =?us-ascii?Q?2FvfHijPoCbQsCU7gOqb49FWrf2Jq0S259uvDg1qFfzfR/NLvuwsRWawt+b9?=
 =?us-ascii?Q?KcLKCIw8+fBNAjjLkjTg5F2JefaYzwwWXO99mNvB65V8dsyV9rpF572uzBIc?=
 =?us-ascii?Q?AQ6fgwjMfQJUXVMfW5qvqyPcDBL/QIlp6MdvLIgIxAn6bOgXdM4PBqHP3f+v?=
 =?us-ascii?Q?Aqy4vEkQoZ1orCQIahyJjzC8HL09T/llil3GkO3cL/0hkhcpeYXiIUgrx1Yi?=
 =?us-ascii?Q?pwqLWuwWR1bG6HxiJLRkBUrPzUOVrtdSPidk9u3OtQIjlNoZnWkhwjN5JfdZ?=
 =?us-ascii?Q?Wl9rSNSwpVpeOm3LlsZThGKq2Xhl4RVou/rmlqn2znd6vzJZAm1yk31P55Tm?=
 =?us-ascii?Q?rNgy7eOyFri58/PKbEKbJ72YipnCYKMYiE64CAZakqMA+i1wanAsBppFU4om?=
 =?us-ascii?Q?RL3Q5HQBGQySIRc/M8pHE4sSjlS68qjU7isXyKVPAls+6gi4jeCagEaR6L99?=
 =?us-ascii?Q?7dVUW+bkpHbZR9nuCdPoDTshjBlyt5sWlhkbDmNK3uS93MZbVz4gPTS2Ch5o?=
 =?us-ascii?Q?PfO/XhVVAty3D7hI3W7MQGepybxkz6QnwFwzN6931n70RFKuN6+Oz5QETWgd?=
 =?us-ascii?Q?8ZA38dE6mObd7t1Fq3QXTAoswCDSsMmsUE/rz9WUlspNIIsxXPMXtbAGCCmW?=
 =?us-ascii?Q?3oXln/npOr1k91oOoEwXQ1TpSBmbZeYWJKYqv2daRv5BZEZaSgh1Qhndn9HO?=
 =?us-ascii?Q?kGgcaZWjNQqE21EYJHQzX7xoUzGz54UJ6J1tWg7IShjGvq12nZF4sECBJelD?=
 =?us-ascii?Q?Lz5Suo2ziLvUyWwv9APcZ5HN9p+G5n0ie0AWUzQ91CvZiA4nB/C3eQcGnUdT?=
 =?us-ascii?Q?9FRWhI7Igi0G91rtU+OwUe7ciYqqUr++edTEl3sasfYnpVSPnuPxA25t3T+g?=
 =?us-ascii?Q?dLNhtFoaCWIhfDiHf0KYlC+qX0NNKFTceJCl4yIFU06u/JdFY8APOyS9VYMN?=
 =?us-ascii?Q?i0UXHFtB4wC8Ugta90IImWlu8PVRBjod5W30sHjVxxRtqmeLfUBTyZVRLFD7?=
 =?us-ascii?Q?LJcmWEwN9hl+3fjGd5eFTHrwBLehE+noLCaFgK9XHTKKAsN/aSFCpaKqZeCs?=
 =?us-ascii?Q?OymG3+26/gM0vTEqf9eXM0VU94FZUO7YYmBSaoC9IBsV45FTpXs/3IKNHDOS?=
 =?us-ascii?Q?CDB8ISavcIQqI2U2SiOvQj0VeCn/VX1lf1F4dWNUzKqFwLQICw3O39Brk2x/?=
 =?us-ascii?Q?vqd7hNV/Ow+d/5baufDfb9GMSqZenVc5CAEgv/kWCz+cA2Dta6DMjQ3/wpMb?=
 =?us-ascii?Q?mhF04m8AFWxdFeUleskU2zW19yL/TpXsfYVXAOvDW+43FETCJwQkvgCgi+40?=
 =?us-ascii?Q?kVZxUp1BkCMxEl4ryOXVesVp1fjdFFXAGMUTbqgAyo7WpwA6qQUUuGsQK0bL?=
 =?us-ascii?Q?4gSghip7+0PnnAn+guEqwFZZITIo88blZpbUiC8R6eGjrosySWIS3lwwv7av?=
 =?us-ascii?Q?F010EG7BOuuPWo9P/nFRy6EqqaK/WFTI4HPcOZtdi1rf1h7sUWBCBplzXSNK?=
 =?us-ascii?Q?baRNteJybQ0SaKWNm0T8AyqVBPLI3u/qxXSyBvYzr1hWMWVOic7hA1yjBBww?=
 =?us-ascii?Q?lyn8yQKwpw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1505611e-0d7b-44ba-bff9-08dec07a6c94
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 07:41:57.2966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lp+2IAOm23Kp3pbnOkdsBNA1q5Dk316S23/Vxnwc7WYXaP7d+SyCLk9M4uMVq6VOrnhZ/Fi2qHWyAxoUcgXE743PnJ8OiA5IAboRiArlKpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5337
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 07:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238012


> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> So the question: how and why are you using such SDKs? Would you be very u=
pset if
> Yocto no longer tests them?

We don't have a real product requirement for 32-bit SDK hosts on our side. =
We are only carrying this fix because our Yocto CI pipeline currently runs =
the same SDK tests and fails without it, so in practice we are just followi=
ng and mirroring your test coverage.

Peter.

