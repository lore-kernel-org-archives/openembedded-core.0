Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AD4C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:29:38 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web09.33599.1653892172928663097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=BE9gFEaf;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1653892174; x=1685428174;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JZun17xOUXGaknIAVr1GLxIpJFH9Wau8Uj0maDNjgAg=;
  b=BE9gFEafHA6huSwV2IFT1aPUHOqfdZN1/DuoRbIUo6xzFoubp9xoDGJN
   DsTN8IvjcFuamKJg78MMXSsE/QfD0LJcp5XIWQfn1sLBuolxzos9Rwh0K
   MAJ7ybyahwf55PWHYur5yFGb2NxsDjZs9LVhp5b4BAUanC5+az1kxEt/b
   wdUFwHs1GUzJOYf6SJ5O/UFMBbE6sSvtJx+i1b+K5lKNWOkYD1PbViJHI
   rKIknCAx0ce9Pk97u/gfHihf2zUiUjFHAHf5vRysSAuvxYVYOSTI2NkG8
   9mqx20HOf5Di0pfdJ8lbFYptYv69mCGnBZ0ZTxU0syYF3e5OF9C5S/ZSl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="56681221"
X-IronPort-AV: E=Sophos;i="5.91,262,1647270000";
   d="scan'208";a="56681221"
Received: from mail-tycjpn01lp2171.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.171])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 15:29:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZoPeELqo43FVYajx9HqaMVSPU4o4/IWOId8yUvtgURjOUoT5Fh7+L+lEl7+eD9pMx9IH8DDtiSdRKMMpZznZmIhDQWWjLRpVnfSvSzAHDfTU0S6ItEQzHz9oNmnK0zomnPUG5dZpc7AaGabkpQl7had2e5uxD0OqDaoaHmQPEBYJp5FbNJZO86WbdrZgJmBZRCNnpPTDbhn9ak4ilPdj7jsXZuAov+1gqqzWTWa+rxyKStJ825tUSguwcJ1NWLQcOs7BhVf8TSPHEKh9wAyMlvqQyyb+dsJRjsml674afbNtxm2WMO5aSX2129klnxmnGAoFCpoGpRnXidtgEen7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZun17xOUXGaknIAVr1GLxIpJFH9Wau8Uj0maDNjgAg=;
 b=D7PN6sbZSNJylU0Mw/sF5i4QceihRMbb85+s29AuB44ZStJQQZJ0HJY+C4WHx25yxB2zrMRTad8HbQrCDUQO9KTa677hn035LGDg/F3TnuOuaHxb8RaqScHGkK7r8QgbBlnBLuDfGNGbiLpaTCL4g7CwfiJGfkAOKLHS06f+PM7D69iUDcQu4PsTNWzoJS13OnWmDM3+CVpJcxRouuBTZuoOA9xaZm7bSpjwMZR79ZcbHmBSomH6AhxNhQHxvSTWq7p9bfSqQh5oRIsnLB+8doLPMtr/U+XztPgoJBxz4RfCBCeuxPIhMM5JasTJ9HWVZJ7DR8WCm5N4ARvRA/RSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZun17xOUXGaknIAVr1GLxIpJFH9Wau8Uj0maDNjgAg=;
 b=QVAKsQx7dWNoPX39GTDJ4aQOgHyHeN7J2J0VV/pJUhHpHQopXBHTtOHxMcWvu08TBwxBm3Kkjb8EE+XOtBlf/Ba2XTwAcpHb+Hx9TKY7gNp3J//R37tdYdZ4EZhOyWKB9Zs+Y6fdnYnkKHcu+d9+OS7NOG4ehE4IxdjM5FHYtno=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS3PR01MB6580.jpnprd01.prod.outlook.com (2603:1096:604:10a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 06:29:27 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%6]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 06:29:27 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 doesn't work.
Thread-Topic: [OE-core] DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 doesn't work.
Thread-Index: AdhxYR38VlAlQshxQSyxiIpryddRpQAnFlWAAHuXwFA=
Date: Mon, 30 May 2022 06:29:26 +0000
Message-ID: 
 <OS0PR01MB6178F58D811B2F8A3063C526A0DD9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <OS0PR01MB61783B64BAF9C5AE3BE85331A0D89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj8LKgJA5vheJz-fMO_7ySbgPenzGMH58zSZSCMLCm50mA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8LKgJA5vheJz-fMO_7ySbgPenzGMH58zSZSCMLCm50mA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 960caf33-9124-42c4-19dd-08da4205becd
x-ms-traffictypediagnostic: OS3PR01MB6580:EE_
x-microsoft-antispam-prvs: 
 <OS3PR01MB6580D57E948916BBF03AFFCDA0DD9@OS3PR01MB6580.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5qRNboiLGdPq3ah5sBY2n+DIgBM3lTXJjlbIBvpjlWMhwteGhSFtOVjHa4EDDhw1tByt71/VkVExA54ACxKgcuQcmI4PBVOF8UqDSw+/xJMAVBWxJwCn0V/0Mt33urOETAosfzl5HkPoER+n1ktzpSNNEUY4ERX1uDw4NkLwAV6mtDCDjoWAZZDyfN8Tfr7JtrJecTursP9LTZhZ/94W2LJcspiRcX2QFrO7GWXnJewdlV6Co2ADdI5fnMz8Yv7gr/KoSXU6U2gLR45QESTXRqEG/vgzU7US+3XV+hDsX25plzvejbl0jt12diKKZ3t8Fj82v/LwMlenV4JdP25ex+qfPG9IX2qwBdkBH2biPJ20BkHv3xRtwRPqDaazzCxXGVGaEj8so6lYNDehb2xBHVmRAwM5qJERAlshXcyG6z1Jd1DSj+lNP8XptrZn06nA3BA0dhUtIBiAmGPlOUHKXV8qiuGTWMPnwXk2GWDswZS++IQvTb1Zm0FOBMkf2ucGMoZW/3S4mShuJchUSHMm/3l0rpKcG+25yot+9913O26WPhPWZkaUBp/y14poGZqcb2+UdcpDW6QGG935IhMdlQfSKc7PDIChz3sKZom+qV4JjBj3hrzZEnnboDytxCoaBxc4L14IS+Iz4Wjsken897NAmqCPxPr9iMIP/Ukvge9TEYKstg4FHdwGTVqjQKss51YCQ021xEbYyHBcaXQ55fRFd58GXBPYzCGxksfQ9E2+3jKoOszdeCblu3IIb35+5WKUwaiP8f28iPebEwb5+CHVPeG04NmqRbgIbnM2ojBu217gCs3SXepJLFwCYZ1e
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(966005)(508600001)(52536014)(55016003)(71200400001)(5660300002)(6506007)(7696005)(53546011)(9686003)(8936002)(2906002)(86362001)(6916009)(38100700002)(38070700005)(8676002)(4326008)(64756008)(66446008)(122000001)(76116006)(66946007)(66476007)(66556008)(82960400001)(316002)(85182001)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zmo1VGluT0xvLytwVFE5UmEyU3gwcUtpK2dJZzdab05DZTBscW9uSnAyVGhv?=
 =?utf-8?B?bER1bHFaUWNMQjBzcXQrVjNrdjk4VXVXK0FQSGZyVVIvUlo4enhwMGFGOS9M?=
 =?utf-8?B?cHI0ZnVmSk13NzNhaVR2am5mU3NZNjBVZkh6R0FXL3ExenFEak9TMVVzUUZp?=
 =?utf-8?B?VmUvTk9aZmNZaStBTElMR0IvbWpWeGRkM24xbldIdVNUTjlFUDRaa2U3enhV?=
 =?utf-8?B?M01lYUsvbXFvWXZLY2JwQ050b1hpMEdnT0d6WjdXS3A5M2twOGMvRzdJTGtX?=
 =?utf-8?B?bFE5akJWaVp5NUJ4WHU0UXhzQjBvZmtYdUxjTmlOYWxEQ0dyUTRiWHJDU3Jz?=
 =?utf-8?B?VU9YbnVhSWVmSDNxdkd6NDNIUWRsaHBLWVNhc2tqaG13QTc5S0NzejcxalRp?=
 =?utf-8?B?Q3AwT1BhZnpEaGlkSkc2dEFpelNsTVVqeEI5VEZmMlZGdjBOdTMyNXVlbmto?=
 =?utf-8?B?L3lQVE1GazdqbE4xYUtMOXNpRUtvcC9zN2hDVkZML2ZwS2NMT21LZWlvbFBz?=
 =?utf-8?B?RkhVeWE2RUlhNCt0RmJFMnp6YnhWV3dzQndDd0ltaGltcmpXNzBaNEtpTVVV?=
 =?utf-8?B?bFZEZVl2QTRHUjRmWCtaZ2hyK2h4YVh1SlpYZzN0UHkyWXpyTXFvRTZrdFVQ?=
 =?utf-8?B?ek8reG9UMFFNYVkzczBtMlV6NWlFMGt1ekJFTFJVR2pjNThhSHBKT3FTV0JB?=
 =?utf-8?B?Sm5pODFqL1g2ejdEQ3ZZWXBxWmFPME0yRU9DZklnUGREUTBicGN5QWtjak9I?=
 =?utf-8?B?b0d2RlRsd3JrNjcrRlZGVjZnY3duNFBITjhrTlB1My9OL0s2cW5yWmlOMWdn?=
 =?utf-8?B?N3J5ZHN4V2V0bTgwSGFCbi8wYVFBTms0bG5UY0M2L1kwSjQ5UU9oTXBqQ2hj?=
 =?utf-8?B?L21iSkNhOHd3KysxRE1EU0ZhbytqaVhFV2oyY1dlNTYrR2Zwc2UvaldRaEhH?=
 =?utf-8?B?aDJXQjdmdndLTTVlSTdUNXY0eDhZNzZpYWl3akRwUkxuZTUzWlN2VHRDQlR3?=
 =?utf-8?B?eHdBOWZLZ24ycWVKSnRsSDVpSjJhOFpVZmRpVVF2Y0Ztc2tNcHR4TnJiTmNX?=
 =?utf-8?B?R0xITVhmRW5pajYrUUQ2QzJJWU56cnJoUzZHOTBJb0dDS2Z6QmN2Z3NNTHI0?=
 =?utf-8?B?bEg3eFJKekdEbEJkOVFuZndKQVEyRm00cEtEUkZrTk9TUGMwbW1HU25aOTFw?=
 =?utf-8?B?WlJlWDV4UTQ2NWdsbDZPRTZSVDNqczdYMFR4YnNlY0NlV2hKZURUNGRFQXlv?=
 =?utf-8?B?NStZeUNPY1ZLWWRXQVZOdWVBNTVvTGdSVW44VVZXbkNReUJVWVJlb21meUZK?=
 =?utf-8?B?VXU0dEJkUkt6QklxQTBpZkJTUzBXZGhSdVNCM1Y1NHp2a2t5elN3cEROK3hD?=
 =?utf-8?B?L01XbHljcUg5Ynlpc1FJZkVaeGgzQ2xZZWxrV0phT0VSQUJsTndhMWM4Vy82?=
 =?utf-8?B?Z0RkM2VpYk45WUowaFN2SDF2VzB6YjJLV2dRN1dVcWg3WWNMeFkwWlZkeVpW?=
 =?utf-8?B?V2kvUytyZmhTc2VlWFcrNS9sYkpzWGlFOXFyNmZOb1orMFdxb0hZQ0tPdFpW?=
 =?utf-8?B?aldvL2Z1WlVmcS9iTmRWVXFiWS9oRElGR0FmWXVDZUJaYjc2TFFFU0VQQks3?=
 =?utf-8?B?UTRlRkZpQzE1aC9BWDFOTXN6NnczNEpmazlabmtoODZQOHVrbGQ1eCtwT2tw?=
 =?utf-8?B?T3I5SVhYS0pnNXVZSkw0SWtNUytsT29nUUhnVTRDOCtzZm1Qbno1MG9ZaHUr?=
 =?utf-8?B?MHdieTIxNmtoczg2TEZYSm8yMHBLZDMyanJEd0M0azBQVjJWZ1hMNWdCQmlX?=
 =?utf-8?B?cVNOWkRGT01HWVpSYmtSMzQrZnJ1QlZ1UFJMbTZicEFPN3JDNCt1bGYwQkFB?=
 =?utf-8?B?c0p1UDVvbXJHc3ZFWmpHZk5pajZlSVZHYlducGtCMnlZcFNvQVpwNkxIT0Mz?=
 =?utf-8?B?N0tOVTJFTTVHMjhoUEREMS9YNGhjNUFrRXJmYURMbEc4MjlZeXdtTWRBc3Vz?=
 =?utf-8?B?K0JVcW1XRFF1S3hPeVg4WlcrZ3ZrUWM1NmR3aDVRTHUwUWZwQWh6RGtaSTN1?=
 =?utf-8?B?QnhpSFBOODBtZ05ZcjFlY0k5aDlaV1MvSGNUNVlDUHBkZUVZaDBaVUhPc0Vr?=
 =?utf-8?B?NDUrVDlrV2xTbjVYWXVvVTdKVmQ2Zy9QazFwVWNPTEhEUTBlb1RYVkpDMU11?=
 =?utf-8?B?ZmN4d2FOaUtKV1RYWGVvcW9nZ3pxWEIvcUdreG5Ub1F6NThqci8zTS82YURT?=
 =?utf-8?B?aTF0N1BXMlpHcHNKYW9FZUUvSVJDdnE5WTNzVnRxeHkwVGovTU5JTm9QS1NB?=
 =?utf-8?B?OFVYSjJBc3FWalo1dzI3YTFsYkJBbGdIcDJnSm1wSmUxY045dVUvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 960caf33-9124-42c4-19dd-08da4205becd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 06:29:26.9259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 mggR4d9PfppgUYHhbsy3c6/6x8WErtXpJ3FPsp5l0oJPO2mhuRcXWSBub62hFu0Mgbq6wU0YD1R/YYxANB+6+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6580
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166261

SGkgIEFsZXgNCg0KPiBDYW4geW91IGV4cGxhaW4gdGhlIHVzZSBjYXNlIHBsZWFzZT8gSWYgeW91
IGp1c3Qgd2FudCB0byB1c2Ugc3lzdGVtZCwgDQoNCkkganVzdCB3YW50IHRvIHNlbGVjdCBzeXN0
ZW1kIGluc3RlYWQgb2Ygc3lzdmluaXQuIFNvIEkgYWRkZWQgdGhlIGZvbGxvd2luZyBpbiBsb2Nh
bC5jb25mIGJlZm9yZS4gQnV0IGl0IGRvZXNuJ3Qgd29yayByZWNlbnRseS4NCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpESVNUUk9fRkVBVFVSRVM6YXBwZW5k
ID0gIiBzeXN0ZW0gIg0KRElTVFJPX0ZFQVRVUkVTX0JBQ0tGSUxMX0NPTlNJREVSRUQgPSAic3lz
dmluaXQiDQpWSVJUVUFMLVJVTlRJTUVfaW5pdF9tYW5hZ2VyID0gInN5c3RlbWQiDQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQo+IHNldCBJTklUX01BTkFH
RVIgPSAic3lzdGVtZCIuDQoNCk9rLCBJJ2xsIHRyeS4gVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0K
DQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6
IFNhdHVyZGF5LCBNYXkgMjgsIDIwMjIgMzoxMSBBTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1h
b2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBESVNUUk9fRkVBVFVSRVNfQkFDS0ZJ
TExfQ09OU0lERVJFRCA9ICJzeXN2aW5pdCINCj4gZG9lc24ndCB3b3JrLg0KPiANCj4gQ2FuIHlv
dSBleHBsYWluIHRoZSB1c2UgY2FzZSBwbGVhc2U/IElmIHlvdSBqdXN0IHdhbnQgdG8gdXNlIHN5
c3RlbWQsIHNldA0KPiBJTklUX01BTkFHRVIgPSAic3lzdGVtZCIuDQo+IA0KPiBBbGV4DQo+IA0K
PiBPbiBGcmksIDI3IE1heSAyMDIyIGF0IDAyOjM5LCBsZWltYW9odWkgPGxlaW1hb2h1aUBmdWpp
dHN1LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSwgYWxsDQo+ID4NCj4gPiBCZWNhdXNlIHRoZSBm
b2xsb3dpbmcgcGF0Y2gsICJESVNUUk9fRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRCA9DQo+
ICJzeXN2aW5pdCIiIGRvZXNuJ3Qgd29yayBhbnltb3JlLiBJIGhhdmUgdG8gIiBESVNUUk9fRkVB
VFVSRVM6cmVtb3ZlID0NCj4gInN5c3Zpbml0IiAiIGluc3RlYWQgdG8gZGlzYWJsZSBzeXN2aW5p
dC4NCj4gPiBCdXQgSSdtIG5vdCB2ZXJ5IGNsZWFyIGlmIHRoZXJlIGlzIGRpZmZlcmVuY2UgYmV0
d2Vlbg0KPiAiRElTVFJPX0ZFQVRVUkVTX0JBQ0tGSUxMX0NPTlNJREVSRUQiIGFuZCAiIERJU1RS
T19GRUFUVVJFUzpyZW1vdmUNCj4gIiBmb3IgbXkgaW1hZ2UuIENhbiBhbnlib2R5IHRlbGwgbWU/
DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiBjb21taXQg
YTZlYmJlM2ExMGZmNzYzODZkZGUwM2RkYWE3MDk3YmRiMmY1ZDlhNQ0KPiA+IEF1dGhvcjogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gRGF0
ZTogICBXZWQgQXByIDEzIDE4OjQxOjM5IDIwMjIgKzAxMDANCj4gPg0KPiA+ICAgICBwb2t5OiBV
c2UgSU5JVF9NQU5BR0VSIGluIG1haW4gZGlzdHJvIGNvbmZpZw0KPiA+DQo+ID4gICAgIEp1c3Qg
dG8ga2VlcCB0aGluZ3Mgc3RhbmRhcmQgYW5kIGNsZWFyLCB1c2UgdGhlIG5ldyBJTklUX01BTkFH
RVINCj4gdmFyaWFibGUNCj4gPiAgICAgaW4gdGhlIG1haW4gZGlzdHJvIGNvbmZpZy4gVGhpcyBt
YXRjaGVzIHRoZSBkZWZhdWx0IGNvbmZpZyB3aXRoIHRoZQ0KPiBhZGRpdGlvbg0KPiA+ICAgICBv
ZiBzb21lIERJU1RST19GRUFUVVJFUyB0d2Vha3MuDQo+ID4gICAgIC4uLi4uLg0KPiA+ICAgICBC
Ql9IQVNIU0VSVkUgPz89ICJhdXRvIg0KPiA+ICAgICArDQo+ID4gICAgICtJTklUX01BTkFHRVIg
PSAic3lzdmluaXQiDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPg0KPiA+IEJlc3QgcmVnYXJkcw0KPiA+IExlaQ0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2NjE5OCk6DQo+ID4gaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNjYxOTgN
Cj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85
MTM2NzE4OC8xNjg2NDg5DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVy
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gPiBbYWxleC5rYW5h
dmluQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

