Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D272DCD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 09:26:17 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66678.1781256368800378421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 02:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=PR7xsUTZ;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.69, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL/dc99SZX2O9WrBYcObIYuKwH5rl6vfQPe4gxXgOJKG3adSXeq0PQic+3uIVJ98MAROfUkpNimBTwz/X09R+Z5bDJgW7IVqK/PPIlhe3gzZVuBSGLG1TsH5rrZt3nX+sFhUDWvK20h1zxNshrzFumxsR2UiqoKFSwndAoiYy05nvdulS2lSjzp4W/wjfqj3SPvkV+swjRK9nqETUzTrIfczDaLI7I1qOOYsnAs/HxXlmutCbcPZErt5laTWZChHVpGbfYkhTU2+Hj31Ioxooiw+ivcXAkwvsfSdiI4ZF14bhFqZkHq2ZGljuS+IfWZ6QVuqFdlE6yubSapyS51BAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZLTR1PMZpC+64HcTtdfoL/3cKofH46KkF4Gln8BQKo=;
 b=J3GDt6IolQsNDOYKO7/0wbr24/dvAozLc26asByqVluXwdfEx+FX2REZnnun7xZuAfl180gfZdr8nJ2Wv4G4HYxUu9nCTG4bKYLS8wf3MV1o/wVJnRNc4PdJu8kHTie6L+nnfn/RDdluxgmDEW1Tdfjq7VC0QPRo1AIsp+EG6U5hx7Ut7jnSX+vStfctOhOk1fW97TWdSPJP+kd/JTSReluKjCZMmmgZOMeKIQvonM1ynQKx0PT29SEpEuvMaZj0mThKkc5RNeeoNr4rzoqm5+UvWTg+Aitka+Q8TGu1ah9+RDdbAsQoosXTFQavfgM7SPW08axG8Y1aAmMOZcqJtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZLTR1PMZpC+64HcTtdfoL/3cKofH46KkF4Gln8BQKo=;
 b=PR7xsUTZ9F9IKOKKF9ajSbdKUg36kl4YPVvBqfWf22ZBRnORM/pjKZBPr1HkB+UL3qPf/OogeigZI7uDEXYaPeo8XU5IA9ctVUSTXydoJaE8f9t77y0Pg8yIXxPPXa8e3Bb4bWL0CJLwERJHI2bwCpDDguYa51kdyQpK621Nh4kQMjb6ngD4ZN7D7W6va6b5qFf4ReHefKTO1XwqizDtDqyoJzBWiZLwFo7U6jOLlh6ypV5Q3HjReJZcpuokrovuDsCszC0CE81hG634NehoAQu75+07JF2DlLJro8TJfZG0RS0lokyvLH5M/2E16LMaWyuovsLecsdeCRjqKcXWwA==
Received: from OSCPR01MB13427.jpnprd01.prod.outlook.com
 (2603:1096:604:32d::12) by OSOPR01MB12153.jpnprd01.prod.outlook.com
 (2603:1096:604:2d9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 09:26:04 +0000
Received: from OSCPR01MB13427.jpnprd01.prod.outlook.com
 ([fe80::7fe5:56cd:2697:3a04]) by OSCPR01MB13427.jpnprd01.prod.outlook.com
 ([fe80::7fe5:56cd:2697:3a04%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 09:26:04 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 ->
 26.1.2
Thread-Topic: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 ->
 26.1.2
Thread-Index: AQHc+L6NSPNtQ3I5f0irCkYvZRp8HbY40OyAgAHXJNA=
Date: Fri, 12 Jun 2026 09:26:04 +0000
Message-ID: 
 <OSCPR01MB13427F610C3A42F7ADB33ED9CDC182@OSCPR01MB13427.jpnprd01.prod.outlook.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
 <20260610094932.2264-15-wangmy@fujitsu.com>
 <DJ5YPKB59JWN.379MO32ZI2BQH@bootlin.com>
In-Reply-To: <DJ5YPKB59JWN.379MO32ZI2BQH@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZDhjNGFjZTEtYmE5OS00YzhhLWI1OTEtMzg3NzU2N2Fl?=
 =?utf-8?B?NDcwO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDYtMTJUMDk6MjA6NTdaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB13427:EE_|OSOPR01MB12153:EE_
x-ms-office365-filtering-correlation-id: 205e822b-4ec2-452c-70f6-08dec864a074
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|5023799004|3023799007|1580799027|4143699003|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 eGQe914IP3M7XguvfjexUYF8kPX9DxpMWV6A7O6tfchRIspw5CuZhRyuzOOUszLQR5FzpocrkoV+7pqvpQ8O17a/KgS1zGRjfiPJUu7CJjNuf+HGPdzMKHouA7LqhZrAGs7j1MTpecDMW+8X3/A3FLWwhFV8BlAEvCnMSeXTJNITtVWpjn+WU0d+JbP0NXmsiOLUBrmBGWCjCtxOTEcM6UVwY4LmOti64v0mRzq+h8WRyi2BlfW91LghAE5I93ChC19jLmT/wi7G8RoDHpl+w71slFsP9OnJFVZCvEKe4bnN03uWYNs7zqQ1qWhPqKL0buZd2yZ4uy8mbLRW0OdmbEjZ3elSCCJRgyOPF2PncL8HL0FIP09fuV0yf5J77ETbdqPBWdmN8OkwUQz0cUfvdKkNLNzxKNdAenlLqAYW0HbM8rYyw1b8+hMptWvcOT/MP7EXpKrZqSwWYLn12yBUlDIh82D7y7Bm8CweskNUWEdE3HcaAfIj4a5TCsMBaVKa81HLkhR/hISm4BAOYnV3hvU0E/EMbt6wLmAjmOzs77b0CzBwvSf307pW2+GhvyMTCmGrqR8Xc9bYw7RE+RTVyg/zAK7Wl8NrVk/RyU/rTu+CLjHviaPYRmbipY5uiQXMx6O2gc4lYyM+WHHxGrhIxjpofFT6fksLB8HnW1ioLTHSVkIU7paHMy3jbRSYn/kP1BMleU2W7zkctqOg1kb1cNrVjsEH+T++/4ZlNRhMZcg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB13427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(5023799004)(3023799007)(1580799027)(4143699003)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YjNCMlNreW5aWXdkaStPYm1IU0pMRmNRNHJtdGxsNTEwYVZxSG5nSTRLTlNH?=
 =?utf-8?B?a21KNmtOZ2tJZGREVWZTSmV3eEpwTHRlZGxDZUZnazZsY1VhdzNWRFdyNWZ4?=
 =?utf-8?B?RXNPS1Y5S0hlZHJzSnVDMDBTaVRCYkE3UGgzbklpL2h1Vi9oT01JT0w2ak56?=
 =?utf-8?B?dUdhZ0lsaDZ2cjJ4V21naUpjT1NheFZqY0pkdXk2Vkd2aFNpWThzVUdWeEE2?=
 =?utf-8?B?UU9pOU1ZYmt1dENPd0RGZ0NkRWdNMGI3QnBLdStzOHA0NW5aSlVqUU93TnJ0?=
 =?utf-8?B?cllaS3hLS0RWdDN2NWlzRmRUWUFERi9vNGNJYUFUU0l0ZmJkb0RSaDR2UnN3?=
 =?utf-8?B?anpDV2NYZFliOWRNcFBFcmgyT2EyS2FJaW9mV2swYUxmVlRhQURWR3RadGJH?=
 =?utf-8?B?VkhIOG9GQjJXVE5CejJCam5ORFFrckdER09rbWc1THUxOHFLSk0wdy9mSlpW?=
 =?utf-8?B?eU55YmxzckRsMVFNS3F0VEVVVUs5OUlkekJBNDlleXhkNmxiTTlieHFuWmlX?=
 =?utf-8?B?eHRUL1pwclRtZ1FZa1k2R0dmVXE0NUJGOXBBWndhMkdDcExBaCtHd2M5cng3?=
 =?utf-8?B?d2FUaWE2SVY5OWRSSk1hWjBvclROKzdKT1dXcTFyakZESXhpV1Bpb3ZpZjlj?=
 =?utf-8?B?aWtYelcrMmdpOUtqSUFKNTFodUsvc1BXSXBPRm12RDhBVnAwQW5yZVlRSVo2?=
 =?utf-8?B?Uk1MemoyQldkNVFQNjdnQTRJSVVLUlNJcHd4R05qSVpJNHVqZ0Q0N3FEYmlV?=
 =?utf-8?B?SHJaTGJ5dFNyT01KajlldStlOVhYZmZ6S21ZMldlNUhaN1QxMWhJR1hYNUJW?=
 =?utf-8?B?LzYyT3NBL0FFQVp4M1dReDdTanRzb0lVNjhaLzI1UHVJanROZm1hMjBiT3BL?=
 =?utf-8?B?WWxteThkUUdpSi9UaWd5am5aOTUzOUszMU55QXhDLzJ5YmlGdU1XVWhaQmpI?=
 =?utf-8?B?MVdyMHQwbHQrQW5BQUE5SG1VMURtUXFWbUFkWDY1bGdLTHE4amtrMjgwUXFm?=
 =?utf-8?B?T3Vwb2FLWnNpZFRFZjk1UWFieStBdlRjQWZpOVpBdTZNdHB2emtUUS82UDAv?=
 =?utf-8?B?ZzhhUk9Rb1hKSTB3bnF4bGdvaVhTSmlIdEFNYnpIWkZDVENUYy91aStpaHp2?=
 =?utf-8?B?V3JJeW5FTiszSFk0cWZxdFFFbTAvZS9TdHJKazNHRmhwVU9uUml0VG9ZdlVm?=
 =?utf-8?B?Vkd6TStvOTRTQS9QcnFnSWVXSDdyK0U0YWp4a0w4M0ZMSXUvMlhMN2ZRQ3NT?=
 =?utf-8?B?cE9MTE5URXNZTjZZKyt5aFQ4bGt1ZVpnNFhUNkY4MWQvMnNKMTIvaXBTbkpS?=
 =?utf-8?B?cElldW42STZraFVhL1BvbFF2alh6L0ludm03eWhPYkljVGY0L25VRnU1aU5T?=
 =?utf-8?B?MFlNYjhabkpLbjNaYkJ6dVQyTU5yYUFlWGpwNnUrZG8xUkdtSFFaTzhUb2sv?=
 =?utf-8?B?ZzRDSDU0SE1aY1NPYWkxb3YwQ1Y5YXpkZ0J5RjJ6RHRFRW82ZDRySjlJMERX?=
 =?utf-8?B?N2lEL0xXaEVTd21aaWwwZ2Z2TDBCY1FpT2xSWnlleEY2eVRha01Qc0hrU0Vh?=
 =?utf-8?B?RU1DTmpIUURDVCtNY0l0V0VPOUsxWmRQRi8vTm92c1hBRDNzU2cyWXVWY1hU?=
 =?utf-8?B?SzI2RkxPN3JtVmtGL3NwaWI4QlNnUVRDdkxjM2pnTE8yU3JRdnhKcnludWkx?=
 =?utf-8?B?M1o1aU96Yzk3SzJvRUJORTFKOTk4djBPN0JETlp0SE15Y29aRGpUVzhtTFNj?=
 =?utf-8?B?SzZqUXduTHk1YTRxM3JIRS80MVVkVFgrYzdZSDhCb2NCRkE1WDJQallDR2J5?=
 =?utf-8?B?TEhwb1BSbDNsVE44eXVHeER1c1NFb1p5NytNN1R6Rm1OWkl0eWhzSHNQcmhI?=
 =?utf-8?B?TXVYS1ZUVmZRRy82eElLVHRXU0JHaTYvRFVETWlMYWdMRWtoWU1lanJHSG05?=
 =?utf-8?B?TUpFSkN2ZzRMa2tzNEJZbnNFTkNIbEk2b1lRb3hmMUZKdFFkV3d0SUQ0N2sw?=
 =?utf-8?B?VWdKZWJ0MlptYUppOXBkL1N5ZHRTL3BwOE52K3pVc0JteGFmV1ZpWXFoN1BB?=
 =?utf-8?B?TVZMQ0RIUHl1MytBM1NJb3ArR2EyQnM2NXFQcDhTU05td3pneVVSRjRPRXJU?=
 =?utf-8?B?RGxab3ZZeWZIMWV4akNlV2JSNkFPL0ZobEFKZXlzd2VESENvMC9vQ3c0K1Ev?=
 =?utf-8?B?L3doSkxpdUhjTUZiWDdZRGNlYkNqMWpOZ0ZuSGhQQ3dRSm0ya0pEQTZ0WVlz?=
 =?utf-8?B?blZPdmFva3k5TkJHZU80WlUyZUhiUXptYWhhbEF6TDVjWGl5cmxYbnZDY0NL?=
 =?utf-8?Q?ipNh7kjcs+zVbq/P8K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	AWYTNa4+SEHcrl5lq1K+t+s0ZB+p7q2PDF7CTHwKC2xAdOek2J1AtTfVuj4GEqF9snxvfEL8Sv+UONJv6elj8Eygb8NZWg7jzERm2RdslyG+EAgVPcTCFl+NCF1XOFgkd1QQwVKPXvSz3opC2vgBhZOZsk4391HFv7e7tUu6TiNgU4rqlFnFYNmyAHKY/4P+N5IOENR2BHZa2NdgH2vy28pHVrNuYmPe9mEn0XbFNI5zPTflAV+boLmGaoNrZ7kteW8SnxQgH0YR4P4CcjdzIA3Dn+HotWV60ezZhvAnmF6I6+KMFZ11Dk844t3k1N6+h9OibIackbGiib2X34xzlQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB13427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e822b-4ec2-452c-70f6-08dec864a074
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 09:26:04.6952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6b5HtokAwL+wl3wWZLdF5TSRYVYDVVK27jSUvhzCqUymRxKAerc5o2vd/9q1LxVdV7fiuLEIhaSyjRQMmFwbnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 09:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238598

SSByYW4gaW50byBhIGJ1aWxkIGZhaWx1cmUgZm9yIG1lc2EgMjYuMS4yIHdoaWxlIHRlc3Rpbmcg
dGhlIHVwZ3JhZGUsIGFuZCBhZnRlciBzb21lIGludmVzdGlnYXRpb24gSSBiZWxpZXZlIHRoZSBy
b290IGNhdXNlIGlzIHRoYXQgbWVzYSAyNi4xLnggcmVxdWlyZXMgR0NDIDEzIG9yIGxhdGVyLg0K
DQpNeSBob3N0IGlzIFVidW50dSAyNC4wNCwgd2hpY2ggc2hpcHMgR0NDIDEzIGJ5IGRlZmF1bHQs
IGFuZCBtZXNhIDI2LjEuMiBidWlsZHMgd2l0aG91dCBhbnkgaXNzdWVzIGluIHRoYXQgZW52aXJv
bm1lbnQuIEhvd2V2ZXIsIHdoZW4gSSBleHBsaWNpdGx5IHN3aXRjaCB0byBHQ0MgMTEsICB0aGUg
YnVpbGQgZmFpbHMgd2l0aCBlcnJvcnMgbGlrZToNCg0KZXhwZWN0ZWQgaWRlbnRpZmllciBvciAn
KCcgYmVmb3JlICc6JyB0b2tlbg0Kc3RhdGljIGFzc2VydGlvbiBmYWlsZWQ6ICJwYWNrZWQiDQpj
b250cm9sIHJlYWNoZXMgZW5kIG9mIG5vbi12b2lkIGZ1bmN0aW9uDQoNClRoZXNlIGFyZSBjYXVz
ZWQgYnkgbWVzYSdzIHVzZSBvZiBDMjMgZmVhdHVyZXMgKGUuZy4gZW51bSA6IHVpbnQ4X3Qgc3lu
dGF4KSB0aGF0IGFyZSBub3QgYXZhaWxhYmxlIGluIEdDQyBvbGRlciB0aGVuIDEzLCBhbmQgYnkg
c29tZSBjb2RlIHBhdGhzIHRoYXQgb25seSBiZWNvbWUgcHJvYmxlbWF0aWMgd2l0aCB0aGUgb2xk
ZXIgY29tcGlsZXIuIEkgdHJpZWQgdmFyaW91cyB3b3JrYXJvdW5kcyAocGFzc2luZyAtRGNfc3Rk
PWdudTJ4LCAtRHdlcnJvcj1mYWxzZSwgZXRjLikgYnV0IHRoZXkgYXJlIG5vdCBzdWZmaWNpZW50
IGJlY2F1c2UgbWVzYSdzIGludGVybmFsIG1lc29uIGRlZmluaXRpb25zIGhhcmQtY29kZSBjX3N0
ZD1jMTEgZm9yIGNlcnRhaW4gY29tcG9uZW50cywgd2hpY2ggb3ZlcnJpZGVzIG91ciBmbGFncy4N
Cg0KSWYgd2Ugd2FudCB0byB1cGdyYWRlIG1lc2EgdG8gMjYuMS54IG5vdywgd2UgbGlrZWx5IG5l
ZWQgdG8gYnVtcCB0aGUgbWluaW11bSBHQ0MgdmVyc2lvbiB0byAxMyAob3IgYXQgbGVhc3QgZW5z
dXJlIEdDQyAxMyBpcyB1c2VkIGZvciBtZXNhKS4NCg0KQWx0ZXJuYXRpdmVseSwgd2UgY291bGQg
aG9sZCBvZmYgb24gdGhlIG1lc2EgdXBncmFkZS4NCg0KVGhhbmtzDQoNCg0KICAtLQ0KQmVzdCBS
ZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4s
IExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpU
RUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUt
ODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMt
YnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAxMSwgMjAyNiAxOjE1
IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPjsN
Cj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAxNS8xNl0gbWVzYTogdXBncmFkZSAyNi4wLjYgLT4gMjYuMS4y
LDI2LjAuNiAtPg0KPiAyNi4xLjINCj4gDQo+IE9uIFdlZCBKdW4gMTAsIDIwMjYgYXQgMTE6NDkg
QU0gQ0VTVCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+
IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiANCj4g
SGksDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGdyYWRlLg0KPiANCj4gSXQgbG9va3MgbGlrZSB0
aGlzIGlzIGZhaWxpbmcgdG8gYnVpbGQ6DQo+IA0KPiBFUlJPUjogbWVzYS1uYXRpdmUtMl8yNi4x
LjItcjAgZG9fY29tcGlsZTogRXhlY3V0aW9uIG9mDQo+ICcvc3J2L3Bva3lidWlsZC95b2N0by13
b3JrZXIvbXVzbC1xZW11eDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saQ0KPiBu
dXgvbWVzYS1uYXRpdmUvMjYuMS4yL3RlbXAvcnVuLmRvX2NvbXBpbGUuMjgzOTcyOScgZmFpbGVk
IHdpdGggZXhpdCBjb2RlDQo+IDEgLi4uDQo+IHwgSW4gZmlsZSBpbmNsdWRlZA0KPiBmcm9tIC4u
L3NvdXJjZXMvbWVzYS0yNi4xLjIvc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfcHJpdmF0ZS5o
OjgsDQo+IHwgICAgICAgICAgICAgICAgICBmcm9tIHNyYy9pbnRlbC9jb21waWxlci9qYXkvamF5
X25pcl9hbGdlYnJhaWMuYzoxOg0KPiB8IC4uL3NvdXJjZXMvbWVzYS0yNi4xLjIvc3JjL2ludGVs
L2NvbXBpbGVyL2pheS9qYXlfaXIuaDo1ODI6MjI6IGVycm9yOiBleHBlY3RlZA0KPiBpZGVudGlm
aWVyIG9yIOKAmCjigJkgYmVmb3JlIOKAmDrigJkgdG9rZW4NCj4gfCAgIDU4MiB8IGVudW0gamF5
X3ByZWRpY2F0aW9uIDogdWludDhfdCB7DQo+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICBeDQo+IHwgLi4vc291cmNlcy9tZXNhLTI2LjEuMi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2ph
eV9pci5oOjYzNzoyNTogZXJyb3I6IGZpZWxkDQo+IOKAmHByZWRpY2F0aW9u4oCZIGhhcyBpbmNv
bXBsZXRlIHR5cGUNCj4gfCAgIDYzNyB8ICAgIGVudW0gamF5X3ByZWRpY2F0aW9uIHByZWRpY2F0
aW9uOw0KPiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4NCj4g
fCAuLi9zb3VyY2VzL21lc2EtMjYuMS4yL3NyYy9pbnRlbC9jb21waWxlci9qYXkvamF5X2lyLmg6
IEluIGZ1bmN0aW9uDQo+IOKAmGpheV9pbnN0X2hhc19kZWZhdWx04oCZOg0KPiB8IC4uL3NvdXJj
ZXMvbWVzYS0yNi4xLjIvc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaDo2ODE6Mjk6IGVy
cm9yOg0KPiDigJhKQVlfUFJFRElDQVRFRF9ERUZBVUxU4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPiB8ICAgNjgxIHwgICAgcmV0dXJuIEktPnByZWRpY2F0aW9u
ID49IEpBWV9QUkVESUNBVEVEX0RFRkFVTFQ7DQo+IHwgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMy9idWlsZHMvMzk2NA0K
PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVy
cy82L2J1aWxkcy8zOTI4DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92
YWxreXJpZS8jL2J1aWxkZXJzLzExL2J1aWxkcy8zODU5DQo+IA0KPiBDYW4geW91IGhhdmUgYSBs
b29rIGF0IHRoZSBpc3N1ZT8NCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4g
TWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

