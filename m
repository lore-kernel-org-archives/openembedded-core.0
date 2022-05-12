Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ED2C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 00:45:00 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web09.1482.1652316293730609994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 17:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=a9EyQrS3;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.76,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1652316294; x=1683852294;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YDt9jssAMfu0lT6VleurHpFcXA9/qJ0oNoHZnuDp9Zg=;
  b=a9EyQrS3Q2Z8TRElIoQvBgPBZtoKFK6rl05SWoyqvC5s49aIUPZHHgux
   ThKIcDfYfVp/ClEZdl9JRsanOnsjS4iCK0UgiwLEiIHNN1GI9g3CpnBoS
   e70GVQ2mee0aR6nEhScum6N7T0ddBLIMoNTcjv+4xPjMON28JVB4/A6HY
   JOkfbCm3DXnDWfvawyuIAqptBQD4BuUQ28f5zJqn+ZcCIiueZu4EGIZbF
   i/e+L4kGXqwrXEBrCTPp/S1N9gQoik5qyX/M1koNc8G80LNAtYwcxGigw
   zjlhc9DeQtljTvhA3iHFhdorfX2LYjjXqwxAKBzH1CRMil4p2y951IDRJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="55725715"
X-IronPort-AV: E=Sophos;i="5.91,218,1647270000";
   d="scan'208";a="55725715"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 09:44:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ND0XNEpx+EJ7p4OrB7Xal3CXWyQzT+4IAx0/3qRAaK8beFUBmH9TXRWnqRb2IBL0TECaocUWeYev8xidjf1MCgnMwhKecHTz0nuYX9vkPC883kk4EGHRp5fZIqnfmv6otFWY4wdZSQXbENhGirlUDSv8+HuXeol1rcI7xwBbQj+OsWDWL04pfPgjg4qg3DEYLWm43wkkWK7aIsG5oE8+U1m4p1AVmaHYG04Ex65vhSevl+ZeDyqoBAhLCXaIgCSEfXkSRc+MlEjtaqW+MAyKsnJYpUIAXVS5scaRxzX5TQavSHJ3wMmSizjgKnvmrHDZUDQ1xYLUR7PZNWvDGlZGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDt9jssAMfu0lT6VleurHpFcXA9/qJ0oNoHZnuDp9Zg=;
 b=HGiRqtKgyHEiPRbswrvDwZQViqTcorwib4/ciVscQbmD8ZpohElwlNLDu9+k4Oh5+BcDMP7Ds7XBI9JUPL0chYOUPCbXqY7oNI3BoWlTM8TS55dGhrjrIfWizG6gzUmXG+d482xe325qGTJnOoliug5HgYK6l3IJtveact5UyL/N1qJWWvxYy+Gc5tf5XhWviM3aPe3grHX40kunPqzRN7ny6BICTLh9C6BVgV9jm3AHk1ABFPN5eQD5Hv6GcyQ2dmVLQpt256QrIIPduFWHxsJR6SNc80vynoLvAzIJqiUHFmW9gjGJ4Sb3tWpyKVVpHyKlypX5MWpFik+ZHv7kzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDt9jssAMfu0lT6VleurHpFcXA9/qJ0oNoHZnuDp9Zg=;
 b=bK/m4ov+ez985KjwxSoCMkbC1aoXBq4kGYoZg9iF6pKfTF8mTdRFNtfvQ16jzN3kIs3sTrOPpLExZPmWR7zOZ/FenlmKdmiF7D+gJKma3RYyol0oEmtWrUFE9vrysGgN9Egznc7qDG7aPkAAdEbhx/mqXXGwvwvuhmDibIUk5l4=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYAPR01MB5069.jpnprd01.prod.outlook.com (2603:1096:404:121::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Thu, 12 May
 2022 00:44:47 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%7]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 00:44:47 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Index: 
 AQHYYPqy/ocPXdQui0OLuVvDKY1+Ca0RY4IAgAEiy4CAAIIIgIACu/kAgAB7qACAAQd0IIAB6a4AgAAl6/CAADXrAIAA40tg
Date: Thu, 12 May 2022 00:44:46 +0000
Message-ID: 
 <OS0PR01MB6178B02EA52979A2E689CCF9A0CB9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
 <OS0PR01MB61786F05D3748BC41FBC3CDBA0C99@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj9-xW5_mEh1UTyX_AJ=nVbsN4LOhTGjYGVRvZjLH7=skg@mail.gmail.com>
 <OS0PR01MB6178F55D656ACB5989CB03D9A0C89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj87uzyMMsM32Y=_aiGagfm9ZG+yzcmLqRq1BMTXQm7VZA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj87uzyMMsM32Y=_aiGagfm9ZG+yzcmLqRq1BMTXQm7VZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15501b58-c964-4678-fc20-08da33b09d21
x-ms-traffictypediagnostic: TYAPR01MB5069:EE_
x-microsoft-antispam-prvs: 
 <TYAPR01MB506997C50551D49C43DA35A2A0CB9@TYAPR01MB5069.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4OgUJvDDWG0i7RrgffQuCiabY7dykrvNG3R4GuBmFAB6/FcyVmqkisBmnYEjAF29w3gBEiv0mndvNrboxghp+Uj5dlhxNAi5+oMdYK3JS7HqqzJwspK7AwEIx46egYUeneUV/GaihpbgHWVjQZHIqlxBrtt/fPUuTsHRW1NOnmimBcbzAeT/DYzCpttMN1hqy6rwjzDMuw51tOovYcI+XY/K42andevSxrsDr2sSUD7iohKFXd9YfbMBaSSEPlt+gwFhlEdMmXFVJb7M44C47VzA9deuhjTeq4se06GMWbJ8HkIZEc16dxd3EnZcnR0ONMy9q31UN7yJ4tas/0IxlHpmx87gbwB+Pf8HNT6as94YPXYm4jgFOTZxr1sK5JHzQql2oetkz+mLRkfrwPkzBdrJILScG16gpJrcveD0nobTyZY01gnkfFoqXVM0OjAEp0ZY/YHBAdIIdDFWlCnfq0pAWKDxMb4eFckYvxgrK4YqgDDQk4/qMivJ1Hr+s1QfmrhzrOX8I9ejDPA9QLSZr3sX/JNB689DacNJxmJvY0SDhZ99ipd5iXddzlRWeV0446WHGfCnVOhdkU+muUPSU5wXAUyZXKIUyWxGcOOGcJhkx6iACJLiWtGIU8SdMXes8E8qLThu6MxR3mc+vVMrf0FKeWXMvJ12nbKYujPVP+/ZzgVNUPwwybSHc2bS6pGmns23PeFyeK3nB/PHXwywTxG5JHsRhktT/ah/7MAd+wk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(82960400001)(55016003)(83380400001)(85182001)(122000001)(52536014)(8936002)(33656002)(6916009)(8676002)(64756008)(76116006)(66446008)(66476007)(66946007)(66556008)(4326008)(38100700002)(38070700005)(26005)(71200400001)(9686003)(316002)(508600001)(2906002)(5660300002)(186003)(86362001)(6506007)(7696005)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkpSVjJkeDdKdERUOGV1Sy9DbHZSakxNS0ZLbmJQaGhVdW5oVmdTUG51OVVt?=
 =?utf-8?B?cEE5MW5WUWpjcmdDemczS0lDUCtaSk5kOFhmOVJTdjVQYmxHTzd0S1lJa0VN?=
 =?utf-8?B?QzdOK1ZwSWJaT29PbkJ5c3ozWmNsdlRvN1RuakhycjQzR3ZDYnFXMU5CYlp6?=
 =?utf-8?B?emFNRjVIaVBMbndqVWVZbDBXMU50cmdqTjYrM3pHRENEY2xmb1c0TndQcm9o?=
 =?utf-8?B?Q291eWxsNlN6ZTEwVGZQVlFnaTVwU0Y0cFVKMnB3UDhtSnZXMU1DK1Roc2pv?=
 =?utf-8?B?QnQ2OVlOdUVVYTNMQ21vK1NRZk5zQW40Y3gwY0lxRmZpbGd0TDgwWFU5K3hr?=
 =?utf-8?B?OHFOR0xpY1RnMXFyeDllUTUrdUk0ak1wNGd4OGsxTWMrS2JvVC9wQis5aWlv?=
 =?utf-8?B?UGFPcGxvSzk1ZHNOVkVldGhsbno1SGJzQlBEZFd3MHhhWmxHWjZQRjFhZG5P?=
 =?utf-8?B?clArUGgvdjM1MG5jRXZodjRNTmlVUlJEUWhxenpqcG9PdTkvRUVuNGpadFEv?=
 =?utf-8?B?MVlodTZEV0ROVFNNc2FQMnB5RE9qc1NZK0Qvc2kzT0g5N2RjSUF6b0tiTmdx?=
 =?utf-8?B?Vm0xc1VIVlZ4N3FkNDYzcHdMMlBSdThGQ0VvSmpjM2xxQ1ZNUEN3Q0h1MWIx?=
 =?utf-8?B?NUF2UlpNK3V5ZCsyVG1tcitVU1haVXBLajRFY3M5eEVkUm56Kzg5QVlvd05u?=
 =?utf-8?B?SUt1dVFIWHE2MUViemp5NzZwYzA1TW92UmRHdnZlTE1DbEo0U0hKRkxXbk5M?=
 =?utf-8?B?blV6Y1NSeVNRaXZLOVl0UGFrejN5WDA2ZkYvVVpYdXhmTjhSU1dubzA3eUE2?=
 =?utf-8?B?UTU4T2pQNVJPZkttNzBXWnhYMTZzYkJ0SVplSllNT1BRRVhOdytkc2swRzV0?=
 =?utf-8?B?UnRSeVEya2ZkNHpoNEpxWXdNQ0xWbld6YXVyVGNsS2lTM3VCMHZ4SDd3MHVp?=
 =?utf-8?B?bTN5SkZWSHFBbGFZalV3YjNvcWpKc1lvV1I3cmd2ek9ENmZWamY1ZlloblZn?=
 =?utf-8?B?Z3JUTjVZVDN6cWFuVVhUT2M3Q1djWGdCWlZvZTFlVlI4anh1aklHN2FvNFhP?=
 =?utf-8?B?OGMyVWNnMWZVd2I1YnFwakpXS1VTUHMrUnh4Rm40SDVKRXlnUjliSkF6d1Fp?=
 =?utf-8?B?SFhLM0srZEIxM0dYSWd3MUxVd1FBd1QyclBtUkh3Vi9oT2p6ajdudEQza3gy?=
 =?utf-8?B?bkx5d0xiTXV6YWI4Y0F3aTROZ2ZkY1dYQS9IdnIvVm02UGkyL0Vrc2hzMTc4?=
 =?utf-8?B?bEdURXUya0xlMFJPb3FSWDR5YVhURTlVcGZOWW1Td2hrWEQyeUFhTWRxd3lw?=
 =?utf-8?B?MGw5d25ONjE5OTdEZTdvUzgvUGFwaEpja0oyMG02RUR4VytONDlZbDkxeWlP?=
 =?utf-8?B?bFNMV1BNUmVsUnhBMDRGcStMRXg3TitLTkczRlZYbHUycFczTVRSY1Q3STNM?=
 =?utf-8?B?clBjZmE5Y3JsTEM0cVc1UE1aa3RUOWJtWjlaYXA1amlqcDZBbFlzYUpRaG9v?=
 =?utf-8?B?bkJTNGNyMmhXNFFTZ20weTRqb2crZ0orQS9yeTZtYzJmMG90SUpKVm9oTWZZ?=
 =?utf-8?B?QnltNUNDajBFdFJqbTd1ekFMak14RDZDbW5EKzNUc1FJcktNQWxHVUJ0NXBX?=
 =?utf-8?B?eSszTkdhQ1BVZzZydm1tb1NCWXNtU0xsV3hJMWlUR1hDMWl5cFRiUkxkNUZE?=
 =?utf-8?B?WjZyRjBRbjJibGQxdkFyTTNSZWhvMDhpeENSWDdvQ0dOempzNGJvalBIdjEw?=
 =?utf-8?B?UHJ1ODZUTkRHQ0xORFY2cHVSRVd0V1F3ZkM5V21GdmxMRkNaSnZScGRuaVRq?=
 =?utf-8?B?Z0VhSEVyZjlRYlpnalkrczNoRlh2ZmI4SWs1STJlSTNNQ3ZXWktXNFUzczds?=
 =?utf-8?B?SVZEc0UwbldNNFl3UUxVa2tiYmdzcEpXWTRGeXFQMSs2RG1tQnN5dU9VOGtt?=
 =?utf-8?B?N2I0bjVkVEd1cEFKZzl1NTlVMXhVNGs0WE9tQlAzOUVYSWYraVdiRjBqR1VN?=
 =?utf-8?B?ODdKNmxDMGZ0ZnhFc1lrSWsxbXJ0YWh0Nm50dWpFbmJZR3RMdVlxY0NwQThF?=
 =?utf-8?B?bXNOdmRsbU9ML1c2QUVXVVlMd0NkSDZuSWJVWVBqV1ZJUUh5MXpOYllJc253?=
 =?utf-8?B?QituN3lvT2t1QkNZWUllVzZyYlZZL25lK0RrNWNmZndwdHBmU1RqbGQ3b25T?=
 =?utf-8?B?ZGhoZGE5QzcwRUFxU1JET01iei9aYVpUV0NsL25QUXNZSVdtT3ZuWWxBOVdm?=
 =?utf-8?B?ZHBxV1Mvdmx4SnA2RTN6bWpZOVRQN1BJRFpkSGcrZ0FZTjFGcFJxVWd2N0Jm?=
 =?utf-8?B?VUJZSm1aM0tuSk4xOWJ2eHNiMjF1dDNmWEpESWpobnRQUndtVEMyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15501b58-c964-4678-fc20-08da33b09d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 00:44:46.9544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 qCwCmE/RnYWZRRCcUfV1rO7zKyABKCJeLxlyUKyqDCOyrT1tgiT3ArwjIS4AuC3s9Jq9dggoH0yXdBFLELaYhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 00:45:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165531

SGksIEFsZXgNCg0KPiA+IFNvLCBJJ2xsIHNlbmQgYSB2MyBwYXRjaCBpbiB0aGlzIHdheSwgaXMg
aXQgb2s/DQo+IA0KPiBZZXMgcGxlYXNlLg0KDQpPSywgSSdsbCBzdWJtaXQgYSBWMyBwYXRjaCBs
YXRlci4NCg0KVGhlIHJlYWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQgZ251dGxzIHVwc3RyZWFtIGRp
ZG4ndCBjb25zaWRlciBob3cgZmlwcw0KPiBidWlsZCBpcyBzdXBwb3NlZCB0byB3b3JrIGluIGNy
b3NzLWNvbXBpbGF0aW9uLCBzbyB5b3Ugc2hvdWxkIGFsc28gZmlsZSBhIHRpY2tldA0KPiB3aXRo
IHRoZW0gYW5kIGhvcGVmdWxseSBkaXNjdXNzIGhvdyB0aGUgcHJvYmxlbSBjYW4gYmUgcHJvcGVy
bHkgc29sdmVkLg0KPiANCj4gVGhlcmUgYXJlIHR3byBvcHRpb25zOg0KPiAtIGRvIHdoYXQgeW91
ciBwYXRjaCBkb2VzIGFuZCB1c2UgdGhlIG5lZWRlZCBiaW5hcnkgZnJvbSB0aGUgaG9zdCBzeXN0
ZW0sDQo+IHN1YmplY3QgdG8gLi9jb25maWd1cmUgZmxhZy4NCj4gLSBidWlsZCB0aGUgbmVlZGVk
IGJpbmFyeSB0d2ljZSwgZmlyc3QgZm9yIHRoZSBob3N0ICh1c2luZyBCVUlMRF9DQyksIHRoZW4g
Zm9yIHRoZQ0KPiBjcm9zcy10YXJnZXQuDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50IGFuZCBJ
J2xsIHN1Ym1pdCBhIHF1ZXN0aW9uIHRvIGdudXRscyB1cHN0cmVhbS4NCg0KQmVzdCByZWdhcmRz
DQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkg
MTEsIDIwMjIgNzowOSBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNv
bT4NCj4gQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSBnbnV0bHM6IEFkZGVkIGZp
cHMgc3VwcG9ydCBvcHRpb24uDQo+IA0KPiBPbiBXZWQsIDExIE1heSAyMDIyIGF0IDEwOjE1LCBs
ZWltYW9odWlAZnVqaXRzdS5jb20gPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gd3JvdGU6DQo+
ID4gSSBnb3QgaXQuIEl0IHNlZW1zIGFuIHVudXN1YWwgbWV0aG9kIGJlY2F1c2UgdGhlcmUgaXMg
bm8gcmVjaXBlIHVzaW5nIHRoaXMgd2F5DQo+IGluIC4NCj4gPiBJbiB0aGlzIHdheSwgaXQgbWVh
bnMgdGhhdCBpZiB1c2VyIHdhbnQgdG8gZW5hYmxlIGZpcHMsIHRoZSBmb2xsb3dpbmcNCj4gUEFD
S0FHRUNPTkZJRyBzaG91bGQgYmUgYWRkZWQgaW4gcmVjaXBlLg0KPiA+DQo+ID4gUEFDS0FHRUNP
TkZJRzphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gZmlwcw0KPiA+IFBBQ0tBR0VDT05GSUc6YXBwZW5k
OmNsYXNzLW5hdGl2ZXNkayA9IGZpcHMNCj4gPiBQQUNLQUdFQ09ORklHOmFwcGVuZDpjbGFzcy10
YXJnZXQgPSBmaXBzLW5hdGl2ZQ0KPiANCj4gWWVzLCB0aGlzIHNob3VsZCBiZSBmaW5lLiBZb3Ug
Y2FuIGFkZCBhIGNvbW1lbnQgaW4gdGhlIHJlY2lwZSBleHBsYWluaW5nIGhvdyB0bw0KPiBkbyBp
dC4NCj4gDQo+ID4gU28sIEknbGwgc2VuZCBhIHYzIHBhdGNoIGluIHRoaXMgd2F5LCBpcyBpdCBv
az8NCj4gDQo+IFllcyBwbGVhc2UuIFRoZSByZWFsIHByb2JsZW0gaGVyZSBpcyB0aGF0IGdudXRs
cyB1cHN0cmVhbSBkaWRuJ3QgY29uc2lkZXIgaG93IGZpcHMNCj4gYnVpbGQgaXMgc3VwcG9zZWQg
dG8gd29yayBpbiBjcm9zcy1jb21waWxhdGlvbiwgc28geW91IHNob3VsZCBhbHNvIGZpbGUgYSB0
aWNrZXQNCj4gd2l0aCB0aGVtIGFuZCBob3BlZnVsbHkgZGlzY3VzcyBob3cgdGhlIHByb2JsZW0g
Y2FuIGJlIHByb3Blcmx5IHNvbHZlZC4NCj4gDQo+IFRoZXJlIGFyZSB0d28gb3B0aW9uczoNCj4g
LSBkbyB3aGF0IHlvdXIgcGF0Y2ggZG9lcyBhbmQgdXNlIHRoZSBuZWVkZWQgYmluYXJ5IGZyb20g
dGhlIGhvc3Qgc3lzdGVtLA0KPiBzdWJqZWN0IHRvIC4vY29uZmlndXJlIGZsYWcuDQo+IC0gYnVp
bGQgdGhlIG5lZWRlZCBiaW5hcnkgdHdpY2UsIGZpcnN0IGZvciB0aGUgaG9zdCAodXNpbmcgQlVJ
TERfQ0MpLCB0aGVuIGZvciB0aGUNCj4gY3Jvc3MtdGFyZ2V0Lg0KPiANCj4gQWxleA0KPiANCj4g
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5l
c2RheSwgTWF5IDExLCAyMDIyIDE6NDAgUE0NCj4gPiA+IFRvOiBMZWksIE1hb2h1aSA8bGVpbWFv
aHVpQGZ1aml0c3UuY29tPg0KPiA+ID4gQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCB2Ml0gZ251dGxzOiBBZGRlZCBmaXBzIHN1cHBvcnQgb3B0aW9uLg0KPiA+ID4NCj4gPiA+IE9u
IFR1ZSwgMTAgTWF5IDIwMjIgYXQgMDI6NTQsIGxlaW1hb2h1aUBmdWppdHN1LmNvbQ0KPiA+ID4g
PGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBJJ20gYWZyYWlk
IEknbSBub3QgcXVpdGUgd2l0aCB5b3UuIFNlYXJjaGVkIHBva3kgYnkgdGhlIGZvbGxvd2luZw0K
PiA+ID4gPiBjb21tYW5kIGFuZA0KPiA+ID4gdGhlcmUgaXMgbm8gZXhhbXBsZSBhYm91dCBob3cg
dG8gY29uZmlnIFBBQ0tBR0VDT05GSUdbeHh4XSBmb3INCj4gPiA+IHRhcmdldCBvciBuYXRpdmUg
c2VwYXJhdGVseS4NCj4gPiA+ID4gVGhlIHJlc3VsdCBpcyBhbGwgYWJvdXQgaG93IHRvIGNvbmZp
ZyBQQUNLQUdFQ09ORklHIGZvciB0YXJnZXQgb3IgbmF0aXZlLg0KPiA+ID4gPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ICQgZ3JlcCAtaXIgUEFDS0FH
RUNPTkZJRyAqfGdyZXAgY2xhc3MtbmF0aXZlDQo+ID4gPiA+IG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC9saWJjYXBfMi42NC5iYjpQQUNLQUdFQ09ORklHOmNsYXNzLW5hdA0KPiA+ID4gPiBp
dmUgPz89DQo+ID4gPiAiIg0KPiA+ID4gPiBtZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltXzgu
Mi5iYjpQQUNLQUdFQ09ORklHOmNsYXNzLW5hdGl2ZSA9ICIiDQo+ID4gPiA+IG1ldGEvcmVjaXBl
cy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLmluYzpQQUNLQUdFQ09ORklHOmNsYXNzLW5hdGl2ZQ0K
PiA+ID4gPiA/PSAiZnRzNA0KPiA+ID4gZnRzNSBydHJlZSBkeW5fZXh0Ig0KPiA+ID4gPiAuLi4u
Li4NCj4gPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ID4gPg0KPiA+ID4gPiBCdXQgSSB0aGluayB5b3UgbWVhbiBub3QgUEFDS0FHRUNPTkZJRyBidXQg
UEFDS0FHRUNPTkZJR1tmaXBzXS4NCj4gPiA+ID4gRm9yDQo+ID4gPiBleGFtcGxlLCBpbiBsaWJj
YXBfMi42NC5iYiBmaWxlOg0KPiA+ID4gPiAkIGNhdCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAvbGliY2FwXzIuNjQuYmINCj4gPiA+ID4gLi4uLi4uDQo+ID4gPiA+IFBBQ0tBR0VDT05GSUcg
Pz89ICJsaWJpZG4gICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywNCj4gPiA+
ID4gJ3NlY2NvbXAnLCBkKX0gIiAgLy9ub3QgaGVyZSAuLi4uLi4NCj4gPiA+ID4gUEFDS0FHRUNP
TkZJR1tmaXBzXSA9ICItLWVuYWJsZS1maXBzMTQwLW1vZGUNCj4gPiA+IC0td2l0aC1saWJkbC1w
cmVmaXg9JHtTVEFHSU5HX0JBU0VMSUJESVJ9LC0tZGlzYWJsZS1maXBzMTQwLW1vZGUiDQo+IC8v
WW91cg0KPiA+ID4gY29tbWVudCBtZWFucyBtb2RpZnkgaGVyZQ0KPiA+ID4gPiAuLi4uLi4uDQo+
ID4gPiA+DQo+ID4gPiA+IERpZCBJIG1pc3VuZGVyc3RhbmQ/DQo+ID4gPg0KPiA+ID4gU29ycnks
IGl0J3MgYWx3YXlzIGEgYml0IGNvbmZ1c2luZyB3aXRoIFBBQ0tBR0VDT05GSUcsIGFzIHRoZQ0K
PiA+ID4ga2V5d29yZCBpcyB1c2VkIGZvciB0d28gZGlmZmVyZW50IHB1cnBvc2VzLg0KPiA+ID4N
Cj4gPiA+IFdoYXQgSSBtZWFudCBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPiA+ID4NCj4gPiA+
IFBBQ0tBR0VDT05GSUcgPz89ICJmaXBzIg0KPiA+ID4gUEFDS0FHRUNPTkZJRzpjbGFzcy1uYXRp
dmUgPz89ICJmaXBzLW5hdGl2ZSINCj4gPiA+DQo+ID4gPiBBbGV4DQo=

