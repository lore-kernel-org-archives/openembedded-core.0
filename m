Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E8FCCF2DF
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:44:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32931.1768819451196356876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=gfadeGoz;
 spf=pass (domain: ericsson.com, ip: 52.101.72.38, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLPJ4/rQH6HBfJSgBn5hcLbUmJxpBDfKztFmAzJjGGDLsjhJIqT2XPzhpqTZP+NNOA60/6upbQUxZcG/EphynMJXO5kDuTITZ4f1//FnphkhoVxA6BpAssgsFK+h+6flrlqXMrvkFGfd9nY7FydMu6F7OY49HrMBjuWKwAUGa45STe4CfyaGo1HGnG1c/H7sO5xRtTwmvGj7fUSs49GzTxz1x/auVNEYD7cmi61D3Um+JN0S6dVZNTWM7WaxgcBL6cb2geb14Zcdh1eQ5uhdcLNXScHTCVOsxb2Zroxtc0FMud7gN6XtSk0mhSw+Pj2BTl+XSqfaPZQlrlVH72nb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrRDNsIstOX6zzxgPn0+93T1pcPLZoPzLc6r8zjv3r4=;
 b=VHnyCxAo0lFmq7p+yag6o4CREom9xTzBXiK8w09FDvbzoRoR/hZFCp/y+SisEcc4hnZa+5FGjsEhjekK/LtD0s4Ywzcj0c1/J3CNL5ahb1EGDp8v54LkwzT4hfp8ysdwx7cqpP0VfgP0SxMYvPIc5CtoH6cSaMMMf/8Oah1dP2QKC1xkAKNjrqq589ChQFxQl2tpVOgNVrpMREa7v1YAfKR68ZDM0GM3ynh4GkfMqMVGW2lcB1Q7cDnHfvYDMq66LLkvBNb/MaYBpszgBREUA/W6QFX9G3c82LlHMjRXZ+iLhYApjh07vgOHcCdmdtXVFYOIaEzEZAsYqmooa06eJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrRDNsIstOX6zzxgPn0+93T1pcPLZoPzLc6r8zjv3r4=;
 b=gfadeGoz4pBNpWzMKc1/3pjpajeDR6NEkwkhr+7nK2iSZKFktKuRoq621zlovNBwaPZW1PjyOS9uzgofweeW0QHY5a38XrfCZ9yK7+P/5j4myrJeqm5uqCZdOELvUQuqvcQdu0xnLVYpl7XRGUXZ9zWMbF03WKSpUbFlRfaFkF6iHiHqLQB4DIPE559PzjVCThwYa+A3TXafm0zWQSli7W+g+DRHHlF6p4yiTUkn7xgi8tvsnymtTNcpLkN65ms0FmIw6yNoNPPQDPF9zSdZbLujWkl2czcjyxzq8lvJ2DF+L1DQ+m6TH53h1TtiVzlL79WOsABob+uSJpI5pz3xjA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PAWPR07MB9878.eurprd07.prod.outlook.com (2603:10a6:102:386::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 10:44:06 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 10:44:06 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: ValentinBoudevin <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jerome.oufella@savoirfairelinux.com"
	<jerome.oufella@savoirfairelinux.com>, "antonin.godard@bootlin.com"
	<antonin.godard@bootlin.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, Joshua Watt <jpewhacker@gmail.com>
Subject: RE: [PATCH v5 0/4] generate-cve-exclusions: Add a .bbclass
Thread-Topic: [PATCH v5 0/4] generate-cve-exclusions: Add a .bbclass
Thread-Index: AQHchxweiKyVEeUqBUqv7+lcCgaEHLVZQFlA
Date: Mon, 19 Jan 2026 10:44:06 +0000
Message-ID: 
 <PA3PR07MB10721BA064F56BD71476DC4DB8A88A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
 <20260116190520.118714-2-valentin.boudevin@gmail.com>
In-Reply-To: <20260116190520.118714-2-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PAWPR07MB9878:EE_
x-ms-office365-filtering-correlation-id: 81cff7d5-804d-4252-a0a5-08de5747ab93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7142099003;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QS9mYmtHY2pvT1BOKzZobFVtYktyK29iV1NFUDZsOFowdnJvM3U0K0lwdXdS?=
 =?utf-8?B?Z0hyeGxlejRZTy9KMERlY0FzTkE0OUs3aGZ0OVRYdlpLWG11eXRXcnJkUHlX?=
 =?utf-8?B?R042NkxNN1NGa1VSQVIrWEc2MlJmK0NTN1lBUGdYTXpaUW8vbjR1a0tqZ1hZ?=
 =?utf-8?B?VkRCdlV4dEZWNHkyRTkvaXREZHZLOG16SC9PVTRRcGlHZmx3ODRBTEVDQ0Jl?=
 =?utf-8?B?MnJCSDZQd0VvSE1qaWNJd25pcHg2VmRZUjlVMi90K28yVm1RS2M0ME5LNzFo?=
 =?utf-8?B?QU1NeHpkeDZIWm03YTNuYlhuZmpvRHlCMnV6QlJSV0lpVUtrbXVoTlBDbzRt?=
 =?utf-8?B?UzJDU3ZtMUhoWUY5aU9XeFlieFFmVi9Xc2RYRnQvNnQ0SmlDYUh1enFOMG4w?=
 =?utf-8?B?TGE2bVRzYWtEK2VaMDExY3dGUXhRcGQ2UGhaeW1UdXc1NExKMjJSa2pWVlow?=
 =?utf-8?B?alM2WnlrOFlWaUtzWDFRRHl3SjljVjYwNVM4Lzkxb1NZWmsxdzhhamFjNnR4?=
 =?utf-8?B?cUYwVGh0SnB0QncxNmtJbDZ2UkpuL3UvSElwd2dmdzRJRjlBcFQzdFZubEE5?=
 =?utf-8?B?bWo5bHlESDF0aXNYaTAvQTBGdHJDcm9EaUhMMTRhcVl6TmQ2QTNXS2YyVElF?=
 =?utf-8?B?N0NnMmtxR3dXU1VvK2N4UXVWMEdWZW5GMnVmaGVkRnJCSUVhL3NBMkpVa244?=
 =?utf-8?B?K0o1TGNpb2wzRVJZcHFJUjFPMU1veGxuVURDODRJckNsWlUyRzA4NGdtaE13?=
 =?utf-8?B?Z3J6czd5eGhORFlycjRhd3RtOW40SndubEFmQkJpM0lVbHd6SlRJUHM1aWhk?=
 =?utf-8?B?VkwvZVhPZTdLbTdsUmZqblBEYTM3MmUvSlFlN3FnTnVOdHd3RUF0TWpwWGVL?=
 =?utf-8?B?eTRrQ28zbDZOTVdubGRTQ1ZNRkZCWXNaMEp5MlA5K1FhTllxMHYrQ1k4YjEr?=
 =?utf-8?B?S2R1Q2I5MUhLMk1CQ3hFZTMzTElOQjRSZzYyamZMSTJieU1QYUdRNmhtMStO?=
 =?utf-8?B?SE56M3RyQ2ltcGlCRkZNN1NMcnk5TlFwcFUrREx3UDNxcWlsSGVZbXFNd3BQ?=
 =?utf-8?B?TXNvNkM0SFNIcjJUbE5zR2VReFk0MFVIWDNEdTVXZkZRYnlFTmlvcEVEZmJQ?=
 =?utf-8?B?RjRmcHpsM3VNZStIcGVhV0d2OWtaUFcydnA5VEFOWnBWdFpPRmF5QkUvMmFa?=
 =?utf-8?B?VHI2dHhqYUtHbDc4YkUrYzF3aDgrOXF1UWQ2OENscnU4Q3cwV2VRNHlwQ0RW?=
 =?utf-8?B?MmhGZjAyckVrUjFpdEtsdEs4RG0rSm0yUklFWUVCQzBpTlo5NDY0SkVoRitz?=
 =?utf-8?B?Ymx0SkpCQmNWZDVyYjJYd1B5OFZvMEdha2pEc2M2bHpQRzhxbHg0alBCY1BO?=
 =?utf-8?B?ZktKc0JtU3gzUGxLTmxFY1crRmpjWWpTeFJEWDYyaHkxZzRKZld6RDlBclRH?=
 =?utf-8?B?VXJBVUsrVGhzN2M2UHpKZWFhclNxN3BWQTJiRjR1TlZZaXpBYTloV2Qrc0tt?=
 =?utf-8?B?bmE5N2FkN29GcXlGbVp1OTEzbmxXRHZYUjk4M1JMcGxyRTA1ekIwZnpmQTBn?=
 =?utf-8?B?aVRjc3dRcVZTMS9kUnJrSFFwWUo0c0NvTUZjUjd6eXpBVnpaYWZnSEg3RWhj?=
 =?utf-8?B?alJOc3lSUDZZNTdnOVZRcXVJTDcvYkZyZmZYOHdWb0RHenJDZDBUOU1kLy9h?=
 =?utf-8?B?bjJpQmZ5S1Nic3VzM2ZiTEk5MWVNSWJWT1BMTllPY09GTWhaaTA3a0VMc2Z2?=
 =?utf-8?B?Mys5RlM5K2RITmp3QjBWdHduOVFvblQxS2V3YXBvSDRjRXhrejc5aEtET2pw?=
 =?utf-8?B?OGkvSEFJVkZmWFovM092clZDWXgrZlZRNW9EeGcxQktENEMwSDdxeGkyMXBR?=
 =?utf-8?B?R2JPRlhZcThiVWQ2d2JkYWhKRmVxc0trc1FhcG0vTEFIeWd6NnRDSkdxSlda?=
 =?utf-8?B?NlFYL3JhYTJXMGZCM2dmL3NNcWFGcyt2aURaNWdZRUMzclI0NlJkaktPTU5j?=
 =?utf-8?B?UDZMMFBVbVNSdys1ZVF3TkhiUjlQdndhOHdEYU9sbS9mU1B4N0VPeEN6Zk0y?=
 =?utf-8?B?K3g4dFVNc3ZtZFh1MWxGTzJuaUhkc1FOYy9hU2ZoSSsyRlFvQXh3cGNSZ0ha?=
 =?utf-8?Q?AuI0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QnAwMklNOWhiK3JSVUhUQVFqWVRscWVPRDFMZ1U1aitHRTR6YVQ2MGk3UUJY?=
 =?utf-8?B?T2hKUS9NSS9zT2lPT3lMcll0emJjdnJLMTZXNGpTOS9KUmUrOXBPenllVDNM?=
 =?utf-8?B?ODhCUlBqTmp5aE5qM0pPVVp6WkYzSU5IYWNkMFREY1dnNUorOWZpcWFvOHRI?=
 =?utf-8?B?cy9kZjk4RzVDUmNTK1pHU2JCZnFZcjVzbDEwR0lXbTVOVENCQnhJUy81aWFG?=
 =?utf-8?B?UlRLMnpEcGtJa284SzJtQXltVk5nWEtMWWNWRW82TTdzU01uVDJvTFRZV21N?=
 =?utf-8?B?RUUvcWRHQmdNUDhKS0R6bkhwelhTb2tRcFhJV3VPMmVYYnR4MXYrdUdwMm5l?=
 =?utf-8?B?MEZMZ1pTSzNZVlpPU0FZU2IvamZYTk9CYkdpUFlKaXp2L205Nzd4aDdyYkFj?=
 =?utf-8?B?UmJNUmZSclJUSVlRR1BhZnd0cXFKTHAzdnJwVXprUldLVUtYR0NYbG0wMzk2?=
 =?utf-8?B?V0dyVlhwRTAwbG9wL2NJSjByaFZWVXNWQmZ3dDZvNlhTbytMSStnTCtMbVIr?=
 =?utf-8?B?N0dETWN2bm5LQ3R2ZlMzeTY3NFViVEZEczFvK3U1M0s5Zzh1elFqZ05BM2lJ?=
 =?utf-8?B?dWM3YUYrWml4SHpkcmFtODI0ZHRZNElGZDEzYW0vZ3hZbDVqY2loMnJpaW5r?=
 =?utf-8?B?dkJOZlkyZzRid1V3OU51eEVoZFFydkFwZDQ3T2l2ZXdpd0F4NWMvUGtBNTJX?=
 =?utf-8?B?RjRFZXROd2ZsclpWMmlUdFNXZEhCODJ5R1R5QWwzK29zM1NVa3MzZGcvS0Z4?=
 =?utf-8?B?QjYzWDdXMHIwRXZXT2cvNHNPeWpVWXJoekxFMitCOWhId0VsSnZGcGpJWWFB?=
 =?utf-8?B?NzB4bDNaTTQxMVhZaFZXZVIxZkRqdFowYVVCVTkvckJqWFJFcVBVemNyT1dk?=
 =?utf-8?B?eVdTMXJPKytrZkxUV2pMNGxsMStHMDhUODVwSXVMN2U1cTRCQm5QdFpZVVU3?=
 =?utf-8?B?NHFNd0EzVUZ1OEE4ajdlL0w3b0RRclM5K00veTBJRU12dFhVUFYvbnFIdXlF?=
 =?utf-8?B?OWw2Nm9hQ0djSHBMeVJKNTZkVVp0SnBSYTVveXJxOThBNWFuRnByRFdMSnFX?=
 =?utf-8?B?SVdjRnpXNjdlRzRGNGkvRzE0dU9GM3BHRWlHbkZ5RjBKamdaamVKM2FkZjhI?=
 =?utf-8?B?Q0hPWHJHS3FzTThFZEVHOGxId1dRRjBweGtRenJEcFF0WC9vTWNiZ1A2UTZR?=
 =?utf-8?B?dDZvcERyVmxTVFFlM3VNTVRKTEJsSFNsYlRjUWpjcWFiQUdXMWxiT2pRbzVK?=
 =?utf-8?B?QXNCMktYSDdlUlBCZjN3NE5hdkxGRWtoN0pjUmxWdm5ZNlZjclF4VXRUNmZh?=
 =?utf-8?B?Uk1nK0VkNGRtZmtBemFFdHlzSnFHdTNuVk9UbVVyTWJ2VUxzOHVWSkM1WFpY?=
 =?utf-8?B?ZXo0Q3Z5MVAvZVRjU2ZsREkyU0IxTkFwc21QTFJ5L0hIUnZqVldFb3cyVmMz?=
 =?utf-8?B?UTQwTzVRaDl0STFxdkZTTE5tdXR0YXdSSnowZG5VWmdOVlhiT2tDNmFXZWla?=
 =?utf-8?B?cUJsWGRaUUE5d3RnODZaRlRwOEtId2Q5VmE4R1FSSjVHRWtqT2UzNGpDWkdt?=
 =?utf-8?B?Z2V2b29TejMvUm5NYXB6ZHA3SjdvVVBuaFd6WlhuUFl0VFZGSG56M1BVWTB3?=
 =?utf-8?B?djZuTGR6L1plMUQvTmZFakN5VUVqTXBDZEx4OVlyNWhidFpETDRzRUM0a3NX?=
 =?utf-8?B?T2FLck9ZWWpKUlMyQWJwaWpVYjQ0WTUzelN0MXAwbUMwaEdaTi9wWDluM2Jo?=
 =?utf-8?B?T0lRZENtRGpwUlZvYWcwTDVFRWxZTU1CQ3ZDamIzUTFGWWNNVEVZWEorbWcw?=
 =?utf-8?B?VzNCZjhQUHhoUytmMnZNMGpCOWgvM2VzNjQxZmlpckdlblNwMG13MnNIYXlo?=
 =?utf-8?B?VkJNeC8wcVprZkVZczRlL2NEMXdRbnlEZ3VGVUFvaEJkMEpwT0EwVjlFYVox?=
 =?utf-8?B?ckpRNHU1NWZXSUZkTGdKSDhYR2J1emdiVDhSWGJIbWNYMlhlT2JocjBsNkhl?=
 =?utf-8?B?S0s2bnhNWnBycDFBMWxFSnpDZFg0dE9tT3o0NFM0cFE3TjIyak1jblJLSG44?=
 =?utf-8?B?N0NtTHRYODYyOWx2OGdPdnZOZjE1b0NIYzVhUlZaWlcrcVRTR2QwMVY2a2tV?=
 =?utf-8?B?Q2pEK041NlFRNXR6bDhFT0pXL3V3NFkxY21XeS9OUmhLaEhEaEY2VEdKY0lI?=
 =?utf-8?B?RUtlL0ZyL05lWTBiRFdnTGlmT1kxOTFNaHE1Nys1UlhaSGVtNEg2LzJmeE1U?=
 =?utf-8?B?WjA1ZU10QXdIdmpxL1VWV096TExaQS9HZEJNVTM5dnRTblp2WVNKTnhEMjB3?=
 =?utf-8?B?T0VkSlVVTE90RWdGVng0TzhqN1pJR3cwbGtCbDkrSzRXUTIxVEEvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cff7d5-804d-4252-a0a5-08de5747ab93
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 10:44:06.6039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /r8MzunwrIXeX/AhVK5dlGmNgO7KROhh09ZP/970xtilH8h8lg8cLeMImp+5AeWEYuFo9ZBQeAMnkuf168wYouEpzBenQ0Rjfk6XaMpYQ3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9878
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229605

VGhhbmtzIGZvciB0aGUgY2hhbmdlcyBWYWxlbnRpbiwNCg0KSSBoYXZlIHRlc3RlZCBzZXJpZXMg
NSBhcyBvZmZsaW5lIGJ1aWxkLiBXaGVuIGl0IGlzIG5vdCBlbmFibGUsIGl0IGRvZXNuJ3QgaW50
ZXJmZXJlIHdpdGggdGhlIHJlc3Qgb2YgdGhlIGJ1aWxkLg0KDQpGb3Igb2ZmbGluZSBidWlsZCwg
SSBoYWQgdG8gc2V0dXAgYSBmaXggR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfU1JDUkVWLCBzaW5j
ZSB0aGUgZmV0Y2hlciBkb2Vzbid0IHdvcmsgd2l0aCBBVVRPUkVWIChraW5kIG9mIGV4cGVjdGVk
KS4gVGhpcyBzZWVtcyB0byB3b3JrLg0KRU5BQkxFX0tFUk5FTF9DVkVfRVhDTFVTSU9OUyA9ICIx
Ig0KR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfU1JDUkVWID0gImJjZDA4OWFmMjgzZGY3OTAyYjMz
ZTljZjBjZWRlZjVhYTJjNGEyOTgiDQpHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19ORVRXT1JLID0g
IjAiDQoNCldoZW4gc2V0dGluZyBHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19TUkNfVVJJIHRvIGFu
IGludGVybmFsIG1pcnJvciBpdCBhbHNvIHdvcmtzIHdpdGggQVVUT1JFVg0KDQpFTkFCTEVfS0VS
TkVMX0NWRV9FWENMVVNJT05TID0gIjEiDQpHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19TUkNfVVJJ
ID0gImdpdDovL2ludGVybmFsLW1pcnJvci9naXRodWIuY29tLkNWRVByb2plY3QuY3ZlbGlzdFY1
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIg0KR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfU1JD
UkVWID0gIkFVVE9SRVYiDQoNCkkgaGF2ZSBhbHNvIGxvb2sgYXQgdGhlIGdlbmVyYXRlIFNQRFgg
Zm9yIHRoZSBsaW51eC15b2N0bywgaXQgaW5jbHVkZXMgYW4gYWRkaXRpb25hbCBzb3VyY2UsIHdo
aWNoIHRlY2huaWNhbGx5IGlzIG5vdCB0aGF0IGNvcnJlY3QgSSB0aGluaw0KanEgLiB0bXAvZGVw
bG95L3NwZHgvMy4wLjEvcWVtdWFybTY0L3JlY2lwZXMvcmVjaXBlLWxpbnV4LXlvY3RvLnNwZHgu
anNvbiB8IGdyZXAgY3ZlbGlzdFY1IC1BIDMgLUIgMTANCiAgICB7DQogICAgICAidHlwZSI6ICJz
b2Z0d2FyZV9QYWNrYWdlIiwNCiAgICAgICJzcGR4SWQiOiAiaHR0cDovL3NwZHgub3JnL3NwZHhk
b2NzL2xpbnV4LXlvY3RvLWY5Zjc1ZGJlLWU2M2YtNWE0OC04NmQ4LWUxOWQwZWM2OTNkYi9hMzVm
YTFkODUzMGU0NmM4NGQ1OWI2Nzc2ODU4ZWFmYzc1YmRkOThiODQzOWMyZWUwNmRiNmZkYWIxNTFh
OGMzL3NvdXJjZS8zIiwNCiAgICAgICJjcmVhdGlvbkluZm8iOiAiXzpDcmVhdGlvbkluZm8wIiwN
CiAgICAgICJleHRlbnNpb24iOiBbDQogICAgICAgIHsNCiAgICAgICAgICAidHlwZSI6ICJodHRw
czovL3JkZi5vcGVuZW1iZWRkZWQub3JnL3NwZHgvMy4wL2lkLWFsaWFzIiwNCiAgICAgICAgICAi
aHR0cHM6Ly9yZGYub3BlbmVtYmVkZGVkLm9yZy9zcGR4LzMuMC9hbGlhcyI6ICJodHRwOi8vc3Bk
eGRvY3Mub3JnL29wZW5lbWJlZGRlZC1hbGlhcy9ieS1kb2MtaGFzaC84ZmU4MDI4NWY0M2ViMjM1
ZDYxOTk2Y2VkNDY2NjgyOTNlYjNmZWFiYTg1ODEwYjE0YWVkODIyYjQ2ODBlNTZmL2xpbnV4LXlv
Y3RvL1VOSUhBU0gvc291cmNlLzMiDQogICAgICAgIH0NCiAgICAgIF0sDQogICAgICAibmFtZSI6
ICJnaXRodWIuY29tLkNWRVByb2plY3QuY3ZlbGlzdFY1LmdpdCIsDQogICAgICAic29mdHdhcmVf
cHJpbWFyeVB1cnBvc2UiOiAic291cmNlIiwNCiAgICAgICJzb2Z0d2FyZV9kb3dubG9hZExvY2F0
aW9uIjogImdpdCtodHRwczovL2dpdGh1Yi5jb20vQ1ZFUHJvamVjdC9jdmVsaXN0VjUuZ2l0QGJj
ZDA4OWFmMjgzZGY3OTAyYjMzZTljZjBjZWRlZjVhYTJjNGEyOTgiDQogICAgfSwNCg0KQWxzbyBi
aXRiYWtlIGxpbnV4LXlvY3RvIC1jIGRvX2dlbmVyYXRlX2N2ZV9leGNsdXNpb25zIHdvcmtzIGFz
IGV4cGVjdGVkLCBpZiBpdCB3aWxsIGJlIHVwZGF0aW5nIHRoZSBpbmMgZmlsZSB0aGF0IGlzIHVz
ZWQgaW4gdGhlIGxpbnV4LXlvY3RvIHdpdGggdGhlIGV4Y2x1c2lvbnMsIHRoZXNlIHdpbGwgYWxz
byBzaG93IHVwIGluIHRoZSBTUERYIGZpbGUuDQoNClRoYW5rcyBhZ2FpbiBmb3IgdHJ5aW5nIHRv
IHB1c2ggdGhlIGNoYW5nZXMgdGhhdCB5b3UgaGF2ZSBpbiB2dWxuc2NvdXQgaW50byBvZS1jb3Jl
Lg0KDQpCZXN0IHJlZ2FyZHMNCkRhbmllbA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFZhbGVudGluQm91ZGV2aW4gPHZhbGVudGluLmJvdWRldmluQGdtYWlsLmNvbT4N
Cj4gU2VudDogRnJpZGF5LCAxNiBKYW51YXJ5IDIwMjYgMjA6MDUNCj4gVG86IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IERhbmllbCBUdXJ1bGwgPGRhbmll
bC50dXJ1bGxAZXJpY3Nzb24uY29tPjsNCj4gamVyb21lLm91ZmVsbGFAc2F2b2lyZmFpcmVsaW51
eC5jb207IGFudG9uaW4uZ29kYXJkQGJvb3RsaW4uY29tOw0KPiBWYWxlbnRpbkJvdWRldmluIDx2
YWxlbnRpbi5ib3VkZXZpbkBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NSAwLzRdIGdl
bmVyYXRlLWN2ZS1leGNsdXNpb25zOiBBZGQgYSAuYmJjbGFzcw0KPiANCj4gQ2hhbmdlcyBzaW5j
ZSB2NDoNCj4gLSBQYXRjaCAyLzQ6DQo+ICAgKiBSZW5hbWVkIHRoZSBiYmNsYXNzIHRvIGtlcm5l
bC1nZW5lcmF0ZS1jdmUtZXhjbHVzaW9ucy5iYmNsYXNzIHRvIGJldHRlcg0KPiByZWZsZWN0IGl0
cyBwdXJwb3NlLg0KPiAgICogQWRkIG5ldyB2YXJpYWJsZSBFTkFCTEVfS0VSTkVMX0NWRV9FWENM
VVNJT05TIHRvIGVuYWJsZS9kaXNhYmxlDQo+IHRoZQ0KPiAgIGZlYXR1cmUuDQo+ICAgQnkgZGVm
YXVsdCwgdGhlIGZlYXR1cmUgaXMgZGlzYWJsZWQgdG8gYXZvaWQgdW5leHBlY3RlZCBiZWhhdmlv
ciBvbg0KPiAgIGV4aXN0aW5nIGJ1aWxkcyB3aXRoIGxpbnV4LXlvY3RvLg0KPiAgICogQWRkIG5l
dyAiX19hbm9ueW1vdXMiIHB5dGhvbiBmdW5jdGlvbiB0byBzZXR1cCB0aGUgdmFyaWFibGVzIFNS
Q19VUkkNCj4gYW5kIFNSQ1JFViBvbmx5IGlmDQo+ICAgdGhpcyBmZWF0dXJlIGlzIGVuYWJsZWQg
d2l0aCBFTkFCTEVfS0VSTkVMX0NWRV9FWENMVVNJT05TLg0KPiAgIEFsc28gcHJldmVudCBmcm9t
IG1vZGlmeWluZyBTUkNfVVJJIGFuZCBTUkNSRVYgdmFyaWFibGVzIGluIHRoZSBkZWZhdWx0DQo+
IGxpbnV4LXlvY3RvIHVzZWNhc2UuDQo+ICAgTm93LCB0aGUgcmVjaXBlIGRvZXMgbm90IGhhdmUg
YW55IGltcGFjdCBvbiB0aGUgYmFzaWMgImxpbnV4LXlvY3RvIiByZWNpcGUgaWYNCj4gdGhlIGZl
YXR1cmUgaXMgZGlzYWJsZWQuDQo+ICAgKiBBZGQgbmV3IHZhcmlhYmxlcyBHRU5FUkFURV9DVkVf
RVhDTFVTSU9OU19ERVNUU1VGRklYIGFuZA0KPiAgIEdFTkVSQVRFX0NWRV9FWENMVVNJT05TX1VO
UEFDS19ESVIgdG8gY3VzdG9taXplIHRoZSB3b3JraW5nDQo+IGRpcmVjdG9yeSBwYXRoIG9mIHRo
ZQ0KPiAgIGNsYXNzLg0KPiAtIFBhdGNoIDQvNDoNCj4gICAqIFVwZGF0ZSB0aGUgaW5oZXJpdCBz
dGF0ZW1lbnQgaW4gbGludXgteW9jdG8uaW5jIHRvIHJlZmxlY3QgdGhlIG5ldyBuYW1lIG9mDQo+
IHRoZSBiYmNsYXNzIHdpdGgNCj4gICAia2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zIi4N
Cj4gDQo+IENoYW5nZXMgc2luY2UgdjM6DQo+IC0gUGF0Y2ggMi80Og0KPiAgICogQWRkIHZhcmlh
YmxlcyB0byBjb250cm9sIG9mZmxpbmUgbW9kZSwgc291cmNlIFVSSSBhbmQNCj4gICBTUkNSRVYg
Zm9yIGRldGVybWluaXN0aWMgdGVzdGluZyAoR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfU1JDX1VS
SSwNCj4gICBHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19TUkNSRVYsDQo+IEdFTkVSQVRFX0NWRV9F
WENMVVNJT05TX05FVFdPUkspLg0KPiAgICogVXBkYXRlZCBnZW5lcmF0ZV9jdmVfZXhjbHVzaW9u
cyB0YXNrIHNjaGVkdWxpbmcgdG8gYmUgZXhlY3V0ZWQgYmVmb3JlDQo+ICAgZG9fY3ZlX2NoZWNr
Lg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gLSBQYXRjaCA0LzQ6IEluaGVyaXQgdGhlIG5l
dyBiYmNsYXNzIGluIGxpbnV4LXlvY3RvLmluYyBpbnN0ZWFkIG9mDQo+ICAgaW5kaXZpZHVhbCBy
ZWNpcGVzLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gLSBQYXRjaCAyLzQ6IFJlbW92ZWQg
dGhlIG1hbmRhdG9yeSBleGVjdXRpb24gb2YgdGhlDQo+ICAgZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lv
bnMgY2xhc3Mgb24gZXZlcnkgYnVpbGQuIEl0IG5vdyBuZWVkcyB0byBiZQ0KPiAgIG1hbnVhbGx5
IHJ1biB1c2luZzoNCj4gICAgIGJpdGJha2UgLWMgZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnMgPGtl
cm5lbC1yZWNpcGU+DQo+IA0KPiBWYWxlbnRpbkJvdWRldmluICg0KToNCj4gICBnZW5lcmF0ZS1j
dmUtZXhjbHVzaW9uczogQWRkIC0tb3V0cHV0LWpzb24gb3B0aW9uDQo+ICAgZ2VuZXJhdGUtY3Zl
LWV4Y2x1c2lvbnM6IEFkZCBhIC5iYmNsYXNzDQo+ICAgZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnM6
IE1vdmUgcHl0aG9uIHNjcmlwdA0KPiAgIGxpbnV4OiBBZGQgaW5oZXJpdCBvbiBnZW5lcmF0ZS1j
dmUtZXhjbHVzaW9ucw0KPiANCj4gIC4uLi9rZXJuZWwtZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnMu
YmJjbGFzcyAgICB8IDEzNSArKysrKysrKysrKysrKysrKysNCj4gIG1ldGEvcmVjaXBlcy1rZXJu
ZWwvbGludXgvbGludXgteW9jdG8uaW5jICAgICB8ICAgMyArDQo+ICAuLi4vY29udHJpYn0vZ2Vu
ZXJhdGUtY3ZlLWV4Y2x1c2lvbnMucHkgICAgICAgfCAgNjQgKysrKysrKy0tDQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDE4OCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2Rl
IDEwMDY0NA0KPiBtZXRhL2NsYXNzZXMva2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zLmJi
Y2xhc3MNCj4gIHJlbmFtZSB7bWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eCA9PiBzY3JpcHRzL2Nv
bnRyaWJ9L2dlbmVyYXRlLWN2ZS0NCj4gZXhjbHVzaW9ucy5weSAoNzElKQ0KDQo=

