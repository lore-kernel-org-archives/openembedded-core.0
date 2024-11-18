Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1DAD591AA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 17:36:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.48])
 by mx.groups.io with SMTP id smtpd.web11.852.1731951378881484797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 09:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UTNIR+3X;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UTNIR+3X;
 spf=pass (domain: arm.com, ip: 40.107.105.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ObQ88wQlo48mAa+KjFv0p70UK4BNtYtCdmWNWF8cpmoGqlwG/Nftt/hCh10Y9uCBudY23oScROcIOmFhFwG7iItP/0AMYAboiKb1UAZzamTt/T/kotWdCLBtBP4DpJdxjzO1JDNP4qmiDTPyU5M41Ph66oWHt/U3+WI0HyQv8BJTIy6w3jq/Tor+2R6mfsi3k5RNTmo8Jx3gvUHfkrigf3rMB1ed6hM3ynhpvYGyJBpX/HWxiMhvR8UMSzOXBOgeKWKkJElx7bnRJT3X+axDdEwQq/5nen25uINJh4c+TPHDWVevTSSoNC9PO9kIOdthYLgtFOsK9th6ZpgxoRPazg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2JRW9kYXS0ZVkMvixNarXHyiy95r3kh6azRIe2Rxgk=;
 b=zVJJBmCG3Wbp9vgoOh4sDO+c2TsoEtpuvb8X4+FxdRncVEDXIAziIdyLMBR3hLIl8a+xTqwabI4zVc0C+jFsQccTsVavW9CeFDLt7GzXyOm91IT76qmO/yNcLImIOnjj76NLSGGaZGmv2jKO6pPHfI/7sgRQtklmHEJN/INQV2IC2thuoacx+SVoiIVs4PJmW+dyp3Y0e5nHD+uaImB/VIs51lChlzDjqOMoW6ULPWL18UqYkb88gL9NMpLP/2sgWCuqki2wKiTLxHXHo5g38uVTO2X41DAxTPCli+30MJjtSGNVaNq61d6hF0+WdFTqeWgeVn1vLC+viQvMP0b0FA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2JRW9kYXS0ZVkMvixNarXHyiy95r3kh6azRIe2Rxgk=;
 b=UTNIR+3XJo6/iA/eaklsqBZlYe49rxE06vmJfIQKjxofDVXJkvaZaLGKBVfSGmnCnBIm+fbH1DUtk3mYplYNf+mPvC02rvuaUrSiDZhq4kZdGqf5ABH/wCSWscB55oS+7aPlZBaAFn244M6pl/rl+6AIWmEALJvzKdZ2Zw8r6Zo=
Received: from AS9PR05CA0037.eurprd05.prod.outlook.com (2603:10a6:20b:489::28)
 by DU0PR08MB9156.eurprd08.prod.outlook.com (2603:10a6:10:417::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 17:36:14 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:489:cafe::91) by AS9PR05CA0037.outlook.office365.com
 (2603:10a6:20b:489::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Mon, 18 Nov 2024 17:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 18 Nov 2024 17:36:13 +0000
Received: ("Tessian outbound 23e15691b630:v490"); Mon, 18 Nov 2024 17:36:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aebfdb5a0dc584f6
X-TessianGatewayMetadata: pHsyBoMJKqrtF/6HkcLxdG6G0M960LIfWc61quxF3E/jmVxNzaFq47bXdQj+4dqxIF+ADmcsEtwpY47gSZYIvOtHQdaG7uRO7/6nAIQN/7ueZEFh8gXEgKD7fqwhC2HRu3l/d6opKIW2T+rAZ7CVAH0Ere5hhXoyKqQUE/Dh0AA=
X-CR-MTA-TID: 64aa7808
Received: from Lf3c1a3a3b1b7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8FC2293E-ECCA-4393-8C83-30CCAF30D4C9.1;
	Mon, 18 Nov 2024 17:36:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf3c1a3a3b1b7.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 18 Nov 2024 17:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlcavGIvp4a85QtMui7tEZJPSEwfJz7JvLAIhPvcv2C001moQsBwt51sRTOaIv+LPR6TjZ90FSQGyxIuXkloTUWOSKMXwZ6CnR4mtGM/dHSw5IB/Y55G4H2IU3Ud6UF4PA18ixY9n9XrxGwe8uSzfRuGc8ybOZKTGyaMoDpMsvIbYKGrRKkei906SNIbakGDc7TOaJ2lyFdCLgfqufz7SCv7WsMWDnqY0nDFnUczt3c0neIB8PPpbk2iTcNUOpLOD6AYc4WPlgOTuNAs8tgvli30LZebmfap8ChZKt8jg+UBp791vejz7uMpXo+st1ouQKf5M94fFK2d0JJYR69hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2JRW9kYXS0ZVkMvixNarXHyiy95r3kh6azRIe2Rxgk=;
 b=cZ+HrG04WhG6QuM39jVVJZdk3tuWQ7o3HnDwU2KwvqS3I17mzlmvDFl8piMouMqtz9KaO5EVOlfLUYX95ZTwTbOKTkLznsL+HjfetKT4Gh5HVbkq91QchGyhL9SpeWCgzJuGPD+Nmholhe9PCSog833PZHMTTsVGeKNso5I0c5q0skrzMCo7Ug0viZYPy6mwtSEpPPgY9JEE4fNVbIuz7FEV7pe7PyUWGSMQ4hwnav344H5gnYW/KmePVP36gIKdBvoxYGyMhmmmGRi29BbBNem34/FhUnzdBShnThb97mDrz2cHBt4reI8dtVqGXbE7jAmUrb1tdWmohGhnTij+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2JRW9kYXS0ZVkMvixNarXHyiy95r3kh6azRIe2Rxgk=;
 b=UTNIR+3XJo6/iA/eaklsqBZlYe49rxE06vmJfIQKjxofDVXJkvaZaLGKBVfSGmnCnBIm+fbH1DUtk3mYplYNf+mPvC02rvuaUrSiDZhq4kZdGqf5ABH/wCSWscB55oS+7aPlZBaAFn244M6pl/rl+6AIWmEALJvzKdZ2Zw8r6Zo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8391.eurprd08.prod.outlook.com (2603:10a6:150:ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 17:36:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 17:36:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 30/47] python3-flit-core: upgrade 3.9.0 ->
 3.10.1
Thread-Topic: [OE-core] [PATCH 30/47] python3-flit-core: upgrade 3.9.0 ->
 3.10.1
Thread-Index: AQHbNOWgDkUyqF2ql0e8PXiTro/qF7K9VtcA
Date: Mon, 18 Nov 2024 17:36:05 +0000
Message-ID: <4EC21F16-893F-48EF-B887-57C131C5BC55@arm.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
 <1731403483-21399-30-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1731403483-21399-30-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8391:EE_|AM1PEPF000252DE:EE_|DU0PR08MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 4711a5d0-0131-4239-6590-08dd07f77fc9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?JHiGyAgf4c6fRAmJtrgFfQbN3Hnsl6nMnpK+TocLE6z8OULrZ0e0qEcMOK0X?=
 =?us-ascii?Q?yWIsLftnJuFN5eX7KCKvbDpv4d6TFXQZ1xAu4iIJ+UvX2cOuWZtz5SMgJyiI?=
 =?us-ascii?Q?ZGqfpcsQgmR6NzOkFNxu7mA5XhBCZVjBiP3UF8asWq89lGY2SGlqStnaVa0k?=
 =?us-ascii?Q?3smm72tegB0obTJSKk9ELbTQ3oLMm3YkadxRNYBkNabj7T3l6GThZcw7f7OG?=
 =?us-ascii?Q?XK9uH7TDR8QrW4lDK2zgV8/DkfpHu00iAS8yXch2POYhkfckGjbPEIPp/JSR?=
 =?us-ascii?Q?3PjHqXhO/A7tJWRM9TKc78Ggtpjw+esWBLUkCCy/I2CZ1CpSIm1kAvTRobGs?=
 =?us-ascii?Q?skRfOfESm5BxMCtsKlOs9In4UJtewCUHWLTfcqKfcEiRDakXMNxvqdZyA5IW?=
 =?us-ascii?Q?7/AihaSaCSNxFbRqKeiGjwzwnNb0VznYOPjSB5C3YdY0XKnJsSL/DUD8q6UU?=
 =?us-ascii?Q?Gh6ILgyRXKLtX8OSPWOFnGx2EJNeDTSqhWqSTMOGKLrsHWOZozulM9CcEark?=
 =?us-ascii?Q?rqFwUHUHwoqBb+PggUmTlI7GdmffQaZisuILcHNqOwIGuxi0fDyqPWAojHxe?=
 =?us-ascii?Q?r2hnkGFpVOiz7C244k2lBK9ywOgiMwRvYSaw+lDXQdK6iO6OAwXvUn1oDPb8?=
 =?us-ascii?Q?2AOQMbHBK/TBKcJND2peFl/EhW0johpw92NCPdbpQYSVFI1Gj4fcCRfNZYGB?=
 =?us-ascii?Q?dNp3c8HTsnuHELulmUJFu/y1xOhSqaglBDp7LRm9VPFfzovFsR2BCBYVtnh8?=
 =?us-ascii?Q?aVU9S3ZDZUpQIZQwXGAlHWnm6kW+RzfnbN4cL/Z7BbxZqSPMPPJFMs81KvHj?=
 =?us-ascii?Q?bT0DhUG1Zpc+eCBgBzV2JcaqwYotaQ979eV+RJTpgIzCW5b1yDCey0RfvGsr?=
 =?us-ascii?Q?5yOlQyMEWBy2SRtGPhZSmv0OtNSim8QZlysff/My/yunQlC6q+CKG5c5HYBU?=
 =?us-ascii?Q?KBoHHoVuaaGZEAMxZRGsNe6+ntRwjKfncaQxj5tap58akO5sex5LnBh98KLI?=
 =?us-ascii?Q?T5oq2WaJXEZwqM/EhL8SRsa1JIgMZkJwPTCCCWqHoVEMx/zWfi+Fhz9ZGJ2k?=
 =?us-ascii?Q?YMPpCFSqIFyeLqsPQVp2ft/b9FiUWZDIr+2viy+F/PmOfbb/VxTjNFo+/15f?=
 =?us-ascii?Q?KlH7ViTN/OTmYRDBVl8e6EZP4r9tm1pV7zQxPxy/SoA54uWf12g5YiV6wHaB?=
 =?us-ascii?Q?Smnq/GRZM2XEu1hSMDBTyGx5JimgfeSCXLg6Gev5ZhfxK5Vv1IlHjlQuMg41?=
 =?us-ascii?Q?1tar7LP1WFCW9/4SNCh1UIb9wmVCqffnHIb/NooEwaWE9G3U18X1cPxfcc3g?=
 =?us-ascii?Q?Vv/Pz/yWARAe3Ea6OS0CMUTk9MmdeA3i3akuwLRP88ckEbr+vupJTKdKxbZo?=
 =?us-ascii?Q?oRAHpQs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CFCF866D1533EA4280C71220C1113334@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8391
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	458e83b8-7924-47a2-a523-08dd07f77aa1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KucuBZ67LrSO320pd1D7c9LIC+JdufOa2MYqsZtXFf94N52e1wWNusLe4Ktr?=
 =?us-ascii?Q?UfLMKwUnkbBLdDp1GIQQ7lVsamtik/an9SSfY1yzHKa6wi342EfzWHFXQkaG?=
 =?us-ascii?Q?2mmABHyLMzsr5FyjbyJgtKh6Ngm5kZYEXAOm9Lck8RX3Nf/kv1WUxx0PimAa?=
 =?us-ascii?Q?IwfOq1rDAj6OH999W3UsnXhUdByEfbRATriOszfgYe8ITBspr4DqYrX1B33/?=
 =?us-ascii?Q?NcwDk05EAhL8PJylhjhSa6DIFeuLqhznYCP6kSaCdYNfDNRzaMn7tciyWnrF?=
 =?us-ascii?Q?YdYekRju8tGiDKZkOyA3ax7qL1ceujerg924YmraEtdgowrjgZptRoYlCAlR?=
 =?us-ascii?Q?w2gpcJMMbYJqwO/e8bhNPNOxqeqko5/idwRcILfE4KcpuVhnMswtQrDeBU8s?=
 =?us-ascii?Q?4Ij9LFz3CDEw1ZouPszrlXI1u4CU+M+cShbJV18QQndHw7m77tYomIIquJ8H?=
 =?us-ascii?Q?ux+vE2BnVqW050dzp8kwZNtGL0k7Psv9UG59jr7EJJ1GwkOnLV7AvddHaXJf?=
 =?us-ascii?Q?Y8B35ltuNTan2I88huYvHDX8ExqHSsr6OLhRCum76bd+fx3ry/WJWaxVPG9S?=
 =?us-ascii?Q?agrUC27PSmvmlDRiBcXodJX7yvMYOW55jz7POixJEGbmwy8C5C9SQ58Xdl8r?=
 =?us-ascii?Q?Z/Zml4nVjxPE+eu8z87k3ZCSMPP2SCpTNcAfu6jJwWneObjuNNJfhjX7HX4f?=
 =?us-ascii?Q?P15r1M7x2+DujIVYAQ41nC7eI/EbeBTwVC6S7IExfc2+j2FBG7KPDlRU6OWh?=
 =?us-ascii?Q?0FO61DcFYGXyj8xf7SfqHGObift5lpVal8Hv13wPfZMoDzPK6sUPmu2KRQGd?=
 =?us-ascii?Q?zmsF4Xe7IfNyKwGmppQmk8SgsoWpt7b+qxauw65Sd3p7B5ve8XI1VfqivLcO?=
 =?us-ascii?Q?lzvYFznhxdPvVi9Vqf/7ktKemsIRCvuka7z+0es4Bv4+jdIrGDzUuARXN8ft?=
 =?us-ascii?Q?8zq4TxQKpgEGzpFrm29NrVRfW3YkApdhlxd3BUXpf4qtC/0a8HLYjbHEOQCm?=
 =?us-ascii?Q?S+XWDT0aXhVUNk03mJOnMzLN+n/NYVmKteTXm+nuNvClvoLW4rjAUHPDQY95?=
 =?us-ascii?Q?8Pfbmn0Yswa08zOk+w+uzzFzuFV/P58ZQPnGO6Z80IddkbVn4tgzne+mR8CK?=
 =?us-ascii?Q?SOPoQfx4AYWmgVr/wDUuwaEM0qC7DNOd9ISX04xJSXi2ecF416oJYbhP+U++?=
 =?us-ascii?Q?3h+yEnzN1Yje3S6qb2dVp2BxYPQzlHQfz7CXKC0PHmbZMvoWdWgrTcapj8we?=
 =?us-ascii?Q?XXjliJFKUt9yOV4attExv240KgKDkgpmJUoYa8oXg8MelfAJ4W77OYWcfb7Q?=
 =?us-ascii?Q?+NyRU4fiL0mZDei13PIhX6gNHM+WH/ds2YcJKuQZ7Ts74ujUgrYcqEFFt3hi?=
 =?us-ascii?Q?fRkjKAg+XcRRdgfizRvZR+DPrIstC68BgIZB0XIxGIPZSrfd2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 17:36:13.8231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4711a5d0-0131-4239-6590-08dd07f77fc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 17:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207228

On 12 Nov 2024, at 09:24, wangmy via lists.openembedded.org <wangmy=3Dfujit=
su.com@lists.openembedded.org> wrote:
> - The tests for flit_core are no longer part of the installed package,
>  reducing the size of the wheels

This means we can remove the -tests subpackage, so please do that and send =
a v2.

Thanks,
Ross=

