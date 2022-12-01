Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762FBC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:20:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web10.44510.1669904395355141370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZCaMx/MZ;
 spf=pass (domain: siemens.com, ip: 40.107.8.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elNnsAG9u+vjd/gtUnNfXepLhg1JbW/DvgwjcmQciqD7CyNyhDGupjymYjPOswksMTSY4TyrAVLJ/y6UsQGcDo/iddXiOwt3TSn363m7GfsPHRd7UMjeGiSYvd4+r6ufou7jEMP41u9D98aSUNfQd9OG/xgFkWVeTZoemW9hwtXqdULXLNo/pW57HvlgVgSKom0EkwK7BZ2KLY8Ykr3hyqFychIK/7KvOW79FVC4LkCkXo2Un5o/tip16MGfmMm62NBE2vj6gtsTdw+NZBsvPcJdnCigGlyKu9LjFYEds1NCzqFPN/5kTcaVSX30ANB2CvN3B0i9/0JEkAZBIVWA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1EKiqGIapENqz6y4RLPGH0DgHv7EhohKKwXGQuBKr8=;
 b=cGmVY5IY8OdqynyYwKvNxZ0vNRalIjLMh5drEDwm17b8cSnY111lN7L20kX7zMKXvYyRMU2inwalWC0OqI4atSfYq1VXgRw789lEV2lmHmXmYA4PSmFeIULhHggn6KRrh7OUcFj2GTMhX5LS1UEaTl1m13jO647FTZ1vvzgT0LN7pzliiec8045r8XjwaghLOx0wy92zz17EmFU3XBKT8sp9SrvoQcs1FW767v5K9Xlq/qtgPVyn2BXbbsDjO7P9uwSc4FaFL5OGmxuFtMJhM/0tDaAs9Zi33tmiQSbbid6LddHcNKiBCmEwkuzmVrKHsT3lWlo/eYmknDEqzgU8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1EKiqGIapENqz6y4RLPGH0DgHv7EhohKKwXGQuBKr8=;
 b=ZCaMx/MZ38iwodX3MyawprPDUetP0Uo7bycSY5I3AW8+ML1FnDFl5lcb8bDMCqtprm+bN0KMBbmpdbdky9lAVjlq/5XDrnEYBlLDvdAW+BwaYTs++DY6dPQu5qDjMF+c6+Pz7dwdhN6+v7owPCbNo5iMIepjZwHAAKIBItU7ap5+7wwZNeQJ8OqSRvw1d7aLZSCn7AOtsaRy5ButaLflFoitmGCbf0nPTsnmVV8BzLVk6ijQJ0CYZBdKeJZl3A9c3AVWiDdq9HsWpSvctZKNK94RPJxvbYhmDIjJdIKkfZ4+RfP2RWXUcra8TX5mB38mA5eUEKrGjG0+lbV0y43+Rg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7817.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:34e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Thu, 1 Dec
 2022 14:19:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:19:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for
 .gitmodules
Thread-Topic: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for
 .gitmodules
Thread-Index: AQHZBY3q0erKpRnKFUG8ePLXOfgeU65ZEz5g
Date: Thu, 1 Dec 2022 14:19:52 +0000
Message-ID: 
 <AS1PR10MB56970A0D2B67A2A1E0BF7F0CFD149@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <172CB0632CCBE1F5.27320@lists.openembedded.org>
In-Reply-To: <172CB0632CCBE1F5.27320@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-12-01T14:19:51Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=377a9d33-b30b-4607-91b7-3b6ac5401413;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7817:EE_
x-ms-office365-filtering-correlation-id: f1718432-fb6c-45fe-d399-08dad3a71cbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Cp/dVtXenlt1DfFchDBfKAVqRrBJ8N1IGRRfs4Zj82Em8TPOGa+3OoJNtGSWpPtvVaMONRQCNSm7VI6FxmjoNz/RUwOf8rW/AjCXiSeLggQCP42uZuShWiEa0CthXTHMqOAePKcfBA3wvkn2ZODdk3WG6WTBVQxvausiGX6cJRE/9EvKUJiMeVaD8pWYmFdxJbIVLelZZHHqeU0LCugs30NygwsC09cbD2teHc5xk5+CbQcDS7EQVGy0+MZsf9uW7fCu3peQzuAAih34YNGfKxym9xHl2B9kHBV+QAov3Dhe/Iv46/lyAArOun1eeRguQXqSgCX47+mt2qtRCK3LHXgzC3nM666AU10CyfcEWRBqcdZ1bKAv0M1wP4D1WZoc1NLRawDBcmUqEYaFZ4VTsrLCvVEZ6RTco74Enjysv4Fi76NXhRMmuF+1+Y5j/PbVM18n8nACAhQoYynHXsdrZrOu26o1DiV7yTaq96f9RW/otyJK6e0F28NlMkIX1+6xSg01zhCf4srEro8bxqys6Bywhjy1V/WcTq0TK5FephwXmpojlTeEgJYOoQLk+hsF9oenR0Dxfk+xTyGviFpWLWa4UcqneX7xOq2PmKTWrun1fHvlywEa7S80PtX1T/dzwJ4nvx7IWGnp3gfyUqPvDD4pcue6HSzF7bFXwVJJk6swVD1PPHNcFYE9bF/ykypYfpIkT/d/j6YUyaDQPTKcoYGqP9Kx2Gv7ROzdLdLgH4Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(558084003)(33656002)(86362001)(8676002)(186003)(82960400001)(5660300002)(38100700002)(8936002)(2906002)(122000001)(38070700005)(6916009)(66556008)(71200400001)(6506007)(66446008)(55236004)(52536014)(55016003)(76116006)(316002)(478600001)(9686003)(66946007)(64756008)(41300700001)(7696005)(26005)(66476007)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wwghthNh8Whd3hKpvIelZk+ol0CGbLV8qEIjPm+z7ukPgQOcpbFVQZ7tMkEd?=
 =?us-ascii?Q?Ye7iSonkmcRKd94jzJfaKlUPtcgw230dAMWguYhZdiTpo/IvxTtiA+fnnUt0?=
 =?us-ascii?Q?YP7XgyH6/I7j7DLLcpWgZx98779gKzMfzpj5qthm18a5Zs9i3p5yd1veZRKC?=
 =?us-ascii?Q?wYLvquxRAdlRu9uqwIKeRutSSZqc0JYC5BiD0hPTXCqEROvEJbTqO6NQeZy9?=
 =?us-ascii?Q?nsEIdL7reIYg8jJJ6wWqGmXQ+kCx6uSOkItTzlaC/x+BBihY5udrhRSi+bVy?=
 =?us-ascii?Q?s4jAN48hsdHo8ICZl0nu//0DtZ9NvIXlv3XTKTnxondB1dy6y4IvcDoiLBda?=
 =?us-ascii?Q?lJyMpYyqsUoasxrYmHXRD7UuDquCtvXfotLFweikOFkp8JB3rQzBUIGT4BsJ?=
 =?us-ascii?Q?rqaFz5sKOw6bIDZ9n7F6kND1tvR3JWecMLdvxZDfnSwseyk9Kk0zLKpmat1x?=
 =?us-ascii?Q?qcs1SEOXimfXapFmPoWP3nC89pPjPfzHcsXHijNZFY8OnXopvjpwqzq2hvY3?=
 =?us-ascii?Q?nHJZRWRN55kOWNNgtjW37/cunTmkakY0bHZjaLJbqbFEudlS3I7/5Z1mPEpK?=
 =?us-ascii?Q?VpmKSezANv1ownQUwvGb/dl662Pk1zdANMHl8IVmty6hpugr2YQFK3klq4zB?=
 =?us-ascii?Q?eoRbOeQafdsu8ZI87/IfB3bM5U+BU1bs/hwC6oi37EefNeyYVHy05Y7OmUtg?=
 =?us-ascii?Q?f5OSYZMwVPqmiZ/nznM1rTZHO2iRE7G2NV4VeyUQ+V8HevMrpFLyWz5uncVN?=
 =?us-ascii?Q?u27SDpY/1KOnsU2KYllUVzg7KR3ThzEq9nv6wm0evcWb9MD4QFMZvxjfjl18?=
 =?us-ascii?Q?gN8ct4VEyrrHY5wcZflfFTmwdEekcl6e4D3mMSoF1M0vVr9I0YWF3aT9ts9N?=
 =?us-ascii?Q?oOXDEB2aNf745cVfNxUroQu9f1SdN5GF0QSLYTTe2VEmBk+Z0I1vTh/45qgI?=
 =?us-ascii?Q?uCqMcRsu30Bwar652Kkqx+zlTuedQ5/TIRrxu214sEeBrTG6w6bR10hD7VIl?=
 =?us-ascii?Q?+te5zbJ7yWQJYDtQIaQ+wc1xDx+4PA8C0KD7AbZOcqR/FjOIChrh9ArQ07at?=
 =?us-ascii?Q?58E0hWCvLgbNuM4FqrRqeZrkQ6FoaKXXcInCUjF4gIvkEglg43z9piizDVWR?=
 =?us-ascii?Q?8gdm0/T4S1Jz9R6zk2R5cw+YFCqQIgDUhHYX7XO2rnsQQvJB/LR37SlRbt/x?=
 =?us-ascii?Q?r/dfxIEZFRaVjjJjnzSjEzmIXFmh/FDWxcBExZNjg/CcLaq9ZNq9/O92Lg14?=
 =?us-ascii?Q?wgek8d0xLnDfAvgmHTllrxlzM4IEpzXMdwaKtajswSwBK/eZs+z3+mtxbx25?=
 =?us-ascii?Q?C3Sc7qa/IguAmiCEUIINhFjrMntdPD1UaWT+YJQwczdndrcFDxm6ZlAS3MEa?=
 =?us-ascii?Q?6+26Z/p4jkmenDJMMyeA99OkqPfYQvq8+N34oEwp2wBgxY1nlFgfP98JO0dG?=
 =?us-ascii?Q?PhdNJ9VCnWibLmKWB5COGn+B76JHoHXN5zc7Ki7Meqtl+xIp66mDVxcnilFt?=
 =?us-ascii?Q?GqXE1jW7Wbj2KapKo0qiIyRR7h1v2771N/TRl5n9Lxv0pvgsKuH/kp21IT/g?=
 =?us-ascii?Q?tNQrsiLb6HFouurDwQOmCcxiO54zbwHYOQJ8Y0c3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1718432-fb6c-45fe-d399-08dad3a71cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 14:19:52.1523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDophLD0swEzVAOA6dBMaY6GcyGjzW//T0JtsBEXKDbbqPznsLBU0zCoTOdcVTrVRmg+/6Bt8oGAqplzhzPuNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7817
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174062

Please pick this also to dunfell
That's where we see this after updating to yocto-3.1.21 tag from yesterday.

Thanks,
  Peter

