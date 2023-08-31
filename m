Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6F4C83F37
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 17:28:11 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.648.1693502887124412418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 10:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=J16HOxOL;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KLzUF+ly;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1693502887;
  x=1725038887;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/Lt36zYfVP4bOdLVvQxItUq3bPGVm+rKBj4KUVF4BbY=;
  b=J16HOxOLuZ32bfQe62hkEItfv5wik7AqzOeD/e3TpFWbVsZf4HoDCXfP
   G/wspA6/rIln3pTp/Dk0kZeCX7jw1ykESTvxshSo2VzwIMC58uQ36Bv0X
   27tJlP+o8X9KD28twBOVnXryEWasJF+K52qeJAhYQKCW8sE9jRe8QZM8s
   J8W0Mc3lW33qu/xbAT9jAiSMsLNdGWfZI8HE9+HrqjHwoX76fqscDTV8L
   xRioS0MEIs7ksUo6CDyPrGIHmLYow0deksepABLIFXjSN0SC4VfmZUrKH
   F3VIc2AXOehm5jGXwxsCbBCsqk2TV+dP/28huUr/NyQkADNS14UDgYCq8
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/8x+O/8o0hxlGENeSiv1Q35xjTM4Y+sXmnoktISMqgOzwpfsxC6ubIqFWM30f6gOQ3PLG4NbR34rX214Nh+DB0rwhxX8CxCoAvPQWvBj3L2m7vuQgzvQyEIlyBeJC4h5iLBkDRpLIRRH72BXNjneI5DNH2MCApbodhyVYYN5LCtOpa7lDT2y6NF2DOPlESv08Wh1SRA/1pXYgsW9hbreI8kmasoGRpiAj2Dg8rztOd05v34W+P9enAUQoJ8l4XlXbRcXtzpFhP3hR8BLBkirHUDEZ/LgoIysa+IxwLspXDzcbDtkqhIZF+UuORjAeudcp9fdL0/FT5B7Y4HgXybJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Lt36zYfVP4bOdLVvQxItUq3bPGVm+rKBj4KUVF4BbY=;
 b=HcJjhKOuvV+URWlpFAzVR000g0NKTGIJZl0LzOT1VIkm/KRDj+dudoONPeZtdwqr4Hm4kqfFQSlBwyPIMMcfEzaen08vTsWgWj9prribfjhy5GFCrwciSgyoOhVpSLYrZtXW89+KUXVC2YUo1Lm0G2mCLI8xR01YAAU3maw7sr30rlRCMBP1ggb4U7/b17m95fDlA4MPkE/oCcVUvQF6VSsFZDvo+0DU5hwMuIwO84VwWrwUQHkk2gsBzuv4D+G6I4Kfw8ZAyMO2iaDoyAfjch0V3E6SVbf+pEdKQvB+4juqi/H0Ex2HYQVo1+/d3bATzqPthNengJrHJ8ncw62oHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Lt36zYfVP4bOdLVvQxItUq3bPGVm+rKBj4KUVF4BbY=;
 b=KLzUF+lyM2dmzaQxuNInSdTQj9sZsdA++RiV/b7Nrugq6l20wmB4FnUIwkJZQJ3I/C7kBdf+0vJ8CxVn+ocbQCbYQK6+oyuSyM6lhtAKBRpOSI1dw2ZPQEPzJ1oJ/jvcYWl7hOY9V3rUqO51ASE502O6WfSHbIEquBY7pREMYco=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ryan Eatmon <reatmon@ti.com>, Max Krummenacher <max.oss.09@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
Subject: RE: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
Thread-Topic: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit
 the default dependencies"
Thread-Index: AQHZ2L4oPF6GUCcjNkC8EKy0eC4xga/+p5iAgAFL9oCABLmCkA==
Date: Thu, 31 Aug 2023 17:28:00 +0000
Message-ID: <DB5PR02MB102139A260572A4A118B601A8EFE5A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
 <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <f81f270d-709f-01ce-97aa-785abb75d872@ti.com>
In-Reply-To: <f81f270d-709f-01ce-97aa-785abb75d872@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8356:EE_
x-ms-office365-filtering-correlation-id: ca775381-3c77-4969-b64e-08dbaa47a02f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Kk/1uD+RgsveMEwGharsbODsSpkV+4ZOm90aLLiDpsTkDahwM4suH0wolsxYY+W8taTZIC68B0+ro84tZi7NS/OLXvoLTv+sV8QGZHcXWJ3omBTxiNhyxhgV2yGuqpsK4QF9AR6oqeDiZcrmXLjD4XwXRpphGDPcYf4Zaub12a1AlH9CayTh5//LnxNVJ1pAiDRzOxk/nkMPaEUr+toeq+3aTZxy0Y5NBjN+pqxVBsgIh0l2VBP3vwulfe0jdo5MF+pS8KLKlv31fIdu+pq3GU5M4UN5a1ItcnEIK+fsrGoxVS1unZ3UXAYHnxL+Vj4vYJTdoaD0kBR7/DH+4Ks11I2aep2nLhIOqPW7ivA+TqKog4MAYfY9Zf1fEL5MqOO8cYrqB/uk0zWiF3JHnFeJePH9qm7IIQzWHsKcVxCTLGR+Hqu4xQ9j8ZvhgtlPbOo7K3ROe8wSCJapqIzphyHh9ueR2kaHtHq7GEyEBhmmfPHJKrI8YUaigZ807vFwMiLyptIYQaM5T1jrYGOQ2SE0UsZ6msUH7AQ8obsYDP61NIoUgDyojzSuugMLYboEpgAFSpJLUD3YsE5RSob2psCSmh18hrufAOYkCBgETi5D+BJbBj7WlCLOfSuvPJISetA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(1800799009)(451199024)(186009)(38100700002)(2906002)(5660300002)(33656002)(86362001)(44832011)(52536014)(38070700005)(122000001)(55016003)(4326008)(8676002)(64756008)(66556008)(41300700001)(8936002)(83380400001)(66446008)(6506007)(316002)(26005)(9686003)(53546011)(54906003)(7696005)(66946007)(71200400001)(66476007)(478600001)(110136005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0w2Ymxrb3piMmhENnExNTBodlQwYW5rWlNMVklTMlFKemFDWWx3d1FycDFT?=
 =?utf-8?B?WUhGTU9CYU5RV0dUN01jaHprUG1yVzVMYTdjZmtrSVdHZmpYZnloQlI4Rm8y?=
 =?utf-8?B?WHlPN3UzbmdwRDRuZXVwSUVleTdIRWp5dkIxLzd0elNuZEo1cUxIWXJqdXRH?=
 =?utf-8?B?UFFHVUk5aXpXZmR5Z3ptcHhBeGFyWlZxdU1OMlVaWTUwSTdUN3U1OEZwTTVF?=
 =?utf-8?B?b1FDcVRhREZBZnBoSlRYZXlVZ0thRWdNNjdqQ1A0ZzNwYm9UNG16QzhTL3Jm?=
 =?utf-8?B?Vnk5c3d5WTczMnJGdysvOEtVbWJ3Z0pXbWs1UlBqR3BPK0ZsM2c4K1libVpG?=
 =?utf-8?B?YnZnMXNSdTJSWER2cXlNbGNoczBZSUVBelpMRUFDdGFjR05pK0RhQWhKeExs?=
 =?utf-8?B?ZU9wYmNQQWNhTjRPdkdEUmhveDVlNyttS2syN00wOXBuKzBqRi9welVmeGJD?=
 =?utf-8?B?ZGhtbFlqdzhoM3R6TERzVUNOcFlVeTVXMEZ3LzM5UlJlc1ljZW92dzBnWWI5?=
 =?utf-8?B?c1IxTFgrR0VXVzJjNDFablBSY09aRW5jSjdQcWUyZWF4eXpIQStHZ2lPbzBY?=
 =?utf-8?B?L0FMSzFwc2xOdlNlQVVINldNNGZkTXlVeWNjUUlBWm5UYjlMVDJVVWhBMGp2?=
 =?utf-8?B?cy9LZnA2WDhXVmNFb1cyZ1FIVDZzK3VGbDRaWUw2RXJBUnA3YWlYMm5JL003?=
 =?utf-8?B?NTBiTE9WbXdTVlE5cVBkQzM5YlQxM3UzMDlwbHpWb3I0L3h2VHlMQWRRdzIy?=
 =?utf-8?B?UElndDkwNUxxaFZORXh6UFNjeUNrQnFMSVRyUU9RUE51c1N0ZmYwYzA0ZnNJ?=
 =?utf-8?B?K2tCOGFlUGpmR0JWRDhlM2xsOE1HdUlOMTZpcUN3V0MyZ214a0s1NzBhSTlv?=
 =?utf-8?B?QjZpanFIcktENU14UnJXbGE2Q0pLTk55ckVUOXpKQ3JJWFNhSUtOZ0d1ZUEz?=
 =?utf-8?B?V3Y0QVZmbjUySVNxNG5QYWdHSnJuT21aeUJmcklRNUU5eGJWSjZ4MzI4VXVK?=
 =?utf-8?B?bXMwd0IrZWlFZ0ZHdkVDWGNRY3dJZnBaVDkwclBKUjUwRHZHS2F3U3hXMlRo?=
 =?utf-8?B?bVgyeWprcktPSnB5aThSZjFCS3RWVTVGbXJXSFU0T2EyTkVDOWtNWUFSYnF5?=
 =?utf-8?B?cThYbnNGT0JHRTBPSFRXRDJrcXNEUkluSnZkQ1dzelFSd2pOWk5KMGQ4UkZs?=
 =?utf-8?B?ZWFwQm5ra3ZxVXgwcnZZS2NUZWc4QUcwU01Ha0ozVVRWQ09wcmoxRE9QQlVz?=
 =?utf-8?B?U1pRV1F6YjByaWhWak9YZWFhcGZLWU1WNDMyNzUwS3RaT08yVWl5WFJPaFBK?=
 =?utf-8?B?bS85U2NxSUdheVliaUxvcGhMRG1HRmVxcGpXbG5PcnpjbnlCQU1tWjhNODJ6?=
 =?utf-8?B?dTF1YXpFT0I3UUJhQ3A2cDJKMU03WldvMjIxUHh0M2RZSWlXS216TSt2K2x1?=
 =?utf-8?B?cGtPR3gwVW4vSnNUeWZtanNiUGozYVFieHoyYWtxcXozOTNiWGtFNU5ScEtu?=
 =?utf-8?B?QmdpRzNIdGEzTUdsaFJLS3d3Y3VBOXRDWnY0Y0x0eHVMaWNleklKZXZzVUto?=
 =?utf-8?B?dTVrdmVieUFpaFJFcmNySFVLeXdiNjE5UWkzclc3SU16NllGeXpSTWNEdmJp?=
 =?utf-8?B?M3ZHSXIrMi9WZURPaGdZanpHcmZhcVVXR3dsVUN5Y0UraUlaVk9sOHlUV1Qr?=
 =?utf-8?B?SFJsUkZxODhXWEpndHVURStBeE14SVVxbUR3M0FHYS9DeHJPamd4Z285K1pi?=
 =?utf-8?B?aEJ6bGJYbjJSalArMHlXQU0vNVk2TUtDRWRNczVJelFlQzJlQTRXVVZPenRu?=
 =?utf-8?B?RE5sVEoxbWt5bUlvUysxRVRlckxBK0tiTVYyejdHUlFiYU9TQWJTYWZQUlhJ?=
 =?utf-8?B?TmdJL0JrekxRV0RVZTBHMjRmNGkxR0NaQ3NNTU8xcUYvUFFuSGdGREI1N2dN?=
 =?utf-8?B?V0tuUDhCa1hTQTV3UElhMVVnVDZEVnhlT3c5RU5QSnl1c08zOEdVbWVId2Vq?=
 =?utf-8?B?SHlsV0U2RDZDaGNrS01FcytHbFJ1eDhveVFmM2JYdEUrWm9ZVWxnMENvWXdE?=
 =?utf-8?B?Unhqa3VNQTFBL3UwOFhnN0tRc0YrL0VNMVFpeTJGQ1g4NE12cjJDcDdReXlM?=
 =?utf-8?Q?z/Oc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca775381-3c77-4969-b64e-08dbaa47a02f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 17:28:00.9775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQXR4dvJPbZ+7qUBWksP7cN+JeewqlQ5SBq8eKwx1rhClFuH0+rrhjFQhiSVByx2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8356
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 17:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186984

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSeWFuIEVhdG1vbiA8cmVhdG1v
bkB0aS5jb20+DQo+IFNlbnQ6IGRlbiAyOCBhdWd1c3RpIDIwMjMgMTk6MTANCj4gVG86IFBldGVy
IEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgTWF4IEtydW1tZW5h
Y2hlcg0KPiA8bWF4Lm9zcy4wOUBnbWFpbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IENjOiBNYXggS3J1bW1lbmFjaGVyIDxtYXgua3J1bW1lbmFjaGVy
QHRvcmFkZXguY29tPjsgUmFuZG9scGggU2FwcA0KPiA8cnNAdGkuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW29lXVtPRS1jb3JlXVtQYXRjaCAwLzFdIFJldmVydCAiYmluX3BhY2thZ2UuYmJjbGFzczog
SW5oaWJpdA0KPiB0aGUgZGVmYXVsdCBkZXBlbmRlbmNpZXMiDQo+IA0KPiBPbiA4LzI3LzIwMjMg
NDoyMyBQTSwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBNYXggS3J1bW1lbmFjaGVyIDxtYXgub3NzLjA5QGdtYWls
LmNvbT4NCj4gPj4gU2VudDogZGVuIDI3IGF1Z3VzdGkgMjAyMyAxMDoxMA0KPiA+PiBUbzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgUGV0ZXIgS2plbGxlcnN0ZWR0
DQo+ID4+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4+IENjOiBNYXggS3J1bW1l
bmFjaGVyIDxtYXgua3J1bW1lbmFjaGVyQHRvcmFkZXguY29tPjsgUmFuZG9scGggU2FwcA0KPiA+
PiA8cnNAdGkuY29tPg0KPiA+PiBTdWJqZWN0OiBbb2VdW09FLWNvcmVdW1BhdGNoIDAvMV0gUmV2
ZXJ0ICJiaW5fcGFja2FnZS5iYmNsYXNzOiBJbmhpYml0IHRoZQ0KPiA+PiBkZWZhdWx0IGRlcGVu
ZGVuY2llcyINCj4gPj4NCj4gPj4gRnJvbTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5h
Y2hlckB0b3JhZGV4LmNvbT4NCj4gPj4NCj4gPj4gSGkNCj4gPj4NCj4gPj4gV2l0aCBjb21taXQg
ZDFkMDliZDRkNyAoImJpbl9wYWNrYWdlLmJiY2xhc3M6IEluaGliaXQgdGhlIGRlZmF1bHQNCj4g
Pj4gZGVwZW5kZW5jaWVzIikgYXBwbGllZCBJJ20gZ2V0dGluZyBhIGxvdCBvZiB0aGVzZSBlcnJv
cnMsIGkuZS4gcWENCj4gPj4gZG9lcyBtaXNzIGxpYmMgYW5kIGNvbXBpbGVyIHByb3ZpZGVkIGxp
YnM6DQo+ID4+DQo+ID4+IEVSUk9SOiB0aS1pbWctcm9ndWUtdW1saWJzLTIzLjEuNjQwNDUwMS1y
MiBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZToNCj4gPj4gL3Vzci9saWIvbGlidXNjLnNvLjIzLjEu
NjQwNDUwMSBjb250YWluZWQgaW4gcGFja2FnZSB0aS1pbWctcm9ndWUtdW1saWJzDQo+ID4+IHJl
cXVpcmVzIGxkLWxpbnV4LWFhcmNoNjQuc28uMShHTElCQ18yLjE3KSg2NGJpdCksIGJ1dCBubyBw
cm92aWRlcnMgZm91bmQNCj4gPj4gaW4gUkRFUEVORFM6dGktaW1nLXJvZ3VlLXVtbGlicz8gW2Zp
bGUtcmRlcHNdDQo+ID4+IEVSUk9SOiB0aS1pbWctcm9ndWUtdW1saWJzLTIzLjEuNjQwNDUwMS1y
MiBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZToNCj4gPj4gL3Vzci9saWIvbGlidXNjLnNvLjIzLjEu
NjQwNDUwMSBjb250YWluZWQgaW4gcGFja2FnZSB0aS1pbWctcm9ndWUtdW1saWJzDQo+ID4+IHJl
cXVpcmVzIGxpYmMuc28uNihHTElCQ18yLjE3KSg2NGJpdCksIGJ1dCBubyBwcm92aWRlcnMgZm91
bmQgaW4NCj4gPj4gUkRFUEVORFM6dGktaW1nLXJvZ3VlLXVtbGlicz8gW2ZpbGUtcmRlcHNdDQo+
ID4+IEVSUk9SOiB0aS1pbWctcm9ndWUtdW1saWJzLTIzLjEuNjQwNDUwMS1yMiBkb19wYWNrYWdl
X3FhOiBRQSBJc3N1ZToNCj4gPj4gL3Vzci9saWIvbGlidWZ3cml0ZXIuc28uMjMuMS42NDA0NTAx
IGNvbnRhaW5lZCBpbiBwYWNrYWdlIHRpLWltZy1yb2d1ZS0NCj4gPj4gdW1saWJzIHJlcXVpcmVz
IGxpYnN0ZGMrKy5zby42KEdMSUJDWFhfMy40LjE0KSg2NGJpdCksIGJ1dCBubyBwcm92aWRlcnMN
Cj4gPj4gZm91bmQgaW4gUkRFUEVORFM6dGktaW1nLXJvZ3VlLXVtbGlicz8gW2ZpbGUtcmRlcHNd
DQo+ID4+DQo+ID4+IFJldmVydGluZyB0aGUgY29tbWl0IG1ha2VzIHRoZSBidWlsZCBwYXNzLCBh
bHRlcm5hdGl2ZWx5IGFkZGluZw0KPiA+PiB0byBkZXBlbmRzIGluIHRoZSByZWNpcGUgd2hpY2gg
aXMgdXNpbmcgdGhlIGJpbl9wYWNrYWdlIGNsYXNzDQo+ID4+IGZpeGVzIGl0IHRvbzoNCj4gPj4N
Cj4gPj4gREVQRU5EUyArPSAiIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWNvbXBpbGVybGlicyB2
aXJ0dWFsL2xpYmMiDQo+ID4+DQo+ID4+IEknZCBwcmVmZXIgcmV2ZXJ0aW5nIHJlbW92aW5nIHRo
ZSBkZWZhdWx0IGRlcGVuZGVuY2llcyBvdmVyIGZpeGluZw0KPiA+PiBlYWNoIG9mIHRoZSByZWNp
cGVzIHdoaWNoIGRvIHVzZSB0aGUgYmluX3BhY2thZ2UgY2xhc3MgdG8gYWN0dWFsbHkNCj4gPj4g
aW5zdGFsbCBiaW5hcmllcyBydW5uaW5nIGluIHRoZSB0YXJnZXQgdXNlciBzcGFjZS4NCj4gPj4N
Cj4gPj4gQW55IG9waW5pb25zPw0KPiA+DQo+ID4gQnVtbWVyLiBJIGd1ZXNzIHdlIHdpbGwgaGF2
ZSB0byB1cGRhdGUgb3VyIHJlY2lwZXMgaW5kaXZpZHVhbGx5DQo+ID4gaW5zdGVhZC4gOigNCj4g
DQo+IFdhcyB0aGVyZSBzb21lIGlzc3VlIHRoYXQgeW91ciBwYXRjaCB3YXMgc2Vla2luZyB0byBz
b2x2ZT8gIFRoZXJlIHdhcw0KPiBub3QgbXVjaCBleHBsYW5hdGlvbiBpbiB5b3VyIHBhdGNoIG9y
IGRpc2N1c3Npb24gYWJvdXQgaXQgb24gdGhlIG1haWxpbmcNCj4gbGlzdCBiZWZvcmUgaXQgd2Fz
IGFjY2VwdGVkLg0KPiANCj4gT3IgZGlkIHRoaXMganVzdCBzZWVtIGxpa2Ugc29tZXRoaW5nIHRv
IGRvIHNpbmNlIHRoaXMgY2xhc3MgZG9lc24ndA0KPiBidWlsZCBhbnl0aGluZz8NCg0KSXQganVz
dCBzZWVtZWQgbG9naWNhbCB0aGF0IHNpbmNlIG5vdGhpbmcgaXMgYnVpbHQsIHRoZXJlIHNob3Vs
ZCBiZSANCm5vIG5lZWQgZm9yIHRoZSBjb21waWxlci4gSSBkaWQsIGhvd2V2ZXIsIG1pc3MgdGhl
IHBvdGVudGlhbCBuZWVkIGZvciANCnRoZSBydW50aW1lIGxpYnJhcmllcy4NCiANCj4gSnVzdCBs
b29raW5nIGZvciBiYWNrZ3JvdW5kLg0KPiANCj4gWW91ciBjb21taXQgaXMgYWxzbyB0aGUgc291
cmNlIG9mIGFub3RoZXIgZXJyb3Igd2l0aCB0aGlzIHRoZSBzYW1lDQo+IHRpLWltZy1yb2d1ZS11
bWxpYnMgcmVjaXBlIHRoYXQgSSd2ZSBiZWVuIHRyeWluZyB0byB0cmFjayBkb3duIGFsbCBsYXN0
DQo+IHdlZWsuICBNYXgganVzdCBiZWF0IG1lIHRvIGZpbmRpbmcgaXQuDQo+IA0KPiBJJ20gdm90
aW5nIHRvIHJldmVydCB5b3VyIHBhdGNoIHVubGVzcyB0aGVyZSBpcyBjb21wZWxsaW5nIHJlYXNv
biBmb3INCj4geW91ciBwYXRjaC4NCg0KSWYgaXQgd2FzIG5vdCBvYnZpb3VzIGZyb20gbXkgcmVz
cG9uc2UgYWJvdmUsIEkgYW0gaW4gZmF2b3Igb2YgcmV2ZXJ0aW5nIA0KbXkgY2hhbmdlIHNpbmNl
IHRoZSBlcnJvcnMgcmVwb3J0ZWQgYnkgTWF4IG9idmlvdXNseSB3YXMgbm90IHBhcnQgb2YgbXkg
DQp1c2UgY2FzZSBhbmQgZGlkIG5vdCBhZmZlY3QgYW55IG9mIG91ciByZWNpcGVzLg0KDQovL1Bl
dGVyDQoNCg==

