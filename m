Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAFEC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:58 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web12.5530.1639013457048313462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=qbw14v+P;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1639013457; x=1670549457;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eGc31CQW7zflT+kRmn9aj59ftpNlyjCwyv6hrMB3k8o=;
  b=qbw14v+PbdIshlq2ibBgCcc6+QhmiXNbt0b5RzKRsueqimjV3kzWRNQa
   7Zhnfuj+ZER6MqUoBD79ay2uevVfVFCMnfB3p7aD1JcuOTg/eXRUFSxC0
   nl13Djqi53WFUR9dN9OgjarW7G9XvhvsVQSHEs3rC4fgz3dBWo6BNhuEM
   6I+3SzD/alxPlNs7kYr5TI4AeoRpv/uq1FUFOaP1V3KUwzIFnGh4OUh4Z
   ftDPChmwXQGCuPwm32TGvM8F/TyZbnJEFMhSPMvY+XCqqRi+TdgmSyH1o
   KimwVMjLjKRWhamVI6EHieqQ/CLfK5nzs9g2Y2yNjpw3W6UthlcxGls8X
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="45359650"
X-IronPort-AV: E=Sophos;i="5.88,190,1635174000";
   d="scan'208";a="45359650"
Received: from mail-os0jpn01lp2108.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.108])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 10:30:53 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQGzpVBKR/o6xL7/wa+AZ4DzwI5SHNC3YROkvzfhTFuFA1gKjQqG5Nv5+sIyOwIElHgnp2n4LI3Jrr+jC6nHHEDXJSm4MH7G8Rf4V7GaJP+nE8mhrCrzwQsg+80QDuE5+KnzprtutGGfvJUlCXysESqZ3yfYpYtW/gt74c2gZx0B8sdtyygd0OX5R41GOpI9Eax72vGwLcfpP32EiqVek94aO4RkPexDoYNAZAxExzVQAGTvkY6PJMu1B+xeAvFebn+SniRhh/YCyEFKwk+bCF1wBYvLp4DN56raSGKfGNnjcT+zFJPRuALxcvQNI1hmLbXTh7EU6Vv97LgwRW++Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGc31CQW7zflT+kRmn9aj59ftpNlyjCwyv6hrMB3k8o=;
 b=QjbAm1EEO7tganY6tPcXBsxfxwjRXcdxLnykklAy+sU/mm2noyHGK2uH7/PH+1n+mdrEqaM8ayMuTpzAyYhYqa0YYIx+51iuX8EOTzyVXz0Ndyh+yzWCTZoh2hqx3PG3vjXbkx9WS7ejOYUOPNrS8I7Q+zeerh6wN7jH0Kb2wBka9RFdwF5oAfE021s0fH6RcAeEUFHpNYNhMXpZ04oSlUH063jT773D8xV5vtqgs0Usy1dT3KmKTlfDc9/70wiv+cjuXLU1Poe4TK9F2RJvUHiiYr3CGSWED1Lsj1+29lqdCLuKmMUkRZQ9spqeAzoi/zunF6ShGZ0cAk8MieH7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGc31CQW7zflT+kRmn9aj59ftpNlyjCwyv6hrMB3k8o=;
 b=c9pQidY4Xb+FueK0t7xgeYw/S1HfJWo54hVCavnXOZaW3KmaEWR+CSboQhH7RjogDP+4aTZJteXePFK9Knl8wNE0pnKpwy9xqMTMeRQFaNvXoDKVrVwC4k6Yf1CBsAvBP/l7NUzUYsqxk5h7wiswLWgS2sxKu/W1DMt7vY8pqpA=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSYPR01MB5367.jpnprd01.prod.outlook.com (2603:1096:604:8b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 01:30:50 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::30c2:e4b4:cf0c:973c]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::30c2:e4b4:cf0c:973c%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 01:30:50 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
Thread-Topic: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
Thread-Index: AQHX6rT5UQ+SjfiM6kCJK5KfMxTRmqwnCX2AgAJZ3yA=
Date: Thu, 9 Dec 2021 01:30:50 +0000
Message-ID: 
 <OSBPR01MB18453CFB47B0AD1D05F85635DC709@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
In-Reply-To: 
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f01f75f-d9f9-4763-1617-08d9bab38899
x-ms-traffictypediagnostic: OSYPR01MB5367:EE_
x-microsoft-antispam-prvs: 
 <OSYPR01MB53675385AF654D71B589C16DDC709@OSYPR01MB5367.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 peoRFqFNMXSQ1tgBVrhA+1KZ3DR+Sv1W3IrwOECY0HDscOVMSdeYQbqJblyCqPyljGbYUiSF41tMfYLX3FWSzQgpNrunmaZI8FvK0VZZxOUoLRfwIbOobN3KafAkYB1Zz2YEIZ86Lza5F76RqdZPbQIBJWACHzGKfFh5U3NFrX8sTwkIzQ6LEuxy7jZO7TBXeASVc/88y1+/g8J9xTXWgpTDBonx8tUu9idRBzCdxPnI0UyNlwcC1dXvluDu87YE6+OoZ2lxqBgqjX0Fhh/I3FjQA1bx5ZhB0IMHXjcRo3fs+1Jcjguchmu54jtJFTwCMP3nrathXfCM39r9AKxlFNWleMZtmDXodDgqSnaC0KPQowxBSqk9qnNzcndZ1BA1LcFIboJzPonRj3CDNHGLFfCcY4pRz8kloePO/u/9vyNttduqKsXaqp/A1r6cmPcF5wxmWu5QJ4NC+64AGXA8ci8yw2+RsgS3TTA+G/SnbqNT4eZe6buuFdzYc0+LPTh8L3ObrkMudK1a6cwbFcQ2ALIx6KPGYHB1F+a5m+3xQfRPbUc8n4SBDp8HTdxtASFlUNZ8HEAjQQcVnv4mxBYlPBxGKCSylt0ArTW3XZeW6vz9aSObqjOKuIGBBwztFbVSyRmPPhkG3TSq59l4/3+/OX2mfkoXnQAInvVjEAnaoXAU6w98nAzUx4wdR4AnBnorC8lRy4fZ1llGdQ+i9h8H/VLfe98w4QngmegS8IRW64TRCoZeCRvYZgycnsVjTHrLQr+yZRBU0fAc+hkVgZPWqzxnN/egqApg19vZE6Obhhk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8936002)(9686003)(316002)(6506007)(966005)(5660300002)(82960400001)(55016003)(83380400001)(53546011)(8676002)(26005)(110136005)(66946007)(38100700002)(38070700005)(2906002)(186003)(52536014)(122000001)(76116006)(66446008)(7696005)(71200400001)(33656002)(64756008)(86362001)(66556008)(85182001)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWNMc0h2bGRSaUwrd2VLZlNGR0JJbGNCZ00xSUdYOHJ0bDd5M1EwVGFZREQ0?=
 =?utf-8?B?WXdkSzhLOHVOMmxIdEd6VGJ5aEpmV2l4eTl1OTY4bVJKN2ZSQjBKSzJmNG1u?=
 =?utf-8?B?Y2J1ekdBVC8xQ2QvZHBRZlcxRzNsSmsxMnBNTitRKzQ3U05kUFYwWnpXektt?=
 =?utf-8?B?M0p2R0tuMkNzdUEwMVA0NTVPZkVZZm5NVG5tS1Z0d2ppOEkzUCtqaUI3b29O?=
 =?utf-8?B?RDU5b2JlQ3lnb2NQcnh1T1FIZHl1SFNFR1hwSm15bUwvN3lBbGgzWW0reUFl?=
 =?utf-8?B?cjFyZmJSeXpEOEgxekMrUmppRVVRWEVmTHJSdFduMkVKUmNFTGRjSTZLR1NZ?=
 =?utf-8?B?NURhZ09ySlJrWms1OHRFQW81OFdyOG01QytwTTJiREJrbG92WGZzdE1NVHI1?=
 =?utf-8?B?MWRveDhpMUpqd0tIVzRYSEp2TDFjMmI1TklFQnlwM1pqV3RwYmNaNU1ZdUZI?=
 =?utf-8?B?WDBQbXFSSFlkRXFrVldTMk53cXhjcDNkTjljUHhUK3ZUVThJYzRvcmxMemJK?=
 =?utf-8?B?Ri9wbkZGSkZGaDdhR1JBYXBVQkNUeDd6T2Z5b0pWdUxxaGVLRHFwM0MweXlt?=
 =?utf-8?B?YVg2dTZnL0tUU2FhbHFlajlQVUhFcWZzRjdBUFFaWWRpRk9sOVN4dGV3eFc4?=
 =?utf-8?B?SzZzSDgxSEs3L1h3cUV6UUVSb2xIKzFqS3p6U0Q0VHZNTElyNys2M1pyUXc2?=
 =?utf-8?B?SGZxZTdicVl4aDk4cU1HSHk5UkNIdjQzcExiZllyZmc3Yi9lL3dLSmtUK1Ja?=
 =?utf-8?B?S0U3OUdQZWZtNlU1aEtlSWJ2RG5QTmNPWFpIS2ltRERRVjBmNVJ5a3JnMWM4?=
 =?utf-8?B?Qkg1Q0YxVElIWnZDOHQyQUd0bTFkekd3Uitrbk55SzNlMzRXdkFyeTdxQjFw?=
 =?utf-8?B?TW9TOGpMTThoM0ttVklsRHRMWkpiQ0NsKzhxME9TQnhUS3hNcTZMVG1TUEo1?=
 =?utf-8?B?cmUrMHRKZitMY1BJVnJuMVN6N1NwZTRQUW9FREtZWDVOV1YyMkVwZUlrWWZj?=
 =?utf-8?B?REJ4Z0hSRUV4WVhtdk14WE9ROVJKcHNSb1hXbVdYa0p1MzR1eDZqRkZiWVhO?=
 =?utf-8?B?WXV2TkllZzlWZWV3Y3F2SS9UVUMzaHUveE9rWDFyZDZ0K1lBNmpwRS9rMEZh?=
 =?utf-8?B?ellnNDdjeU5GSzNzTktVRlFhYTRKTTBKSi9QeEZqMWhTUGg4NXg5eVJXTHp2?=
 =?utf-8?B?M3NEZzZ6VDhWY0Ntd3ZLU2s2UzRZbk10N2Vvb2xjMmN3VGtoQ09xOHNzSXNI?=
 =?utf-8?B?RXZVSXIvby9ZVm04UTh1dkYwbmhDSCtuelJxY2F0SXVRd2FXUG9jeVRZYVRN?=
 =?utf-8?B?a3ZhZHpHOVNpMmJ5aVhIeXMyL280R0tWbzkvbGxVa0g0dXVWRXdiMkFBOHFN?=
 =?utf-8?B?Rk9BZm4rVXhRUllrMCsvZG4veEpnc0J0bHBOM2xGRzVlZVVFZlpzT0xzRXRj?=
 =?utf-8?B?Um83MnppMFA1NjRiUk9XWG5tRDdiMnpEN1kxYWQ3a0JUNHVpWmMveEczVHZj?=
 =?utf-8?B?T3N5MnhIM3BOdTdRdHhlQ1NrcGltVGZQSWZXd2orMXRCQ1VOTHR5SDhhK1V3?=
 =?utf-8?B?a0t1Y1pKY240Y0RlZ0NScUhwT0FBejlaT1ppeWQvWUdNNUdWSldDZ0dJdTZh?=
 =?utf-8?B?Nlh6cDRSWXpCYWw3ZFRrTWhMaStTUHZDWVUxR1I3RTRZbU02UURqQUhsYm5Z?=
 =?utf-8?B?ZDJvWk5vbFVYWTdkNkdIck16UW11YWJhT2xMeUhEQmROUXpidzcrNmQzMktW?=
 =?utf-8?B?UFB6SWhlTTRvMW9vaWdBMnU0UFkzRUdKMEVWMm1mUVBFMkplQ1QwQ0pjMGov?=
 =?utf-8?B?NnliQzU0MUVqTVRIakNRUmJlZFBiZkM0MXRJRWlWSW5FVTlhS2s4UmFkcHN2?=
 =?utf-8?B?UHJYTjNCUTVucHcray9wZVlQblJ6V0lHU0JUdmx3bG5aUWJRREpabWczYnBo?=
 =?utf-8?B?Nk1pdEZLejQ2R2Z5N3VwVW1kTGVWUVQvNnZnV3FYbWRtdTZNR3BjRWt1OElj?=
 =?utf-8?B?Znl4bGYrNzVESWdaalR6OXFUNHVkSEZQai9LV1d3cGV5VmIzaDhCbFd4Zktm?=
 =?utf-8?B?b1FqUXZtNWN4UENXbkhDcVRDbFNaMitlQjgyM0ZNMFlTZWgrQ1dyM3lieTBP?=
 =?utf-8?B?WUl3azhoRGlpK1lzTmNJQXFETFRjVU1tS3lSUkhZREswRE45MFFYZmdiVjYx?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f01f75f-d9f9-4763-1617-08d9bab38899
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 01:30:50.2501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 WbIcy370arJh8CwlvF2JSucPntPzKKyBtU2w2JitrzCdINMn91Cb4dcxwHrGwU2kX/uEW3Pfm+8PFpQ1USqwdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159434

QWZ0ZXIgc3BlY2lmeWluZyBERUZBVUxUVFVORSA9ICd4ODYtNjQteDMyJywgdGhlIHBhbmdvIG5l
ZWRzIHRvIHVzZSBwYXRjaCB0byBtb2RpZnkgdGhlIGNvZGUuIA0KSSBhZGRlZCB0aGlzIGxpbmUg
dG8gdGhlIGJiIGZpbGU6IA0KU1JDX1VSSTp0dW5lLXg4Ni02NC14MzIgPSAiZmlsZTovLzAwMDEt
bW9kaWZ5LnBhdGNoIg0KQnV0IGl0IGRpZCBub3Qgd29yay4gDQpIb3cgc2hvdWxkIEkgd3JpdGUg
aXQgdG8gYXBwbHkgcGF0Y2ggd2hlbiBzcGVjaWZ5aW5nIHg4Ni02NC14MzI/DQoNCsKgIC0tDQpC
ZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERlcHQuSQ0KTmFuamluZyBGdWppdHN1
IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKSBOby4gNiBXZW56aHUgUm9hZCwg
TmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUtODY2MzA1NjYtODU2OA0KQ09JTlM6
IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29t
DQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDcsIDIwMjEgOTozNyBQTQ0K
PiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdIHBhbmdvOiB1cGdyYWRlIDEuNDguMTAgLT4gMS41MC4wDQo+IA0KPiBP
biBNb24sIDIwMjEtMTItMDYgYXQgMjM6MjEgKzA4MDAsIHdhbmdteSB3cm90ZToNCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+
ICAuLi4vcGFuZ28ve3BhbmdvXzEuNDguMTAuYmIgPT4gcGFuZ29fMS41MC4wLmJifSAgICAgICAg
ICAgICAgICAgfA0KPiAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKSAgcmVuYW1lDQo+ID4gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3tw
YW5nb18xLjQ4LjEwLmJiID0+IHBhbmdvXzEuNTAuMC5iYn0NCj4gPiAoOTQlKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjQ4LjEwLmJi
DQo+ID4gYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4wLmJiDQo+ID4g
c2ltaWxhcml0eSBpbmRleCA5NCUNCj4gPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGFuZ28vcGFuZ29fMS40OC4xMC5iYg0KPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGFuZ28vcGFuZ29fMS41MC4wLmJiDQo+ID4gaW5kZXggNDBkZjcwNDJlNi4uZGIxNzE1
OGQyMCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29f
MS40OC4xMC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18x
LjUwLjAuYmINCj4gPiBAQCAtMjAsNyArMjAsNyBAQCBHSVJfTUVTT05fRElTQUJMRV9GTEFHID0g
ImRpc2FibGVkIg0KPiA+DQo+ID4gIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiDQo+ID4N
Cj4gPiAtU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPQ0KPiAiMjFlMWY1Nzk4YmNkZmRhNzVl
YWJjNDI4MDUxNGIwODk2YWI1NmY2NTZkNGU3ZTY2MDMwYjlhMjUzNWVjZGMNCj4gOTgiDQo+ID4g
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0NCj4gImRiYThiNjJkZGY4NmUxMGY3M2Y5M2Mz
ZDIyNTZiNzMyMzhiMmJjYWY4NzAzN2NhMjI5YjQwYmRjMDQwZWIzZg0KPiAzIg0KPiA+DQo+ID4g
IERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGZvbnRjb25maWcgZnJlZXR5cGUg
dmlydHVhbC9saWJpY29udg0KPiBjYWlybyBoYXJmYnV6eiBmcmliaWRpIg0KPiA+DQo+IA0KPiBT
ZWVtcyB0byBicmVhayB4MzIgdW5mb3J0dW5hdGVseToNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNTcvYnVpbGRzLzQ0MDMNCj4g
DQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0K

