Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D4EC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 08:43:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web11.14249.1671612174935830545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 00:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=aZJZzGPu;
 spf=pass (domain: siemens.com, ip: 40.107.20.43, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcHo7L1k932urLMrlSI3KHX8UNk3N7SmbACshm+EbVNbFNp8byb9maaxExlMiTTFEhDlSO6dEQxzf/L7Nr7XuEcAntNJZaa4i6D/ydSUy7sKdcZiTKPuLQqd/D+us4pz9L1/emfxnn181/rscXR7rqnCX+pG5Vsg/fwvzrr7NxkN3TTzMwuv4h8KVVCDB6PZXqa2dEExnP+AQmAzrOX0yMmfW+0HrnXeEvUKPLQ+Et3HAZysStPpD9AXxYUYYUHWbn08JSf0V/9cmTVriJKBfxPEp6sKP299AbqXeMPbqgCm7Z5ME44UiKA7113G+PT5J+3f3x6bV2zK4zGK/WA4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9QK5RapX8gOBpt94HwWHTl4xYyBxhHTJ73yx7zk6Y8=;
 b=ZfyrAIRjCwpuDbbJAiKObIF1LruUw4PtAhXHXonsqcMuvQZSYVT8UaW+zHist6iP+o2bzxawA7GU9MPpa68XF6nwXgDDWUDQMdXALpVVv7W+XgAHr7h6n9KsTKwsNLADrVV3lhJfKU82zMIwrQQL7ynPmLtEFDhQgGUh8J9XPMtXumwQth4S2yBYnNAaQP1mrtaxU7mophdJZnQe3KTjs4xkJAU+LVdQ6EVWCK5zqAKmpuHdmUxu9Ujbj7fo1QhmdGXw0K4kdMbknVHUYdK2Dy6DvKF7mqwImTy+N6Z2z9lFpYuuJToMPzbfIXnCivjEmdXa7yCYcuPzu8NV9Gz0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9QK5RapX8gOBpt94HwWHTl4xYyBxhHTJ73yx7zk6Y8=;
 b=aZJZzGPus8ztcoD8E3E2CzaupWUiokP3J4vshXrO8Zj8KfiAO2uC0DKcGyoaKf6EWQBZqrNuO+sWDS1H8MKwSYcuJOTYl9aw6xr+6mg2Iiv4LQao672G0BC8ukPL1oZFIJdS/oWQmTMWHb43V/HU/dSD0bMRqkyHMh2SqMOENba1dHhFy6i40bfjm7qtJBC67fGqYfQ06kN5PdgYFEtqfzOIzSXUX1QPBzjmtmrQPUu2EFvu5y+QWy/u+au8NwWnE7NddGrYBKREjVBjqYnfGLV36XDESZn6lSsikWVrjYBl8mYRiDW0vffvr1e2bQ0u4gnW+F10vCgbK8m6N2sHtw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6183.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 08:42:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4a66:8183:5d7d:eed7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4a66:8183:5d7d:eed7%5]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 08:42:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "tashana.buys@digi.com" <tashana.buys@digi.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] externalsrc: fix appends with --no-same-dir
 flag
Thread-Topic: [OE-core] [PATCH] externalsrc: fix appends with --no-same-dir
 flag
Thread-Index: AQHZFPbyYNfbqjwY3EetET9ZB/kNeq54BZVw
Date: Wed, 21 Dec 2022 08:42:51 +0000
Message-ID: 
 <AS1PR10MB5697F9D62F898B32E1028EB1FDEB9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20221221044348.808000-1-tashana.buys@digi.com>
In-Reply-To: <20221221044348.808000-1-tashana.buys@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-12-21T08:42:50Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=76a56abe-bbd1-4283-95ec-86aa669bfd24;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6183:EE_
x-ms-office365-filtering-correlation-id: 1bfac881-d31e-4abc-3356-08dae32f58d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0Ewf/nFQT2+yDBXwY0PcgB+TIcjPLzKoxsnhDoVQUgT3pDM6HOrFkxR5zeKAAJEGIa8dJjGcaF6EGgbZwDA9DHLLyosVdV53uCEcWI1IhOPfoFOn7A0p1YINGGN1DWObWPs3kWZ+sO1iTbyNKOwCvIGfTCycDkIuxs2fri0rxjIjAI5MP4F0YfOsYPSqM3OsUrkcUnhPKqnnSOOuihSDyhkoiVCOay0ChCboKAqrFCkMLNUUdpfgLpj0N3mV+zvNSaFH63BcyhJpF29qwz0uuwPFfTBUvLRwEgKIyi0jD6gJGoST7/a/ebcBW9rc+VUfvEkoURaVYFmn+C03PO/qs97uGLJ4AURoQyJ9zebfzFNqoDaQ8qI+JBt++rvKgoZsjRHcL14F1RRNQ6vF3WRakAgYJK2F9aMPecsp8mRrlby3b8oa4P7LjoQ3dODkZ8/rZefpnsdUGWqqpEJXophvaIYT0vf9OoApr+YkIZtTO/oHk+VIjSfSUh2ebbJIOUiqNGl9mUqF1FE7hZirpt5HpMLG9k0iueZzyozJW+7bEW3bgNSE3BbFuapTpZblvSs8hlOSVTu+sHOFeHypmduqDc6Mvpm1R8/hjlsQOZI/AS+r2qUXiB7wGt36MUfqaq9Zylts4HUXzWJimMz12roxVuu4hXYyaEn+aJSl0F58VTumKQWC2IlB8+jM9TxMb46jF+pLNTNVgnAvWE2b2H60YQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199015)(66946007)(76116006)(66556008)(66446008)(66476007)(64756008)(86362001)(8676002)(316002)(5660300002)(52536014)(8936002)(33656002)(7696005)(9686003)(186003)(6506007)(558084003)(26005)(38070700005)(55236004)(41300700001)(71200400001)(6916009)(82960400001)(122000001)(478600001)(55016003)(2906002)(38100700002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dNjcU4hrBDOlW5PoKD1hI9NZf1pWgKFNybuXIZIFVo8/SPg1hv+b9Hz1aElW?=
 =?us-ascii?Q?agUQQAYvM58W3IWCLCN2abNT4Gy8AHiqmR7Kmx9NmlKoBbw9iT2Ebuc9OMSh?=
 =?us-ascii?Q?bm1QMhQzpLDcZigzVngrc2xfOBwOAS+wEPtRqRaWjk/bZZ31HMUKYUalwqpw?=
 =?us-ascii?Q?bBI5MF4tnmWlGpr2dPYBQKh/brWmBUzn6FG7l/l6DPbGtd83O3FJkBgQKwY/?=
 =?us-ascii?Q?Ac3V6N+KULgAimZ8GuIvkNLyy+6m36m/f/66IW0XlIlngx+L3CpdI2YM1Ehc?=
 =?us-ascii?Q?d2c8DnRqlg87u8NcJh13sH1kr3pBSNh1Iwk0LyjWYHJ6UKAclveTyZUxXx8I?=
 =?us-ascii?Q?72Dy91TbNviGsIUpoDuOcBEuYcDtGvcQCG2vd89E//AEDo6dtiVd1bNCFdcW?=
 =?us-ascii?Q?T7s9he02/r3uTJtsWOTaEVc8Eq2nRqD7zHZFNCs6VeVLT73j8tNBVqazhHSB?=
 =?us-ascii?Q?fOVfhQFpbVs0aVooAtiKxkHjRX2CX9vEEkL4nKhECC0Blf3y2MJLsqKYxlkl?=
 =?us-ascii?Q?AeawEXL2eiSqbTs6KaqwkrbMMHwoqMGsfDhbJiBYPMfiw+PjZD4pinK3MYQK?=
 =?us-ascii?Q?U8W+GdzyI99hsqKEf+maz5oRQYDULxEMaZU9UA9UWSdQHAMBagXAghu9NhE8?=
 =?us-ascii?Q?O/HLLUkqhooGUZM/x9DcDPXtKHk/tjZCkQ66L68XAexd2rLK9uZ3Dyr8QdrM?=
 =?us-ascii?Q?92weamFIiSgp4kaxnQuvIELMlGOJB4aXNDgx8rYKCRtV8geiv8eZY2XgYvM5?=
 =?us-ascii?Q?LCnoE17H4r2j+hpweHC4Eep7SpKNDg/OXmqKjImDMPO6Tk7mt9MZK2dXKr0s?=
 =?us-ascii?Q?yWCz1PMx9Q45AOgjkgsYSt9jEs+c/OxqCGUhz86M1DKSmtLre1iRdetzxc0j?=
 =?us-ascii?Q?Eo/G06dvdkZzUmo2pe2oX1gnH4tBmbMhKNdlcRsJ8rNX7Gw+qSqVY8F6qNgU?=
 =?us-ascii?Q?+h8GQ3YWoV2KJfz1VGsz78mYknmt/p3QBkVshljn/mhv+iDF4U5DKoigcj/i?=
 =?us-ascii?Q?99gAVOwQKmFtWsfYyV+jniUpVHioCpzIG0eVnO5hwYOIX2yQ46+tuUMRLCNH?=
 =?us-ascii?Q?YOHhsdclIJgk4iMgYa99iVzAo9CxkhS83HU5bn9gloVCRDzvGjbGNvVtC/+G?=
 =?us-ascii?Q?lo07PiQ2HTd5P/lMquxPzPpQHRpTn8/w5fCV4TXDe3jwXng3NcVTxUFJh7x7?=
 =?us-ascii?Q?AwcPoy12UbkLj22iByJk50C1smfzi8LBaBlXw/sko4wF/t7zUijlCFXCeOSy?=
 =?us-ascii?Q?3z5pmJpmM9az6kSByrDZMl3/oAgik0DYcezV93g1D6oblKrFVqB1ngtfva97?=
 =?us-ascii?Q?W6H4KEPtq+x9whTz5B8xClMF1mR8YJQ/1LJiESFM9h7u6xhhnSFnt7Gxl9LE?=
 =?us-ascii?Q?lzaIXzbUzXicnPWb6x4dqLv9Y8JPfZCkQC4pN0jsuQEHpMAGDlsyYtOwSD9j?=
 =?us-ascii?Q?faP9X9qs29De4UutzCdSkpj6oBaFiarorPnaJozAsjmvzR5pL8gx8HLBHQst?=
 =?us-ascii?Q?qYKykzvqu9J0a6hlZd+BEgrfNv+xdlOYN2tG/5sjeKUg1yYosNVjEKJnSmsz?=
 =?us-ascii?Q?vmgJSPUGStFbFb7v1AD3SW5T/KNsJU0UqrabOxmW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfac881-d31e-4abc-3356-08dae32f58d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 08:42:51.9656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7wAApmpZ/5PgDefbPnlICVLXBS22Y4FMlAkXQ8guDzcINWU1eAFQdtStrjVZQ1Jq3epviKNBzZOulNrRvBImg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 08:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174902

This is already fixed on master, you should pull the latest version.
I have also seen it in queue for langdale and kirkstone and hope to see thi=
s in dunfell, too.

Peter

