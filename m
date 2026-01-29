Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3583D358FB
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:01:36 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12555.1769684494237071814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=amy/uHnB;
 spf=pass (domain: ericsson.com, ip: 52.101.65.26, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF+I4oecPllwQxIxctozdntfddRBqPfKeGg85/ygnKT3TUgABS5DiCdEhcY4Y9Tmu+p3htTvzNmBLNpHtCJl9Y6tZkClEIouurRgjhZxYjvKgsnOZgYYFhYy9g2+DEkbhLnVQ6CKqFdK8S5AcNtqsg274Xi4+Q6gGenj9voWL5xDE1mGD32yOcwZVSbi0JwApIDRx/+/FvxWo+oRxbgFtgteoWFiOMXMe7KLzW2eB2aJLfhWjzUGkyTJKRgKgHWBsYFrzpOnNiWAL4lIJPXRQXY18FKEIrnq2DY3X1yjANKqAOd5Hw+Xd5eYlEFnsNgy0GtaS6FUgW51qmhknqw8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CFQ+lT03qaJMYHF3MSsPOM+Il+pQp9XKWJaQ4T5VP4=;
 b=m2aBkJ4C/Y/PsaRNxTfbFirTIM6By6DHFHxDSEmfnoK/0vCj0Dpm/6ic27bLdcYfb9cQfsG5igKJGODZrtlIoeS+R83lniEINbn/KbQfYDao2SglmnYupYRyfuSfLlUvMzGBYZWvfjPxxP6aiiLp8fdZY59C4gFItBsJrjDU9UndmlABE6yKxYmQ8Md2iy5BQZPzqMxTbRX1KtH1EEUEAhmn9VqyFGdoM6FjfxwSu9q60sVwBs74aEDxnSdEFepfLcHubRcR53Wp3zS86pfXAL73dMGZCm34s1uAq3dYaFUhat4OYaLCTo4ZaIXDWazKXRU1hqJ/yUpZk10ETohm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CFQ+lT03qaJMYHF3MSsPOM+Il+pQp9XKWJaQ4T5VP4=;
 b=amy/uHnBZTOIfRBAj5S3HFS4SAkMrMKKmTUxFNV/c9Knwp7laiZXLEOD+6n+oU4KimVTS/V852u77RQEggErjNCjUJ8G2Xx6CJRUFDkkkXYnKmgW1kJWfJcwNhzi/GzUfhxOH7ZYlUOG5oKhPCdJ90loaw84NFmwELNi5/Riki7bWX4koVaP6VxCEgi/QHVtUtPCXnkWU2WJTvjwFtPtnseFVI/re5HSotla0q+f2PaPRFf14fd8wryDCkx67S2mdB0n+FUxpin4BonnU1zkxPJ7RiI0OZ8vsdMLm0uVyFxAgclKXLLZGnh2wrmlef7fVO4D/igTxOZN2ehp4M2tXw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI1PR0701MB6766.eurprd07.prod.outlook.com (2603:10a6:800:197::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 11:01:30 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 11:01:30 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: ValentinBoudevin <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jerome.oufella@savoirfairelinux.com"
	<jerome.oufella@savoirfairelinux.com>
Subject: RE: [PATCH v5 0/2] improve_kernel_cve_report: Add a bbclass support
Thread-Topic: [PATCH v5 0/2] improve_kernel_cve_report: Add a bbclass support
Thread-Index: AQHckHSVgKK2l1fG80aspEPcxItGe7Vo+sPA
Date: Thu, 29 Jan 2026 11:01:30 +0000
Message-ID: 
 <PA3PR07MB10721FE43E226CB23A078A1C18A9EA@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260128163827.386933-1-valentin.boudevin@gmail.com>
In-Reply-To: <20260128163827.386933-1-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI1PR0701MB6766:EE_
x-ms-office365-filtering-correlation-id: dac09017-8d6b-4e7e-d520-08de5f25c1ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|19052099003|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NjVONmFRNkFLS2FBZDVzenNIQVk3d2FmTi9hZzBGR3VYUks1QmtQWUducUpm?=
 =?utf-8?B?dTNBK1ZmVVhKYVB4UU96cXJZT0tMSkkweGRwbmJ4SC9JbU4wYlUxOHdRWnpz?=
 =?utf-8?B?aktXZURzdWtoYmUxbEwxM0FveE43UWQ1dmVaRnJsWjRpdlYvZnJGRC8vdUJI?=
 =?utf-8?B?R1JkQzUzUTNUcVlHM1I5Qk9ZZEl5eEdZQTVTQTNidUp4bFBrSDZMSlBMUWFS?=
 =?utf-8?B?SVZVcWJnUHVGY1o1c0poNmR5K2gwMEJsMW9yeTFQSDVZT0ZWdXQ0Q3dEeUxy?=
 =?utf-8?B?d2szSjZrQlVJNFJPS2grZmdNRHFEeFlMeERVblVaOW05aktrTk5yQllIWklC?=
 =?utf-8?B?bE9KMDhGVjkraFBlVUYzN0tBK2FGTVltbXY2SlJHeE9sYkUwZ0ZFbHZ0UzFR?=
 =?utf-8?B?c0RQcGZEQjdyTjFmM0xlc0NkcWJJTzVOUm80emEyWGNYcjZVbDVlUm5MQm4y?=
 =?utf-8?B?b3NUaUNGZ2dRZitydEN0eXlzaFFFRUxlMjVjSGZ0alY5MkwvbGRuMGErUXlJ?=
 =?utf-8?B?dnlRTVoyQVVmVEcwU29ScCt1Qmh4a0p5TkJYNUVXcWU4aHdia05GcUtzNVhz?=
 =?utf-8?B?QXdJOGxHc3Z0SXRuQUJicTJrdmk5TE1uemcydlJJOGtIazJGYlk3Ykp4QjFZ?=
 =?utf-8?B?OXlFdXhmWjdIcGUvUWhFQi9mb0NVVEwyenNhNEFrNFdHUFZmQ1JrdkZxdlZO?=
 =?utf-8?B?QkRXNjMyeXg0bTd0QnVZZXhFSlZrTmZIU1hQWHFGTDVaZkpLb1ZTTVNuVlE3?=
 =?utf-8?B?TzBabW5scVk2c1NQSCtZNDZrS0hFWXNQVHQ2b2U2OE8wWm53U3pyWTJKT3FN?=
 =?utf-8?B?M2dYcFg3a2xrOStFUStaaU1SK3NIKzh6Vm9HRS85QjdCNUhzUGN5OXlFc1ZT?=
 =?utf-8?B?WDB5R2VmVEZsejkzeU1DV3psQnVLMnRibW85NGhzK1RkbUJibEpFSUZBNmRF?=
 =?utf-8?B?cjlvbldEaDRCSmlDeUZHa0ZFNzV0M2ZqWno0WkFPdXNJMG1MRVpLckxCY0NX?=
 =?utf-8?B?cXRXUEppUU1yc0FZNHhNTEFKMWw0dmVqdmR6eXRIMHlKam5QRk5KTy9DLytF?=
 =?utf-8?B?OTBLUWVJUTFKWHZxVFN5N3R5VXpSdjF0STFBVllYSGRzcldOYmxRejlnWG00?=
 =?utf-8?B?MC9FZUI3aE9zTzBrYTN0aTFJQmdBU1BpZ0dZNTJQSFFsMFlnSDFWMTdleVds?=
 =?utf-8?B?VGlXaGgvZnV6NFlZc0dicnZ6RzVQYjV6bFl4aXBHSUhmUW1jYzRjVkttM29D?=
 =?utf-8?B?U0kyeG1TVFhwUThvVkt6enluN3pUZGV1NXFYYk9mMWY4cENHNFIwRUppWmMv?=
 =?utf-8?B?cmR5N3phSGlJdnJKVFJqSGxTVFFLcHpSVWJqQW56TmlTaXJGUzhQdXVHb0tJ?=
 =?utf-8?B?Rkp2Z09VRlFDY1A5K1R4ZHhyT3preEtjemwxVkhZQ1NUSmxoVkRSM0YreFI3?=
 =?utf-8?B?dFpwRVZiUk9sNEhBMWJqbHJMU2U5STJqZjhCNmxacndhTDJaU2VmQXBBeUd2?=
 =?utf-8?B?bTBMVDNuK2pBVVRtcnBKV1lnTzJYem1SdUs1eG5UdlhhZjN2b2J0V1Z4UGM0?=
 =?utf-8?B?WVBTeHZGcXhBSUxvcldkNTNTK2tndUUzRnV5YUhkbHlJVDlpeHo0QmJNb2FL?=
 =?utf-8?B?TXh1ZU96NG1oYm1SVVR5THc3d1FpL2YySkJyb29IVTJsRUxML3JLQlRVSUwv?=
 =?utf-8?B?d2tqZzFqRURmMnM0L3oxRXdIODBlQlZ1U0FYMnhvYk45eVEwdG1jVHFpaFJm?=
 =?utf-8?B?cXFaZjEwK3d1RE83VUxqNVNhQjNGdFpiL0V4eUFvbXlzeU1oTjVXQURCT29w?=
 =?utf-8?B?NlIrWnVVa2lCcTBndzdtMnY3SThPWmY1a3UwbWtTZ2hIbU1lTTh2WnNWNW5i?=
 =?utf-8?B?andHTWVENDFJQ3ZRYTV4VEJHNnM1N1d1VU5xazBjVnRVODlYZTRBM1gvMjYw?=
 =?utf-8?B?K1dzV0Y2ZDZyT2FXRERwbnFBdmFCWElNd1pVdUovWkpnMjhNVHhtc1BoU255?=
 =?utf-8?B?dkdHV2ZIMDVJaWpzNnp5NGJCODhHN2tMNWptQi9VdEZCUzVZOUVBeE0ycDR6?=
 =?utf-8?B?ZlFvbTVWcmszSytSL0orVk5mY1N5aVNqL3Q1MzlERUc1SE5ldjQ2bDN2SmVN?=
 =?utf-8?B?cUdDUDF2ckFOdjRZRjVLZm52MnRBZkRMREdsNGpJYWJ3VE0ySDhkRVpXSWhQ?=
 =?utf-8?Q?eab77QYoXxJkjVSOJHTpDMQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19052099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFVrcERXUUhaMDhkcmtPOTRUSk5wb2VycVltL2FKQVFLeEhXMEp5RklWeGVt?=
 =?utf-8?B?YVFNaUtTSVdZR3JmZlM1QzJ1Y1RtM2t5N28rUDZKQmNkSk5SOFRzU1JEcVZx?=
 =?utf-8?B?d290NGtpQ0dNZEpRRzBKY3FhNCsvTmNZc3BWc2ZlK1ZRMlJMTTNiYTJobXZM?=
 =?utf-8?B?a2RESVlWTXJVem5UaGtQS3pnbnNCbUZEd2l0ZWZMZ3R5VW5QbXkxcFBUamo1?=
 =?utf-8?B?T2FPVGx4eTdrWWNyTVR1QURNQnQ2UnluOUNlam9ieDNhU2E5SkY4SHRhc1dh?=
 =?utf-8?B?WWhPbDQ3MlpnT2ZtZVcwUFllTktIb2lLMVkxbTlWM3k4MjM1NytBMklFOTRQ?=
 =?utf-8?B?RldTKzVKdWREQTJvcDh6MjVsVFRGa1ZBMXVUakVvZ2ZPNTRqKzFFdmJVQ3M4?=
 =?utf-8?B?dTJzOWJSVG5FcGFlY0JLNi80QzNPQVRnZkFrM3grQlhRMU5DN3U2L1VTaVhG?=
 =?utf-8?B?VzU3VHZKSkZFS2RBVGRjUmJkd3dRZEN2SkFTMUZJcDJVelhHSVViYlc1Ky9J?=
 =?utf-8?B?Nlp3UEN4anN3VEdpRDRObDJpK29HeWlYa3hWZS9GaElFaTVDNm96eTVVL0lR?=
 =?utf-8?B?Qi9Lc2NoZXNVandtZnZkNkpSMFJiTUduaVcvRHBvdEpnN0E3d3BvZVYwRG02?=
 =?utf-8?B?OExYeEp4RDRjQllSMnd0Szlzcmt0d0ZYRkVCNWg1OXV6YXAvTytNWlMzZ1pH?=
 =?utf-8?B?WUxRUUhZTkl4VjRFTkJYRGNGZStZZHZ4WjNiMTg0WFIyMm42Q2hvdGtOdEc0?=
 =?utf-8?B?WGE0bkl4QzdDL1cyc1F0K0VocEUzRTJXUmduV1RzZDlBK1JVRGhtbEk4N0c5?=
 =?utf-8?B?UEZyWHhGVTUvVENXMExOZDhXMFp0d3FsVVhWdVduMFVvN2RYQTl1Y1JEMUR1?=
 =?utf-8?B?Z3F5dlB3a1hJcWVjYkhmeGVuMUdhbGcyZnlMdk1FTkVyb3BiV3lOa3JlZThZ?=
 =?utf-8?B?S3BzVm1oNlIwR0taYzdwMisveHg1cE9aMFhuUHJvT29kcmd1RG5HNDZPR0xx?=
 =?utf-8?B?bTBidStZN0ZTUTA2eTdmN2xQdUh0cUVjUnhZTTBIdDNmbUxvcnM5ZWRyK1JO?=
 =?utf-8?B?dStLNE5PUmIzK1pzQXI5RHpXckxwOHBBSFJ0MEdzbkFJUm10cFVHSzBtL0xZ?=
 =?utf-8?B?VVZlbWJDam1mQ1Z0Z2NBSkxadnFYVCtYbVozT1ZncWxZeDdoTnMwaFNkVlc2?=
 =?utf-8?B?dzZXYVlHaXNHakdnd3A3Wm9RWE9UNlB0VDM5STJFWGtFU3l6SzcrUXFQQU53?=
 =?utf-8?B?eHpVNHVmYVdmclNvUFZ0Ly9OaUVvY0NBYkdKSWVDZk1UTXZ1RVYveGNmeWM4?=
 =?utf-8?B?K3RDb25oVExaZkc3VFVkZnFQa0RJM3RGMTZHY1VDU3ZQaFRDZXhZUDVmMzcw?=
 =?utf-8?B?TDhpZVpFUTZocmZ3OE9zNU1uV2FRK2xCMk02VVFCUFJGR21hUHZITXRsSk45?=
 =?utf-8?B?bW9oQkdWZHFRYStvM0RGaklzd2VNL0NMWS84RUJ5ZnNyOVlwVm9FSy9ZM3ZN?=
 =?utf-8?B?QWdTUXpMYjlKQjYyNGYxR21yWTMzUGFJbVNsc09tK3dMNWRHeUI4aG5QN052?=
 =?utf-8?B?ZEprSHNCZDNVWlgwMncwL2dKYVFLM1lDZVdSYmxaOS9YVW5GVDZ6eXpiT01h?=
 =?utf-8?B?SXhjNFl5VVlmMHkzck5LalN4Q3lvbHhOWlBOVERYRnJGTkJ5SUpsTTd6WE1h?=
 =?utf-8?B?WTFtYmZBSzdGR1ZLMXFRSW9jdEtBMVlDUllwK3RoQXhYd2xwMUp2SUxIenpt?=
 =?utf-8?B?OVJZRWFwNE5nUjl2eHYzdzNSQmlwVzk0S1F4elV0WEZ4bFliY25xbHB3amp3?=
 =?utf-8?B?UmhvMXhDQkgwRkx3WE1Md1k4bml1eWZFU1UxUTRZZDNYVTMyeHpoTmlIYVRB?=
 =?utf-8?B?Q3lMYzdoMjVpMVFUVXdhbVg3RjNpNGdyamJtRi92V29DdWZlKytkbW5XZDhO?=
 =?utf-8?B?cXJVZU03M1FUNUV1NE82aE9Zd3pjdjNZcDhrSXJHaWVGTW5HK3VjamdvRThJ?=
 =?utf-8?B?NzMwZXlvdHhtVFNDVUpGU1drNDBWT04xYUNzcU9wRjJ5MTQ2UlhUbC8vT0Ex?=
 =?utf-8?B?aHo5OGJJZXdlampBL0JhaWRRaTlpYTRMSElSbDNmdGVxZHZzQzNWeTIrT1RJ?=
 =?utf-8?B?clUyMVJiRklzdUErSXBoTzE4ZnZBUllQRXc0N0JFVk41R0V4YkhOYXl6d3V4?=
 =?utf-8?B?RUhZYXVmY0xmWUx1UW1memhJa2IzQUlkTkxQSTM3cnp1NmZRYUc4WE5aNzVJ?=
 =?utf-8?B?QTA4aHNkT1BUUGt6OWx6Y0FuV1FvUmFxaE84YVNJZ1p1d2NmVGEyZnAreUhz?=
 =?utf-8?B?cW5ZaXN5d0dxWVpwQUpBYlkrVkRXa0dCZTdPM2FEREhlWXdaSSt3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac09017-8d6b-4e7e-d520-08de5f25c1ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 11:01:30.4568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71KRPZUffI7VADZDSwMRgGNazt6iQJ4hCDjklByLkCOth8eRreqRtTZZVVTE2A5aP0SaDVvRBrG7J779cDXfeCvat98ONb337W/z7xfsGeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6766
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230128

SGVsbG8gVmFsZW50aW4sDQoNCkkgaGF2ZSB0ZXN0ZWQgdGhpcyBuZXcgc2VyaWVzIGFuZCB3aGls
ZSBpdCBzZWVtcyB0byBydW4gdGhlIGJiY2xhc3MsIEkgdGhpbmsgaXQgaXMgdXNpbmcgYSBjdmUt
c3VtbWFyeSBmaWxlIHRoYXQgZG9lc24ndCBoYXZlIHRoZSBrZXJuZWwgb24gaXQsIGFuZCB0aGVy
ZWZvcmUgaXQgZG9lc24ndCBnZXQgdXBkYXRlZC4NCg0KSSdtIHVzaW5nIGluIGFuIG9mZmxpbmUg
YnVpbGQNCklOSEVSSVQgKz0gInZleCINCg0KQW5kIGEgY29yZS1pbWFnZS1taW5pbWFsLmJiYXBw
ZW5kDQppbmhlcml0IGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQNCg0KWW91IG1pZ2h0IHdhbnQg
dG8gbWVudGlvbiBpbiB5b3VyIGNvbW1pdCB0aGF0IGlmIHlvdSB3YW50IGEgbW9yZSBkZXRhaWxl
ZCBsaXN0IG9mIHZ1bG5lcmFiaWxpdGllcywgeW91IG5lZWQgdG8gYWRkOg0KDQpTUERYX0lOQ0xV
REVfQ09NUElMRURfU09VUkNFUzpwbi1saW51eC15b2N0byA9ICIxIg0KDQoNCkltYWdlIFZFWCBK
U09OIHJlcG9ydCBzdG9yZWQgaW46IHlvY3RvLW1hc3Rlci9idWlsZC90bXAvd29yay9xZW11YXJt
NjQtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL2RlcGxveS1jb3JlLWltYWdlLW1p
bmltYWwtaW1hZ2UtY29tcGxldGUvY29yZS1pbWFnZS1taW5pbWFsLXFlbXVhcm02NC5yb290ZnMt
MjAyNjAxMjkxMDMzNDMuanNvbg0KaW1wcm92ZV9rZXJuZWxfY3ZlOiBVc2luZyBTUERYIGZpbGUg
Zm9yIGV4dHJhIGtlcm5lbCB2dWxuZXJhYmlsaXRpZXMgc2NvdXRpbmc6IHlvY3RvLW1hc3Rlci9i
dWlsZC90bXAvd29yay9xZW11YXJtNjQtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4w
L3NwZHgvMy4wLjEvaW1hZ2UtZGVwbG95L2NvcmUtaW1hZ2UtbWluaW1hbC1xZW11YXJtNjQucm9v
dGZzLnNwZHguanNvbg0KSW1wcm92ZSBDVkUgcmVwb3J0IHdpdGggZXh0cmEga2VybmVsIGN2ZXM6
IHlvY3RvLW1hc3Rlci9idWlsZC90bXAvZGVwbG95L2ltYWdlcy9xZW11YXJtNjQvY29yZS1pbWFn
ZS1taW5pbWFsLXFlbXVhcm02NC5yb290ZnMtMjAyNjAxMjkxMDMzNDMuc2NvdXRlZC5qc29uDQoN
ClRoZSBmaWxlIGdlbmVyYXRlZCBpbiAvYnVpbGQvdG1wL2xvZy9jdmUvY3ZlLXN1bW1hcnkuanNv
biBzaG91bGQgaGF2ZSB0aGUga2VybmVsIGluIHF1ZXN0aW9uLiBUaGUgb25lcyBjb25uZWN0ZWQg
d2l0aCB0aGUgaW1hZ2UgZG9lc24ndCBoYXZlIHRoZSBrZXJuZWwgb24gaXQuDQoNCkJlc3QgcmVn
YXJkcywNCkRhbmllbA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWYWxl
bnRpbkJvdWRldmluIDx2YWxlbnRpbi5ib3VkZXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgMjggSmFudWFyeSAyMDI2IDE3OjM4DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVy
aWNzc29uLmNvbT47DQo+IGplcm9tZS5vdWZlbGxhQHNhdm9pcmZhaXJlbGludXguY29tOyBWYWxl
bnRpbkJvdWRldmluDQo+IDx2YWxlbnRpbi5ib3VkZXZpbkBnbWFpbC5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSCB2NSAwLzJdIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQ6IEFkZCBhIGJiY2xhc3Mg
c3VwcG9ydA0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2NDoNCj4gLSBBZGQgYSBuZXcgY29tbWl0IHdo
aWNoIGNvbnRhaW5zIGEgbmV3IHJlY2lwZSAidnVsbnMtbmF0aXZlIiB0byBjbG9uZSB0aGUNCj4g
TGludXggU2VjdXJpdHkgVnVsbnMgUmVwby4NCj4gLSBSZW1vdmUgdGhlIHRhc2tzIGRvX2Nsb25l
X2tlcm5lbF9jdmUgd2hpY2ggaXMgbm93IGRvbmUgYnkgdGhlIG5ldyB2dWxucy0NCj4gbmF0aXZl
IHJlY2lwZS4NCj4gLSBVcGRhdGUgdGhlIGRvX3Njb3V0X2V4dHJhX2tlcm5lbF92dWxucyB0YXNr
IHRvIHVzZSB0aGUgbmV3IHZ1bG5zLW5hdGl2ZQ0KPiByZXBvc2l0b3J5IHBhdGguDQo+IC0gUmVt
b3ZlIHZhcmlhYmxlcyBJTVBST1ZFX0tFUk5FTF9DVkVfU1JDX1VSSSwNCj4gSU1QUk9WRV9LRVJO
RUxfQ1ZFX1NSQ1JFViwgSU1QUk9WRV9LRVJORUxfQ1ZFX05FVFdPUkssDQo+IElNUFJPVkVfS0VS
TkVMX0NWRV9XT1JLRElSLCBhbmQgSU1QUk9WRV9LRVJORUxfQ1ZFX0RFU1RTVUZGSVguDQo+IC0g
TW9kaWZ5IF9fYW5vbnltb3VzIGZ1bmN0aW9uIHRvIG5vdCBzZXQgU1JDX1VSSSBhbmQgU1JDUkVW
Lg0KPiAtIFVwZGF0ZSBfX2Fub255bW91cyBmdW5jdGlvbiB0byB1c2UgYmIuZGF0YS5pbmhlcml0
c19jbGFzcy4NCj4gLSBVcGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHJlZmxlY3QgdGhlc2Ug
Y2hhbmdlcy4NCj4gLSBNb3ZlIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQuYmJjbGFzcyB0byBp
bXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LXNwZHgtDQo+IDMuMC5iYmNsYXNzLg0KPiAtIE5ldyBp
bXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LmJiY2xhc3MgdG8gaW5jbHVkZSB0aGUgYXBwcm9wcmlh
dGUgc3BkeA0KPiB2ZXJzaW9uIGJiY2xhc3MuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYzOg0KPiAt
QXZvaWQgY29kZSBkdXBsaWNhdGlvbiB3aXRoIGEgbmV3IGJiY2xhc3MgImltcHJvdmVfa2VybmVs
X2N2ZV9yZXBvcnQtDQo+IGJhc2UuYmJjbGFzcyIuDQo+IC1SZW1vdmUgZGlyZWN0IHNldCBvZiBT
UkNfVVJJIGFuZCBTUkNSRVYgZm9yIG9mZmxpbmUgbW9kZS4NCj4gLVVzZSBuZXcgX19hbm9ueW1v
dXMgZnVuY3Rpb24gdG8gc2V0IFNSQ19VUkksIFNSQ1JFViBhbmQgdGFzayBzY2hlZHVsZQ0KPiBk
b19zY291dF9leHRyYV9rZXJuZWxfdnVsbnMgYmFzZWQgb24gU1BEWCB2ZXJzaW9uIHVzZWQuDQo+
IC1pbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LXNwZHgtMi4yLmJiY2xhc3MgYW5kIGltcHJvdmVf
a2VybmVsX2N2ZV9yZXBvcnQtDQo+IHNwZHguYmJjbGFzcyBhcmUgb25seSB1c2VkIHRvIGRlZmlu
ZSBJTVBST1ZFX0tFUk5FTF9QUkVGRVJSRURfUFJPVklERVINCj4gYW5kIElNUFJPVkVfS0VSTkVM
X1NQRFhfRklMRQ0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gLSBGaXhlZCBTUkNfVVJJOmFw
cGVuZCBzeW50YXggKGEgc3BhY2Ugd2FzIG1pc3Npbmcgd2l0aCB0aGUgYXBwZW5kIG9wZXJhdG9y
KS4NCj4gLSBSZW1vdmVkIHVudXNlZCB2YXJpYWJsZSBkZWJ1Z19zb3VyY2VfcGF0aA0KPiANCj4g
Q2hhbmdlcyBzaW5jZSB2MToNCj4gLSBJTVBST1ZFX0tFUk5FTF9DVkVfU1JDX1VSSSBhbmQgSU1Q
Uk9WRV9LRVJORUxfQ1ZFX1NSQ1JFViBjYW4gYmUNCj4gdXNlZCB0byBzZXQgYSBkaWZmZXJlbnQg
c291cmNlIHJlcG9zaXRvcnkgb3IgYSBkZXRlcm1pbmlzdGljIHJldmlzaW9uLg0KPiAtIElNUFJP
VkVfS0VSTkVMX0NWRV9ORVRXT1JLIHZhcmlhYmxlIGNhbiBiZSB1c2VkIHRvIHVzZSB0aGlzIHJl
cG8gb2ZmbGluZQ0KPiBiYXNlZCBvbiBleGlzdGluZyBmZXRjaCByZXBvIGluIERMX0RJUi4NCj4g
LSBBZGQgc3VwcG9ydCBmb3IgU1BEWDIuMiB3aXRoIGEgbmV3IGJiY2xhc3MgaW1wcm92ZV9rZXJu
ZWxfY3ZlX3JlcG9ydC1zcGR4LQ0KPiAyLjIuYmJjbGFzcy4NCj4gDQo+IFZhbGVudGluQm91ZGV2
aW4gKDIpOg0KPiAgIHZ1bG5zOiBhZGQgYSBuZXcgcmVjaXBlDQo+ICAgaW1wcm92ZV9rZXJuZWxf
Y3ZlX3JlcG9ydDogQWRkIGEgYmJjbGFzcyBzdXBwb3J0DQo+IA0KPiAgLi4uL2ltcHJvdmVfa2Vy
bmVsX2N2ZV9yZXBvcnQtYmFzZS5iYmNsYXNzICAgIHwgNjAgKysrKysrKysrKysrKysrKysrKw0K
PiAgLi4uaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LTIuMi5iYmNsYXNzIHwgIDQgKysN
Cj4gLi4uaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LTMuMC5iYmNsYXNzIHwgIDQgKysN
Cj4gLi4uL2NsYXNzZXMvaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC5iYmNsYXNzIHwgIDMgKw0K
PiAgLi4uL3Z1bG5zLW5hdGl2ZS92dWxucy1uYXRpdmVfZ2l0LmJiICAgICAgICAgIHwgMjQgKysr
KysrKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy9pbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LWJhc2UuYmJj
bGFzcw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy9pbXByb3ZlX2tlcm5lbF9j
dmVfcmVwb3J0LXNwZHgtMi4yLmJiY2xhc3MNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2Ns
YXNzZXMvaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LTMuMC5iYmNsYXNzDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgbWV0YS9jbGFzc2VzL2ltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQuYmJj
bGFzcw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvdnVsbnMtbmF0
aXZlL3Z1bG5zLW5hdGl2ZV9naXQuYmINCg0K

