Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F9DCA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:56:45 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8819.1790938603250600215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=jIi0zHG6;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.66.65, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEFvpsjcFA2ptj8iCLn6vhY81MJvLt9PPwHF3eYykQZDwAbKAMq1V7t/bCUAxjEifoJ5HIgEUkGZ7MEdqbc11M6Wd2JYIvDt/FxgjHNuVq4v72UEvQcMKz2bolRIolnXbTqLyWHcmGTWzXAMkQMifHxWSO7BOK52Eww6E2nxyivE/txT+AnJCpMoryzffFsWhkHLYGTAGal9IuK34rCkRsl/1p2nS4Onxg88wydlizGnt0uFLyuITWNnvSQS5Pb93TETvqvi3I0ggClp3T/O8Pt0QpRibdTt9LMkhisX1V0JUyLDCcqUyONBO983qBzBcjrC7SLwohWsU21bAfhjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKWOiCNeW/GLtB6aD7cuMRzyWgvX8AdhUosOFWJYsAM=;
 b=ZJUBLdUbS1Vn0eVvywYQgyuqofT9n49HeuDf18paRkOcInQkH0PDIsdMAOgHlg+OOdrVN7NGFubeRsaDAHpMD/c1HSeJOl7daagVZbXzdmuaAMJ10HNKN/vKYUhrl77U58q/wQ5Z0drXSmJTtzKXwlVzd8HZ1zAKGHMpKHK+inH9tI7ZivLuayMnnTtgcVzyOxdpTf2OHcQw261JISWO8aeSx7md+95TOlOdxpNyb4ShJGDR6VI7YlKdycrTV+8XLIwWjzFwYn5c+Fkffv1hi/e/F+Oi4lGVIAN2ZY7CNPq/lFRB42hP0A4kcX4SpQe+r/K4km3aWW+XJTmU/9vPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKWOiCNeW/GLtB6aD7cuMRzyWgvX8AdhUosOFWJYsAM=;
 b=jIi0zHG6qwAZ/s1Z+KroS8Cc+Ue196h9najkVGip+f/n/IFR1Zix4S9RQw0agSHxfF7Ay18xNRG0Aogyq/5RFE9mXdhIw6Xtd4FTvzOtcFDB9fUcpM4z2pX81veEVxyVTKyWzG1Z4AzKLGrZASuoJvRfLVv3/VLGCN3lgvnR8kxt2o/DFkOpEA4nBJcu3lPAXLaxe4SYlv+omURSHCPToOrwKw5eNz+PpY3TRzRfVYqS3u3aAnP1HfcLf+f84h/ZhUJVQksVddZE7YuigU5tXaQ0pzZr3u9f0trOjVP8tZ5T9976gSj6ui6fFGYk+byyxPki7zEOx/clZzR4S+A0ng==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by BESPR07MB196443.eurprd07.prod.outlook.com
 (2603:10a6:b10:130::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:56:39 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:56:39 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [PATCH] libarchive: fix CVE-2026-15028
Thread-Topic: [PATCH] libarchive: fix CVE-2026-15028
Thread-Index: AQHdUlyzF9XyTXGeEE6+ni9AlBZMIg==
Date: Fri, 2 Oct 2026 10:56:39 +0000
Message-ID: <20261002105633.11220-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|BESPR07MB196443:EE_
x-ms-office365-filtering-correlation-id: 6b1faa57-94c1-43e2-2d00-08df2073d60a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|38070700021|11063799006|56012099006|6133799003|12006099003|260925022911599003|10067099003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info: 
 M0MuK4wKzo9tnS0bMn9z1Y6pcDj/pM8BF2KPNtXwvo9yMDM61ti8pSPBZL4SV22Av4F58bDAiZbmsRf8igQCZpeZgcyVJJ3zifKcAu6NqqWaxCtPLqxijt07YhQzY5cZMWW81C3GoX7dWnXYCU0pWeeuGWlbmcCfYk6MiWGYJswit8TKv/2kyVd9oaESSyZ5kO6sE0JjdBvbLAYUqifHiHf/AwUsCVOhJYNwuKPloA+u2v0s33RnR1HN0u0xMW8Lx96BHTSLhPW2A5CRPVZm8yEQFCWzg9h2fPKoev3z1KqAy26ssfMuyzTgVxJqL+Lzau2hGEH7a0EOH9f50AWyC2rA8D7BnhmHuOz/GLuWwl1uENtrmwMuw16lI76JhrEbv9VYyRakk9Lciy8Wbongf8IyXSLYzDT4Y5t4HjH7mAveSbBN6icPa0FeMzgtJemNX2lyUjwWJHTV4Z6IwR69BdvKjkdeCLDTSN7S3irAbTOkOcWnmvZ2MsbqwFRm6Q6yFXDx8FdAVKJ+if4X94QRDQSiB6Wnplva2CZJwKjnFXs1uBscSjR6uVTtHIGdVaJ70tMc/1uvsyBmXz8FEZmxbkJ5A+JEtDWY2DpZKMPO8D/MLZ80Y1cNIB9wGqRV6+dpP8KLX9YA0YO1DZuzs/puARcZzVW3LxyvZV1IgKNsTuU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(38070700021)(11063799006)(56012099006)(6133799003)(12006099003)(260925022911599003)(10067099003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V3BWd1JuMGs3Zkw3THdlK3pTM3EyVWpYUFVyTnZTOG5Qdnc1SlVWV2dKbmsr?=
 =?utf-8?B?Z1AwSFhmaWt3blFWcExXdHNLZUI1aXZ5eVBKSWdhK1ZORTFiSnlpYkRyczVZ?=
 =?utf-8?B?dkJkQ3VZTGxwc3BBODY2cGlFWGEwUkp3SlY1bmNLbDFXZ0lZU0xtNmFiYTNp?=
 =?utf-8?B?anlRM2I2YWZHQ21Td0Z6c082czM4aXVhS2VRWmg1ZVZUYXZRMTdPWDkrTUxw?=
 =?utf-8?B?QTAyNXl5WGFaUzZzV0pmTm1sb0gybnFrZUVBZWdSTjY4QlRKTmc4NDlINmFq?=
 =?utf-8?B?NkJUUzJWM3BGd29MK2lPeHltYXh4dW5WM3IzRWZhZ1hSa3hRa2lZSldDNmdp?=
 =?utf-8?B?Sm5obUNIWnZzNTB0b2hBWG0xanNZakl3akVrSkwxdDZMMURTN2h6Q1kyazZT?=
 =?utf-8?B?QVc2Q1EwekVVVGNrd0VKWm5FeUVvSm9idnhNTmM0WFlJVXN3RUJLMzBDRjY2?=
 =?utf-8?B?V0lUWkRsczRxd1d0VE1hUmRhTWFKZGhndnZMQTJqSGcwVncwc1JQemN1UVIv?=
 =?utf-8?B?U1dZbTdMcTBERFBvRDRnTzdmNkR1U3JaMDgvUWVVRVY4YldRcWtyMUw1Q1hC?=
 =?utf-8?B?YVY4WnNtYllGK1hzYUoyc2R3bUJJY21SQ1c4RFRFenRpL0l0c2k4czMzb1Q0?=
 =?utf-8?B?Z2s2OUtEcUpUelRKTjRWUW1keUlQV1RhSk9mTC8rZUVEajVCOUpjcnVsK0V0?=
 =?utf-8?B?cHNmTTQ3ckVWSnE0RWxpM1lCSjhXRXBkcy90b0k4ckF6ZW1tM2YzRjZTQWxE?=
 =?utf-8?B?WlVLZjh1Q0N6ZzhMSGhaK1RGaDNmRUN5QWtuclpQelBQa1VNd2hudDRDMU15?=
 =?utf-8?B?N1BqeGxKUnZCaDBKbE1BckxWVC9lQVBrdHJYZnFoVE9CMGdPM0k1MGVyZkYz?=
 =?utf-8?B?d3pZTmp5UlUzQUt6SGJPUmtxLzF0VmZuTWFtV2JnZmxVT2dLalVDSGkyVTFh?=
 =?utf-8?B?SDcwdkxRcHRXMEdXRW4xOFdsajl2OXFMeGJCbEp6RXpkSStqM1BadU9iSTVo?=
 =?utf-8?B?RnJFM0NtRm9vU01pYUNBRG02cXVMYUFub2Q2UGxiRWtucmJiTG9yT2JOTFds?=
 =?utf-8?B?WThhalNKTjc5elFlaFBhWHFlYjlIbGh1ZnFQamNNdEdGcDJYZ3hyN05yekVz?=
 =?utf-8?B?SzIrd0xjaXJCb2dRbWVLelBOS0trSHQzbDVjUkVxQ3Y2SWhITHhYTlhYN2c4?=
 =?utf-8?B?aHFndVBncVAwM0hoSytHTHhDVC9UcDlCV0JNbTNCaEg2VU81aXI2SXVmQ2s4?=
 =?utf-8?B?WVBpOHp5QVB0L3hha2VNMXlHN3ZVQ1d3ZkdiMktXb0hkM0FMeFV6MllkdmQw?=
 =?utf-8?B?eVBxUUVkQnFkc2FONllObTVvS3p1eTcxYXNxd1hieWl6SnRBYndYVEJCRGJH?=
 =?utf-8?B?cWlhNnByMEJCN0c2NTdnM2J0YVROaWErUzFxdFpPYjdhMHlxanJRQnQ2S2l1?=
 =?utf-8?B?cW1zMW83cmF4bHNyeEdEMWRmZkJLd2h4dEFqRUdxTWdrTXFIQUxRYUhnUTZm?=
 =?utf-8?B?YnlVZWw1VXRGRkErNWxIVERYV2x5ckFoaytnK3dOYm1NaFVRYTZpUjdjVHlz?=
 =?utf-8?B?Z2h2V2dzTTBMZnlQUk9LNnRqV29jSHNtSWRYY0ltTTcxUFZzWDJBWWxFMDFn?=
 =?utf-8?B?K29wYzVheUhZVXQzSmhXcmZkNHI1ZFBsdlpvK3d0bW84YWsrKzljRVkweG1I?=
 =?utf-8?B?ckR3anVGTWM2UUpxdU82azFoQWlGSldGUHRGdG5MNGpoemtVNXdBMU4xNTY1?=
 =?utf-8?B?bjdLR3k4eElzZHUzcVFONm8rOXZWZ2xRbmlNaHcvWjcvOHVZZlc1VU93eTll?=
 =?utf-8?B?WWhFZ0QvVzJ1VnJKWnhIY2tiT2ZkYTBVcStQTmFUSUExWFBZeHpBcnZIK2Z0?=
 =?utf-8?B?Z3l6LzgxRG1odkpleWJaUS9yQkNlRXhkUGM1NlhNR3JmQkRMVE9OeGR6M2tC?=
 =?utf-8?B?SXUxcDlrSk1UejkvNWVqcDFkdmY2bVZRSUUyNUNjellZMzA2QVJPYjBQb1l5?=
 =?utf-8?B?TDNOOE1HaFZ4SWpQNFBnSTNWb3JoVjl0VG1Eb3Z1M29VMU9XYzBma3hZWSto?=
 =?utf-8?B?RGhBK0ljTHltMFRsZWJMeklRSkMyUjd6OEZYM0QvQWdQYXpyakdHN2RkaWFn?=
 =?utf-8?B?SHUzK1NjZmNyRmVPY2NCL3J1V1E4UVB2c0tyTmpWV0NlZlZhRUxmUnBLaEJa?=
 =?utf-8?B?SFdobjlta29Pb1B2SEhzbEp0dzdwWUdBUlNuektiYlhsQTYxZVZUWiszTXFU?=
 =?utf-8?B?NUZER1luTWV5RFNhUlh0cUJMdWRFdWdGNTl6SjZOZE0zMEJOUXZnbVBDcVJM?=
 =?utf-8?B?bXlHN3BWL0d5d2tYcnVlU1kxR0FMd2l1azRBdCt1WXc4MXIxRmorZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1faa57-94c1-43e2-2d00-08df2073d60a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 10:56:39.3707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9erSBu/ExWaaO6QiuDx6bi/8IkJTDKFK6CaEkF/fObiSrdatk+b4JCp/J5Js1aR0H2lrZLoVfWfX8KKWomZYFb7PrZXe7ZQHUv92Q+dI3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB196443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247103

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTE1MDI4LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi0xNTAyOAoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0LzQwYjky
ZGUxZGVmMDhlNGZjMzE5ZDU1NzAyNzg1ZjgyY2VkYjdlZjIKClNpZ25lZC1vZmYtYnk6IEpha3Vi
IFN6Y3p1ZGxvIDxqYWt1Yi5zemN6dWRsb0Bub2tpYS5jb20+Ci0tLQogLi4uL2xpYmFyY2hpdmUv
Q1ZFLTIwMjYtMTUwMjgucGF0Y2ggICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKwog
Li4uL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuOS5iYiAgICAgICAgICAgIHwgIDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9DVkUtMjAyNi0xNTAyOC5wYXRj
aAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hp
dmUvQ1ZFLTIwMjYtMTUwMjgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2
ZS9saWJhcmNoaXZlL0NWRS0yMDI2LTE1MDI4LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmM2M2ZjZjIyZjIKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL0NWRS0yMDI2LTE1MDI4LnBhdGNoCkBA
IC0wLDAgKzEsNDEgQEAKK0Zyb20gNDBiOTJkZTFkZWYwOGU0ZmMzMTlkNTU3MDI3ODVmODJjZWRi
N2VmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGRhdGF1d3UgPGRhdGF1d3VAdXNl
cnMubm9yZXBseS5naXRodWIuY29tPgorRGF0ZTogTW9uLCA2IEp1bCAyMDI2IDIxOjUxOjE1ICsw
ODAwCitTdWJqZWN0OiBbUEFUQ0hdIHRhcjogZml4IDEtYnl0ZSBPT0IgcmVhZCBpbiBTVU4uaG9s
ZXNkYXRhIHBhcnNpbmcKKworaGVhZGVyX3BheF9leHRlbnNpb24oKSBwYXNzZXMgUEFYIGF0dHJp
YnV0ZSB2YWx1ZXMgd2l0aG91dCB0aGUgdHJhaWxpbmcKK25ld2xpbmUgdG8gcGF4X2F0dHJpYnV0
ZSgpLiBUaGUgU1VOLmhvbGVzZGF0YSBwYXJzZXIgcmVhZCBvbmUgYnl0ZSBwYXN0Cit0aGUgc3Vw
cGxpZWQgdmFsdWUgd2hlbiB0aGUgbGFzdCBudW1lcmljIGZpZWxkIGVuZGVkIGF0IHRoZSB2YWx1
ZQorYm91bmRhcnkuCisKK0hhbmRsZSBsZW5ndGggPT0gMCBiZWZvcmUgY2hlY2tpbmcgKmUuCisK
K0NWRTogQ1ZFLTIwMjYtMTUwMjgKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0LzQwYjkyZGUxZGVmMDhlNGZj
MzE5ZDU1NzAyNzg1ZjgyY2VkYjdlZjJdCitTaWduZWQtb2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8
amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgorLS0tCisgbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRf
c3VwcG9ydF9mb3JtYXRfdGFyLmMgfCAxMSArKysrLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9saWJhcmNoaXZl
L2FyY2hpdmVfcmVhZF9zdXBwb3J0X2Zvcm1hdF90YXIuYyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9y
ZWFkX3N1cHBvcnRfZm9ybWF0X3Rhci5jCitpbmRleCBlMDdjZmRiNjNiLi4xYzA0NDFkYjZjIDEw
MDY0NAorLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfdGFyLmMK
KysrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZm9ybWF0X3Rhci5jCitAQCAt
MzQ0OCwxMyArMzQ0OCwxMCBAQCBwYXhfYXR0cmlidXRlX1NVTl9ob2xlc2RhdGEoc3RydWN0IGFy
Y2hpdmVfcmVhZCAqYSwgc3RydWN0IHRhciAqdGFyLAorIAkJCQlyZXR1cm4gKEFSQ0hJVkVfRkFU
QUwpOworIAkJCXRhci0+c3BhcnNlX2xhc3QtPmhvbGUgPSBob2xlOworIAkJfQorLQkJaWYgKGxl
bmd0aCA9PSAwIHx8ICplID09ICdcbicpIHsKKy0JCQlpZiAobGVuZ3RoID09IDAgJiYgKmUgPT0g
J1xuJykgeworLQkJCQlyZXR1cm4gKEFSQ0hJVkVfT0spOworLQkJCX0gZWxzZSB7CistCQkJCXJl
dHVybiAoQVJDSElWRV9XQVJOKTsKKy0JCQl9CistCQl9CisrCQlpZiAobGVuZ3RoID09IDApCisr
CQkJcmV0dXJuIChBUkNISVZFX09LKTsKKysJCWlmICgqZSA9PSAnXG4nKQorKwkJCXJldHVybiAo
QVJDSElWRV9XQVJOKTsKKyAJCXAgPSBlICsgMTsKKyAJCWxlbmd0aC0tOworIAkJaG9sZSA9IGhv
bGUgPT0gMDsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xp
YmFyY2hpdmVfMy43LjkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJh
cmNoaXZlXzMuNy45LmJiCmluZGV4IDJlYjIyZTJkNjEuLjM3MTk5NjVlZWQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjkuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuOS5iYgpA
QCAtNTEsNiArNTEsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9h
ZHMvbGliYXJjaGl2ZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYt
NDQyNC0yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTUxMjEtMDIucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYtNTc0NS5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly9DVkUtMjAyNi0xNTAyOC5wYXRjaCBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwOi8vbGliYXJjaGl2ZS5vcmcvIgogCi0tIAoyLjM0LjEKCg==

