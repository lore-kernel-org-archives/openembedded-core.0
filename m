Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0BBD13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 11:22:00 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.84])
 by mx.groups.io with SMTP id smtpd.web11.49245.1730114515249594287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 04:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Wp+0ePCt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Wp+0ePCt;
 spf=pass (domain: arm.com, ip: 40.107.249.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gE7/yoLZN9rvfK5wZ7f+Xl17+cfgoJqqk9AqncrXHfwQFgwu4FhuLAXVugSjPf/0gznws8Y741ppnUgkwQiCypOTzIcY1r3YT9vJw/g2s++Al96iwha+xaACApA6MpFw0uuL9rNBTpNuGBG/F4A3UK8gEN1Yihru7F9uvKLrDNnD7jKB6mIPVeNR5PMzU4qztAMUhkEYCnhVPrwrF1qSrfz5hstOZvKkOCSranIRSpIe1PEfzZYaAWhwPx5VlfC4npOPGt2AAiANymP9ZS22D0Vw4St9xw7cNTmhUZp/wfysHD/5/YnGj2Z1EIkOXxpNkW+2LUNaFGBMaOkL5YZzRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EMVbgslLFdre3Ktzp2+X1pE/KhCvoRoR/QphmXMhLM=;
 b=eZhw84+0cfT0yxJRNusMvdPP6Y780ZmVNiVNfAY3XGJGxveV5HPbsxDbmTvGfUBM3urUjqH0XJe2AJaQQvtMYOSCUz8tZ7S4cx6GNUTxWH3ZW/TIEl58W0KmiRApTInyWO3PlpNfm0RIN4eSOeRan113S11PdQ+MzH9dmY/BOmO0q8QTwnlVqFcHPymTZJMGYWSyKl2gSLR+8WzZUJ2UXO35kvTgB4zEQEFlRLlg5KpCQvs4W12yrhkfOJNomWe+TquNS2Kfxkok1Zpx/6DAkN/d3fsXr2yDuxHEfbIZ2j2E0h7qztxf2N1kYdDZTmdeDN3w6dVIBwJS9plgW20eew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EMVbgslLFdre3Ktzp2+X1pE/KhCvoRoR/QphmXMhLM=;
 b=Wp+0ePCti0ciRFdwl/dTLqjeU9aMlqMvqO+Qe/6D/FFOPtWMhG7I2dD7hym0Hvi2/GSAfxhCB7Itr8Di+ewMPuysAkR7VsTgTkVgo27B0T36Tm7W3m4gazmez9W4U50K6hP3kd+iBTDlJrDaomHkslUy1Rn6f3euen1K5frNR2M=
Received: from DB8PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:110::29)
 by GV1PR08MB10720.eurprd08.prod.outlook.com (2603:10a6:150:16d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 11:21:51 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::cc) by DB8PR04CA0019.outlook.office365.com
 (2603:10a6:10:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23 via Frontend
 Transport; Mon, 28 Oct 2024 11:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Mon, 28 Oct 2024 11:21:50 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Mon, 28 Oct 2024 11:21:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4fa774aba28a913a
X-TessianGatewayMetadata: D6osrUYWQtcU9RIjbeErzQ/t25Bca9yRmfr9J/DH2NxJQm7WGYXeKsRApcxu9qOb+DscJZCNyZl7RQn4z6BdLGtsyCFCyjhE04hIy8ouc3f8CdB9p87bfOQXho13yKc9x15oPB71t/jmyGtV2TXJtDQQzpxcTVlJ3VykwwRmiUM=
X-CR-MTA-TID: 64aa7808
Received: from L4089d34d4fdc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DEC37E3F-9719-4A63-B821-4F0B775E34E0.1;
	Mon, 28 Oct 2024 11:21:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4089d34d4fdc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 28 Oct 2024 11:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG8tj66Ui2KWyAf86T5WBkKUUS+2V/wzd/9Ab2t6FD5hFzlMgMV9ygV3SadjrpBXwygKzee/q4N3oYXpWi4qlI+1fFBU7xyTk2B77uwDy+ahShzb+JUWfp0Zl7XvCzdE2h7zeZ23lQrEI2Vbo+x6dRWZJhLROwZl7VUNNgzRc4Uf/RTumGb67LLzSIE4tYJmERiPkVi/UQ21geqMUBMRn05ejguY8JC2CjRJyB2oQooAtUUtlPq/8S9p7g5ta0Jp2Yq2u9wIo8i4bJ3oA924eD0oNQHGdZfD7/XwXuh/QViRB/sEKwXxdl/b2lZ2Z3v2iNXmdCQdIzIbkdpTNrjvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EMVbgslLFdre3Ktzp2+X1pE/KhCvoRoR/QphmXMhLM=;
 b=iZQaY/uiBCcovuG9/kWvxNlSlxoK2KrjJArfO9426QMi+zQbGR/cbex/wMMG8o8AQ6d7CMhPEhcbkqdXJjIvSVLTz6in70vsNFAnKoIxo5EklyYyzte4lvAAh4DeBk9S1UacRjmfqq3Dhl6RIjNqxZeDy3YMtxYMA48zdIV9+L4ugU9/B/h6Qa1l21n8HYNMPg6s5Bs4A+Kk/vIsohGKgvDPhPOACZhKxuLRs31BP5iTbHMWI54RLTe5siYt6lkC12tW6LFWr8oAV3Byr4THpIyaYhwAvi0rPKfD5MAiK0GWGA2Qs3iUtgZeUu3taZQKi6sjArpF2CTLJMBhXIh8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EMVbgslLFdre3Ktzp2+X1pE/KhCvoRoR/QphmXMhLM=;
 b=Wp+0ePCti0ciRFdwl/dTLqjeU9aMlqMvqO+Qe/6D/FFOPtWMhG7I2dD7hym0Hvi2/GSAfxhCB7Itr8Di+ewMPuysAkR7VsTgTkVgo27B0T36Tm7W3m4gazmez9W4U50K6hP3kd+iBTDlJrDaomHkslUy1Rn6f3euen1K5frNR2M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8934.eurprd08.prod.outlook.com (2603:10a6:102:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 11:21:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 11:21:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/package: scan B first when populating
 -src package
Thread-Topic: [OE-core] [PATCH] lib/oe/package: scan B first when populating
 -src package
Thread-Index: AQHbJjm7ZT0w+UFo5kK6fbveJwAfZrKXfRyAgASNjYA=
Date: Mon, 28 Oct 2024 11:21:40 +0000
Message-ID: <CDE16466-5A73-4988-B1EE-4140C89304AD@arm.com>
References: <20241024172506.473232-1-ross.burton@arm.com>
 <f4905d79f5ff5ecb62b3d65c82b660222ddda9f8.camel@linuxfoundation.org>
In-Reply-To: 
 <f4905d79f5ff5ecb62b3d65c82b660222ddda9f8.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8934:EE_|DB5PEPF00014B88:EE_|GV1PR08MB10720:EE_
X-MS-Office365-Filtering-Correlation-Id: 285d7a03-45b6-4625-4288-08dcf742b7d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YzRHUnpNYm1wWnVvc25lNGowdVVlM1JjL0c3UFJMdUF0S0JiZ1dPbVdMRUdq?=
 =?utf-8?B?b2Qvc0V4ZHlyM21ueGplQXV1NjR3M0VCWEJYMmhpL1hudUhTaEE3S0JhR0c3?=
 =?utf-8?B?TnJpQWhWaW9jT0tWRGtUZGVKVll2c0VWUVhUWXB5ODB5bUIzUFZHTHdheGtV?=
 =?utf-8?B?akZWMklZeG0xOWdIbVFlVEhsWFZxNS9SSGlNNnhTRnJQNXNzZWtGTnkyOExm?=
 =?utf-8?B?NTBoazRyYk8wb0tPVzZkdHEwNkJ4NWEwem54SXhkWTBkbnByNkExRnAwc0xq?=
 =?utf-8?B?ZllwcFp0dTUvSXZMVllya2lVMnhCRTBZK1A1ZGk4TU5JT3JkWXNES0VTUFRa?=
 =?utf-8?B?ekY0NDdTcjAycGJIdjYxNFpiTGpMOUcyaVNVVnVocmRZYUJNZGtkWktxT2ht?=
 =?utf-8?B?VFdYdXhXbzA5blhtZGFLUmNqNGdyY0NqVmlkQzdkcktuc09GZUlXa2xUZFll?=
 =?utf-8?B?TkNDaGhMNFVaSlB0aU84bUw0Wk4rRC95cTYwMERYdDlrajhnMjJLL05RNHVB?=
 =?utf-8?B?MitMelBzelZQVGk0Y085dU53TFRBcXljMmM5RldjdVdTTFcvSitVdjBzdDFy?=
 =?utf-8?B?K0dxL0Z6VDdreFB0Tkd6L3NnWm1ZSkM1eVpDeis4VFF5SzEvY1dIN21QbHJS?=
 =?utf-8?B?NWE0NFU5blZ6cmp4RHRGdE9QU0FLRks0QzdmSTJTYkxjZW43RGdUYTRGbDFj?=
 =?utf-8?B?S2UvZGtKK29NcFlPNmxwNFluSHdCT3QwWUtjZlZTRFJQWHVZOE02ZXYwVXU1?=
 =?utf-8?B?bXU1MXk1RFZVUExEOUNpUllGWVFFMTBuRm1mUmtndzNKS21IMXd0YWh5S1JC?=
 =?utf-8?B?eVB4cmQ3SjB5UnFrSXlYVjRnbExYNi9FNUlHS3pMQ0FPL1FxaC96WmVuZFlK?=
 =?utf-8?B?c2ttTlJNOHF0SWxuSUJxQkhra0xkSkl3Q2lNUm5CRUhCMldTRXJqaUdjWWxu?=
 =?utf-8?B?bmkwdzJUTGMzRHBEUDNrNS80dDREK2hlczJkME1lcFluaDJBbk5icCtVVk4w?=
 =?utf-8?B?alZqekF5RTBPenNEWWhwZGVwdlI1OU5tNElxaHZ3SnZDVjZHSDI3Z1IwYW5N?=
 =?utf-8?B?RkxUWDBiU3ArYXFNV3dWSGJoZjliVnFGclhxbXVGUTU5aElzRTJBWkUvZ2NS?=
 =?utf-8?B?aS9telVZUFgvUndFVnZOUkRrbjA4d2xzdXBpRVNwODhsUnBoUXhQL1dmSUxS?=
 =?utf-8?B?OXcvT21zSGQyQ0JhRjBnOVlseFlVU3BBbjZZbk1KMG5PcGJhalJ6WlV6SGk4?=
 =?utf-8?B?djZtd3Jpd0ZrV0RCa2VtVC8wNGs0TEZHSUhKU0ozajFnNmZRZlVuNkdyRmNm?=
 =?utf-8?B?TXlqbXFna2pPZ29Xanh5eHFmeEQvbTFUbG1HaDdZeGtJajJuUTBhdi9XdTZ0?=
 =?utf-8?B?ZmdPeURiYzdvU0pxMlVpT2gxbTZxUTRDRnlWa0MrU0lIODl4N3pEK2YzZUg0?=
 =?utf-8?B?Mm1mbFB2ODdmSWRsSTVrZVd3Y1NvclFNQ0dzdFQzY0hqYjNEZ3FxZGg5K3l3?=
 =?utf-8?B?SmlHb1kyNmJlOHdsMVFRcFU3TU5VSE5rMlJlN05WRFhQblcwT3BHV0lmWTE5?=
 =?utf-8?B?ZVV3a3pybXdOS1h4c1MvL2dqbVo4dGY1MW40c2tKWXgxaG5mem8wOGVRbXY0?=
 =?utf-8?B?NzNsaFQyOUtaY1I1Nno0c2FCWVZRdDFIM3VaRGJjOEcxd21CdVpHbSt4M3Rm?=
 =?utf-8?B?ODlWWkFRL0xNM2dMMC80eWNVTDArTmFjVmIzQlZLNEw4b2pQS3VjWldHV2pv?=
 =?utf-8?B?UGp4VkpXVStCZnhVUCtLVkRKQlJqYk9IOXQxS2RJeVd0dUZZQnJ5cVgxbTZN?=
 =?utf-8?Q?ywsNBr7umEOc18sKz7/VFxze12V4jlz75Zlk0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <04EDFBA96DA4B9409AE966961983A25D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8934
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	23d88b5e-e160-4a14-d111-08dcf742b1ee
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUZITmw1M0srV013b0dZNjlmNG4zaUJQbGhPVVN6MFpUdjY0VVBoQnExV1pw?=
 =?utf-8?B?SG5XdmVlT2w0MG85TEY0bkZHTHNhaldaRExkOWh2R0dvSWFtT2FkcEx2MUNK?=
 =?utf-8?B?eVpuVFFudWI3MlZpcEx1SDdlWFlPQWU2RlQrbk93Z3FiMkVjRWwvQmY1YWhF?=
 =?utf-8?B?UnptSWhJMHJYcllwaFpaOXBYaExLWUdLOVVaOG9RdkpRejYwL0tyRTU2SWpi?=
 =?utf-8?B?c1RmV0RjeEllOTJsWDY1NEdiZzljT0J1RzJQak1haTM5Qllycnk5b3FtY3Bz?=
 =?utf-8?B?V2JJVE1sZDN4SEpDYnd0cTM5OVJpUzBOVVpCN09OOGJxSS94NzVtL2R0WjBW?=
 =?utf-8?B?VDllNUhkeE5jRHJqb2pEcStIZlJuSWc4RUJ1YllBaWJHc2RMZnBZbVpvVlpj?=
 =?utf-8?B?enFlVzZBUlR3VFBZSVVodGNGZGdBVXpGdDRDYkVTKzNveENTMFFxUTg3U1kr?=
 =?utf-8?B?cUdhSFE4enZBNG1BaFQ5VTIrbTUyQVB2eE1YU2k0eFJJZ1pac0J6bERYaThR?=
 =?utf-8?B?VWhPZ2dUUWtMS1lZRisyN21DSmVNV3M4ME1pQUZ0N3dsRkpaemI2eGUvaHcv?=
 =?utf-8?B?U0llcFc5TGt6dm9Ia05UMjlDSmhTY2RVR2Z4Tkx0Z2tFZHdLMkxBODJuUDgz?=
 =?utf-8?B?aHVEZDBMQU50cnZnRlBmQkIrcWlvY3lmZVZlY3N1WG9pdDBhYXp3STZuTXg0?=
 =?utf-8?B?NGZBTzZOSjVaNHQ5WmFReDlCR2ZQckQ1OGw2a2NGQmowRndWWTFoWUkwWWJ3?=
 =?utf-8?B?SENDeGdtTGR3U2RGeW13YWszUkRGTUM4SnZPUHh6UTljNFFvc3hEb3h1emlM?=
 =?utf-8?B?OFh2aUdFRjVOQkdEUEM1V0Y1S1AvSWlmWS84aURVUjlweGdGaHk1YkZwWWZp?=
 =?utf-8?B?dEJYeWN0NmhJekwxUTBUU3VrWTdFVWExdS9rTWVXOFZyMnRxdzZuYlJjcWFQ?=
 =?utf-8?B?d2V5eFl6b2pLS0lnMVpXaFB2QVJzTFFubW9rdlB6YzB4OTVpU2xtc3YxcGto?=
 =?utf-8?B?aUlWVWdDN0F5d1E0U29yZDFQcjFkUjZaWWRqellObTJaS1VUSVVzSlo4b1BW?=
 =?utf-8?B?L3FYZm5rK2dwSmlSWjRtTlppT1NVdk8xbWdTanpMMi81WnhlWGkrL0lzVEYz?=
 =?utf-8?B?dWxDQlZYbVdMOE1NaTRvNE1yY1B4dVBvOWhabWZlTTg3QzRVb2IySzkxOGwv?=
 =?utf-8?B?VGZFaUxDWlNlOU42K2M4a0tvazdKQXZ1clVwZG9kaThzQTRhelVFbXNzVVdD?=
 =?utf-8?B?UEhTYUMwbGJHVDBhaXl5Z3Z6YjRWV09pUmp6Z0gwOVZYZE9VRkoxSmg4NU1o?=
 =?utf-8?B?TzVXM2RZalBCUEJ3N0JDQ0NMK2xIRi9DUGF4M0NpbXMvQUZ4c0k1RkhRQmh5?=
 =?utf-8?B?YTByRWptaGdPNlpyTS9HMDY2Y05CZnh1d25HQ3oxSnByY3pRVWduUE10QTZ6?=
 =?utf-8?B?cVZmd0ZOQ1c3MTdpdDZURDBPQTlRUlYxYy95Z3lhRnJQM2xSZjBiWHRLUXVy?=
 =?utf-8?B?UHhDMjZ3MERkMjg4L3VCLzJkaUpnbzBrcmExcUdlbVNVTE9oVk52S1V1dTlq?=
 =?utf-8?B?T00yRWQ3SEQ0aWRhVnpaVUM4NUpZd1p2ZUNPYm1Kc244YkFwdEc2WCtyKzda?=
 =?utf-8?B?RzIwdHo2LzcvZTJtSFpnVnFpazlWendCc0FSYVlJR2tFVUtTaFZtdjlGRkdr?=
 =?utf-8?B?RG9RbjlWTWhMYmFZa2N2cG5lQWtUTGlURlBQbmFaQWJsbTNLVjBaWjhsNTFT?=
 =?utf-8?B?ZmxhSmZlN3MzckxBMExpK0JnODFqOXhaemRxZXMweU1PVFhOeGljY0RxQmhR?=
 =?utf-8?B?N2RMWFhGZTRFejhVMzZLTTczam9IN1VNSUJsTUpFMXg1R055Rm1pRWVGbGFL?=
 =?utf-8?B?K2hjbHNPKzNWODZWeVVIbEF2QXh5ZWJKYzFkY0o3UU1hVEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 11:21:50.3876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285d7a03-45b6-4625-4288-08dcf742b7d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10720
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 11:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206443

T24gMjUgT2N0IDIwMjQsIGF0IDE0OjQ5LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IEkndmUgc2VudCBvdXQgYSBjaGFuZ2UgZm9y
IGRvX3BhY2thZ2Ugd2hpY2ggc3RvcHMgdGhlIG1lc3Npbmcgd2l0aCB0aGUNCj4gdGltZXN0YW1w
cy4gSXQgYnJlYWtzIHJlcHJvZHVjaWJpbGl0eSBvZiB0aGUgZG9fcGFja2FnZSBzc3RhdGUgYnV0
IHRoYXQNCj4gaXMgcHJvYmFibHkgdGhlIHJpZ2h0IGNvbXByb21pc2UuIFNlZSB3aGF0IHlvdSB0
aGluay4uLg0KPiANCj4gRG9lcyB0aGF0IG1lYW4gd2UgZG9uJ3QgbmVlZCB0byB0aGlzIHBhdGNo
IChzaW5jZSB0aGlzIGZlZWxzIGxpa2UgYSBiaXQNCj4gb2YgYSBoYWNrKT8NCg0KT2ggaXTigJlz
IHZlcnkgbXVjaCBhIGhhY2suDQoNCknigJltIGFjdHVhbGx5IHN1cnByaXNlZCB0aGUgaGFzaCBl
cXVpdiBsb2dpYyB0d2VhayB3YXMgdGhhdCBzaW1wbGUsIEkgc2hvdWxkIGhhdmUgbG9va2VkIGF0
IHRoYXQgaW5zdGVhZCBvZiBhc3N1bWluZyBlbGRyaXRjaCBjb2RlIQ0KDQpJIGFncmVlIHRoYXQg
aW50ZXJpbSBkb19wYWNrYWdlIHNzdGF0ZSB0aGF0IGlzIGVzc2VudGlhbGx5IGFuIG9wdGltaXNh
dGlvbiBpcyBmaW5lIHRvIGJlIG5vbi1yZXByb2R1Y2libGUsIGJlY2F1c2UgdGhlIGZpbmFsIHdp
bGwgYmUgY2xhbXBlZCBieSBTREUgYW55d2F5LiAgRHJvcCB0aGlzIHBhdGNoLCBhbmQgbWVyZ2Ug
eW91cnMuDQoNClJvc3M=

