Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D07C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 10:56:43 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.97])
 by mx.groups.io with SMTP id smtpd.web11.17868.1718794601281145040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 03:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=M2Rhe7Z6;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=zQ47gvti;
 spf=pass (domain: topic.nl, ip: 40.107.249.97, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=hY2LPglJntjA/FM/4sCR/ASuqAA5fRl3eSAJtxUSYTB8+Z8fJPX+5b6Lhc/gdjnoBFVuB6RLfEDedRBbFwLdfZ7kX6Qs6dsviRBKT9qm69b9MdXklyriDoeWIEFRm9sqzDEYY6Kd7KE66ZA+PdGLJc0GToLcdV3fUyVfIH+MKwNYLdX+2/RlwnKPaG9dIvcaD/0oiYlYzNjJv4fdv3+391bZEhifaplOa3ESsdung3VBJKrXCyMI348Rlur4ABy3aEYF3Gf27JVQfvREL7RDgY3h4Qr4+tr5ceqpDdsr0E8zzwGLFzksdfEgUKjWZ1yuauyXk6RJRb8ddRKVE3mhSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i11Zg6GpQw1NLuj6K5LCNa1MY/N372NGggWbwGbEcEo=;
 b=akK5lK+mBMN6L2tu1oJ4R5rs39hjCHZgq8J6sP+Fcv8N6yro8mSJNzqV3giEFJ7wr4gzPU4k12qVxQyKRAUq4Ezok+RFUV+InY6kWikiNLsCdfzRe5rtMnOrYuJJ89RLc7rXuQ2BkhX3uoq+JbSvPylLvgQLU5MbF61s0bDt0MhN/CcBSNYlKQoRaPz8DEJ1zLEnYvgHJboEG82dgUMn8RGDpN/ldTGzAfZS1WDCyYuX0mJN6wfIpyMMwOBzknS+HWbc3YP9sd34oiov1YzyVhJRag+qfs3vVG7A3uSbR8mH1Unp1vyko8vv4NwaRVQT21f8QmjBkGXarN8UdVvwag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=topic.nl; dkim=fail (signature did not verify) header.d=topic.nl;
 arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i11Zg6GpQw1NLuj6K5LCNa1MY/N372NGggWbwGbEcEo=;
 b=M2Rhe7Z63mSbEYo/X8tCn6DM3bWFPbtRwnsi7q22dMikRsvr7fn9wsBG43jneF3tZX2WM0glJAiL4W3imB7dWn+BeI/XjlT1+CZV4yqBcflA/GqEX6sPFl6ADIj7bQeOLIDIIIf9SEeFVuqi9HOx2+lzGZKeYNoH8J5HDxZ2S12mvXSMbRrIHTQ6TMQ+atBintP25YusWcY07iw8pGgAAWwyW5peZr9bbt4CHMLR7KIA0cGrDZ5nPGwmGTq6kf5SUB3rhTerzKd+IreFz4ZzcDXjoiPxoh62vJXkTBLP8APYrVVlqDb/LsH++FtKpKjfxvut0rpXCC0haAsG9expZg==
Received: from DUZP191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::28)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 10:56:37 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::a0) by DUZP191CA0036.outlook.office365.com
 (2603:10a6:10:4f8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Wed, 19 Jun 2024 10:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 10:56:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.51) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 19 Jun 2024 10:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaAYKiXsuUiFsXbRJO5Svsv2jeROgQXKiAzA0+8A1t9otLyEVHr5JQAB2DdCv5HMuTG2ab+Ht0Bvp1aX5n3hrJ35L4Sp9wK0EotlFMGfoaXukhYuxoy1epq35A5oyMGK6Zy+tDRPQprkz9pZUjjY1uaSXLRSkRGnOiGjvCzAhTbq6AvASgFfhNEZI2nkYzDgSD4WzeO8htVGNh06VGdQ2QkNiJuNHzXWA3HtFzZc5hs0bq6VHLiBcSHieXNv0dR7i2Hxwr1y0+c00OOne5ecPY2JMPXxVz9Wp6SmFAY3Kto9XkR0vEzlK4ITvWfxrUMQUk/wccJARU2kVeA3zvdiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDd5spkAAdX5YuMdXsSBEczZ6OtyQwbqa5843uVGS04=;
 b=ehLZlflhF44lFRgF78Fxxzyfcetv0caBHoB709xP58+3g7eoPDc0vR8/E0pxfG62i/Hxh+p3mIxvfCg9CJ4xb6ssicW9g3X6htgVDRlWSA8OhLW+WcO9fLiygNC9/e+FJsaLmtuwVY+ILNjCHFRGWYTXjnYN5S9O6mCS5fmd402KLdS6yAS48KUZgTBUHQYUbQSfeHQpL8u0oqKP+Qi+F44WH8Ccrj7TTBJ3bMWYm9WPFda8DsYg5nG15qu7SZ4Dt6vRlTWMaVmDl0c3roPZdeBWGPegoorLgs0SDtg4s2mttVH57ORDOyS0jvA5e+9DPuk6ekc+1ROxemMS8WBgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDd5spkAAdX5YuMdXsSBEczZ6OtyQwbqa5843uVGS04=;
 b=zQ47gvti1VQE7BtiMTztw2wHitSUCJJkP/Eu0C192dP6lJcQxI+bqov6/c1NkmELttz67R0cWaJR6KG3OauUXTO+pxHMPgvLGumXsZJyCjfH0OqYft36gHV6fBZY+oqxho76XfN95UFE/TTXyAhgSU7XUtu6BqmWvQCqX4qpcxjAtTaP8Fsq4PSU4hlnUgosXo5j+jHG8vOhEUpKK28bs3nSzxKGrT35da4wRZz031k83paxIaIorjXC4LiP4/xW9AM7dOMh+Iuibmz1AcYzjIKsLkW0F4+jlvhtDIcdxn9qGJARVIvqUnsg4BDC9Qu3UfjclZ7kw7GX6miYxweyZg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS5PR04MB9798.eurprd04.prod.outlook.com (2603:10a6:20b:654::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 10:56:33 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%7]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 10:56:33 +0000
Message-ID: <0b5fe145-faea-492e-ad4c-1d9e65cf8593@topic.nl>
Date: Wed, 19 Jun 2024 12:56:32 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH v2] meta: uboot-config: Fix broken menuconfig
 for "fitImage" kernel
To: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1a7bc4dc-70e3-4a7f-b2b4-84e6b0130c4c@emailsignatures365.codetwo.com>
 <17D1BD0B27726C40.30563@lists.openembedded.org>
Content-Language: nl
Organization: TOPIC
In-Reply-To: <17D1BD0B27726C40.30563@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:208::36)
 To AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS5PR04MB9798:EE_|DB5PEPF00014B9F:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: d067e035-b2f8-44c3-0013-08dc904e7dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|366013|376011|4022899006|1800799021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cUNOMWdCRXJNNDRjQU5CcXRiWmlRR0J2bmtzdnRtN0dNRkxLNnVzUXBzeXVq?=
 =?utf-8?B?cXEyZWdHMzRoM3BNUzNNRzJRcnRSZTlVTTA3L0l4RHBTdkJ1aGVQUUNTSmJB?=
 =?utf-8?B?NENIcVNOc3RVRXJNamQ0bXY2QWhYcXpaSzMwTEZXRW4zdEpQUlJpV0pUajQy?=
 =?utf-8?B?Q3QyRk1HeitTV3BkcXBxK2xCSG9VM0lkREhnTnVhWDVPVzd6aTkwcUpydmVL?=
 =?utf-8?B?YWhQMGVqcURxRXNDWmw1dmNYT3ZGTnZXdDZRSENOc1pxQlZGc2hVbUlBOW96?=
 =?utf-8?B?ZUkzaWowYzFJSU5FMGpQTFE2RWxCTE5GaTIzQWZpU1J2V2ZZeFNVcTJFSytk?=
 =?utf-8?B?UUMrSktUOUVUbnM1bnJNelJ5L041RVh4d1JwODl0TmtPWmtTSWNabFNMWnNr?=
 =?utf-8?B?Z2hLbGlLMUJBNjFJYXBTOEQ2aFhhdzkyNmJlYWMwRjVPMzJyVFVYTWt3eEpX?=
 =?utf-8?B?L1BvU21MK2d5U3R2aUNLYVV6TWVhWTdObXJnU3BXQUw5S2JIbStDRlIyS3Rh?=
 =?utf-8?B?ZlJsbTFXeXhsWitOa3A5L0o4bWp6V1lOek1WRUdnQ3NncjdyOFdUblFFS0dK?=
 =?utf-8?B?T3BoeHNzOW9xaUxzNUZ3L3l5bFg5QjZkUFJNdDVBaUg1TTNsTitXSjdQaU5y?=
 =?utf-8?B?ejhnM2xIenJoK1A5dTlLamFRYTFmQUIrYktQSEFPcnpuQ3lRNHhhaStlRWVB?=
 =?utf-8?B?UzMxUlJiOWMzWkFVM0c1QnU5QVJnRTFoZ3ZMcWdEOGJhSk9uSFlBclN3aWNt?=
 =?utf-8?B?SThBamlKdlNRR2l5NmNHaUlBRSs0NFdlaW40eFdvWGUrOEFEKytWaWhNS21T?=
 =?utf-8?B?TFI5Z0JDZXpYSUx6YUJLRVdVRVFKOXB2aXVEcUZ1ckpTOUhlS3RyVlRwM0Nq?=
 =?utf-8?B?dkNzZWZPNmo4amJUN0ZkU2dTd1JzM2k1b2VmQ25jbnFRMng2RHZhMm1Fcjcw?=
 =?utf-8?B?ZGxwMEJJWHdxRXgrYkpEU0ViWDlOWmtwYVlackVGYlZlWFAvcHNxdnoxLzlQ?=
 =?utf-8?B?UzdPWUM5U3FRd0NBeEtUcml3a2FVWnVyM0FWVlJLenpCWFFuOTBEbno4ZTlI?=
 =?utf-8?B?dEF5b05USUxUSzZLcDArdmIzc1NhU2ttSXNsVWtyYzZ1bWNrM3czNlh6MTBt?=
 =?utf-8?B?NzIvQ0tiLzZxb1FqQmE5NGJoam8rRTNveml0a1k4S09IOUNaUCtFczdjSzly?=
 =?utf-8?B?YmJIUnMxMGI1TTJselU2YzRJTkZobmpKNXhtQStmdGw1MnVDeHJDU25qUGsy?=
 =?utf-8?B?SklRRzUzK245SDdCNENCS1hRd0h3K1BkUDFkTjlpb1hMcStRWGZvbHBDWFV0?=
 =?utf-8?B?TzBnb0VQMEwzb0FJSHY3R2NLdEdjSE1BTGhmZW52TXFTNndFMGFLRzVrSE12?=
 =?utf-8?B?TzhsUVNtSXU1c2grSHdHL01Qdm93WFUyQ2RVaTA5R3R1QUYrc0NZaStQcGtu?=
 =?utf-8?B?N1FhUlhELytQbE5EZWZvVHNzZWZsVlNySmxZMWVFL2R0NVBiWmNtNjFoNGhE?=
 =?utf-8?B?bFlKQU5DQnk0b3kxVk1FYmVCS3dXdUdxZ05GcWJBeUJQQTdKV2g2V05Qd1Vw?=
 =?utf-8?B?em9NcU13YXcwVnplcXhHZEZKNHd0R1ZUQ3d4LzhQWEF3RTZMOEU5Y3NweTVO?=
 =?utf-8?B?TXFjRENHTUIxa1NpaDdjcWxic3VPaWx6TkFXKzh2TXdtM3JoaUpyeDFjWVB1?=
 =?utf-8?Q?O5tx2EiApB/j0umFKxnJ?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(4022899006)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9798
X-CodeTwo-MessageID: 2978ec0f-9770-41e3-b38a-e5990c2298f4.20240619105635@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d9697c1-1365-420a-cc91-08dc904e7b4c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|35042699019|4022899006|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d09hZHBuWnhwSjk4OUd2dEhpZnFqQ09OZU5DSDFua0VjWEdjR2trZHJHZXhQ?=
 =?utf-8?B?MERrSkQ1MzBpN2hIZmFLYkM0a1oxcmVQRlRvUm9SU1pDMnZGM2RYcG1ncytp?=
 =?utf-8?B?ODJ2aEVnMUh2UVQzb01vVG1uSUxEQ2lMSjUvSG0rY3VKYlljSFdnZ3Q1OElo?=
 =?utf-8?B?NCtjeWZVaFNwYmxYdkpyd21jYjdtRTlNL1ZUN25yYTVTV3BBaFlkaEhkOWJa?=
 =?utf-8?B?S3BrYngxWmtYVExGanpzc3R4UFFHcnBrY1g3YUxwRlFjNUp2WFBIUWRwSmY5?=
 =?utf-8?B?WlVBejRxcThkdHhDem1lK3hnNjNyenExKzF5R0VsZFAxejcrMmdZNTFzMXhL?=
 =?utf-8?B?QnZIbUJsdGlYdTBuSkFrN2JUZ3VKY1IvL29DU3NZZ3E1NXZsYzFoZlBxZjl3?=
 =?utf-8?B?N3hHVjdNWm9zNi9hbzc1MjkzQ0tkRU5vdmluT0JiZE93VG9aTE95czI2ekM1?=
 =?utf-8?B?V1VGUFh4Rlh1M2hMNWtodHF5bEJOaVVMOVg2ZU80NjNMVDJwaVZySXZYK3lZ?=
 =?utf-8?B?YVEvNWRhYVdJWjBlb2VDT3ZaVGZ2aUNGZXJmR0lmaDZLTlZYQUpQa21nU2hk?=
 =?utf-8?B?YzNVbktXRGhEcXVHMlh2K1ltVkJkbGJSL2VDdStKNmNVM0xaWUNQbjhJaFJj?=
 =?utf-8?B?OVBTb3BVMGg3M1B0dHo4RnpyaHM5YUhIVEpQMjRZQ05DK0N2TUNOcFFpY1Iv?=
 =?utf-8?B?WVEweUVQUVI1LzZiOWJRNk96VVc1SkRiYk9kKzRhS3JXUGQzaWpvQmhONFRi?=
 =?utf-8?B?ZFJ4Y05xTjBNcUp5elZWRko5TDdGNi9jUkNPanVLUkdoT3Byb0JJeVI0UWdO?=
 =?utf-8?B?KzE3bExkY1NtUk5JdkJYek9KaWlVRXEyMzhJc2NXcGJGcHVuSnpMckFwUHRa?=
 =?utf-8?B?VHlRWTIrM3lJSHBLaGpTd2FJbzZSYm11ZVVLekVYNVUyTXdyelBabzRTN0xr?=
 =?utf-8?B?cTAvTnRpTWROTzdLUHF4VzAyRjdWNHVicUw0UUtHRklVUldhWEZkZ24wa05P?=
 =?utf-8?B?cnNwM0RVOHczN2JtQXBXSjBpaFJFYkwzaldNM01RMkRlaUJLWWN0a1RpQjRT?=
 =?utf-8?B?WWpYMXpjSDArSXBzZ1c1N3E3b3k4OGdUNjkrdHYyMnVsWERKQlVubVRwVGtW?=
 =?utf-8?B?WDR1SmhaVEpSYjhZWjZqSm85WHR2TnpwN3VrK0tKSitySnQ1alI1dTVJOGdC?=
 =?utf-8?B?NGdkckF3NkhrQm5YOVJIMDJvQ0t2Qm9RdDcxeE5lZzcyS1B5RnJhUVN1dS9U?=
 =?utf-8?B?dFBRVk9nWEJ6K1gyL0t1UlJDMGl6anFBZGFldVp4d2d6VXZXRHpxTXJiU0lt?=
 =?utf-8?B?K0g3TWVvYlNGVS9iY2VRTjh5dDVSVDVpSC9EK2h6M0JHWjRrRTQ0OGlaSHlN?=
 =?utf-8?B?OU1JR3lIc2VwbnlxQTdySGhidWFlMzQwZ3o3d1VYVkxTN0Z3NEtERDE0Z00w?=
 =?utf-8?B?dzl6eFZKL25lMXFWUlNIdGl2aHk1dE5taGRYYzN1blhLNFJJVFV3a0tNUUFr?=
 =?utf-8?B?eHczaXhMMVhNMmFNMnNaUVVyeDVVSGxIOUVvajNpL3k0b2FMeHcwc21JdGRN?=
 =?utf-8?B?NE4xc3oxZkZjakYzelZadlJFb0dSYyswQ2Q0K3RLSVh2YU9NanMxRFZrT1Jv?=
 =?utf-8?B?NjZaVGpkSE5ycVIzbW1aSGFDUDhYSjNKTTRPajFhbkkrUEF3bjIwbzVKeWtu?=
 =?utf-8?B?Qk1vcDR6Wkt2TmZObjVMdnlzY2RJTndVYm5BcGYyRVhuT2dMOXJIWFN2MWZU?=
 =?utf-8?B?WU1hWVQ0MGNnWkw0TndqZVVUc0xCMjJjbmVFZjhLSXc4QUtDeStjbldaZDM3?=
 =?utf-8?Q?NVfKKY8iJu/LBLHZhbSTN6GVjucJ1uXcLM77A=3D?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230037)(36860700010)(35042699019)(4022899006)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 10:56:37.2153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d067e035-b2f8-44c3-0013-08dc904e7dd1
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 10:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200908

Gentle ping, any comments on this patch? Haven't seen it in master-next or=
=20
anywhere else...


On 22-05-2024 08:52, Mike Looijmans via lists.openembedded.org wrote:
> kernel-fitimage inherited uboot-config, which resulted in failure to
> run "menuconfig" on a system that has both multiple u-boot configs and
> wants a fitImage kernel.
>=20
> Fix the issue by splitting up uboot-config into conf/uboot.conf that
> only contains the "harmless" variable settings, and require that in a
> new uboot-config class which contains the Python code to do the U-boot
> specific settings. Require only conf/uboot.conf in kernel-fitimage so
> that it has what it needs but doesn't break.
>=20
> Fixes: f9e834e31788 "meta: introduce KCONFIG_CONFIG_ENABLE_MENUCONFIG"
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   meta/classes-recipe/kernel-fitimage.bbclass |  3 +-
>   meta/classes-recipe/uboot-config.bbclass    | 80 +------------------
>   meta/conf/uboot.conf                        | 88 +++++++++++++++++++++
>   3 files changed, 91 insertions(+), 80 deletions(-)
>   create mode 100644 meta/conf/uboot.conf
>=20
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
> index 4b74ddc201..b941609cc5 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -4,7 +4,8 @@
>   # SPDX-License-Identifier: MIT
>   #
>  =20
> -inherit kernel-uboot kernel-artifact-names uboot-config
> +inherit kernel-uboot kernel-artifact-names
> +require conf/uboot.conf
>  =20
>   def get_fit_replacement_type(d):
>       kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-reci=
pe/uboot-config.bbclass
> index e55fc38b7c..bfa9af7f49 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -13,85 +13,7 @@
>   #
>   # SPDX-License-Identifier: MIT
>  =20
> -
> -def removesuffix(s, suffix):
> -    if suffix and s.endswith(suffix):
> -        return s[:-len(suffix)]
> -    return s
> -
> -UBOOT_ENTRYPOINT ?=3D "20008000"
> -UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
> -
> -# Some versions of u-boot use .bin and others use .img.  By default use =
.bin
> -# but enable individual recipes to change this value.
> -UBOOT_SUFFIX ??=3D "bin"
> -UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
> -UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}=
"
> -UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUF=
FIX}"
> -UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
> -UBOOT_MAKE_TARGET ?=3D "all"
> -
> -# Output the ELF generated. Some platforms can use the ELF file and dire=
ctly
> -# load it (JTAG booting, QEMU) additionally the ELF can be used for debu=
gging
> -# purposes.
> -UBOOT_ELF ?=3D ""
> -UBOOT_ELF_SUFFIX ?=3D "elf"
> -UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
> -UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
> -UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
> -
> -# Some versions of u-boot build an SPL (Second Program Loader) image tha=
t
> -# should be packaged along with the u-boot binary as well as placed in t=
he
> -# deploy directory.  For those versions they can set the following varia=
bles
> -# to allow packaging the SPL.
> -SPL_SUFFIX ?=3D ""
> -SPL_BINARY ?=3D ""
> -SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
> -SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
> -SPL_BINARYNAME ?=3D "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d=
.getVar("SPL_SUFFIX"))}"
> -SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}=
${SPL_SUFFIX}"
> -SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFF=
IX}"
> -
> -# Additional environment variables or a script can be installed alongsid=
e
> -# u-boot to be used automatically on boot.  This file, typically 'uEnv.t=
xt'
> -# or 'boot.scr', should be packaged along with u-boot as well as placed =
in the
> -# deploy directory.  Machine configurations needing one of these files s=
hould
> -# include it in the SRC_URI and set the UBOOT_ENV parameter.
> -UBOOT_ENV_SUFFIX ?=3D "txt"
> -UBOOT_ENV ?=3D ""
> -UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
> -UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
> -UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
> -UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SU=
FFIX}"
> -UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
> -
> -# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux=
.conf
> -# to find EXTLINUX conf file.
> -UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
> -UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
> -UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR=
}"
> -
> -# Options for the device tree compiler passed to mkimage '-D' feature:
> -UBOOT_MKIMAGE_DTCOPTS ??=3D ""
> -SPL_MKIMAGE_DTCOPTS ??=3D ""
> -
> -# mkimage command
> -UBOOT_MKIMAGE ?=3D "uboot-mkimage"
> -UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
> -
> -# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
> -UBOOT_SIGN_ENABLE ?=3D "0"
> -
> -# Arguments passed to mkimage for signing
> -UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
> -SPL_MKIMAGE_SIGN_ARGS ?=3D ""
> -
> -# Options to deploy the u-boot device tree
> -UBOOT_DTB ?=3D ""
> -UBOOT_DTB_BINARY ??=3D ""
> -
> -# uboot-fit_check_sign command
> -UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
> +require conf/uboot.conf
>  =20
>   python () {
>       ubootmachine =3D d.getVar("UBOOT_MACHINE")
> diff --git a/meta/conf/uboot.conf b/meta/conf/uboot.conf
> new file mode 100644
> index 0000000000..7e17d49d20
> --- /dev/null
> +++ b/meta/conf/uboot.conf
> @@ -0,0 +1,88 @@
> +# Handle U-Boot config for a machine
> +#
> +# The format to specify it, in the machine, is:
> +#
> +# UBOOT_CONFIG ??=3D <default>
> +# UBOOT_CONFIG[foo] =3D "config,images,binary"
> +#
> +# or
> +#
> +# UBOOT_MACHINE =3D "config"
> +#
> +# Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
> +#
> +# SPDX-License-Identifier: MIT
> +
> +UBOOT_ENTRYPOINT ?=3D "20008000"
> +UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
> +
> +# Some versions of u-boot use .bin and others use .img.  By default use =
.bin
> +# but enable individual recipes to change this value.
> +UBOOT_SUFFIX ??=3D "bin"
> +UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
> +UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}=
"
> +UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUF=
FIX}"
> +UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
> +UBOOT_MAKE_TARGET ?=3D "all"
> +
> +# Output the ELF generated. Some platforms can use the ELF file and dire=
ctly
> +# load it (JTAG booting, QEMU) additionally the ELF can be used for debu=
gging
> +# purposes.
> +UBOOT_ELF ?=3D ""
> +UBOOT_ELF_SUFFIX ?=3D "elf"
> +UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
> +UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
> +UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
> +
> +# Some versions of u-boot build an SPL (Second Program Loader) image tha=
t
> +# should be packaged along with the u-boot binary as well as placed in t=
he
> +# deploy directory.  For those versions they can set the following varia=
bles
> +# to allow packaging the SPL.
> +SPL_SUFFIX ?=3D ""
> +SPL_BINARY ?=3D ""
> +SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
> +SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
> +SPL_BINARYNAME ?=3D "${@d.getVar("SPL_BINARYFILE").removesuffix("." + d.=
getVar("SPL_SUFFIX"))}"
> +SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}=
${SPL_SUFFIX}"
> +SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFF=
IX}"
> +
> +# Additional environment variables or a script can be installed alongsid=
e
> +# u-boot to be used automatically on boot.  This file, typically 'uEnv.t=
xt'
> +# or 'boot.scr', should be packaged along with u-boot as well as placed =
in the
> +# deploy directory.  Machine configurations needing one of these files s=
hould
> +# include it in the SRC_URI and set the UBOOT_ENV parameter.
> +UBOOT_ENV_SUFFIX ?=3D "txt"
> +UBOOT_ENV ?=3D ""
> +UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
> +UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
> +UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
> +UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SU=
FFIX}"
> +UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
> +
> +# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux=
.conf
> +# to find EXTLINUX conf file.
> +UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
> +UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
> +UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR=
}"
> +
> +# Options for the device tree compiler passed to mkimage '-D' feature:
> +UBOOT_MKIMAGE_DTCOPTS ??=3D ""
> +SPL_MKIMAGE_DTCOPTS ??=3D ""
> +
> +# mkimage command
> +UBOOT_MKIMAGE ?=3D "uboot-mkimage"
> +UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
> +
> +# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
> +UBOOT_SIGN_ENABLE ?=3D "0"
> +
> +# Arguments passed to mkimage for signing
> +UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
> +SPL_MKIMAGE_SIGN_ARGS ?=3D ""
> +
> +# Options to deploy the u-boot device tree
> +UBOOT_DTB ?=3D ""
> +UBOOT_DTB_BINARY ??=3D ""
> +
> +# uboot-fit_check_sign command
> +UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199689): https://lists.openembedded.org/g/openembedde=
d-core/message/199689
> Mute This Topic: https://lists.openembedded.org/mt/106238663/3618446
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
ke.looijmans@topic.nl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



