Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C63C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 04:51:54 +0000 (UTC)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com
 [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web09.6601.1651207909604966389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 21:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1
 header.b=QlNRjE/j;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.121,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1651207909; x=1682743909;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kR27PC+rKGGEDPm/GnMbyUHkHbAPCGfmSTQogWuj0qE=;
  b=QlNRjE/js3aapnCiK8opnxEfjISoFPoY3PiordDjVaQW7mqikJbMFygO
   f6d+6bSd4WZQAmABypdyXK8gjcULzsm7CvIAeDjgFP89aC2e76TT0rUfn
   c4N6I/x08zHpATd7ldGJOUZLCXxXwh8aUQyZ000QYXi6gn5oQpI7r9uyt
   vyc3q/N64zOmsiQ4kw2x8hUsyHHkm6juh5IqYgqY/b5IUqo2LWGSBO/Wv
   NUrOpQgeEBJaI14F0r2O76w0KIiLJaNWniUAOv37PNTRJ2H36VO7Y5rgj
   fo+y+yVgwtBPfGvmMlSOMgWDloyx5f8XL0kHLL/7qwHbVDKmZPiHlwtVQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="55243880"
X-IronPort-AV: E=Sophos;i="5.91,297,1647270000";
   d="scan'208";a="55243880"
Received: from mail-tycjpn01lp2174.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.174])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 13:51:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQjf3wzxtbwBdWgSSCP6fW1XVZN81RxXh6AruGbQIgCv3RQ9XyK+RKXrYOr2hlI06ftDYizS7/0wokdBbw+DBlduM5oDn22ELG8f7vF8/exI/nCDINE4ieKoXo4oAYVKAh6AYJSeakq1dBU58khqc/G2Z1UZX01XU2jrWdNvL0fhAR9rHakmeU0NATwWhIS2SuOtYCkTTm711j4Kcx24cztNHYbZ7EQU3aDEeWVk3s1kkKZQu+Lg+Dw/42IVtDJ+Nn3uiZiPShxocQnHiVaNQz6D6qmt+XBu8kvNB7knqAZfDdku0mbyEHtWU6IiucNkALBCcD9ukNT0MPBH8Q0gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR27PC+rKGGEDPm/GnMbyUHkHbAPCGfmSTQogWuj0qE=;
 b=Hfh3qVbCCTqsX1nH8BQ71cUDNIqydO+pbh8xyvROD/w40NhO9U410TJ2YgMge148Txo1NPa+clsznhaH2Hg+7h9oKi7hqk9z9UeEZaS34XEUr9HfKAmeRrCYdDnW42fn/UpUUHt6rYtQnHIW59XOFrX7HRLxmm/gHm2NT3GbsrY3GTedZFG/NECebPHs2/oBuzQfJAQNqzP3K1bORVxq7JxNYfGzKQHZdwSAnnyHvIxeu4JUC5o2cqmXTECt/dGeU4GIjTA1Al1JL4q9oQJD4VUzx3/skRY9zpcwdbGGoLVhHm8XpkRNYl64AVqm88OwtUPvs0tV5uXNd59JF5oobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR27PC+rKGGEDPm/GnMbyUHkHbAPCGfmSTQogWuj0qE=;
 b=b9+PRUWBEDBUmXr5OiWv/iE2UYRybctOA20PUcgbkf2F1/+zSAYgtlZflEm9EalhDjDZ6cCmKetV9Mlh9/pkeFL7Do7WEjH4dxR5THSfY71pOQ+79YkJuD4a7kAGezyKk76hfAqyRVQsvQkzDfxx2Pwd7nM6MBz6HKF6+WaNkX0=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS3PR01MB6119.jpnprd01.prod.outlook.com (2603:1096:604:d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 04:51:43 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%5]) with mapi id 15.20.5206.012; Fri, 29 Apr 2022
 04:51:43 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH] gnutls: Added fips support option.
Thread-Index: AQHYWtJc0OuL69Qvb02kFBRcyS3fZq0E+ZYAgAEW1IA=
Date: Fri, 29 Apr 2022 04:51:43 +0000
Message-ID: 
 <OS0PR01MB6178D7CB066B54B254C078E0A0FC9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj_5zAZvg_rbPw4C-YNA6ptohpxvDOXbCdNvj3Bom08b3g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_5zAZvg_rbPw4C-YNA6ptohpxvDOXbCdNvj3Bom08b3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40e24fab-d060-405d-c249-08da299bf504
x-ms-traffictypediagnostic: OS3PR01MB6119:EE_
x-microsoft-antispam-prvs: 
 <OS3PR01MB61194A2BBA0B9B41AA638178A0FC9@OS3PR01MB6119.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 32S3+Z5/0JveVExnowGRsjrgRhzllezSHDYgCUjcnv2y+d6vSMF7XmAP3ESzVTdT5Do5nxomB70hjGEw8yrNaRxkj24VUANcKtQfYeMJ6P2FQfx+iE+I67ii9mDuxSVbLHaM2y9qV65RrUhqdrd6F9aCunzQ9vXU48XVVNkO7FoS0G01hJt65QDRqYJoz2nzApyuISsuqhaPnaYRiOxbhYvzyxSkEp50IEcVbEHFgmdlSa2vlQekvV0OVjjsrxvqt39bvJERbyeUGG13IVZMkP/QL7DWi8CZUimR5D0N2qBNR0L/6MhE/Zzdl+Zfp9CDQzmFlEI380xFTFCJkMF9uFov0Q9hVd/2n99SNvsCFaSBSofO5oD3DM0Iq7OOGkSO5Q6vOGmKge2HfGcqAK47JRPm2uhYLECYhCLlx4HgGIetL/5LCgPEr+hC1W07nsR6Gyj7P8F5SYh2iqUbQ46Ma/2vP7t+zIhzjiEhiJRCgHYctbyBKqaLjEz4wISBLnuvUL2CZQMK4T+XSyT9EoQCvXFqTqBzxF3dLBm+p2L2LQaUIzTIl9SneqTrBMPL0lXJQnAWNGmrUpRm1vrXKb6fP/5ovtOg6PKtxZtfsQJEA1p8Qodroyzw0I9NYZVA3uwXncDUo9kqoRJAgW6zzF7nUWIrRDyWFAear2V+4XWjFeq4eev3RfokG0yk++DipJWPRJaY0suSwVqe/m1H3mfL3xEz3C2mGsCCX+KoJWxTCSV4USez2oFqyfUifvmDoq+QqEavfuGlNqhjxZFTzmQoCI7BBsbYlTiPlTadmgyOo0Ni9RSbchWd+yVyrOiSflS6ZIpOWLRhHQbrl6+NiI9+IA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(64756008)(122000001)(8676002)(66446008)(66556008)(966005)(5660300002)(66476007)(86362001)(85182001)(83380400001)(26005)(9686003)(186003)(6506007)(7696005)(33656002)(53546011)(316002)(71200400001)(55016003)(508600001)(66946007)(76116006)(38070700005)(8936002)(82960400001)(4326008)(38100700002)(52536014)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MFlydWJ4QWdIaDYyZDFPQlB2Vjd3aHlNakE5RGNNRTF6WTdramkrc1pRYWpy?=
 =?utf-8?B?akxhT25rc0xPUWFQOVQvZ2ZNYlA1NUhtQmVDZ3pTRTZ3NGY2RE12UEtsVERV?=
 =?utf-8?B?MFBOM0FoV0djTlhSdFNPakQ3MTFWY01DSGQ5Nk83aG9IRkNRZWF1RGpqSWdB?=
 =?utf-8?B?d2NqME9KSVo4VWkwbURWMThVZi9XaS9SZUhkcWM4M0hrNkE0cWVIT1BMOHYx?=
 =?utf-8?B?d3VUY09JK1dPUVJMUEI4bS95T3h0Q1RsdzNhdVBudzF4bjFldnRwWlVpRjlm?=
 =?utf-8?B?NisrU0g2aFFsVlVyRlYyNEdmc1IxUUg1RXVnYnQrWWVpbG9pYWJoUzVmazJT?=
 =?utf-8?B?VEVMZ2YxVFdKV1hXd0JZeXMzdEpvOUlYejRqRnFDb3pjblJrb1V5elRPN0sr?=
 =?utf-8?B?WnZvaS83K2NuSEdkVHQwb1ZtYmNxZ25ITkljbDN5ZHNTcXpHVHpMVE53SWVy?=
 =?utf-8?B?U2tJVlVzdDY5VVdFeDFIeGpwRkJtZHozZk1UZUZFU1JkdkhBN0pIcnliWmNp?=
 =?utf-8?B?Z3VPSnh3R08wb21PNE1RZ0NYdm1SQm92blN3Y1V4WUZxYzE0S0Iyalp2WXVr?=
 =?utf-8?B?UkhyTG5odjhzaldvYjcreEZWVWNmeUNXY0JCTGh1YUQ3ZVhKL2Z6bHVSd1lU?=
 =?utf-8?B?QzFuWTR0eUhENGdNVnhrTmxGMTJTQTJHMkpTOUx6bEFUaTR2SnJpSCtZb0dn?=
 =?utf-8?B?dG1SRGdwbitxcXFySXVBei9SbTVwQlFaenZOV09zQ1ZOL05ZNWZudmVLNHFS?=
 =?utf-8?B?Skg3bm90Yk5HNUdkYjNWaGo1LzFYZXBiUmdrSjMzV3g3NUxIK1BqZERrN0FD?=
 =?utf-8?B?Z0JRVVRWU1FZc2JQeFdkTkhDRi9VeVcyVmNmVVNFT2d3OU5vWFJlTG4zMVVj?=
 =?utf-8?B?VmRTTU1yWUpPbEx4TEgzMCt5c1Y1dTRBRnFzVDExWHlHc0RDVEtia1lXMDNk?=
 =?utf-8?B?STdLYmhjYnZSSHlCQVMvbjJYYldTOE9wNWtmY0phanlEVjFsd3lvUFh4WHUy?=
 =?utf-8?B?N2lzSmt0ZTRhc1RPemF2aW9jZS9jVm5GUGYrNzJvRDBCNm5sYlhZeGY4ODh6?=
 =?utf-8?B?dWtjTDYrSjJHVXZFcjlkcUtRdTRwdmJBWDh1S3IvcVA1R0FaZHk0V0lrSDlC?=
 =?utf-8?B?d3pWaCt6SFBZcGZkVGF0Y2NwTnV0S2wwd0RySXBONUN5eW9hVnNNc0pzVjVP?=
 =?utf-8?B?ZERMdVQ3bEsremNBYkczMi9PbGt3Q1hlTG5kS1JiT1FxYmFZUGNWa09IaG5u?=
 =?utf-8?B?WFRCTVpKQnRHK3p1REovcm9za0JTbjFha2hvR0RGMEhZa0k2ZHo5bWtoVkR6?=
 =?utf-8?B?RnUrQ21uNy9Ra0I5RGRYN2xRYkRlUWlCVGJQM0RFVEVFSnZOTkg1cnhJMng5?=
 =?utf-8?B?dkJjTUJIWksvazVzNkdmZTZ5blRVWVhxVDRMM0x3WUxVeVNjVk9NdTVNRlN6?=
 =?utf-8?B?Lzh3QTRDb1FxYUhmWkZIOURxV0RDREFmZTdCamZ1R01CUkYzZ0JIZks1KzJt?=
 =?utf-8?B?UW9TZVJXY1hURXkwUkIrMTk3VEh4YThPL0xyUlBTMjFwekRUT2g0SHZ2QWs0?=
 =?utf-8?B?cmtZT0hONDhlOGh3eWdud3Q0cTN1cHVLM25SaFlaREUreEo3MkVMMXRqMERI?=
 =?utf-8?B?dGFQUFliZFAyUnZPcHVMQnViZWVTK2dMbUNNM1djcFlaNXdxUUxwR1IzQW9h?=
 =?utf-8?B?Z3k3TFNhVjYyeE8rWkNuRTRqVkNVMkV3Y1pKbXVLb1ZFRXFGWEpOQVJBYUZ1?=
 =?utf-8?B?VDVtUjROa00yaWJEOE01MHU4TGtjZENGalVBeFNIL3FSZUhHd0lRcDVhM1RZ?=
 =?utf-8?B?Rk9RU05veDBkSVl4Y0VYdEdWTXM1c0ZPRVRZL1A3Z1dNY1UrLzcwZUVYdjdH?=
 =?utf-8?B?QnpJZjNHRWFnb1MwaHE2ampFTzlGVmZCTyt4QjlZSEI3SHFrM1ErS0Q4bEh1?=
 =?utf-8?B?STFmbys0UjBFWkVQK3p1ZlVub1o0alByaEpyQ3lIdVc4OVJ0RGxJTXN4UU1I?=
 =?utf-8?B?c2dieE1pWjNoREdXbGoyVW80WG0xMnV6WHRxS2VwQndpbjhTYTRySWFKTkF0?=
 =?utf-8?B?bTdHdXpWTjdHUTRkeXo5d0R4cHhSWkp3aFNEOWIra2ZvQVpST1RqK2R6Z0JD?=
 =?utf-8?B?Smcya1JVdWliRHJWVWEwNjBRNnBLS3kzTjFjL0JabldtRlB4TWZ3anNEMkVV?=
 =?utf-8?B?anFQTU1uTUIzWCtvelREZG9aU2JSUnJMcWl4ekU4bGdWRjVGcWRFdFNiOFVE?=
 =?utf-8?B?QjRYYm9zbG1TR0R4WmZTSDFZMUdsUzhueTlTdmFScVZnY3JGVVE3TVA5cnkw?=
 =?utf-8?B?U1lXcUNKZGtIMExMMURoUDlLKy9rSE9mbkloRCtJak1DZCs3ZFllUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40e24fab-d060-405d-c249-08da299bf504
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 04:51:43.3121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 XroNhNR+Ei4yGfpVHr++u/eGUO9UZ+ClDgi7sGoPNwKo1clk/M7RMG2fdbJHxZbvCNLQmontJoxJP7vmWWWnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 04:51:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164990

SGksIEFsZXgNCg0KPiBXaGF0IGRvIHRob3NlIGRvX2NvbXBpbGUvZG9faW5zdGFsbCB0d2Vha3Mg
ZG8sIGFuZCB3aHkgYXJlIHRoZXkgbmVjZXNzYXJ5Pw0KPiBQbGVhc2UgZXhwbGFpbiwgaXQgc2Vl
bXMgbGlrZSB0aGVyZSBtaWdodCBiZSBhIGJldHRlciB3YXkgdG8gZG8gdGhpcy4NCg0KU29ycnks
IEl0IHNlZW1zIHRoYXQgSSBzaG91bGQgYWRkIGFuIGV4cGxhaW4gaW4gY29tbWl0IG1lc3NhZ2Uu
DQpJIGZvdW5kIHRoYXQgaWYgZW5hYmxlIGZpcHMsIGEgYmluYXJ5IGJ1aWxkIGZvciB0YXJnZXQg
d2lsbCBiZSBleGVjdXRlZCBpbiBkb19jb21waWxlIHRhc2suIFRoZSBsb2coTUFDSElORSA/PSAi
cWVtdWFybTY0IikgaXMgYXMgdGhlIGZvbGxvd2luZzoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KfCAuL2ZpcHNobWFjIC5saWJzL2xpYmdu
dXRscy5zby4zMCA+IC5saWJzLy5saWJnbnV0bHMuc28uMzAuaG1hYy10ICYmIG12IC5saWJzLy5s
aWJnbnV0bHMuc28uMzAuaG1hYy10IC5saWJzLy5saWJnbnV0bHMuc28uMzAuaG1hYw0KfCBsaWJ0
b29sOiBsaW5rOiAoY2QgIi5saWJzIiAmJiBybSAtZiAibGliZ251dGxzeHguc28uMzAiICYmIGxu
IC1zICJsaWJnbnV0bHN4eC5zby4zMC4wLjAiICJsaWJnbnV0bHN4eC5zby4zMCIpDQp8IGxpYnRv
b2w6IGxpbms6IChjZCAiLmxpYnMiICYmIHJtIC1mICJsaWJnbnV0bHN4eC5zbyIgJiYgbG4gLXMg
ImxpYmdudXRsc3h4LnNvLjMwLjAuMCIgImxpYmdudXRsc3h4LnNvIikNCnwgL2xpYi9sZC1saW51
eC1hYXJjaDY0LnNvLjE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCg0KU28sIEkgdHdlYWtl
ZCBkb19jb21waWxlL2RvX2luc3RhbGwgdG8gdXNlIGZpcHNobWFjIGZyb20gbmF0aXZlIGluc3Rl
YWQgb2YgdGFyZ2V0LiBJZiB0aGVyZSBpcyBiZXR0ZXIgd2F5LCBwbGVhc2UgdGVsbCBtZS4NCkFu
ZCBpZiB0aGVyZSBhcmUgbm8gcXVlc3Rpb25zLCBJJ2xsIHNlbmQgYSB2MiBwYXRjaCB3aXRoIGFu
IGlzc3VlIGZpeGVkIGZvciBtdWx0aWxpYi4NCg0KQmVzdCByZWdhcmRzDQpMZWkgTWFvaHVpDQoN
Cg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAy
OCwgMjAyMiA0OjEyIFBNDQo+IFRvOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29t
Pg0KPiBDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGdudXRsczogQWRkZWQgZmlwcyBz
dXBwb3J0IG9wdGlvbi4NCj4gDQo+IFdoYXQgZG8gdGhvc2UgZG9fY29tcGlsZS9kb19pbnN0YWxs
IHR3ZWFrcyBkbywgYW5kIHdoeSBhcmUgdGhleSBuZWNlc3Nhcnk/DQo+IFBsZWFzZSBleHBsYWlu
LCBpdCBzZWVtcyBsaWtlIHRoZXJlIG1pZ2h0IGJlIGEgYmV0dGVyIHdheSB0byBkbyB0aGlzLg0K
PiANCj4gQWxleA0KPiANCj4gT24gVGh1LCAyOCBBcHIgMjAyMiBhdCAwOTozNCwgbGVpbWFvaHVp
IDxsZWltYW9odWlAZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy40LmJiIHwgMTcgKysrKysrKysrKysrKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy40LmJiDQo+ID4g
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy40LmJiDQo+ID4gaW5kZXgg
YjM0ZWI3Zi4uNWEzNDgwNSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnV0bHMvZ251dGxzXzMuNy40LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
dGxzL2dudXRsc18zLjcuNC5iYg0KPiA+IEBAIC0xNSw2ICsxNSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTcxMzkxYzhlMGMxY2ZlNjgwNzdlN2ZjZTNiNTg2
MjgzIFwNCj4gPg0KPiBmaWxlOi8vZG9jL0NPUFlJTkcuTEVTU0VSO21kNT1hNmY4OWUyMTAwZDli
NmNkZmZjZWE0ZjM5OGUzNzM0MyINCj4gPg0KPiA+ICBERVBFTkRTID0gIm5ldHRsZSBnbXAgdmly
dHVhbC9saWJpY29udiBsaWJ1bmlzdHJpbmciDQo+ID4gK0RFUEVORFM6YXBwZW5kOmNsYXNzLXRh
cmdldCA9ICIgZ251dGxzLW5hdGl2ZSINCj4gPiAgREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0g
IiBhcmdwLXN0YW5kYWxvbmUiDQo+ID4NCj4gPiAgU0hSVF9WRVIgPSAiJHtAZC5nZXRWYXIoJ1BW
Jykuc3BsaXQoJy4nKVswXX0uJHtAZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVsxXX0iDQo+ID4g
QEAgLTM2LDYgKzM3LDcgQEAgUEFDS0FHRUNPTkZJR1tsaWJpZG5dID0NCj4gIi0td2l0aC1pZG4s
LS13aXRob3V0LWlkbixsaWJpZG4yIg0KPiA+ICBQQUNLQUdFQ09ORklHW2xpYnRhc24xXSA9DQo+
ICItLXdpdGgtaW5jbHVkZWQtbGlidGFzbjE9bm8sLS13aXRoLWluY2x1ZGVkLWxpYnRhc24xLGxp
YnRhc24xIg0KPiA+ICBQQUNLQUdFQ09ORklHW3AxMS1raXRdID0gIi0td2l0aC1wMTEta2l0LC0t
d2l0aG91dC1wMTEta2l0LHAxMS1raXQiDQo+ID4gIFBBQ0tBR0VDT05GSUdbdHBtXSA9ICItLXdp
dGgtdHBtLC0td2l0aG91dC10cG0sdHJvdXNlcnMiDQo+ID4gK1BBQ0tBR0VDT05GSUdbZmlwc10g
PSAiLS1lbmFibGUtZmlwczE0MC1tb2RlLC0tZGlzYWJsZS1maXBzMTQwLW1vZGUiDQo+ID4NCj4g
PiAgRVhUUkFfT0VDT05GID0gIiBcDQo+ID4gICAgICAtLWVuYWJsZS1kb2MgXA0KPiA+IEBAIC01
OSw2ICs2MSwyMSBAQCBkb19jb25maWd1cmU6cHJlcGVuZCgpIHsNCj4gPiAgICAgICAgIGRvbmUN
Cj4gPiAgfQ0KPiA+DQo+ID4gK2RvX2NvbXBpbGU6cHJlcGVuZDpjbGFzcy10YXJnZXQgKCkgew0K
PiA+ICsgICAgICAgIGlmICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2Zp
cHMnLCAndHJ1ZScsICdmYWxzZScsIGQpfTsNCj4gdGhlbg0KPiA+ICsgICAgICAgICAgc2VkIC1p
IC1lDQo+ICJzI1wkKGJ1aWxkZGlyKS9maXBzaG1hYyMke1NUQUdJTkdfRElSX05BVElWRX0ke2xp
YmRpcn0vZmlwc2htYWMjZyINCj4gJHtCfS9saWIvTWFrZWZpbGUNCj4gPiArICAgICAgICBmaQ0K
PiA+ICt9DQo+ID4gKw0KPiA+ICtkb19pbnN0YWxsOmFwcGVuZDpjbGFzcy1uYXRpdmUoKSB7DQo+
ID4gKyAgICAgICAgaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnZmlw
cycsICd0cnVlJywgJ2ZhbHNlJywgZCl9Ow0KPiB0aGVuDQo+ID4gKyAgICAgICAgICBpbnN0YWxs
IC1kICR7RH0ke2xpYmRpcn0NCj4gPiArICAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7bGliZGly
fS8ubGlicw0KPiA+ICsgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7Qn0vbGliL2ZpcHNobWFj
ICR7RH0ke2xpYmRpcn0vDQo+ID4gKyAgICAgICAgICBpbnN0YWxsIC1tIDA3NTUgJHtCfS9saWIv
LmxpYnMvZmlwc2htYWMgJHtEfSR7bGliZGlyfS8ubGlicy8NCj4gPiArICAgICAgICBmaQ0KPiA+
ICt9DQo+ID4gKw0KPiA+ICBQQUNLQUdFUyA9KyAiJHtQTn0tb3BlbnNzbCAke1BOfS14eCINCj4g
Pg0KPiA+ICBGSUxFUzoke1BOfS1kZXYgKz0gIiR7YmluZGlyfS9nbnV0bHMtY2xpLWRlYnVnIg0K
PiA+IC0tDQo+ID4gMS44LjMuMQ0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTY0OTMzKToNCj4gPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2NDkzMw0KPiA+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzkwNzQ4NTMw
LzE2ODY0ODkNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiA+IFthbGV4LmthbmF2aW5AZ21h
aWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

