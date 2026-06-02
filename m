Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022C1CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 07:02:19 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19362.1780383730214200741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 00:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=OubraVft;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.29, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ck6TouhhU/adhXD5blYU4JsryHKe+Wll85ftaPQSPeJZKqiF0JZxn0cqfE9WdgDrUxguXgkdbEMdoH5eXqr1q8BmY6NxLRSDfBNYOeDGgAQiWpFFz3C4ZY19grbafWTgnsu4b+gOSThp+1PeQnLXsh0kfdNkWbZX/B1sIBooQ3RlRb351cqpCQacpT/Dmx4zdNudpUWjZSJZ6U8LpGj15BhRFFnPwX7YVXsISD/mFyOGK9/b4PXNYJSki4SwMfqQiJug2LkM3h9gbVTkT1+AVO6oJFjMwm7JH1m4kvVCysgYI6hp+eGMWpIetg79INVCYYPLKxQsmQRgLNGsTaJKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLgXFXlWUhcssfFtdhwO4oyN5Ih2BHlKuE1cZUOf78M=;
 b=i3rCWNi67ZDgb9cijisXAc7W9bFnxjEo5FaY3prryy1bc1015xNwwl2heoreRGzvujYX/IaMB2pq/ZdrZw5CVDzKjPmUunpfwEaxKzxXhbkpZnR2W6uN2us810vj11xvN4utiNaj9a4Tbrk5temVc6xEzLeo6pKfcZ9I+DKRuapYUU/7DH1uBFTyZNPOJ8DiS1thchyNR+BPhb7yH9F741q2SzEZStVM0yE2kaY1z/9XtHa6z84M5yYykLEn2XXeqS7bDPjwS4IUHgMkGgmMRzAcAltUYALMsIw251G1YdlJrCb1YYJpi3BHQEq/T1IErZCGwACvRVq1qjnuRz0KGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLgXFXlWUhcssfFtdhwO4oyN5Ih2BHlKuE1cZUOf78M=;
 b=OubraVft5XPuGIvQSpUuZRUCL9yqIKfazQPa7osOzDavLFW2J2gA+COs0crk/LUKU0VBmawmCuMFDKJgTzic46YNMhWQ7wVLnVJmzlVKEkY4D4lbSdnF7VOU67YghNPI0itVmoxu9Uci9LYlqL6+Dv2ohBCt2AsMGjZR82wnAryGiyaoEVIqZjRnkhs/nCzGydnPoyub8t45k75TjZiaFSAK+1SYq8Hz12rA5pEPpVfLyBRU93yReXF1Qj+WVaNElubFoWt9E/bcwrAp635gQsD1SBudNgG7Ag4787NumODcMPq3MvVt6KcmFgfmmsOjYQn0m1WdrHHQgzkCGulYkQ==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by OSCPR01MB12833.jpnprd01.prod.outlook.com (2603:1096:604:339::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 07:02:05 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 07:02:05 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Index: AQHc8SKl2Ow8VA90V0GJMC5GDqATwbYo8yY5gAGHZM6AAFPB/oAAAiSi
Date: Tue, 2 Jun 2026 07:02:05 +0000
Message-ID: 
 <OSZPR01MB786878B9AD82C7976F6C55278B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
 <18B4D2C3BE17A296.111707@lists.openembedded.org>
 <OSZPR01MB7868A7D33A0E67FBB3E1043B8B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
 <18B52F9167DFD20C.197704@lists.openembedded.org>
In-Reply-To: <18B52F9167DFD20C.197704@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-02T07:02:04.571Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|OSCPR01MB12833:EE_
x-ms-office365-filtering-correlation-id: 621f2c67-24d0-4d48-8d69-08dec074dae5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|1580799027|38070700021|8096899003|13003099007|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004|6133799003;
x-microsoft-antispam-message-info: 
 53qT3a28K0vRl7yiJvFeBawamIVv+jWfGC2qrvr7KQPy9KB3DliTNeMP80hhymJXCWtzplhfybb/plEKj5xtHSvGpAMZdJIzcW13cRdgp0Wwrex9EDjX3zSeqPwcx+HtZJSR2nNmH7pr/iEvETKkiqPSPyhGz5UCCXnAFed6FdbxEA6y2GNStWnMSt/YYTGO7zKvVEUDefR1jlTH183C9LkCs77RcgipGqWnKcRNgyayOHJQXUI3IiDDqKvHP+nG7r+8CwwuTslYejhS1XnRr3/6vBZosE3oNoNyuCe5in6usGAtJbqnL8Uz0ufzxzCy1+WTUbUo3XZT4JjZuEvfi+5uxzQjTT7VHzsuq8mS1V8bb8yeLYOEfHAcC8sC0HgfhQPOzHp/v/IZo21Mj7P6OZMOuLlOFVcTDyKKSl5qicE2zmoB7GeEmRM+mVF4szrI+7v4qXnFFfDaNbq0t/aNfzzXvfEgsGqY3zuRST2x0O5ws8aAo9/QP8zOTC0YNnQM/D6JspG36naQgUH15mckGRVbhUh746LBe8huQioM545CBx5L4r5S1KP9K5ayPtNzJZGs15VVJiq4q/YrDRiFVkWJGsOfLKXS8DVcVEqR9gR0aJUzrby8nIZeX/Zy+YY/lJ+T+MdJ01Kyj+t5nirqlrfvLAntBnr+v52UMiRqn1xpjZ+s4gHKB7SY6Ll2t+VSeVFKb1BxEQcCotiWqoRKqI0URoBRGXI550lc6Rgp5u0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(1580799027)(38070700021)(8096899003)(13003099007)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?UWN1Qmd0NXdxK2lVZ3lnRjlxWklBcnhCcWRHSmpIUGRINzMzSEVGcEVhak5F?=
 =?gb2312?B?WjZyMDVqM0dlbm4vQnBES0VDYzlNcVlyVk5PNUtkVUFSSzRhYm03Z2piN2hr?=
 =?gb2312?B?YTVwSXhmV1AyYVJoYVR2Tm9TZjdmZmEwNXRFOHJ3bmZOUHBpb0dZWVowd3pk?=
 =?gb2312?B?SVBlcEtDOGFSeTZOcFhDRjl0V1VIaW4rb0trbkxuTkZjNll1YlAwemNJcm8w?=
 =?gb2312?B?VW1oaHdoRnVmUFRuK2pRVVdaSksrT1o4dFcxTnM4OU4vM2NkOHVzSG9uQjlT?=
 =?gb2312?B?L1VlZnNHcTR6bVYrNXVFdUdqYThIVktuNm9XRzRMWW1HaExXd2xhcUVNZWFE?=
 =?gb2312?B?QndvaHc1Ni9NZEtVdHNiNjJiTTJ4aXpsNWczOVZ2VElZa1V0Q0tBcnk3MS9u?=
 =?gb2312?B?V3dPeVg1aThKQUVHRTQ4cTFTczRTeWNrNUludy9NclMvMWxhT0wyVE9sMFZi?=
 =?gb2312?B?amZIY2JXZXlBUnJXRDkxS2FKK05DUElYK0h4SW5aR0JpOGtla2ZkMDNXdDJr?=
 =?gb2312?B?Y3VzYlJIdEZ1RnJBUVFjVGVVNTBlVzZHUnJhRFk0U0FvaURwVkhRb3B3QjNo?=
 =?gb2312?B?NzBROGVHTkxVWlM4ZS8vcWhCM3BaQi9LVEtjK21TUVRlT2VxRlRmaDdGdUpt?=
 =?gb2312?B?RzZaWnRoL0N0YkdVOEpjRjJTd3BBbE1LT0FDejFOTU5xOGZBRHhjTjRDN3RO?=
 =?gb2312?B?NVh2WmNhTGNWTTh5RElVQ29XU0tnSjZwU1k0YXNOZVBYWTM2cE9Sckx5QmZZ?=
 =?gb2312?B?K3dBbVM0VDlkcGVpWTErbHkvZGsrK3ZYQ2tiUDM2b1BwNFdqZzJMd3JVbE81?=
 =?gb2312?B?NW5uS2JuUGpqa0xOWTdwdlBxSTBxT1RyU0d4a0lwS1ZzWWVoZ0xuaGpIZHp6?=
 =?gb2312?B?c216NDUzWnNiYXpkR1lmZ3BXRW5UZWNkNEx3V3hMZ3RqV3l0VzJiY1lwNVFl?=
 =?gb2312?B?UzEzWGNkSGtSUVdKSmhXdHFlN09qOFFDNloraG43YzgzOWk5T2trdW1DbVM2?=
 =?gb2312?B?eG5vVGZOVWEwbVZNVzJoVnN6MjJVeHN6RDBtYmpYTTBvTjBDdGVtQlROUTR6?=
 =?gb2312?B?SHZ5TUtCVllHV1A2V0ZtRjRGai91QXZZYWJDSkIrUjJoOFFnTFhnWCtHSVAw?=
 =?gb2312?B?b0ZPZ1gvVHNHazhxUzlQZnR1M1hvZXRES2ZrT1hmbC9obXhTQ3lTZytWcDhF?=
 =?gb2312?B?em01RkwreUg3YWgwZ1RsNmJHTGROVGhtRFp4NWdmUytJZ2p6QVIrdU9nVXA4?=
 =?gb2312?B?T29sMVhidnF2MU5mejBBUW9zS1YzdE5WYjNCQjlFR3pSYTNWMTdDWkJUcnc5?=
 =?gb2312?B?eWNpOGtscTMwWEJMTHdybURTWG5DM0treFhWaytXVWRNZVUrcEsrS3RLMzVQ?=
 =?gb2312?B?NXJYZkgxYlpuL0dUQTNzMUxDOEVwTnJMQm1HT0YxSHBiZUpFMzAySnlkRnZz?=
 =?gb2312?B?TEZBVzRhVTl1dzVlVTRzb2lnUnRyWEdMcEEzQWlWd3JLN3VxbVprNkJYalUw?=
 =?gb2312?B?QjAybTRVbnN5YWhwbmYzQmVBV3gybmtWWnV5VEgwVXdTQmo2TW9ROXhzcWdO?=
 =?gb2312?B?aFpKejEvKzJuVlR2VXBzMS9nWUVxczRHNHRyaDc5dThXZDdlU3dyeWk5OFdn?=
 =?gb2312?B?YnNSNkthdE13SXR3WEhnbXZZRDdYZFZMaGtFZnNYdlR0ZlFTb3pmYjhUTWJ4?=
 =?gb2312?B?TEw0SDJJQ3RGV1E3TVU0eG55NXBRVWFqUExPVEk5ZkQ3bThJTGVzOUhhMXJj?=
 =?gb2312?B?bEhPUmpCb0F4Mkc0bVduV2xBNjMwUTZkdm16TXBVaHNhalJwY1c2WDFFTXRL?=
 =?gb2312?B?M25FWWlmTGlselYwT3V2UDVOT2lXc3NwZDVPMFNwR05NZkdBWHBHZjhlc2ZQ?=
 =?gb2312?B?WnhWSG0wVU9LZVMrbStndWlIUEhDTjlvcSs1aFY2VUQvd1Jhc1JQd0hsaVJy?=
 =?gb2312?B?OXFhWnowYldjcEptWjFkR0pHUDFPNWxVcCtCbXI3S05iWFNQSGJmV0kycmVw?=
 =?gb2312?B?QVRKdGJ5Zk9UMUlhcW5XUk8zWDN6a3JaanpzZzc0M3NUeHJYU0V3dFVIbHIv?=
 =?gb2312?B?YW1SQjJZSEIvTlZzUjFlNmFZekwwMDhXRDhDcU40S3NWNzlWT2I0OHREMzc0?=
 =?gb2312?B?TkFlcHhBRjQ1OWRJY0JRWEVMMlVEa2lpc2lZd05TaHFUVXhpQXY1bGF4RWln?=
 =?gb2312?B?TTB3YTJqZU85a2x1RlR1d0NyYUU1WnQwUnZhelUvYmNQdHdpUEo1Q3IxWmY2?=
 =?gb2312?B?NHNuZnlmRWRLdjNrejlCbXBjTGtZdHNZN1o1czBMMGsyMmw3cjdUUTB6SVJS?=
 =?gb2312?B?YXQ3SC9RZ2ZJYkc2VFgvbDRRU0RDVUh3OXkvbVNTTlRDdFJRYzQ1QT09?=
Content-Type: multipart/alternative;
	boundary="_000_OSZPR01MB786878B9AD82C7976F6C55278B122OSZPR01MB7868jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	BfZlkhGtFbc/3sCRNBV1uI2M//A8S5rIpeeYKVqCBMHIj12pPyspQU/uad+BspvsNQP7hG2cEoD3OneUhCtkFh1f74SgKMKGG4NEKLicMK8mE7J7PGWDvUnhpPmvjz7o5oxk1CgvbNye36mXEVx0uHyM4x9FA9YBhdywKuip8HJw1VaVnlTqIvNR8IaoatkYfYkDSssy1vr20TUJpnsqhtBgLc+fy9R7ER6mfedgh3Efbd8bM1Z7N97SUyVm9o9O5qIUz9EhGpF4QHfY/M45Qm0KpCURH4OULStRLrT7SXOw8kQIvfO3nWReppblvit3CdH8mYt5RgX1CcslJBGwLQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621f2c67-24d0-4d48-8d69-08dec074dae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 07:02:05.3204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkUncUE32putjE6XUfuO8H+d5yRSdrptdGTN1YdwWqyenN0p7f4U/6nP07PD/MJdYh4tr7BSNDY7DvlaUtn34ljNT1HP7ur3VMQBUqm7+30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 07:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238009

--_000_OSZPR01MB786878B9AD82C7976F6C55278B122OSZPR01MB7868jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQpJbiB0aGlzIG1haWwsIEkgd291bGQgbGlrZSB0byBzdW1tYXJpemUgdGhl
IHNvbHV0aW9ucyBvZiBVYnVudHUgYW5kIEZlZG9yYSBmb3IgdGhpcyBpc3N1ZS4NCg0KRmVkb3Jh
IDogUHV0IGRlZmF1bHRzLnZpbSBmaWxlIGluIFJEZXBlbmRzIHZpbS1kYXRhLg0KaHR0cHM6Ly9z
cmMuZmVkb3JhcHJvamVjdC5vcmcvZm9yay92b25kcnVjaC9ycG1zL3ZpbS9ibG9iL2Y0MC9mL3Zp
bS5zcGVjDQoNClVidW50dTogTWFrZSBhIHBhdGNoIHRvIHNraXAgInNvdXJjZV9kZWZhdWx0cyIg
ZXJyb3IuDQpodHRwczovL2FyY2hpdmUudWJ1bnR1LmNvbS91YnVudHUvcG9vbC9tYWluL3Yvdmlt
L3ZpbV84LjIuMzk5NS0xdWJ1bnR1Mi4zMC5kZWJpYW4udGFyLnh6DQpQYXRjaCBmaWxlOiBwYXRj
aGVzL2RlYmlhbi9TdXBwb3J0LXNvdXJjaW5nLWEtdmltcmMudGlueS13aGVuLVZpbS1pcy1pbnZv
a2VkLWFzLXZpLnBhdGNoDQpNb2RpZnkgZmlsZTogdmltLTguMi4zOTk1L3NyYy9tYWluLmMNCg0K
VGhlICAicGFybXAtPnZpX21vZGUiIGlzIFRSVUUsIHNvIHRoZSAiZW1zZyhlX2ZhaWxlZF90b19z
b3VyY2VfZGVmYXVsdHMpOyIgd2lsbCBiZSBza2lwcGVkLg0KDQozMTk3ICNpZmRlZiBVU1JfRVhS
Q19GSUxFMg0KMzE5OCAgICAgICAgICAgICAgICAgJiYgZG9fc291cmNlKChjaGFyX3UgKilVU1Jf
RVhSQ19GSUxFMiwgRkFMU0UsDQozMTk5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBET1NPX05PTkUsIE5VTEwpID09IEZBSUwNCjMyMDAgI2Vu
ZGlmDQozMjAxICNpZiBkZWZpbmVkKFNZU19USU5ZUkNfRklMRSkgJiYgZGVmaW5lZChUSU5ZX1ZJ
TVJDKQ0KMzIwMiAgICAgICAgICAgICAgICAgJiYgIXBhcm1wLT52aV9tb2RlDQozMjAzICNlbmRp
Zg0KMzIwNCAgICAgICAgICAgICAgICAgJiYgIWhhc19kYXNoX2NfYXJnKQ0KMzIwNSAgICAgICAg
ICAgICB7DQozMjA2ICAgICAgICAgICAgICAgICAvLyBXaGVuIG5vIC52aW1yYyBmaWxlIHdhcyBm
b3VuZDogc291cmNlIGRlZmF1bHRzLnZpbS4NCjMyMDcgICAgICAgICAgICAgICAgIGlmIChkb19z
b3VyY2UoKGNoYXJfdSAqKVZJTV9ERUZBVUxUU19GSUxFLCBGQUxTRSwgRE9TT19OT05FLA0KMzIw
OCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwpID09IEZBSUwpDQozMjA5ICAgICAgICAgICAgICAgICAgICAgZW1zZyhl
X2ZhaWxlZF90b19zb3VyY2VfZGVmYXVsdHMpOw0KMzIxMCAgICAgICAgICAgICB9DQozMjExICAg
ICAgICAgfQ0KDQoNCkkgdGhpbmsgdGhlIEZlZG9yYSdzIHNvbHV0aW9uIHNsaWdodGx5IHNpbXBs
ZXIgYW5kIGVhc2llciB0byBtYWludGFpbiwgd2hpbGUgVWJ1bnR1J3Mgc29sdXRpb24gbWF5IHJl
cXVpcmUgZnVydGhlciBtYWludGFpbmluZyBmb3IgdGhpcyBzcGVjaWFsIHBhdGNoLg0KDQpXaGF0
IGRvIHlvdSB0aGluayBhYm91dCBpdD8NCg0KWmhlbmcNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IG9uIGJlaGFsZiBv
ZiB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emhlbmdycS5mbnN0PWZ1
aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTZW50OiBUdWVzZGF5LCBKdW5lIDIs
IDIwMjYgMTQ6MjUNClRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09F
LWNvcmVdW1BBVENIXSB2aW0tdGlueTogYnVnZml4IGxhY2sgb2YgZGVmYXVsdHMudmltDQoNCkhp
IFJpY2hhcmQNCiAgIEkgYWxzbyByZWZlciB0aGUgc29sdXRpb24gb2YgZmVkb3JhDQogIGh0dHBz
Oi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL2Zvcmsvdm9uZHJ1Y2gvcnBtcy92aW0vYmxvYi9mNDAv
Zi92aW0uc3BlYw0KDQogIDEuDQpWaW0tbWluaW1hbCh2aW0tdGlueSkgZGVwZW5kcyBvbiB2aW0t
ZGF0YS4NCg0KDQogICAgICAgIDIudmltLWRhdGEgcHJvdmlkZXMgZGVmYXVsdHMudmltIGZpbGUN
Cg0KWmhlbmcNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFpoZW5n
LCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGZ1aml0c3UuY29tPg0KU2VudDogVHVlc2Rh
eSwgSnVuZSAyLCAyMDI2IDk6NTQNClRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdW1BBVENIXSB2aW0tdGlueTogYnVnZml4IGxhY2sgb2YgZGVmYXVsdHMu
dmltDQoNCkhpIFJpY2hhcmQNCiAgIEkgYWxzbyByZWZlciB0aGUgc29sdXRpb24gb2YgdWJ1bnR1
DQoNCiAgMS4gSW4gdWJ1bnR1LCB2aW0udGlueSBkZXBlbmRzIG9uIHZpbS1jb21tb24NCmh0dHBz
Oi8vcGFja2FnZXMudWJ1bnR1LmNvbS9lbi9ub2JsZS92aW0tdGlueQ0KDQoyLiBJbiB2aW0tY29t
bW9uLCBpdCBpbmNsdWRlcyB2aW1yYyBuZWVkZWQgYnkgdmltLnRpbnkuDQpodHRwczovL3BhY2th
Z2VzLnVidW50dS5jb20vZW4vbm9ibGUvYWxsL3ZpbS1jb21tb24vZmlsZWxpc3QNCg0KIDMuIERp
c2N1c3Npb24gYWJvdXQgdGhpcyBpc3N1ZSBvZiB1YnVudHUNCiAgIGh0dHBzOi8vbGlzdHMuc25h
cGNyYWZ0LmlvL2FyY2hpdmVzL2ZvdW5kYXRpb25zLWJ1Z3MvMjAyMi1BcHJpbC80NzI4MzAuaHRt
bA0KDQogU28gSSB0aGluayBhZGQgdmltLWNvbW1vbiBhcyBSREVQRU5EUyBvZiAgdmltLnRpbnkg
aXMgYWxzbyBhIHJlYXNvbmFibGUgc29sdXRpb24uDQoNClpoZW5nDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBvbiBi
ZWhhbGYgb2YgemhlbmdydW9xaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHpoZW5ncnEu
Zm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU2VudDogTW9uZGF5LCBK
dW5lIDEsIDIwMjYgMTA6MDQNClRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBS
ZTogW09FLWNvcmVdW1BBVENIXSB2aW0tdGlueTogYnVnZml4IGxhY2sgb2YgZGVmYXVsdHMudmlt
DQoNCkhpIFJpY2hhcmQNCg0KICAgVG8gZml4IHRoaXMgaXNzdWUsIEkgYWxzbyBoYXZlIGFub3Ro
ZXIgbWV0aG9kLiBUbyB0b3VjaCBlbXB0eSAudmltcmMgdG8gYXZvaWQgIkZhaWxlZCB0byBzb3Vy
Y2UgZGVmYXVsdHMudmltIiBlcnJvcg0KDQogICBBbmQgdGhlIHBhdGNoIHdpbGwgbGlrZSB0aGlz
DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85LjIuYmINCmluZGV4IGU0YzI2ZDIz
ZjYuLjMzY2M0ODEyNzEgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmlt
LXRpbnlfOS4yLmJiDQorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4y
LmJiDQpAQCAtNiw2ICs2LDE1IEBAIFBBQ0tBR0VDT05GSUcgKz0gInRpbnkiDQoNCiBkb19pbnN0
YWxsKCkgew0KICAgICBpbnN0YWxsIC1EIC1tIDA3NTUgJHtTfS9zcmMvdmltICR7RH0vJHtiaW5k
aXJ9L3ZpbS50aW55DQorDQorICAgICMgQWRkICIudmltcmMiIGZpbGUgdG8gYXZvaWQgIkZhaWxl
ZCB0byBzb3VyY2UgZGVmYXVsdHMudmltIiBlcnJvcg0KKyAgICAjIEZvciByb290IHVzZXINCisg
ICAgdG91Y2ggJHtEfS9yb290Ly52aW1yYw0KKw0KKyAgICAjIEZvciBub24tcm9vdCB1c2VyDQor
ICAgIGluc3RhbGwgLWQgJHtEfS9ldGMvc2tlbA0KKyAgICB0b3VjaCAke0R9L2V0Yy9za2VsLy52
aW1yYw0KKw0KIH0NCg0KSXMgdGhpcyBtZXRob2QgT0s/DQoNClpoZW5nDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4NClNlbnQ6IE1vbmRheSwgSnVuZSAxLCAyMDI2IDE6MjYN
ClRvOiBaaGVuZywgUnVvcWluL9ajIMj0x9UgPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSB2
aW0tdGlueTogYnVnZml4IGxhY2sgb2YgZGVmYXVsdHMudmltDQoNCk9uIFRodSwgMjAyNi0wNS0y
OCBhdCAxMDowNiArMDgwMCwgemhlbmdydW9xaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
d3JvdGU6DQo+IFdoZW4gdmltLXRpbnkgd2FzIHVzZWQgaW4gaW1hZ2UsIGl0IGxhY2tzIGRlZmF1
bHRzLnZpbSBmaWxlIHdoaWNoIHdpbGwgY2F1c2UgZm9sbG93aW5nIGVycm9yDQo+IHJvb3RAcWVt
dXg4Ni02NDp+IyB2aQ0KPiBFMTE4NzogRmFpbGVkIHRvIHNvdXJjZSBkZWZhdWx0cy52aW0NCj4g
UHJlc3MgRU5URVIgb3IgdHlwZSBjb21tYW5kIHRvIGNvbnRpbnVlDQo+DQo+IFNvIGFkZCB2aW0t
Y29tbW9uIGFzIFJERVBFTkRTIHRvIHByb3ZpZGUgZGVmYXVsdHMudmltIGZpbGUgdG8gZml4IHRo
aXMgaXNzdWUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0
QGZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlu
eV85LjIuYmIgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+DQo+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5iYg0KPiBpbmRleCBlNGMyNmQy
M2Y2Li5iNmRkZGVkMzgxIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0v
dmltLXRpbnlfOS4yLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlu
eV85LjIuYmINCj4gQEAgLTgsNSArOCw3IEBAIGRvX2luc3RhbGwoKSB7DQo+ICAgICAgaW5zdGFs
bCAtRCAtbSAwNzU1ICR7U30vc3JjL3ZpbSAke0R9LyR7YmluZGlyfS92aW0udGlueQ0KPiAgfQ0K
Pg0KPiArUkRFUEVORFM6JHtQTn0gKz0gInZpbS1jb21tb24iDQo+ICsNCj4gIEFMVEVSTkFUSVZF
X1BSSU9SSVRZID0gIjkwIg0KPiAgQUxURVJOQVRJVkVfVEFSR0VUID0gIiR7YmluZGlyfS92aW0u
dGlueSINCg0KRG9lc24ndCBhZGRpbmcgZGVwZW5kZW5jaWVzIGxpa2UgdGhpcyBkZWZlYXQgdGhl
IHBvaW50IG9mIHZpbS10aW55IGluIHRoZSBmaXJzdCBwbGFjZT8NCg0KQ2FuIHdlIGNvbmZpZ3Vy
ZSB0aGF0IG91dCBpbnN0ZWFkPw0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

--_000_OSZPR01MB786878B9AD82C7976F6C55278B122OSZPR01MB7868jpnp_
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
Hi Richard</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
In this mail, I would like to summarize the solutions of Ubuntu and Fedora =
for this issue.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;">
<span style=3D"color: rgb(0, 0, 0);"><b>Fedora </b>: Put </span><span style=
=3D"color: black;">defaults.vim file in RDepends vim-data.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob/f40/f/=
vim.spec" id=3D"OWAd0a474bb-28a2-6c4e-cf3d-6accd53178bb" class=3D"OWAAutoLi=
nk" data-auth=3D"NotApplicable">https://src.fedoraproject.org/fork/vondruch=
/rpms/vim/blob/f40/f/vim.spec</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Ubuntu</b>: Make a patch to skip &quot;source_defaults&quot; error.</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://archive.ubuntu.com/ubuntu/pool/main/v/vim/vim_8.2.3995-1=
ubuntu2.30.debian.tar.xz">https://archive.ubuntu.com/ubuntu/pool/main/v/vim=
/vim_8.2.3995-1ubuntu2.30.debian.tar.xz</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Patch file: patches/debian/Support-sourcing-a-vimrc.tiny-when-Vim-is-invoke=
d-as-vi.patch</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Modify file: vim-8.2.3995/src/main.c</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;">
<span style=3D"color: rgb(0, 0, 0);">The&nbsp; &quot;</span><span style=3D"=
color: rgb(200, 38, 19);">parmp-&gt;vi_mode</span><span style=3D"color: rgb=
(0, 0, 0);">&quot; is TRUE, so the &quot;emsg(e_failed_to_source_defaults);=
&quot; will be skipped.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3197 #ifdef USR_EXRC_FILE2</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3198 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;&amp; do_=
source((char_u *)USR_EXRC_FILE2, FALSE,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3199 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DOSO_NONE, NULL) =3D=3D F=
AIL</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3200 #endif</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
3201 #if defined(SYS_TINYRC_FILE) &amp;&amp; defined(TINY_VIMRC)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
3202 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;&amp; !pa=
rmp-&gt;vi_mode</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(200, 38, 19);">
3203 #endif</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3204 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;&amp; !ha=
s_dash_c_arg)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3205 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3206 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // When no .vi=
mrc file was found: source defaults.vim.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3207 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (do_source(=
(char_u *)VIM_DEFAULTS_FILE, FALSE, DOSO_NONE,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3208 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;NULL) =3D=3D FAIL)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3209 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
emsg(e_failed_to_source_defaults);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3210 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
3211 &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I think the Fedora's solution&nbsp;slightly simpler and easier to maintain,=
 while Ubuntu's solution may require further maintaining for this special p=
atch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
What do you think about it?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
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
<b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded=
-core@lists.openembedded.org&gt; on behalf of zhengruoqin via lists.openemb=
edded.org &lt;zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, June 2, 2026 14:25<br>
<b>To:</b>&nbsp;Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults=
.vim</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Hi Richard<br>
&nbsp; &nbsp;I also refer the solution of fedora</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; <a href=3D"https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob=
/f40/f/vim.spec" id=3D"OWAacc74b3c-d06f-5fe0-9e85-7a3877d6a421" class=3D"OW=
AAutoLink" data-auth=3D"NotApplicable">
https://src.fedoraproject.org/fork/vondruch/rpms/vim/blob/f40/f/vim.spec</a=
></div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"direction: ltr; margin-top: =
0px; margin-bottom: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation" style=3D"direction: ltr;">Vim-minimal(vim-tiny) =
<span style=3D"color: black;">
depends on vim-data.</span></div>
<div role=3D"presentation" style=3D"direction: ltr; color: black;"><br>
</div>
</li></ol>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: bla=
ck;">
&nbsp; &nbsp; &nbsp; &nbsp; 2.vim-data&nbsp;provides defaults.vim file</div=
>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: bla=
ck;">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
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
<a href=3D"https://packages.ubuntu.com/en/noble/vim-tiny" id=3D"OWA9f37f898=
-da2a-9121-8c8f-3456cd0c22dc" class=3D"x_OWAAutoLink" data-auth=3D"NotAppli=
cable">https://packages.ubuntu.com/en/noble/vim-tiny</a></div>
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
=3D"OWA4e7877ac-b824-0ef6-dfe4-c44f21800b25" class=3D"x_OWAAutoLink" data-a=
uth=3D"NotApplicable">https://packages.ubuntu.com/en/noble/all/vim-common/f=
ilelist</a></div>
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
s/2022-April/472830.html" id=3D"OWA7e2d441e-8bd2-1fd3-bb7a-e7b8fd343498" cl=
ass=3D"x_x_OWAAutoLink" data-auth=3D"NotApplicable">https://lists.snapcraft=
.io/archives/foundations-bugs/2022-April/472830.html</a></div>
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
<div id=3D"x_x_divRplyFwdMsg">
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
<div id=3D"x_x_x_divRplyFwdMsg">
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

--_000_OSZPR01MB786878B9AD82C7976F6C55278B122OSZPR01MB7868jpnp_--

