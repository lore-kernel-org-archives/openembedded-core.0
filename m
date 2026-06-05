Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439A6CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 09:10:12 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4536.1780650610109340060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 02:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=MEEXTRn6;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.45, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pdj3DZfGcKLkPNGK34i6bUw01PTnZRc1Nd6SuTlGAssG/qCPA10aRTsYZIlBzdbeprcWM14jH7TvMc6tJMSqvmVeq2o01yh8ZAl+POeP56GK5v7nqYRWBqtwUbNb8GrNUc09nn54wpbzUm52VdG//FTcH4U5YuthI7jGOd55DiJFU0QBUEnJ4gzwSwPqGAKzk3fHP6FTHyMdIRrTmupHj/L+f9MxuRlLikg/babI0UxclAAgnnZ2897nJUd7rW0/ic9hiubZnMWuLFyOmPJ0PZgaUhlxb8Z74dSU/pHVS7Jpu/9Fon2vRX9QBQOdxLZiTidqsSEQM7KKvaE4qWB3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQdVaL5ZmdR7h7lXBlHONJ/yrRsfSmQV8COOS9Cj2bY=;
 b=HS34uU0IOtV5icqybK3Kba3NAlCQvswCCfCQINWQiv5ytVMbB3Ma8Oqw3BItNPCgp58daLxftRMI8WjwZX8MWiNKwJ8eOjZIc+iVg9bXyssZaDQh9n8vGGJNszUAvecag2OOy4wLy85cV2A4wkW6seL/+xJA6q+ELMWtwjjRVh0kvQS680ehwjWfwItTtxa0X+zFqpQVia30hzbsg/jXHhLgHg1xQBobRetL1MTP4BmtnXaiz2kd6sUhyoBuCqhLxftZXXUEmh4c2Iu+Op1Exa+IkY5LMIhNPZh39aZB1XqnPnnqihXQkQFyHBQ5MCeUZcGQBEWVz6h9lTH0jmL0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQdVaL5ZmdR7h7lXBlHONJ/yrRsfSmQV8COOS9Cj2bY=;
 b=MEEXTRn6FK57vqh26J9qquvZyF7LR8YZIEB2vDSbD3SFl2nVGZll7sqRA48egurGOJtO2JNBoBuzCOmboVW6ZCzS4EqsTse8fnM91u6mxnq15fENHvF9ChKF6Jb+taNP3GFmprBERe6gXtLZEbcI9TLhv5SgvMDWX7Es8H2hSOaLfprE8noE7kmKP0UViW9/Z3gH30fpXByajjx5Cu8KFIkLTjtDaInUPof15lp86N+8gp63P7mdXsXmmigwr29/bxDc8PcILDj2qwPBLBMjRV9VevOaFuVoaSC3pOHkqmATTc53oPxocDuhBqNUKFvanGiEWZvsF8PhaGwkq9XpjA==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by OS9PR01MB13962.jpnprd01.prod.outlook.com (2603:1096:604:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 09:10:01 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 09:10:01 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Paul Barker <paul@pbarker.dev>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Index: 
 AQHc8SKl2Ow8VA90V0GJMC5GDqATwbYo8yY5gAGHZM6AAFPB/oAAAiSigAI2roCAAqzLSQ==
Date: Fri, 5 Jun 2026 09:10:01 +0000
Message-ID: 
 <OSZPR01MB7868411D6D4D63F078935FF88B112@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
	 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
	 <18B4D2C3BE17A296.111707@lists.openembedded.org>
	 <OSZPR01MB7868A7D33A0E67FBB3E1043B8B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
	 <18B52F9167DFD20C.197704@lists.openembedded.org>
	 <OSZPR01MB786878B9AD82C7976F6C55278B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
 <0de79c158ed28c52741b9511b8da50a251572518.camel@pbarker.dev>
In-Reply-To: <0de79c158ed28c52741b9511b8da50a251572518.camel@pbarker.dev>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-05T09:10:01.108Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|OS9PR01MB13962:EE_
x-ms-office365-filtering-correlation-id: 45f558da-e0f5-4649-56e2-08dec2e23990
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700021|8096899003|13003099007|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info: 
 jO5hKUEmbKJruanw0KqQr2SeNEnT0eYwSojAiJpC5sJifvblKoDCh5BXHL5yfzBSttav6DEifQqpC1JSq/E2vdKnK/gyyJtNsaU56WQHpxC8K3y86atSK5vLkOHCAQ61JtTusMaD/Kv1rt5BurLpfeglJYeXinjBHqBPKQhARuFwkdVbF9mSNINIQDixgD22e6cYMapp2auJasyO5/dmdntGC89iVu9n/Hqg2S032nT8YxZ+mRgR1SH9TKoWpWjyrkTy0BvbyAPi5JJtT7lnA8E9hMCTuUofpkuxEgelJyliUau+OCK5o8Ou4OUTMeOy/fmi/c59ehkPks4Zs/e1iU5ALboc1ZCpj2kD84dKIZZS8MSOYxE4UfAVH1kK/QLVHpNpD7dzU3CZrLx+3ypQdukJyvQ3Dr9//XdOCp0Vq+Fzm06hFkdg7bsfqXIcswRie+sW/IsmBQw543LyxY0MTdFkjKVgDklYKBAHh2vZfxHjidGAifGH+MahsRV5Bas95Vmn+YCwqakS80atwy3SwOWQk9MDshme2tPkcG23A80Ss5VcYHjD09uUb2gGknljLXFp3Lx8gtw+9ak/QngS3qhQnjLQBVU1ORbSecwjZwlu5IWiGr7LEnjmZwV7EIxfSmL10Sme4EuhvNYvMbnA8YpC1B8hw1hYW3uujvpQsz6w3BE5Vo/JiWkrO72ZAjeudLdAMYEP9rFtthAUBp1DqCpqpbN5BY5DQqeBbX5bKr0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700021)(8096899003)(13003099007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Sk9Ec1pQSHRQa0MzbENkcEF6UnVHMDdPcksyb0piai94eGxncDVVaHJBakUy?=
 =?gb2312?B?R2k1SjJkbEI2Q0NjVnJwR09GTWZrQlFSTktqQlg0SmVuREtWME5RZ0kvL3dk?=
 =?gb2312?B?WDJqU0hXVlI5b2V4eTUzSllCcktMMmtJUEljRG50OFlNOHNlKzlVb0hMSWZl?=
 =?gb2312?B?L0F3TExLa0lRY1pSei9VRVJxSHNKaVcrL3psMm9mRDZUdmJ6Q2gxNTdCZzEy?=
 =?gb2312?B?ZklFdlNVaDlRa0hQQTB0Q2dBNm53Z3F0LytIQ2hpb1lsa3Z1SmpvdGx2MXc5?=
 =?gb2312?B?UW5uZXdtZ210Yi9NdjFML1psT3FRdlZVaTBkV0FWRURKZDVMUnJxWGkwTVpX?=
 =?gb2312?B?Z3I0VEsyWXg0RFBHbHhlbXpVdUhNQllDRnlnajdhV0VaRmhrL0o5akN4V3ZC?=
 =?gb2312?B?WVBsdUQrSXNlbnBGRnFvdUFwUWlXaGRYTG90SFA2VUwrb1Q1bzVmdWlWME9D?=
 =?gb2312?B?Nnp5RitXdGt1ZFEyUDZCZyszYXgyNTY4dEpTeTdveFNlWEREbWcxbW85VHcw?=
 =?gb2312?B?M1Q4MXNTclZ5UGJkTDB2WWxwenlRR1R3VTJOR2hobUJuRmdBb1hiV00wVUp2?=
 =?gb2312?B?TVBWLzR6MTFCRnlGNnU1RU1xajNjazBjZzBtclY2VGJ6NnBaN1NTUW54ZGdK?=
 =?gb2312?B?dCs2bEk3blZuOUtUWUVWOS9KZnh0cmU0bVRzS3JCdGlkUFVkLzR0YUJZaUpT?=
 =?gb2312?B?VXdPdjFXajhRcWZ1N3cxNzNCcmFLWW5tRHR2cmtCemdzV2lsWE5VZUZHNHJu?=
 =?gb2312?B?Rk9xeWY4VWJEMithblF6cGd0bW5QYUNtZlJrWmMwNGRPb2J5Ny9TbUZ5eE5n?=
 =?gb2312?B?TXpxdGk5QmV2VW9aRG9OUjJGTk9ocXBCcktMMmxWYndPL1BiY2xRSFZNMlR3?=
 =?gb2312?B?NHRuNFBUS0NTQVlzQXVaR29KbFhFdGtRTHUzS09Rb29ETkV2NXRQMTZVcVph?=
 =?gb2312?B?VlBXNWhDRFJyZzc4cGJLSVFieHRza0ZPcWVzZUEwR2ltTkMvaDB5bjZGcVB6?=
 =?gb2312?B?MGtwR3liRXQvOTdiWXNJU09CQ00wc0o2WVFiZlkxQmNLZ0JqY2duU0QxRjJt?=
 =?gb2312?B?bjVSd2lpOGhjVWtCeFBRYWdWdi9SRWtrMmoyZnRZQUM3dUJ1VE9aUkdOVEph?=
 =?gb2312?B?Q09Xa0Nyb081VVNKNFZvd2VsOURBZmQ4bW5LczJkd3BXczVxdFhvSXBkcVNL?=
 =?gb2312?B?TzhJa1RJazVpeGlzclRTckt6Z3V0dnRLT2x6cGtUNmMwbmEwNnMxamN0UGlp?=
 =?gb2312?B?RE5mKzdUVTQvM2l6QXYxS0N0ZmNZU2Q5QzJERWltUnQxdkdwYU4zQy94ZkpW?=
 =?gb2312?B?K2IvTjB2VStrbDc1MVg2aXI2WHcwcW1sK09lK2ppYmJWa0hkY2ZYS2ZwcU5t?=
 =?gb2312?B?a1Q3VS9aeC9TbDVYdHFnK29MNUhZN2c0WDMvNExEWUVCU1Q1dWFtaEdPZlp0?=
 =?gb2312?B?R3BURlZHRFhHZG1wcTJtZmh2OUdHbjdkbzVTNUlSS21sYVBGVzVhNDQ4cWFz?=
 =?gb2312?B?VUVrMVBYUkNtTVRETWQwQ0lRbjF4WlJweUhzUldRRzhxZWxsTW9iOWJjNXdw?=
 =?gb2312?B?Zm5SMXo1VWhYZUVTZEcwTDZzR05aa2YyR09MKzgxejNCR3BHRlRvbEFlVEty?=
 =?gb2312?B?QnpYRVhFQTlhb25nYUcraGF4aFYxYzNsZ2hFZUgzb3JMWExpMmVIWjBiTTF3?=
 =?gb2312?B?VllOdlp0OUFmQzFZalJST2Z1NFpodkc2QmlaN2JrbnM1b0dwbkdnQTY5eXVZ?=
 =?gb2312?B?aFI5TDh5NVU4Wm5EV2tYMDRyQ1l6c2RHKysraU1BTlBmQzRLeXZ2amxQaXlh?=
 =?gb2312?B?VXhYTitVeEJlU0VwNUVGWTVrYWVPTXpNVmI2aWlNSklTRHZZQXNLM20yZEk0?=
 =?gb2312?B?ZmtsSXBVUm0zeTRDT1dYR0laM1BwYW9xbytnNXg1dG5nMS9oS1BLUEJCZHVm?=
 =?gb2312?B?azczRC9uTVdFM3ZTNU15dEZmUXhjSzYrNXllNFFTN05WVTRuNFlwREw1SndM?=
 =?gb2312?B?eU1mMWVVcnFzTHVWNE9IZWRGV3dUZUZMUmIxVzZCbm1HKzBnSmJ2anduWnV5?=
 =?gb2312?B?dkNpRkwwaURmaXN0cXB5OTBxY3Y3d0Y3UThBRWRjTmw2b2ZnZnRXRjZqQ0Jw?=
 =?gb2312?B?YWpyK0dLQmplazFoazQ2TVNWWXl1SEZIaTBUTEUvd1NNTENnMDJKcEZmNW1Z?=
 =?gb2312?B?Ny8yN2ZKRTJIOFdNRUozcHc2VlNkV3AydmNHQzhNQ1pVaUJ1dldVUkVLZFdL?=
 =?gb2312?B?YWRHVUdtRXFBRmgrV3BHYmRENjFBZGR3RkpzQlRmTDFjWVRHNnY1blVSaHNa?=
 =?gb2312?B?ekxRakg5QjBUenk1MmdodzUzeVlabjRrVmJTOXJEeFVNWndNc0Vxdz09?=
Content-Type: multipart/alternative;
	boundary="_000_OSZPR01MB7868411D6D4D63F078935FF88B112OSZPR01MB7868jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	sLOGh9g7ykcJHqhtW1sKSIDEjfaWRJei8j8pudX2lvmTrlAI0d98xz9ARGgp6S2uUiwCNaYnodTeV0ybwT4QzFHedkB/ZAGG/6QG5u4BNhtoNtngNBrWTC/DQo1tULtP8q1HKYiZ877kbSoqKxb2JxPkCXEUqsWURX29oa0Q9mQ++XgnfVJhnPh5sy6/TsimejdCUnMqV2h2eVnI95pfzO4Dz4uAWUEByapmkJz7tL+Pnjlg/eevvtzYTtc21aRRB6/6ef1sinOSG4+ddS5nuIDRpdpEZyAcRzNkUCln+CSF6VC3kDkl9VzT8j+hJ1qFvdKFlY3rxAh6ag3BuZ71Fw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f558da-e0f5-4649-56e2-08dec2e23990
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 09:10:01.6187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hFjiIecveldrlWzBvy9yZX4xD+rN80g40KI23MHsdFY3Fa0rP/HRYvb+bNSXCD2nXz673ydLfFFh2uHoDHyqPvhtJMP3H3uuYlGuDHut5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13962
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238155

--_000_OSZPR01MB7868411D6D4D63F078935FF88B112OSZPR01MB7868jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUGF1bA0KDQpBcyB0aGF0IG9waW5pb24sIEkgd2lsbCB1c2UgdGhlIHBhdGNoIGZyb20gRGVi
aWFuL1VidW50dS4NCg0KWmhlbmcNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KRnJvbTogUGF1bCBCYXJrZXINClNlbnQ6IFRodXJzZGF5LCBKdW5lIDA0LCAyMDI2IDA6MTkN
ClRvOiBaaGVuZywgUnVvcWluL9ajIMj0x9U7IFJpY2hhcmQgUHVyZGllOyBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENI
XSB2aW0tdGlueTogYnVnZml4IGxhY2sgb2YgZGVmYXVsdHMudmltDQoNCk9uIFR1ZSwgMjAyNi0w
Ni0wMiBhdCAwNzowMiArMDAwMCwgemhlbmdydW9xaW4gdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPiBIaSBSaWNoYXJkDQo+DQo+IEluIHRoaXMgbWFpbCwgSSB3b3VsZCBsaWtl
IHRvIHN1bW1hcml6ZSB0aGUgc29sdXRpb25zIG9mIFVidW50dSBhbmQgRmVkb3JhIGZvciB0aGlz
IGlzc3VlLg0KPg0KPiBGZWRvcmEgOiBQdXQgZGVmYXVsdHMudmltIGZpbGUgaW4gUkRlcGVuZHMg
dmltLWRhdGEuDQo+IGh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL2Zvcmsvdm9uZHJ1Y2gv
cnBtcy92aW0vYmxvYi9mNDAvZi92aW0uc3BlYw0KDQpUaGF0IGxpbmsgaXMgdG8gYSBmb3JrLCBh
bmQgdG8gYW4gb2xkIHZlcnNpb24gZm9yIEZlZG9yYSA0MC4NCmh0dHBzOi8vc3JjLmZlZG9yYXBy
b2plY3Qub3JnL3JwbXMvdmltL2Jsb2IvcmF3aGlkZS9mL3ZpbS5zcGVjIGlzIGENCmJldHRlciBs
aW5rLg0KDQpUaGF0IGFzaWRlLCBGZWRvcmEgZG9lc24ndCBoYXZlIGEgdmltLXRpbnkgcGFja2Fn
ZSwgc28gd2hhdCB0aGV5IGRvIGlzDQppcnJlbGV2YW50Lg0KDQo+DQo+IFVidW50dTogTWFrZSBh
IHBhdGNoIHRvIHNraXAgInNvdXJjZV9kZWZhdWx0cyIgZXJyb3IuDQo+IGh0dHBzOi8vYXJjaGl2
ZS51YnVudHUuY29tL3VidW50dS9wb29sL21haW4vdi92aW0vdmltXzguMi4zOTk1LTF1YnVudHUy
LjMwLmRlYmlhbi50YXIueHoNCj4gUGF0Y2ggZmlsZTogcGF0Y2hlcy9kZWJpYW4vU3VwcG9ydC1z
b3VyY2luZy1hLXZpbXJjLnRpbnktd2hlbi1WaW0taXMtaW52b2tlZC1hcy12aS5wYXRjaA0KPiBN
b2RpZnkgZmlsZTogdmltLTguMi4zOTk1L3NyYy9tYWluLmMNCj4NCj4gVGhlICAicGFybXAtPnZp
X21vZGUiIGlzIFRSVUUsIHNvIHRoZSAiZW1zZyhlX2ZhaWxlZF90b19zb3VyY2VfZGVmYXVsdHMp
OyIgd2lsbCBiZSBza2lwcGVkLg0KPg0KPiAzMTk3ICNpZmRlZiBVU1JfRVhSQ19GSUxFMg0KPiAz
MTk4ICAgICAgICAgICAgICAgICAmJiBkb19zb3VyY2UoKGNoYXJfdSAqKVVTUl9FWFJDX0ZJTEUy
LCBGQUxTRSwNCj4gMzE5OSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRE9TT19OT05FLCBOVUxMKSA9PSBGQUlMDQo+IDMyMDAgI2VuZGlmDQo+
IDMyMDEgI2lmIGRlZmluZWQoU1lTX1RJTllSQ19GSUxFKSAmJiBkZWZpbmVkKFRJTllfVklNUkMp
DQo+IDMyMDIgICAgICAgICAgICAgICAgICYmICFwYXJtcC0+dmlfbW9kZQ0KPiAzMjAzICNlbmRp
Zg0KPiAzMjA0ICAgICAgICAgICAgICAgICAmJiAhaGFzX2Rhc2hfY19hcmcpDQo+IDMyMDUgICAg
ICAgICAgICAgew0KPiAzMjA2ICAgICAgICAgICAgICAgICAvLyBXaGVuIG5vIC52aW1yYyBmaWxl
IHdhcyBmb3VuZDogc291cmNlIGRlZmF1bHRzLnZpbS4NCj4gMzIwNyAgICAgICAgICAgICAgICAg
aWYgKGRvX3NvdXJjZSgoY2hhcl91ICopVklNX0RFRkFVTFRTX0ZJTEUsIEZBTFNFLCBET1NPX05P
TkUsDQo+IDMyMDggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBOVUxMKSA9PSBGQUlMKQ0KPiAzMjA5ICAgICAgICAgICAgICAg
ICAgICAgZW1zZyhlX2ZhaWxlZF90b19zb3VyY2VfZGVmYXVsdHMpOw0KPiAzMjEwICAgICAgICAg
ICAgIH0NCj4gMzIxMSAgICAgICAgIH0NCj4NCj4NCj4gSSB0aGluayB0aGUgRmVkb3JhJ3Mgc29s
dXRpb24gc2xpZ2h0bHkgc2ltcGxlciBhbmQgZWFzaWVyIHRvIG1haW50YWluLCB3aGlsZSBVYnVu
dHUncyBzb2x1dGlvbiBtYXkgcmVxdWlyZSBmdXJ0aGVyIG1haW50YWluaW5nIGZvciB0aGlzIHNw
ZWNpYWwgcGF0Y2guDQo+DQo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0Pw0KDQpJZiB3ZSBv
ZmZlciB2aW0tdGlueSwgaXQgc2hvdWxkIGFjdHVhbGx5IGJlIHRpbnkuIEJ1aWxkaW5nIHZpbS10
aW55DQpzaG91bGQgYWxzbyBub3QgZGVwZW5kIG9uIGJ1aWxkaW5nIHRoZSBmdWxsIHZpbSByZWNp
cGUuDQoNCldlIGNhbid0IHNoaXAgZGVmYXVsdHMudmltIGluIG11bHRpcGxlIHBhY2thZ2VzLCBh
bmQgc2hvdWxkIG5vdCBiZQ0KaW5zdGFsbGluZyBjb25maWd1cmF0aW9uIGZpbGVzIGludG8gdXNl
ciBob21lIGRpcmVjdG9yaWVzLiBTbyB0aGUgYmVzdA0Kc29sdXRpb24gcHJvYmFibHkgaXMgdG8g
Y29weSBvdmVyIHRoaXMgcGF0Y2ggZnJvbSBEZWJpYW4vVWJ1bnR1Lg0KDQpUaGFua3MsDQoNCi0t
DQpQYXVsIEJhcmtlcg0KDQo=

--_000_OSZPR01MB7868411D6D4D63F078935FF88B112OSZPR01MB7868jpnp_
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
Hi Paul<br>
<br>
As that opinion, I will use the patch from Debian/Ubuntu.<br>
<br>
Zheng</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Paul Barker<br>
<b>Sent:</b>&nbsp;Thursday, June 04, 2026 0:19<br>
<b>To:</b>&nbsp;Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5; Richard Purdie; openembe=
dded-core@lists.openembedded.org<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults=
.vim </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Tue, 2026-06-02 at 07:02 +0000, zhengruo=
qin via<br>
lists.openembedded.org wrote:<br>
&gt; Hi Richard<br>
&gt;<br>
&gt; In this mail, I would like to summarize the solutions of Ubuntu and Fe=
dora for this issue.<br>
&gt;<br>
&gt; Fedora : Put defaults.vim file in RDepends vim-data.<br>
&gt; <a href=3D"https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob/f=
40/f/vim.spec" id=3D"OWA89b1a1d3-947c-9799-a307-a5c2c2d222b0" class=3D"OWAA=
utoLink" data-auth=3D"NotApplicable">
https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob/f40/f/vim.spec</a=
><br>
<br>
That link is to a fork, and to an old version for Fedora 40.<br>
<a href=3D"https://src.fedoraproject.org/rpms/vim/blob/rawhide/f/vim.spec" =
id=3D"OWA2055f742-5463-05e6-181c-2851c8b15aa3" class=3D"OWAAutoLink" data-a=
uth=3D"NotApplicable">https://src.fedoraproject.org/rpms/vim/blob/rawhide/f=
/vim.spec</a>&nbsp;is a<br>
better link.<br>
<br>
That aside, Fedora doesn't have a vim-tiny package, so what they do is<br>
irrelevant.<br>
<br>
&gt;<br>
&gt; Ubuntu: Make a patch to skip &quot;source_defaults&quot; error.<br>
&gt; <a href=3D"https://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.2.3=
995-1ubuntu2.30.debian.tar.xz" id=3D"OWA0c113f68-6f0a-aa87-d454-a24cf43fe4d=
a" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.2.3995-1ubuntu2.30.=
debian.tar.xz</a><br>
&gt; Patch file: patches/debian/Support-sourcing-a-vimrc.tiny-when-Vim-is-i=
nvoked-as-vi.patch<br>
&gt; Modify file: vim-8.2.3995/src/main.c<br>
&gt;<br>
&gt; The&nbsp; &quot;parmp-&gt;vi_mode&quot; is TRUE, so the &quot;emsg(e_f=
ailed_to_source_defaults);&quot; will be skipped.<br>
&gt;<br>
&gt; 3197 #ifdef USR_EXRC_FILE2<br>
&gt; 3198&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; do_source((char_u *)USR_EXRC_FILE=
2, FALSE,<br>
&gt; 3199&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DOSO_NONE, NULL) =3D=3D FAIL<br>
&gt; 3200 #endif<br>
&gt; 3201 #if defined(SYS_TINYRC_FILE) &amp;&amp; defined(TINY_VIMRC)<br>
&gt; 3202&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !parmp-&gt;vi_mode<br>
&gt; 3203 #endif<br>
&gt; 3204&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !has_dash_c_arg)<br>
&gt; 3205&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; {<br>
&gt; 3206&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // When no .vimrc file was found: source def=
aults.vim.<br>
&gt; 3207&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (do_source((char_u *)VIM_DEFAULTS_FILE, F=
ALSE, DOSO_NONE,<br>
&gt; 3208&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; NULL) =3D=3D FAIL)<br>
&gt; 3209&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emsg(e_failed_to_sou=
rce_defaults);<br>
&gt; 3210&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; }<br>
&gt; 3211&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;<br>
&gt; I think the Fedora's solution slightly simpler and easier to maintain,=
 while Ubuntu's solution may require further maintaining for this special p=
atch.<br>
&gt;<br>
&gt; What do you think about it?<br>
<br>
If we offer vim-tiny, it should actually be tiny. Building vim-tiny<br>
should also not depend on building the full vim recipe.<br>
<br>
We can't ship defaults.vim in multiple packages, and should not be<br>
installing configuration files into user home directories. So the best<br>
solution probably is to copy over this patch from Debian/Ubuntu.<br>
<br>
Thanks,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</body>
</html>

--_000_OSZPR01MB7868411D6D4D63F078935FF88B112OSZPR01MB7868jpnp_--

