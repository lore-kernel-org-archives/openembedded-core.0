Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40390CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 02:04:59 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19417.1780279490332715036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 19:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=cazyrTmm;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.1, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVclRNI070//l1La41FeDLDNxa6g2eTJMzlDNdIKcmK+Toyy/mLIu696smc/tVEyhEDcDBtP9YVNdBtrwyV8hv7NQP0ru6P+bXKGb2mTbH610C1FTPhLXq3Ez8tG56ASm72TNKeAuG0JeDT7UJz7Oe0j0R9ToOgFtPJhAyguUnfNSke3ay2QvmfSQEeldI7pgxMnIcbU1jB2aeWDR66aGWw4BFix5kIG6/5P0xqoSxPnlCNq20gvM+cLlUAMCSjtkaLDqKbG14Dkl0e53DspxCQkrw/yRwPMmYPYsvVoN0tyZaXS1fqvWsUFiYwc9TGUZgHT+QtKvHwOB5DqVzNNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS42IDNZ3d6RQJDjZ4WhSrFv3YWuC7UL0IYPoFx2y+o=;
 b=MbGAZPGlDZf4NxeZiyds8Gt0fjDfXMVlXfyqNhWrmSm0X8gqPjzai+8Xuhh2JeicIYTh4hnHamby+sJd+ntfm6EEZO/0j+KeFAbZukj+6170cQdS7KBLmoUzlj3FReBf91hdZ/BRgXFnh7Yg/GcD97Ha3mbSWkWTPHqyW+JhGzdIOOlLyqz5buCNetYWj0honuK8Uk5f99B0PjBpMEQpEOnMcVqDq5sBS/e8+jBLHVrXZray8BGtg94yZvZT69V0OcpzrGFdK3tsBS2fl9oSGVg+tO+tfdbcaJRPBe8rJBuxlmAki+ajPnn3AFcehJbb2TqxBYUBvHaMOQFdvAcE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS42IDNZ3d6RQJDjZ4WhSrFv3YWuC7UL0IYPoFx2y+o=;
 b=cazyrTmm191yYxQnQLzM61OgJ/Eu8q73i5mxrG1WpFMZ6+prfiVQl6tt4mODtacfFAfJdhbbzyu4sxxKZsOeyaWfLWbFi5kC60KhcVPYJ2UkD4MSQP6J21cNDaKtEYS4WduHEi9IbkjDjqwfbYdgZLIOhOa5p2CmX21K/eW495F6cSk8GyZUXDcp7KCicw2PqPG+z5HDKhtJlr0oVRDAT84Ky3McDtmq0G8SF7PADPV3ATSFoZJIRuYc8DSk6E4k36xzDkAuPMLMwFOHdOFjlMFnG424GRa8VznkRKKnxOwxow67edzX4IyIhz4Szh8ZSSwe4OKzxQk7Tow6njZqhg==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by OSCPR01MB13010.jpnprd01.prod.outlook.com (2603:1096:604:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 02:04:45 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 02:04:45 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Index: AQHc8SKl2Ow8VA90V0GJMC5GDqATwbYo8yY5
Date: Mon, 1 Jun 2026 02:04:44 +0000
Message-ID: 
 <OSZPR01MB78682760916A329A41B3396D8B152@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
In-Reply-To: 
 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-01T02:04:44.337Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|OSCPR01MB13010:EE_
x-ms-office365-filtering-correlation-id: f6bc1a93-8145-4bd5-2d3d-08debf8226c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006|1580799027|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 m43LJUJxkqfBf6pt5dQUTpjSXk8UpyP9cOH/CzPxs5PIRNGU80pt36IvKA56ym4sbbd2ghUBhufWX3C31domN4MGTQVpIhuJRN6v2F1pXqt8UFbd6lMUb7wOkE2vd/W35HRFaGuxs1X79NmdTWLhR4M+O0CQ96j7t3Dzi4aXxz3jxCcn+2nZ7CbcV38n0ZgPPmbBKT/6N48m8MYydstk5TpfA1f+sIbKDDiF/6kRTubGvzj9sZnhRPniJ1183v3vpVOuM1qQrXWxUwF+tpFnMuRqhLad41/d/6RLgZvpFlBPiohEZPVOSmoru+64E5X4z+BsF2gH1rXw48jx82RYAUXuFqrXwToEA3UeGpg4xoMZvMHXpge4oqHIEVomT04dgbsBjgW7sM4GzrD5V6MNg4VrEPjGMTq2IkWm6nnErg1GO+ruC6slnZbRywgQjfCDeWIszua+Xu+EmGP5xNgIRkG+z/+2s3etujqJjCdWvXTE0T2qXoqGp97knfKvWMyqd8nVWGb+zZOjk4PAVQqmp5HB2SNiTFiMpllGEwzl/4lWa+EtWId98ADyjVHuiyRrNyBUlwoQpgkhYWIz810z/3Y5LXeONAoFLMnXVyxWwhBelPH6CBHsbiwPx9kXZbt0gmW1iU2JRwubDhldoUB9Gv5GaW2VngZjy+MwoR8e6zVOgfKgxW+30zh+EdNozFwS6X6KQvP6LHBp2+PUGf5F2j4tdRvVQwY715DFCHsnVm5XkuUfN057CrtMzJ6ZT5WG3WVo5sa7T4zIZwzSrO5sRBR6cfJWuUxRCyX3/CW+Sd0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(1580799027)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?eVh6VGNVejlpTStQLzRKUlY4S05HY29YSVg4ZE1xM1h5QklCT1BBUFhRYW5N?=
 =?gb2312?B?bWsvQzBVZEtnbEVDODExNFJZYmxhb0VHUUp6c3hBR2ViRHlCYUZjWTQ0V282?=
 =?gb2312?B?R1U0aEd2dlNkYWJ6ZDllcDBDOXV4aHZRQ2I0MlpCZlB0U256WXdRMFBDMnQz?=
 =?gb2312?B?V3FjaGxBb2s1R0dqdEIvc0QraU9rYk9wWTU3SVkrWjRhSFdONWxvSnNEM1BB?=
 =?gb2312?B?c2lsaU5hNzIrUGVuYkk1S2UzcFBXdFVTc2ptZG01YVluSDNUcFUzd3RCRlJu?=
 =?gb2312?B?dlFIU1BCSXkvZGF1bFBRYTN2aWVGQWMzU3hjNTczZHJ1N0dwbHJKeWJPcExv?=
 =?gb2312?B?b3pVZ2VBWmd0dFlEY05aYk9GN0JSVC9SU0x3NWZTTUdYMDMzbHJHbDlmclVl?=
 =?gb2312?B?TkF6c1ViMnh2UnZFUStZZWFKWllHNnZ3NGQ3MUF1SDdIVWIvMzRUSGIyWXJh?=
 =?gb2312?B?OFpoMTNJSXRCZEVINUVPWk5rWUNEVUI3eTY0Nlo1TGRjeXBINW1wazJ3RWlm?=
 =?gb2312?B?VUhVeTBxSmVxQ1huTUZLY1N1cmlYUjExM21aK2RMa2NYK2pmWTlwWXFvQklh?=
 =?gb2312?B?SWZ2bGVnM1VjQnBFQ2FLQVZNbUFQcXc2bmdlYzZJRGk3bnpxUEs1eW5TR0pj?=
 =?gb2312?B?LzJtZW5OMC9KK2hadFVobFVLelVjWm1RZlh4NmVBWDNkR1VzWk5CS0pRdEpH?=
 =?gb2312?B?dUZHcjlIMTdvd1Ara3E1bk1PdjJoTHRJQnRwd0hhamJwZ2Y3MG5ZUzkyQVFj?=
 =?gb2312?B?WFJmdll4cG9xUi9ITUcwTERjWVY5K3VncVRCd0lMOTE3VVdWV1JpaTlhZjV1?=
 =?gb2312?B?VEhMWGZBTHZuUzFhSWl3QVZBZXV6ZVBVUVdFNmd4ek44Ti9DNktxSnc3QmRC?=
 =?gb2312?B?K2JJS3ZMQjdBZzZzWEhmbFhTZHZsZGIxWkFabnM4UjRlVWRlMkJDWklWY2xr?=
 =?gb2312?B?UlVQM0gvNmFxNzNmS2xMdEgrZXUwNXZBS1BLNDFjM0k1Mm1JcktVdWo1Q2lj?=
 =?gb2312?B?QVZzZURrbFplZ0F6RDcxbGY3SmF2b2dvemxLL1o0Z2p6bnNoSW5PMFhka2VS?=
 =?gb2312?B?ZWZ4NGJSemF4czhkNnBvNEE5OGJvbjJkWW5HYS9VdGtIVldnMlJWcXRibysr?=
 =?gb2312?B?dlpYaHRFakpiWDMvNEpSS0t3TDFVOVNQei9pRGFlSGxTNEwyUG45bnZWMUJy?=
 =?gb2312?B?Z3o3cytMTlk1QmNrNXUyTVEwdnVRUXhmME95R3BGUWQ4RWR0WVRvNkNiUm11?=
 =?gb2312?B?VnJPcms5OGtDTUtqemVrdHdJU01MNWRzaVF4b0VEamJvQUppZ3ZBb1VCeG9O?=
 =?gb2312?B?ZEwrQk9sYldYa1dWZkRQenM0bEw3a1RSbGRTYlcxb1lvbDlEcXZ3WDJEUjQw?=
 =?gb2312?B?TmRVb3loajZ6M1lES1UwZnZWUjNLNDlFUFB3UVMwTzMwTnFkQWM0Mmlnbm1o?=
 =?gb2312?B?WEZCR0FraDF1VHVYOXlrWmc5aHNhZms3RjN2WFZwTGRHUWVHd2lLSWllbjAy?=
 =?gb2312?B?bkJxb005bEdJanhJak40WHphTTAyKzVTNVprenIyekNCazJKcXBVOXNRY0pm?=
 =?gb2312?B?bTYydkU3R3ZING5GKzN6d0FzcVFsVG9rTTd0NzN5MGNJSE1xVlhkakgwWWNH?=
 =?gb2312?B?OHQ3U3NxSUF3UnlJSHNmWm8vSktyL0ppcWNaZnQzc0luOHltSm9xSDAwdFN6?=
 =?gb2312?B?ZDZqaGhSVDdSeDRNZEJsYlM1T3BSclhCQlFBcHVqTTVqRVBjUkpKeTQ2VTZZ?=
 =?gb2312?B?QkhOUlZDR29ROW43emlNYnRGTXJscFViRzhrN1JOQ1Vjd3l0NHRQc1NUYUFs?=
 =?gb2312?B?NmdURWJ4aVg0WGs1cURqNlpmL2R3NVRxbmdOTDhCYkx1Vnd2d1ozc1I3djl3?=
 =?gb2312?B?S2RrbkwwbnNLSnpKemN4bDlHYlRRVEJIVWdzeG8xN1NXSzlZWGtVcHNCWEEx?=
 =?gb2312?B?TEVGajk3bE5nNURITHNlci92ZFFidW5WWlUwNWdQMFlQblhWZHdFWDNjMXNo?=
 =?gb2312?B?S0IyS210SFhPT1c2L1Rpc0FKcW1PSnBRRnJHcUsrUVYwc083OHE5RDJiKzlF?=
 =?gb2312?B?WHZ2SFJZTXpQZ3lPckdlRVFROHlXOXpodisyVXB3ZTVkRmFTWUJKVngvRlJi?=
 =?gb2312?B?L0VIY1VDUnhOUmFwMGYva3lPS0VzUENUWWYzWWZYNUZkUVRrYlE2QUJhdmZL?=
 =?gb2312?B?Z3JNTVZBNU91VUZZckZ4U2kzZk9xZXVoaysvMmFzOUV4NHMyU29oVFg4cmhF?=
 =?gb2312?B?VVUzNmViUXhyM1JCVm1oSnpYWGVWSnNwOWtaOWF4czR2aEV3MGQ4T0Y3UGxF?=
 =?gb2312?B?cUk1M08wOVdQUDNBdUJaUXRGdUMyUCs3VkQvc1pWdjdYVHk3L0lTZz09?=
Content-Type: multipart/alternative;
	boundary="_000_OSZPR01MB78682760916A329A41B3396D8B152OSZPR01MB7868jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	m/Oqef/wg0C3EOLqoUoRKMw+WtvxUoU2Mo+NK/Pe8pQ8Z5e6676XnzaBwcgUuLVv3jeR+HeWRAa24zPOpxaFzGrXduBdby2R6lD4PfsXxlEHwa+CPV5cTG56K1Ur+7BPTA4sAxFm08QkW9r4ypJhYyGAfXa9vwQ+3EPbRxb4B7+dZCt0Omfw7wbOXrUGVl3pZ3i+pzmG7blt1vh6KAEAfozZbiY35ISt0hVQrUTGwQqr2jxAy6vLSibCCQuhrIVxYJyooDKjR6Zs7t7KBoKRXTjpzBvNS3xoTnfxeQwNIA63EEUQVC+F12/rxdlCl3zyoWFp1Hj7WZz5spNEB+i6hw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bc1a93-8145-4bd5-2d3d-08debf8226c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 02:04:44.9874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsAaJq0azZlkZd5PqhB/bBWtPcDQnXLPbxv0Hx8fkggMY7mxtsS2yX7l7RLcF57t+tzJEDIEdDpDAF+90fBYSF2p/MskzZdbqUqbWDhIZbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 02:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237807

--_000_OSZPR01MB78682760916A329A41B3396D8B152OSZPR01MB7868jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQogICBUbyBmaXggdGhpcyBpc3N1ZSwgSSBhbHNvIGhhdmUgYW5vdGhlciBt
ZXRob2QuIFRvIHRvdWNoIGVtcHR5IC52aW1yYyB0byBhdm9pZCAiRmFpbGVkIHRvIHNvdXJjZSBk
ZWZhdWx0cy52aW0iIGVycm9yDQoNCiAgIEFuZCB0aGUgcGF0Y2ggd2lsbCBsaWtlIHRoaXMNCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5iYg0KaW5kZXggZTRjMjZkMjNmNi4u
MzNjYzQ4MTI3MSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlu
eV85LjIuYmINCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85LjIuYmIN
CkBAIC02LDYgKzYsMTUgQEAgUEFDS0FHRUNPTkZJRyArPSAidGlueSINCg0KIGRvX2luc3RhbGwo
KSB7DQogICAgIGluc3RhbGwgLUQgLW0gMDc1NSAke1N9L3NyYy92aW0gJHtEfS8ke2JpbmRpcn0v
dmltLnRpbnkNCisNCisgICAgIyBBZGQgIi52aW1yYyIgZmlsZSB0byBhdm9pZCAiRmFpbGVkIHRv
IHNvdXJjZSBkZWZhdWx0cy52aW0iIGVycm9yDQorICAgICMgRm9yIHJvb3QgdXNlcg0KKyAgICB0
b3VjaCAke0R9L3Jvb3QvLnZpbXJjDQorDQorICAgICMgRm9yIG5vbi1yb290IHVzZXINCisgICAg
aW5zdGFsbCAtZCAke0R9L2V0Yy9za2VsDQorICAgIHRvdWNoICR7RH0vZXRjL3NrZWwvLnZpbXJj
DQorDQogfQ0KDQpJcyB0aGlzIG1ldGhvZCBPSz8NCg0KWmhlbmcNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPg0KU2VudDogTW9uZGF5LCBKdW5lIDEsIDIwMjYgMToyNg0KVG86
IFpoZW5nLCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGZ1aml0c3UuY29tPjsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHZpbS10
aW55OiBidWdmaXggbGFjayBvZiBkZWZhdWx0cy52aW0NCg0KT24gVGh1LCAyMDI2LTA1LTI4IGF0
IDEwOjA2ICswODAwLCB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCj4gV2hlbiB2aW0tdGlueSB3YXMgdXNlZCBpbiBpbWFnZSwgaXQgbGFja3MgZGVmYXVsdHMu
dmltIGZpbGUgd2hpY2ggd2lsbCBjYXVzZSBmb2xsb3dpbmcgZXJyb3INCj4gcm9vdEBxZW11eDg2
LTY0On4jIHZpDQo+IEUxMTg3OiBGYWlsZWQgdG8gc291cmNlIGRlZmF1bHRzLnZpbQ0KPiBQcmVz
cyBFTlRFUiBvciB0eXBlIGNvbW1hbmQgdG8gY29udGludWUNCj4NCj4gU28gYWRkIHZpbS1jb21t
b24gYXMgUkRFUEVORFMgdG8gcHJvdmlkZSBkZWZhdWx0cy52aW0gZmlsZSB0byBmaXggdGhpcyBp
c3N1ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAZnVq
aXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55Xzku
Mi5iYiB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85LjIuYmIgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJiDQo+IGluZGV4IGU0YzI2ZDIzZjYu
LmI2ZGRkZWQzODEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0t
dGlueV85LjIuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55Xzku
Mi5iYg0KPiBAQCAtOCw1ICs4LDcgQEAgZG9faW5zdGFsbCgpIHsNCj4gICAgICBpbnN0YWxsIC1E
IC1tIDA3NTUgJHtTfS9zcmMvdmltICR7RH0vJHtiaW5kaXJ9L3ZpbS50aW55DQo+ICB9DQo+DQo+
ICtSREVQRU5EUzoke1BOfSArPSAidmltLWNvbW1vbiINCj4gKw0KPiAgQUxURVJOQVRJVkVfUFJJ
T1JJVFkgPSAiOTAiDQo+ICBBTFRFUk5BVElWRV9UQVJHRVQgPSAiJHtiaW5kaXJ9L3ZpbS50aW55
Ig0KDQpEb2Vzbid0IGFkZGluZyBkZXBlbmRlbmNpZXMgbGlrZSB0aGlzIGRlZmVhdCB0aGUgcG9p
bnQgb2YgdmltLXRpbnkgaW4gdGhlIGZpcnN0IHBsYWNlPw0KDQpDYW4gd2UgY29uZmlndXJlIHRo
YXQgb3V0IGluc3RlYWQ/DQoNCkNoZWVycywNCg0KUmljaGFyZA0K

--_000_OSZPR01MB78682760916A329A41B3396D8B152OSZPR01MB7868jpnp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Richard</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;To fix this issue, I also have another method. To touch empty =
.vimrc to avoid &quot;Failed to source defaults.vim&quot; error</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;And the patch will like this&nbsp;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);">
diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-suppor=
t/vim/vim-tiny_9.2.bb</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
index e4c26d23f6..33cc481271 100644</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
@@ -6,6 +6,15 @@ PACKAGECONFIG +=3D &quot;tiny&quot;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;do_install() {</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny=
</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;# Add &quot;.vimrc&quot; file to avoid &quot;Failed to sourc=
e defaults.vim&quot; error</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;# For root user</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;touch ${D}/root/.vimrc</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+&nbsp;&nbsp; &nbsp;# For non-root user</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp;install -d ${D}/etc/skel</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp;&nbsp;&nbsp;touch ${D}/etc/skel/.vimrc</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
+</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;}</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Is this method OK?</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-left: 0px; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
Zheng</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, June 1, 2026 1:26<br>
<b>To:</b> Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5 &lt;zhengrq.fnst@fujitsu.com&g=
t;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.op=
enembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 2026-05-28 at 10:06 +0800, zhengruoqin via=
 lists.openembedded.org wrote:<br>
&gt; When vim-tiny was used in image, it lacks defaults.vim file which will=
 cause following error<br>
&gt; root@qemux86-64:~# vi<br>
&gt; E1187: Failed to source defaults.vim<br>
&gt; Press ENTER or type command to continue<br>
&gt; <br>
&gt; So add vim-common as RDEPENDS to provide defaults.vim file to fix this=
 issue.<br>
&gt; <br>
&gt; Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++<br>
&gt; &nbsp;1 file changed, 2 insertions(+)<br>
&gt; <br>
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
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_OSZPR01MB78682760916A329A41B3396D8B152OSZPR01MB7868jpnp_--

