Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B24EC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:17:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.14817.1721308620151429797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oB9txdL5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oB9txdL5;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WoBYVTpnxepRtOnZmo4CboUBNiK1f37vzx5DSHJ7SLOV1oW8NFZiQpfj65/VYa5G/RY7Xdr+Lv9qG4gKgOmELtr0pEPjY7GlhCsgoq1TUWYYokR1CMBypH1xslr9i5AoSS7awDXUcRX27IfL7q5Wqkc5SNPbO1q6QydvFkUzSUSGD2+CrPnyvd267gltL4gRpYCd6Q6QJG7RmnOqqjxAgcQ2UsELbxjNOwY22M82M5h6zhXbEFQ4skymFqTM+TnUam4QxCnCzP+7SCG+pImaRrs776ITDWudLzsDBgDZSPipOuIDrVquzsEwIeCcsXFpbAzzgLfucgm4yyu5lnmliw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIg7oKWFZruedsRkXJkfo5uBLYHukPcbetMKVWJcxmk=;
 b=jBtxyHzAL9vl5sVz7ohW+CMH2ju+DctkWI7CI2dr6dhIjObXxrs1PvSUg8T73uYVTZcsT1c/cF+GvbsGyfQ2TjrME6NF+9uIr/F2AL2msVpdcRWDxuHr95vpLpQ8ts2uaPFtQlBH0tbCCba4JmAxK0D2g5BNVWv1dQDWGT4qdTf9hPW6q6HjuHAzraPzFRX/tiwVEK3zHBWMs6qHyjjZjPiPNX6WN+jOI3+pC7qtSqnqV54+EB0C9qnogMY0Qq6iNUtqA2VFbfW9QIu5hkDrNjy8h2Oh1FbajzXVZavpcMnUGj2VYou1+TV7lXt8HOkj4pceODHM0TC+aeSKmwtF0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIg7oKWFZruedsRkXJkfo5uBLYHukPcbetMKVWJcxmk=;
 b=oB9txdL5WdZAffJCv6gXSPTMAHTeyDXkAr9ND+wauZPTiquPN2Zx0izeiH9KYu2lar4bZzhLU2dynDB41J0vOD74fhcpOlD0xd321zat94Bizw5CZBLeA1obB/xqeUsczFeGlk/ebOKuFk68lb5hu8iuq2cN7WXZEZRZ2HZsTmM=
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by GV2PR08MB9399.eurprd08.prod.outlook.com (2603:10a6:150:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 13:16:55 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::2b) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Thu, 18 Jul 2024 13:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Thu, 18 Jul 2024 13:16:55 +0000
Received: ("Tessian outbound 5cfbd73e165d:v365"); Thu, 18 Jul 2024 13:16:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49ecdf665a97d598
X-CR-MTA-TID: 64aa7808
Received: from Laeae1f728f14.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CA0AEE7F-138B-44A3-A5B5-FE50D55DB29D.1;
	Thu, 18 Jul 2024 13:16:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Laeae1f728f14.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Jul 2024 13:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdCjYpmSIqFQSpB3dKAJWbMBT6IcviBFHeJ1shlcOPiZsaB68KWT7hl3AoYklEl2x4njAbWUQgkPliYP7gLaXs4QL+kwrsv/zpe1NSAYeFLvVI3aqeH4w5xwgMHPT5dP2AuZJU9cM11y/m12ON/OccQ25+8jxr/FELSzk2v1kwegvZt5QPtl2cpv8NMnBYOk37HTne7auutvnQAq3S6dASta3X2+Tr87R0/ubI05VdKrYnKsTePuJi34/oyUsEoz/a1UnpPWKS4AsP1HmXejl8Vja94E0Po7v1/ZXDkc/k031Uxnt5XvVpPJ+y67ASwMoNOm366qfAIzykguyh+biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIg7oKWFZruedsRkXJkfo5uBLYHukPcbetMKVWJcxmk=;
 b=YQFpwcjrYnXO6uTw4eocgKjRfSDIL+9yeMAGGMNIR68/WwcAdUAzgkhdX4vJYyJ0hPcJpBojDVvdN5EMIjJRxfOkEdXdg1KxWtdDwS2TfU27fNlAG7dlkAqcdwhvwNqyCdsuMzQe9YNrDB/HLY94KExoP/mEPdCrnLhDBHZ4PB4sJzSQxQbqD26jighzcF0DRqP6acavtp5/KZK+0oZG7PZLSyHEaQZFGP9fCB1HsfUxP0RQuOMriOKy5fkabVytRH95GXFbd/wOfCgQf/seow7uCUE7BSo8vKKlyyZtPWDxHZnyfuNcA9XJM+Goiqn8+jl+IvVAF/pZzNBIjpiLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIg7oKWFZruedsRkXJkfo5uBLYHukPcbetMKVWJcxmk=;
 b=oB9txdL5WdZAffJCv6gXSPTMAHTeyDXkAr9ND+wauZPTiquPN2Zx0izeiH9KYu2lar4bZzhLU2dynDB41J0vOD74fhcpOlD0xd321zat94Bizw5CZBLeA1obB/xqeUsczFeGlk/ebOKuFk68lb5hu8iuq2cN7WXZEZRZ2HZsTmM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8026.eurprd08.prod.outlook.com (2603:10a6:150:ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 13:16:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 13:16:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][PATCH V2] pixman: update patch for fixing
 inline failure with -Og
Thread-Topic: [OE-core] [master][PATCH V2] pixman: update patch for fixing
 inline failure with -Og
Thread-Index: AQHa12V1I1tQefg2mkOoCJIPN+B2QLH8eqCA
Date: Thu, 18 Jul 2024 13:16:43 +0000
Message-ID: <135B34F4-47F3-48E5-9AE6-9CE0C7F6DE38@arm.com>
References: <20240716094909.3536953-1-changqing.li@windriver.com>
In-Reply-To: <20240716094909.3536953-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8026:EE_|DB1PEPF000509FE:EE_|GV2PR08MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ae90ed-1d41-4d7a-0383-08dca72be53d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bkFISmFkaTloWkExQy9WSUhlN25DOWErdHFwbVk0Tk5vM0ozV1QyeG1MUmh4?=
 =?utf-8?B?WE9HTmJVN1pyY2hTc3E4R1VGQmRkMktRYzBDSTR3VDE5YW1DaEtkSlczT3lN?=
 =?utf-8?B?ZjFwRUlLVWNaTkNocGdUK2hpQW0vN203MWh1a1ZrU24vMFR1c0hrR25nTHhQ?=
 =?utf-8?B?VlBRKytSd2dJQlltR3RHSWFOT3lEYXZSRGFWb3crZGI2SUZTcDRQSk9acXQ3?=
 =?utf-8?B?NGovbGlPZjV4MnBvZEYxYnhJSEp2dDY3d0F2em1lM3ZUZktDbzc0dHdYbjdt?=
 =?utf-8?B?WmxnMldaUGVUN1loZ3dWQitYc1pDU3o3b3V2WStkNzRydnNLelpNVU5pV2NY?=
 =?utf-8?B?QWxPSEEzbmQxM3k4VkYzcmhnZUpYZ3ZacGlmUXB0OUxVVUFpUXBBSmo4dktK?=
 =?utf-8?B?WUh3enpQRmJKdzhRNkFEZFdza25jbEczanFUdnlYVkV1NUxzRG1QZTYwVUVW?=
 =?utf-8?B?WFl1NVF5NXFvK2hZSHg4ZGFmQldQbTM4NVdHNTN1SkdWN1pyekZ0eVM1USs0?=
 =?utf-8?B?WVorYU1uNUtpcFd1bXlJc2FXbnBGMm5hY2JpZG5VY25IMlNUN2p4VFo4RzZM?=
 =?utf-8?B?WWxaWDNseGtpRm1WZ1dqR0ZhWUE1d2VPa284cktsMC9sT0pZWG1wMHllQklL?=
 =?utf-8?B?MGlqb1g4OFJnaUdwR1ZDcUdFVDFyU2JEQWQ5ejMza1VoTG1Tc05PUGtjYlZQ?=
 =?utf-8?B?SVJDY2NqTjhTRnE2L284R25sQnlDVlF0WS9vU0p1anVpRzF2MTYxWWZjaDBW?=
 =?utf-8?B?Z0h1UGlaWTlKd3d1SUhoVFlVaFgxTVF5elNYcW9qdTFyRk5KcE1VU3VtN2w1?=
 =?utf-8?B?Z2JNSVRoUDF1VmhFMDdwaDJ5RnNHWHliZWkvZEREM1NOMHhIc0FJNm9PMTNT?=
 =?utf-8?B?eWJaZWtIOXJpM2tTOEpwOUhxWlFMcCtUTzdnUmFkSFFxT2w4ZEEvUGZQUVZ5?=
 =?utf-8?B?eElKb0VmaEtPTmJSSUN5a0lnOUMrNWlBVzhFWWJCNWZZY1c4YjBVazgvOWNL?=
 =?utf-8?B?VE1NM2FpendzbEJ2SytNd1o1ODgwRFhrUk1lTExDYm9qeHhvcTF3a085UURF?=
 =?utf-8?B?WUlHSEVjTkU4Njk1a2dmLzFNSlRidEgvSkhLZU05UGljY1NBWVV5RE54bXlw?=
 =?utf-8?B?blZNa25qOXQ4aGdqUnkydGpnUTVRMmZvU014MmxwTFV2WE5hQ1EyMU9jUGdJ?=
 =?utf-8?B?My9MaUJsQ2dwb08vMU1PSzk3aHVrYWtOQ3BFQmlBWS80MGo1MXo5K0NldU0v?=
 =?utf-8?B?QTBMTWNSeC9BaFZRSUVWaldJZkJhNksyRWhLeW1nY2h1ZUo5TXZyUTNlYTFw?=
 =?utf-8?B?dFVMT2cyVFBGeDZablFmS0V5VnJpUEVoMUdTcG5sbkluVVZ2WElMRFdLSVlm?=
 =?utf-8?B?T2JqQnVxbjRmM2RTRTQ1MGtCNm1FV3BNcWpxbVhlYlNhY3hJMGRQZ0pKanhC?=
 =?utf-8?B?OTU3cHFERWhxZ1dHMEhoTXhab1FIa2ltS3dQZ1NKTXBaYklxSlFNUGtTMHp3?=
 =?utf-8?B?bi9Sb0c1NWhlRkJvcjZMOGR3dnhhKzJhZU92a056dHUwKzdUZGRya282VWdh?=
 =?utf-8?B?NVZ4bjBCd2gwY3dvUGFVT2QzbUs5RE05aDNTNnBzdFVWbjk1ZENMc1Z2aDdh?=
 =?utf-8?B?ZGFJR25MVnJCWDM5bjNJSkF4OXQ3SmtKcnh3SVZzMDBlV0I1bENyeEdLNmVB?=
 =?utf-8?B?THdJQU9xcDFWeE9keFJ4dzljRThxZWhDOVRFanpoc0ZvQmI4ZnZXMHhhVER1?=
 =?utf-8?B?L1dwSTY3bVJoUDNYNFplTk1RNENZZThucG9DcEpjck5aWUlORmlOZ0JSZTdx?=
 =?utf-8?Q?Oz/GK+8/nHk90cR3yZlu4FuADGOFF1XHGCpdM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0870521EF488AB4AB91AF52EFC7D5805@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	160bb955-29ee-417d-1003-08dca72bde7d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|34070700014|1800799024|36860700013|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGdZSnhOWWhWWGN6b1FzNVBKQk1iTTlIcjBIdUNvM1RiNFBVMlBOa0FNQllO?=
 =?utf-8?B?ZkNDZGcreCtkdnNWV1IwZFJKQ3plSkZhSEViQkNQS2tlQUp0NlBQT21zQVhp?=
 =?utf-8?B?VW5sZFowMXJqVnBka2FiemJ6cndrWkZzYi9JZHl0Vnhybm0wQ1ZadFY4V0gw?=
 =?utf-8?B?T290eUZwaW9jNHBZZWJhaXdrQWZQS2tHL09KazNpVnZqMFpVYnpESklOaEtV?=
 =?utf-8?B?ZFVzd05FWlh0ampDS3E3aUJiYmJtWTRNTm0zVE5rb3JYMDFVSm1HT3lvdVBS?=
 =?utf-8?B?UFJpUkFRMjcvMGQyb29zNTN1L0RMbkJzWENiZCtPSi9mUzdlZDkvNWZCMG4y?=
 =?utf-8?B?Wk1DZy9YUXNFSEsxR0EvNHY0RHQrdEdLeHNVTWVpajRlcldwSDBTc1BHTG54?=
 =?utf-8?B?TGFWam15eXZlamVUY3E0dlRwdFlxbWlSWEQ4Q2ZjRCtpbzdrQzEveDBSTFJM?=
 =?utf-8?B?eWxiVU53SVdHajlFVXdLdDlRNlVjbm5FNnZLY05vWm1zaUZxR05qdWQrWjR6?=
 =?utf-8?B?c0IvZG1kL0F3K3VEUnRWbDdhcS9Za2FXYy9IR1lIU2dNbUl0ZkUxMFhMa25L?=
 =?utf-8?B?RCtEQTkzTmdhVC9VblFEVjZPZ2NwTzljRnJtMnpFQ2NudVVsWXZaSWZVcWly?=
 =?utf-8?B?cmRvWHcrOXFTUWNTaDBMc3VzZVpuRnhsRWppZUZLR2s1OEZ4bEJWZUM0aE5Q?=
 =?utf-8?B?dmVuaTlnQnlpV2pDTjhqY0NEYXVZZ2h0c2FQL255MzYyWFVGczg1Znd2V2sz?=
 =?utf-8?B?QUlKNXJMdGk3YUhrUlY3Ky81am43MWliOHZ5RndBTEJBNUE4SVgxWHJ6cTJ6?=
 =?utf-8?B?TExHbFdTaW1KQmVMWG9jTWtpcmpXa1U5Ni9ienIzTjZ5czIwenJEMitRN1Ns?=
 =?utf-8?B?R1JzVjJmTnNNeFlXVmZPMVlhTTJPTmVsWk1zK29NY25qa042ZXJOSmRhaSsw?=
 =?utf-8?B?N1QySTk2ZnlodC9SSWxOSk8wRGY1SjAzYUJyVE1GMTdyY1pCdU9mOWNWRUE4?=
 =?utf-8?B?N3EzQW9oMlpUVDhyNUNvSXIrWDhoTVc2UUJRb2kreDdOTlJ1aFh0R1dZa3VI?=
 =?utf-8?B?UU4zd2ZOUUNCS1RLUEY4SlZwQmR6ZzljcUMrYTFheUhoKzdYb0xFSDJpZVl4?=
 =?utf-8?B?R1JaWFlORTZOM2Fjckp5aTArVFdnZXlUMjloMDl2cUsvMEZYS0J1UE9icVBy?=
 =?utf-8?B?b1hUUndiQ2w3YThmMTlKL2hJVVNtcUdHcXh2cUpETzl2MDd1a3FXaTVqcG9Q?=
 =?utf-8?B?RGFhbFZSNEh5VE5heTQ4YUYxNVhabGl5MkhmUTFLY1lvV2E1RUJhR01UQmpQ?=
 =?utf-8?B?aWl0MEYybE9weGJnQWp0SjNWRkpHTmNEZ21qVmNRa1dMbUFmUnRpb2cxN0ly?=
 =?utf-8?B?bmVxUm1mL21nbFMwSEFCMm93VlhIbjhtS3dEbWQvdjN2QmUvdHJGQmFWVjRK?=
 =?utf-8?B?alcyMG5OTVMyRVJBY1BWQXk1Z2IzOTVWdkZaOGc3Z2toSHlTSmduWkxDNkw5?=
 =?utf-8?B?Nk10NGU5Q3h6eTNEZCtoclk0TThNazJhZU5TZkNXWk5GR1ZIVFJXUlFvbVFI?=
 =?utf-8?B?cEY1MUsvZ0QvOGNVamMxaVdMYUJIaU1IK2xJY0I1djBiSy9sUFo0OXRZUnd0?=
 =?utf-8?B?ZUtiSkUyWUhwZWJHU0RFTkQ1M2JQbVBVdU1NV3JJNGg0NEEvSlZFU0ljVnlz?=
 =?utf-8?B?OURjMm1vYjBqSmJCSnZHOUhjTUlUTUpFVis0OW5aYTlOOXovNnpFWkZUMUxx?=
 =?utf-8?B?VHhtWVVPSTlack5zUFZXd0hRSWlXU0o0a3oyOUcvUGowOXJtZTZTVFpPK09l?=
 =?utf-8?B?MzVSOTBrWERqbEZEdXVFTzFBTmV4Z3JjK0ZyT2k0blFXY0U3RG1Sa0JCcDhn?=
 =?utf-8?B?UFhsL2pNM0tRYks3TllMR2oybjZENjBIRzNNWEZiek1WL0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(34070700014)(1800799024)(36860700013)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:16:55.1024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ae90ed-1d41-4d7a-0383-08dca72be53d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202211

Q2FuIHlvdSBzdWJtaXQgdGhpcyB0byBwaXhtYW7igJlzIGdpdGxhYiByZXBvc2l0b3J5IGFzIGEg
TVI/DQoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXhtYW4vcGl4bWFuLy0vbWVy
Z2VfcmVxdWVzdHMNCg0KVGhhbmtzLA0KUm9zcw0KDQo+IE9uIDE2IEp1bCAyMDI0LCBhdCAxMDo0
OSwgQ2hhbmdxaW5nIExpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxjaGFuZ3FpbmcubGk9
d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206
IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+DQo+IA0KPiBQcmV2aW91
cyBwYXRjaCB3b3JrcyBvbiBmZWRvcmE0MCB3aXRoIGdjYy0xNCwgYnV0IG5vdCB3b3Jrcw0KPiBv
biB1YnVudHUyMDA0IHdpdGggZ2NjLTkuIFVwZGF0ZSB0aGUgcGF0Y2ggdG8gZml4IHRoZSBkb19j
b21waWxlDQo+IGZhaWx1cmU6DQo+ICAgIEluIGZ1bmN0aW9uIOKAmGNvbWJpbmVfaW5uZXLigJks
DQo+ICAgICAgICBpbmxpbmVkIGZyb20g4oCYY29tYmluZV9zb2Z0X2xpZ2h0X2NhX2Zsb2F04oCZ
IGF0IC4uL3BpeG1hbi0wLjQyLjIvcGl4bWFuL3BpeG1hbi1jb21iaW5lLWZsb2F0LmM6NjU1OjE6
DQo+ICAgIC4uL3BpeG1hbi0wLjQyLjIvcGl4bWFuL3BpeG1hbi1jb21iaW5lLWZsb2F0LmM6Mzcw
OjU6IGVycm9yOiBpbmxpbmluZyBmYWlsZWQgaW4gY2FsbCB0byDigJhhbHdheXNfaW5saW5l4oCZ
IOKAmGNvbWJpbmVfc29mdF9saWdodF9j4oCZOiBmdW5jdGlvbiBub3QNCj4gY29uc2lkZXJlZCBm
b3IgaW5saW5pbmcNCj4gICAgICAzNzAgfCAgICAgY29tYmluZV8gIyMgbmFtZSAjIyBfYyAoZmxv
YXQgc2EsIGZsb2F0IHMsIGZsb2F0IGRhLCBmbG9hdCBkKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Q2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+IC4uLmxv
YXQuYy1maXgtaW5saW5pbmctZmFpbGVkLWluLWNhbGwtdC5wYXRjaCB8IDU2ICsrKysrKysrKysr
KysrKysrKysNCj4gLi4uZmxvYXQuYy1yZXBsYWNlLWZvcmNlX2lubGluZS13aXRoLV9fLnBhdGNo
IHwgMzYgLS0tLS0tLS0tLS0tDQo+IC4uLi94b3JnLWxpYi9waXhtYW5fMC40Mi4yLmJiICAgICAg
ICAgICAgICAgICB8ICAyICstDQo+IDMgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwg
MzcgZGVsZXRpb25zKC0pDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1saWIvcGl4bWFuLzAwMDEtcGl4bWFuLWNvbWJpbmUtZmxvYXQuYy1maXgtaW5saW5p
bmctZmFpbGVkLWluLWNhbGwtdC5wYXRjaA0KPiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3BpeG1hbi8wMDAxLXBpeG1hbi1jb21iaW5lLWZsb2F0LmMt
cmVwbGFjZS1mb3JjZV9pbmxpbmUtd2l0aC1fXy5wYXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW4vMDAwMS1waXhtYW4tY29tYmluZS1m
bG9hdC5jLWZpeC1pbmxpbmluZy1mYWlsZWQtaW4tY2FsbC10LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL3BpeG1hbi8wMDAxLXBpeG1hbi1jb21iaW5lLWZsb2F0LmMtZml4
LWlubGluaW5nLWZhaWxlZC1pbi1jYWxsLXQucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMC4uNWM3OTc1NGU1MA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW4vMDAwMS1waXhtYW4tY29tYmlu
ZS1mbG9hdC5jLWZpeC1pbmxpbmluZy1mYWlsZWQtaW4tY2FsbC10LnBhdGNoDQo+IEBAIC0wLDAg
KzEsNTYgQEANCj4gK0Zyb20gMWUzMjk4NGNjZDU4ZGExYTY2Y2E5MThkMTcwYTZiMTgyOWVmOWRm
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IENoYW5ncWluZyBMaSA8Y2hhbmdx
aW5nLmxpQHdpbmRyaXZlci5jb20+DQo+ICtEYXRlOiBUdWUsIDE2IEp1bCAyMDI0IDE1OjMxOjE2
ICswODAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIHBpeG1hbi1jb21iaW5lLWZsb2F0LmM6IGZpeCBp
bmxpbmluZyBmYWlsZWQgaW4gY2FsbCB0bw0KPiArIGFsd2F5c19pbmxpbmUNCj4gK01JTUUtVmVy
c2lvbjogMS4wDQo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgNCj4g
K0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQNCj4gKw0KPiArUmVmZXIgWzFdLCBhbHdh
eXMtaW5saW5lIGlzIG5vdCBzdWdnZXN0ZWQgdG8gYmUgdXNlZCBpZiB5b3UgaGF2ZSBpbmRpcmVj
dA0KPiArY2FsbHMuIHNvIHJlcGxhY2UgZm9yY2VfaW5saW5lIHdpdGggaW5saW5lIHRvIGZpeCBl
cnJvcjoNCj4gK0luIGZ1bmN0aW9uIOKAmGNvbWJpbmVfaW5uZXLigJksDQo+ICsgICAgaW5saW5l
ZCBmcm9tIOKAmGNvbWJpbmVfc29mdF9saWdodF9jYV9mbG9hdOKAmSBhdCAuLi9waXhtYW4vcGl4
bWFuLWNvbWJpbmUtZmxvYXQuYzo2NTU6NTExOg0KPiArLi4vcGl4bWFuL3BpeG1hbi1jb21iaW5l
LWZsb2F0LmM6NjU1OjIxMTogZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIOKAmGFs
d2F5c19pbmxpbmXigJkg4oCYY29tYmluZV9zb2Z0X2xpZ2h0X2PigJk6IGZ1bmN0aW9uIG5vdCBj
b25zaWRlcmVkIGZvciBpbmxpbmluZw0KPiArDQo+ICtbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9i
dWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTE1Njc5DQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czog
U3VibWl0dGVkIFtodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3BpeG1hbkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcvbXNnMDQ4MTIuaHRtbF0NCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4gKy0tLQ0KPiArIHBpeG1hbi9w
aXhtYW4tY29tYmluZS1mbG9hdC5jIHwgNiArKystLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvcGl4bWFu
L3BpeG1hbi1jb21iaW5lLWZsb2F0LmMgYi9waXhtYW4vcGl4bWFuLWNvbWJpbmUtZmxvYXQuYw0K
PiAraW5kZXggZjUxNDViYy4uZjY1ZWI1ZiAxMDA2NDQNCj4gKy0tLSBhL3BpeG1hbi9waXhtYW4t
Y29tYmluZS1mbG9hdC5jDQo+ICsrKysgYi9waXhtYW4vcGl4bWFuLWNvbWJpbmUtZmxvYXQuYw0K
PiArQEAgLTI2MSw3ICsyNjEsNyBAQCBnZXRfZmFjdG9yIChjb21iaW5lX2ZhY3Rvcl90IGZhY3Rv
ciwgZmxvYXQgc2EsIGZsb2F0IGRhKQ0KPiArIH0NCj4gKyANCj4gKyAjZGVmaW5lIE1BS0VfUERf
Q09NQklORVJTKG5hbWUsIGEsIGIpIFwNCj4gKy0gICAgc3RhdGljIGZsb2F0IGZvcmNlX2lubGlu
ZSBcDQo+ICsrICAgIHN0YXRpYyBmbG9hdCBpbmxpbmUgXA0KPiArICAgICBwZF9jb21iaW5lXyAj
IyBuYW1lIChmbG9hdCBzYSwgZmxvYXQgcywgZmxvYXQgZGEsIGZsb2F0IGQpIFwNCj4gKyAgICAg
eyBcDQo+ICsgY29uc3QgZmxvYXQgZmEgPSBnZXRfZmFjdG9yIChhLCBzYSwgZGEpOyBcDQo+ICtA
QCAtMzYwLDEzICszNjAsMTMgQEAgTUFLRV9QRF9DT01CSU5FUlMgKGNvbmpvaW50X3hvciwgT05F
X01JTlVTX0RBX09WRVJfU0EsIE9ORV9NSU5VU19TQV9PVkVSX0RBKQ0KPiArICAqLw0KPiArIA0K
PiArICNkZWZpbmUgTUFLRV9TRVBBUkFCTEVfUERGX0NPTUJJTkVSUyhuYW1lKSBcDQo+ICstICAg
IHN0YXRpYyBmb3JjZV9pbmxpbmUgZmxvYXQgXA0KPiArKyAgICBzdGF0aWMgaW5saW5lIGZsb2F0
IFwNCj4gKyAgICAgY29tYmluZV8gIyMgbmFtZSAjIyBfYSAoZmxvYXQgc2EsIGZsb2F0IHMsIGZs
b2F0IGRhLCBmbG9hdCBkKSBcDQo+ICsgICAgIHsgXA0KPiArIHJldHVybiBkYSArIHNhIC0gZGEg
KiBzYTsgXA0KPiArICAgICB9IFwNCj4gKyAgICAgIFwNCj4gKy0gICAgc3RhdGljIGZvcmNlX2lu
bGluZSBmbG9hdCBcDQo+ICsrICAgIHN0YXRpYyBpbmxpbmUgZmxvYXQgXA0KPiArICAgICBjb21i
aW5lXyAjIyBuYW1lICMjIF9jIChmbG9hdCBzYSwgZmxvYXQgcywgZmxvYXQgZGEsIGZsb2F0IGQp
IFwNCj4gKyAgICAgeyBcDQo+ICsgZmxvYXQgZiA9ICgxIC0gc2EpICogZCArICgxIC0gZGEpICog
czsgXA0KPiArLS0gDQo+ICsyLjI1LjENCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL3BpeG1hbi8wMDAxLXBpeG1hbi1jb21iaW5lLWZsb2F0LmMtcmVw
bGFjZS1mb3JjZV9pbmxpbmUtd2l0aC1fXy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi9waXhtYW4vMDAwMS1waXhtYW4tY29tYmluZS1mbG9hdC5jLXJlcGxhY2UtZm9yY2Vf
aW5saW5lLXdpdGgtX18ucGF0Y2gNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IGNhZTIwMTYyOWYuLjAwMDAwMDAwMDANCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL3BpeG1hbi8wMDAxLXBpeG1hbi1jb21iaW5lLWZsb2F0LmMtcmVwbGFjZS1mb3JjZV9p
bmxpbmUtd2l0aC1fXy5wYXRjaA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDM2ICswLDAgQEAN
Cj4gLUZyb20gNDlhMTY0NDAxNWQwNzM4MjljMTdkY2Q5NzdhYWI2ZmRkYTFlYmRlZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDENCj4gLUZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdp
bmRyaXZlci5jb20+DQo+IC1EYXRlOiBGcmksIDUgSnVsIDIwMjQgMDc6MzM6NDQgKzAwMDANCj4g
LVN1YmplY3Q6IFtQQVRDSF0gcGl4bWFuLWNvbWJpbmUtZmxvYXQuYzogcmVwbGFjZSBmb3JjZV9p
bmxpbmUgd2l0aCBfX2lubGluZV9fDQo+IC0gICAgDQo+IC1SZWZlciBbMV0sIGFsd2F5cy1pbmxp
bmUgaXMgbm90IHN1Z2dlc3RlZCB0byBiZSB1c2VkIGlmIHlvdSBoYXZlIGluZGlyZWN0DQo+IC1j
YWxscy4gc28gcmVwbGFjZSBmb3JjZV9pbmxpbmUgd2l0aCBfX2lubGluZV9fIHRvIGZpeCBlcnJv
cjoNCj4gLUluIGZ1bmN0aW9uIOKAmGNvbWJpbmVfaW5uZXLigJksDQo+IC0gICAgaW5saW5lZCBm
cm9tIOKAmGNvbWJpbmVfc29mdF9saWdodF9jYV9mbG9hdOKAmSBhdCAuLi9waXhtYW4vcGl4bWFu
LWNvbWJpbmUtZmxvYXQuYzo2NTU6NTExOg0KPiAtLi4vcGl4bWFuL3BpeG1hbi1jb21iaW5lLWZs
b2F0LmM6NjU1OjIxMTogZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIOKAmGFsd2F5
c19pbmxpbmXigJkg4oCYY29tYmluZV9zb2Z0X2xpZ2h0X2PigJk6IGZ1bmN0aW9uIG5vdCBjb25z
aWRlcmVkIGZvciBpbmxpbmluZw0KPiAtDQo+IC1bMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6
aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTE1Njc5DQo+IC0NCj4gLVVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFtodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3BpeG1hbkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcvbXNnMDQ4MTIuaHRtbF0NCj4gLQ0KPiAtU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5n
IExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4gLS0tLQ0KPiAtIHBpeG1hbi9waXht
YW4tY29tYmluZS1mbG9hdC5jIHwgMiArLQ0KPiAtIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiAtDQo+IC1kaWZmIC0tZ2l0IGEvcGl4bWFuL3BpeG1hbi1j
b21iaW5lLWZsb2F0LmMgYi9waXhtYW4vcGl4bWFuLWNvbWJpbmUtZmxvYXQuYw0KPiAtaW5kZXgg
ZjUxNDViYy4uNTI0MDBmNCAxMDA2NDQNCj4gLS0tLSBhL3BpeG1hbi9waXhtYW4tY29tYmluZS1m
bG9hdC5jDQo+IC0rKysgYi9waXhtYW4vcGl4bWFuLWNvbWJpbmUtZmxvYXQuYw0KPiAtQEAgLTQ0
LDcgKzQ0LDcgQEANCj4gLSANCj4gLSB0eXBlZGVmIGZsb2F0ICgqIGNvbWJpbmVfY2hhbm5lbF90
KSAoZmxvYXQgc2EsIGZsb2F0IHMsIGZsb2F0IGRhLCBmbG9hdCBkKTsNCj4gLSANCj4gLS1zdGF0
aWMgZm9yY2VfaW5saW5lIHZvaWQNCj4gLStzdGF0aWMgX19pbmxpbmVfXyB2b2lkDQo+IC0gY29t
YmluZV9pbm5lciAocGl4bWFuX2Jvb2xfdCBjb21wb25lbnQsDQo+IC0gICAgICAgZmxvYXQgKmRl
c3QsIGNvbnN0IGZsb2F0ICpzcmMsIGNvbnN0IGZsb2F0ICptYXNrLCBpbnQgbl9waXhlbHMsDQo+
IC0gICAgICAgY29tYmluZV9jaGFubmVsX3QgY29tYmluZV9hLCBjb21iaW5lX2NoYW5uZWxfdCBj
b21iaW5lX2MpDQo+IC0tLSANCj4gLTIuNDQuMA0KPiAtDQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAuNDIuMi5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9waXhtYW5fMC40Mi4yLmJiDQo+IGluZGV4IDg4ZWVmNTBmN2IuLjNj
NTVjMTcwNWEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9w
aXhtYW5fMC40Mi4yLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9w
aXhtYW5fMC40Mi4yLmJiDQo+IEBAIC05LDcgKzksNyBAQCBERVBFTkRTID0gInpsaWIiDQo+IA0K
PiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmNhaXJvZ3JhcGhpY3Mub3JnL3JlbGVhc2VzLyR7QlB9
LnRhci5neiBcDQo+ICAgICAgICAgICAgZmlsZTovLzAwMDEtQVJNLXFlbXUtcmVsYXRlZC13b3Jr
YXJvdW5kcy1pbi1jcHUtZmVhdHVyZXMtZGV0ZWN0aS5wYXRjaCBcDQo+IC0gICAgICAgICAgIGZp
bGU6Ly8wMDAxLXBpeG1hbi1jb21iaW5lLWZsb2F0LmMtcmVwbGFjZS1mb3JjZV9pbmxpbmUtd2l0
aC1fXy5wYXRjaCBcDQo+ICsgICAgICAgICAgIGZpbGU6Ly8wMDAxLXBpeG1hbi1jb21iaW5lLWZs
b2F0LmMtZml4LWlubGluaW5nLWZhaWxlZC1pbi1jYWxsLXQucGF0Y2ggXA0KPiAgICAgICAgICAg
ICINCj4gU1JDX1VSSVtzaGEyNTZzdW1dID0gImVhMTQ4MGVmYWRhMmZkOTQ4YmM3NTM2NmY3YzM0
OWUxYzk2ZDMyOTdkMDlhM2ZlNjI2MjZlMzhlMjM0YTYyNWUiDQo+IA0KPiAtLSANCj4gMi4yNS4x
DQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgj
MjAyMDk2KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvbWVzc2FnZS8yMDIwOTYNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbXQvMTA3MjQ5MTA2LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJl
ZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFty
b3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

