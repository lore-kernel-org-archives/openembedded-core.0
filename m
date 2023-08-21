Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264D9EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 21:48:35 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.57])
 by mx.groups.io with SMTP id smtpd.web11.3529.1692654509013519366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 14:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fkw11cCJ;
 spf=pass (domain: siemens.com, ip: 40.107.6.57, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcCpiDmqEO5xKyoY3odV+5QLa1o83A8GGaf+308KY7RiA8Y0E/GNZpv+MuysA7i320YV80WxxLrf+1gUHQgdTO7m2cIZnybEc7+jsAVmbdKRBIv0HkgiSXg94CGzWn99MzIsay6Jbi7/4Sy4mudva0SVoDIecOxF6YVUTHli9gugdphbcpB8rrAGyw2pr0AkolIYpv679Qp87Oedt+JgxWcpbR492cjj7r4KuoRQnYw7GDlJAsh/JHmLVFXx7JPF0grKUw07d/+aVUrrluki5iCTfcS258Dl4b0Yx49dkr04h7rRml/THcm2mPkHe+K01Mc71e+Ldzs8G9LmSDKr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8v5Tvmv/r5mNsZv1dEsKUvBHs/2BLXWXeTXamLMGKw=;
 b=ea8DEuLRGYiS9HOV4jWYIecjZmgwafyo11M+uM4Fzo4DgdxbxrxIWL3Ydvfu7ltbj7O08j+ZdO8llt2MVIusG9FJab54UyTdV+qXsmz6LQMZHKYrUk6FOojgZpdb2k1YmRu3DFkpKwCLv3H/N/GNTSocVBI89TtLX1pnbkxhANvQ+eJwqXffPG0nzKz8f4OMV82I9/gsWQc3Yknl3EHG9cK0x77GV3XjHmXhICU2cC/L6bjUY6iRipO3F294zV9Jn/sw4jM+/b5VhS1xil8aztJY92MvLAIbgvu3+JeqhZ/WJDHFfuCorIku306mTrLBZ/fBBBr09VNea2DSWFBE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8v5Tvmv/r5mNsZv1dEsKUvBHs/2BLXWXeTXamLMGKw=;
 b=fkw11cCJiaSF/+Tt2+fOn39nz41Sp/Tao55rrDK123qs1dIvqljbhd1ffLW1bjkNwvdAeICrqZg8KBCh5W3aliycRf7gpJDzzaKTskRrGd2FRc9heXCcauTAghDEd6al6BKrZATUSvvpDNToB4aFfeEKgedESMDXIVFrCTHMi83Z46RTrhof7DtY4nWeOqIsVT66w0PYIvQ7npyAOKCbRCavsvgnuDBfZf7H/ELBNBSTZ2CVoXvNwGtUUl+svD53ubac4D2uAANoaErSCgFymtRD1tUBuXtouY5J1XUVTedFamvZbp6ZTR91Wte2zTopllQ6d9Hoh5MsbhHcCX6aAw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB5PR10MB7667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:489::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Mon, 21 Aug
 2023 21:48:26 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b%6]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 21:48:26 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] devtool ide plugin
Thread-Topic: [PATCH 00/14] devtool ide plugin
Thread-Index: AQHZ1EotpV9LlmzIi0Sj5KOYYVQnXa/1SdYA
Date: Mon, 21 Aug 2023 21:48:26 +0000
Message-ID: <5890c6537f5368d1192bf8754d9dd72846a510aa.camel@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
Accept-Language: de-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB5PR10MB7667:EE_
x-ms-office365-filtering-correlation-id: 65180641-6b9b-444a-e576-08dba2905999
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KzNRqKV92eCXlsGH0Gsomypjzky6PdQj1dHHJLvKlsurgu3RszcqVWPHhrwSn9YhLwod3lPBQTzcwurczRUYe50GyvASefnH/GjcHneMq16WrgZrXguNvO7i8Fki5Wj9TwU66U/KFLCh/gKTuH19x/Rau5OBz/o8e41L0fLHuMMg0i7L+RgI5piow18NuFGBZ/Xl35qLqn82S2aLBomu8gyXbN2oGvCB8iE92B9DS8Qetn3dpknu1do5EktEN+KNoUy0nDBqBd2oI9xFCtP6S7UL7gPe//kOJQBpR4whLb1NMjJcswrg6RH1x1pWrzs6qruSPsoP9cdoNixSHA2aTyyMDVh26tFr7qOkDzOi22pg8y+Yynm6fgfcdQF9sXOIjVh89rbrg/7o8sUwsyNAqa6mboVhjx95R7WpXFdHZp2NbattUQ3hjHDMIl0NJvuzg63hjRNHLd5ezVXFH3fMAt4FVPr6XN3FMXkQr95ixEMhHVCCFtrkE/jubHTU0o38uPPiOsMQVWQt+FuptZxxJtUHCTI8sgQex62HZkGsZLXw/eqyHzZFPDaLcFHWBYbXRr+vyPezF27pE4n9jO7TrziCKRmycpO4sHBKAmgkyiY4erdtZexiboOniZGiHJYh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(76116006)(66446008)(2906002)(91956017)(6506007)(66946007)(66476007)(71200400001)(6486002)(6916009)(66556008)(64756008)(5660300002)(8676002)(2616005)(8936002)(478600001)(41300700001)(316002)(6512007)(86362001)(36756003)(558084003)(38070700005)(122000001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?REZBeGlFMDJoMmZZTUQ4UEdLTUFxVEI5NUJDbUZFNmxXWEpidWJYZlhOMXJr?=
 =?utf-8?B?VFhZQmJoNjRDd2dvWFNEL1U0bmFqMDNTUWIzV0FEcFpkZ21VTlNPbjByK0Nr?=
 =?utf-8?B?em8yd1pYdTduRkhmQ3czVkY0aXM0T00vM0pqTmRadzBBd01KMGpDRmdoM0pv?=
 =?utf-8?B?cTdhbHdQd0E1SUtPcC9OREtoR3BqdDRXcFNFdlRoMEw3UXRyZ0k3aTdOT2tZ?=
 =?utf-8?B?YWFwVGc1bmF2K3owM0pnWXdSN2tvTS8xTFNiSjEwUnl2K0V0L0pRaktlRlVl?=
 =?utf-8?B?REx2UWdJQ1pHdmNyMlJsRUhqdUlVNEtaWStMYkRNWFZWNllNZ0ZUV09naTlZ?=
 =?utf-8?B?UmVucTJYNzcwR25idDJEZ2w5Z0pxaS84dU1KQ2RvRlpFUUpHRW9CR2kxWjhT?=
 =?utf-8?B?dml6KzZrNmU4dlpZTWlCYTZVTGxqSXAwTHRDTmNnMExzQWVkVDdnN0hOOVFG?=
 =?utf-8?B?NzcxdjA5eUZhVDA5SG9FUnJJdmdFbHR4SWUxUU56bXFWRXhDYmFkU1g3VnFO?=
 =?utf-8?B?Wk92cUZOQk5zZkFWVko4QVFrN3lkK0lRcGNudjhVNm1OcXJwa3VIZ1AzM2F6?=
 =?utf-8?B?MEtJYjQwQmpiTGg3Z0M5YnYvQW5seGxMSTd4Y3lUMDBiTG8xZGRaYkJldkkw?=
 =?utf-8?B?S2lFMUpURTFDekNuZDY2SHc1ajArNEtONm5WSk9FaWJJSitpSC9qL3lwbS9y?=
 =?utf-8?B?S1lQbGo5WU5qTGU4VWkzSFd5YlJOa1NGZjJVL3A4ZW1BdUVYRDMrVkRuNDU5?=
 =?utf-8?B?a3hNbXgzdHl6ZTEzbGFRVXVBL1hEZzEwdGhCR0IzWmQ1TDQ0N1VrbTI3SHA4?=
 =?utf-8?B?YnRicG1UUkZ5cnFFc3pHNW1LbXNmQ2dwNmFPQ0tmRWd3eXN3ZW5jRGhkRGlV?=
 =?utf-8?B?RDZIQjVmNE1IL1VrV2Z1aXpydWZqRXM4RS9VeXpkYU9qNVZ1TmRhWHRVTEdE?=
 =?utf-8?B?aE9nTW9zUUxGZDZhQ3dOYi9QWVJOR1VRNXNYR0tPU21GOWE0RlhWK251WW4y?=
 =?utf-8?B?L0h5R1NlK0Rna2J5RkI3V1g3RXpLOExRV1h6MVcwNUlKdDltZkdEUkg0QUQx?=
 =?utf-8?B?T21wWXFsT0tQYzgzRENyazVPVDRpd0pXLzBWZFdieVVsTFZqWlI3QU1jenlp?=
 =?utf-8?B?aTNENWU2bDVqTnNidHVzMU4yUHlVa0ZlYjNNWlFaUmJxd0hFTlkwS3dPbzcv?=
 =?utf-8?B?RnV2QWtKaHhpNytwV2VBTHI2Qk1Wall0ZWhYbWVvUFZ2blg3T1BOczZlT0cx?=
 =?utf-8?B?R0VUZjk1WVJDRUxOZ0ttenRrOHg1a0lRaTBoU1YwcEpoNjdibEpyLzJ0NGVv?=
 =?utf-8?B?dEp2Sy9FaGIyUDNkY1hZVmZocjVmRXNPSFlVTmp3Nk93ZERsTVlRR1R6THNP?=
 =?utf-8?B?aC84ZnZsMmM4Rmk3WmRVTG9wZS95MGpqaVBaK0hXQTdtMWhiUi8yTHNsMitW?=
 =?utf-8?B?SzdrdnA4bTRtUTl6ZFpWbkxVcjl5cjhiODlGVU1DRkR6RjZYcmVReVpFZGdH?=
 =?utf-8?B?VjN6T0hWRkVPUUp3OWRPYTNRZXA2YmZtVUVxQkIzcUVhMWlPUURsYThBdkVM?=
 =?utf-8?B?K2lIdGVOR1Y1ZEZQUFVEK0loUXN0Vjc2eE1wdXM0N2krQXJYTkdleDNaSDhU?=
 =?utf-8?B?VUNVMlJ6Tnc3NVg5TlJEeTg0TDhGNlJibHJ2UGRBV01Ed1pHOWk3QVF2RXhq?=
 =?utf-8?B?Mys3ZFdIU3JPa3BqMXZlV2NhdGZ3UTRVUldNZFBjOFpGcytZRWhGRGhhYUhG?=
 =?utf-8?B?N00yK25TQ212dldTamluVUYvTWFVaDlxM3pVS1UwZHRBU1IwSHZMUFUwcVJs?=
 =?utf-8?B?TmNjc0x4bldqQlVmWGZDL3VRUXRONHJzVHErTUdsZGVBemEwcENxVGZSbk8w?=
 =?utf-8?B?bTRQUTBsZ0EwM0QzdWNVVnNPa1dwbEtwL3JhNklXREkra3dpMnhMaHowQkY1?=
 =?utf-8?B?bjhiWGsrYjBEem1rbXFreW5Kb0xmdndSS0lMVllnc0pHZVlTMWttRXpDY0hL?=
 =?utf-8?B?TWl0Qjg0RUhiZnVxNTBBdmNnYVhpQmJtSXYvWFNSZ0xMbjJhYmFERXlkUnYz?=
 =?utf-8?B?Tms4VkxhbG8zc0hRSXJoaGh1Y0lqamJPWDhKMnoyc1hTVWZiampXT2RCYVNN?=
 =?utf-8?B?bmtDSjMrQkpDcWJCU2k4V2FueEdIdVd5ZEF5ZHgxUzBZamJUVnZ2QWRRNEhR?=
 =?utf-8?B?SWY4V2NaRDA2aTFkaFJIR3kvTjBVSVkzSUhSMWUyciticEVyblE0T0JuUDJT?=
 =?utf-8?B?THVGbmNXQXJOU0hXK3dXbE5jUUxBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EDC45555887BD4E9414AF60DBCDD15B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65180641-6b9b-444a-e576-08dba2905999
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 21:48:26.5092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kTxYoA3L8cTP0m4lOKm6NWdJK+IlF6qhwA7kpbW+KCE82idhrMh3HImFDPsOmbZAHipbzw03EpHAE4kDYxMT9yzo1BzvAp/vGWebQ3gDuJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 21:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186486

T24gbW9yZSBoaW50IGZvciB0aG9zZSB3aG8gYXJlIG9uIGtpcmtzdG9uZSAob3IgYW55IG5ld2Vy
IGJyYW5jaCk6IFRoZQ0KcGF0Y2hlcyB3b3JrIG9uIGtpcnN0b25lIGFzIHdlbGwuIENoZXJyeS1w
aWNraW5nIHdvcmtzIDk5LjklIGZhc3QNCmZvcndhcmQuDQo=

