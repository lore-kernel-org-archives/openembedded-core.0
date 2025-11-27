Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9E2CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 04:46:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11481.1764218753460391972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 20:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=UosloyYd;
 spf=pass (domain: axis.com, ip: 52.101.83.2, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6AmLHzKSIfWC+Csnzs38TM4ttyFewXlADHj+Q5QLxxblR0WBHDU0I0ylzyafQrmUC0FWDwWIiicc85hW4eInhAaowEmPmGKcDswpIcRZzp/fDKb43ojnmieNroJUTC403YPmeV+McknNZBE4rWd+VsOjRwn6xD9raIPLlorEhozNea3P6yvd0Izaz383sZ0szgvjQc1CYaSX9xFx8JqCYQQ8B0urakKQpo4xdE+YUL/z3L0NWOHIA9qg0KOuxuBfPILVBozan16fM0kfGwAS7qovsNnDnbF1uAKq4SW7p7iECoLUHvVueV3ZKQvyiUj5zp357iReaCNeqqX6/PxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wicVHSN/SaLt5sbIpeP3Bpsxfwbw1VFE85YnRqxmJrE=;
 b=gEomfn9iynLcqaYeiuPOXVCGlL3nNlDPRCeKh0/WNjBcK2YeF6GtCQA52qWNbR1Rosx2uFZUa7r7g82bXdzeTjsqujgNESUkNiuhnErjYE7v2BxIw7blh2knbFnPxz6h2v/osJOMspmB6DLw/tJ8sEU46fedktdKLIuLAD1W0CMw+Tjzw9HjMd6oHZdM6Hxmlk5QT/0TlWHm5IVUO3ajVBPeVoNo+raVBhwdedMZ6Qdk/uaW2IWCzyd3wl2Qktjj4Rha59rqx0cE9Sc7FiDLtJF3qgXnP3pDfldTUB6Lfp2d6oRfCZcoDv+1gGrcwjmIYj1asffPPjb9zPmcmdglGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicVHSN/SaLt5sbIpeP3Bpsxfwbw1VFE85YnRqxmJrE=;
 b=UosloyYd7mU2zjrgBv8aTgxVBZpMk7vRQip/vpG+ANT7cX9cnrnwWY4VorMOu3cX4zL15ItoKRX4ey8/QJ8/4QGVU1bo5bKgWtvfTe5iYVZHxzzzwH3pg5ePWCnFCrvkkQoOdahSPIwBfk4X/I+H16AMJL0llEraJg/uOABqJwQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB6194.eurprd02.prod.outlook.com (2603:10a6:20b:1a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 04:45:48 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 04:45:48 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Topic: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Index: AQHcW/3CfKxdjvqcsU2xY8ILsxy9ubUFuv5dgAA9UWA=
Date: Thu, 27 Nov 2025 04:45:48 +0000
Message-ID: 
 <DB5PR02MB10213552B4B167D95FEF392F7EFDFA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1763849517.git.steve@sakoman.com>
 <e6de433ccb2784581d6c775cce97f414ef9334b1.1763849517.git.steve@sakoman.com>
 <187BB63A9D5CD718.192695@lists.openembedded.org>
 <bc058d00-62fa-4c96-ba4d-7b9357f48651@kernel.crashing.org>
In-Reply-To: <bc058d00-62fa-4c96-ba4d-7b9357f48651@kernel.crashing.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB6194:EE_
x-ms-office365-filtering-correlation-id: 90e2481c-f93f-470c-d9db-08de2d6fd5ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N2psWXd0eXZwNjVBbm5iZks5NWZPSlV5bUROZmQvRWFsdFNETlhwMkVjbHpS?=
 =?utf-8?B?Q1Q2cEZja3VRZnNwaTBPTnpqNWlkV3pvV2JFUExTMStGaFREQlJCdmppKzdC?=
 =?utf-8?B?T3BuUks3RnJCYWg3WDEvTm1DV25xVCtvVkRZTUEzUytnSkVYbU1mY2VFS3VW?=
 =?utf-8?B?SDVSZ25IbHgrWnBscjJ0TC9WNmVQa1V6UnhxOXlhbjFKa21RNVV6OGF3Y01O?=
 =?utf-8?B?RW1Wd0h5VVhsQkNLeklQZW94dVRaQkNwKzc2QmFJWVhwMDFuMnRMQUZuc2ZV?=
 =?utf-8?B?cWp0NnAwckl4MG9scEtEVHpMVVVNK0sxakNYekJHeERFd1QwaitwL0xyNTgz?=
 =?utf-8?B?RXhoV0hqaktlSjNkdExSWDk4c3RPcjlaNEpKbVNLa3dJSkZmUEFkR0ZUYnNM?=
 =?utf-8?B?WTlCc2UxS0x3UkxkMm13QlZkRitaZG50RjYxamZLaldWS3B0T3VEWDhkTFR6?=
 =?utf-8?B?QzZVRmhvSU8zNk1TMmM0Q0VwUTBtejRqUDdoYndaazFTeDBlaTlDbE9IUFdx?=
 =?utf-8?B?ZkdNQ3lnVWNOQ0c4Z2Q3RjlkRjZmZWFoVjF1UUFEMGMrSEtUN016d2NHZjlk?=
 =?utf-8?B?R2k0WjB1N2V0VEY0UWppVTBPNThYTWhLR0Zrb1hqcTZTZ0xJU1hQU1JSeTgw?=
 =?utf-8?B?SWJDb1V0eWF6TUVwTjRBOTJocU9yd0Qway9GK2NqZ3p1elZzeFlscGJSTUZo?=
 =?utf-8?B?VzZ6VHhpM0Qra0QvN1NuaExwdGt6czJZM0Nsb2IvWmdBc1VOdUtreGlqYjM3?=
 =?utf-8?B?L0ROaUdHL0VCbmlYRUgyeW10L29xZE1iU2Z2Yjg4VGM4cVZ3aURZMGhKMm9q?=
 =?utf-8?B?MDhDNkN0WU4zMDlKODJJL1hGUThyRFlZVk1NdXR0V3dPdVdDVzFtYW1QV2Ja?=
 =?utf-8?B?ZnZ6RmI2ZFdYYk0wblBFWlRSMFZmSmprcmZ2Vkx2TVF1UWU0d3VlV3dibFps?=
 =?utf-8?B?cWtweEZnRkxEdUswQmVUcmU3cnJUWkN1SDR2dXhmZTZ6bEl3bVplMm5ybHlt?=
 =?utf-8?B?SmgvSDlBTjF3bjdtQmVtV0dKZnVCVElMc2IydVcyL2hwM0RlVXRLN3Q5cE5o?=
 =?utf-8?B?bEpPYmtZQ0dIUkt5ZXFHMk9YVlRWNEdHY3RHckV0T1RuM0daY1o0VHUvdnJO?=
 =?utf-8?B?UU9nWDVDUzZDcS95ZURIbVdOQXl2M0pGalF1WXQzMnlNZVhGWUlVVGx1d05j?=
 =?utf-8?B?UjZpbUpUcTB1SGFjNzN5SHdZTk5BK0plT1pINDBRbjZ0dVM2anY5MHJodWVW?=
 =?utf-8?B?aUNTTHlBRitONktNVXhrcDFGODZsc0lqbUFoc1dQcVMwcGZEOHZPWENqZUl3?=
 =?utf-8?B?R1VnR1NmaVZYazF4Zk8xdWcvMzBTbXB5V3JUSVlSemxNYUhkNkxBV2VzRzZB?=
 =?utf-8?B?YTRHUGFtKzNNRzU4RTN3a3M2SnpGR0JkR0Z1WlMzbTBTdCtCN21WbTR6R0Jx?=
 =?utf-8?B?dUVvNUpLNWxCTWhQcTdHUHBmUktQWVFTTnFjMml0K3hzV1V1VmVjWHpZWTE5?=
 =?utf-8?B?RitDSktsZzFJeUV0aHV0b21sWHZkdlBOZzhKTy9DT1k2WEtRMVFOU2xCRmtv?=
 =?utf-8?B?b3VkSytLVHJDeVNjc2w3Z3c5U1htdmpQdWlFODM3NFJMd1NZOHloODNoSkJR?=
 =?utf-8?B?V0cwMXo0NHBkV1Y5bkZOajU0cGxaMjFjTXlHVm9hb0lyZDNNUUxLUmRoQzJL?=
 =?utf-8?B?Ym1zTGN4cTdZUlIwbDNEREtWc0w2L2ZPVlFiVThnMStUaHcvdDBGRHpUWFR2?=
 =?utf-8?B?eFgrdzNSdmVLRXorekYyMmsrbk1pdHpvNFhYTWhhZGNsYTVuSjZ5M0wra0Q4?=
 =?utf-8?B?WEgvVHVoa3VUUHhZV3FVZXJobnBiN1Z2Vm5qYlJDQWpWb0JDMUlSekJiZkZD?=
 =?utf-8?B?U1c5L2kvdldYcXJURnhKYmJrM0tiSXZRRmJXS0JNOTlvM1ZIMEtWaU1iTU1m?=
 =?utf-8?B?anlWMjV1L01vL0d2THRJdWVHdCtGWVJDNEs4Z3l5cS9lc205VWlTUmRHa1Zt?=
 =?utf-8?B?UTJFazhlM25kVURmOE96Tm1hU1Q3bDdDZzRTSVozZzBubW9nQlpTUEYraFlk?=
 =?utf-8?Q?3QlWcI?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THExb2xYYnVEeXFWVnFuTVlhSTA2VmVNZmhwbDRGTUFSY0hjNzk3QzdTb2xj?=
 =?utf-8?B?MkdCMEJMdmZTenF4VnYyeWdQdzNMQjJTTk9CUzJUT2RXOEtQOFJtL00veStI?=
 =?utf-8?B?MzhDdEd6SEIzdjIrOCt0NDlkbEtWbTFSQndybk40YXdXQTRNZXVYaFcyMEhQ?=
 =?utf-8?B?eHRYeXN4S1pBcVhTZ1FVSnFXamFEQ044L3J5Rm1RWEIzRmU4UmxqbjhxajNq?=
 =?utf-8?B?TXdvbFVNdEVQdVJYMk41WEhLenFLREpXT1BEL1ZsWnNLWkYyN2VpcUtSblY4?=
 =?utf-8?B?MldxeTkzY29uRlZDV1pwUkxxcTg1TVJuTHhGamEvcTdVbHgweHhOR3JJUzNn?=
 =?utf-8?B?bnA1ZTJpdDFGUWZkYmZsWkxidWFQaTZXS1EwRkVRd3NmMkI2akpRQTRjZFNZ?=
 =?utf-8?B?YnhYeTRjOEFFSm9xWE93cnMzbyt6WDRsRkdFTWRURlVISVhMMFc1Q3I5WFk4?=
 =?utf-8?B?V1RnOHlJOXhGd2hvQVZaRTRUQ2thVGl3QVRkaG9TS0xEb2RBalBHeHpYNkZq?=
 =?utf-8?B?MXVNbThJdUx2K2FxbzNkMERIL0FOcy91NEp2bTl0UWtBL1p2a2RCV2RIMGhW?=
 =?utf-8?B?aFFPd3Q2VHJaL2IraFNJNUs5YUhyMVBoOGhYTGFLMkZHd0hRY1ZwbmxwcVJh?=
 =?utf-8?B?VitqSU9OQ2RLVnpkMkNiQXNCQkxlUTlFcXZxZ2RJdHBKMldqMkRWbXJBRFY0?=
 =?utf-8?B?bnFTMGZYZXhBTnFQaTB6NzFiaS9qdXdCU3BDMWd0bVlQOVFkS0JlVDA3NTAz?=
 =?utf-8?B?dGk3WlJyZGI0NjltVkQvYXhrSHc1ckwrZ3U0SmYxVS9JYWhxd1A5OUNJU2d0?=
 =?utf-8?B?VmhsSnNsUUF5WG01aWFRRWsrUHY2VTMrUUltTmxRdC94NFJ5Myt3ZVhmRWFN?=
 =?utf-8?B?aGpRODdMSm5YeThmQS9GVGVUbEZ3ZzBPRHhNVzFhMk5UWVluZ2pmZnNxOC9z?=
 =?utf-8?B?TmJwL1dsa000OCt0NVFWcFErZDdhQTdnSm1VOTdoZEp0TkZYeWtYb2VsV1Vq?=
 =?utf-8?B?UjBPc0lqZkl5Y3NiNml1bjRISFJFL3FOOE9UV1d5ejlteS9UeVl4Q25mRDVz?=
 =?utf-8?B?VDVzR1N1cGpQRzhuc2laUTRZVWFnVWdia1Y1TUE3cnNPbjczU2tLbE4vcnBF?=
 =?utf-8?B?WWhmaGVQVFhmbmFFRVUwNXY5a0tmSFhicVp1T29BWjVoTStEdDlpdDNuRVMz?=
 =?utf-8?B?WWE2SDA1dHhHTGpWY2xSZmFkSkQ0bEh6YzhkWnV1N1JSYXhpdktrRFp1RVll?=
 =?utf-8?B?Wit4OWxDU2dFRnlWeTRiVHBNZ3dabEs4Tjg3M2VNRHNINDNuOGtybDFmZWZR?=
 =?utf-8?B?YjZWYWxDNFl1UEtUMk5XTHZlQXN4Y0xGNUc4bWxRby96Tys2RUNzS1BCVWFE?=
 =?utf-8?B?KzdTMW0vc2Q4NWtZem91eUoyZlNLbTVIS294VGFJMEhqMjZZS1RTeEtsTkNJ?=
 =?utf-8?B?dHUzQmRqVEVGOXRqN0RxS21xS2FabmJMREkxV0oxUnAxVkVSYmg4WG5FK1NW?=
 =?utf-8?B?dVpnQ1BneFpWTElpSVJHVzQxbVRQZEV0b0pHSWxpZmVMQkg3Sm93MGJUZjQ3?=
 =?utf-8?B?ZHZiWE1aVVFUSkg5SEhuZXZqL0VEcG9kSmpEeW45ODM5ZUFhMC9oWUs3SHJQ?=
 =?utf-8?B?RFgyNnFPTGw0dWQxSStJbFFWNnJENzUrSlNsOHYyS1NzcTU2QjRWMTBwSmt3?=
 =?utf-8?B?RjZDKy90cTZRRTBDUWZGc3lTNVlLd2piUWtoWVZGMGw1OTN5WWZkakRvYURS?=
 =?utf-8?B?MmZaL20zNHl4QTlCVEsrbzVlNXNEQlp1UnZQdVI2Y0JkbDBCSG1UWU5xS2NZ?=
 =?utf-8?B?Q3hYTi9hTys4dFppWGh3MjhtZXpyOUFvaCthSnZjNTg0VnNZbjlMbEc1WVNF?=
 =?utf-8?B?UURrOERJOEN6UDFhVVJHbFd5UGF5L05NbGVNWGgyYm1Lb3I2N2FEUjAzRTZF?=
 =?utf-8?B?WEVSRE13bFl3WDU3cWFvZnZmUy94djVqSGVSa3g4UDhNbndTNHRHaS85RGQr?=
 =?utf-8?B?YVYvdDBjZ2hPcUlGUUVPVFJCTVpwYkluc1JwZlRpZHl5dkM5VG1LWGJIM0ZU?=
 =?utf-8?B?ZFM0aDNyMnhNek9iR3pESk1rRmxsUDdBbHJsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e2481c-f93f-470c-d9db-08de2d6fd5ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 04:45:48.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6XbB9vFD8ZQ7rwfrm1cbVDCG6NepJ54thf/R1S779Xlho5h4leR87KQC+ahp9TG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 04:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226826

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgTWFyayBIYXRsZQ0KPiBTZW50OiBkZW4gMjcgbm92ZW1iZXIg
MjAyNSAwMjowMg0KPiBUbzogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+OyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV1bc2NhcnRoZ2FwIDE0LzIxXSBsaWIvb2UvZ286IGRvY3VtZW50IG1hcF9hcmNoLCBhbmQg
cmFpc2UgYW4gZXJyb3Igb24gdW5rbm93biBhcmNoaXRlY3R1cmUNCj4gDQo+IEkgaGF2ZSBhIHBv
c3NpYmxlIHdvcmthcm91bmQsIGZvciBtaWNyb2JsYXplLCBmb3IgdGhpcy4NCj4gDQo+IEJhc2lj
YWxseSBpdCdzIHRvIGZvcmNlIGluY2x1ZGUgYSBjbGFzcyB0aGF0IGRvZXM6DQo+IA0KPiBweXRo
b24gX19hbm9ueW1vdXMoKSB7DQo+ICAgICAgaWYgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnZ29h
cmNoJywgZCk6DQo+ICAgICAgICAgIGlmIGQuZ2V0VmFyKCdUQVJHRVRfQVJDSCcpIGluIFsnbWlj
cm9ibGF6ZScsICdtaWNyb2JsYXplZWwnLCAnbWljcm9ibGF6ZWViJ106DQo+ICAgICAgICAgICAg
ICByYWlzZSBiYi5wYXJzZS5Ta2lwUmVjaXBlKCJHbyBkb2VzIG5vdCBzdXBwb3J0IG1pY3JvYmxh
emUuIikNCj4gfQ0KDQpXaGF0IGlmIHlvdSBtYWtlIHRoZSBtYXBfYXJjaCgpIGZ1bmN0aW9uIHJh
aXNlIGJiLnBhcnNlLlNraXBSZWNpcGUgcmF0aGVyIA0KdGhhbiBLZXlFcnJvcj8gV291bGRuJ3Qg
dGhhdCBhY2hpZXZlIHRoZSBzYW1lIHdpdGhvdXQgaGF2aW5nIHRvIGhhcmRjb2RlIA0KYSBzb2x1
dGlvbiBmb3IgZWFjaCBhcmNoaXRlY3R1cmUgdGhhdCBpcyBub3Qgc3VwcG9ydGVkIGJ5IEdvPw0K
DQovL1BldGVyDQoNCj4gT24gMTEvMjYvMjUgNjo0MCBQTSwgTWFyayBIYXRsZSB3cm90ZToNCj4g
PiBUaGlzIHBhdGNoIGJyZWFrcyBNaWNyb2JsYXplIGZvciBtZS4NCj4gPg0KPiA+IE1pY3JvYmxh
emVlbCBpcyBub3QgaW4gdGhlIGxpc3Qgb2YgY291cnNlLCBidXQgZ28gZG9lc24ndCBzdXBwb3J0
IHRoaXMgYXJjaGl0ZWN0dXJlLg0KPiA+DQo+ID4gRHVyaW5nIHBhcnNpbmcgb2YgdmFyaW91cyB0
aGluZ3MsIGluc3RlYWQgb2YgdGhlIGNvbXBvbmVudCBub3QgYmVpbmcgYXZhaWxhYmxlIEkNCj4g
PiBub3cgZ2V0IG1hbnkgbWFueSBsaW5lcyBzaW1pbGFyIHRvOg0KPiA+DQo+ID4gV0FSTklORzog
PHJlY2lwZT46IEV4Y2VwdGlvbiBkdXJpbmcgYnVpbGRfZGVwZW5kZW5jaWVzIGZvciBHT0FSQ0gN
Cj4gPiBXQVJOSU5HOiA8cmVjaXBlPjogRXJyb3IgZHVyaW5nIGZpbmFsaXplIG9mIDxtdWx0aWNv
bmZpZz4NCj4gPiBFUlJPUjogRXhwYW5zaW9uRXJyb3IgZHVyaW5nIHBhcnNpbmcgPHJlY2lwZT4N
Cj4gPiBiYi5kYXRhX3NtYXJ0LkV4Y2VwdGlvbkVycm9yOiBGYWlsdXJlIGV4cGFuZGluZyBUQVJH
RVRfR09BUkNILCBleHByZXNzaW9uIHdhcw0KPiA+ICR7Z29fbWFwX2FyY2goZC5nZXRWYXIoJ1RB
UkdFVF9BUkNIJyksIGQpfSB3aGljaCB0cmlnZ2VyZWQgZXhjZXB0aW9uIEtleUVycm9yOg0KPiA+
ICdDYW5ub3QgbWFwIGFyY2hpdGVjdHVyZSBtaWNyb2JsYXplZWwnDQo+ID4gVGhlIHZhcmlhYmxl
IGRlcGVuZGVuY3kgY2hhaW4gZm9yIHRoZSBmYWlsdXJlIGlzOiBUQVJHRVRfR09BUkNIIC0+IEdP
QVJDSA0KPiA+DQo+ID4gKGF0IHdoaWNoIHBvaW50IHBhcnNpbmcgc3RvcHMpDQo+ID4NCj4gPiBJ
IHNlZSBubyBvYnZpb3VzIHdheSBoZXJlIHRvIGFkZCBhbiBhcmNoaXRlY3R1cmUgdGhhdCBPRS9Q
b2t5IGRvZXMgbm90IHN1cHBvcnQsDQo+ID4gd2hpY2ggbm93IG1ha2VzIHRoaXMgYSBoYXJkIGVy
cm9yIGZvciBhbnkgYXJjaGl0ZWN0dXJlIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGNvcmUNCj4gPiBv
ZiBPRSBhbmQvb3IgZ28uICAoaW4gdGhlIGNhc2Ugb2YgbWljcm9ibGF6ZSwgcnVzdCBhbmQgZ28g
YXJlIGxpa2VseSB0byBuZXZlciBiZQ0KPiA+IHN1cHBvcnRlZC4gIFNvIHRoZXJlIGhhcyB0byBi
ZSBhIHdheSBmb3IgbWUgdG8gYXZvaWQgdGhlIHBhcnNlIGVycm9yIGluIHRoZXNlDQo+ID4gY2Fz
ZXMuKQ0KPiA+DQo+ID4gT24gMTEvMjIvMjUgNDoxNCBQTSwgU3RldmUgU2Frb21hbiB3cm90ZToN
Cj4gPj4gRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+ID4+DQo+ID4+
IEFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcyBhbmQgd2hl
cmUgdGhlIHZhbHVlcw0KPiA+PiBjb21lIGZyb20uDQo+ID4+DQo+ID4+IElmIHRoZSBhcmNoaXRl
Y3R1cmUgaXNuJ3Qga25vdywgaW5zdGVhZCBvZiByZXR1cm5pbmcgYW4gZW1wdHkgc3RyaW5nDQo+
ID4+IHdoaWNoIGNvdWxkIGZhaWwgbXlzdGVyaW91c2x5LCByYWlzZSBhIEtleUVycm9yIHNvIGl0
IGZhaWxzIHF1aWNrbHkuDQo+ID4+DQo+ID4+IChGcm9tIE9FLUNvcmUgcmV2OiAwMjU0MTRjMTYz
MTliMDY4ZGYxY2Q3NTdhZDlhM2M5ODdhNmI4NzFkKQ0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+ID4+
IC0tLQ0KPiA+PiAgICBtZXRhL2xpYi9vZS9nby5weSB8IDYgKysrKystDQo+ID4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4NCj4gPj4gZGlm
ZiAtLWdpdCBhL21ldGEvbGliL29lL2dvLnB5IGIvbWV0YS9saWIvb2UvZ28ucHkNCj4gPj4gaW5k
ZXggZGZkOTU3ZDE1Ny4uNDU1OWRjNjNiMiAxMDA2NDQNCj4gPj4gLS0tIGEvbWV0YS9saWIvb2Uv
Z28ucHkNCj4gPj4gKysrIGIvbWV0YS9saWIvb2UvZ28ucHkNCj4gPj4gQEAgLTcsNiArNywxMCBA
QA0KPiA+PiAgICBpbXBvcnQgcmUNCj4gPj4NCj4gPj4gICAgZGVmIG1hcF9hcmNoKGEpOg0KPiA+
PiArICAgICIiIg0KPiA+PiArICAgIE1hcCBvdXIgYXJjaGl0ZWN0dXJlIG5hbWVzIHRvIEdvJ3Mg
R09BUkNIIG5hbWVzLg0KPiA+PiArICAgIFNlZSBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dv
L2Jsb2IvbWFzdGVyL3NyYy9pbnRlcm5hbC9zeXNsaXN0L3N5c2xpc3QuZ28gZm9yIHRoZSBjb21w
bGV0ZSBsaXN0Lg0KPiA+PiArICAgICIiIg0KPiA+PiAgICAgICAgaWYgcmUubWF0Y2goJ2kuODYn
LCBhKToNCj4gPj4gICAgICAgICAgICByZXR1cm4gJzM4NicNCj4gPj4gICAgICAgIGVsaWYgYSA9
PSAneDg2XzY0JzoNCj4gPj4gQEAgLTMxLDQgKzM1LDQgQEAgZGVmIG1hcF9hcmNoKGEpOg0KPiA+
PiAgICAgICAgICAgIHJldHVybiAncmlzY3Y2NCcNCj4gPj4gICAgICAgIGVsaWYgYSA9PSAnbG9v
bmdhcmNoNjQnOg0KPiA+PiAgICAgICAgICAgIHJldHVybiAnbG9vbmc2NCcNCj4gPj4gLSAgICBy
ZXR1cm4gJycNCj4gPj4gKyAgICByYWlzZSBLZXlFcnJvcihmIkNhbm5vdCBtYXAgYXJjaGl0ZWN0
dXJlIHthfSIpDQoNCg==

