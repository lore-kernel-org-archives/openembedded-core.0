Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FE8D41C30
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 10:30:30 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.57])
 by mx.groups.io with SMTP id smtpd.web10.9110.1731493821380650835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 02:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=DeHhYuj2;
 spf=pass (domain: infinera.com, ip: 40.107.94.57, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsb0CdIB5iNOCnZR+l86CBUWvKeoSyzTorfUzYXg0eBwX/cT6qNHbIIFXF0Tf5WZutyjYhrQ+4onSRBVSMdEsY8UiovPbobcoNrJiPJzUzXZu0cdpc+J7WwKAwjptU7O134h7gJjzNiQrAjJL/tpcqYNMegbypUgYMlr7oV9VHNZ937qqzTz3dwQAVvAh4LEbXxz0nFQnCiEFzGinRS2/HOzBm5cODYmiEZ9lmrOyVH5x2B/YioIbv3o/EfOPwbUV+LbwO03gefH6dgSJbGR9sxiXImn3aU3bPLFswhn5RItcwf2rrABYvtOfA/TKS3tN6YwRyerrmj3//6GvH54AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVK+ErIuiF5OUodQHsrPaZ9ShG6auRGhYlsh58iuy0g=;
 b=mqIXfmfVKdbdtFxXs2nqO/QapJPg88MsZWsEEE12gAGtpEXzlpJAWhwmbjtwGIbk3BgCryJfnRPF76xSIBObxQgGzr6xWs9exZdrjQvVPyriS8ol15Jj9ZzXbTtlcndetW6GeGEyGzie5+J5oNZoFE9KXPE2xV7tUlq2/oymd7gAhoR325Z/R4Pd0n1ZAAOcNpUN3iT++CdaK3o9/mUOqtv402Mm3amwgaRcc8lHvaXA/u1bwchFwR6mm8CQD/Rsaq38UsQRQlKrXWlq6dT6ZyNpuchnKA9z0pHId9pw+Q/2BD3mIJVYmvJz5hC+LvA+mGX9Ty8Oz+RwQzH8Sgm2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVK+ErIuiF5OUodQHsrPaZ9ShG6auRGhYlsh58iuy0g=;
 b=DeHhYuj2xqF6PmOaDaqkOPXfw3gMttE0rRwwa06UOXA2FZ5O8qbC+1ti89Tvb23TJQMq8iAiX8nLxZUxgolYcmvPTkb/GXyvd5bhJbwLEkZRPe5InEe0e2iVtsH3qf/nrSTVJ4x9Md0xmG6pSTKBJ9nmLunIc8jWlyTKzt81E2oQPr/Rpmu29uQVFxsah+85ZytJyTXP4cADOonaejBMRUt6aoFKcA5F8KLaEY1/jWta8yFQxAJpFOOSC31XxlcvVVcR8tysHeoUAS8GkZ88s/goqrqGgZ1QcFeDlwmsnf0hjlPZrkKLRvD81LsQm5xX3hluj0UKoVAsSmDxJiT76g==
Received: from DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19)
 by BLAPR10MB5107.namprd10.prod.outlook.com (2603:10b6:208:324::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Wed, 13 Nov
 2024 10:30:17 +0000
Received: from DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406]) by DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:30:17 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: PREMIRRORS ordering seem wrong?
Thread-Topic: PREMIRRORS ordering seem wrong?
Thread-Index: AQHbNbcInpiBgUGeEUWkPMStCUYvqg==
Date: Wed, 13 Nov 2024 10:30:17 +0000
Message-ID: <5e358010917ca8fd59bd2d31bdcc12adac6ed478.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5197:EE_|BLAPR10MB5107:EE_
x-ms-office365-filtering-correlation-id: 66268921-0e7a-4f6b-220c-08dd03ce2afe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eFZGdEpyN2JrN1hqdk1yM0RjTS9VeXJrRzV2MjZ5MmFoZlVQM0NPOUVSd0U4?=
 =?utf-8?B?NEZtamRmS2lGOVdFSTdMWTZFNVdQSTZhM1cyMlRCUVl6MDI1SjB1UkVKWVp1?=
 =?utf-8?B?YWdaTmJzOEx5eDQyUHFNZzFkcGIyQ3YvMm9BbE9kTTlaN1VwOWxhL28rWkRG?=
 =?utf-8?B?YjBBZmFpbXBvQ1oyaWxZcXRvR2Nhem1jRkpZSlYyWVJxNzlSZzArUlozR0JL?=
 =?utf-8?B?bThQTG9lV0tZMENIM1NzaWh2Nm5LeDBSVi92b0l0UkN3Q042dG9JZDY4ZWJ6?=
 =?utf-8?B?TWY1cWpJeTdhazAyRFVJOENpUHI2dHhZZXUva2ZCdWcyZzBEN0hoRGQ1UXYr?=
 =?utf-8?B?U1c3N2RVTDd1UnY1WHhvRk53b3kxM01DOVlGcmtxcGd6eFNQUmVFcTYzZy9P?=
 =?utf-8?B?SVU4RlRkMWF3aU9FV0QvczQvYmdNSHAwVlJnYmRmQ3hIZXFGbEszUitBdytE?=
 =?utf-8?B?RWdkMlBFYjNmVWJXQ0VKQWxnNnlDUG9mNE1QVERBNzRvRHFqTkdBWHJFcWNK?=
 =?utf-8?B?cDhITFpIV2xzUjZHajFYSnVYV3ZLemVaOFBPV0U4TmIzWFBCcFhQSnRVQ1Jh?=
 =?utf-8?B?cGlhOTlpMkNyZk9NQ2V0bjVQUkpvVG8xWFo1d0NOSVFCbDdRcUQ3d3IrKzEv?=
 =?utf-8?B?N1E4eTN6dUh0Z0pBQnZucElkUSs5ZlUyODNjMUNxVE93U013VnVDRkx2c2Q3?=
 =?utf-8?B?ZjRtRGFlanVJeEI3TzYrT21kZDdnZEUxc0p4UWxNcHlTQkVXZ0xSUHh2dUdz?=
 =?utf-8?B?SHhGWE1nbndsVkFpRVpOLzJpU0xKVmZab3pjQ3UzR3BaM3VIamRxRlB5VlZ5?=
 =?utf-8?B?ZS9jQWlGaWt5NGR0QklKcCs5b3B6MmswUFp4bHhJV0UrdmJZUndzZ3NCRUJq?=
 =?utf-8?B?S3l4c3JsRHFJaWVLbzlIMTVETXIrWnhFaHMvUmNNTUdqcm9vWkJkT0xnQ2xU?=
 =?utf-8?B?Z21DMW12WWh3M0FxdmJPdkdhckxZMHJEN2FNU1hTYkg0b0dqYkNhVW9qWGt3?=
 =?utf-8?B?MWk5SGRKTEV1TE5aS3FNRUphSFBSNTFZSVNXQWJIc1Z2N0VOUE5sbjR0enIy?=
 =?utf-8?B?OFdnQlBPSkNFTVI1VDN3OCtWVFJKQ3VXeWJja1VUeGg5RHh6WXgvR21IN3Nk?=
 =?utf-8?B?NTB1cHRNYTBudklSRGdyazh6UDNJODdOQTRFbW9RM1lyeUoyL2lKWXk1dXdw?=
 =?utf-8?B?aXcvZDEvYU13Qk5ZTGVYOWg3SXJUWTBkMU1xOS9hV1lIcm53TmorK0Z4ZDhs?=
 =?utf-8?B?RzFaY1dmY1A2a3hpZ0IzbGltMkIrUlZxdzJ2NE85c0hwOXp6YkJtd0pqcVhp?=
 =?utf-8?B?S1dGeXVqZmVmRUl1VE4vL0kvUy9ic29XM3F4UkhENTBTY3BjNU5pbEVSUERz?=
 =?utf-8?B?TFRwa2pJbTRHSVJsRkdobC83Z1NoNGZ0QzB0Z0lnZ2RCd0M2bkJLb2RySHpM?=
 =?utf-8?B?Qnl6RUxtTjhCSkp2TVBqcFhTNng2M2xlRW5rak9OWnMwY3lyTHhiK0hFcEVG?=
 =?utf-8?B?MENFYjljd042blMwRmhQVHFTYlhDUTlDK0JDSFRLdlFYKzJoUWhnSS9KL1k0?=
 =?utf-8?B?bnBIOHpxMEtoelp4U1dBLy9rK3lvRDVxVTFNN0tpNlVNOStwWW1Gd1FwWW9U?=
 =?utf-8?B?eGVVSXh3YUhQY3JVQVJYanZZOXJxSjJOV2h4SXA4RzBiVEsxOHpjb0lMUldj?=
 =?utf-8?B?cnFrWUhvZ0VWVjFjMzFOc2NLa01POTZGVGdIa2NGT0hYVWhLU1RwUVBDbUlz?=
 =?utf-8?B?UnZrUTB2eFVsSFFkZCtNSFphSFZIdGZHVmRtbG5RUWQ4Z0Rtck1QdHJHVUtt?=
 =?utf-8?Q?hwJnYZrIml6JAvT2PZwLiv51NvZd1vkVyz8rI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5197.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zm9RUGdPdzdlN3ptaC9HTVhXamF5L0NMa1prSVdOOXpjd1ZxYnVkWEI3MVJL?=
 =?utf-8?B?N3VmRkJXMzlrNnY3cGJZQ1M5SThXNFUzckRmWm5TUHZhdld5MWNUdEpNTkcx?=
 =?utf-8?B?SkdBOThqVmNLRjNGbExaK3ArZWdveWVOb05jb21GbWFyU2pTU05xZHNiTlN1?=
 =?utf-8?B?NTA3VXdQVjloY1dwbU11Vm9YY3pZOVBqOTRRejZ3eHhPcnNaNVVwbFlvUWc2?=
 =?utf-8?B?TXpnbUpUSmMyRllVZHJDd1lraTJVV0RxbkZUNm85eW9hU1BKTzgxblZmTWJp?=
 =?utf-8?B?eHRIR3dwdVhvekY1T3BkeGZXSWpvTnpBRnhMUzN4TXRiZ0xBUDd2aWRJelp6?=
 =?utf-8?B?QjkxWFptVEo0ODM1M1hIMGJNUk9zbG00V2V3WWZ2UHlUNHgwNzlXSEZwQnFm?=
 =?utf-8?B?bTV2Z0tpbWpxeC9CSW43T1A3am1xdW5xZko0Y20zOCtQa2cyTDdNUzJBU284?=
 =?utf-8?B?UzV1R3RJNkNZZ1ZKamVRdUUrTjBwc0JmL2RibllPaTVacnNuNWYrdWZNSDdH?=
 =?utf-8?B?QWFLdjVGMUw0K2V2cHV6RUw3ckU0clp6VFZ6a1BPSzN4V0p2b1JWLzZXQ01B?=
 =?utf-8?B?MzVISFpyL2ZUUWxPZFVEa0Y1ekN5YVh5NHhRZFNrTEl1UU5Udjc2dFkrdEZp?=
 =?utf-8?B?ZlMyMmlGL0d3L2dKYnpCeUFDV2RGSWg1Sk1DOVlIWVFOL3cwRWptaHhub0hO?=
 =?utf-8?B?OGZvMnpTZmVqWmlVb3N3SXhBUzVrbFkwb3RQYWdsYWhNUUZLNjIzT3UxcWtR?=
 =?utf-8?B?UFkzRnRwRi96bzUycFdycFVtUDUrMUpRMEtuS2xZUWlidkFZNThYcmg0MGM1?=
 =?utf-8?B?YkxVa0M0Ym5zZm1zREl1UWNzTmNCa1Y1RlpWbGszWEI5S3N6c0hJK1JJaEhy?=
 =?utf-8?B?Y3FWMGlzYzZlUEk3NjZoSTgyNlgzUExlMHBibG1TU3czUlRyUlROaUhSUGtB?=
 =?utf-8?B?OTQzZ254Y2c5cE5PMkVYME43cmVNRVFZVitqdisvU2hpdGRqa2IvczJwLzZy?=
 =?utf-8?B?MU10eDRvcjdDVVFxQ0tjYWJFT2hCSWowZk90ekx3NHY4UDZvbmkyV0hvWjBO?=
 =?utf-8?B?cXJkS3lzMjJPeU9zZktBV096cHo0QTNrelhzZDFrZjhTdmU4cXBpVFB5UWMy?=
 =?utf-8?B?c05qU1VvZmJ3aGs2a3MyTlBzRGxSZytVSzBkbEw4MzRhZ2Q3K0t5ZWdJelRD?=
 =?utf-8?B?Wi9FMUZGS0hldW9STjV2aEsxdEJENFVWTGF1bXhiLzFkSjNjMTRvSmpQczVS?=
 =?utf-8?B?bGFCVUYyV050SUw3QnZFZlBZNklxY01xdGUwVWFqYm1wZTVSSmJGWDFlM28x?=
 =?utf-8?B?VkwxVFJuUDgzdUVZQnB5TWdkWmlGVi9jZWV6bzFUTnBkWEwvRGc5MGpRbGlY?=
 =?utf-8?B?d2s2UVFRRXBYbFBRWERxNnJER1NOODhQbTNRVlpkMERrN3l3aElhaFhUaGZo?=
 =?utf-8?B?T29kZ3lGMjJqVDJOMEM3eVNpT1N6WXVZUm9TeXU4YytSc01laFovSW5mY1B2?=
 =?utf-8?B?MVBKNnU5amYybDYrMEVWMmJEbXpXVmhNOGd5VmNoc01JcTJCSU5TSUdIL01Z?=
 =?utf-8?B?dEhtem4xZjg0Z1NITFZhTzd6L1hBa0xSbmtkbFlhUmNlbDYwTXZmdis3T2ps?=
 =?utf-8?B?UVlZbHlMRWVmK2hiV2wzNlVmYUttaStEbWFURmhucUNEMnBDKzBGNncwb3Zx?=
 =?utf-8?B?QTlHYi80c25HN2dCajhhMCtoaGNHT2xKQ29HKzRkWm4rT0QyT3Urd0FIWjdI?=
 =?utf-8?B?cEdab09xTU9TVTdlWVdBOHpkaCtZVm1SUFl6RzdzMVJFV3NCaU82cUNib093?=
 =?utf-8?B?ZXlDU1JTTEVKRFEwSFdydFdDMHdyQTZZMEQ4NUk2S0FOZUdncWhraXZJNUlr?=
 =?utf-8?B?dUlLWVhTd3VpeG82QmV1N0tvSXAyM3NoT1g1OHNTZVJ1eGFDMktxa1NiMytF?=
 =?utf-8?B?NVkwVW5rSldWYmV3aUtMM1drU1RFdktobFpHd0VtYXVlazJZeUNkOWhxKzN2?=
 =?utf-8?B?bG4xTTVSbjVpK2QrUlhCUFE0NFRtbU1jN3JSWXZ3dUtTOWdYeDZKa0V0SXJ2?=
 =?utf-8?B?TjN2SVJ2QXJsTmtoK2Z2amtGT3hLZXhTcHROL3lxVDZoM2lGb041Ym8xVEpO?=
 =?utf-8?Q?oCP3nn4CYhP3kJygY/DYXRS5v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6843B2FBECB2F5459A812E539A16F42D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5197.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66268921-0e7a-4f6b-220c-08dd03ce2afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 10:30:17.5540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdWg4PdZQvTg+FNaWJ+L0PmQZPli9B2JS3Uoklpd92GhwiqrMfpN0BKX/baNivFQygjUi7ic8DpMGbnR+q1yng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 10:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207095

SSBoYXZlIHNldDoNCklOSEVSSVQgKz0gIm93bi1taXJyb3JzIg0KUFJFTUlSUk9SUzpwcmVwZW5k
ID0gIm15IGdpdCBwcmUgbWlycm9yIGV4cHIuIg0KDQpsb29raW5nIGF0Og0KIGJpdGJha2UgLWUg
bXktaW1hZ2UgfCBncmVwIFBSRU1JUlJPUlM9DQpJIHNlZSB0aGF0ICJteSBnaXQgcHJlIG1pcnJv
ciBleHByLiIgaXMgbGFzdCBpbiBQUkVNSVJST1JTIHZhcmlhYmxlLCB0aGF0IHNlZW1zIHdyb25n
Pw0KDQpUbyBtZSAibXkgZ2l0IHByZSBtaXJyb3IgZXhwci4iIHNob3VsZCBiZSBiZWZvcmUgdGhl
IGVudHJpZXMgYWRkZWQgYnkgb3duLW1pcnJvcnMNCg0KICAgSm9ja2UNCg==

