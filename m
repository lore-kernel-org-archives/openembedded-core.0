Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD9C433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 02:31:12 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web10.6041.1651890662167220283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 19:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Jk6AMYmh;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.76,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1651890662; x=1683426662;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9Zj7sv6rGb09Ktr6NmYnwVCoQOkg4qi4IO9mE9f1+Tc=;
  b=Jk6AMYmhqvJ7PKbw3Jf3tNjkCwB1Ovlq7gSih3Dh/gADNqKUVmqm8jux
   /Rcj/ifi5CQaWTTDWuumJ1Hj55zARjLSKDb+GgqAHPFApW5cBUv1tu/P4
   PhYXtj5OfZ65Jz5aV+7fN3CZRHrOuuRV+01VT/XCdzuKY+n9524PDQd8E
   uxREqJUmg+w6qi8jZzkzxaomtWu4wxPUG3GEEF/Pu6luMJJiV4U5WwkN3
   Le+zsMMSucXYtLFOrSUD2uNu1UWr+xPsrWlldchk6ov5Z8YtwEI15m1Y6
   oqEeOK1L+HSlHA62G3VI39zVvp8n4geE3Ebgl/gx7FKfBXwFs7S/eZwEM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="55398872"
X-IronPort-AV: E=Sophos;i="5.91,205,1647270000";
   d="scan'208";a="55398872"
Received: from mail-tycjpn01lp2175.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.175])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 11:30:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGPQx1b6J6hl5OOLwy+9BT95RH+nf9H7ZgwpJy4XmxdDz5c/6g0p9gP+3UIJ8B86A9qitCLZZB0ep9fFpB+Bllc2tuuqPEoid7xYiz7UYrttYu7TCr+7eR+BK9QDhF1E3DdTh/2nEQEwuNNHn5ci5u8UB9MCn7WlYciBSGg2HKjESMr1LBsG/2BKT6BMCeS79LAW7Cm4s+s5DEYSs3nlcKEnCTYjeZcWRTLLfpujp7zewHSfXHfvs1X79gHEwO6VuzzXWuVDtCAWGd065X8zhPnGnGA4MCWhLGqXuVM/m+e5/ezMxxiYH57hrkHVzw9WiewcFkpvjkUc8N4+gF//Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Zj7sv6rGb09Ktr6NmYnwVCoQOkg4qi4IO9mE9f1+Tc=;
 b=NUKqF7rMhiwZfsfQGjSkyM0GL6TiARcI/fjnvDfKRuPsWeS/DbEy7/csEt2TRxoUCqtYjdFiuEM13FzUNb3zHFcyh5Nbh8+kkLMQmgQpJY71yYAr/7GLN6zEhK8p2mhbVSvYVuBJiKHkddH4nCB5uOaw2qY9zi/9r4LQbnMXukvkYupbabYQ3CUJRrPX0VubVVDsFb0uGIQnXIAUCN8NRthN0NOXPd7tLsR23JqKKht5mf0O4PmYuIsaKeIGOrqwP2cbirB6c8jdTRSF2q6MDTCq5ToyUSac/fuCv+oiNYGDvDq00NkYmndnG4TGQ34d+fedHNszHGZlqV/PUxQNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Zj7sv6rGb09Ktr6NmYnwVCoQOkg4qi4IO9mE9f1+Tc=;
 b=NSqPGcxI/f6LxbMD3AulSkLjOMAz+f5410zlc6C+QtNiVlMQ7nuhtGdB189Edx0CTLT3e7Rjhn/qugk4qJtqqQKFvSLFPda3/COZYeHv0DnIJmfK57e5wF3E7ozIpV/kc/OL1Iaqx8aHaCX119FtpWGTpaTE+evslM7Yj7Z9w88=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSAPR01MB3857.jpnprd01.prod.outlook.com (2603:1096:604:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Sat, 7 May
 2022 02:30:57 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%7]) with mapi id 15.20.5227.020; Sat, 7 May 2022
 02:30:56 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Index: AQHYYPqy/ocPXdQui0OLuVvDKY1+Ca0RY4IAgAEiy4A=
Date: Sat, 7 May 2022 02:30:56 +0000
Message-ID: 
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5266d64c-689a-41c8-d53a-08da2fd19d95
x-ms-traffictypediagnostic: OSAPR01MB3857:EE_
x-microsoft-antispam-prvs: 
 <OSAPR01MB3857DEF51FE177566AF51958A0C49@OSAPR01MB3857.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 S8+7z+oj32pihtlNv4Ou5Jvngz4VMH+Bc/a1YTGM/qKFVpdKAr+9LDVu+Jn80AFV9BepPyGZeKNYu0wtqOjiAbDoPe8o5sRtlfwtGGkZyE2M7lqhtDLRNpW+hOaKtKGrF4jAbkFW9zgJwBlz2NUKCdYI4oblTHEUpGK06Bl/o/KxYcEoZlyHWTW9PWDmlFuRUQEH7U+bPTCrp3PXrtfQtoNsTVbCdlr+J9evnRjx1ISbki6LSmG3EM1PKHvIW6dF7S/UYsOZaMsnbqOXMvtr2OlbyQJ0VeLUnhzcbom5htecPzQkFKybJkINivRw8a8Jf3LHuulYXTleIWXhC3DFljw+mxW5O4gIRyjQFzLwKpw+/r8d5R35Ibp9mWmSLNehQB/xf+uWvScXmrxRUNnL60KpkLkjqDlXu9UC0JB5KnFYos83wcUHm5Kd3qqGGNg6GmooSaaXuHm6ajPmRbCxt7+ZS3o8+L/1Z+/UYvfWeIkOWW260Ncz5RTldmdETETel4VCC2ahPIWv9sTorQl9ZGyek9XKifD1yXhpdy++9SMQToN7QDkVPV4wzfcWhuEExAIMEkrSYJpcf6PrPGg93z9teT8V67gBP77rRVhlIH315MQ2KJVlziKKm1c0+/YClocEoe7vHonuG3STrDcoa3XEwyLUD9oWoOHDWmTizBwr5ykXnyQIbA1PU1fkqbuDNLnyb4OHFuw4/gdkkmSqDw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(9686003)(52536014)(38100700002)(5660300002)(8676002)(8936002)(4326008)(7696005)(2906002)(6506007)(71200400001)(26005)(33656002)(83380400001)(85182001)(38070700005)(316002)(66446008)(55016003)(186003)(508600001)(6916009)(122000001)(76116006)(66556008)(66946007)(86362001)(82960400001)(64756008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z3pjaDdOdS9Fb2pCVENqQVBwQ2taT3MwQmpkQk02MGI4OC8vK2o1VGdKUSs1?=
 =?utf-8?B?V1Q0dEwydHk2ZC9VSTRBNjdwRTk4L2Ywc252YVkxM0lCaWlIc1E4RkkwSjZQ?=
 =?utf-8?B?c2h3eXVIWUdBQmR0WE8vc251K05rMHppUitIMHgyMHhRclNud2FLeFZmTkYy?=
 =?utf-8?B?YUw2YkdTQmxPNEwxNnFkQ2NsVWJ6SzZXOXlpOStudlNab2I4ZnU5RUM3S3gy?=
 =?utf-8?B?ZnRMUnY4Wnd0Tzg1cHJVM1RRN1FpODZPMWswVGhFN0lDbU51dHJRQVFNVmNk?=
 =?utf-8?B?R3F3Q0k5V29PQ2FISDViZmJiRjIxTFlaZC9QdEQzNXlVb2lJRE1VUDhybk9y?=
 =?utf-8?B?cVhIakp6Yk1mQUcvaWowM3dEak5Cd255b1I5WWZYVHlJa1JIR3lCR3lWZkNx?=
 =?utf-8?B?d1lvalRIRTMxNzhBQ3JoTWowYzRSbUZ6QitQUk9JRGFwZnNueTRjVDRiUGlj?=
 =?utf-8?B?VnhOZkMvSkZKeThlS0tHZDJaZjlCeExwMHNkcVUxYXZJbGMvSTAzZkVZN3lt?=
 =?utf-8?B?QTNHb1lGckFudytYQ3V2bW1MMTV6MUxYTHZHRGYyWGthOVFybjl3dEJxYWpK?=
 =?utf-8?B?dmk4b01WMURTZlphS2VDZWZyVnd6dWI4Q3h0aCt5VGE1OWcvSnZ6M0dTVXYv?=
 =?utf-8?B?ekRQWTBCT3lPU1VVVUEvaGJNb3hEa1ZBOHJORktwbWhQckpkWVFDKzZEc3Jm?=
 =?utf-8?B?c0s5aEdodlE2NU9aTTg0UHdLOUVOY0xwZnF5dWk1TWNUMG5rTEI0Z244N3Er?=
 =?utf-8?B?bFpFbmF1cHFodHgyVGxpRUIzbFVlckkzSURzcHJHOGFWMDJsME9ra3phN0s1?=
 =?utf-8?B?V1B0Ky9md3FVQjVkejdQanhaZzc3VjlsUUdENE5XU1RudTJzZGpKOENoVVRQ?=
 =?utf-8?B?TnR3am5nZXJsdVh0RjNMYkpKanlHYW0xaTJycSs3VTFSeHM5NXRLemRvMkJa?=
 =?utf-8?B?WnBmRFZlYnA1K2k3RWNiL0I2dEtwNTY3N0RrYkhRQjhVZ0wrb2Y3YUpKeFYr?=
 =?utf-8?B?SnNwQWZwUkhBMEJMUW5Sc3RuV3NnMFpGUkFnb2ZGY3RaVDRmeTN3Y3o2THlZ?=
 =?utf-8?B?bVQzZXN2REdKR0c0VGR1anUxa0N3cG92UjF6ZlhrMGRYdSsyYnpJYWpFVjl5?=
 =?utf-8?B?RVFQUTg0OS9qcHlXcWhnTUVKWUxUMVdGeVZOQ2ZyRllmVzdYOWZ2aFUydVU4?=
 =?utf-8?B?cHFjRS8vRDdjTmFNbUtiMEx2RWRwMFQ4ejFPQnpzWUkreGtacEw3VCtpVDZw?=
 =?utf-8?B?VXZIS0JBU3lmd3Q5bWE4WlExQVh5dUlZQ3hEVm9JUUZFMUdCQXdjVDJOUUwz?=
 =?utf-8?B?SzRwSE1kYW9PcmFqT1Q4WkFmNFR3bXNNZGhLcHQ5L1ppWjU1SExLMHpnTEVX?=
 =?utf-8?B?ckRyVjlrbGNrdDhCNGNqTk5MYUMzLytQemdZTGRaOGdDNjMwTG9meFN0WHM1?=
 =?utf-8?B?MURyRUE4OThWNVNpaDdEVXp0QUZ0V0o5WEhNaUI0cVRONHpKdW0vcnI4R0xF?=
 =?utf-8?B?cjl0YTZoelVJWHhUUVVFZnpNY2lGSWY1eXEzdUhNeVZMekVKUEdMYTJpSDhQ?=
 =?utf-8?B?Q0IzK0lkVXNqL2lCNTdWbnIrY1U5U21kVWxKUkl3UWlvUjRScTMrMmNtSGlz?=
 =?utf-8?B?T0tNcEFHcUpzOVh0czFvNEtFblltdytSRW1vMjNmcWFwNmNwb2dMUmxlQnc4?=
 =?utf-8?B?RlZ4Y3FHRTRTNlNpRnIvdFBjQUEyQ3VhVEMzcWt0UXVZVFhCdGh4WkFBWU1S?=
 =?utf-8?B?M3VVbGJxUVR2cjZNbmNvbEx5MVV3T2x1UDkvNmhhY05XZkZublBsUW43YUg5?=
 =?utf-8?B?a2hacnZpUWFkQW5FYjE2S3dTU2NnNG81VE01N09RU3RPNkVoMVB5YUIzM253?=
 =?utf-8?B?NTFvNWRsY0tWQ2k0RGRXRkxLM0V3VDlpb2xVYjh5bFV6aU9sdTR4Z0VacTkv?=
 =?utf-8?B?Y1cxOHlJRkR6MmJBU3RHMVZvUlpaVWc1Y1gxK0ZaL0RwRFZCS3RqNVFkdits?=
 =?utf-8?B?eEVyaHdhVU5PdmUxaEpuLzJyd1U3MUxYNlRVSGMxL1hlQmpPU2lnV09yL0tB?=
 =?utf-8?B?cW5VWVpIcDFkaGRvazgzTkJmODVTQ2F1MWpDa2JCRzZFTTRjMk9XNzV6Q3or?=
 =?utf-8?B?bHE4ZTFabWhla0wyT3llaWg0d3hWajBoejlLVXRzcHFVNEJwT3dvT2x5MzVy?=
 =?utf-8?B?cEhUZ0N3WUtSY3ltRFVBZ0tSTDNFNS9RWEQ2UHNCMFRhc0hPRks4bFhGZXZC?=
 =?utf-8?B?Y2lUdC9kU2JxV1M1MEQyNzRGb2pTcmp4QmIzY1N3clZXdTc5OGFsWGlHK0c1?=
 =?utf-8?B?VkF6Q1FMeWlwUGhJdWpOYkV3ZGpYWWx6dmFWMFlvbC9VbnVicHdjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5266d64c-689a-41c8-d53a-08da2fd19d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2022 02:30:56.4546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 k2C61x+wHlnBHvxFCVtLuZuA/FOLyqOdmesX48H2UVyH3+g3Z9LLvF43+LWk4kyb7SzjJGkzMxjnpjnMhbIZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 02:31:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165350

SGksIEFsZXgNCg0KPiBJIHRoaW5rIHRoZSB1bmNvbmRpdGlvbmFsIERFUEVORFMgbGluZXMgY2Fu
IGJlIGF2b2lkZWQgaWYgeW91IHVzZToNCj4gUEFDS0FHRUNPTkZJR1tmaXBzXSA9ICItLWVuYWJs
ZS1maXBzMTQwLW1vZGUNCj4gLS13aXRoLWxpYmRsLXByZWZpeD0ke1NUQUdJTkdfQkFTRUxJQkRJ
Un0sLS1kaXNhYmxlLWZpcHMxNDAtbW9kZSxnbnV0bHMtbmF0aXYNCj4gZSINCg0KQnV0IGJlY2F1
c2UgZ251dGxzLW5hdGl2ZSBhbHNvIG5lZWQgdG8gZW5hYmxlIGZpcHMsIGNpcmN1bGFyIGRlcGVu
ZGVuY3kgZXJyb3Igd2lsbCBvY2N1ciBpbiB0aGlzIHdheS4NCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRVJST1I6IDI4OCB1bmJ1aWxkYWJsZSB0YXNrcyB3
ZXJlIGZvdW5kLiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBFVEE6ICAw
OjAwOjAwDQpUaGVzZSBhcmUgdXN1YWxseSBjYXVzZWQgYnkgY2lyY3VsYXIgZGVwZW5kZW5jaWVz
IGFuZCBhbnkgY2lyY3VsYXIgZGVwZW5kZW5jeSBjaGFpbnMgZm91bmQgd2lsbCBiZSBwcmludGVk
IGJlbG93LiBJbmNyZWFzZSB0aGUgZGVidWcgbGV2ZWwgdG8gc2VlIGEgbGlzdCBvZiB1bmJ1aWxk
YWJsZSB0YXNrcy4NCg0KSWRlbnRpZnlpbmcgZGVwZW5kZW5jeSBsb29wcyAodGhpcyBtYXkgdGFr
ZSBhIHNob3J0IHdoaWxlKS4uLg0KLi4uLi4uDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgNiwgMjAyMiAyOjMwIFBNDQo+IFRvOiBMZWks
IE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogT0UtY29yZSA8b3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggdjJdIGdudXRsczogQWRkZWQgZmlwcyBzdXBwb3J0IG9wdGlvbi4NCj4gDQo+IE9u
IEZyaSwgNiBNYXkgMjAyMiBhdCAwNTozOCwgbGVpbWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5j
b20+IHdyb3RlOg0KPiA+ICtERVBFTkRTOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIGdudXRscy1u
YXRpdmUiDQo+ID4gK0RFUEVORFM6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZ251dGxzLW5h
dGl2ZSINCj4gPiArUEFDS0FHRUNPTkZJR1tmaXBzXSA9ICItLWVuYWJsZS1maXBzMTQwLW1vZGUN
Cj4gLS13aXRoLWxpYmRsLXByZWZpeD0ke1NUQUdJTkdfQkFTRUxJQkRJUn0sLS1kaXNhYmxlLWZp
cHMxNDAtbW9kZSINCj4gDQo+IEkgdGhpbmsgdGhlIHVuY29uZGl0aW9uYWwgREVQRU5EUyBsaW5l
cyBjYW4gYmUgYXZvaWRlZCBpZiB5b3UgdXNlOg0KPiBQQUNLQUdFQ09ORklHW2ZpcHNdID0gIi0t
ZW5hYmxlLWZpcHMxNDAtbW9kZQ0KPiAtLXdpdGgtbGliZGwtcHJlZml4PSR7U1RBR0lOR19CQVNF
TElCRElSfSwtLWRpc2FibGUtZmlwczE0MC1tb2RlLGdudXRscy1uYXRpdg0KPiBlIg0KPiANCj4g
QWxleA0K

