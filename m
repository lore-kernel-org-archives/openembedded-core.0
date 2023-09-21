Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916F0E706FF
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 09:45:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web11.12213.1695289555840196467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 02:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mTQS6lye;
 spf=pass (domain: siemens.com, ip: 40.107.22.77, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1knk5tmSWagegtTLgb15gTfPgM0OU0wuADzNRgWg9jSzwCXDy0ZiMoltC7azsWUB7X/Msm+rrJGzZTZlODDZpLiiqWI7EAk6F1iJrwma+tt5LYRY5EZfQRPraF+j102z7EDE17GEny+2gtEV2KIQcEN76FUgWlIWGbP0mVMrGQRaOYJXMJTRYsEAFcmousLjINAfutOFOCxAQH4aNKIL2AP4tAFvRzHpNjQz+4xem5VzLW70wPm47N6r3z/5rtXcOh9IclRaUKiZTHWT+3GGMwftLcYOYrX91VX94HwMNomulpH8y8lKtGu0klqSPqH8QEXURSm8M9LnGnCG+L1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jssCjdlcDfgQX+k09rGG1Zp60UVw8OA8h3zv5TVHV3Q=;
 b=MRmJcoD+oN8LwZg1PgTujP3yDQfmEsTwK9mfs+KAXEiES1rlpB2Ad/4yDfK7uDViXpjCE6eVlKKlteLtuWKNDzzhBm2zw5W0bkel1q9P3igJSvHYhlkCVz33srPGocGYMgFxHCiQVQdSUPmRkqXRYO2J+U8aYQdiKfSZeULaFMtfFl7KWqn11dwQXctjyUHv6/TuaIiXiaq8W6zE/mITyaX1fkysU4oTvEzi5q+AbbHRNPCAmGY/LXW38aYBsJLrmyK/9FPTfa6nrUPhsPVDox04Z/H5c7xn/euVGnG7e23W4Ik6UPyNygm+VKEKQGxAefghWo5beN6EXJUKNbO/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jssCjdlcDfgQX+k09rGG1Zp60UVw8OA8h3zv5TVHV3Q=;
 b=mTQS6lyeiLcSYH/Hkn9IIev80OH3EwJOjwz3JXVkROC8Fv/uyXym1D+mgnceBit7sl1qb/s+VfXgyjpRwOncT8HaZFEvGlNpp55Mu8NYby4ME/8mMjA6Joy0Biq0k3gbn2pY6nWXridLnIC0RMV5qlAovY22lFuksX4UoGjL1J30+2GTO0onv0VOds9Kon2H0ldtWNoLfqLx0yMOVvdaRCcMDVss3LIwRrm/XIihItW65xxYyPnebIQKuSM/CwOJxBB65rb33ad1FP8l+WbGhbo9wS8asFFDaeY4qlkPFLlA90GFn9VTWyE15PJycqlyFJwcz8ae64gzGCCyH0IcMQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5240.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 09:45:53 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 09:45:53 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "shin.matsunaga@fujitsu.com" <shin.matsunaga@fujitsu.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3
 statuses
Thread-Topic: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3
 statuses
Thread-Index: AQHZ7Gp96LM1ynRT/U2i+B74ZCgEVbAlBizQ
Date: Thu, 21 Sep 2023 09:45:52 +0000
Message-ID: 
 <AS1PR10MB5697C5C3991F1DC0400135DCFDF8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
In-Reply-To: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c737ff4e-44ed-4a8c-890f-01aa313acee1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-21T09:39:22Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5240:EE_
x-ms-office365-filtering-correlation-id: 17267294-dede-4ae6-ad6c-08dbba878ba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9SOARhm7XYuz3Pow5W6vrjlJhzJns0mk1cy6/IsnW3Prs1Pn9oYXmudplr0F1D+TmYSZa9mYWbK+WYWvHmFwj81tURYAlXrhFPsmIKQTeC9zAmEjKduWvS8j/Gowk91H7mbdEUKFA8yNSqoTMiKTH5UDbg66Cec6z+UJfJ6bioBNF80QyWYBRo+GAArsBvD4ptnIKAbM6hFjNpt5V/MCV6yzqRi0wZuPp1taswMagriXAoGzrl0LJR+EX0xv0OTKLBch13Y+epoGeBboiFRKxFn8eCopzO/CczxRVTbzYvRWm960IVWaLi2JiqsTg5G1p59rmolwoZBOVqPAwP+hEMiXua06ppLd5vI5AnrADFZXCBQLs6jBIJfMa53v/zkOTa0snVHwHtAZWitg//9YGzlBEzvbXqNwfjhrHl+nBgig5bV2x+axYfKuJX+GptIE1rwtooKLqmUcmT99boAqVqaaSd5TNKisRIVC43jSqybN9djYqW/1JiaFQ1kuwBQGVKWBod/XER/6Bz1Sbjpe+k62xzE12Tx8cU6GZ7EbQ0tanKIgYzYZmzZbXS960F9Yc8ouojo0SSXZiAg8JNp6mBe4Pn7alvuFrigyL3kXNPPAw1ramkv1alDMR0Hk29tb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(186009)(1800799009)(451199024)(55016003)(5660300002)(38100700002)(26005)(41300700001)(2906002)(122000001)(38070700005)(86362001)(82960400001)(4326008)(33656002)(8936002)(478600001)(55236004)(53546011)(9686003)(83380400001)(8676002)(6506007)(7696005)(52536014)(316002)(71200400001)(66556008)(110136005)(66476007)(64756008)(66946007)(76116006)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6NXgqiakPla9U98/LP62LI6LvZanT9+cJrasWgWRJ+Zm2gK2+SI7Gf3ILq6F?=
 =?us-ascii?Q?WLzOeRnQ2Kt1nKK2lFOc7l3C+/I9YLACRnwzuZkuCKM8E3VIulNeXzqTHwZ0?=
 =?us-ascii?Q?bQ7GUMjtu5wLog7AUDkqNifuXb9v74B/ckXwUPiNzR3iuq8WSCveLMDwGlOF?=
 =?us-ascii?Q?ZuXTprJpJr+QSzO2o2lIAgvl7ztqbHgJINZqL4rVnjw3tz2rvRu3Aw1MCipn?=
 =?us-ascii?Q?KxfmJANSk5MF/zIosKGm5weGXMtMSn9HluKS396eGAIjdgKDmkim0iWYz0h7?=
 =?us-ascii?Q?lJbXPj3cv2kTnwQqo+9IYAoKlSaY9JMU+Q7/bSNjmAzOGuZCTwYFqJfSU6XU?=
 =?us-ascii?Q?h3BACvDGxuQEXkAY9lG5o44Kv1Gsx9cPXwL2pk7VoUUlpjyXhgP3hzlGA5f3?=
 =?us-ascii?Q?FDxc7aWw9zXpylJygBj4TGE1bex0AgfTxjelwFppVGaNaWxjobGQgRuyWWmg?=
 =?us-ascii?Q?VOnP0bZsKp1pGKcyXZsQSGh+yVb8a5EJF8p/Prek6/KgpNIpNjRQUeAOu/qM?=
 =?us-ascii?Q?1i6FybE29Lg9vj90OCP8bw5zc7qQqvoWT+Pi8Hx54C0eE9bEprMAXVw7RQki?=
 =?us-ascii?Q?Sbp9eSiHWtxGulfiI7xNxywbgQWQTmqdTH3wS3T1BNWoQ0wTlT/AEO7KhT2b?=
 =?us-ascii?Q?8rSlFIqgzqeBjcDJf8mLFW+9R9adV4XnjhpZfLftf8fc9AK1dX2XknSGyjkI?=
 =?us-ascii?Q?A5mZLxr2ClzPVQBOoet8y8P2sWgU3g8WCFLsG/PPYEplXTaGcp/vEAIyaZZZ?=
 =?us-ascii?Q?zEVRYMZEhojzIpukv5q0oFtVPzBQeMJ4Bl0byaBqNw58+Pn5STJA+PqOSvG6?=
 =?us-ascii?Q?t0Xcq1ZRdAMV+hXJNyli7Tsz47tRgFyWRacrNj43/k7fQ3EVja2pPaoeMKDg?=
 =?us-ascii?Q?SsfEiEnypZbHFKo2nQN2OeSsaxHxdiT418Pm5o2XVIsddQtseDCgEXOH1NWl?=
 =?us-ascii?Q?h+cqYCJX8DSBoKGg8SZ+FtFhbQt57hQEpcjb1FF9226rRyc8rBkvLQFBeCXD?=
 =?us-ascii?Q?WKnx+ePLYif7ht6Pg7HkvWtLXCfKj9zVfAOTmmbv053jJCQYpKAlvGbRRhgc?=
 =?us-ascii?Q?vX6i/eLZ2PAoEfbYvdrb6IAUNkFdAcPIN7nRllRfV2uotVjMoskN1U7s6c5C?=
 =?us-ascii?Q?bRpnE1avUcTenuH17GwU0BQYYcroHyP1JflaH24qIruOWQFndo9S5yQx4GR0?=
 =?us-ascii?Q?tWtrhaZpn0d8ckleRHNgdIzh8B2Kyt0zCHhcU34y4r2Lsxjyk5Y0QMWeitZG?=
 =?us-ascii?Q?GMQ0dFfYkYgmmxlbgpYzp4sxYJA5LEUs7wqqw61TJiMvx2AETRvMcR/Ql1tA?=
 =?us-ascii?Q?wJt/9D59RyAFNGYlqE/0X8siKFrAgXkheIh7ctIx1WpnxspvCjF/fiVEB8X+?=
 =?us-ascii?Q?1otodH0RRCLdFGjtCbzed4A9YuqW6Ju/LHr8LOiLnrFZr+7DO64ASgtqyBsx?=
 =?us-ascii?Q?SKJupc38BvbD2WkjgT1pmS8yqsbjbSh/a0Lpro3RDfLe6EwadicebLy3iPAJ?=
 =?us-ascii?Q?zOX51vXvp5zHTWTzjGdUkoWHdkQmGlzQ0LmYazg4XL+769spmxesEn/O0NSP?=
 =?us-ascii?Q?NRtOW3laniw6JkWIHNwSCdE3Y025oaCksKFooNXB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17267294-dede-4ae6-ad6c-08dbba878ba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 09:45:52.8657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVebe7g6cl1MJrXezA800Kw0J5CoHvGXozQahLG/DSPVHw+k/RfJmCCXLYTShugD5tI3435T1bR+PHjJMewy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 09:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187985

We have recently introduced CVE_CHECK_STATUSMAP which should be used to dec=
lare more detailed status information instead of introducing additional sta=
tuses.
In this case, "out of range" should be subtype of patched and "undecidable"=
 subtype of unpatched I think.

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Matsunaga-Shinji via lists.openembedded.org
Sent: Thursday, September 21, 2023 11:03
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org; shin.matsunaga@fujitsu.com
Subject: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 statuses

> CVEs that are currently considered "Patched" are classified into the foll=
owing 3 statuses:
> 1. "Patched"      - means that a patch file that fixed the vulnerability =
has been applied
> 2. "Out of range" - means that the package version (PV) is not subject to=
 the vulnerability
> 3. "Undecidable"  - means that versions cannot be compared to determine i=
f they are affected by the vulnerability
>=20
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>

