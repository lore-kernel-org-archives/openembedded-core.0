Return-Path: <duep.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A33EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 08:32:09 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web10.13347.1686817921423640594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 01:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=AUhvB0pN;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: duep.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1686817921; x=1718353921;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z+ZwVMYPZELewPH8jWHugZ/Vlhv7mzSY9+R0/OepRdQ=;
  b=AUhvB0pNNDuecWY9zcEGpUouqEiB9yPPJsOkr1iFraE3quJK13hoFFge
   SNJsgalUA2w2rLHlGZIiA1nmpUPwviy/FzPWTCk7ZVe6/k2JAnE78L8Eb
   gHZX6SxhfYc8o4nmzz2zKj5EbwUy3t4w/LTt3idJZRnHWb9ZtGPywyA8O
   3SDXDC6piSfU7O37ZVzbomAkcDMv9c/rM5febCC8WWJ2MopzmDszdiKJr
   WDaGy1tj9GnzWrlA6wXN3P2rx1A6erctURVxyDvfUwViLzjuYlrpHgZHY
   Cu8W7/XS5cztoZAQ+u87EAgNc8kpwMw+m96iqJFTREcGIgnEUjY8xOpc2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="95424868"
X-IronPort-AV: E=Sophos;i="6.00,244,1681138800"; 
   d="scan'208";a="95424868"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 17:31:58 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjflqGpQj5e9gDSFu8ruhq+krAOFF26am/9vAQ8JypyP266/NEwbFNdc9NF+1lz/MJZMaE5u40ESSVTnYHP0xLfQpqpLer0IAHJAmN7NAQxSyf/wCFvMKh8r+b7B2Na5kGDraTAxoRdgZmNGZJ80HZ8HX/dbJqLexsQ2AxhdDEIO0401qWcumPWxu09MQVZRZE9m4ylo0bvIpNYlz9/dPB915FyFQ0Zo4IMUJM3sXpGq+n1P7J4ldcA4vlQoVtgLugH+z21U5C6VSMcUeUuobPOXLoex1eNlweDDz+SuUi96sSfpZRW2HaOFht1eM3JYfdeZAbWpLcBcjCb+tofnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+ZwVMYPZELewPH8jWHugZ/Vlhv7mzSY9+R0/OepRdQ=;
 b=N44FHjTqXNPt8GuEakbSuS3+pvAre29eQZpHRLvwCswAki2rjl3f3w3VbHhWm1lu0JLfBFdrKBzTELOZ9dXbs7rT8DW9TDm5/lBhPs7JED4l563kYWbIHK24GDueF42Kpe+NCoKnvYJhPxz0EJ9wJhQynUVKjLu0Yj0S6RUoADPTMZxRgWUsaQCKccx3pFSKA4/PZWWeJLRIS4Vk8F1pk1zDcTvypfpUQrGHkSVbNXddRbwBe7iZlX5Wbvyf8mfbAes3JAyyjfODe/NjKd55dwfPHAgpBUWkwckw9ydeBa+7R8b5R7nrYtkeac/4Bv2Hd3jWm7rkyBdWaWMLlGAMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6609.jpnprd01.prod.outlook.com (2603:1096:604:109::13)
 by TYCPR01MB10118.jpnprd01.prod.outlook.com (2603:1096:400:1ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 08:31:55 +0000
Received: from OS3PR01MB6609.jpnprd01.prod.outlook.com
 ([fe80::f3e6:a8ed:11a:31e]) by OS3PR01MB6609.jpnprd01.prod.outlook.com
 ([fe80::f3e6:a8ed:11a:31e%6]) with mapi id 15.20.6455.043; Thu, 15 Jun 2023
 08:31:55 +0000
From: "Erpei Du (Fujitsu)" <duep.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW21ldGEtb2VdW1BBVENIIFYxXSB4ejogYWRk?=
 =?utf-8?Q?_ptest_support?=
Thread-Topic: [OE-core] [meta-oe][PATCH V1] xz: add ptest support
Thread-Index: AQHZlGZlFFS0wew6skqT6A267o4qX691pwAAgBX2ggA=
Date: Thu, 15 Jun 2023 08:31:55 +0000
Message-ID: 
 <OS3PR01MB66096D89867A471AE43F21C4F25BA@OS3PR01MB6609.jpnprd01.prod.outlook.com>
References: <1685609536-23934-1-git-send-email-duep.fnst@fujitsu.com>
 <CANNYZj9p4=fj7du1KFx9aP3Y_cuOOuAkPJzEe2wqmnK7xqGVnQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9p4=fj7du1KFx9aP3Y_cuOOuAkPJzEe2wqmnK7xqGVnQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MWVhZDA5ZWUtZmY2YS00ZmYxLWIxYjUtM2NmODU0NTU3?=
 =?utf-8?B?MzQzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNi0xNVQwODoyNjo1OVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6609:EE_|TYCPR01MB10118:EE_
x-ms-office365-filtering-correlation-id: 3b3f437b-3639-4438-389c-08db6d7afa43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8kaWdYM5Vju8LcMoLxNYw6hS7XSvQRxfzdwpHdCdTgF+f9ApBJC59EZpZN5zOL0EaZZqb9M1INu5iOPKbbxsK+wtlXi/1p5nUtnJGyMPM5lcwy0HqDFfbNLoZds35+0CDdXgslR4uV7oZs4t9BY6uBr0ZEL7KGY1dQjpsY75UYTMwsorLTiuN+C66rF0aho6v4B+wdi10EZkmaMUN+biQ2JYnDJpldlzrh8zCmIIqE1FwRDC5ZjAv8FnJmjE6GQIKURXCF5gJlDiojTq2ktN4K/iFqM5wGx/FVe/8Lh/Q6joB4rGhdQY7BBVcgFN68raRSpPar65KpNRC2rUv1Y1R6hyjgODzOjZkM2nUxlkI5GJ2mgvi2v3pnn5lP9r48qKjKrNalSqAAuti9bfUEW4q53cyWVWXK//3S2wi5tb0tZ1xD4gghTtz5V+J6cw8oiIniU48mViAWPediqzvD2DNH/q8sMrkLtB2bXUGAr7QJo6McAhy1RheXIB9253dDKJXfF+62yqoVlSv8JaAnIJeDJFn6OP3WOPo/kpwC6vShjJEE+CyDFMMRSZ8ENH6Ri8wUD/6ajwXVKuEhuSKZhcSyPzyNkFMuxt3tHLh+yOH09hAx4pyINj+nTbWMFV+jrFOoqxAAvR31LWqtLWMU5nLx8kiF+LPyesPJPJJqh/1Ew=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6609.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(1590799018)(451199021)(966005)(7696005)(316002)(41300700001)(83380400001)(86362001)(4744005)(26005)(38070700005)(9686003)(33656002)(6506007)(2906002)(122000001)(82960400001)(38100700002)(55016003)(186003)(224303003)(85182001)(5660300002)(52536014)(8936002)(64756008)(6916009)(66946007)(66556008)(71200400001)(1580799015)(478600001)(66476007)(4326008)(66446008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Vks0YkE2QTVSVXgveUhGaHpMUE42ZG11QkZvbGYwYVBzVjJFMUJwZ0dudEpW?=
 =?utf-8?B?ZVJLNHIxSzNOYnhDV0VjSU52OXdsU1hyUEFsVi8vVXNvN21WaDUzOFNOcW9Z?=
 =?utf-8?B?QWVKNDBvejZQRlI1V0UrMytGRjNtMUVzSHJLVnZ4TVJXRkl4RjU2OWpSNm9P?=
 =?utf-8?B?K0tiMnU4VGNJWmNaNFlnTmIzODVXTHdZb2srTWJDQ1ptNjJ3Y3RYR2dqTzRz?=
 =?utf-8?B?YTJQTTRqNU54RHZWNGxqb21hMUxDVWRvR2paWVptWnlWTllabXNLbUxDZXdw?=
 =?utf-8?B?eTlBOVp1VGpoeSs4RXM2QUVIYWIzTVBmZGV3RjJMSVYxK1cvd002RkFWN3VO?=
 =?utf-8?B?UjJkMk5wZHhzcjFYN2RMaWdBa3NFb3dkL3pIS3pyU1ZvZlhZd2VWT0VCclRV?=
 =?utf-8?B?VXFHU0NvSjVmWnR3emphYlZNWE1Lb1ljS1hhUjZvN0VxQlJwM2NhOXl3dFRF?=
 =?utf-8?B?VHhZN05YcVNVRUVpVlE1YkhyQlFYK3RFZ0ZnNUZSTlVtUmdvTC9xYk1EcGto?=
 =?utf-8?B?ZzVlRUN2UGFySFNEWGVwY3JHN1F0MW5SSGovT0lqTW1VSUNCUU1DeU5CYlQ2?=
 =?utf-8?B?YnlaOTZ3WHc0a1hJaXZFVTN3Q2hwb09uaU5ldDVUOXlWMldFc251dkxHNlhh?=
 =?utf-8?B?Yy9rY0JJV0RHL2VJN2ptc2V4clNRTWMrSEhsSFVaVkFDUFMrblhySUdWY3Vi?=
 =?utf-8?B?T3ZjWm5nU2ZROXJrbGpLR0g4Nk1kR216STRmaStSQzVYWXdnaGh2VG1qV0l6?=
 =?utf-8?B?NTBtTGI1Y2tCVUhWMWFtOUk0SWZybGtWR01ITi94bWlwQk9ETERQdW94a3o5?=
 =?utf-8?B?bVltbXdWdklZTlNhdVpuRnZyMitVQ1pVcUdCOEJsb3lhUEkrcWdxcEhWNHor?=
 =?utf-8?B?UnAwMDh5dzV5VmVPQjFkN2ZTWUJYMTB1QitXb0IzaFdFR0Q3Tm5BK0JHbzY2?=
 =?utf-8?B?YmM5N25XSjhGWVFVKy9CVzFEZStJM2tDRTZ0MVowampwMzdic0t4TGZRT095?=
 =?utf-8?B?b0VFdUZRa1VNUHhyK0NnWEQzcUhIRW0zb1JvMGRBbDk4MGJ4S05oRWcvWnFo?=
 =?utf-8?B?R1RLdW1HbjlJcjdYR2tkbThsRTFyVjI5dGFEMVhYaWVXRllhVXFqL2ZEUVNU?=
 =?utf-8?B?VGEzZmd2R2FDdU9VYWgrSUhqZHRWOXVkYXZUOU9uT1FnOGZGaGhZdCs1alpD?=
 =?utf-8?B?UFN6MTBkeTFFcnd1ZU5wS1hDV1NTbzhoemE0RHlhbTkwVE1Rdm91U0RPa1JC?=
 =?utf-8?B?V2cxT1dvV0grTmpvN04rZ25RL1cxRDYzczdrd1lrUE5NZHRybjZYbFIvMUFS?=
 =?utf-8?B?NGg5WnNYVkhDRWhOTVdnSWxjVVNma0hVKzUwam81MEpob3VWQ2wxQWE1Wjlp?=
 =?utf-8?B?RnUzTDlaZVowSFRRTmFad29LaTFheTlQZGxpa2pSSzJyR00vZStPK0JOdUMw?=
 =?utf-8?B?Qnc4eWxDbm9XVlA5SzdIeXgrcUNFak5oZ2dtdjFnbUZZd0VDcS9CTHdrOWR0?=
 =?utf-8?B?WStreHdxSFBnUTF1SERjV25mRWZocXNJM1VieGdnS3pNbHpsQi90ZUFCanVB?=
 =?utf-8?B?SkFScFZXUWsvZm0xSlNtV1UxeGR2dytFN0RLTnZpSi9QM2xyMXhVSHdpUEtH?=
 =?utf-8?B?RE9ZNmVQL0NBMHU4dTlCdXJUL3JiQnArclJ1cTdSSWZWNnVpNElMVnhQZkF1?=
 =?utf-8?B?aHJEYkwrZTUrdmw3V01Rd3RwcG1sYnJLUE42TlF0Ylg1cVFoWlVBQTV3QVQ2?=
 =?utf-8?B?ODdHdUNhVmtjYk51Q1Q3Z2hLQlBtcVZqV0ZCcTlNTU5vbTRGQlZQTjNsVkJM?=
 =?utf-8?B?Ry9yNFc4OG8xcXlKY2RDTUhkVlVPRDBuQ1JKQ3dPNjIyb1hGaHU2ME1XbVIz?=
 =?utf-8?B?VHJJK2JMcDhEd0hySVpiWk1lMEc5STZEWWlZZkd1aFluS1FHZGdqazR4NlBj?=
 =?utf-8?B?SmF5QWVVSmNHN3FPb0lJK3VwNmN4MnpTV3JTakJwOWUyaWFkT25LcktLWWVU?=
 =?utf-8?B?MkJwakgxcjlYdzRuZVZ4SlU5N0xJZnNPOHZHclB1dXZrQWcxbnZUcE5pNkU0?=
 =?utf-8?B?TkFEM295Y1pJaXF2OU1KTC9BUDNXb0xSVk1iMW1DbGM5NVZGKzBicVVwcDhW?=
 =?utf-8?Q?C1UiZ0GRGwZDQtwLnbm9otuR2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Dvc0jKsGFWmYFLavFpnMoAGlXk3yVVT/dpVKwdZIoN3Rg5BahyONR9J33bENzr9N8f+Ygf69QAAJeJFnsv25aFQAVcpnE0HfisSvJZJykqtqhjQwaKnf1Ii8HXJ9ITdW/Ne2Rk+5R2VbWKrIBnGDBBZllpaeFT7gEllWtHPss9KtcI0lh8RxI6oHvkbwDkCsLwbAdYEjGqGmwX+ExDkTFTQuNF6EqnnRQHl8yBJazAEFapaDCjyYujTgVZepZGSb33QZGvAhrP/C//MSEwOSt4GTesDBFLRWV77VP4juys/1QNT/I1eI0jMGWoxP7hK9BIAixgjeqqQIvintXrMiAdnicBX78RK0vhqPEj/BeyhceOpqKoxruquA4nZjphrNvHpKagTGCxBzmmpBm9LL1ai6qhRXmp0axir8Ds6rcUHOt04pYZOq4mv5YRCcE5FQ6HANFyhsLQf/PhCt/7ek4HZUStGPj+iiSHV9grcei5o5z8vePm/neIMk7cz9PmDIwmz8pqexisU9Tp9+AT6LV737+tfSv2cqyDrYjStG7QW6DYTzazSjc1XOzdkt7ZHxZBXfJP/fLMoLocwg+NMPMjYtwQON53t1xFSgJj8LbfPozE5jLsb7C0LqAm9cTO3pPqmGKbk8YoxYJRhsMBDBl90O5qRx+ol5eH9iyyfH2UCLcdZ8fL6nNmYweUAN2BM6r5sEBjAyoGXn0Vx9YK6VJeogmXBpKj+i0riA5wLn7Ei/HdapudYuH17Pce5hmA6fvjQLrZmv/TYIn8u5feTpeQ78GckiLcjtynUH6tztCTpqklu9/suyNKtb0x7wkf7i
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6609.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3f437b-3639-4438-389c-08db6d7afa43
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 08:31:55.4912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2RvDx9lYv9+YgSbWX31+W4aVMzevRAhtEZVSaTK4lyUaQPBqFMz8iq34hI/+IuchqSSyF4pvFJ5MQxee/QeOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 08:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182838

SGVsbG8gQWxleA0KDQpJIGhhdmUgbW9kaWZpZWQgdGhlIHBhdGNoIGFnYWluLCBhbmQgdGhlIG5l
dyBwYXRjaCBkb2VzIG5vdCBuZWVkIHRvIG1vZGlmeSB0aGUgdXBzdHJlYW0geHouDQpUaGUgbGlu
ayBvZiB0aGUgbmV3IHBhdGNoOg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODI0ODENCg0KRHUNCg0KLS0tLS3pgq7ku7bljp/ku7Yt
LS0tLQ0K5Y+R5Lu25Lq6OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiDku6PooaggQWxleGFu
ZGVyIEthbmF2aW4NCuWPkemAgeaXtumXtDogMjAyM+W5tDbmnIgx5pelIDE3OjAzDQrmlLbku7bk
uro6IER1LCBFcnBlaS/mnZwg5LqM5L2pIDxkdWVwLmZuc3RAZnVqaXRzdS5jb20+DQrmioTpgIE6
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEZOU1QgZm5zdG1sLWZ1
aml0c3V0ZW4gPGZuc3RtbC1mdWppdHN1dGVuQGZ1aml0c3UuY29tPg0K5Li76aKYOiBSZTogW09F
LWNvcmVdIFttZXRhLW9lXVtQQVRDSCBWMV0geHo6IGFkZCBwdGVzdCBzdXBwb3J0DQoNCk9uIFRo
dSwgMSBKdW4gMjAyMyBhdCAxMDo1MiwgZHVlcC5mbnN0QGZ1aml0c3UuY29tIDxkdWVwLmZuc3RA
ZnVqaXRzdS5jb20+IHdyb3RlOg0KPiArRnJvbTogRHUgRXJwZWkgPGR1ZXAuZm5zdEBmdWppdHN1
LmNvbT4NCj4gK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHMvTWFrZWZpbGUuYW06IGFkZCB0YXJnZXQg
b2YgJ2J1aWxkLVBST0dSQU1TJw0KPiArDQo+ICtBZGQgdGFyZ2V0ICdidWlsZC1QUk9HUkFNUycg
dG8gb25seSBjb21waWxlIHRoZSB0ZXN0IHNldCB1bmRlciANCj4gKycvdGVzdHMnIGFuZCBub3Qg
cnVuIGxvY2FsbHkuDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KDQpQbGVhc2Ug
c3VibWl0IHRoaXMgcGF0Y2ggdG8geHogdXBzdHJlYW0gZmlyc3QgYW5kIGluY2x1ZGUgdGhlIGxp
bmsgdG8gdGhhdCBzdWJtaXNzaW9uLg0KaHR0cHM6Ly9naXRodWIuY29tL3R1a2FhbmktcHJvamVj
dC94eg0KDQpBbGV4DQo=

