Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19263C27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:48:46 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.77])
 by mx.groups.io with SMTP id smtpd.web10.6472.1718102923956757715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KBPNQo8q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KBPNQo8q;
 spf=pass (domain: arm.com, ip: 40.107.241.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gzaR5ooLlC9DSxGL8/iFI9DrFRQitkRb0SlL1qWA/N8KqMdK3BtA5cAhKivzoSBhiWv43tL/8XkQ6UwDbFOMYqJ6wohSKljGrTeanwUe4bJ8Ltkro3priiU+qe4jPJHLS3XP8MbHvuxYpweGx2hd/TjRZ2PD+vHKHL/EC+Dtq2mHSyYZ5nsdpq+MrfG4F9QqkEUAOZdyLrSPnPMEAu0wrfDTfQG2NWVBg5G3gIYL8QVzK53ci/7hfjGa3/unoTX/SumPBCVhr1WHd+DyuG66H+//OIB4ZzOBaz9CDGfB8fqlkTbhLiCdjtsBZKhgn0ToRhDnG5iwcHDFeZmy9EhN6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Pw2ug+us70BOGIfDq/NB3Pv8yHsSLp6PbsTNPug/fI=;
 b=AQcQV4II0S7AdUmzpewSRAFl/C0/ikBtizmBRXbZMNKtyXTwzJB1yN/d6MNbRQmUoxn/u321EXbqNn4x2caSJtw54FN8b45Nu6ZPpbCnrfu7Utb3POuV9oR+uhn9hznmehNgf4x+tCTA69iu4/O4ne+p0CYQPScIwEtGbL5+DixNftYOZD3qGWEy3q7+SsiO+E2XQMcIxPB4VV5PxvyIIiO0rB3n1zoPo9JB7ET0WAnIkl1CYublZXDD/Pb0UOS/s6JBNAuBNdfx2hwMUNTe25xSHtk6tVABC6nwAESy1x7d2YC2rI/1bX9mcgV9vkYZEC97I4yGSg+q+2+Yr4U0yQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Pw2ug+us70BOGIfDq/NB3Pv8yHsSLp6PbsTNPug/fI=;
 b=KBPNQo8qIvb/D+RMaK/oSKKkNDe3o/yCO0QK6MKS2bdCDkjfeXvDnu6adIR/dT/LRaZrXQa22l1ozbED5e2O8mYpC1RM3jBswmz58MmkIEK5e6Wlt6ZJJL0vrZR6uoyH05go8j7XsD/9X8pjo1+YaGphwgsYZoyJCOh4+SFn18E=
Received: from DU7PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::12) by AM7PR08MB5414.eurprd08.prod.outlook.com
 (2603:10a6:20b:105::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:48:38 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::87) by DU7PR01CA0039.outlook.office365.com
 (2603:10a6:10:50e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Tue, 11 Jun 2024 10:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 11 Jun 2024 10:48:38 +0000
Received: ("Tessian outbound 0445a89d5280:v332"); Tue, 11 Jun 2024 10:48:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d99ec6966d1a0aca
X-CR-MTA-TID: 64aa7808
Received: from bdc9319debe7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E97A31E6-D14D-4C52-A18F-40019E14691F.1;
	Tue, 11 Jun 2024 10:48:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdc9319debe7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jun 2024 10:48:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFhLaiJVJCpXrmHwM9Urn6U7OTbJrYlfJyfn8QSF6dzcloOhZa1EEujJsljfUV9VfydZ6Q16ysaTsLAu3pM1jCPFLqYpNFnJwVznKM8lhCbHYlbOC0MJOjKuHDQ1AVXx3EYmNbM4zQz1QKMVLHiLeErLlmYPBF3+HXlsfy7VOaO7wzQaZqKiYztBrl+OTXv4bmpz4TSfW6E+rEXQFYpZfchXwHYY9dE9cas7dA3sSh+KPCglwh7O+9ukGQ8WMDOFfAVXTIRQ/umyAl2GASkIBjHjIncWVmBXkocVN/13GTH1aG4opxSdqW68qN8XIupu6GSQ1GZzVZMnsOmsHu0AlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Pw2ug+us70BOGIfDq/NB3Pv8yHsSLp6PbsTNPug/fI=;
 b=QzlldoNDHleU/MCENBd1ZIES86wesQF/nD0ZWq2+eImOROnQzMJM5zWKVGGF4IZSVPF035EoyjhsYAM20gETD7U6YMwV47UZVn7rfxhc9AEluETpgi0JjSFR/fJGVoakPkC68jT/cNX3JLnadweHYIIzkwRxzK6OmIa870mg4tveUO/bAfPazShP5YO+Ss6O4KgBfvc8+qHPFCkd+HpDBjKnFc476TtPSn11Zg+XsKEGFZHKgRGALKk09snpT/euZBflo5VDygfRZ0xxExpj+dDAUaGeSYOA/yAHOgaJFXUMZTNeS8yQZ214VcNlhRwi+iOTR5MCyQVbzzXEdqkvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Pw2ug+us70BOGIfDq/NB3Pv8yHsSLp6PbsTNPug/fI=;
 b=KBPNQo8qIvb/D+RMaK/oSKKkNDe3o/yCO0QK6MKS2bdCDkjfeXvDnu6adIR/dT/LRaZrXQa22l1ozbED5e2O8mYpC1RM3jBswmz58MmkIEK5e6Wlt6ZJJL0vrZR6uoyH05go8j7XsD/9X8pjo1+YaGphwgsYZoyJCOh4+SFn18E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:48:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:48:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "egyszeregy@freemail.hu" <egyszeregy@freemail.hu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix work-shared checking for
 kernel recipes
Thread-Topic: [OE-core] [PATCH] archiver.bbclass: Fix work-shared checking for
 kernel recipes
Thread-Index: AQHauFMK/dxto5zNP02D1YTkS2LSyLHCaRiA
Date: Tue, 11 Jun 2024 10:48:25 +0000
Message-ID: <642EEA27-10FD-40C7-8B06-24741CEA1548@arm.com>
References: <20240606204855.1904-1-egyszeregy@freemail.hu>
In-Reply-To: <20240606204855.1904-1-egyszeregy@freemail.hu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5424:EE_|DU6PEPF0000B61B:EE_|AM7PR08MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db539e9-d8ce-4a00-d0cf-08dc8a040ce7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N1hpa1lWZ2Ivb2R0b05UVjBhMkJTbmJTdmNaVVY0bnY0UHMwSzgxenpJenY1?=
 =?utf-8?B?WEp5eHA4Q2lxYlRwRzc3Ry91ZDdXZ08wbG55bEljU3hIR0p1ejh2b0tkdmpQ?=
 =?utf-8?B?SlZvZGdLU0tzUi9XaUdNQ1Q3VVdxekZmeWo4VmZNUDR1YnRZNUNKeDZianZO?=
 =?utf-8?B?dlRIbzIraGRhWVFyand2Z01WYndaQ1NBNlVtK25hQnNZL0IyUjN3RWd1SnJa?=
 =?utf-8?B?WW4yeUo0T1kvNjFFcmZsaGkzVWlZc3E1bnpXT2tJZmVHWm93YituRkQvcUl5?=
 =?utf-8?B?eFlUeXFERlJqakNUaXJmUXN2eVJFREhlY25ETU04SEg2eEIxTitkRURuYlQ1?=
 =?utf-8?B?UDZsZEtndGZvcjROOVZPVTdJTklCb1dSV1QyZXZQMnhoR1lEWWs2cDhoZG5s?=
 =?utf-8?B?VWU5dDgwL3VIVFYyYzRmcTNKSmYrWXUweGRuOHRxQUFrQTRld0tCdVhVb1hL?=
 =?utf-8?B?ZGtUYzhwQWpHcDU4Wm4rdXJBb3RSY0QyUXE3d3A4TDkrajU1b0ZURGF0Umpt?=
 =?utf-8?B?YXl5SEJ3aWp1YXlHNExhSWd5NVg1TUIxa0ozT1A2cTcvQjM3UjV6S1BiTFVO?=
 =?utf-8?B?eXM4czEvOFhxaVdIOGRhODVVeXE3d0lDZ3orTXE4R3BPNnBUZnU5TnNUTk1a?=
 =?utf-8?B?Mkg1MC9uWFE4dysvbkdXSm9JVTFYK25jN1FvMkd5bitkZDlKb0xOc2d6OXZT?=
 =?utf-8?B?bmxBU0xWV0J1bG40SEVyR2k2NXVMRzNKSTBacXVGblpmZTNhMGdwNWsxVmg0?=
 =?utf-8?B?VmNlY3NNZ2tiWXRZa0FSZW5iKzczcDZaMWFFNEt3eG5aODZ5YTQyU29jOVY4?=
 =?utf-8?B?V0Rtc0cxVm9mOXVOUjNlYmtsK0F3K2hOT3U3VmhpclRrclJLODh1dWJseXJM?=
 =?utf-8?B?YzltYU00MHV0aVNncFdoQVVQamRpUXJQemdSY2QwbWRmNXl1WFV2Ynh3bXZI?=
 =?utf-8?B?SzBOOWRQRnFLM3FEcVVQaEpza1ZvcjNYMnZDT3dpOGRHSmowV1lydVdBdDZx?=
 =?utf-8?B?bFNDU2Vsb2tWNkZ3MDcvZmxoOXNSYkk1YlIxTE9WRDdtNzJielhPZHBDVW9w?=
 =?utf-8?B?MDhTdG9tTWpocUpoc2txUVV5ZjllUHVjYzdlV3dGeGVSSnFIUjhYbkcrQ2Yr?=
 =?utf-8?B?N0U3UE1KVHBWM24yR05SV1FSV2dJSDcrRlFHRWpQVnlkcDMwdDhFVWVxeENY?=
 =?utf-8?B?RzMzc29pcXpjOW82Z2lET2RwNVNubWFVSngwaElFUTNqUjB3bHJ1bWRBMElR?=
 =?utf-8?B?dmR4Tkw3S2sxOFlEcUFhVVFXVlZuUCtWcGw3bTBvbjdJallNQ2plNnc2dHVo?=
 =?utf-8?B?T3ZtSjVpdWlmaC85S3d0QmxjYWdjZkFBWWp4L0lPc3dFV3hLNERCS1JiRm5C?=
 =?utf-8?B?U2ZXbVZsRjVqYUt1TUlxSU9ZYnZLSlZ1VEhGenI2L3F2TnFFd2dwRWtNWmlC?=
 =?utf-8?B?TXdWUytNaWJRL2czazcrQVAwRjVDaWlHeTRsVkRrVlFXV0VzYWZwTGl6YnZN?=
 =?utf-8?B?Qy91LzlHMFJ6NHh0RFgxTjFYUzFQZStHdC9DREY2bDJsUkFKdW9jS1htS29v?=
 =?utf-8?B?eHZEM1hMTnJxa3NFZ1ZlL1ZmRlliZ1JiS1dkK1pTMXZDQjJwcmVvaUpER2RO?=
 =?utf-8?B?citqVmF3MklhRjJNSjNYVU4wTWppVnE1dTNIdFVXMFVzRVB2OHBYWUFDdFZE?=
 =?utf-8?B?b0ZJakZ2eHBMVm1QS3JjOFI0Mkp5MmtDdFdsNEFBZnJFbkFicW9BV2J0WHpU?=
 =?utf-8?B?dG16TlMydVV6ZGFsdTgvNlk0cHhsVDVGMWFHNXRxbkU1WU0rZVFJam9uSTNJ?=
 =?utf-8?Q?NQPXmgyfc8r8khZaWv555uX59Wz0nXfMBI+8U=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D146549CFD6BD4C8EC386A227365B49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	147f1d93-29ac-4d5e-682f-08dc8a040549
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bXlWbzBMWXlKWHljTEh6RnQ5NjZTQVNvL2hkMWZUMGl4dHByN09XbFhwdEVP?=
 =?utf-8?B?NW4rdnBRUlJ5TThHMEFzcU8rSWFFeUVLa0JXdGZhZVVxeUFuZWxpUHZDaTdy?=
 =?utf-8?B?aDVyUFE4ZUl1d2tTeFBjV1ZnWThXbW94anEyODFWQzJSOUc0LzJkTlBicS9i?=
 =?utf-8?B?UDE3U2szdnAyc2Mwb3RvZXB5NFI5V3NhcE94OTVSMC9iVkRNZ05xVGtvNWl4?=
 =?utf-8?B?dFpIR2VjK0xwZ3JZc3VvMms0ZVdMVkUxb2ZOTitSZElBaEQ1eHJSeHhBcFph?=
 =?utf-8?B?Z042ZVpwc0p3RXZ2OWUvemdWcHJTL3BoWisydFRVc05ZamFiR2h3VkxoMCtx?=
 =?utf-8?B?NDQ4U0pwTDZNTFBwcTdCT2pMRUZITjVyU2RlYjFrVjM0UkJUaXpYYlpyUU5w?=
 =?utf-8?B?ellLaGFxc290amxvNitQU3hGT1ZZRVhsaldPSHNXR0xrbzZLL0ZkWlYyS1cx?=
 =?utf-8?B?bFFMdmpBMFZvZWNSN08vWENNUnRIbDhmOGJPL3JUbWV0THVaYmsyZU9tbllK?=
 =?utf-8?B?VHBKWXYzK1Z6aThkckY2TnJ2OXJ4ZW9uZmkrdTB5WSt1b2d3ZUdKNVdBRnBw?=
 =?utf-8?B?UVVFUWdSZWRkWW5NbkR4NVBBcDBLdHVYNWg3aUFKZFFKekc5WTc1cHJrK3lM?=
 =?utf-8?B?UDVBTGsyWFBOM1pIaWN6MWtwOS92cW0yNDBwZnVTekdCcEVKZ1B5b212YkF6?=
 =?utf-8?B?aURWc2xzaEdMREFUL0V4aFNvK0liY216ZXFyam5QdWJxaExXVzREMUdyT2Q4?=
 =?utf-8?B?ZFlkTVBta0dwbDFSUFhXOGlHOGRFNmxMUHByUTR6ZElOcFFJZllrY3ZyM0NI?=
 =?utf-8?B?aVZnRXZDaUlQdGtOMkdqbnhxUWF1WTgyNUZmb0haZDZrL3A3MTVUTjluZERi?=
 =?utf-8?B?bTZoZXRuUzUvb2dkYkxuanpKczk0UmJCOVZjKzBkcEJSYndYdlVxc2RGalIv?=
 =?utf-8?B?WmYyYnE0WVo4aGRZOTl5U2J2ckZwZ0VocFduRjlYYVZ2SHNEd0tmNE5YRGFm?=
 =?utf-8?B?TDhYQ0VUR2J2elVoaDVxVHdmd1hRY045MnlQd2tGQ0h6d29zd1hrSmg1ak12?=
 =?utf-8?B?bzdaOXVWL1hGejdqdnl0N3BZR0tGUERUVEYya2lpMTJzaFozMkJlckJleFZK?=
 =?utf-8?B?ajVzdWVIWTdsU0JDVnAzcmpYSkovWGV3OGxwcDFWeWZtK1pYdGNEYm9qaENx?=
 =?utf-8?B?N2JmNTVyQmkxU0FYTmxzTnRFcHZEcUllSnFoLzVZUm0vZEpqUldkWHZOYzJC?=
 =?utf-8?B?UVZXT2dkS1MxK0xkbmtLRlJ2bzdPaGVwQlYrVnRxaHJydlk4a3I4c3pDOWJL?=
 =?utf-8?B?M1p5SVJQVDd3OU82TDlLeTQxdTUwallFWXorTlRkSlVscWtkb1VxMHBXVkdk?=
 =?utf-8?B?ME5ZNkdHL1pIRm9FTGUyTUd5UytmdENRN0d0dmNmaWIwZW5hcGljZ0VKa1Vm?=
 =?utf-8?B?eERHVXF4MEx0azRxZ3JJRFVDVzNTeVVvK2ZYVVFpM2dxMWkwamhiUU5MVFY5?=
 =?utf-8?B?TFFCMHNGc3U1WTZPakhlcGkrN3VNbm5UbTVnbHA1UVdLck1HaFRqMEpUWm8v?=
 =?utf-8?B?VCtzUnlDVFhOMGE4TWs5bEVYV2RKd29wSEZLdWk1SFdQa2tyMnN4dzBPTm1E?=
 =?utf-8?B?bFdxSjdSb3E3Nmp4OGlNa0JWNUtJR3RBZnBoOHcraWg0NWZUb2tIcHRrTFg5?=
 =?utf-8?B?SnlFOWNYMnJieis2djdqY05jTzE3VFhBQ1JBSTB0VWNVQ1NxZGJnYWl6bXlK?=
 =?utf-8?B?bWpoRStLdkUwR1d4eFU5d1lXeUtySDBwY044R1psK1NsdUkrenJiKzRySzVo?=
 =?utf-8?B?MGZzdEpXb2FKeEUvcjhZRzRHTlhQd1dGcHpyZVRieHhlQUdiOWJpclZWMElP?=
 =?utf-8?B?WC9RVWg3S2FXSHhwWXpkU2VpSkdBVVZMMCtSVElDd05lOWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:48:38.0788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db539e9-d8ce-4a00-d0cf-08dc8a040ce7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200505

T24gNiBKdW4gMjAyNCwgYXQgMjE6NDgsIExpdml1cyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8ZWd5c3plcmVneT1mcmVlbWFpbC5odUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IEZyb206IEJlbmphbWluIFN6xZFrZSA8ZWd5c3plcmVneUBmcmVlbWFpbC5odT4NCj4g
DQo+IFJlc3RvcmUgdG8gdXNlIGNoZWNraW5nIGluaGVyaXRlZCBrZXJuZWwgY2xhc3MsIGJlY2F1
c2UgaXQgcG9zc2libGUNCj4gdGhhdCBzb21lIEJTUCdzIGxpbnV4IGtlcm5lbCByZWNpcGUgKGxp
a2UgbGludXgtZnNsYyBpbiBtZXRhLWZyZWVzY2FsZSkNCj4gY2hhbmdlIHNvdXJjZSBkaXIgdG8g
UyA9ICIke1dPUktESVJ9L2dpdCIgc3ltYm9saWMgbGluayBhbmQgaW4gdGhpcw0KPiBjYXNlIHdv
cmstc2hhcmVkIGNoZWNraW5nIGlzIGZhaWxlZCBmb3Iga2VybmVsIHJlY2lwZS4NCg0KSWYgUyBp
cyAkV09SS0RJUi9naXQsIGlzIGl0IHN0aWxsIGEgc2hhcmVkIHdvcmsgZGlyZWN0b3J5IHRob3Vn
aD8gIENhbiB5b3UgZXhwbGFpbiBmdXJ0aGVyIHdoYXQgdGhlIGZhaWx1cmUgY2FzZSBpcyBhbmQg
d2hhdCB0aGUgc29sdXRpb24gaXMgcGxlYXNlLg0KDQpSb3Nz

