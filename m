Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1E3CD98EC
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 01:16:52 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5808.1781659009101392015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 18:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=bGn7KWH/;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.58, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hllsDJdKmPSO1vrQHkKKy9U8utJAh5f43j4oBjgLr0XuAeznMWVRYBhLvqAms5RQHc3opLOtqEMUppT6tOWwD2rqc/QcR9b8aPccvMCZ5FvYBPrWkDf7VK9sobztBM1wilCovBV+b6MK7AkEJJyaxZ+/KU4Rvs07W1dTIUv0moYxtVkE8d6ItaATNqK0XV3mH7gvkPL22MR3U3dgSKgW6Qvz3QT3Ci0Fu+osvqjRLUvYbTr0SZ5X60VYSzqX7sEX4dSX3yh7si0PZC/EZddJeMRScjeuwVQby/x9trcCFUnLikoPOzMALHq6pWPct4n8TrYhtRMLY6o19lzjJ3jv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz/A8/s4LYP09mlUbYZg3J0usNbG/JDT9tGZIKnz+b0=;
 b=uaPQfJnCj7bqvmgVinXgR6kT+Zxv/1DeGSC7JTiZFDvi/DIHSx0rhGeWjLWOphAFxF9t3ok2pkf+O22fV0WnkyJH0CNC6cHzLkH7rDTLzZudYk9V4bnqr1JV6PWL1JjinQf/YtzLQKfqU3qj86V0GfrJc1tO3RmsdZyG7OzMxd1YestW6WYYXc1M8mCrQkG2+OE/rRRcEk38rNhNw1e4T150+1tMBdB62sAWAMP55i0XOryXQHvcE84ZLqtjd2JQY5YS0pY9Itd/hr35Aq0WMA3mTxdPNk95pBg+5LGUXyoyQbCYY6ZLvnxgFhMNbnN7na0nLbI75ynJrzAWyaqckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz/A8/s4LYP09mlUbYZg3J0usNbG/JDT9tGZIKnz+b0=;
 b=bGn7KWH/lgf87W8CBcHI9rFQUD44azIYwDfDblYmf5DwfgnjpYS9LHq7KPNfGST8n/CCmXauOqTfMgJkeVaWk16kVLjlk/FQNMZwNMVfdU7zytTyR/xiPbgufUap1DHzI5biXeGyX0YbvdSMoAwHrZhPC1iF7YnSxzmbNZpoMYZikVHn6OUsesCBu7AXIs2tJX//xEH4ZhBlxOs9jSG4Y1OLpuX8A0qSbqHXt19FBLkPD0AHyFMaO7XB/1cJZ1AFypNgCuduBNySpU3UohmPMPci9iSmzHYiI+0pHhGRDCBYSap5Uu8BGJnX/u9aFKRBtLbCv1VGxhNQTF6rUhdEXA==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by TY3PR01MB11593.jpnprd01.prod.outlook.com (2603:1096:400:375::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 01:16:44 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 01:16:44 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
Thread-Index: AQHc9mgfEo0MzaVVeUaQ71Kp4cK247Y+3oJwgAMikAo=
Date: Wed, 17 Jun 2026 01:16:44 +0000
Message-ID: 
 <OSZPR01MB7868E958149C84033E9B338C8BE42@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
 <b2edbe057c6569a2260c5dc4ae4d8b8199c57f83.camel@pbarker.dev>
 <OSZPR01MB7868612587B639A0A53174378BE62@OSZPR01MB7868.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSZPR01MB7868612587B639A0A53174378BE62@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-17T01:16:43.953Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|TY3PR01MB11593:EE_
x-ms-office365-filtering-correlation-id: 0a19891d-044f-4ad0-7f90-08decc0e186b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|4143699003|5023799004|56012099006|8096899003|6133799003|38070700021|22082099003|18002099003|1580799027|13003099007;
x-microsoft-antispam-message-info: 
 kLeRhGk6vfo24U+HSP6meNVJWlRlLWV1qvOdxO4bJCXMQBXyw6I4PqUujKu1BKzqU7aSzIQJbqBikmVsgTZzkG48xJYunVnHsBEsbeK416xTP6iGSgiUvXC9pnTw4D6P4XfSAzugKGzr9EHwsUPbA1GqvQyVTju7uR84pvHK49M05yM+4k3+8JANUqcQFQ7T/K2j1CsI6xtiNPwnhVxVrpVUoYJ7Ieb7HVwiQ+AsviIyhlmqQbWY7vQRxENz5lbHfjCE8gwuUh6HFA2Vc8E9+LiR9rgItYRZ/L65ZtRd9aiLW8xrVjW1eXuea/Y9Ni4QPdUMA8C+Bx0sQNFbhYMo2Ii5+EUGbmCANm/9brs3XAYR39ji53GQY2RtIBbJ2lK69QOypcdqRyLHihwJSjsfEETp2kkDvnuT1j5tgZyjcgYvXcVqEQ9KsizimuMhng1hcprOr6Dw5DSRtUIreKKoPRF0CIUsg/DDZKOzBFJC1qPsd+LMRnAzXWlF5TDtjGfHn3pOzG3D0VTlUIwaXGwGjy17h87hMPSwgknBh/Wp9qEUHqyNVjjHWucJJVQWn3h8ryuPrlYW/l1sRb8ZaHQqJVZm9VLQwFZ5Rx/cEGkVhUai9ZFUlG3yTsP8grX4GV+eZsiRTAeR29f9Ef3IqpD7tnuNeAlzf/C0T4qECnZfN3nFMJbbAzHIES+Ye2kgImA8hqDu0SuIHKG0Pj5uxDDHRD32780aFm8YaOrTMmd9hcS/cPloZ2zNiff1BV7UtObh7F3aY3VOGijAVEUiUuhJz2uHglnpKxdUw1eSAdf1ULI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(4143699003)(5023799004)(56012099006)(8096899003)(6133799003)(38070700021)(22082099003)(18002099003)(1580799027)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?SHlUaHRPS2N4TStPQUgxazgwbFJkVVdTWFZsWlNrb1M4UmJKNFAxemlUcUlQ?=
 =?gb2312?B?aytVTHVZVzZLSk5vL0src09UTjhUS3ZhTGNuVzFMMWwrSEtzUmdHdE13MFEw?=
 =?gb2312?B?WThCcjRHejdDdzBsWFZZcURtRXpEajlhYkFtNDJML0NXSmZKcjVtNmJ1MWE3?=
 =?gb2312?B?Y3prbVNMNmtOMlN0dk0rSCtVUm53cndTVlI1UVZBUTdXNnEyY3ovMm9UdDBs?=
 =?gb2312?B?aFhYeDFEN1VmaDZaMHFmNDlPTnYyQlRCOXluanNNWmgwREZZWWFBTnRnUlhK?=
 =?gb2312?B?dWZsMTA1OHZPR2hZTlIvdTZBamFzRWFhQ3A0M29XQndBYWxJUlBISHM5MDdq?=
 =?gb2312?B?M1RydHR5NkFscjRLb25zVlRkaXBwSloxS0VxNTBaeWhicmNSZGpyN2I1eks2?=
 =?gb2312?B?RnVUY0hOT1RVSENwL1pyRmdSTzM5ejgzNnJISWc1ZkkyQmk0U0JiS2VWTUtF?=
 =?gb2312?B?YTlyaHVHSTRmZU14cGg2a1FyMVNOSVJtS1B5b1VtSElhQmszZjBHN3B4Skl1?=
 =?gb2312?B?VS9kZndsVUN0Q1UrTFpVazRpMDIvWTRDaDcrcGpBWDlpWnlaMU5zamF1ZU5V?=
 =?gb2312?B?Qm1DbUtzWG5GankzZE83bFRickxnTXQzYVE2YjJCbzRjNnlXSU1maFA3NWVw?=
 =?gb2312?B?Vm1HNnFKNDdVejJqdWhleXVudVA5akJyL2tHRExBemo0UFNFRnlEUmt0WHFJ?=
 =?gb2312?B?SThNTUhMNmRXdklkb0h3RlJyTnBZWFA3K1hDNitZZHJveHdnQ01FY3lKbENx?=
 =?gb2312?B?VE9GUVkvUDFFTG5iQW81SEhYQWtpVUppNDNZL216akR1Yi9Zbjk3OUJRS3ZP?=
 =?gb2312?B?ODRTOWxEOEFwSUZ6YU9qenRPbVcxeFgydWp2YlUxQ3JXVUxVcVJoUnRQd1c3?=
 =?gb2312?B?Z3hkbTRweVBqZFA3WFI5SWFMNk1wOWg5cFA3YlYxbjdXUUI1Z2I1MFhNTlBu?=
 =?gb2312?B?eVdqdkJkQ1dzOVRUVmdKKzk2bGZDTjlOUEJtOWlKWVNOblg1ZFNIUnhqWU1k?=
 =?gb2312?B?RWhMRzVhOFpxWVVKSWxDRmJ1Sk80ajVFd2txdjNtN1VEU2JBb1JnazNFSTVF?=
 =?gb2312?B?c3MyaUllYUZaaGhNTHpqOVh3WHlpdk9ld0R3V241d2syL0VqMEhFUyswa3FO?=
 =?gb2312?B?WStRbE9MOVlvYlQvMlltY2x2YmUvRnVJNU9KTjhwWWhTT0kvRWJHYTgxTUV5?=
 =?gb2312?B?R0J3bDh0dkpLaGcvc3FKRWZ4d29KYlhUMkd0ZHp5TzBmSkpBRVZjWUZtNjNw?=
 =?gb2312?B?b0xvTVNGc3R6RHpoZGlqZTJBcE9kQTYweDNwNlRJT1hlWFpLN1JycXZOSjFm?=
 =?gb2312?B?OWNsS0lDYi96WWlCbERQU29nMkw1ZzdCdnBiYVUxWVdVTGx0eng0MVNnQldp?=
 =?gb2312?B?MVZzS0xTdk5tMTF6YUh3M3Y0NURvcFNsWnpCamlmYXNLNjN4Y3JoSFUyUGFl?=
 =?gb2312?B?bXBFOThjZVBMUXdNUmJIRnJsT2pMQ1Y4Zml2RmUxelNDTm1aSksyMVIvOC9t?=
 =?gb2312?B?T0UwamhVQmhFa2E5d3RsdG5hKzMyeVVzc3ZNQTRhZVo1RGd5Z2thZTZQUEd1?=
 =?gb2312?B?QTAwWThZeTRDWjFnZW96UXJ2Ri9iOWliR0t4ejBHd2doMEdjMzcrdDRrNzBL?=
 =?gb2312?B?SHBDaCs0ZjhxL01WQW9VWERYS3p5YkF0SDZIZU5jYk8rTFZuTU1FNHR4T3Er?=
 =?gb2312?B?dzZQdVA4SnpXMzdhWkhkRW1OTDY2L3VWbWRTeFBjRDh2V1NHZ1Q4T2l6bmxG?=
 =?gb2312?B?TWNCRVE2WHlDWU1IVEZmaHl6RFVaLzNGZFFnSzl1U2dTYlJqTmxVUmMzT3Yy?=
 =?gb2312?B?M3ZScFFid3JEajlrM2YyQUFxWDNXOG9HYTZPdlRpbGcrbjl3T3BHaFVPbndo?=
 =?gb2312?B?SXZQTllRRWI2SkE0TUgzOHZSQVFkZklLczRlMjZ6clQ5bWdEUkxjdUt4MHVv?=
 =?gb2312?B?UGRoanhLd1dnMVRnb3VkaUZJSTloc1VhKzdyd0RNcS9yY09yMGlmSU1SNS9F?=
 =?gb2312?B?aHN0c3VnV2RzMlU3WlFZQTZQZXg4d0VXc1QwTFdQcitVbmd6S1ZxZGp3UkFi?=
 =?gb2312?B?SG44SXpkTEQzaDZHQm1sblNkYkR6TFlRNjBLc0dRR2V1eVdLWUhnaUt4aWdx?=
 =?gb2312?B?RC8wOXJrdVFqV0hPTDlJaVJTbUg5Z1FvekNTa0dMY0lHdGVqMGx6VVdVa0Np?=
 =?gb2312?B?alpvSHNYK2svYzVKdVhUMmNjZUo5b3RRd250dk5yZ0pOUGhTa0VwU2twRzll?=
 =?gb2312?B?d054KzlwL2dGUzVTMTN3N0FhaGx3QnovZGF0OEl5QjNHRG5MajBRWUEzS0t6?=
 =?gb2312?B?Wi9IUzhyb2Vxc01zNlRHcm1abWJDTDBQeFpPZzMrQXRyODlrRmtodz09?=
Content-Type: multipart/alternative;
	boundary="_000_OSZPR01MB7868E958149C84033E9B338C8BE42OSZPR01MB7868jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pN8WuzyZ6mgsDwemV1OsqfIm1CVMxRX20uvBLnhObLPqF96N8iRQZOeId1M/CA2b4m4+EQ9LKN5YdElNdg6cknLP0JbpHPgMxnwtWtbOtQDXTH0PN/Zd8iCpmGFaEsfnATHT5EzSnLnmwxMlkMMPa3/DjFkuTg7ycndwL380mz/4LROo653igbkmWfbx0KyTi6OmTImfVVBwi3qfCdrGbSu947G79ykyxiNMVzEQgeIMnPRd7lQVEzOkjCgkYo8Mh+r6JwME8khSWXCpSRcfWVsC++6sml71Dz+F8pLXG3TkegE/0eZ+HMtSwKd+LgHBYA7P+f5YOqenr3QajNmJXw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a19891d-044f-4ad0-7f90-08decc0e186b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 01:16:44.4433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TufkacQGEBuoosbVh8IUXpnnnBacmxWn09PmdtI5DN8c1D+wpDXBfyKSoWsHetMX+DoEL57TxcQ1w3/6wGT0LHzIY3Nq+EJsIvCCGvGh5kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 01:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238968

--_000_OSZPR01MB7868E958149C84033E9B338C8BE42OSZPR01MB7868jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFpoZW5nLCBSdW9x
aW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGZ1aml0c3UuY29tPg0KU2VudDogTW9uZGF5LCBKdW5l
IDE1LCAyMDI2IDk6MjkNClRvOiBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj47IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIHYyXSB2
aW0tdGlueTogYnVnZml4IGxhY2sgb2YgZGVmYXVsdHMudmltDQoNCkhpIFBhdWwNCiAgIEkgcmVm
ZXIgdG8gdGhlIERlYmlhbiBwYXRjaCBhbmQgcmVtb3ZlIFNZU19USU5ZUkNfRklMRSByZWxhdGVk
IGNvZGUgYXMgSSB0aGluayB3ZSBkb24ndCBuZWVkIHZpbXJjLnRpbnkgZmlsZS4NCg0KICAgSWYg
dmltcmMudGlueSBpcyBuZWNlc3NhcnksIEkgd2lsbCBkaXJlY3RseSBpbXBvcnQgdGhlIERlYmlh
biBwYXRjaCBhbmQgc2VuZCB2MyBwYXRjaC4NCg0KRnJvbSB6aGVuZw0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogUGF1bCBCYXJrZXINClNlbnQ6IFN1bmRh
eSwgSnVuZSAwNywgMjAyNiAxODoyNg0KVG86IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Tsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3Jl
XVtQQVRDSCB2Ml0gdmltLXRpbnk6IGJ1Z2ZpeCBsYWNrIG9mIGRlZmF1bHRzLnZpbQ0KDQpPbiBG
cmksIDIwMjYtMDYtMDUgYXQgMTg6MDcgKzA4MDAsIHpoZW5ncnVvcWluIHZpYQ0KbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gV2hlbiB2aW0tdGlueSB3YXMgdXNlZCBpbiBpbWFnZSwg
aXQgbGFja3MgZGVmYXVsdHMudmltIGZpbGUgd2hpY2ggd2lsbCBjYXVzZSBmb2xsb3dpbmcgZXJy
b3INCj4gcm9vdEBxZW11eDg2LTY0On4jIHZpDQo+IEUxMTg3OiBGYWlsZWQgdG8gc291cmNlIGRl
ZmF1bHRzLnZpbQ0KPiBQcmVzcyBFTlRFUiBvciB0eXBlIGNvbW1hbmQgdG8gY29udGludWUNCj4N
Cj4gU28gYWRkIGEgbmV3IHBhdGNoIHRvIGZpeCB0aGlzIGlzc3VlLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAu
Li5lX2RlZmF1bHRzLXdoZW4tVmltLWlzLWludm9rZWQtYXMtdmkucGF0Y2ggfCA2MSArKysrKysr
KysrKysrKysrKysrDQo+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLmluYyAgICAgICAg
ICAgICAgfCAgMyArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vZmlsZXMvMDAwMS1za2lw
LXNvdXJjZV9kZWZhdWx0cy13aGVuLVZpbS1pcy1pbnZva2VkLWFzLXZpLnBhdGNoDQo+DQo+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vZmlsZXMvMDAwMS1za2lwLXNvdXJj
ZV9kZWZhdWx0cy13aGVuLVZpbS1pcy1pbnZva2VkLWFzLXZpLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdmltL2ZpbGVzLzAwMDEtc2tpcC1zb3VyY2VfZGVmYXVsdHMtd2hlbi1WaW0taXMt
aW52b2tlZC1hcy12aS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwMDAwLi43ZTdiZmUwYTZkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdmltL2ZpbGVzLzAwMDEtc2tpcC1zb3VyY2VfZGVmYXVsdHMtd2hlbi1WaW0taXMt
aW52b2tlZC1hcy12aS5wYXRjaA0KPiBAQCAtMCwwICsxLDYxIEBADQo+ICtGcm9tIDdkYWQ0NWY3
NTFkNGFkYmVlNDgwMDA1YTU1NDZiMzJhOTdmZGJmYjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
DQo+ICtGcm9tOiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT4NCj4gK0Rh
dGU6IEZyaSwgNSBKdW4gMjAyNiAwOTozNDoxOCArMDAwMA0KPiArU3ViamVjdDpbUEFUQ0hdIFNr
aXAgc291cmNpbmcgZGVmYXVsdHMudmltIHdoZW4gVmltIGlzIGludm9rZWQgYXMNCj4gKyB2aQ0K
PiArDQo+ICtUaGlzIGlzIHVzZWQgb25seSBpbiB0aGUgdmltLXRpbnkgcGFja2FnZSB0byBza2lw
ICJzb3VyY2VfZGVmYXVsdHMiIGVycm9yDQo+ICsgRTExODc6IEZhaWxlZCB0byBzb3VyY2UgZGVm
YXVsdHMudmltDQo+ICtQcmVzcyBFTlRFUiBvciB0eXBlIGNvbW1hbmQgdG8gY29udGludWUNCj4g
Kw0KPiArVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZSBzcGVjaWZpY10NCj4gKw0K
PiArU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAZnVqaXRzdS5jb20+
DQoNCldoeSBub3QgZGlyZWN0bHkgaW1wb3J0IHRoZSBEZWJpYW4gcGF0Y2g/IFlvdSBjYW4gZmlu
ZCBpdCBhdA0KICBodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvdmltLXRlYW0vdmltLy0vYmxvYi9k
ZWJpYW4vc2lkL2RlYmlhbi9wYXRjaGVzL2RlYmlhbi9TdXBwb3J0LXNvdXJjaW5nLWEtdmltcmMu
dGlueS13aGVuLVZpbS1pcy1pbnZva2VkLWFzLXZpLnBhdGNoP3JlZl90eXBlPWhlYWRzDQoNCkJl
c3QgcmVnYXJkcywNCg0KLS0NClBhdWwgQmFya2VyDQoNCg==

--_000_OSZPR01MB7868E958149C84033E9B338C8BE42OSZPR01MB7868jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zheng, Ruoqin/=D6=A3 =
=C8=F4=C7=D5 &lt;zhengrq.fnst@fujitsu.com&gt;<br>
<b>Sent:</b> Monday, June 15, 2026 9:29<br>
<b>To:</b> Paul Barker &lt;paul@pbarker.dev&gt;; openembedded-core@lists.op=
enembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.v=
im</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Paul <br>
&nbsp;&nbsp; I refer to the Debian patch and remove SYS_TINYRC_FILE related=
 code as I think we don't need vimrc.tiny file.<br>
<br>
&nbsp;&nbsp; If vimrc.tiny is necessary, I will directly import the Debian =
patch and send v3 patch.<br>
&nbsp;<br>
From zheng<br>
________________________________________<br>
From: Paul Barker<br>
Sent: Sunday, June 07, 2026 18:26<br>
To: Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5; openembedded-core@lists.openembedded=
.org<br>
Subject: Re: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim<br>
<br>
On Fri, 2026-06-05 at 18:07 +0800, zhengruoqin via<br>
lists.openembedded.org wrote:<br>
&gt; When vim-tiny was used in image, it lacks defaults.vim file which will=
 cause following error<br>
&gt; root@qemux86-64:~# vi<br>
&gt; E1187: Failed to source defaults.vim<br>
&gt; Press ENTER or type command to continue<br>
&gt;<br>
&gt; So add a new patch to fix this issue.<br>
&gt;<br>
&gt; Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...e_defaults-when-Vim-is-invoked-as-vi.patch | 61 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-support/vim/vim.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +<br>
&gt;&nbsp; 2 files changed, 64 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/vim/files/0001-skip-sour=
ce_defaults-when-Vim-is-invoked-as-vi.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/vim/files/0001-skip-source_defaults-=
when-Vim-is-invoked-as-vi.patch b/meta/recipes-support/vim/files/0001-skip-=
source_defaults-when-Vim-is-invoked-as-vi.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7e7bfe0a6d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vi=
m-is-invoked-as-vi.patch<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +From 7dad45f751d4adbee480005a5546b32a97fdbfb2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
&gt; +Date: Fri, 5 Jun 2026 09:34:18 +0000<br>
&gt; +Subject:[PATCH] Skip sourcing defaults.vim when Vim is invoked as<br>
&gt; + vi<br>
&gt; +<br>
&gt; +This is used only in the vim-tiny package to skip &quot;source_defaul=
ts&quot; error<br>
&gt; + E1187: Failed to source defaults.vim<br>
&gt; +Press ENTER or type command to continue<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
<br>
Why not directly import the Debian patch? You can find it at<br>
&nbsp; <a href=3D"https://salsa.debian.org/vim-team/vim/-/blob/debian/sid/d=
ebian/patches/debian/Support-sourcing-a-vimrc.tiny-when-Vim-is-invoked-as-v=
i.patch?ref_type=3Dheads">
https://salsa.debian.org/vim-team/vim/-/blob/debian/sid/debian/patches/debi=
an/Support-sourcing-a-vimrc.tiny-when-Vim-is-invoked-as-vi.patch?ref_type=
=3Dheads</a><br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_OSZPR01MB7868E958149C84033E9B338C8BE42OSZPR01MB7868jpnp_--

