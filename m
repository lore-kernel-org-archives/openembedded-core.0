Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBF7CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 09:09:02 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4521.1780650535257854018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 02:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=r/YJb8A2;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.60, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1Qbp6hi8cCtlG4f9oL62F5ZZlTvGNRoC6TsYlkUqMmV1OESeRmOJw55LW4rT3/wWH1EMVH0d/UtM+lpMwlcrclKqMSHkdPQLleFlhnTFRsePRVurIBmhLObo2nE7H/EFqnQc5lEhS5e8oTBCl2rKmDxl8a31Au63trAj8S8+ua77l2UwitVL67OSQV/f2y2T1JAe58i2LAhS5EAMvcH+Ext9Egogki0m1QCHzXKZ8LK+AD4e5cLpQlVUgyutckttU0STCbAkLP8JPaG2HO4p4BV2QTH+DP+bhreGNx/XJFPtGMjOlsrbvFmU+37M3mjIuVsIY7QKEIP65wRNvEDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSxPNykagwT1N62/lXoXAr0NE5AjJvK/6YdMA4P4ENU=;
 b=Xcnwc5tokrc81vuSAg5x3teNV8NO912Ioz/h0wcL/ueHYtTlHZi/PsTmeoDNAo86XNhkzYWE/4HWC80QoFbwwdeiaO2QCrVOFIzI52T01//QWKKHPEKPm0+uly1sEQx7+nO/j0jelCNQJxYofS59ToODTSpTlYMogsysgnzsTIsOFRuUN+pGpDQO+Slf8JqKIMpDp58/UUrqaAnNcUvjZbnejZaiNtIhwrMjd8xQSN+JqRHifSLu54I2kG8ZlHYZe0brTgchHh1VYk3sK60JpT0p/lsE/y3m8+haz6HBmI4wd7/aHu4RiXs7Hg63CSofjUQMJFbIwYpIpPhejMECPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSxPNykagwT1N62/lXoXAr0NE5AjJvK/6YdMA4P4ENU=;
 b=r/YJb8A2pHlMKgebxYtQ9b2cK0fiVFjGhy4gB8LLp/UBcSIvNLlPs9heqCynnVLsoY5lFFvfNmHtuKAfM7Yl593fpG2PgeFIFpqD5t2RegDxh7I3QBmZ8yeXcoI5HeA7wDgU7z7ik7oBGDV+adQPzGG+YShQKtFND/TAV78L2kLyp7QZLi/cl2u8ewn/E4DLE2I0Nfduck86uvsQnGfeEIO3pGkKEeSfOxMaQsDExBxlms5dODpYUN5TC95CeSnQBP6R189PNv267odevTdU+8IBOMTBDtZF2RmHSdNdAoRwFuLeOWSwzts3Cx948+g37zeoyZGR34J5X6Sk6cfUWA==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by OS9PR01MB13962.jpnprd01.prod.outlook.com (2603:1096:604:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 09:08:50 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 09:08:50 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Paul Barker <paul@pbarker.dev>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Index: 
 AQHc8SKl2Ow8VA90V0GJMC5GDqATwbYo8yY5gAGHZM6AAFPB/oAAAiSigAI2roCAAqv5Pw==
Date: Fri, 5 Jun 2026 09:08:50 +0000
Message-ID: 
 <OSZPR01MB7868266587DF79FC73848FFC8B112@OSZPR01MB7868.jpnprd01.prod.outlook.com>
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
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-05T09:08:50.310Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|OS9PR01MB13962:EE_
x-ms-office365-filtering-correlation-id: 1a13df65-8a34-44fb-8eff-08dec2e20f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700021|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info: 
 O3+jmgZcl1Fd2BT3JmdsS1Z/LlHFgybwb7XuWxn/fNP4rsDL62FAN4O90QdgePLYj91tHf56w607ZHTPftqa2BcIZdO00T5DdDfws1X97cLOv8+CX8HGRe4OcRpzE6WsCubQFqCx218JnKBkO8WXG1iwGVJLyhXC07F47Rk71Vy45ZmeYxUw1Hn67yRe6llzzNohFheLnD3c4phViQc+7FXCE3dinKtKr1O8y1Nq/hNeui+zyv6CZ/AK0tmR0MvvOXQKU9DBaaCLLU7GzD1QmRvza4uk2FaJQv9id426LFme2h6W3R7t1hCuxNaswYtwcc9ca6idV/yc0X9dvsObjYsZKuKyX2mpb+Z544fN3w6IX3AEmBY/m/7yw7UYqw+7/OzEnQh+1dLnxQGzMh84u7YhG7f/YWIGQ6efL1Zm5M50eFo5r6cM3SRyXJa1LrLZswa0dRMP8VMkuLQzOB9HvLQsUZ3QxfjW6d0LcpF71BYGbF0gWfMhWmRntAbf2JMi1ayX+Q2+ZZRDIkZf1FfDqBnwiC917zLh2LFuHc/nqNC/gmITvrBVTKWwvDjkumUzgvT7qQbYQTSxFjxIhiWs/bO8yJvvA+76Cptx1Vti4DiGrk74gCxfClEMUw/4c9Vohlbb+jSjkc2VZPGgKyi86byC6xGJuJtLnMwTHgBthHjVSOrdjAeribM+uOAEEsgZV+aW7KuuvHotrHkBBxtD419YxTzqOo3/Q+jO3v3bPp1RvVkStqPtaE0x2qHXKUjYgCV8NNQ8EoO9ae78xlt/sYj3fadR7fg7coi/yNxl3zo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700021)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Z2FLd2hZb1lINUpzR2pFaWNGTFhZTlM4SnhrZHBjbHhXSnY1bWxmM2hoWjBK?=
 =?gb2312?B?QkE4blJOanBBRGxZT3NkUithQUkvd01sOU9WM0JEcDNQUnd0WXVZd2h4OGNw?=
 =?gb2312?B?L1llczFOY2hLaVRDYnR3OExWbVU2WEsveEFUbHUwNEswMlFWQVhpRE1KdWtS?=
 =?gb2312?B?aHJKVzFRdWFvSE91QmtyWkxicC81QkdQdUIxOHUwUkNBRUJuMnlvMFBPdGVQ?=
 =?gb2312?B?OW1CakJibU5MdHVMU2pURlZSQk5JSFlXY1hvVyt5WUZ1OHl5QTdqU1MrU09T?=
 =?gb2312?B?SlZ3YVFVMUpqVHVwdzlOUE5zN0FXNnBnZ002QTdiWGxOQ2NjM2pMOWRPNmxB?=
 =?gb2312?B?Ym5rQTdvY1JRUFdGZlF5eUtoM1Z4dHZIWTRZMUlXSXhGNU54OHBGUEpvNHVX?=
 =?gb2312?B?a0hTNHlMdEU3cGRIQzlZTmFqNjF3aFRlSXhjM3lGdElGRGpMdEhNN1VMZ3Br?=
 =?gb2312?B?eHN1MWpHOXIrUGdxRFNtbVpJWEJWdVZDUjFpQmVvSml0MFV1L2dBVmNXUjlh?=
 =?gb2312?B?VU9tZWFGKzhjaFZaWDcyYXcyRzY3N1krRDBTemtGRndURzFlOHhqTnVGRTdq?=
 =?gb2312?B?SnJWcnNsb0JzNndxK21qRWw5L0FQcWhaRkswV1p0aU1YMlJKcE5haUIrQTgv?=
 =?gb2312?B?SWxzK1p5bS9mTnk4ZndOZkh0N2oydFA1enZLVWF6VXRuUHRGWFpKVHJxMld3?=
 =?gb2312?B?WEJQeFQzbjcvMnExQ2QrS2VIcW1LMWhkSTZ6eVNPSzN1Q1JHL0o4dnI4S3JK?=
 =?gb2312?B?WkxlOURqSFRUNm4vOVZMK1BQVkRQSnR2cTk5Y1RuaWxmWUwzU1lUcFBJZ3Bq?=
 =?gb2312?B?dWtMOXVaODNxSG8rdm9aR1VYNi9SNkdBYWtnZ1JiSGVOWGtOZ1NFZ2FNRWtN?=
 =?gb2312?B?RmlrNm9HS0toUGtMeFFSNGNtaGdwSVVWN2crR0NxNFNsTGdxTlhvc0JBRG9F?=
 =?gb2312?B?WW9wTHR6RkpzVWZRQkw1TXE5WmRlNE85ODUrVGNIcm9UeFphaVgyNzU0Q0pp?=
 =?gb2312?B?S1pUL0h3RU52NW5yUVpQek5UbUxIem03TGNrM3c3WFFOWHlpWklwaVZ5RXZT?=
 =?gb2312?B?RnFYRjB2ZnBWa3RUWWZBTjd3eVRXY3M1Q1FPOW5jWG5NOG5ZODBNVHpjV1BI?=
 =?gb2312?B?YjBibFQvemducDU3TjJST28zc0NxSWZLRXM4UXptclhadDdQWXBmbDNpMDRW?=
 =?gb2312?B?TUFiRFU1UlpoS1hjb2I4dytGZUpqbmkwclBwWVBYcGNtaEk0UExsaUcrZVRv?=
 =?gb2312?B?V256bWFZd25qQ0Erd0FNOGlHS1lvYjZLYStmd0xCOVU5Z2ZrUzk4Q0RGVlYz?=
 =?gb2312?B?T1dSek9Xc2J3NWp1Z2t6QS93YS9tME5DWGdPYXFzcm5FenVnaTlxNFl0cW9B?=
 =?gb2312?B?V3BuR1ZwTFZ1dE1MSVc5N1loOG9CY1RjeXMrZDQwOUloMG9nd3kzcFk4QU9k?=
 =?gb2312?B?Y3ZiaXVOSXZEN3VUYmJvL3p2aHY3eE80UldkUTcvWHF2dHJGS0xyeTNVNmo4?=
 =?gb2312?B?bEFWZmtEVkpOZzVVYXhTV0hYZ3R2L0k3MHdOZHBGM01WdFEyOEd1VTJVWEtC?=
 =?gb2312?B?RjIxQWNLSkVOeWo5ZXh4K1pxSUFjTHc1ZGFUNFNyU2xRRVYyRzVVcjA2TXY3?=
 =?gb2312?B?dzQ3M3VnSlZyV3AwTWQvU3VDQ0hmTko2TEFDZ3ZwNHRHczVnSlZDeVZUa2Uz?=
 =?gb2312?B?N1R6V2xTQnYySmRRb1pHUjdHQzBOZTNpaTMrcHRIZ25yb1pON2RMcTh2d050?=
 =?gb2312?B?dlpDMUR0bFVWbXhGRlczOTgyN3B4RXB0RE5hZTBTS0FaQ3ozYngzVUZ5Zndy?=
 =?gb2312?B?UGsvMkx2MW94ZVpLNkI2ZXpKU01pZksyWTZRQzNVMDU0YnFRWWt5bmtvRnA4?=
 =?gb2312?B?amxGVGk4ZlJtWHZkR1ZscGZoMW43d3FsNE5teUgyNWRGRFhXR2wydkJpSk0r?=
 =?gb2312?B?TG1RMThNV2cxd29qOFNWbFBIZzlwR2RNZm9OcVZBMTU0bXZ3Q2toSlFqYmFB?=
 =?gb2312?B?ckRUSFp4a3dabHlwWFNobldEK1Zja1QyM0hnbDJpZUZ5a3pHWXpXMjFpcXBy?=
 =?gb2312?B?Znc0YnRwMUNxTC9wbUlIQzNWZ3hsNjlaUWsybmcvc2MyOGhxeGRyTjhyU1Ft?=
 =?gb2312?B?V3ROczI1b21Obm9BNk9GNXdJUjdmS2tTc0t6K3lNUnZkTXhvc0o1RHNXZGpa?=
 =?gb2312?B?a1dsNWdSdDlUMko2dlpBL21hVGpmUHZDaDhES0VsMTJHTFhXckpRWWhFZThw?=
 =?gb2312?B?RUM1OW5QVktRTCt6ZGMvR1huY2xVUDdxcUxBR09hTU4yd1VBZ3lXNWFyWmxC?=
 =?gb2312?B?MytTWERva2lNSmdxWlUxOW9wcDFYVXR5eUxKQlptZ1N5Ny9JcUtLdz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ZYMn16kOAcB/Pt6gHcqgek+j1buPSZoRafx/X6I9bBHnUNnotMIuIWk2GA4KRnNGffevcQO+q6ieVGFfC75gKAbCDp4e6W2V/r7lpB8Z4wHHZ2PxvWV5ajDectw7sC5RR4cMG135itOv0nCmWVRsVdLw2OwqyVBvx7SXtFP6PzG/alTlrv2KxCvxa6h1BpvC3RuTGZNcXaslbzfHDdGFejf4QIEyGIuZClj4BHWRwkWJQtb62gwvP9pQF98f4TD85+oBl4MU3vIaE0P8HQ/SO+bxiQM1PjMiFrCKne4FSuxzRK0qXF0ipH8jeRn+ouXxPx9Rv3eDOeF/q2vF0MUX1A==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a13df65-8a34-44fb-8eff-08dec2e20f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 09:08:50.7826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8VvYOJ6nwrvNmYGpC3Crrqfw1M5JjSTY05+qtly3qm0vqQZyr+kmFXo0tywu68ES3zowCl/C6F9ZHuWCvo77FgmaJ+izTc8flrr6lhZQf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13962
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 09:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238154

SGkgUGF1bCAKCkFzIHRoYXQgb3BpbmlvbiwgSSB3aWxsIHRoZSBwYXRjaCBmcm9tIERlYmlhbi9V
YnVudHUuCgpaaGVuZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZy
b206IFBhdWwgQmFya2VyClNlbnQ6IFRodXJzZGF5LCBKdW5lIDA0LCAyMDI2IDA6MTkKVG86IFpo
ZW5nLCBSdW9xaW4v1qMgyPTH1TsgUmljaGFyZCBQdXJkaWU7IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcKU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gdmltLXRp
bnk6IGJ1Z2ZpeCBsYWNrIG9mIGRlZmF1bHRzLnZpbQoKT24gVHVlLCAyMDI2LTA2LTAyIGF0IDA3
OjAyICswMDAwLCB6aGVuZ3J1b3FpbiB2aWEKbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToK
PiBIaSBSaWNoYXJkCj4KPiBJbiB0aGlzIG1haWwsIEkgd291bGQgbGlrZSB0byBzdW1tYXJpemUg
dGhlIHNvbHV0aW9ucyBvZiBVYnVudHUgYW5kIEZlZG9yYSBmb3IgdGhpcyBpc3N1ZS4KPgo+IEZl
ZG9yYSA6IFB1dCBkZWZhdWx0cy52aW0gZmlsZSBpbiBSRGVwZW5kcyB2aW0tZGF0YS4KPiBodHRw
czovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9mb3JrL3ZvbmRydWNoL3JwbXMvdmltL2Jsb2IvZjQw
L2YvdmltLnNwZWMKClRoYXQgbGluayBpcyB0byBhIGZvcmssIGFuZCB0byBhbiBvbGQgdmVyc2lv
biBmb3IgRmVkb3JhIDQwLgpodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL3ZpbS9i
bG9iL3Jhd2hpZGUvZi92aW0uc3BlYyBpcyBhCmJldHRlciBsaW5rLgoKVGhhdCBhc2lkZSwgRmVk
b3JhIGRvZXNuJ3QgaGF2ZSBhIHZpbS10aW55IHBhY2thZ2UsIHNvIHdoYXQgdGhleSBkbyBpcwpp
cnJlbGV2YW50LgoKPgo+IFVidW50dTogTWFrZSBhIHBhdGNoIHRvIHNraXAgInNvdXJjZV9kZWZh
dWx0cyIgZXJyb3IuCj4gaHR0cHM6Ly9hcmNoaXZlLnVidW50dS5jb20vdWJ1bnR1L3Bvb2wvbWFp
bi92L3ZpbS92aW1fOC4yLjM5OTUtMXVidW50dTIuMzAuZGViaWFuLnRhci54ego+IFBhdGNoIGZp
bGU6IHBhdGNoZXMvZGViaWFuL1N1cHBvcnQtc291cmNpbmctYS12aW1yYy50aW55LXdoZW4tVmlt
LWlzLWludm9rZWQtYXMtdmkucGF0Y2gKPiBNb2RpZnkgZmlsZTogdmltLTguMi4zOTk1L3NyYy9t
YWluLmMKPgo+IFRoZSAgInBhcm1wLT52aV9tb2RlIiBpcyBUUlVFLCBzbyB0aGUgImVtc2coZV9m
YWlsZWRfdG9fc291cmNlX2RlZmF1bHRzKTsiIHdpbGwgYmUgc2tpcHBlZC4KPgo+IDMxOTcgI2lm
ZGVmIFVTUl9FWFJDX0ZJTEUyCj4gMzE5OCAgICAgICAgICAgICAgICAgJiYgZG9fc291cmNlKChj
aGFyX3UgKilVU1JfRVhSQ19GSUxFMiwgRkFMU0UsCj4gMzE5OSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRE9TT19OT05FLCBOVUxMKSA9PSBG
QUlMCj4gMzIwMCAjZW5kaWYKPiAzMjAxICNpZiBkZWZpbmVkKFNZU19USU5ZUkNfRklMRSkgJiYg
ZGVmaW5lZChUSU5ZX1ZJTVJDKQo+IDMyMDIgICAgICAgICAgICAgICAgICYmICFwYXJtcC0+dmlf
bW9kZQo+IDMyMDMgI2VuZGlmCj4gMzIwNCAgICAgICAgICAgICAgICAgJiYgIWhhc19kYXNoX2Nf
YXJnKQo+IDMyMDUgICAgICAgICAgICAgewo+IDMyMDYgICAgICAgICAgICAgICAgIC8vIFdoZW4g
bm8gLnZpbXJjIGZpbGUgd2FzIGZvdW5kOiBzb3VyY2UgZGVmYXVsdHMudmltLgo+IDMyMDcgICAg
ICAgICAgICAgICAgIGlmIChkb19zb3VyY2UoKGNoYXJfdSAqKVZJTV9ERUZBVUxUU19GSUxFLCBG
QUxTRSwgRE9TT19OT05FLAo+IDMyMDggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKSA9PSBGQUlMKQo+IDMyMDkgICAg
ICAgICAgICAgICAgICAgICBlbXNnKGVfZmFpbGVkX3RvX3NvdXJjZV9kZWZhdWx0cyk7Cj4gMzIx
MCAgICAgICAgICAgICB9Cj4gMzIxMSAgICAgICAgIH0KPgo+Cj4gSSB0aGluayB0aGUgRmVkb3Jh
J3Mgc29sdXRpb24gc2xpZ2h0bHkgc2ltcGxlciBhbmQgZWFzaWVyIHRvIG1haW50YWluLCB3aGls
ZSBVYnVudHUncyBzb2x1dGlvbiBtYXkgcmVxdWlyZSBmdXJ0aGVyIG1haW50YWluaW5nIGZvciB0
aGlzIHNwZWNpYWwgcGF0Y2guCj4KPiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBpdD8KCklmIHdl
IG9mZmVyIHZpbS10aW55LCBpdCBzaG91bGQgYWN0dWFsbHkgYmUgdGlueS4gQnVpbGRpbmcgdmlt
LXRpbnkKc2hvdWxkIGFsc28gbm90IGRlcGVuZCBvbiBidWlsZGluZyB0aGUgZnVsbCB2aW0gcmVj
aXBlLgoKV2UgY2FuJ3Qgc2hpcCBkZWZhdWx0cy52aW0gaW4gbXVsdGlwbGUgcGFja2FnZXMsIGFu
ZCBzaG91bGQgbm90IGJlCmluc3RhbGxpbmcgY29uZmlndXJhdGlvbiBmaWxlcyBpbnRvIHVzZXIg
aG9tZSBkaXJlY3Rvcmllcy4gU28gdGhlIGJlc3QKc29sdXRpb24gcHJvYmFibHkgaXMgdG8gY29w
eSBvdmVyIHRoaXMgcGF0Y2ggZnJvbSBEZWJpYW4vVWJ1bnR1LgoKVGhhbmtzLAoKLS0KUGF1bCBC
YXJrZXIKCg==

