Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD0EC5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:25:38 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18733.1780381528727051284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=BeXZA5KZ;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.43, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwO90g/HluWzDU6vxW6R0BrAljfFa36sLHPBX98jy6a+d+rfi9Fojd+665VakYgTHji3xFJSmoxs+PqsPHXI98MEQtusZBE8KRzEBSeJ5Yjmu040NkwnBwGMGN/CnCcxOWMwXuBiv6TpE+b8tK9fZ2IKK9krUll33xArEhCv1rrpZfy8sJA4U8QRcKgNk/8oyJ2/Jn2oKmeKEcnoZyXZXyzwMo686VOIiHlD7IkFpoC9JNPsGzW1XaHtTRgxz18LD8egUucMhsxLH+rEZqJmx7qRj2oHz1c3mPFqei0NpWLVjBOr6wOICdN7YBCF1An+Dej6KXrhF9xPOLWzQB9xsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC/TZ5XQxyWhMYztjLNOLM1FDpXktbkAGK3R9Fb0t3k=;
 b=Hz0ILoQrirgW38ZDixtFSdv+qbY1phuHllavclcIZLMcmWFD+8yURAQRBofkHfKSrKwwkWcb2FRD1YbP5ZU7xh/xnynSp79AVQ0CgQZ0o3DLlE2cPALlTZHst7sioegFrCFm8gpI1fKRuty6WYrBwflrCVO4VrnkbA5JI0LXE6xJ9+WLmC8DbXPWZGKzVfbcnyIwItUAygpkeIm7G3qGl2EbGdmYA4WsXqeOgQGUq9TjcSi9++VLqNMH5GgKoyfhgt0QQOtHU+OWW+PeYzDvZOiw8PZZzX+kQf8M2fgjTM/TT8+Z5Hztb1tJqygCQ/a0dmPywJYN60+aTtvfzOKEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC/TZ5XQxyWhMYztjLNOLM1FDpXktbkAGK3R9Fb0t3k=;
 b=BeXZA5KZXsdraYpf/7DUKYv+5rTqFXkHZrdkow57mlyMN2UlgoW8SDGWd1t5B+KWpV++bUWrULauTX6HZ3YBEjCM2yfAVD1yO+Rkv40b5XpSiPe74XXzrF0STODLBkvl7RFdxxqN9KHbM6JrySLoNBklbvKIwGk1FoG77yOCJgmSlrQ9CF9nWXn/U/mEqAZxORw8Lu+owxA3IBm+MDRjBkfrn6KTajQ8O7Ae65GH5m/wu7/18XPRkCuwP/EUxlMd8RSsov1gCoKybZ6IMdDSltswCWTQiqvB3uHEu6WIqSd2E6hpqgQIrki8Sa1VTbsJZYN6DR0TNR8scaXNVExG1Q==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by OS7PR01MB17870.jpnprd01.prod.outlook.com (2603:1096:604:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 06:25:24 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:25:24 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Index: AQHc8SKl2Ow8VA90V0GJMC5GDqATwbYo8yY5gAGHZM6AAFPB/g==
Date: Tue, 2 Jun 2026 06:25:24 +0000
Message-ID: 
 <OSZPR01MB786818BB11890BF4B03484A28B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
 <18B4D2C3BE17A296.111707@lists.openembedded.org>
 <OSZPR01MB7868A7D33A0E67FBB3E1043B8B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSZPR01MB7868A7D33A0E67FBB3E1043B8B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-02T06:25:24.495Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|OS7PR01MB17870:EE_
x-ms-office365-filtering-correlation-id: b5b0284e-f08c-47ab-c98a-08dec06fbb4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021|1580799027|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 0XQRrtMv9D2C4Nc4zgVGG3tCupm/FmLrLzj3eNHr9Ob3KzB8hM+bHfAVA7Ko7v60AHIlflJP6/cvp6cNs0ez+q0NC1t93z10A9vnizW5cYK9DMZGIkOIKpl7itfSMRB2Vlblw0DvLpHLFT36JEcyLXEl0eFBEclk1wwISRPjhc6DbmOYZV8WBUC2T5+40Wi9y2eomLZwCSsXRqmTEa+ToSCPjPXlROVomccWrL7D/0yw8slzaPe68ewlBPFzDkIx1gaT54qWZIWsSmGPxNOlIN+Dpvwr8qIxgMNR90rE+P0imuizxCjI9OWfW7ZRc+veQ1FSXYnUxXsCxByjt8g8uPGd91cm0E90a7IoTOEuYeJq5cM1Q0Zni9bzAWOWB58OdrOnRDBfX7ozQ4X7nLFZMT1D5ZF2lLAXVZ1Nbm1WWOjGLQEZXysmtEGSUYyLeFkNZy5SPpGRNQ/5skFc0lu2HTlACjJXOKvgJMa/TSQnIWL8v9Y9p5upUZazSOMtIXymzng8yWl0fY6wVTi/lcSqDW623JnuierLBbtI3ydXD94HAfeCVZgKK1TNKX+Rbgha6VdPyHYNK5MuqavhBkQvKbDniRBIkyPKPpWoLfi/JsKh/bWftrKWx0byGVzTwjpD5TGzytZxO5RQiibZlNJNXcd7I5bbZX0D7mJZjYIBzZIioctmg24x0N6KhsJMWAjDDcGmqDA0Jsv30ZxtxUrK4X9sr8VwaH1zx6xVu9hLNFI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021)(1580799027)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ejh4SXpBbnNUcEV5SkxhY1paNHYzcFowQjVTU0VnME4xUTVNaFNibngwQTBV?=
 =?gb2312?B?VkdCa0J1aTNhSlNWMW9iWGxPaXhVVkRoaGRLTVB6QWRKN1d5MjNvWVl2Qk5q?=
 =?gb2312?B?eU5kRDZpOFlPZTRZdGt0bDVRZllNNHZYRXZ1UzhuTUZ6T0dSMDMwYndyc1ZP?=
 =?gb2312?B?MHc4MnJpbUs3Yk5MS1cwb0dWd0pzM0EydXp3cFFvZHV4aXBTazdVQy9SRUFF?=
 =?gb2312?B?cEQ5Z2ZOWTZmUEJxT1BVM3duK1k3bzFQak1ESjJvbElJM2dYQnRTRVgwY2w5?=
 =?gb2312?B?R2l3RVdDOHZLRUZYOVF2My9vNEtCOHR1eDJVRkI1ekZwOUw0emsrS3lHa3FL?=
 =?gb2312?B?NlIycWU4QjBvbGN1YnFqK3F2WEQ1RS9rdy9mRDdoSjcwaWFwSjRMazVNRGJi?=
 =?gb2312?B?MFdtU0U2MlBXWW1yVVZ6WGFiYitqWi83RHFPWTdudFlqUXdteW85UThsemdH?=
 =?gb2312?B?WHlma0hPZWc3VzliQklFRlVLanRCNVd3MWQ5bVBBQURlcjJTSzhkUUliSXJT?=
 =?gb2312?B?N3M0ZUYvVXQ1MjhzM2lyOGd5QnRidXNIb2I0RTJ1ZGlFd2JoTTdac0FPbHJ6?=
 =?gb2312?B?Wi9yY3lwWUIyTmZNanVPa1pIN0JFcWxpVXhQTURDMDZFbmtZT0thTCtxSG9p?=
 =?gb2312?B?UlEzMkJUQ2V4UUlLVVVwYWt1WU91cnV4Yjg2UDFMUDdiRGZ6NTlXUGxGcmZu?=
 =?gb2312?B?MFg4TVBFd3Y0TFV3aTRsSE1NNkN2a29zdGFJWTVmcHAvSTZxV0dxRyt0WDc2?=
 =?gb2312?B?SjBDK1hla0NjenFOMktZQlJIU2FpMmMrSXllT3l6d1VrYXRXT0doVUJuTUtG?=
 =?gb2312?B?TTk0ZU90Vm44dDlxT1lETVowTndLT1MvRE5adStTQVJycVlMRjU4YnpRSjF3?=
 =?gb2312?B?cWRoYmJCQTZ3S0ZMSnJNVXYvWXBaYkV4RzRHanh3RjZ5Zkl0UStpajFTMnBK?=
 =?gb2312?B?RE01SlM2ZEdNSlluMzUwNHozbjlJaUo4NzE2bFEvNkdzRm1VaTc2c0xicUJx?=
 =?gb2312?B?RzkvMjBhZ2R0dGNveVZjNUFtbkRicmpJVDE0VFpwcld3SzQ2T2MrdzdlWWdn?=
 =?gb2312?B?UUNTTDU1WXFDN2FGdFlZeEtHM3p2em9neVo1NkVYTy83b3pqMEVGUi9TTzYx?=
 =?gb2312?B?RHpXVWFMdVFBeWZKQ21vam1tL0VwdFpqNEJxd09zTHVEM2FDUkQxcitKUlM4?=
 =?gb2312?B?SExiaExPM0kzakhsTnhPZWRQRzRvVjlJNEFaZkJncTRpaDFOU1dWRTFnNXRV?=
 =?gb2312?B?VzVWSzNOalJlVFk3UDNiMjhWdmoxY1ZGOTM3dWRmTmN0bzkxZDh3MVdibTR6?=
 =?gb2312?B?YUkyUGJNUFA5N1NqTGl3SmJPWTY2M1JjbXN4Rml6M3U0YzkwT3U1aktMcitl?=
 =?gb2312?B?aUs5VldyVll6NGxoVkFiYjMrTWNGRXV5K3JSUktReFR6dkNvN0ovdHNVaU9P?=
 =?gb2312?B?T1dqWkdiWkVEeGpRSHo1dTNqQXhNWFc5bjRRUWlocnFNZS85ZTE3RUtleGJB?=
 =?gb2312?B?bXZ0cXhrN3R0QlZjOERHbm1tM0NKT0lNUTBDQ1ZrdUd0Q0Y0eWxIZVZwdmlD?=
 =?gb2312?B?SU1RV1hNSkhPYWFiVyt1blB6V1JWSEhQYXR1cU91cU40OUk3U25HdmdaWWxj?=
 =?gb2312?B?SEcvRVRia1QyK1dHQnc0eWJ0dytSWTN6UDJtVmhGR3EzTGh5eGxQbSsxZXgx?=
 =?gb2312?B?MzFYRXh5VFMwNWdxa2VZMEM0V2xKQ0h0YnptZDc1dVd4Yys3bXcrM2dGWDdQ?=
 =?gb2312?B?aHI3dWF1bzJWWjFVZHhZMlZMUzVCUEdoRGdYWVM0S1pnOVNzS2NuQ3lwTndL?=
 =?gb2312?B?TUp4cFlVRmpORnkyTStPYmV3d2lSMTN2Zm91VlBSdHZvOGhwZDZ0cHdCb2V2?=
 =?gb2312?B?TFVqSkc2SU9mRE83aFhnUW5GYzdCd1VyOGh4SUVzRVREc0Jxc2l1blNpTnRx?=
 =?gb2312?B?QnpuR1VEQmpoY0VpbkduSEFUWkt4aStKcWpUaUpLZWZaMjAvM3Vab24yLzJV?=
 =?gb2312?B?dmgrOGZmaDh2b2hBSnA4ZlFOb01VNW82RmdLRHUwWUdUQWlxaWlJRCthSnJI?=
 =?gb2312?B?ZWVIVVhsVi81bSt4QTM2Yzk2TDlOWVFOelJIYnp5djdzeWc3eTlKaTZQQmpz?=
 =?gb2312?B?cjVmZVE1YU1VRXRkWm5lT0lTZFJra0g5dENTSzRlc0MwWW5EY3N0UGlqQVpC?=
 =?gb2312?B?dDI4Y1lYZzVHdURTMTdvTUR1ODVhaXFLdU91Nkl2ZUJmV1Nlb2dCRlMwOGtW?=
 =?gb2312?B?RmluVUJCWC9BK0MxWUFaWExTK3ZEa3FxMDFqSDM2bEpNMGVpb2wrOHgzVkRG?=
 =?gb2312?B?WXdDQng2S3JZdE8wZXNHZUJxbmZScmRnbVVEMzNBcTRyUW1tUzlvdz09?=
Content-Type: multipart/alternative;
	boundary="_000_OSZPR01MB786818BB11890BF4B03484A28B122OSZPR01MB7868jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	M4G/Jl1r/dZrWoi0xldYtV71sRsSGsqNvQiZT/ZrDixCxrEwIH7tVs5JmTcgfelRp/rvO/vckavClR5atz+bIuLMPJJkfsFenlRWT8/g+hVmCLob6AtzqiWc9kMsBhfJU5Ef8zSaFhQki/3vA6BBFHH+XotHweLermGpIfj8nVaCmrtHKZsnVtK+oA6Hr2sZF2zcSZ5s/ncwASUsjNtasYkgpwcdF+h6xFft1E64qV8fFR7Tk8EjAN4HVff1S9CFd/xdQ4M8EeMbvn9XLRqJhG4XLZCaxV9mcOBnJSjyhHNJ9/L1TZiZUIeHsMXQHhbp6Fc2GO3PWkYB+55oxbzcDg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b0284e-f08c-47ab-c98a-08dec06fbb4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 06:25:24.8988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KC/ECk8HBwhmbAfLE+V3/yubGm3iORYFLJU2X+zUqt/iEMIIRaj0j3O7QKE2FQPB0CEXM5UzTmrszQP248GDymUG0q4/83ZR7isvBaKNf3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17870
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237999

--_000_OSZPR01MB786818BB11890BF4B03484A28B122OSZPR01MB7868jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KICAgSSBhbHNvIHJlZmVyIHRoZSBzb2x1dGlvbiBvZiBmZWRvcmENCiAgaHR0
cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvZm9yay92b25kcnVjaC9ycG1zL3ZpbS9ibG9iL2Y0
MC9mL3ZpbS5zcGVjDQoNCiAgMS4NClZpbS1taW5pbWFsKHZpbS10aW55KSBkZXBlbmRzIG9uIHZp
bS1kYXRhLg0KDQoNCiAgICAgICAgMi52aW0tZGF0YSBwcm92aWRlcyBkZWZhdWx0cy52aW0gZmls
ZQ0KDQpaaGVuZw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogWmhl
bmcsIFJ1b3Fpbi/WoyDI9MfVIDx6aGVuZ3JxLmZuc3RAZnVqaXRzdS5jb20+DQpTZW50OiBUdWVz
ZGF5LCBKdW5lIDIsIDIwMjYgOTo1NA0KVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHZpbS10aW55OiBidWdmaXggbGFjayBvZiBkZWZhdWx0
cy52aW0NCg0KSGkgUmljaGFyZA0KICAgSSBhbHNvIHJlZmVyIHRoZSBzb2x1dGlvbiBvZiB1YnVu
dHUNCg0KICAxLiBJbiB1YnVudHUsIHZpbS50aW55IGRlcGVuZHMgb24gdmltLWNvbW1vbg0KaHR0
cHM6Ly9wYWNrYWdlcy51YnVudHUuY29tL2VuL25vYmxlL3ZpbS10aW55DQoNCjIuIEluIHZpbS1j
b21tb24sIGl0IGluY2x1ZGVzIHZpbXJjIG5lZWRlZCBieSB2aW0udGlueS4NCmh0dHBzOi8vcGFj
a2FnZXMudWJ1bnR1LmNvbS9lbi9ub2JsZS9hbGwvdmltLWNvbW1vbi9maWxlbGlzdA0KDQogMy4g
RGlzY3Vzc2lvbiBhYm91dCB0aGlzIGlzc3VlIG9mIHVidW50dQ0KICAgaHR0cHM6Ly9saXN0cy5z
bmFwY3JhZnQuaW8vYXJjaGl2ZXMvZm91bmRhdGlvbnMtYnVncy8yMDIyLUFwcmlsLzQ3MjgzMC5o
dG1sDQoNCiBTbyBJIHRoaW5rIGFkZCB2aW0tY29tbW9uIGFzIFJERVBFTkRTIG9mICB2aW0udGlu
eSBpcyBhbHNvIGEgcmVhc29uYWJsZSBzb2x1dGlvbi4NCg0KWmhlbmcNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IG9u
IGJlaGFsZiBvZiB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emhlbmdy
cS5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTZW50OiBNb25kYXks
IEp1bmUgMSwgMjAyNiAxMDowNA0KVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6
IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHZpbS10aW55OiBidWdmaXggbGFjayBvZiBkZWZhdWx0cy52
aW0NCg0KSGkgUmljaGFyZA0KDQogICBUbyBmaXggdGhpcyBpc3N1ZSwgSSBhbHNvIGhhdmUgYW5v
dGhlciBtZXRob2QuIFRvIHRvdWNoIGVtcHR5IC52aW1yYyB0byBhdm9pZCAiRmFpbGVkIHRvIHNv
dXJjZSBkZWZhdWx0cy52aW0iIGVycm9yDQoNCiAgIEFuZCB0aGUgcGF0Y2ggd2lsbCBsaWtlIHRo
aXMNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5iYg0KaW5kZXggZTRjMjZk
MjNmNi4uMzNjYzQ4MTI3MSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92
aW0tdGlueV85LjIuYmINCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85
LjIuYmINCkBAIC02LDYgKzYsMTUgQEAgUEFDS0FHRUNPTkZJRyArPSAidGlueSINCg0KIGRvX2lu
c3RhbGwoKSB7DQogICAgIGluc3RhbGwgLUQgLW0gMDc1NSAke1N9L3NyYy92aW0gJHtEfS8ke2Jp
bmRpcn0vdmltLnRpbnkNCisNCisgICAgIyBBZGQgIi52aW1yYyIgZmlsZSB0byBhdm9pZCAiRmFp
bGVkIHRvIHNvdXJjZSBkZWZhdWx0cy52aW0iIGVycm9yDQorICAgICMgRm9yIHJvb3QgdXNlcg0K
KyAgICB0b3VjaCAke0R9L3Jvb3QvLnZpbXJjDQorDQorICAgICMgRm9yIG5vbi1yb290IHVzZXIN
CisgICAgaW5zdGFsbCAtZCAke0R9L2V0Yy9za2VsDQorICAgIHRvdWNoICR7RH0vZXRjL3NrZWwv
LnZpbXJjDQorDQogfQ0KDQpJcyB0aGlzIG1ldGhvZCBPSz8NCg0KWmhlbmcNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KU2VudDogTW9uZGF5LCBKdW5lIDEsIDIwMjYgMToy
Ng0KVG86IFpoZW5nLCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGZ1aml0c3UuY29tPjsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hd
IHZpbS10aW55OiBidWdmaXggbGFjayBvZiBkZWZhdWx0cy52aW0NCg0KT24gVGh1LCAyMDI2LTA1
LTI4IGF0IDEwOjA2ICswODAwLCB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gV2hlbiB2aW0tdGlueSB3YXMgdXNlZCBpbiBpbWFnZSwgaXQgbGFja3MgZGVm
YXVsdHMudmltIGZpbGUgd2hpY2ggd2lsbCBjYXVzZSBmb2xsb3dpbmcgZXJyb3INCj4gcm9vdEBx
ZW11eDg2LTY0On4jIHZpDQo+IEUxMTg3OiBGYWlsZWQgdG8gc291cmNlIGRlZmF1bHRzLnZpbQ0K
PiBQcmVzcyBFTlRFUiBvciB0eXBlIGNvbW1hbmQgdG8gY29udGludWUNCj4NCj4gU28gYWRkIHZp
bS1jb21tb24gYXMgUkRFUEVORFMgdG8gcHJvdmlkZSBkZWZhdWx0cy52aW0gZmlsZSB0byBmaXgg
dGhpcyBpc3N1ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZu
c3RAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10
aW55XzkuMi5iYiB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4N
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85LjIuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJiDQo+IGluZGV4IGU0YzI2
ZDIzZjYuLmI2ZGRkZWQzODEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Zp
bS92aW0tdGlueV85LjIuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10
aW55XzkuMi5iYg0KPiBAQCAtOCw1ICs4LDcgQEAgZG9faW5zdGFsbCgpIHsNCj4gICAgICBpbnN0
YWxsIC1EIC1tIDA3NTUgJHtTfS9zcmMvdmltICR7RH0vJHtiaW5kaXJ9L3ZpbS50aW55DQo+ICB9
DQo+DQo+ICtSREVQRU5EUzoke1BOfSArPSAidmltLWNvbW1vbiINCj4gKw0KPiAgQUxURVJOQVRJ
VkVfUFJJT1JJVFkgPSAiOTAiDQo+ICBBTFRFUk5BVElWRV9UQVJHRVQgPSAiJHtiaW5kaXJ9L3Zp
bS50aW55Ig0KDQpEb2Vzbid0IGFkZGluZyBkZXBlbmRlbmNpZXMgbGlrZSB0aGlzIGRlZmVhdCB0
aGUgcG9pbnQgb2YgdmltLXRpbnkgaW4gdGhlIGZpcnN0IHBsYWNlPw0KDQpDYW4gd2UgY29uZmln
dXJlIHRoYXQgb3V0IGluc3RlYWQ/DQoNCkNoZWVycywNCg0KUmljaGFyZA0K

--_000_OSZPR01MB786818BB11890BF4B03484A28B122OSZPR01MB7868jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Richard<br>
&nbsp; &nbsp;I also refer the solution of fedora</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; <a href=3D"https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob=
/f40/f/vim.spec">
https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob/f40/f/vim.spec</a=
></div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">Vim-minimal(vim-tiny) <=
span style=3D"color: black;">
depends on vim-data.</span></div>
<div class=3D"elementToProof" role=3D"presentation" style=3D"color: black;"=
><br>
</div>
</li></ol>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black;">
&nbsp; &nbsp; &nbsp; &nbsp; 2.vim-data provides defaults.vim file</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Zheng</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5 &lt;zhengrq.fnst@fujits=
u.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, June 2, 2026 9:54<br>
<b>To:</b>&nbsp;Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults=
.vim</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<span style=3D"font-size: 12pt; background-color: rgb(255, 255, 255);">Hi <=
/span><span style=3D"font-size: 11pt; background-color: rgb(255, 255, 255);=
">Richard</span></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;I also refer the solution of ubuntu&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; 1. In ubuntu,&nbsp;vim.tiny depends on vim-common</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<a href=3D"https://packages.ubuntu.com/en/noble/vim-tiny" id=3D"OWA18273a14=
-a80a-29ce-3f9c-f4c4de6a20be" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">https://packages.ubuntu.com/en/noble/vim-tiny</a></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
2. In vim-common, it includes vimrc needed by vim.tiny.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<a href=3D"https://packages.ubuntu.com/en/noble/all/vim-common/filelist" id=
=3D"OWA79f69af0-bce7-407b-a309-6b03568fbbb9" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">https://packages.ubuntu.com/en/noble/all/vim-common/fil=
elist</a></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp;3. Discussion about this issue of ubuntu</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;<a href=3D"https://lists.snapcraft.io/archives/foundations-bug=
s/2022-April/472830.html" id=3D"OWA30ea76ed-c97d-a372-a510-ea4d8b5e2ad4" cl=
ass=3D"x_OWAAutoLink" data-auth=3D"NotApplicable">https://lists.snapcraft.i=
o/archives/foundations-bugs/2022-April/472830.html</a></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp;So I think add vim-common as RDEPENDS of &nbsp;vim.tiny is also a rea=
sonable solution.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: bla=
ck;">
Zheng</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded=
-core@lists.openembedded.org&gt; on behalf of zhengruoqin via lists.openemb=
edded.org &lt;zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Monday, June 1, 2026 10:04<br>
<b>To:</b>&nbsp;Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults=
.vim</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<span style=3D"font-size: 12pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Richard</span></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;To fix this issue, I also have another method. To touch empty =
.vimrc to avoid &quot;Failed to source defaults.vim&quot; error</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;And the patch will like this&nbsp;</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-suppor=
t/vim/vim-tiny_9.2.bb</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
index e4c26d23f6..33cc481271 100644</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
@@ -6,6 +6,15 @@ PACKAGECONFIG +=3D &quot;tiny&quot;</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
&nbsp;do_install() {</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny=
</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;# Add &quot;.vimrc&quot; file to avoid &quot;Failed to sourc=
e defaults.vim&quot; error</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;# For root user</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;touch ${D}/root/.vimrc</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+&nbsp;&nbsp; &nbsp;# For non-root user</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;install -d ${D}/etc/skel</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+ &nbsp;&nbsp;&nbsp;touch ${D}/etc/skel/.vimrc</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
+</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
&nbsp;}</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Is this method OK?</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; margin-left: 0px; font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Zheng</div>
<div style=3D"direction: ltr; margin-left: 40px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;=
<br>
<b>Sent:</b>&nbsp;Monday, June 1, 2026 1:26<br>
<b>To:</b>&nbsp;Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5 &lt;zhengrq.fnst@fujitsu.=
com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults=
.vim</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Thu, 2026-05-28 at 10:06=
 +0800, zhengruoqin via lists.openembedded.org wrote:<br>
&gt; When vim-tiny was used in image, it lacks defaults.vim file which will=
 cause following error<br>
&gt; root@qemux86-64:~# vi<br>
&gt; E1187: Failed to source defaults.vim<br>
&gt; Press ENTER or type command to continue<br>
&gt;<br>
&gt; So add vim-common as RDEPENDS to provide defaults.vim file to fix this=
 issue.<br>
&gt;<br>
&gt; Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++<br>
&gt; &nbsp;1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-s=
upport/vim/vim-tiny_9.2.bb<br>
&gt; index e4c26d23f6..b6ddded381 100644<br>
&gt; --- a/meta/recipes-support/vim/vim-tiny_9.2.bb<br>
&gt; +++ b/meta/recipes-support/vim/vim-tiny_9.2.bb<br>
&gt; @@ -8,5 +8,7 @@ do_install() {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; install -D -m 0755 ${S}/src/vim ${D}/${bindir=
}/vim.tiny<br>
&gt; &nbsp;}<br>
&gt; &nbsp;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;vim-common&quot;<br>
&gt; +<br>
&gt; &nbsp;ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
&gt; &nbsp;ALTERNATIVE_TARGET =3D &quot;${bindir}/vim.tiny&quot;<br>
<br>
Doesn't adding dependencies like this defeat the point of vim-tiny in the f=
irst place?<br>
<br>
Can we configure that out instead?<br>
<br>
Cheers,<br>
<br>
Richard</div>
</body>
</html>

--_000_OSZPR01MB786818BB11890BF4B03484A28B122OSZPR01MB7868jpnp_--

