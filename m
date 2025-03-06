Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D00C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 11:51:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.70])
 by mx.groups.io with SMTP id smtpd.web11.11137.1741261869988651169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 03:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LBAZxpx0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LBAZxpx0;
 spf=pass (domain: arm.com, ip: 40.107.22.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lJmb0NZGra60CaH2RGAkaWsTszuMDSYe03DsQ1ceQMnnYKIUbcg/VNxnU+IYBDjqS8eB6uPdaGGwUhYJ3ynHKiSbQyCdpRLNghMXDOt+SBFD2/n3pTphUsYQPsV8LgaywBfx+q5xnGQyuAYuGQkeqh6DNhxfHhr1G+YqeiuSdA9T020xyNY6q0BDwzN1Ehr3wtrivi2tosL0ZY+bZEnVooFTu8QWP6mw7Z1utxtyTyfoKSrtCS6TfyrZ0PUPnTNvmE/4Dt761gsIWjpVRdMS9QEDwhOBn8gCPW9ShYTHzuQ7hySKXxLCgA186ZDItlICXFa92r+ZUL0C9QCCVH4Nmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLIn7/Bb3fyN/HyVq2KOI4ly+89gmBkwuUstdkDvoKo=;
 b=SoMs1REgTej8STD2G0zqCO2jHnlK3eHW4AZHBI+eEMe5zWv+mva/4zsjBrtD96zS0/YFdwG1APGJ/8weMXsr/8OEtavp8u7ccG0UQshJUughop1X00fenxDkpmW2NvQeoMjEwszvgdPVRpEV2qdPl6cBuQ/YXdXypbbVgHa/suyHkL2+ZBYw99JTThAb+zdg10uHq5z7Lq4V+inj+PvvdU70hUvD1e+FXXRIdugJp/Ai8OmUkosACbTow/VoiMefjLT+MZ0qNSn8ZiLtfozYikgk+3vbLsDWo7oH2X2pMcSt/7riwaJbPOGaGOIv9r9tIGLJ1HkbJefh8xlq56fbGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLIn7/Bb3fyN/HyVq2KOI4ly+89gmBkwuUstdkDvoKo=;
 b=LBAZxpx0TDRDD44+9gTnJLPABGl5b8voLbh/1HGfhL5nAk7tkmkGJVv0KzhPhkKz1qJHI7znjPhwPzsnkbH0i8Ob1gg3NTurvXN71w/Is4lohZA8RZlfdrTOwZeHLy5uGwO2nHR2uR8SZt/AAFNI5IpG7jOI++JVHMLFU1LNfcU=
Received: from DU2PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:3b::31)
 by DU0PR08MB9299.eurprd08.prod.outlook.com (2603:10a6:10:41e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 11:51:02 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::39) by DU2PR04CA0026.outlook.office365.com
 (2603:10a6:10:3b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Thu,
 6 Mar 2025 11:51:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Thu, 6 Mar 2025 11:51:02 +0000
Received: ("Tessian outbound a60532193129:v585"); Thu, 06 Mar 2025 11:51:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e97922d35a04cfd3
X-TessianGatewayMetadata: 2ebPw7fYo1XMQjwA5+BpLf/VrewZONRSD9Wbu4+7T1nnndZnywTp1RdPOO2mF/mcc80VqjKuUrVDhHTXZwurV+B4SQHa+ZDH77dpX0Y7S9ggBoMXKipnXbUg9Qyugvdv3OE8jodcEaDHSojyKaccAkB8GrAnQRWbiWy1OvBeG3Q=
X-CR-MTA-TID: 64aa7808
Received: from Lda5a1055334d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 76C6B0C7-588E-460B-82BA-BA9237365A4D.1;
	Thu, 06 Mar 2025 11:50:55 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lda5a1055334d.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 06 Mar 2025 11:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOPx0HfS16ANl/FsbvaSr7iDwytX93YJSbaRXafhFNgn1wsr10JOfqTWZURL5MsGgWBP2EtJpkzEg5R0eXmMROPkuUBBgoLcr6fyLy8yj/Y/cDd2RHDDQo7CQ8oo4ZENVhH5KHF2LMKejrjiAuTL9oT6xNSDVVDY4zvLtDYcVgi1n4x8MqzE8KWgarePRyXdN8/OxGOVBzfAg7enRHnrhPDvOAtD5hPrnSsOTBRJ+hIqfgGw2pQ8x2T8qXxgK4cT+y4X7dHsyvSlWNAidd8drjI9m4mkdFvSSthJJxYegt9c4SkqwzQ3eidfD8nVoOJbf9pTSJvMdaAQMIP0t1mHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLIn7/Bb3fyN/HyVq2KOI4ly+89gmBkwuUstdkDvoKo=;
 b=Yf0DsH0/a30vD+6vLXSTIqNNVS891yFH2UzunEmyYEib5db5KdOo+Ml2qfbjci0GodaB36g8+7bRRtRQ296lCJbahMqJTf1xjb9l7PROThoYRe+r5yXhWMLR26ot+LqZzY3cGqfKpFpeRXOSkSxyzJifi+x4ddoZ8rRkLas8A4p2P9hQUkjECWjFPIl5XZ20oftdfEKEpCtaIa0uMmOkNbOPKwtG2j+GbfqK+2UYwnEgePWG5nh1K0iOlg3VCQPwuXhX16M5VSIwsYZgzp2ncBZQc7uqawSuWY1b7hwYYOk4H1azZGsv666US9fCD8Sxo+5NxFPTaC29VqxDqTvgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLIn7/Bb3fyN/HyVq2KOI4ly+89gmBkwuUstdkDvoKo=;
 b=LBAZxpx0TDRDD44+9gTnJLPABGl5b8voLbh/1HGfhL5nAk7tkmkGJVv0KzhPhkKz1qJHI7znjPhwPzsnkbH0i8Ob1gg3NTurvXN71w/Is4lohZA8RZlfdrTOwZeHLy5uGwO2nHR2uR8SZt/AAFNI5IpG7jOI++JVHMLFU1LNfcU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7713.eurprd08.prod.outlook.com (2603:10a6:10:3bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 11:50:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:50:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] btrfs-tools: upgrade 6.12 -> 6.13
Thread-Topic: [OE-core] [PATCH v2] btrfs-tools: upgrade 6.12 -> 6.13
Thread-Index: AQHbjZ76MnNhNElwoUiG0V9Gk/p0eLNmALsA
Date: Thu, 6 Mar 2025 11:50:52 +0000
Message-ID: <B28BC953-04E4-4BE3-86B5-2444CB3FCEF4@arm.com>
References: <1741159159-21356-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1741159159-21356-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7713:EE_|DU2PEPF00028D03:EE_|DU0PR08MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b286d7-a21d-45c2-d5f5-08dd5ca52b88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dzVRcUpFOTA4SFZpdmFWL1ZyT1BxVGlVSnp5MWVCdWxvSFJlZXpwRUxFU3VQ?=
 =?utf-8?B?Uk13RkhnZW90YU5EUTdlbW5FT3UxaDV3eExEeGRIUG9raThmeG1Hd0NBSEpS?=
 =?utf-8?B?dFRGVFFMZ3FjTVFhY0tjSzRSaE10RU1INDNlNUdNTHN3K1Y2S0JtQ1ltOUkz?=
 =?utf-8?B?NnF3UmRxZXJsQ3VhSWxWNVBKT2JwbmNiaTMxVWlQSjVsWk93VnhDL254OTFQ?=
 =?utf-8?B?cEtkZ0RxV2laTjRiaFU2NUdxbGFVeFJOeGh4b0prSWVuSGhvb3RkdGhWZ09Q?=
 =?utf-8?B?V1RhOGFhK3M4Tk93SFJDNzgza21sMVM5TDdDc0hYMmxydVQxTFJvNnVYbGlP?=
 =?utf-8?B?Tm1CbzRpeGlxbDE0YWlFUHdOZkNINi96SUVrbytoamRTR2lyTXdaQXZ5Wjdr?=
 =?utf-8?B?eHBzZndIS2prTUhXRzlXZ25kOEdCT0xRQ0czL2hzeVUrMXh1UHUyM1lFNnNu?=
 =?utf-8?B?cEZ4S2xtcCthbHZnU3BJTTR2bnFIcE5XWG8yTDJYZWVCNW9qUEIwNG04WS9X?=
 =?utf-8?B?SkRhUlJidng4ajdIK1RyaGtzNVVLV0VQaU9pTFB2b1FYNExTeHhOTUd2K3Rz?=
 =?utf-8?B?ZjBMOUM0NWU5MEVVaXQzcXZGREw3S1ZqdS9iUVZiVXJ5ckpGeW1QOFRScm5o?=
 =?utf-8?B?aUlCSEsyNUdJaEdIWFdDZDBBRmdGRDVIVlhiVjExMUttQlJGU1ptQ29ySTBh?=
 =?utf-8?B?c1p1RFdBTDQrbU02cHNkTW5DVklGK01TcW82Um5BelBuakFVUDdhZHBkckNQ?=
 =?utf-8?B?UUdZV1BqekpUQmdtUFhEall1aGkxendnbkY2QzlPQUVoZWUyWFNNbUV6MnlV?=
 =?utf-8?B?TCtCNGp6TVF6a1dNMEJlSDI0djhveVV0cjQzMGI5eXRLN2JMS3RUN2h2RkxT?=
 =?utf-8?B?ekh0d2lRelc5ZklIN2ZRZ3RDQUorVkJlMHBsamNHWTdWVElKK1cycXVTbUhs?=
 =?utf-8?B?KzJ2OFY5TFJ5ZFp6dUNZRzIycWEzMWd2VnpUWFR1aXZYZUl2aXRZUW1sU0h2?=
 =?utf-8?B?b3FpTUpOWGZGM0NUbEtZZ3ZqK2x1S05mb3BvaUxWR3haWC81VU1NYkhReDdz?=
 =?utf-8?B?WVF6N1BEaXhNQXp6cHdNZU9SODNZN3RqZmllbW80dHRMVWtZdFlrb1E1dnZG?=
 =?utf-8?B?MmMrVmg0WlBpRm42RlZIWGlCRlpjcSs3cXo3SDAwcXQ2REltOU5wZFNIMHdB?=
 =?utf-8?B?QlF3VFI5WE9vVkNlRjhHQUJNbHovWktCSENwdDR6dG5oaUJVV2tVL0tYWnkr?=
 =?utf-8?B?ZjFVaGJHQzJwTzVzUjhtU0lVR2VyVmhVaWFEMjJlUTIwRXlCbkxLcXZvZGh0?=
 =?utf-8?B?KzREVUVjcXJvblRzbjZ1U25ZQ25SNXVoeDBkQWtrRkxLdHpGQ3krMEdKYStE?=
 =?utf-8?B?V203Qjh1SUhaUG9xdng0d3V5TkwwQWdSTDZsVEJ1NkZ2SjVFcWwrTmRVYlUw?=
 =?utf-8?B?ZVJkYTJ4SmdFRjNWRUlDYlU3NlQ5RTRjSXBlT1FGcHFzbWhSQUtzQVZnaTBR?=
 =?utf-8?B?SnpWaC9yc3o1cnhSY01DWkVabTdiZFZYYzVrelRYeFJyZkE5aHJGS1lYaWI0?=
 =?utf-8?B?Q1dJeDltN2ZGSFJSZGEzT1Rub0NncktLZ01GRFlkM3R5alNrVXFnMEpxcEtC?=
 =?utf-8?B?NExwM0NsekxmcGF1ckNOOGkvYUJOaUYraFZHdVhMNFZJUW41WElKd2NGKzlV?=
 =?utf-8?B?d2krM1lTejdxOVk3SHlRd3pNQXNDZUhMbmxxZ1J4amwxNjVaV2ljTFcydDRW?=
 =?utf-8?B?clN5SGJveHZoVEUrREM2citLKzE1bDhaZnpLcFhmazhHUVFaZng4RGQ4c3R6?=
 =?utf-8?B?WXpjOTYzTS9nc1lCNTJFbmUyWHU4aUlLM1FiSktXa0JUbDQyZFVQQmxUOElt?=
 =?utf-8?B?ZXdRb1ZPOHhLWGpISzU1L1VZQ3ZzeFZJNlhkYTFWUXRNaGFZZUs0SnEzVXBo?=
 =?utf-8?Q?/kspvJBXkyYBnL8fvph9knaOGK/3AACb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <854126195DE8BF4F979D81283F63AF41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7713
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1006ff05-57d7-4f1e-3a1a-08dd5ca5259b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|14060799003|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TCtRcHQwZk5RVE9ucGMxcDdKa05NeUpVc24weTFxZ2lTTWlyZVlwcDFCNmto?=
 =?utf-8?B?TVRRcnY1aUpURHVjY2hEanBrMkc1NTh1NkRCM08yU2IwT3FSTEF3bzAvenZq?=
 =?utf-8?B?OGYzajgxc3E5dDFaNnVlSmEzMk9LNFVTKzlXRFVnM3B6dzBZT21Vc2FXTXla?=
 =?utf-8?B?eEtzRVlvaDdmRG9oVHhObkswZFU2aWJFaTBOZk5rRk9VK25wck90MU1kQlhj?=
 =?utf-8?B?Y0h6all0NDlwWUZ6bThRTEptZ3NLRDE5UEd4NjRlSXZ5L3lVd1ZDZVVBYzBu?=
 =?utf-8?B?blBBZVBaSm5GTHRocnFYTm44Q0gySUo1VWNOcDJ4L1FVZDNRWmRzTWx3cnVp?=
 =?utf-8?B?S2Q4K1d0eXBxMW4rRi9BZGwxbXNmNDlmZkdTRzNsaGZIK3hhWFROV1lETUJQ?=
 =?utf-8?B?cU1WbVRuSzR5WU9pOW1hcnpmVU1kcTlwZkJLTUI1MUtNUDhlU3lEUndjdWtm?=
 =?utf-8?B?c0E2a0J5K3lLMUJ4aXhBOGh3UWU4TzByOVJ0Y1hTb1h4MVhQQmQ0Y3RCcTVx?=
 =?utf-8?B?ZGhOTmNmcVd3enhaMXAzRjN1cTU0WG5zaTNqWmlOMmFiZmFSa201WFNlWE51?=
 =?utf-8?B?ZVdGRHV1WW1ESlgxTUQ1MUZjLy8rUnJNODIvTkVycTNrRWEyVXZ3Szh2TDFo?=
 =?utf-8?B?cEYyaHdQQ0dxbG40TjNobVo0Si80QlRXSDAvZmZUR1R2NkNEczJjYWpST0pO?=
 =?utf-8?B?NHp3OHVFb3hZU0dNVEw2d0tzd0p1UFNjZHo0Qk9jY2EwUndmdlNScDlZMmcz?=
 =?utf-8?B?WHlsMlBwRnF6bXVkMFJJNHJiRTlCWXRWam1aMUVrMHhhTnhWKzF4TWxkV0JM?=
 =?utf-8?B?bzVsaG4zVThhVVpMOW1vOFVMWmIwZnpZYXQ0ZTBXRWRITzRMNFJ3ay9EN3Vx?=
 =?utf-8?B?d1NHWC9pMjY2VFU5V3FNdjdML1ZFUm1kREM4amUvT0UvdGdlbEN4SjgxNWt0?=
 =?utf-8?B?eVNDN1I2VkdzdnF3a1A5ODdXa3M0TGVGbTlrdkZYMzNGWEhGcm5uT2dnbDNu?=
 =?utf-8?B?OXJyYmxOQ1BIV1FqYXZ0aGw0L29ZSDArS2RzK292VWlldkJHK09JMEJ2cENW?=
 =?utf-8?B?RFZLN2NkL25OVld0dlNITkczbHNBeGZWQU1HNW1jQXNFTmJTMmFqbmZ5TlFM?=
 =?utf-8?B?VDg5dHJadGFsRFprWDdoV044Q2s3S1BoeVdBaHBWaW80U2FTVjVxQW5xTUdx?=
 =?utf-8?B?VW5Ed2pkOHlUanRkMDJ0VGVJOTlVUE9EY2F5czVCNEJHbFlUVVo2eFdzVks4?=
 =?utf-8?B?NldaVzc4UDlLcXNzMi9DdGt5WHlSMmRJTEdYc3BJNlJka0FNN1pOOHJMa3lu?=
 =?utf-8?B?OCtGLzdJeHZyU2N6aDgxUHVGbmt0bittVHo3QjI0UUs4RnFZNDRxLzYzNDRt?=
 =?utf-8?B?cE9DVmNmdDRWVDcvMldXOURiOWRKeUw3bkhwa0pBMlZVa0NydGtCaGpuQTRP?=
 =?utf-8?B?UnRDSTVmUk1ZR29INU1VSkV5ODk2UGVXOUdQcmF5WkJmejdiZHRiZnl6Mm9H?=
 =?utf-8?B?M0Q4TE1CZDllb0Vja3J1MnhvU2JqNW1vUmY1V2Y0WXFIZ0VWY0pROVdDV1BJ?=
 =?utf-8?B?Nk8ySGxWY0E1T1I1SHdpNElQZlFkQldrVEpGMmx0RmZza1dUbGp2M3RzNkts?=
 =?utf-8?B?QUxXN1R0T1pwSTdvb1VuSVZzeUxHWkVHWTA0bndJWEJjazJWbXFCckFSWVBi?=
 =?utf-8?B?L1U1OFI3Y1g4c01ETGZzY2Y5ZDQwdkhTdHMxaGQzL0x5cHdYQmFrb09haHE3?=
 =?utf-8?B?angySGVsNzZzNnBURFZkS0NPNzNaMHhObHVnSDNlMVBGMEZ2cGpONVpuRjNv?=
 =?utf-8?B?bzBzU2IxVXl4L1VoZ3UraHBzcDZLV3ZPOHhyT2dRcE5ZUFppa0g5NC9qcGFn?=
 =?utf-8?B?RFJXejNTUWJWclhxbnVlenIxS3pQYWZkbCt2Mkk5MXRySmVFMElQUGtHTUxG?=
 =?utf-8?B?YU1iZjE5dGFyaVYrYXU2YXpGT3BLZjhjNG5RdUR1YTBsWFpHQnc5YTI4eCtG?=
 =?utf-8?B?akxSaW5jTTRBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:51:02.6225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b286d7-a21d-45c2-d5f5-08dd5ca52b88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9299
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 11:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212386

T24gNSBNYXIgMjAyNSwgYXQgMDc6MTksIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8d2FuZ215PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAN
Cj4gRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gDQo+IFRoZSB1cHN0
cmVhbSBhZGQgbHpvIHRvIC0tY29tcHJlc3Mgb3B0aW9uLCBzbyBhZGQgbHpvIHRvIFBBQ0tBR0VD
T05GSUcuDQoNCkxaTyBpcyBhbiBhbmNpZW50IGNvbXByZXNzaW9uIGZvcm1hdCBhbmQgSeKAmXZl
IGdvdCBhIGJhY2tncm91bmQgcHJvamVjdCB0byByZW1vdmUgaXQgZnJvbSBvZS1jb3JlIGVudGly
ZWx5LCBzbyB3aHkgYXJlIHlvdSB0dXJuaW5nIGl0IG9uIGJ5IGRlZmF1bHQ/ICBUaGUgcGFja2Fn
ZWNvbmZpZyBjYW4gcHJlc2VudCBidXQgZGlzYWJsZWQsIGNhbiBpdCBub3Q/DQoNClJvc3M=

