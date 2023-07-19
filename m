Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD88C001DE
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 17:32:16 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.73])
 by mx.groups.io with SMTP id smtpd.web10.1516.1689787934114049091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 10:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=gE+qnOP7;
 spf=pass (domain: advantech.cz, ip: 40.107.117.73, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+vxxf1N0zvwcn4Xu6uNGIwXazudRSrKdeNdeSuVTrbdHrB86dNJtV+VdP+zBhW5jReJIGXX+E62e+YzWA69+Ija/oVoQGcu68fKtJQgurd1Na5/ncHMNriCjVytFVuhht30ppu7Y+uKIgvj5KelmX+IQ1NQ5YMqJax6myHMtX+IsP8WCjIaPO80+/QP8F5/qrJ/l2Mh0eAFEAFxzSOxvPPCzS+dnytw92biEbFo9ydZ1Tr2E8h/ns14OYN2lIsXq5SLW5EvzKdf2aqJKxWl0AHNxi0fgRnfKlIUa7/Qso9tKBLwionhcjm/AejQfUjmOldtwA7EbcoKtrMnbIoeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN/07j5ZgE2kgVcnWQpplvK6UFUsPRGRzABqWZG/BlQ=;
 b=oVQRrWFi2m1uDQx9Y8GZKQlWSnabbyQreW11pGs3LttueS8DISYqcD+1pDBldKhhJm47cWxIc+vLEmTYjgIMa5DZMpm1ZIUZP8cpFJxTMs0t3Rl7vAqqhOjNWwfHVWZdZr71c7RtfpqH3rbWu8FddeXJoksCV4gIBAp6ROebtD85FciTflZlgs2tiCF8DG2jt31OvkRKE679EzLO9lBoubyQSkZLaPuw1C2G6E4BoQtflRrrUP+lFOZ4E4ltJkntjD+fMvab36FvyXiCdljRuQGUavXXgTZBebnEidVGiFs5Nv/N+ipHD9xl1Toval7skQnctuKWz+LEoCaR0DVzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN/07j5ZgE2kgVcnWQpplvK6UFUsPRGRzABqWZG/BlQ=;
 b=gE+qnOP7dxqZWKmurCuVrFCXqtQ+MJB+sQcd9yDZbvi8Lgbt8T3KT12q5/W/H/FJnvWE+B3bnJwHguCHDxdi7hIoFFYZfMz9o5cA5z3XF6CN5SNGekafIHq1fbaBAQX9zgl7ujw91SLPlF1iYw0PCPP7QgazF8BLhynoO2QtuRxZQXn0TsNJVVOEm1NIHBSm/6se3BX5pr66On+F2xWQUE+P3938LsUFk5zQmloshX8Sx5U5gINlNU1rdK42troC+duAVAnDb+Ob/nx5AQOwxkk3NUnJxE5pj+Try0rhWP3SypP/abRXuH+omGHyQdn/u6StwakNMUOa6YZC2jPr1g==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SG2PR02MB5673.apcprd02.prod.outlook.com (2603:1096:4:1cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 17:32:08 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 17:32:08 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Topic: make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Index: Adm6Zirrs9Te84mJRC+MJegq9PcmmA==
Date: Wed, 19 Jul 2023 17:32:07 +0000
Message-ID: 
 <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SG2PR02MB5673:EE_
x-ms-office365-filtering-correlation-id: a6d7b1c2-ace3-4440-61b7-08db887e1382
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jimsr1uOpD/iz21AclYM6GM5dV4JfTimyFNfvulzv2petlHXek+ysDeY+Ev9F52VNWTtaejZY2iqDraOoanhWolFuGHc5+xIsTrxYwo1y4PQsdDIrMBOwiuzPawaqg/WfZi2/neULBDxbhz/SYnQO7jcYsFgYyb7mJev9DbvU1VEs1AScTW9hcGKbqL19NvFMUm5nUGJz/1M/gTNjlZVOcxobaec1HmLMx3byFK7ArWrKSFl2/2Q7ClZoe/1+wbwc19RargLuea3atpDROowljOJER1fJaCj3ejHm5Ego672GrRWBzlWK45gs2KtjIP/tE+dFi2xdNMTOVikvhFrSKT6nRZrwiiwi29kBShAkEZJWhMCDxMoGaV0pnR4oE6MSQ+1A5ddW8ECZPJKS6c/HOW5aNONomWhKvO8yy/iRP0P6bieNXZvTfQ+i1IX4/dLiWJgEMI2Yf9HVxQz3EpVDR0qx+sd/xaPohIWDkFWpHVqSD3GMp9dZaHQ7FrMagMoA+J9w6ogTpYBmooD96xgigVWrc6xQCzs8cnZS7xlUmsLtjG2tvuCe0Qw1LZxsfPxP5xLBR/5i/9Sw5rfDXDZja095Thi2XfTWTDdH8DW2zI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(7696005)(9686003)(6506007)(26005)(966005)(122000001)(83380400001)(38070700005)(86362001)(33656002)(38100700002)(186003)(55016003)(8936002)(8676002)(41300700001)(2906002)(44832011)(5660300002)(64756008)(52536014)(316002)(6916009)(66446008)(66946007)(66556008)(66476007)(76116006)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VDJRalJTNmh1Si9YN25hK3poSy9paGJTZkFqQ3M5NGlGbmx1a1lFZDhsMjBP?=
 =?utf-8?B?UDM0Skxvci9TZXZwWnVKcXhOTU9oeGdDMU82c28vZUtlT0MxVW85TVJIV1dq?=
 =?utf-8?B?OFlrTk1WdzgyN25UcjIxY083RkdxN1N4VG00UUxaaWtQcXlCZlJETjFLQVRy?=
 =?utf-8?B?YVQ1YXpHSm82RE42SkVxN3ljQnRTa1Q4Umd0RWpXZjlnWmJvQWZsbkF3a3Uy?=
 =?utf-8?B?ZDIzTGxkaUpMdkxmZ2lvOGJibHZkUUU0OE1aUURvMDJWM2lVREs0ZU8vbFFu?=
 =?utf-8?B?OXNWVmJqU1dSTURkN29FRlVCblU3dGxvakUzQ2tjRFh4YlJ0cTZjN09aQ3hN?=
 =?utf-8?B?MHM0UUhKOS9WZ05rTTFRUU96bnpTc1ZyaEhra0R3aWFDRHRUcnNNUkZndFh5?=
 =?utf-8?B?TFlpa1gwaXI1bE5lbGFwMXgxVFZMVjQxSUdYSU5BWGxETCtsL0p1c2o3M29w?=
 =?utf-8?B?MkNYMWZZTU81OVVDbnA1VFBHbjV3UVovZzdPSzdGOVk4OVd6OFdieFZTcnU1?=
 =?utf-8?B?VXg0ZWZlS2VnTk5oS1RqSEJLK1IrbkZrZ3laRmd5OUlqYXpuUzhjKzg1enVl?=
 =?utf-8?B?T0pUQVpGRFJrRVhORElmTGp3NlR2b0ExalNyWmc3aExqOE0yT2lJaEduKy84?=
 =?utf-8?B?NkZLU0hLb0pva0M5eUYyWTFTQXRXSHJtWmZlK1UvS0ZrM1dCeUllWlpndjVx?=
 =?utf-8?B?cTBhb2J4ejgwZlJISTRhWkYzQjNTWFJMMndKQ3pvanpNZEZ4bjZCNG15Qkk1?=
 =?utf-8?B?VlBFRVJ2bmJWbGU3djlqL3RsaWVYRmFybEZVTDlGV3E5M0RNN3ovbUV5K2VY?=
 =?utf-8?B?cXcvcERLNWEyUlU2UEw5NUlaWFNvRi9wWHFiT2JqNDhyaGpSaEh0K1o2L0Zo?=
 =?utf-8?B?cmRYWVJmcWE3bGQ2UjNLR2FOSloxZ3hYdkRRUE9ZRnFjR0FRN3dyYmNSWmtN?=
 =?utf-8?B?WStrZndCT25xVkYwVFdzODdDMlh2RmI0bTRjWTVpVEtlOGNGZHhwNlFkTXA2?=
 =?utf-8?B?OGgwK0ltVkQzUm5ubGZhUEExdS8yUUkwY0ZpMTI1YzlJbTV2cVVYWmpWMWpa?=
 =?utf-8?B?REg5TjNtZlpiNHVsNkI1K3RWdXBXSk85S0IwVU4vcUVnZEVQVGkvbk1lQjNM?=
 =?utf-8?B?YitFclZJRGNmVWJLYUdKYUEwckFIYmtPM3NqSW1rSzNVNU40RGd4NlJKUlo2?=
 =?utf-8?B?SkVMOGxGN0E4TEpyQ2g1SFBwejRCMDBzb28xVys3TE55bjFtVnFMVlVFZTBq?=
 =?utf-8?B?UlBRTGpZVlozZk45Q2hOcWhHUU5zSHduNDExekYwR01ReU5ZbEJXTXZ4cUVi?=
 =?utf-8?B?WkFkcWc3TDdyZjlFTkwrblhNeFRicnlCUDAvRGhHMWl0bnpLMUw5V0pHMEJM?=
 =?utf-8?B?OFF3OTRmakNqT2xOdE1UNmVhQkk0Mmk2RlhaVWhZallYa2lRcFMzNHZUVVY0?=
 =?utf-8?B?QVFqeFpHZXY5WjFIMHVMdExPVHhTNDJQdGMreVJIZmF0TE85VHg3QmhxY0pN?=
 =?utf-8?B?dTBNSnplZE5hbDhxSERDWi9ZMklXV05lL0g4ZnN1TGZvRmxVaitQN1B2eFlJ?=
 =?utf-8?B?c0w1MHR1S1RSNjFKM0E3U2xzS2YvQWovdlNpbGtlbkhCOFdSQTZxYTZuOTc1?=
 =?utf-8?B?KzduT25aNFZwL3lNRHlHdGw5SVc1ZEh6MzMzeU8raktKaGEwelF2clNMemRy?=
 =?utf-8?B?Kzd6MW1PZE05U042R3FqVTFhcVFyNXpidlc2MUxBVjVvSXJSSUd0TXlOeURY?=
 =?utf-8?B?Q0grSVYra0FwR1NyQkNVQ0dHcGpFRnhxc3hSdDNVMGE4c2JRNFdsb0c1akUx?=
 =?utf-8?B?MzIzNklqa090aEJmV2VmQ3dYWDVSdEVqeW9MVWlnTDhZTVNYdkl4ZGVJNXZL?=
 =?utf-8?B?VDdnV0M5VUgrMTZFNXcxSWRjaUZDT0RkNWR4NFRPQ3FXZHlYVzlRR0JYUWNs?=
 =?utf-8?B?VGRRN1A3SW43SU1pOTdkSjdJeFhkczBMRHB6ZEczZWRNLzBjQzFpc2VhNVMx?=
 =?utf-8?B?ZXo5WXlkeWZib25RdTQ4QnM5SkNHU05ycUt3RU8zSFVoK2VGMER6WVgrU3Zw?=
 =?utf-8?B?M3dlNHRUaFFBMmpBc2NHQTMwZG1seTFtZUhROVVSRzh0TkxrMEpET2R2cWo0?=
 =?utf-8?B?d21IdEFvUlMwcXRYSmxYMUFyWW5BV1llWERDNm8yY1hnK25hR2NrYkRFUmNW?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d7b1c2-ace3-4440-61b7-08db887e1382
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 17:32:07.7038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOuWD8jFOO7HXOMbFFb9+ZDFhkdMHjtsvyf23JV1V0s22AOht/H/pRG9v4MBVnRGS1Q5MAvRANVunygegGH42lEuGlqQuQY6PtWS7y98E1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 17:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184590

SGVsbG8sDQp0aGUgb3V0LW9mLXRyZWUga2VybmVsIG1vZHVsZXMgYnVpbHQgd2l0aCBsYXRlc3Qg
bWFzdGVyIGhhdmUgYnJva2VuICJ2ZXJtYWdpYyIgYW5kIHRodXMgY2Fubm90IGJlIGxvYWRlZC4N
Cg0KVGhlIHBhdGNoIGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lk
PWJiMGY5ZTg3NzAwYWE0MGVjOGRiODgwZWRlM2MwMThjMWQwNTU3ODYNCmFkZGVkIHRvIG1ldGEv
Y2xhc3Nlcy1yZWNpcGUva2VybmVsLWFyY2guYmJjbGFzczoNCglleHBvcnQgTE9DQUxWRVJTSU9O
ID89ICIke0tFUk5FTF9MT0NBTFZFUlNJT059Ig0Kc28gd2hlbiBzb21lYm9keSBzZXRzIHRoZSBL
RVJORUxfTE9DQUxWRVJTSU9OLCB0aGUga2VybmVsIGlzIGJ1aWxkIHdpdGggdGhpcyBzdWZmaXgu
IFNvIGZhciBzbyBnb29kLg0KDQpUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSAibWFrZS1tb2Qtc2Ny
aXB0cyIgZG9lc24ndCBrbm93IHRoZSBLRVJORUxfTE9DQUxWRVJTSU9OLCBzbyBpdCBkb2VzIG5v
dCBzZXQgdGhlIExPQ0FMVkVSU0lPTi4NCldoZW4gdGhlIExPQ0FMVkVSU0lPTiBpcyBub3Qgc2V0
LCBvbmUgc3VmZml4IHVzZWQgdG8gYnVpbGQgdGhlIGtlcm5lbCBpcyBtaXNzaW5nLCB0aGUgbW9k
dWxlICJ2ZXJtYWdpYyIgZG9lc24ndCBtYXRjaCB0aGUga2VybmVsIGFuZCB0aGUgb3V0LW9mLXRy
ZWUgbW9kdWxlcyBmYWlsIHRvIGxvYWQuDQpGb3IgZXhhbXBsZSwgYWZ0ZXIgYnVpbGRpbmcgdGhl
IGtlcm5lbCB0aGUgImtlcm5lbC1idWlsZC1hcnRpZmFjdHMvaW5jbHVkZS9nZW5lcmF0ZWQvdXRz
cmVsZWFzZS5oIiBjb250YWlucyAiNi4xLjMzLWc4ZjdmMzcxYmUyIiwgaG93ZXZlciBhZnRlciBy
dW5uaW5nICJtYWtlLW1vZC1zY3JpcHRzIiBpdCdzIG9ubHkgIjYuMS4zMyIuDQoNCk9uZSBzb2x1
dGlvbiB0byB0aGlzIHdvdWxkIGJlIHRvIHN0b3JlIHRoZSBLRVJORUxfTE9DQUxWRVJTSU9OIHNv
bWV3aGVyZSBhbmQgdGhlbiByZXN0b3JlIGl0IGJ5IHRoZSAibWFrZS1tb2Qtc2NyaXB0cyIgdG8g
bWFrZSBzdXJlIHRoZSBidWlsZCBlbnZpcm9ubWVudCBpcyBpbml0aWFsaXplZCBwcm9wZXJseS4g
SSBhbSBqdXN0IG5vdCBzdXJlIHdoZXJlIGlzIHRoZSByaWdodCBzdG9yYWdlIGZvciB0aGlzLg0K
DQoNClBldHINCg0K

