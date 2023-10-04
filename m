Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76681E7B5EC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 10:45:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web10.15383.1696416313833584568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 03:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rTsgGYXF;
 spf=pass (domain: siemens.com, ip: 40.107.22.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu8D4ABXgZGDN198+XfV3Mpz087o0WwkdxmgQj4Z8WJFPcepmgtDm9m539q2lgdYNCxwR1+/MnNxVBTWUX02yWd9tatltExYIR59jT3olbU36p1pOz98wkjFqh/QyAKP3HBLqTGEHwSkl/ERSq5ymWcZkMjbVrCrl4v4kO9wJx6w2B9AeVrOXrVxKPBdBwbb/fxVu+B8NQBcGsDZOJbri864u/bf68X3UawI1Hl/qvsTeqLMG1XZjPw3ZkJCYTSdVndxq7oUJUckfhOlCND+Id04XuzYF6jgUJ/YlhAELvdJzU4iddVHGlYlduj6ggoZHU4//JN07zkxn4faeM2FCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chaOX+m7jya0arslhf8EfEmmKASIye/aFm1HJ7g5XQA=;
 b=nhagV9I7l8syB1xXhtz0w4O9RUDQiuifqdcKdBwAit3eypcVSb/pk9RrmGgesSF0xjB4f+5cbNfqYm97pAQlh8t84TrQxO8GMLf84BOCCdcS2tZ3f9T0hdwoHIYc+6Z2xYFiYl+34XGq3VTaJeIGv+bJ6kWMGWaJe0qVLhXy8QL/LRGpr+PqD6FwdFhRGGTalG96o4Uihmm7bEWHGo1qK3f0tuiSuYyShUbpDhhPiPPOzyg6xV2XJAsNMgKp5akJjhArJfkjxl8iVwWEZc9wr+n9zidX8c6zJyl3HQ3bxJrTJKkYmy1qZfVK7ZCC+VmjvcUuXK+TwNFMw5LhQfeXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chaOX+m7jya0arslhf8EfEmmKASIye/aFm1HJ7g5XQA=;
 b=rTsgGYXFrKZcoTop0s9Mk6cXERzl86rPDs+yYQ86JaiaHn4eal5bu7y/dFIhrQUwrTm/ygC0fuD+xMAZVG9uuZADFg1PZlKGNrWCUSIDQ0aWeXwJ7BHjRGK0yHweYd1tema5JXIYGicdyrIkZwo/ggQxpuaZzlxPVaty6qPFohxGKacPPexnzI6/bZYxP0qf/mZr2h4RijbneocTAorpO1uNsW2GqLh8X4dSDbPyUdF//SNhpCKZg/bHHRohTDy11JTpR0JWEgnGKSlw2jj+XhqlhBu0j5g9X/4YTvQJ12l0pHOPoynyMevIoWH0Yf1fqKBAj1qNS8VtlQKXh8ZmvA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 10:45:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 10:45:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3
 statuses
Thread-Topic: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3
 statuses
Thread-Index: AQHZ7Gp96LM1ynRT/U2i+B74ZCgEVbAlBizQgBPzYQCAAIyWIA==
Date: Wed, 4 Oct 2023 10:45:08 +0000
Message-ID: 
 <AS1PR10MB5697921AD1123EC14A956238FDCBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
 <AS1PR10MB5697C5C3991F1DC0400135DCFDF8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <TY2PR01MB3289266E89FCD1431E8EA41C92CBA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY2PR01MB3289266E89FCD1431E8EA41C92CBA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?iso-2022-jp?B?TVNJUF9MYWJlbF85ZDI1ODkxNy0yNzdmLTQyY2QtYTNjZC0xNGM0ZTll?=
 =?iso-2022-jp?B?ZTU4YmNfQWN0aW9uSWQ9YzczN2ZmNGUtNDRlZC00YThjLTg5MGYtMDFh?=
 =?iso-2022-jp?B?YTMxM2FjZWUxO01TSVBfTGFiZWxfOWQyNTg5MTctMjc3Zi00MmNkLWEz?=
 =?iso-2022-jp?B?Y2QtMTRjNGU5ZWU1OGJjX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF85?=
 =?iso-2022-jp?B?ZDI1ODkxNy0yNzdmLTQyY2QtYTNjZC0xNGM0ZTllZTU4YmNfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfOWQyNTg5MTctMjc3Zi00MmNkLWEzY2Qt?=
 =?iso-2022-jp?B?MTRjNGU5ZWU1OGJjX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsXzlk?=
 =?iso-2022-jp?B?MjU4OTE3LTI3N2YtNDJjZC1hM2NkLTE0YzRlOWVlNThiY19OYW1lPXJl?=
 =?iso-2022-jp?B?c3RyaWN0ZWQ7TVNJUF9MYWJlbF85ZDI1ODkxNy0yNzdmLTQyY2QtYTNj?=
 =?iso-2022-jp?B?ZC0xNGM0ZTllZTU4YmNfU2V0RGF0ZT0yMDIzLTA5LTIxVDA5OjM5OjIy?=
 =?iso-2022-jp?B?WjtNU0lQX0xhYmVsXzlkMjU4OTE3LTI3N2YtNDJjZC1hM2NkLTE0YzRl?=
 =?iso-2022-jp?B?OWVlNThiY19TaXRlSWQ9MzhhZTNiY2QtOTU3OS00ZmQ0LWFkZGEtYjQy?=
 =?iso-2022-jp?B?ZTE0OTVkNTVhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0FjdGlvbklkPTdiMTlmYmMyLTZiM2EtNDc2?=
 =?iso-2022-jp?B?OC04Yzg4LWE1ZWQxMGJhNzU1MjtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQy?=
 =?iso-2022-jp?B?NzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9Db250ZW50Qml0cz0wO01T?=
 =?iso-2022-jp?B?SVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNl?=
 =?iso-2022-jp?B?MDUwX0VuYWJsZWQ9dHJ1ZTtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzkt?=
 =?iso-2022-jp?B?NDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7TVNJ?=
 =?iso-2022-jp?B?UF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?iso-2022-jp?B?NTBfTmFtZT1GVUpJVFNVLVJFU1RSSUNURUQbJEIiTCU/JVIbKEI7TVNJ?=
 =?iso-2022-jp?B?UF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?iso-2022-jp?B?NTBfU2V0RGF0ZT0yMDIzLTEwLTA0VDAyOjE5OjAwWjtNU0lQX0xhYmVs?=
 =?iso-2022-jp?B?X2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TaXRl?=
 =?iso-2022-jp?B?SWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3Ow==?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6266:EE_
x-ms-office365-filtering-correlation-id: b75a3cbf-68d2-490b-225d-08dbc4c6fa6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5m8Qet/B2uBRgnBwkKkLMKdZQgoIgHakpE2PW0yizdpFaViO1arsqbblsrvitELQZfWAzYn7djiYXpwISDfN2TtvZowWDubfgqAt9jxAF8A0giqtaCMibbtLldNuPPC6ggWVUtG0L1Nd9TFAd+9DQkP8HtR/tYUnNBUYhHchpxmNiec/2rZ3sxAp58Xh/BzPf7/hNTJGfiZ+8xUI/+AT38OsD+JO2PmoTsgs+u+rBHI0Ge/maTkdH9wxBTjaSNZYFUEb1QPc3novc+q1+YYrT/GBnOzMJ7zRnDTvpm+AMp+4YFZjm27PwEpBVRqCl4mVvn+uOOIDOHGFTA12QFs7sKMKjqWVak3giPiMrJobPn5mkwJWlo86zr5fleESS/MmrQKomZfNIm9Z26EnyJCKZ/bIkv0lmUHC5wQb/nKRYXDP94sRmboCu+zeUKwTFz+Y746pP6qJcSD8qYTDq8crJg0ZjbDFA7PzK4dHdEbilCI4Y53BKwNN1fEUCvXakQxVZTpOLCPR5wkWgfT7iG7vvtruGIojgYPWbsqJclWk8u8Ac62oWDS1DgpCBVi7FfPsaPwQ46tMdG7G+lb/YJ2pS+TD5TCag8RnnnTfCn5IEZRl9HDk9gGNssCkG4tQxRWq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(478600001)(83380400001)(122000001)(82960400001)(38070700005)(38100700002)(86362001)(71200400001)(26005)(7696005)(6506007)(53546011)(316002)(110136005)(66476007)(9686003)(66556008)(66446008)(64756008)(76116006)(41300700001)(66946007)(8936002)(8676002)(4326008)(2906002)(33656002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?ZUl0b1ByYmtpSEJnTHRXbVVJNUU5SGx2VXpXa1cxSy91alplZHphRTZy?=
 =?iso-2022-jp?B?UVdSTUM2VzRYaUoxSS9zdzVEaTB6Ny9KTXBERkRaWFA4d0FHSFlLNWdQ?=
 =?iso-2022-jp?B?U0x0RnYwYW9WdDNnbEw1cVVrQ2FjR1dZOXlKQkFBb3NHNnJnWm9OaHFa?=
 =?iso-2022-jp?B?TW9VVDZLWVBCVjJDUHZwNzdHVjJ0OEZUeGJ3S0pqR3l1WlUxTVM2aysw?=
 =?iso-2022-jp?B?d3F1dCtWYWpNL1I1enJqOG4yc1JZV2IvSFBkZmdIZ3B5RGtmNGd2YWZJ?=
 =?iso-2022-jp?B?eitFTVJuUnFVZTJodEFnRUlxM2ZFc09uN2lRcy85UzlUbVl2bkpJZDFM?=
 =?iso-2022-jp?B?UEV3eXhWRmY2QUkzZFBVUDhCL3ZlN0NlcmNoU2ttb0ZOdWpKK0w1MEpx?=
 =?iso-2022-jp?B?ckRCR2dKMWI4TmlaNURNSDhrcjR1TloxL1ZkcTlQMFgyempEWjlNbGhu?=
 =?iso-2022-jp?B?aWdZcHJQUGcrUTh0TGpIYjZmTGVuOVFBbWFDL1FFelhXS243TTB1L2FT?=
 =?iso-2022-jp?B?bTlOMDVzSTFVWi8xWmEvWG5xUnptU3I1b21qYVFuS1N2V3NYcUlrQ01G?=
 =?iso-2022-jp?B?cjBzakJhbzBBUkJaWnNyNWRUZmYyNEJQeXozcG9qZ211UWFSWXI2cUN4?=
 =?iso-2022-jp?B?WmUwdHNVbHZIc3VLTCtwMmFxZ3NSY1ZyQTBNTEYwM3Fld25FajlMYlVQ?=
 =?iso-2022-jp?B?NFl3d3ZUTkR3ZkRIaGZZOVVKVWZJVWp0VWxValFwKytNTmwzS1A4MmJE?=
 =?iso-2022-jp?B?WVFJU3J5VTZpa20yZDJaNS9NMUpEbUZxcmhLa0ZGQlJuLzlrWjl5YXl4?=
 =?iso-2022-jp?B?cUZhcm1walI3R2VtVjdnN1QyRnhmM1JRNmpOQkg4LzZQZlFPbWJIS3Rs?=
 =?iso-2022-jp?B?OXJzeG1LZ3QzRlRpTHNIRHJ1NmNIakZwRktBSW1RT1dpQ1NFS1hZbkpJ?=
 =?iso-2022-jp?B?SytlaHBEZHRZRSs1U2UvNE1pdXAwNUFtQWJ5SU5RbFhDWEYxcng4V3ht?=
 =?iso-2022-jp?B?cG1yTW9SQUhYaEFnQlBlTGFaK3JRNnZtcXJLTUgybzhrQnFxRG5aandz?=
 =?iso-2022-jp?B?elJxWjZMQUFaM1FpMEltdUhjaUQrdXlQaTlWVUFvL01lMFJxWXJ6bUo5?=
 =?iso-2022-jp?B?UC9WZ1RlSTk2MTVFa3N2bkNRYWtxZUdHaDNpR2ZYYzNPWVMwTk5PTWY2?=
 =?iso-2022-jp?B?RGhwMzAyS2dtQitiZXIxQlh6RC8yWjE1NXdLZkJQS0dMTU5zc1dWaUNi?=
 =?iso-2022-jp?B?WXpFYTB0QWhvSE0yQWVnMDNpUWNuYXFHQW80NlR6WHNYbHhkTG8va2J6?=
 =?iso-2022-jp?B?NkI1K0J2TUJmclNvc0tiWEE2R3c0SXhaalNQT29WN1EwcnZnRHVMM0Jh?=
 =?iso-2022-jp?B?aWlTOFR4RG5hbXNIL010UkpRbllabytnUWNBR1cxY0p2MW9kTnQ5MkJx?=
 =?iso-2022-jp?B?ZXdWWEVEcU5nNHNja2lQTWE3bWJQWEt0bmV4Q3dPU3BzWW9jZlZibVZB?=
 =?iso-2022-jp?B?eS9WTSttVEd0L3I3NjY0T2JwZG1NbjUzdVVxbFJGaXRNZDJoK3JDYk84?=
 =?iso-2022-jp?B?Q01XOVlQVUx6RmRRSS9YdVlSTTRGSW1jazZncGpVTCtJeHlvWmJCYklF?=
 =?iso-2022-jp?B?UjZyMU4yUWp5L3VNZzNyRUhIck1lMUhBYlVNdE1XKytSKzZUM2dlNDZw?=
 =?iso-2022-jp?B?Tlg0Y2NYSTVlOVNCSXhEQ0VZNms1Y2RnQ0VRV1FWQ3piZTBBR1dITmtQ?=
 =?iso-2022-jp?B?dTN1NytuNWFvNlNaUmVFSk5zcU5vMTdERHNCTnVURGxvUVg5NitnTnVz?=
 =?iso-2022-jp?B?ZmFucmk5OElGM3VzQVdDT21LVHJQVXRtMytIU2lXR0dER0ZlVE9JeDJB?=
 =?iso-2022-jp?B?RlBzMGVzTjc1bEtOcE40R08wckI0SDcrb0pyaDBDOS9VS2xrWDMycDFF?=
 =?iso-2022-jp?B?TFM1RHNLdDFSTy9mQzFEMWN0aml6TmJua2lkdmowcjNSb0kyUis3TjM4?=
 =?iso-2022-jp?B?Zkd4WGROVU9WU1c5MnZtZzNYcnpqc1lkVlZmTEVpQnhuMEhTczZJMDJB?=
 =?iso-2022-jp?B?UDdtZ01NS3M4eW1OTGRPUWpkUkZ3U0dvZldtbDh4d2ZhUGd4enh1TW1K?=
 =?iso-2022-jp?B?ODJiZDUrczRPTE14Z1c4M045YkYyTnBhNHJNa3RGSFpUMkxJOEQ0M09E?=
 =?iso-2022-jp?B?dlZ3VFhvYXloN3dsdWlNQlZoOVNWSzNGTGhIVHI1bUo2WWVOMWpYQkZ5?=
 =?iso-2022-jp?B?Y3M0YW1HSzFsQTlCdHVCYnQ3R1NkZHcxYkhwSkkrdjlxOGdSRmdzOTB3?=
 =?iso-2022-jp?B?OFBzcw==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b75a3cbf-68d2-490b-225d-08dbc4c6fa6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 10:45:08.6616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlwHD2AciCQ8hAi6ZIDEdgVZuvcI19jIWD5dmQzlvfa/4ro+T6gbf60JOHHtuGvSEDB9Xo5LYF6ApMGPGkeZEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 10:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188671

Yes, that's how we designed this feature.
Peter

-----Original Message-----
From: Shinji Matsunaga (Fujitsu) <shin.matsunaga@fujitsu.com>=20
Sent: Wednesday, October 4, 2023 4:19
To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; richard.purd=
ie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: RE: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 stat=
uses

> Sorry for the late reply.
>
> In addition to the changes to meta/classes/cve-check.bbclass, Does it mea=
n that the following processing needs to be added to meta/conf/cve-check-ma=
p.conf?
> CVE_CHECK_STATUSMAP[out-of-range] =3D "Patched"
> CVE_CHECK_STATUSMAP[undecidable] =3D "Unpatched"
>
> Shinji
>
> -----Original Message-----
> From: Marko, Peter <Peter.Marko@siemens.com>
> Sent: Thursday, September 21, 2023 6:46 PM
> To: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujit=
su.com>; richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 st=
atuses
>
> We have recently introduced CVE_CHECK_STATUSMAP which should be used to d=
eclare more detailed status information instead of introducing additional s=
tatuses.
> In this case, "out of range" should be subtype of patched and "undecidabl=
e" subtype of unpatched I think.
>
> Peter
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Matsunaga-Shinji via lists.openembedded.org
> Sent: Thursday, September 21, 2023 11:03
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org; shin.matsunaga@fujitsu.com
> Subject: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 status=
es
>
> > CVEs that are currently considered "Patched" are classified into the fo=
llowing 3 statuses:
> > 1. "Patched"      - means that a patch file that fixed the vulnerabilit=
y has been applied
> > 2. "Out of range" - means that the package version (PV) is not subject=
=20
> > to the vulnerability 3. "Undecidable"  - means that versions cannot be=
=20
> > compared to determine if they are affected by the vulnerability
> >=20
> > Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>

