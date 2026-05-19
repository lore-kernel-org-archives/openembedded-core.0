Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05897CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 09:09:16 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17435.1779181752427847943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=xuCNH6kn;
 spf=pass (domain: est.tech, ip: 40.107.130.68, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+9eSXnWj0uqKF89qxNAwFbmXwE7q/p2S6Z7CJPQUBF3a+o8G9tBp/tgmagzAk7U63c9R4G8Z7eyXOlCQmRNuBi2Gxk/Ik5pyq0HfnO9uJAYMjVUf6AdBVuAOMKEBa616sCESDlqOV34aIxhKHLrPyZaTF4ZpjLmljomt4v1ymHJwt+p33jE+3JXQoi6HtBJICLOElBr3hDXYKDZtDGquwYlaOOMlg9fPGPX5T+rTlQtn5eKifsVSoTqIdElY2HIY88h43d28O2ljoMLtfEDUrQsZan8ICnwFXVwGBQLTNrqPWKfkrUsoNsS+0GYgorjbgQFQWE6jrpIqPPgn7RJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyb9AfIfgtdNUtenaGwiQOgC2nbjK5d8e7pkCTvQyZ4=;
 b=VYVm0XDDB9gGI1O2rZm8DdTjMDyUKBjZr/gz1CxIePDFi5bO1iXCnK0bxImKIP0paA4jQiw/75F/2Dd4FG9FScfAzmBdY/KFMVGzB/RO2E3N7BhjVBKeTYbl7pbQQCpxXufAyJ5M0UO41h+AVihUStqlgCKd8G8+6Hfn0nZjHWseqUHKoafaInNI981FgosQZJBLMOUXkoA+2GC9yucIgNxkNLxTP2ifciO0hm4mlfGUWoeOaqvJo2kUSuiLBf3HLsJ06U/MhZGDfKNXZF3gizsYJ+C7ueYKNFczeLZhnL6HnaNroJaS5xXWMQr71TZGUEZ0EU6tEUdxa+grq1vheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyb9AfIfgtdNUtenaGwiQOgC2nbjK5d8e7pkCTvQyZ4=;
 b=xuCNH6kn2AQJrbEat/hTMLumMI5PrX9ho9AI3xpUJzoNOAsw6DwxlDv09kgchw9uumYKslgKDUPom7cJSKlToyDQaR9H8sC7WchnhXWKDJp0OrpdkKDqFC/1u2xgtpQMRLkonHwyyp/IvvSqbMOePKKxDNGiVGPFBWqT+TrODZIwr+g5UvXMefuRyWs6H8PDwRzLNwWryv7UbPpra/iL3Mx7hVrWnK3zmMAJ0QJ5qFD8FpkIuh9cxGoVzH1PzCOt2WcQFq+Ez94nK6stcV0Ob+5nA2UpdYpYc6EZ8kJWXqIKDJgYXtBNdeZIP4XQflLFXq8gsBmuuS6mD12GuYE4+g==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PAVP189MB2457.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:301::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 09:09:08 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 09:09:08 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] zstd: add ptest support
Thread-Topic: [OE-core][PATCH v1] zstd: add ptest support
Thread-Index: AQHc3sWNsoSGWvFsEkKrPkDtlWk7n7YVFwAAgAAJpcI=
Date: Tue, 19 May 2026 09:09:08 +0000
Message-ID: 
 <GV2P189MB3005D938AF7125F92B4A23B5FE002@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260508083451.11094-1-pratik.farkase@est.tech>
 <DIMIJTY0GGEX.13JQIE01GIF1N@bootlin.com>
In-Reply-To: <DIMIJTY0GGEX.13JQIE01GIF1N@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PAVP189MB2457:EE_
x-ms-office365-filtering-correlation-id: 2244d177-e9ff-4764-dd2c-08deb5864892
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|11063799006|22082099003|18002099003|56012099003|4143699003;
x-microsoft-antispam-message-info: 
 QK4FYZuogjsp8Bo/YAnWKplZqThYSdUOJuCVxFrZfvg/M5uhD1GtrYTD0qjrhWyNxEgC/B8YgP0fli+xxYc4l4oPAM7zlDNBf+Tij5ePv26peVhEPKsBI+huP2TTKu8qGEn1JtqKEW98Od0pDG//OPd2e8+zIub0lHywE0b32h7VAGp1iaufkZSZl/IAbmpeHM9O98pubEoczOvpJNhfSkANXoeVpbSpusTKWabbbziM9LqbcJSW5egRgQfM+5Wqi+PyiMs1Jx+mH+mUf6mpwnTEHZR/WAP7o1F1+GZe4ipOt808upUd1adYLQ8PuMp7xnZw3NrJMWsdJlC7d/6g3d+L7mtwri4DYVoPbDvmG67F+7GOdBZR72TePy76m2Di7t/73OWBlr+SflOrc/YML4KKRtjZyhqxrmXxm0ipR2xoAwY21m8h63VixwH6OFKLrC5JR3ErUEVAv0E3p+z8kpgK6SZweb1U9VR1e+J37JPjBH2AXoewkDzQMmFcKkDnbHk7rwvFa3m+1965RKTVJ+06ez1Oc4IZCUR0GiKGwpxWhXiAkkglsj8/rpm3o9H+8PNFGPaawaw3HeU6qL+beAcaoY9S/sPfqKmRXEMQgrvPoTISTY9mxIzUgCslbyxUACKCdyy02dycCJOitBp2fkaJdWQob95mXdOgPUvUAhQcpdksJSUQz6fmh87cg9A54ZULFKOq0olGYykSxabj4VciQBQ3kRY5tL+J4csDSDiSgCkvSnQeNsP0FYrAqD2E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(22082099003)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Y8cmHhTITaq8CZ8F0t1mmYZ70BPNi/8ubWKbbCQUtOmII7aNKrwvz0V+8roV?=
 =?us-ascii?Q?Bi0zfboBWCF/TthwjSzVHwE/I+g6qfJ3x858Nak2y3ppZivMct10k7n1p1nj?=
 =?us-ascii?Q?EAXC1vpcBrSEPgpW4OrVNfTNofu9rIdFR7QZzuJOY6iOeRp3JcSRev1XE60o?=
 =?us-ascii?Q?MePZVfqPCjWvPErZ14YGTSjkUAOWwbUyEtXfcRjybCTzl4+rxvML2+uar3hH?=
 =?us-ascii?Q?cbTqIFq7/wZrfTJq2TJJcV17S7+kMvPjViMCMXpRp7hcMfyTNi05OuYUo++T?=
 =?us-ascii?Q?n6EQWTWnoPD3pbZGe8KBXsRSV+9pHU4ha5I0H0rY6ONavCX5DnrlE6tqLjvl?=
 =?us-ascii?Q?JtI47OovO7uAI4j6eXafQ+NMWKgv7qP2E4YXfCvryX7gOz4MFyvkKKdMfVJI?=
 =?us-ascii?Q?hO5yV588Bw/HI6sElPVoECaxieHTtqCZnBS/iLlwBzR5WTlp2nmTdjFbarzL?=
 =?us-ascii?Q?AULEOEHkRpue7vzJ2w1thwRGmXxT7/f9/HNCeHwSyLCo498y3viz+WLp95Zv?=
 =?us-ascii?Q?42S8G2EqpZvtTJrFY3Zj0FsaMNA0CkKWijCirX4BT3ZuuAODNOTRizaOtDO3?=
 =?us-ascii?Q?/fcPr02+dTDeDnoHNTJbKvpWB0sizxnsAIc/1oxXCLJvy454twLNzpZUscGy?=
 =?us-ascii?Q?a1IVkkoeYMYGHXX4kKcsM7lIn5h6gM7xJ7EtZUkoaO8ZqM7agGZyLsRpUl3j?=
 =?us-ascii?Q?j+EIhhtOKVW5GuWlMdUoz9udgqJMRu39pBEVDCMCduXx5r+uK820KcHyilRc?=
 =?us-ascii?Q?uGsAlyUF2KxwRZSqPnsS4j7TRue74xZe/qkmE2vQYWZ49xOCBk2VAcV1tUvT?=
 =?us-ascii?Q?rfO3PPyINvdjH0hR1l5D3ojg5N2AdIAIOSVseBAI1Tkym6BGLLF+o7qfrgQx?=
 =?us-ascii?Q?KkPNykV1tryZMREpGle2UQKBPW1odXqXLngJKppAnPUuVUR3CgKPC48YSEab?=
 =?us-ascii?Q?icoqJmOxvDzZaA/+iF+1PWY+H330ZEo0ewSEHKORTWklDJ83LkpblzaaEyWe?=
 =?us-ascii?Q?CaXvBpwrchmdPG8wsZsnpEEI774H3w0ZqdxRbsxCFWuVFFcCts6NevRRHaqi?=
 =?us-ascii?Q?+56/V84+2VcCWFd4eq8mUF3MqbVLjvaqzihBiaXM4yd+D+WSAz6tvzL3R2Wx?=
 =?us-ascii?Q?r+RDPsZVDGqS62WxR9dM8sEF0Uq1SRUH0NVvCoxdnvhlBtm7SB7Bw6IvKlPI?=
 =?us-ascii?Q?oEIVePeGkg4AAiTM1tA6bPOO8+NzfMrX/opOYP1ZhrZUB8mKlooGb6PDnabF?=
 =?us-ascii?Q?1NNBusGxDQoa2PfdIVZmmgN4G4vMdFfXWfJYba9V79kaIzx2uYW7VtsdUCEQ?=
 =?us-ascii?Q?ChK4XMdPlia14K5BWEf/gG1Z7G6bPoFAManVH1qujhTGHwdvaD+iyHFWsAdN?=
 =?us-ascii?Q?vgybtSxYiBETUr4rwtkQul19PSD0BoiBPaAbaHHDVZJperKUYWs1mwn6tzsu?=
 =?us-ascii?Q?L56IP80v+eQw6GM6l2mogg+5E61RkH35Wt8BvaHFJtj2w+8CFTValHSwrCxn?=
 =?us-ascii?Q?Nbgl9XzZIehTJ447uGzOHuPjeO1R/vYfPwkXHmM6875DxiFk5WkXxUazPeqO?=
 =?us-ascii?Q?W6aIOpnY0Nrt1fK5Aqu5SiHeNU3PLl4FB2BX1aT2obOMLPy5iMyKusrTrk10?=
 =?us-ascii?Q?XIJYorfzo0uFCYVw4j5/WiQQz9o1M6mqUDPipVqBRNjecfMIoMAH4zd+16+K?=
 =?us-ascii?Q?urKcmscSP1bWcgYrU4/0GrpB1JFYo7xqGBLUYCPslqKKMjAQ3BcsOAVxIwht?=
 =?us-ascii?Q?VNay/1KZqw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2244d177-e9ff-4764-dd2c-08deb5864892
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 09:09:08.0845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJc8/1qgpGhuhzKdvqxBQo0aEmGVfRPk6qsZjwltUWNdXYbO45+Kz/V6AOhurUePe3tPxy7Oz/h8fyqFNIJAaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 09:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237296

Hi Antonin,

Rebased on current master in v2. No functional changes.

Best Regards,
Pratik

________________________________________
From: Antonin Godard <antonin.godard@bootlin.com>
Sent: Tuesday, May 19, 2026 10:34 AM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] zstd: add ptest support

Hi,

Sorry, this patch no longer applies on master, due to conflicts with the QB=
_MEM
assignment. Could you rebase and resend?

Antonin

