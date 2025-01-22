Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FA8C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 13:42:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.2])
 by mx.groups.io with SMTP id smtpd.web10.43684.1737553358234781940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 05:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T1TURroA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T1TURroA;
 spf=pass (domain: arm.com, ip: 40.107.162.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A5sbsAIVTdOv3a3SN+zIVUJ/dseQ4b+HR67YE9gj4LLKw+Go/kGaVGPqBNE26zmcsjoqaXtM7oDtXUPyEFjz0ndxfIZ4AwMIfNEWCJp7U2ntDsfcNr4LiErlW3lE4TEUIbXEItgIXVimvldoqz8rb9BPVFfE6keoZfmlkfCD5ooeqI3NpLpGsH5fPsuT1BEvNtPwmjM+kJ6S3CMttEhSXZPfTIkckBx/281t5PcXj4xDfI+C9yU3eFFG1xbkDvJ7F9HzctQYUgIlyKKFHWDPGDa5KsFoXVWkVc/4Tf8XPGQ2ZIr5Z2p/WsEYd6qcdE4+4AUVyYuKAnFWdSmVgWvHdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vexKS2MtZ1Xdq1nEJuOzzEOUD+3DszAwuCU+CHBtah8=;
 b=njcBOdah7YmeYefJKk1khYo4VBpI3nSe6RM7ohd8MuPhexxSO28UrRw68tSmD0Xwq42imnGtvAOrPrKU20sZJLK6aC9MmBdxBH9QzGnuTNQPCxtXAtsUZT/SHsX/jEKJDV1sgpqSe+MuHLXzpC/ady7VaH/dvKl762CMrGFp3B25hxXcCmLp5NWid3JmP3h7vHLNonjciF/SK5OpRr52PcUi6tNHpi/ZJ2WH+8sNY/jxaxM+pMvQ59jUChkJX4kErtyA35cjvC+e2pazO+dGyqXID93oKeTBvJuhO3o8LjGA3ggrDlbH16K0RZ+qToTzmBrmD4CH/OV+luXuQF20TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vexKS2MtZ1Xdq1nEJuOzzEOUD+3DszAwuCU+CHBtah8=;
 b=T1TURroA1NKiC8a3kgah2+CVdG/TrNczyQ63tQvWqkTkqC7a9s0VXPKh0shR8iDeDwg2UW4ij1699lFhll9EDbF1U7vYCtKRrZScPFaoHa9vZru/tLfForVCOw8sN4nzlZTDMOMLM8gIiYeMzTmfpMXGxexXn6x+QiwY+wEDH7g=
Received: from AM0P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::38)
 by AS8PR08MB6552.eurprd08.prod.outlook.com (2603:10a6:20b:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 13:42:34 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::70) by AM0P190CA0028.outlook.office365.com
 (2603:10a6:208:190::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 13:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Wed, 22 Jan 2025 13:42:33 +0000
Received: ("Tessian outbound ad07758b3bb4:v543"); Wed, 22 Jan 2025 13:42:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 351e3c9585e01aba
X-TessianGatewayMetadata: DnvL3jx5sQdjH5X7wUUUrhyAwuw2EITHuPJxzR3dNhYZIHW7ifPtAOrilxiWyF5NynZ26zmB9cuk6AjIOAtcwFp7bGO3DjNQdcELD4YnzrcaXCcHCVnXlo3WOMtQrWKoBafTR/HdTeFIhli4h/T7QevW399iFUr1rYPK39Sf4M0=
X-CR-MTA-TID: 64aa7808
Received: from L704acd1e05a1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 64B366F9-017E-4B96-8059-87072EC1B17E.1;
	Wed, 22 Jan 2025 13:42:27 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L704acd1e05a1.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 22 Jan 2025 13:42:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzGZBQ8EoHC8TgK30s8vZm3yMR8uRCWBHTGV7P8q634IPgPi9yfG7dHPYs0Qhd7WJ1/9XrQnrC0nCiA6t2NynJcKnIGQtiPppOhTSJR4864igVf9HYwyyU2QDURwMgXk7EANaB22gbaEtVV5InOl93JckvfYKk21e5LBcOEXPAWEEhuIdcUdEmjUHcl+XNR7Z3fbXVMCMeOl72B7/zOJwI4GxVn/VhY2A0iCwRG+y6R+kkszfZSP2qs2w7i4vW2NwNR7WJzjJo3PrR6T15NZWiInIzgwkc63IUNYmnP2hoGYZtVOyURZlyG1MRHIKN3p9mhBlP9PXHVvDNEW8VWMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vexKS2MtZ1Xdq1nEJuOzzEOUD+3DszAwuCU+CHBtah8=;
 b=e3svJCBjzVp4CbnX7FiElZn1R+0Kk0ZexcDNNDEcGHKTJtcLjagJ9rH3NoFdxgQGypc6SgLeL0/q47np5rsYpAx0TLGmI/PTEQFpkWOavdqKl+sC4rc11mjLJoCHaZY5TXX25+jBkBO+nBEJzqYW/UqoHYV5/58oo8zT1gG8ySQvQzlMFO/0/wsVEK15FpolglI+QAOEsh3ni6x44VFzx5Iy6oQoTNezOOZXbIEj1cxDXvZiaD3Yo3JwGEP2ki/s0GI4pshR1qREEQv9C7BpvRqmYluBzygd2ExkStuULtj0mjmnkvzDMT3vIiGjc1YlzntViwfex/KLuFgrZcp/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vexKS2MtZ1Xdq1nEJuOzzEOUD+3DszAwuCU+CHBtah8=;
 b=T1TURroA1NKiC8a3kgah2+CVdG/TrNczyQ63tQvWqkTkqC7a9s0VXPKh0shR8iDeDwg2UW4ij1699lFhll9EDbF1U7vYCtKRrZScPFaoHa9vZru/tLfForVCOw8sN4nzlZTDMOMLM8gIiYeMzTmfpMXGxexXn6x+QiwY+wEDH7g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10348.eurprd08.prod.outlook.com (2603:10a6:20b:57c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 13:42:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 13:42:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pmi183@gmail.com" <pmi183@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pedro Ferreira
	<Pedro.Silva.Ferreira@criticaltechworks.com>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
Thread-Topic: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
Thread-Index: AQHbZ2Kgl5nB71cLpECjkOi/TQ7x3bMi2CAA
Date: Wed, 22 Jan 2025 13:42:26 +0000
Message-ID: <FA6EADF9-7198-4DF2-8417-1FB6BFA24BDA@arm.com>
References: <20250115153149.1827119-1-pmi183@gmail.com>
In-Reply-To: <20250115153149.1827119-1-pmi183@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10348:EE_|AM3PEPF00009BA1:EE_|AS8PR08MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: e130b67f-3296-4dbc-92b1-08dd3aeaa013
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QzdxZ2M2SW4rejVSV3orcWJvVGMyekJXWG5pRkc0VXEwUUcyZ3RXWm4wRi9G?=
 =?utf-8?B?RmF5TmFOaFdONHVlZjB3TWJnSDNCV1Q2Ym0rQ1VZbldCM2svODJzMlY1VHNk?=
 =?utf-8?B?TWoyUHlnL0dWNjVOd3F4d3d4RWZEZ0kvZWhuSkplT1IrSUxLOW5ZOVZvdzNy?=
 =?utf-8?B?OG1xWHNRN3J5OVl5MmF1b0lNbHllSFNsMmIrY2Fpa3hWbmVGNzlseE9XSUs3?=
 =?utf-8?B?UEtJeG5nZVJ2ZDUySU8xMUJyVnhhYzlSSlNBL2tyOG9KOE1YaVZCalhqRmRK?=
 =?utf-8?B?V2xtV0xycUNGZ2VBbnRUL0p1Uy9zRzNvL01BcXBBYVFTZkhiZWVvY2hOendG?=
 =?utf-8?B?bmphd0Y0RDNzTFVWcmdNSWVLVFJZTUZCeElzakYyeUltK2M2TmdqdWdFaS9a?=
 =?utf-8?B?VUQrRzZ4WUdnbVEzMEFKQWliZUw2ZWdWVS9ocEtmQi9jWWtLVTdoS1hhRjhB?=
 =?utf-8?B?c25SOHNZcnM4YW1LcTgrcTZqWXZBSkhZUkNwRmtVbFZyTWVYQ29iZ0dpSzNr?=
 =?utf-8?B?L0ZPcHhaR3FzTGZGNXA1WWEwdDFGWHBHY1VoeHlLRFVoUHBaUUxqZUxDTzNP?=
 =?utf-8?B?SGszREhQVmtyMUs1UUU4Z3lZYmFUeUs1RkxpWUh3VmprNmtHK1JabW1XaXU5?=
 =?utf-8?B?L1RHT01KNkdQRkNwOVZBRmlTck9TYk1XNTlUbmNiRENBOXllZDdBZXBVNTFW?=
 =?utf-8?B?ZEhxNnFpY20yUTdkTURVY21ISkU5WTkzYjBDWkNrdmNCcUdROGpNRktRcVZp?=
 =?utf-8?B?bUJsT2hYOXdpbHk5ME14RWY3UVFBWURHOGVISXlZcUNXS0hZcUhySDNIRXh6?=
 =?utf-8?B?YS9pNXZrbHBrSUt5cXk5Rmc0YVlPbzJncysvRXFXOEwrNVo4UzRsUDAvNWg3?=
 =?utf-8?B?TkVFNmpJcE92R1VXekQ4Q3BoZWRudzc4cFp0bS93dVQ1YkEzTENYeVdxdmlQ?=
 =?utf-8?B?dSt6VFJRMVNlOG1Gb1l1bnZGemhiblg2ZDduR1BHN3pDK0NTOTJrdk9rSWFo?=
 =?utf-8?B?djZhRmcyUjBCWllBdk41TWk0T2Z4MnlZei8vQXFGYjdjSXc4QXVwdzNFTlRX?=
 =?utf-8?B?Qm5xRnVFT0FBS1NWdy9JVXlDQXU1QTNRajZ1YXdtanJVUFRveUE0TXhOT2NX?=
 =?utf-8?B?YzNCN2RTRUxtVVJ5WVdTSlRHWHA2ZHp6TlhTT3h0elRzVGFpQVFOcW84MnZR?=
 =?utf-8?B?NnpJYy9nMlc5KzJtSGIvYm5vTUNwOHplV1NuU0lQNTgraUJjNG14bmsrNEQ3?=
 =?utf-8?B?SGljaHRsQWt1SGZrTVZQWWVJTElPQlllOW83OHk0YndzWFpxc281cVZobHUz?=
 =?utf-8?B?WmxYcjRHdU9MSFBQSzJXVkJGdnBWT1FKcFBxdXExL3RwNSt4N3BkZW5HNCsv?=
 =?utf-8?B?UExKQjJMZi9FMEpSMHlublpsNjAxLzJ1MkQ3VEkyWGR0YmM0L3BSN0JpaTlR?=
 =?utf-8?B?RHBCNzlxckRDYTNPVkJVMitHOEdLTlZNU1NvdUVSMllNT0FxeUw1Y3dLKzZC?=
 =?utf-8?B?emFlYWF2MmIzMjRBWm90VEp1cXRycjFCenVFZDJkNkpOSzlmdXZXSTlxeFBT?=
 =?utf-8?B?QnJxNmp3dkp5M05ycWlHU0V4dmhZN3pUR2NDSDhxcHNZc2xQbXYrY2Rqaksr?=
 =?utf-8?B?TDVBNGgvdWN0eFFRS00wUzlPMEduKzQ5bzd2QkZ4dG44bEJSSkgyeVdnQ3RO?=
 =?utf-8?B?YWtMR25qUXZvV3VmRno3NnlQb29pQm9YQVgxZXd3eHR3azVWYWpqZnBZdmty?=
 =?utf-8?B?K0d1dWlyMFh0OVZzMjI1ckVOdkJOdGNLYVVrVWQ4UG1KcVQ2Tm5haEtPZzhx?=
 =?utf-8?B?dnMvRzhxY3pOczErSEExcXczeEdBZW9Zby92VmNydVNjSWcrNUdTSEZRelZ1?=
 =?utf-8?B?eTAyRVBUYm12UXJ4S3l6RXA2MGk0YmMyWDVvamd4RjdYaEdEc1lWcDVWR29D?=
 =?utf-8?Q?WueCVPMUuot9vJbH3GlbS2hEW12IAVyw?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <859D4E570D3E744D800603A8C6F6E159@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10348
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b0bd65f4-8294-4d8b-b4f5-08dd3aea9bc1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjlweUFwcWVjSjVacFZvaldBNHd5Y0pQTWhwZ0ZXVmQ5cE9pN3BaTThURzFS?=
 =?utf-8?B?S2FRS0pLYzhNRjhhbVlsN3JqMzJvbjExSXF6OWMvMEg4dDdaa3NydGVveU5U?=
 =?utf-8?B?Z2xPT2xBOVFLSEJyNE1YZ2RBMGsvU0psSXc1YjR5N21oZE0wYjhWRFhyZWFO?=
 =?utf-8?B?REpteWlrQmxBcVJpdDg3Q1hrWVB5a1hNbVI0S05PMXB1b1NzY0ZjdkR5WHlp?=
 =?utf-8?B?Q1g3Zk14NEhRWDZnRXovc1EzdkVKU3BxL2xteHRRTXBFTUJmUHZyb1dCS2V5?=
 =?utf-8?B?eFZVeFROa08rUWlVb1hTa2lxamVWZlVSQjFlejlzY0tCMHMzMXBtZXo0SGlq?=
 =?utf-8?B?NE44T09CYUZERVNQOEZFRVlKdlh0UkRXQ3Npa3dZUkRzdGNzaXRkbFV0QndH?=
 =?utf-8?B?RzAwQnArcDZjd0ZnK2QvRFk3S0FkTmNQQS9SaXhYdldIZ0UvT3BvNmIvOGQx?=
 =?utf-8?B?am5MK3JaLzRubXJzMUhiN3lsMnN1TEZKa29EdUpOV1lIcEpNRWlWMDM4eXlz?=
 =?utf-8?B?Tk5sM2xLWTl3RjRNNnNla29BTCs4bU1tM3RqcnZ6VC93cHQzZkNXblVpcmdY?=
 =?utf-8?B?cFJ2M1orSXloclZXSzgvWVM2T0k2dzl1Y3V4clV2U2JtNko2amhJSjZMbTBO?=
 =?utf-8?B?VDBPNGU0dEJoaWd5cHB1V2phL1BlM21Zc3MwTitCZzRZOUQrR2w2QTA2MlAz?=
 =?utf-8?B?R3lFVHNqNnNHdHhJcDR1YXJVcWw1QkRwK1hxNWg3K0lybnNjVHU3aWZpNTE1?=
 =?utf-8?B?emg3TEpSSm5ldzh3bDhMQzJxSXhLekR4MHd5WFJNRmJwMXl0enR1b3haSTVH?=
 =?utf-8?B?QXpiVnpEWXcrRkdzRGhnMHlVSTBCNmV2K2tZSW1BbDJWQm9pdFJhUmtHSWpi?=
 =?utf-8?B?akVuZ1ZWaFNwR0NET2NMMDk3Y2ZYSVU0OHN2SSs0YXUvRm5TZHd2K0Z6T293?=
 =?utf-8?B?OXlkRXU4SmpDZXhEUU1FdlNScFBqbW9DbnNQdHZDUDY0OEw3eGFjKzNlY0h1?=
 =?utf-8?B?SlNKeVpFVDI2dXIzYjBTQVpJRUJVR00xK0ZvYVd1L1JIRU15QWtiUHBrSnJT?=
 =?utf-8?B?OGRxZEtSMDZJelVva08zbWl2WkNQSGxMb0VVU3JhNklCSUxzRXNJbXliYmRK?=
 =?utf-8?B?SnJSM3BWVXpZR1NyQmo3KzFXVmFSenJNcjNTVTVWNFg3OWpobk5UUnRueHJt?=
 =?utf-8?B?blRucm0yWTJ2V3ZOejlBekNiYytxSVFiMzFjcmFiQmwzbmhtSzBSb2MrSHdE?=
 =?utf-8?B?RTZrcDY3QWNWeEZoS3JHYnoyQkJrUndLaHl3L2VDYUlHQ2Rka3ZkWVk0RkRl?=
 =?utf-8?B?WjB2NWFhQkNnbXVxMHdMNU5nLzdGdjUwS1VVTjVzZURuN0liRlJLeTc0OTNV?=
 =?utf-8?B?S3c2UGZKL25zS1dVYjlmUjZTdXZnekdjeCtOaXdTV0JEb3F4ZTgxTnNxb28r?=
 =?utf-8?B?ZnI1bFB5dHg1b1hCT0Iwak5xbkxad2szbXdVZ2kwRzZyUDdvZjJOSnc5UWhB?=
 =?utf-8?B?Q2dhREdvOHBSSjB0OWdreW5mSjZGOU9NYloya3lhNVc3U3BUZzFjMlNkSkNx?=
 =?utf-8?B?TEMxUWtLVEZGREwxa1hOSWdUSU16Y251UWNhVFl6cU5CRWJPUXB2c2Z2aXc3?=
 =?utf-8?B?bjhFbGRyeWxxcXdXd2o1RDZOVWs4TmdrSzZSSXZuWXNnYnVsdDFBNUQ1QThz?=
 =?utf-8?B?Y2FGd0g1dFZHYWRabytTU0dKU1BoVXNTTUhXK0NiZk1kalhldGxrak5DU3c5?=
 =?utf-8?B?MlhIN01ZNUtXMDVTU3U1d2VFbGhyM214Vi9LZW55QWJnaWpBRnlSUjBLNWdE?=
 =?utf-8?B?N0g1U1kvcEsxSmFKMmxJdHVGd2Q1Q0wrRFcxclM5T3Q1MzVFOXp4Z3QzQ2Nq?=
 =?utf-8?B?QktGeG5UVnQvalBiZ3pDdmV5UTNlaWtuVjNza25XV0I0VytLaG9LSnNzZmRE?=
 =?utf-8?B?c1AxZXlxQnlLUDlXZzZFdUtnK0c3SSt1SUh2UVFheG50RWM1dHdIYlVOS2ty?=
 =?utf-8?Q?Ovc1CWkoPycgyV15vVOTOQr/tRrW1Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:42:33.8405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e130b67f-3296-4dbc-92b1-08dd3aeaa013
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6552
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 13:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210153

SGkgUGVkcm8sDQoNCj4gT24gMTUgSmFuIDIwMjUsIGF0IDE1OjMxLCBQZWRybyBGZXJyZWlyYSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cG1pMTgzPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IFBlZHJvIEZlcnJlaXJhIDxQZWRyby5TaWx2
YS5GZXJyZWlyYUBjcml0aWNhbHRlY2h3b3Jrcy5jb20+DQo+IA0KPiBPbiBlYWNoIGJ1aWxkIHVz
aW5nIHNzdGF0ZS1jYWNoZSwgYnVpbGRoaXN0b3J5IHdpbGwgbW92ZQ0KPiBjb250ZW50IHRvIGEg
dGVtcG9yYXJ5IGZvbGRlciBuYW1lZCBgb2xkYC4NCj4gV2hlbiBidWlsZGhpc3RvcnkgbG9va3Mg
Zm9yIHRoZSBtYWluIGRpciwgaXQgd29udCBmaW5kIGl0DQo+IGFuZCBlbmRzIHVwIGNyZWF0aW5n
IGl0Lg0KPiBBcyBhIGNvbnNlcXVlbmNlIGhvdyBjb2RlIGlzIHN0cnVjdHVyZWQgd29udCByZXN0
b3JlIGFueQ0KPiBwcmVzZXJ2ZWQgZmlsZS4NCj4gDQo+IENvZGUgYmxvY2sgbW92ZWQgdG8gZW5z
dXJlIGlmIG9sZCBkaXIgZXhpc3RzLCBpdCB3aWxsDQo+IGF0dGVtcHQgdG8gcmVzdG9yZSB0aG9z
ZSBmaWxlcyBtYXJrZWQgdG8gcHJlc2VydmUuDQoNCkRvIHlvdSBoYXZlIGEgcmVwcm9kdWNlciBm
b3IgdGhpcyBiZWhhdmlvdXI/ICBBcyB5b3UgaGF2ZSBzZWVuIHRoZSBidWlsZGhpc3RvcnkgZmls
ZSBtYW5hZ2VtZW50IGlzbuKAmXQgdHJpdmlhbCBhbmQgd2XigJlkIGxpa2UgdG8gdW5kZXJzdGFu
ZCB0aGUgZmFpbHVyZSBiZXR0ZXIuDQoNCkNoZWVycywNClJvc3M=

