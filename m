Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E95C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 03:31:20 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com
 [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web08.2175.1657078278313857146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 20:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=TeM9LTMK;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1657078278; x=1688614278;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jVxhR3+0vgv6i9iM2Fb7UVOOSVZbmxIQT6MFFg1p2NI=;
  b=TeM9LTMKeWbiBozXEJZnpkKFnBwawf2Wim2lJZDGWG6SV/rrJdr+rPUq
   AmHvtzcPAFzhXA3vh4nRqQgDJC+CWtCcI1tZFbDMPBiA65NS6tQfKIlcd
   VPQKxvzRuQ6RkcTw80Lo6XP+sieoGR86Xx8SlbmOCxy3MUJnyCJ7T+uHu
   HxRTMWJa87WnLNY6xlZq6iAMFKMq5lnjuJG6CbplS165JL+lSKqvRF+pp
   BNoK3ZLFYvINdCJWBloDFxHU9GCm6Uo18VrMpcdBUtqS657LZr6NOzC+8
   fCn28W4kMC3DjycqyBKzdY/HKHzYCOLvbK8W47L3wpyelaY4qis0qxQN4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="59850634"
X-IronPort-AV: E=Sophos;i="5.92,248,1650898800";
   d="scan'208";a="59850634"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 12:31:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJMBlnCbVErFJCsQNF9kAI05kEnm4zftdDBLslSfj0R2WPh9MrJH6NK6oVXm2nMg/+a7fYx+HuaghXqkYsH8/Q1utDsqZq0q5TKTxVvnCPKmddp0lqBIqZeLtsrgK4/eBzsxPoQQa3Bp2O+6GJefNnpVx/XVwLJKvHr6fcr06RatNUvhFSUVcMrEbXVrAFM/pWbP/dV5rYSi2IOZvSB3kb0Zhoqx0TYQBkm+XFA89xWClhTNBONYpQF/abGiOOK68QwbCaIunwtkihLaoEelH/HN+6Xl51+B8oEEWZ9fpiqfIVx1YDRnzeafk10HWQw4Z7cP5aAZVZlLje6eXf9Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVxhR3+0vgv6i9iM2Fb7UVOOSVZbmxIQT6MFFg1p2NI=;
 b=OLB32PolXtBgVLmQUiaVGJkBQfsHbOd4kEBN2KGi+wkJeXGnJcr2QZ+fhyZ5NbwhUqgAxCzzR9do4t3MSFtfdyenT9m3BAj5eNcuk+UcbG6jVgFtp3pxba4v8Zx7vO7PYCSSqE+ZzSxLNZpH6E8VsmtyYwDPmJknix4UHuAD7Eni31+eXZucIQLjlDbtrJvdKvc9bXvzP4o5GB6G0t6YdmcJJgfPcqum3e9syyoOad4fJ0S7x2e7W9mOzhODzTyWfyJdENe6j17URS2TMJ3CerjbS+1tV8SMgRM8F5ng/nhbAQUpFW7vMKl4M/a+UEA8LVjKrqwVT58QZgF7LfLn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVxhR3+0vgv6i9iM2Fb7UVOOSVZbmxIQT6MFFg1p2NI=;
 b=OAackUjgJM93kvp/xZ9phRxe7ahq3L7CutIu0lwEW3P5wjFgEdM+WdN8kGb7qYKXQSF+Eptb4s4Ibp2t9DKtPLApAoD0k1ARcr3w16i528p1UDBA/BBaibpUfapsK0lHjEebhnS21DvGcC0PVvgrZKrK+WAHW0uCN3mWamP98e0=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TY3PR01MB9999.jpnprd01.prod.outlook.com (2603:1096:400:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 03:31:13 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a%8]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 03:31:12 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Question about nativesdk-qemuwrapper-cross
Thread-Topic: Question about nativesdk-qemuwrapper-cross
Thread-Index: AdiQ6Emp1+TO49DUQvOutr2UU6Cf8w==
Date: Wed, 6 Jul 2022 03:31:12 +0000
Message-ID: 
 <OS0PR01MB6178C500A5157ED31549D49DA0809@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?shift_jis?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?shift_jis?B?Y2UwNTBfQWN0aW9uSWQ9ZTUwYWJkNmUtMWYwMy00Nzk5LWFiMmItNmJm?=
 =?shift_jis?B?YWRmOTYwODY2O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?shift_jis?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?shift_jis?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?shift_jis?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?shift_jis?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?shift_jis?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?shift_jis?B?SklUU1UtUkVTVFJJQ1RFRIHKwMs7TVNJUF9MYWJlbF9hNzI5NWNjMQ==?=
 =?shift_jis?B?LWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjIt?=
 =?shift_jis?B?MDctMDVUMDc6NTY6NDdaO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?shift_jis?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIxZC04MWUx?=
 =?shift_jis?Q?-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e64c4bbb-2e33-4a04-a577-08da5efff9ec
x-ms-traffictypediagnostic: TY3PR01MB9999:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UTgcF/dOpxpaq4Ur7Dig+uxiIIm8O11o1asVUM+JxDSDOMCD1hvIaOHNlCl3XvGBNJDQjsE1kwHEmVyWS66reIRKiNeDfiwsl7fQgP/SvZke4gRnADI35UyXGCzzkdOrZ+UAkP76Ojmqkmj49YTZLM61Fiar+qkfhrHUkM2mqssG1QUUAIxrOSAfqivlPBZaAyaG6n+c5aB+o3ydrKJbhmHNN9q3iqNzUX+EHwVn5MC3OzE3R2SgIk83kz6CmXv3AaU5o06tSz5sogcaPtHVVVrRRvcfAiyTZw0hYdj6sHfEtPlWLEnWFIIQqRxGFHCzvtH4e2WO1hGwG/izzgjoDXzMxq5gxKNWALgaTYNgpMcAnUcqvOpowIvQWp1Z1rJnFK56Vbdq6Y7nzoAkrQY45lOf4ySk5bnJpqAfs5db17KuSPEOkeCqBvzuZZ/6MuyKiO9MJe3jWfN+B9bBmiQuWS/hQnPxF8eD7Wjus07D4CRey4aN1N8JmmcQBPmGggGqalENmAF8hBPW54nY8+bbeheGyZ1X/iQmc5eDznAe/gFKC0N9lssGU12hoEfiqAgDnbYonsy91+pzwxinkFuHBmDp8Rrff8JH29xgbznb3ZDAw33OR6AiijCU6PdXc461wcK2zDu3fy4ObNqMKyeGg8VON8w++smiCG9gEmmB5HgrmtJbliWhn4vzVb2iM3uR9B/7vr0N7/9bl3q77LoSceKblleYUPFsIhJFzSh0zlMUScn55n0+refmKAvVYM20EOoORpZlEJPjWIkdTCFv0Xv1PvrpeG9grlq1kIKLHh22ZBix1xtzEIFPM4g8s3uX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(6506007)(66946007)(7696005)(76116006)(64756008)(8676002)(66556008)(66476007)(71200400001)(41300700001)(55016003)(86362001)(66446008)(9686003)(110136005)(316002)(26005)(478600001)(186003)(122000001)(82960400001)(38100700002)(2906002)(38070700005)(8936002)(52536014)(33656002)(5660300002)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?SThuUUY3Nnpla0k1czNUUkI3L0JxRDl5MC9laENPZWNLR0NheDExSlNX?=
 =?shift_jis?B?MEkvYVBHNVdNZkdNRUQ3THVkUFdSVDI1Tzhxcit5eHlYNzR2S1M4SEpz?=
 =?shift_jis?B?YTNtbnBwdnJMU1N1SWFSWlVNQUY1QW1GeEVvNE51ZE56U3JaREFaclU5?=
 =?shift_jis?B?YTN1cjhkMHJHSnVTc2p0Nm80WS8yc1I2enhhcG1nck5nLzRpM1I3Smth?=
 =?shift_jis?B?RVJuSlFiUXdJb0FabDdSclI1VGwxcWVUL1V4R1pzbWhyWVU4Q1IveVhB?=
 =?shift_jis?B?WW9iUmZmbXBndjNTZjVFN1kvTmRIWklvRk5wTDR5UkpXQ0g2ZXZISEIx?=
 =?shift_jis?B?UkoxeW1WTW5nSkFVZFFtZ2ViUnVSejFBZkZqM0hQeUtoRU9VbGFuaGFu?=
 =?shift_jis?B?T1VtZE1JdkNPZUJZL2MvYzdoRXZGQVFWeWhiMTlWdTlHazZyb284MEFW?=
 =?shift_jis?B?RGFWazJNcko0ZlljNm0zWnhlNzJVbnFXV0xXcWFYUThXZ2VoekZrVXJK?=
 =?shift_jis?B?K3VvaFY1MHFTSTZ4TC9XSS9NTlpSSmZ6S0FDM1dBVEVoeFpXWVMwTTVT?=
 =?shift_jis?B?MTNsclF3eVgxYlJkTy9nQ3QwNmx4ZVRNalpTWTlJL1M3eUhSdnNOQUI4?=
 =?shift_jis?B?KzZUMlJiMDJ5VUNLZVhGb1FONkRGRE92ZVNybStjSVV4VDM4dTJjVm44?=
 =?shift_jis?B?RFlNcUxEOHIwVHNkamFJdFZkbzFseWgrKzMxR0Q3ZG9UUUVqVTYzVkMz?=
 =?shift_jis?B?TW9lS2xMYUo5akx6b0t4d0p0enF6cHVGRHF3L1FheFhicGVsS2RxTGdj?=
 =?shift_jis?B?UU5SdFRPMEtKaWhJb1ZKMU5OUmNVYlRVY3RkRjk1VHVPYWN5c1VDUHd1?=
 =?shift_jis?B?OFMzOFB2QTk2OUNmQTNMT1FSSzRNVXpRbWp5MkZ3aG5xMmxuK0dLQ1c2?=
 =?shift_jis?B?N1FYbVZJTHdPSE84OWhlMVVoVDJORkdRN3RlNWs0N0R6bmczOXNJUjZN?=
 =?shift_jis?B?RnU2ank2cjduK3lpaWdRbWRCcGYvMVI0bWJ3eFB3TUt3enFOa1VndGFL?=
 =?shift_jis?B?U0NONUxOS29PU3FvUGlHRkxGQVV1QUVhMHByMnhZUzVGYzk0WnBZUUw3?=
 =?shift_jis?B?Z0JhclpZSVk1QnRCRnhLYThESHFnYVVwZmg5V21DT0dYTWgyMVhjRGt0?=
 =?shift_jis?B?L3FXeG02RzRVZHVPOGVNbUM0TEhjN3c4U1Bkb3hZQkVSeXJOUFJLeGdP?=
 =?shift_jis?B?Znlkc3YwM0lGR0lyNzg1SCt2dnl1WGl0MEowTkdCUkZSbEZROER1MzMy?=
 =?shift_jis?B?QmJ0RytWam9hNnNZOHNKemhoclNyRWZMckFWZ0U5ZHdhRHV2UkJTOFZM?=
 =?shift_jis?B?dncvcGlTSU9TM0ZYb3p1YXVFWE42djg2bWx0ZTI5NFBING9ySDVZVnll?=
 =?shift_jis?B?N0lQUWpDZHM1SEUyemJlejBQREc5OUxuUU4wOC9QMHhPUjlTVFlkN0or?=
 =?shift_jis?B?MjdoL0pqTjZiQkFON2pYWklraDFabDBLNnRpKzIxR1prWGJtK2Q3WlRP?=
 =?shift_jis?B?YW5KYi90aWRLNGJPc0xHai9MaFp3d1l1cDZ3U1dSRjBWTHpWazZKSjdU?=
 =?shift_jis?B?enlsTnhxNG5veFNQTUZvYUFML2diOVNhRUZEOEpJcXprWEQ1STBzc1Z3?=
 =?shift_jis?B?dHNhNTZsWjVLVlU3OVd3S1ZEVG00cUNldnEwNkdPeWhCNEZsV1hjT2Rr?=
 =?shift_jis?B?THhnTmZ0MVZLN2EyeGpPN0g3Mm5PZ3hvaEM1RkJIV205eENmeDgwWXpv?=
 =?shift_jis?B?ZUpoV1c2RDc2TmJyR0VtbFVTNWRtSm5NQytGUlJiVkw5YitCbUF5RkN3?=
 =?shift_jis?B?UzNwOGF0K1YxeCsxM0ZZYTBkYnZqUnFxVGo1dVUwenZicUtjOWJ0TjF2?=
 =?shift_jis?B?eWF2ZGVOSU5LdVF2K0V4NXN4dGxvb2UyNFVvNnUwd051SXBlSFc0UXFq?=
 =?shift_jis?B?QjNnRDBac2Y4Ulg0bXJGZE9ZRlAyVklPN0dOY09xM0diSVF1Wk5QRUNo?=
 =?shift_jis?B?ZWp3MkhneXhWR1VzTSt6VGUyNTNaOGNaVXRBaWtYSDU1UkJLaHowRFlL?=
 =?shift_jis?B?cUtnRUNtWEVRZ0t3WHhyamZtdkJ6dk5hcG8rc3MzVEhLWHNKL3YyU1kr?=
 =?shift_jis?B?UTE2R3JFS0UxSFFQWmlXU3R4aFk3UTZvMlROMkI0L0JUSVRKZnZDa05P?=
 =?shift_jis?B?VUgxVWN6aml2bzJSd21uQnFzeS8wL0hkK3YySGVEbjFrZEt5Y0lhYmNo?=
 =?shift_jis?Q?kthF?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e64c4bbb-2e33-4a04-a577-08da5efff9ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 03:31:12.8897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 R5SKC0aQIh9y1v5V8DUN1XdEhaeOsfwJzs+Ohe6+13RKChu+8Az2C6mldhtae6XZCMwXekzT1BywwPy2F54ylA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9999
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 03:31:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167686

SGksIFJpY2hhcmQNCg0KSSBhZGRlZCBuYXRpdmVzZGstIHFlbXV3cmFwcGVyLWNyb3NzIGludG8g
bXkgbWV0YS10b29sY2hhaW4sIGFuZCBmb3VuZCB0aGUgY29udGVudCBvZiBuYXRpdmVzZGstcWVt
dXdyYXBwZXIgc2NyaXB0IGlzIGxpa2UgdGhlIGZvbGxvd2luZzogDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgY2F0
IC9vcHQvcG9reS80LjErc25hcHNob3Qvc3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvdXNy
L2Jpbi9jcm9zc3NjcmlwdHMvbmF0aXZlc2RrLXFlbXV3cmFwcGVyDQojIS9iaW4vc2gNCiMgV3Jh
cHBlciBzY3JpcHQgdG8gcnVuIGJpbmFyaWVzIHVuZGVyIHFlbXUgdXNlci1tb2RlIGVtdWxhdGlv
bg0Kc2V0IC14DQoNCmlmIFsgVHJ1ZSA9IEZhbHNlIC1hICJuYXRpdmVzZGstcWVtdXdyYXBwZXIt
Y3Jvc3MiICE9ICJuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3MiIF07IHRoZW4NCiAgICAgICAg
ZWNobyAicWVtdXdyYXBwZXI6IHFlbXUgdXNlcm1vZGUgaXMgbm90IHN1cHBvcnRlZCINCiAgICAg
ICAgZXhpdCAxDQpmaQ0KDQoNCnFlbXUteDg2XzY0IC1yIDMuMi4wICAtRSBMRF9MSUJSQVJZX1BB
VEg9JEQvb3B0L3Bva3kvNC4xK3NuYXBzaG90L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4
L3Vzci9saWI6JEQvb3B0L3Bva3kvNC4xK3NuYXBzaG90L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2Rr
LWxpbnV4L2xpYiAiJEAiDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KUmVmZXJlbmNlIHRvIHFlbXV3cmFwcGVyLWNy
b3NzLCBpdCBzZWVtcyB0aGF0IG5hdGl2ZXNkayBxZW11d3JhcHBlci1jcm9zcyBpcyBub3QgY29y
cmVjdC4NCldoeSB0aGUgInFlbXVfYmluYXJ5ICIgaXMgIiBxZW11LXg4Nl82NCI/IFNob3VsZG4n
dCBpdCBiZSAicWVtdS1hYXJjaDY0ICI/DQpJcyBpdCBiZXR0ZXIgdG8gY2hhbmdlIG5hdGl2ZXNk
ayBxZW11d3JhcHBlci1jcm9zcyB0byBxZW11d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJ
TkV9Pw0KDQoNCg0KQmVzdCByZWdhcmRzDQpMZWkNCg==

