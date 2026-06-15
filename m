Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF4CCD8CA8
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 01:29:19 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.120675.1781486949990882836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 18:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=Xz2AMjpY;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.58, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dahkKAGuRicuM+r3tAhjq4QHTgV20Ep6MWQrq0ie9b5XR9Jw9d4AXLj0P11+r/8Xt20VGIm+6XNiycjNoH/rRhoREbaFR6oXqrp1EZ5DGY/c6e7x3+6dsgrTAM+n3V+hDdzl3O/s7a755mhVmfBex9lSIIG4UXT5MV45UlDkykfucXbGRFUeFgwJ/HRnx/6aao1lYi2AAmlSQWwEaQaGhI7aLutgTHHG/ct1vVhwZcXounMqqNi+BpRIgpbn7SvmPaEmm3w/oGgM1JfRyZ7cw50oPeX4rNINVAKYx6V0j4ofDYODYHjqa00KmsIM1//6jMHDFdI1L4fT8rZgdVrMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phdMRpZ35bCQxBm29PogeQpQxby45Uy60cgflsbB3os=;
 b=RP2UXkWLt0rECjWFTN4OJSVkritujFgT+4S8AI3eNaAc5v7+Y2Ed6ToHDbsb7zf4UzXl6GgVagY5Tn2nnBX6OOj20MRJ+CB7iMhr6cOZXe/MMRa3nWe5/WaHpUYsm5OM/oM1Mguf4KJCyYGFtOLx+t+3d24bc/GdfcqMB9egZmiECq/b0koVnli4bNcXoNOBuX4egUadf2xcUQD6+GsShLeD38ODzRsNXvoHKHPYX/FE3m0jb+XOXxR2i0+da+bjeABQ0/K6hXKR42gfZ/j8+0j3o2waFaYOasmLiXf6Imgu5u004EjQrXvm9BwG/H0iMYEHdJsEmNG/y/JK2yivUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phdMRpZ35bCQxBm29PogeQpQxby45Uy60cgflsbB3os=;
 b=Xz2AMjpYULntDXwOiGC/vWoL0/wBHmE3rz0ivu2nzD09ZzmXKKCwZvl8gtw6+DAJd/XS+FwogncIItpobHFOCIHv5keUcvp1HZkreTFpPgrKuJzWflbaC0KZbETEmUywEDCrbl0arCGcatZ3xhkV9MLNujyyjBg8ggpXpREV5lFidGgsngFv6WSpi8PmmNP/fiSpRZHKKbd0CSe6EHcSRd458jPmBHRKgHZ8G55I1xjjOkjxie4kzyXvXoq/DgKswTi9DTl2vxJj56HNtkitS39wt3ryPmxbngcGq3x6z6yigHq/Y5sqFqwqM26NFwI916PcySe5W2mng/KV/+JN7g==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by TY7PR01MB13681.jpnprd01.prod.outlook.com (2603:1096:405:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Mon, 15 Jun
 2026 01:29:04 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 01:29:04 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
Thread-Index: AQHc9mgfEo0MzaVVeUaQ71Kp4cK247Y+3oJw
Date: Mon, 15 Jun 2026 01:29:04 +0000
Message-ID: 
 <OSZPR01MB7868612587B639A0A53174378BE62@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
 <b2edbe057c6569a2260c5dc4ae4d8b8199c57f83.camel@pbarker.dev>
In-Reply-To: <b2edbe057c6569a2260c5dc4ae4d8b8199c57f83.camel@pbarker.dev>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-15T01:29:03.646Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|TY7PR01MB13681:EE_
x-ms-office365-filtering-correlation-id: b5b10e52-8bc6-408b-c274-08deca7d7c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|22082099003|18002099003|6133799003|11063799006|5023799004|56012099006|4143699003|1580799027;
x-microsoft-antispam-message-info: 
 0VXShl0CLTN2RpEGNyI/tyS4fqZZ9zueRx7SxApXnsIlLny3G3BJPBz8J/oM9KeAXs2xiKFCQHfEgBtloq/QJUyz1VyiJ7pRMdkdfIkM6rL8RIKlQqc8i3pK93quZrfXqs0TEI4HFJ3CpNKoV3boIPLffBNA369uGhhRE4NPUoJaDH0hcmh/XSQw3c1AFeyvhVSnmcmLEJUuIFJ6HRGXDooJK5Pszyn8o+EQnc8trrnfO1TJh46U8Zt+2NAuxdtFuDnOZB0FcxoW3Kk61tJavO/56RPjHVXhv9NwFkIRz14mTWy0PqqnoRFODdq1kWgMTpTG/3fZshKIkTXaaT/l5hGKbduTPTc9HRkCvJiXGWdI9hqsAZl2Zfywrmd1PxljaNIi9fas3xbghRtXsXH7sASQad1DXRahVYSB+Mgp/Dnk/pLmXmNzHEIF8wuT837mauNmohiRC2PE9A7Rg1Dd9Rh/0LzRC1IWTl5HX9BZKh93LsPOjNWxP0JIdag37KYH4jvE2RWum0fcK7kMRFYtrB3cZmO3ndZBq6Ap1npxJ0HVC1WVp2TNmnNIHDkO7IbLhxKqHYU93UcwCm4B0MrPiurKPgoX/NgwaJ+Zm966CuXzf4ki4daDdIZPD7/xhqo9/1Mxyy0yC8YV+Ci2kV0P5it5Xhq/EE6YUiJbwVfF240kv4ys7co2tBkXPfjUY7OYbENiCHHEWg0pve1gjMOuWOKXNniyUMJQ9moVM+BaR1FOMGcCvZX+Z2GqGBv8Yf4Uv52CwkGfyl+gSiXZ6DxX/HLDruUT1Cn07y1cSHqBbeA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(6133799003)(11063799006)(5023799004)(56012099006)(4143699003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?c2NLcEZPOG5Hb3o5ejdEY3BYb0tneTIxZldZaE9SNUlFUkN4M0hxOE95M05k?=
 =?gb2312?B?U1VkWTFsQ2VLS0tiblRZRlk5QWl0OTJYV1hvOEk3OUtHTjJHdTA4UExQVmpK?=
 =?gb2312?B?YXlsTDd6aFNEblYwaHBwTHAzS1BxOElwU0hUU2JpckZwVUI0WDNaM1hTRitF?=
 =?gb2312?B?aCtyekRrQm4zVU1FQWNXMXd6L1c5Qk1peldLVWFiUlRSblhrcm9wdWpjMlM3?=
 =?gb2312?B?a2FNUUhvaGVnOUNHZCtWSkxBRUF1dVlFMGNVdE1uU3FhMVdtenowZi9iNldL?=
 =?gb2312?B?UFpyN0hmc3l2M3pqSUt5WE1ROW8zTGExbnJOa3NQNUo2WnJVQThjMEZYcEhF?=
 =?gb2312?B?eC83MkdDdE9BekJET3psclUrMkpKTGswdDZnak92RU5zMGxpOXZwdmZ0cUpD?=
 =?gb2312?B?U21WYThMM1pyZjgyWlNDTVdXTnRDMFVocjBncDBrak5ocnBOei9ITWswRkFI?=
 =?gb2312?B?VkpMN1dnbmd6TGFldEI0WFFkcHBhc2FTbTR0Qy9kRElVT01qOU9EdGpGbkh6?=
 =?gb2312?B?UmgvMVJaVm5WUXZIZVBzajlyK3dSSVB4U2xZSUl4dVBmS3FZQmdYZ3VWOHVP?=
 =?gb2312?B?VEIrOStCSUNKTjg0djVkSmg4TERBUG1UWFVPSU9aMWlhbHlUTTJUem9hM1NL?=
 =?gb2312?B?c0hGQTBmdE9VL0FrTjc2eTNhay9ubmFIZU13d0UzSC9pUEdvTU1Sd3J0K0JE?=
 =?gb2312?B?Vm1LMDYyVW9KZUd6UVkwekY1MDd1aG8vbmVueDlTalFzSTE4aG8xbXZwNmZl?=
 =?gb2312?B?c3puMGdPVFAzakFIakFFdXhNY1IybzJyM0tXS3VkMVRYWXR5Z0FOMXhPdmNR?=
 =?gb2312?B?K0JRR2VuRk1kWEZ3Y2liTE5zVi9sT3JaUTBWbnVjZUtkK2k3VjFreENrcVdj?=
 =?gb2312?B?a09JSFpldTh6T1hsT3dFdnppM3lHNWJIdDdtSGVUN01CQmszRTY2ZXlSQ3ZQ?=
 =?gb2312?B?Mkh5K0RKVlByZmNjelAyeVcxQ0hDQ3M0T0xYUHlUM3RBMXVaOGtGTWM0R3dC?=
 =?gb2312?B?Mk13bUgrWVI2MDVHNlRLNjBlQ2l6WkZkYzlQNjZXR0lpVk5MMWlXY0tiQVBI?=
 =?gb2312?B?czZLSUsyeDVaOUl2Nk9KUHRkS0VteWo5UnQxMmdmT2Zqa1I2RkEyaFhXZ3ds?=
 =?gb2312?B?Y0QvaXFaM1JmbHlzV2Fid2FZNmZ4M1FoMmV3eUJBZWFBQWdtaldhemNOd0hp?=
 =?gb2312?B?WjBYSEhOa0tNVEhPL0xYYVFFUlpURURUWkNKelhIc0N5Qnl3ejlBNmxCOXlK?=
 =?gb2312?B?Z3RkWTN4clpyeGFyampDWkxicS82SWpJMG1BWEx2MFlDa05PQmNiMHNlK1hH?=
 =?gb2312?B?Zno4ODd3VzkvOCt2RFFkc1BvTStNallxMXBsaEx5c1FMTEV6THhtMFlCYk9m?=
 =?gb2312?B?aFhKQ1NVUXpTdVZIYmtVQVRJMzRoZDFVblRFaTVEQ2twT2ZtVVVmUG80dHgy?=
 =?gb2312?B?Q1dUTkZkSGt3amVLSVhNRWVTM1JpTmVML2JhUnJsTlVMMGtBSzBEN09XREg5?=
 =?gb2312?B?TFJPV25TNUtTaGx5Zll4amwvRWRrTnlCVG5MOCtFMWdzU09pNHJXTkRtVUNq?=
 =?gb2312?B?R1J5bXZVNlZTclpPRVB0RTRlTlRrazVpK0dBTDVwQ0FrVzJVM2c0bnRiTGd0?=
 =?gb2312?B?KzhxZUdlSytJaGVLT0htRVdROFdWa0Y3OU5hL0JZNGorUk5NdVhWdzgrNUU3?=
 =?gb2312?B?ckpLV0NZVDdUMW1oVnhPb3JqYVU2Tk83NFNDNElNZmltamtReHlITVltdkJ5?=
 =?gb2312?B?R2pIeVJENTNrU2laa1RsUHc1ZFV5WEMwMkxuYXR4Skx6c0VSelZLUHpNK3FO?=
 =?gb2312?B?RjZXL2wrbzdRbngwbGtENExiT0M4RDZFWng3MWxRL1h2MVNRTlU0VllvMC9z?=
 =?gb2312?B?S04zT21PS3QwdDMzV2s0L1d6M2NLeXg0a2FnWjhROGRQdDhCTjdpNmU4YkZO?=
 =?gb2312?B?MUJIY2Ftb3lReTNMVXp6eHJ6Rm91eUZGZERwTTBudW8rOENOSkZQdW5qVmxC?=
 =?gb2312?B?NHc4Vm9oMFB2TEhzVkgyblcvSFgzMjgxMEZRbEFMMktLQU9yc0ppT3JjTzJt?=
 =?gb2312?B?djQ4ZytOS0FFK2VIMnZ4N1dXQUZmbkNjeE1laWk4b1orUXJ6RC85ZnhjTlV2?=
 =?gb2312?B?cG42Wlo5Rmp6cmtzbzFmY2VGSE93SUw4R3Y3VTg5dDFlejhoUU5VK2VyVzVV?=
 =?gb2312?B?RHJoRzV2dzNnMkFXSmpqUG5YTUt3eTlGcW5EK21BamE4YWpjQWZhWVlRRm9v?=
 =?gb2312?B?eUNpZHNMWEs2VWhjc1JEUUk4WTE4V2hMR3RNZzZPQ3EwU0Y2eG1wMSt1a1F1?=
 =?gb2312?B?T1hZdmV1TnNZRm44dXlKL1Z6NXRETW50M1o0aCtPOXQwRXBsSCsrQT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	HmfM/5tWIzR6HbZhx5HZOlPfwYG/vTj7TkkCAIzcQl6KxuOb6bjx7K6qoX1j55Zet+RqIFSmq8agHNTqZUhGU4enWKwSPMSnBBxxx97Lngpg3X9ZOLV5ryld3qLIzZkC9dmwP4a52HpaDZod9PberAfDsjyq5wlA3V+yD3h4A4Kww8hdVJk+IG34LlUMPuB3fSgrM9oRT/AtbwVnyJV/nDDLnkRmLRrARm50ejHApNO+UDShbjZVOsI00dTsGnbK8ww5M1adhrae6Za88D7VUpUkgU9Rni5zwYJcx0XcQ6Nkhk0K2X7nfr+D0kC2OHzhLrzWEv7JWvIjOIRU7gDnnQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b10e52-8bc6-408b-c274-08deca7d7c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 01:29:04.1880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7eHUHdx+5MNAmzSLOKO0EI2Z8/03vVZjebUMkMqnT2jq1r9fWyvjrJnmp/hR9EXiekc+a9pvDWHvwv9CwjmZwYStpKV8I4D9nb9Hgn/YFT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 01:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238800

SGkgUGF1bCAKICAgSSByZWZlciB0byB0aGUgRGViaWFuIHBhdGNoIGFuZCByZW1vdmUgU1lTX1RJ
TllSQ19GSUxFIHJlbGF0ZWQgY29kZSBhcyBJIHRoaW5rIHdlIGRvbid0IG5lZWQgdmltcmMudGlu
eSBmaWxlLgoKICAgSWYgdmltcmMudGlueSBpcyBuZWNlc3NhcnksIEkgd2lsbCBkaXJlY3RseSBp
bXBvcnQgdGhlIERlYmlhbiBwYXRjaCBhbmQgc2VuZCB2MyBwYXRjaC4KIApGcm9tIHpoZW5nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogUGF1bCBCYXJrZXIK
U2VudDogU3VuZGF5LCBKdW5lIDA3LCAyMDI2IDE4OjI2ClRvOiBaaGVuZywgUnVvcWluL9ajIMj0
x9U7IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKU3ViamVjdDogUmU6
IFtPRS1jb3JlXVtQQVRDSCB2Ml0gdmltLXRpbnk6IGJ1Z2ZpeCBsYWNrIG9mIGRlZmF1bHRzLnZp
bQoKT24gRnJpLCAyMDI2LTA2LTA1IGF0IDE4OjA3ICswODAwLCB6aGVuZ3J1b3FpbiB2aWEKbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBXaGVuIHZpbS10aW55IHdhcyB1c2VkIGluIGlt
YWdlLCBpdCBsYWNrcyBkZWZhdWx0cy52aW0gZmlsZSB3aGljaCB3aWxsIGNhdXNlIGZvbGxvd2lu
ZyBlcnJvcgo+IHJvb3RAcWVtdXg4Ni02NDp+IyB2aQo+IEUxMTg3OiBGYWlsZWQgdG8gc291cmNl
IGRlZmF1bHRzLnZpbQo+IFByZXNzIEVOVEVSIG9yIHR5cGUgY29tbWFuZCB0byBjb250aW51ZQo+
Cj4gU28gYWRkIGEgbmV3IHBhdGNoIHRvIGZpeCB0aGlzIGlzc3VlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAZnVqaXRzdS5jb20+Cj4gLS0tCj4gIC4uLmVf
ZGVmYXVsdHMtd2hlbi1WaW0taXMtaW52b2tlZC1hcy12aS5wYXRjaCB8IDYxICsrKysrKysrKysr
KysrKysrKysKPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS5pbmMgICAgICAgICAgICAg
IHwgIDMgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS9maWxlcy8wMDAxLXNraXAtc291cmNl
X2RlZmF1bHRzLXdoZW4tVmltLWlzLWludm9rZWQtYXMtdmkucGF0Y2gKPgo+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vZmlsZXMvMDAwMS1za2lwLXNvdXJjZV9kZWZhdWx0
cy13aGVuLVZpbS1pcy1pbnZva2VkLWFzLXZpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dmltL2ZpbGVzLzAwMDEtc2tpcC1zb3VyY2VfZGVmYXVsdHMtd2hlbi1WaW0taXMtaW52b2tlZC1h
cy12aS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uN2U3
YmZlMGE2ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0v
ZmlsZXMvMDAwMS1za2lwLXNvdXJjZV9kZWZhdWx0cy13aGVuLVZpbS1pcy1pbnZva2VkLWFzLXZp
LnBhdGNoCj4gQEAgLTAsMCArMSw2MSBAQAo+ICtGcm9tIDdkYWQ0NWY3NTFkNGFkYmVlNDgwMDA1
YTU1NDZiMzJhOTdmZGJmYjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFpoZW5n
IFJ1b3FpbiA8emhlbmdycS5mbnN0QGZ1aml0c3UuY29tPgo+ICtEYXRlOiBGcmksIDUgSnVuIDIw
MjYgMDk6MzQ6MTggKzAwMDAKPiArU3ViamVjdDpbUEFUQ0hdIFNraXAgc291cmNpbmcgZGVmYXVs
dHMudmltIHdoZW4gVmltIGlzIGludm9rZWQgYXMKPiArIHZpCj4gKwo+ICtUaGlzIGlzIHVzZWQg
b25seSBpbiB0aGUgdmltLXRpbnkgcGFja2FnZSB0byBza2lwICJzb3VyY2VfZGVmYXVsdHMiIGVy
cm9yCj4gKyBFMTE4NzogRmFpbGVkIHRvIHNvdXJjZSBkZWZhdWx0cy52aW0KPiArUHJlc3MgRU5U
RVIgb3IgdHlwZSBjb21tYW5kIHRvIGNvbnRpbnVlCj4gKwo+ICtVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQo+ICsKPiArU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVv
cWluIDx6aGVuZ3JxLmZuc3RAZnVqaXRzdS5jb20+CgpXaHkgbm90IGRpcmVjdGx5IGltcG9ydCB0
aGUgRGViaWFuIHBhdGNoPyBZb3UgY2FuIGZpbmQgaXQgYXQKICBodHRwczovL3NhbHNhLmRlYmlh
bi5vcmcvdmltLXRlYW0vdmltLy0vYmxvYi9kZWJpYW4vc2lkL2RlYmlhbi9wYXRjaGVzL2RlYmlh
bi9TdXBwb3J0LXNvdXJjaW5nLWEtdmltcmMudGlueS13aGVuLVZpbS1pcy1pbnZva2VkLWFzLXZp
LnBhdGNoP3JlZl90eXBlPWhlYWRzCgpCZXN0IHJlZ2FyZHMsCgotLQpQYXVsIEJhcmtlcgoK

