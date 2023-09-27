Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9983BE80AB3
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:30:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.70])
 by mx.groups.io with SMTP id smtpd.web11.18984.1695825051111105112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ebh17MzS;
 spf=pass (domain: siemens.com, ip: 40.107.20.70, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP1+JEaPzcC3xTQAI2iHX1gOia3hRnDckSJETRbx7HQy+3NiH5zDqsyAq1oG6o2Yy9DZTBjA7rQ6tu7KvmVQ3hZ0Zqd40a6c2Cb05p3rHgrqBTGo78YLOKZAnmxIozut6j5qoqgB0T/5bhpo1Qi5IvtODiY2MsCc8dDJnDc9uKTxCcmzOVSwa0hlxl3U9AQ5Qpa0zAkB78GXGoGfKV1HR/QPFEkV69aWL2PetiysaE6AAw2F/FbSMzKwQt1JRgJ9vaPMm6S3cwOmwUKwznK4Ad5POCLX5o3rSFQIrc8Gw6p/OLk+nAZSbcECYziXjR+vTBGHg7tjGedR5DGm69izqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUXYSBTVj4if1eFde5mTGkLVTjQF/dCMRCqUFZnoM20=;
 b=e8kJXgCLpRsNbUj1fETRKahijMFdqGfSve6QBC8KqDP9NlZHin8obJ3Ch6gATDsRBGx6LlJolh5/si96syxCwCnqs+Z4F3E2vHWwux1MbMm9LMpkC1ucp3O1eg7jvtL3wGpOMm8ooS1DYJObwZJ0S/rIm5DvqVzsBDq1n58Nd9XOG8htnVeg10ltDbHP9i+PFMrlDRukusTyEMRwE9imNhm050i9Bz+uEEpRfLNzTKy9RDizWxAlRXY+5rNUxDw5dEu1tE3SIeAnCWCzeYYh+zr7GBBApJmdt3PtHQQlPckhCvaQrPdXYNrILPG8yrKkx2SYwJuEij1Tj4Xbaf+JOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUXYSBTVj4if1eFde5mTGkLVTjQF/dCMRCqUFZnoM20=;
 b=ebh17MzSvQSRmJrfHsbWmXfr7dbcyJHQFb3QBXcK2fHekyATvc/dhysWLV7i1q89K1WQs0mAk8WpYVTGa0J5fHm3ptPLDR8augM6/I2HTLoHBTCeyxX9dNiU+zTlyv45dEy5DyG59CSPStAUVj7EX/GGZXDBlO4jSa3i/70GIVP7ojCXwjoUyzpcjO/lapocSowTNItu698noaeBoOXFPTjRAmyfaaj7LghR9gHqTXGPxNgrN6SsuxrNLTswMjJvhE/JVivY6Id0CDgAgMAEUrVv+5umvFi0vGuicVfGd9vYBVLvRb42Ux+YlpAIznUupmHje+k5Tesvqn2u2Rpdsw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 14:30:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 14:30:48 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "soumya.sambu@windriver.com" <soumya.sambu@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stable
 2.35 branch
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on
 stable 2.35 branch
Thread-Index: AQHZ8RanJrqC79PrMEm5w8gIkz2gYrAuuONwgAABv0A=
Date: Wed, 27 Sep 2023 14:30:48 +0000
Message-ID: 
 <AS1PR10MB56970A2F1AA62EA46E29CBC0FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230927074534.1274994-1-soumya.sambu@windriver.com>
 <1788C757D99D61FF.25618@lists.openembedded.org>
In-Reply-To: <1788C757D99D61FF.25618@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3a455280-704e-496f-bef0-f9769cf7c0d5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-27T14:18:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6989:EE_
x-ms-office365-filtering-correlation-id: f9d4f901-62fb-405f-6be1-08dbbf6657d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 So1pRHrUdCNZVS/8rdgkRYJ9WjIxjrAOtD41mwT+Qj+0+bLTIMNQrjjzBWeDbQkDRWlxG1bIIf7DXEMnSTWiloSgMQZdk01QXs478F0IMi0z5fEVI/ah5G8xCR0hNbMwP5PpBrceZOkJzNK+MES78/hJaKWkOY5mpO+xFIVizDPYRUkrtoON10u6ExZrDAtfM3+il5Uhc5/cFq17kS9b6siM3a/ccyTc2vnOtIN3gflT64m9l7NhPtvLLQHqks2S5dVH+prnI0sXa1TvekmGWuiHFDfLs5/oiOOu38SJVYklPVwPOgpprc8EHAcasTzigKLzV5CqeEvbN2Q8y/Fd6slTz43eN6XDsTR4Im+XHFUReqmOu4O7UPv9k+2BkohOh+ZNYDJZZd3mcB6Sx6Ed9F281Zq3xNbXA/MfVFcIja3x37pB3kGv+py804oAoXR/QCbBfk9+TrGvzLq9p+yd7I37iHUyZwNn0wpyjDHMLeVICScA6h2lwsWzWQh22WvOrV2L/8puhXnoERRpygH2SQSlzDDoXp/nbJRCwLkBVUQc1k0cUAKKRPtlOdtkWSxpgmz/OZ09BiPqJqvFzJXdo+T1iFPCwCaidtkRh/E8Z2mjDNNZLEvwj2dwrWhmWw9X
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799009)(451199024)(186009)(316002)(5660300002)(8936002)(4326008)(8676002)(41300700001)(66476007)(66446008)(6916009)(64756008)(4744005)(66556008)(15650500001)(52536014)(76116006)(66946007)(2906002)(86362001)(33656002)(9686003)(6506007)(55236004)(53546011)(7696005)(55016003)(38100700002)(478600001)(71200400001)(82960400001)(83380400001)(38070700005)(26005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qBqELAuweuer5yIac51sjC5Soqy5waFRNCfrfE8n8LmbMi1qxn5xosXlv2+2?=
 =?us-ascii?Q?IuRxGd7JQDBZWWCGCdQQfpOLv/0w4IeuK38G6GKTvz0MwksEHpgz40FDS3fQ?=
 =?us-ascii?Q?1FIARphDxxA9yC2ElqDGe5n3IYY8zVuqJxUjk3Sy53cs1NtZz8cgj+2a4Fdk?=
 =?us-ascii?Q?iD0JexNZbHanZ29MW9vkGNemsmWWoOi8CG8IDnrX0pFdYeimCDq7CdE5Dumd?=
 =?us-ascii?Q?N+Om0JxnL8RYPy3TI7H1Y6r2+bN/3O0bl23gIXeZTip8YORPDD2IYBUE2LOO?=
 =?us-ascii?Q?BVit6wu6o1Dns3pW5OgQKdCKBBThCizI/zuJvxSDRlo4wCdfAoVPt4osZVGV?=
 =?us-ascii?Q?1DiBjYopwhLYsPnDg4hrd14l/WoIrtLbceKuYFC2mADfmK/wWu3ut7R2/BRO?=
 =?us-ascii?Q?osMcU+nDtye5UTXnizcHez9+TO22JunneYZuHtY68M9NWLgZW/EYvic5xHhe?=
 =?us-ascii?Q?cXtYvuQNyyMnf4QT7QmfrIxhEXqiqzQqus+tG4D3jODV/XRqLkJnk9zVAhnT?=
 =?us-ascii?Q?pxiYOfhdosHmt2iY3XIIlHlflQVG9RV9w4SVz9VVKa7xXS97arc0laFZDxFk?=
 =?us-ascii?Q?nlu70jV4bkhZo2MRa45Jj0sHlhCXKBLkRtOnOd8ju4/1ldltDsqndx0AJ4Ve?=
 =?us-ascii?Q?XC/07NIcWRDvIn4j18V4Q8hz9ospqF5NLNsN4GlaIZMKA1ipxeNk1EaZuExc?=
 =?us-ascii?Q?jcwRnVxPkvcxuTg8bJYCaOVnkNkuoOSsMXBtAsclHQiPowFzb+vCUw51Jl+m?=
 =?us-ascii?Q?36zyq11Ht8Mh3+tp7PkWrp26HVZf43ww6bwBoA1sumCw6bPTxZ8nqj+ANWaf?=
 =?us-ascii?Q?QeFqggpXLYpxFJz1t4yupuwRPQO7+Xibw1V3p8yR8zKFbmurPaDbW+i7s0YC?=
 =?us-ascii?Q?ku+jyOREfbM1V39IrFp81gAIdAyE2egvq38yORD/vSP1O0+WMkJzyGJkeytx?=
 =?us-ascii?Q?kReBqsrhWzheslNB9VsQUNdwx4iqTHQpUPXurLA5PUZmftKbRB2QANy/+Kiq?=
 =?us-ascii?Q?y01Q0sjkxVoxEVjtX+67g9iW9fczOgCi+rjEkQdViQSlIFv63moClNnI2PKk?=
 =?us-ascii?Q?RezQyPzy5gY5lCKxNQczMKyArlwgrUDOs5s6fX+GOC+BFQwT/W3Lyeg6rt8V?=
 =?us-ascii?Q?Mk4rEOa47u+JlSXRh3hiMkLDYz/GvbXfRszdUCtu39A49U8eYBMjp8kRPZ80?=
 =?us-ascii?Q?6CWXem2mgxl9eEgGLdpQNl55Uksl9ZpLnm0qpnTGFkOyGC//QiBzbHWDI8/1?=
 =?us-ascii?Q?Eki7NLRZ2V0lTufuFbzDfWuVdHDzommjzyoHKHDqHF1ZSXcL8gK4fmoO5yGT?=
 =?us-ascii?Q?KzPO5ZlGwhH8M7PauWOPlTeY88m7SGrWz9G5hE+eQRpeWdN6Izfdqj4GU5NV?=
 =?us-ascii?Q?PkUbbbuvgVTrgK9HgTRaQspy/ZU9vgtT9BoNR1bjDdGjqjQ2l0DUvh6sYZxe?=
 =?us-ascii?Q?ZFEonMJRVCA1nfob+yFBMK/qiQ12APN1OXU4FUU2Ge4qLprgJe3hVdS515NR?=
 =?us-ascii?Q?O6YkK0W758+OAIgH3n+geSXX9VCsRtroxT4yyylmt4zzx0I5oByx9b8eLJoR?=
 =?us-ascii?Q?jzs2/umJgQ6V0xiELCqlCP4xPLEYBlVuRd2UW+2L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d4f901-62fb-405f-6be1-08dbbf6657d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 14:30:48.4349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8HuEg6Qtiv5VPOR9OfEEbzom6ip06LsdnpKt+ij3y4PiMGxDVeCeY3OfyLVSwPXaxmtcmr5xc2TcAZXz64aYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188328

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
Sent: Wednesday, September 27, 2023 16:21
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on sta=
ble 2.35 branch

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Soumya via lists.openembedded.org
> Sent: Wednesday, September 27, 2023 9:46
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stabl=
e 2.35 branch
>
> > From: Soumya Sambu <soumya.sambu@windriver.com>
> >
> > Adresses CVE-2023-4813, CVE-2023-4806
>
> Could you also add these to CVE_CHECK_IGNORE?
> Otherwise they will stay in cve-check reports since the recipe version di=
d not change.

Additionally, this fixes CVE-2023-5156

>
> Thanks,
> Peter

