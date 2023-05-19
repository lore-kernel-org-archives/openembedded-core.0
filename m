Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6A6C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:11:59 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.45])
 by mx.groups.io with SMTP id smtpd.web10.30646.1684512715044598713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 09:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=H7EbesmE;
 spf=pass (domain: arm.com, ip: 40.107.13.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwPvMAQdG6DBKroUULxpC8QcxlFoOE8aLrm0QagK+AM=;
 b=H7EbesmEl5/sFLm/sSDDTQAJtEcYrBzmISgRXzOEiaEB/xcZ6GZl7IhPHHaf8vQudyqVUCYg9gesxosqFYZBCbIhH79PF2KxKPMtn91TxWec+GH9k5mwFxwWymrqDuJhuVNhpfkO1njwIwztQb6VbuM2ZKrr3Q8/aQ/iHmStjDs=
Received: from AS9PR05CA0109.eurprd05.prod.outlook.com (2603:10a6:20b:498::13)
 by DBBPR08MB5948.eurprd08.prod.outlook.com (2603:10a6:10:202::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 16:11:51 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:498:cafe::8c) by AS9PR05CA0109.outlook.office365.com
 (2603:10a6:20b:498::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 16:11:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 16:11:51 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Fri, 19 May 2023 16:11:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed65ac0f4649693a
X-CR-MTA-TID: 64aa7808
Received: from 7d3c078b07b1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 83F7DE20-BF71-45C8-8A2C-91CB0FA2399C.1;
	Fri, 19 May 2023 16:11:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d3c078b07b1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 May 2023 16:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU4tta33UVtTe/dWXAhk2nfIfQvixEZARkA7LHUWWO2+R1n7QMC9oQgLRUHeyT8tAB7qLdHnAevNwoPc+qAVLBeglIdDKT6XygIUIYCxdQWrQIvJvPpSMQ0nqyCdlFUzDVA6ymHQ39epTNY3hjZA671/gvZ96F+OU1Y7PUVNFG+k+rtpjpCTHanKlAbM5W27qKeYyDmnze9AJzlrY8AfrPrzn8d087IzNppjJo/CmiU5mPiON9s8SSMMk17QJVljs/d0SKwweMgnR2JK050sdhI6Cwdc0k7FexRNlbskJXVZLF4cH+MM2ijbtCjsd20tfSxITbLBQhjidUKSpqZUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwPvMAQdG6DBKroUULxpC8QcxlFoOE8aLrm0QagK+AM=;
 b=GbVPJB7xgAcSRwIW+mJArBXuI6xEgZU7EOCUuMnZPalivbBKN3wpuYKyW18dFG8IZroKGqOaD06h3A/NDSUw9AGBfEmJkju4jYXLWvTQ6s++PWMDHy1Zp8LsyihYXVOClLryXmpV8J8NMZNcjfY3CiYKnPzEjcpMywd0Iob2SCTWM2nUvJOC6/Eu4PMd/uLEZMNDypO/l58u7BFlB4rXSMSH3r300Rb8bXVToAgKxBvoT8Pgto+cq5AijMb26v3nu032ny+s7VZG5n6PKAqHb2ena6AEjSbrdDViFxPrDFd9uW8sfJ87OhIsIUvPlqF5r+gV1aKHQX+r5lnbLESbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwPvMAQdG6DBKroUULxpC8QcxlFoOE8aLrm0QagK+AM=;
 b=H7EbesmEl5/sFLm/sSDDTQAJtEcYrBzmISgRXzOEiaEB/xcZ6GZl7IhPHHaf8vQudyqVUCYg9gesxosqFYZBCbIhH79PF2KxKPMtn91TxWec+GH9k5mwFxwWymrqDuJhuVNhpfkO1njwIwztQb6VbuM2ZKrr3Q8/aQ/iHmStjDs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 16:11:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:11:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] widevine + arm64
Thread-Topic: [OE-core] widevine + arm64
Thread-Index: AQHZimpQV99sOTXrVUOep1vIu1++369hxFIA
Date: Fri, 19 May 2023 16:11:43 +0000
Message-ID: <58944969-2D66-415F-95C7-ECAEDFF46167@arm.com>
References: <IJXWUR.OUXJ6LSOIO482@t-online.de>
In-Reply-To: <IJXWUR.OUXJ6LSOIO482@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6399:EE_|AM7EUR03FT045:EE_|DBBPR08MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fe1bec-e42a-4d87-ab13-08db5883c172
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iz3jds7idgdm+SQuimPrNmkDj4kp7VbsDUvDN7U3JhO6Pm/8chMVtweO61a8VIXx60re3FWIf3+rDEm1TfmIIZ/36dSRsMSkY5WAfURVlE3HPOVTelufHFQw5oVQHxz1h0NCCCJZPZfsXTzzO8fLC0xdQLkjavN0h575060aAzasyRa7hiVrcP2vfiHCpeRNWK5yyjDOd7AIdkd9EUHVtaDNNKFU/+WH6lCRAViX9aCE53xH7APqNRuSHj0jl2QT8K46DruZN1VDdrZLO86ZX3PhwJIdLT3ELUgYubtDjCrvYwRaZsLbMM0wJlqr/LJJL8XxmfwatVe+L2LPZdYlFoL7VkCiYiDy0DjzYFNCR+5qdiuMx5slbxGEat5WnovNIwDbDmxBevHi6feKfQlGAtFPSr40E/GFdxf/AB9bqWyLdumpbgFqb3ejrRTOaIEcosjwZAn+rCrmYAomdFsiVvKsb/elxuA32Z4r+I7qDrl6BZrOPQyQ3BHZ1xO8yKs3jvBZxDGRavyGmlsny+TU8w5/MntL+ZsniWfCcw6YuUpkpzWvfMSCWP+1vG5OYod78davuNTeD8fyQaobwQ4XLKNRUQl6lzZbxbXdpRrGsIP9ysfNNv5AsGfvSZ4pPvBybtdmG8imVRkOBjRlMXdoMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(26005)(6512007)(186003)(6506007)(2616005)(66476007)(53546011)(5660300002)(91956017)(76116006)(66446008)(8936002)(316002)(8676002)(66946007)(64756008)(41300700001)(66556008)(71200400001)(110136005)(6486002)(2906002)(558084003)(86362001)(36756003)(33656002)(478600001)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7D8B43FB9154F4E8E26DB80D13B8E0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6399
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	748a7812-b376-494c-4f8e-08db5883bccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qCMVhx/+QYX4i8qiyO2TnPYdVPiFmW6jOmw9LZzXliSHAvbFNIf9yLcqNpJk/DexBTiS/Qx8zUwfUF7Wikqx2yj2XVjDPIbWk0a4fVMLsh+zFbrZfgCNkSFqs1/Xo+NDxHk+Ew0dTSA9QZXJKoc/YfwSUiRlsllRRMnUzVJVS/jFh84wCzmcFLedVovyVXXp8umdqpiACmJpfhKC2KmXweeJIDaic/yuVZgt1qR9uiNTLbFdcukxLwKmFoqKlU2fj6TJW/qxj6s+V7aeF24JZFAFmHxk4kf/0mAMVLkGWqlxnhCnwqsbNKJWQIrccR0jsIDcB++5Fuz0FVS8n27OOGLSEhbKln43lLQFpt6i0bcBxtwrRK5dPNVV+q+jocrXQpUwOcAkbVM6Bdyow0TVhbFb22fpT8OrfSFE8/ZtW2y3vNNo84Hy+7CJ0Q8DPB05bfQ3p/+MLRg0fEWD13vETSh8eaplHKafvKuP19XgFCUfYi6DsSM7gLZdPiYKonzkQdmm/oMCXpMcpEdX1AAelj/HBLyo37dBp6e6JZadenvaG+r447UKDyj35cEgGz7XTToVkyENAYYPGRCH1mxaI9YKoNeysDgfrp/upxsNEDf49qx1Bod3pbDKHFfARoKCXKP7FP1hDfyJpQLjUohU8nwyGmFbGK9lFiWdr12JqcRI0BDWhmEPNGIdQv+QoQERJlTtg8gBcnUCV4oEPDR7XshbcAXQF7W4+4KgUpCQVUA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(70206006)(70586007)(4744005)(2906002)(8936002)(8676002)(5660300002)(316002)(41300700001)(86362001)(2616005)(47076005)(110136005)(40460700003)(478600001)(36756003)(6486002)(40480700001)(6512007)(6506007)(26005)(186003)(336012)(33656002)(53546011)(36860700001)(83380400001)(82310400005)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 16:11:51.1909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fe1bec-e42a-4d87-ab13-08db5883c172
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 16:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181561

T24gMTkgTWF5IDIwMjMsIGF0IDE2OjU0LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyB0byB3b3JrIG9uIHJhc3BiZXJyeXBpNC02NC4gSXMgdGhp
cyBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgc3VwcG9ydGVkIGluIG9lLWNvcmUgb3Igc2hvdWxk
IGl0IGJlIGFkZGVkIHZpYSBiYmFwcGVuZD8NCg0KVGhhdOKAmXMgcHJldHR5IHVnbHkuIDopDQoN
CknigJltIG5vdCBzdXJlIEnigJlkIHdhbnQgdG8gY2FycnkgYSBwYXRjaCBsaWtlIHRoYXQgaW4g
Y29yZSwgbm8uDQoNClJvc3MNCg0K

