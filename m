Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC71CC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 13:18:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.72830.1718975902569214665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 06:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R3wMozMe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R3wMozMe;
 spf=pass (domain: arm.com, ip: 40.107.21.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KFFA6YyE97UXjySKQUU51YIa9/JgKcicFK/P2V6AFc30m5Cal4gr+a3fS7nGTA8DxnmIbI08ZO2sZM6MBAvFmnUV68vqzVxggXhzQvv0vn/KGyaThAQxyvHdvgNVK6S5MUerU23OkC8+CDnUg/KtZxNmjKcQTNMd7pSLq+w0iykOFzW2X2tAuDEi7xi6SJWzNdIjL0jh7swhIEqZJX4MDlh5t/ZvSEXeQpPZdooPE2X98YFQgClRhLwZqIwpPhkIMynGrd05mCkybaydbG3UL6a5Uf45Wh8gAVsajkUFUB5NjYFSfZQ2jWQvbUdhj7eh4bNOsLpW5fzU8Uzv5dGU9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNSF5bqu0TTokES/eQAPu5iCCYy3JcSEcW0c98D8PMs=;
 b=Jo+NvVPoU1rvbEQBh36N4BtSXElgiNR0pp9NLTk7D9ATJ7QxCW2uJVTPyiULL85diQTjyjwdiQU3JjgsTeK5/S3RWwHJWtHWfxS405ENQu9jcA9fWMbrIpXhNIb/7FtzW4wgmGVZm2o6JLfUc/jlPPCrfAC0Jo28ZVT5t/fgRNzkMvRHVtQJoeMtKagVdHXkY2Ai8TEwklpKNguXFUEeC/6PE3qWiIf1qvmSKNi7jBy5tf0gvrrHHdeNpID7bNkJAq21EtP1kvJXrqNOxlDKMszFx9Hskt0VG8vCAwGfnaIzOPo8qAK5gCyBPrcX0Zp6geyyVzyGM6ZDITuYpBamQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNSF5bqu0TTokES/eQAPu5iCCYy3JcSEcW0c98D8PMs=;
 b=R3wMozMe28k0+oLaiRJK1xDC3BCnx0bcBCqKcZEMGUgHilEWqiN8GaAxaYHWDEN+HA+wkJ4k+8UVcGh4E4fkWyO2X/RfO3Xeu4I+1TMPgFe+2afg28hinziarvyDgMiHIRg3acfCVHSd7q70lZ1+PZ2gtpAOmeUcebShrAEq2io=
Received: from DB9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:10:1db::11)
 by PAWPR08MB10307.eurprd08.prod.outlook.com (2603:10a6:102:366::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 13:18:16 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::cc) by DB9PR06CA0006.outlook.office365.com
 (2603:10a6:10:1db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Fri, 21 Jun 2024 13:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Fri, 21 Jun 2024 13:18:16 +0000
Received: ("Tessian outbound 01519d7ebfdb:v339"); Fri, 21 Jun 2024 13:18:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f207ea255a20245
X-CR-MTA-TID: 64aa7808
Received: from 9a0f834a77f6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43510889-3D11-4703-8E3B-8B81E093178A.1;
	Fri, 21 Jun 2024 13:18:09 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a0f834a77f6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jun 2024 13:18:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyhW/5wUZGS575gxXnxqeA52hqZQriBfEL7WqLYoCJji4g9603Id9MHjsPp9wnZdy7fog9TtUpzOBgYsO+uWRRlhgxSrkQibY3n48aXWmDQ5bVahu1Z1aI8ROmN9l722jRGj6O+//GFjaSWLij9qIkTrWc4hZhf2XXWE7zg6+DfUP0Y6x1sEp+SgUQl1+ny3Mw4FuOT4Pzdjk/hTKWNv3Q3HLRr4SMev6xOLaZYZV5mNrH9yPMyRaGq2WGgd5O20/Nk6e5sqaPBSgKheGCei/YeCnHvN1weS+vOGQsQ0ggIDxNapTiwOojTl0d5HWkmNrtGckfoUHARVjjrqRRtRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNSF5bqu0TTokES/eQAPu5iCCYy3JcSEcW0c98D8PMs=;
 b=OeMTE9ElxSp+rNmCmH4DhwcEtMjbxx2Y0CSeero0ciz7EOt4FMLp9vnwhqjjvdPWpbOxb90fW1CjdoFz8v9bM/SviLyNu3PlFBR27MYxmCxiDBVtDxoD2zuarjUROb6kXjiAonvVgcqBeUHqOo63EIhyJOCItukUDpYCMyHBnGc3RfisVw/6nuZObrxAFErgUgpa4hZhnYmMPgOqWOltTJaarIFRXmHFX6qWujYJaOWa0G5Q65pRHVhnQHG8o1sLU+XRvnJ4/cf6p8hLtnNmdkkeaaW6/kKLMMTiRLcLgkwOVMPt2OffpvybXDFUeFDiNBJTZkFcB+wbaJ9rkSZt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNSF5bqu0TTokES/eQAPu5iCCYy3JcSEcW0c98D8PMs=;
 b=R3wMozMe28k0+oLaiRJK1xDC3BCnx0bcBCqKcZEMGUgHilEWqiN8GaAxaYHWDEN+HA+wkJ4k+8UVcGh4E4fkWyO2X/RfO3Xeu4I+1TMPgFe+2afg28hinziarvyDgMiHIRg3acfCVHSd7q70lZ1+PZ2gtpAOmeUcebShrAEq2io=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9210.eurprd08.prod.outlook.com (2603:10a6:102:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 13:18:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 13:18:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Samantha Jalabert
	<samantha.jalabert@syslinbit.com>
Subject: Re: [yocto-security] RFC: CVE check standalone (introducing
 yocto-vex-check)
Thread-Topic: [yocto-security] RFC: CVE check standalone (introducing
 yocto-vex-check)
Thread-Index: AQHas2PO+izlrNR2Bk2a5POUhwCtNrHSVB0A
Date: Fri, 21 Jun 2024 13:18:07 +0000
Message-ID: <3067A608-B538-438F-B270-5A6F2234C800@arm.com>
References: 
 <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9210:EE_|DU2PEPF00028D0A:EE_|PAWPR08MB10307:EE_
X-MS-Office365-Filtering-Correlation-Id: 734060fb-9d97-4291-15e4-08dc91f49c9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TTI2bHBVcTRaczdiQVZYVWdlemllQThmVXlLYlg3TXZPeUdmZ1lsNHNZRmNZ?=
 =?utf-8?B?WjVKR3RvT3ZZRU55SE14cEVRU0RZZytjVUJldWY4cnAvNTgrZ2M3MEF6eWY5?=
 =?utf-8?B?Umk4cWRVeEMxNm43aTExeDNsZWtHL1ByanJ6My9TbEFZd0cyenBKNC8rbmFI?=
 =?utf-8?B?UVlrVjZwTE5lQnBpZkg5QnV2anZ6Z1ZzS2ErakJ6YVAwSmFUaEtzelVyalBl?=
 =?utf-8?B?eHV6Q0F3Z0pVVjdIWlN0MDM2K01qdkVLSTFVZ0gxZ05FdTlIeWoyZ2UwMXpN?=
 =?utf-8?B?RGJLckdtVDZNT25MRmhZcXFsUm9FdzlqL2tXL1FaU0E2ZUs5K0cvblhCVzkw?=
 =?utf-8?B?Snk4NTd4VXMvNTdaL28yRnhqM0cvRGxOanFCRzd3bUd0WDBFRXlEdlFiN2V5?=
 =?utf-8?B?MW40bHlRc3d0ZGtZNnVkWE9LVkVSNWFOSVQ3WlNmNmJuV0lzV1g5KzFhWGRE?=
 =?utf-8?B?SkpqVFBYT0ZSalhFY2JoUE9xdjM2SWZUYUswVlJ1amsvV1QzYWg5ZktUdUQr?=
 =?utf-8?B?Ukk5TU5yd3JWQkhyNGJJNWNxOUFiaW5qSi9oMlhxZVF2OFQrOEIwamdMSDJo?=
 =?utf-8?B?ZnRGL1hleUpXMWFtMXBCMHlGdWRFdWkvRmVQYkJUa1JTTEhoRjY2T1BhcWFK?=
 =?utf-8?B?TmhVQVYrV0NQOWtNbzZVcUVkMWVyaXIxc0dtRXFVRkpwWFFSQUNubnppOFdx?=
 =?utf-8?B?aW1tR0pLNXYwWGdOM2h6NFJYSnJNT3JUQmVRNERLemt5cnNOOWFJelBTT2h3?=
 =?utf-8?B?MTcyTWw2OGplbk1xUnhGekoyRUJveUdoUU9JL213V3loZ2NhbmZvYlJxVGdk?=
 =?utf-8?B?UzZlUGF4WWtIa2Q2d29yUnp5cVdRWW9FN2luMFhYeHlVT29mNGo3dW9kRm01?=
 =?utf-8?B?Q2NZUmNJQitVYnFhWnVleWpxc2pPY3dMRXJsOEF0RHhmbGxrYzJndEpyTFpR?=
 =?utf-8?B?WFE2bEpQaEIwNjZoQmhTTXpGZ3FWcnVRL0VQM0N2U1JiT0xSZ2lPUGYyL3dM?=
 =?utf-8?B?aG1ncWl1WUVYcmxKTDZDekFwNmxTYllrVTJnR3ZBVjAzdlRkcGFFcDB0OVpi?=
 =?utf-8?B?T3hkdmpsQ0tUR3lWSmFhQ0xSV2l5ME5qOU83UHQ0YXI0My83NUkycjM3MUpy?=
 =?utf-8?B?SjlqamYzTUZqUU5JYlZCM0hURHJhdFVBNjVMamV1eDQyTEZIM01DMzlnR3Zk?=
 =?utf-8?B?K1FuUGVTQnhYcGNMbnZ2MDgrZ0ZWSUR5WERvSHljVVpwcFA0YXV3UmpmN3Ny?=
 =?utf-8?B?N1JKdlNxaVdNYUJrSFFuOFpScUJiOFdXQTMxTCtsZGZQZDIrSmhDckhnYXB4?=
 =?utf-8?B?Y2Zmck9CaE1VaE8ydkpOMkk4L3M2K3lUTThta1pJbFhsbjRYTVpUZHZVRTNi?=
 =?utf-8?B?OW5aTUsrTElKZGVBanJ4SW1udlVmWkZPbENveVlVUUF4L3hYTkh2cWprS0VX?=
 =?utf-8?B?STAzN2lPdTdYczIxNmpaMjNpWlVUV21RS0Q2M3NVZkV5dFZWUndiT3V5NDc2?=
 =?utf-8?B?TjU2d2ZPb0FiNUJIcXg3UVhqRUVoTXBoRHZ6YThEZ3ZndmFCUjVabElId2Zh?=
 =?utf-8?B?dlJ3T1owMFY1MUFaaG52bitwS3BDclc0L0l3Rnh2RWpXWHNlTnNEU3ZVb0hx?=
 =?utf-8?B?VmdMVndXcEVuV1pvRUVYSFF2M3ZjdzQxRitUc0pxcEF5SXZPUHJWQlVLVnpK?=
 =?utf-8?B?anRoRnVGWWNYSHVKZWlDWGovN0Vpa2Q5M2F4UTFJeHI1Z254cHg4Wkpnd3BX?=
 =?utf-8?Q?02WG4u6au7rFbzlksRuCPXmbDCPMWQVQWN+TAfh?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <13957EABC724AF4EAFB96D0355C6D6C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9210
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1fbe6aeb-6c98-44d5-b3cc-08dc91f49746
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|82310400023|36860700010|376011|35042699019;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0NZZUYwQzhpNDB2WkNtL3hoZXNkS2RMVmhhYVFyY2p3aUdQYzd3KzcrWFZx?=
 =?utf-8?B?alpTRVNWaDVlQVAyWmxWVHU4RWJWTTFrQlR4Z0JwemZGMnhTMHp1TDdwZi9v?=
 =?utf-8?B?YjIzWmdKN1NUV2ROK29ZdUpONGZJZm56djU2dWRuOTBlczZpR2gxNXhQQlM0?=
 =?utf-8?B?SXlBVktaSjN4Q2RIKzFyOFQ1UWxJTTlTL2x3NVlsZHdpLzBOeGEwVGhJRml0?=
 =?utf-8?B?WUhCaXBDRGdDNml4WENYMVk4eExlSS9NbFFpZ0lybmdEUzc4U1FRQ3ordkdL?=
 =?utf-8?B?aGp0TGtLTGptb2tWbTBibWw2cmFuQXZEUyt1eG9oQTJaeW9qWUFtbUZuSHlE?=
 =?utf-8?B?RzhQVlM5TFlkcWl0Nk10K0NwRm82OGtWRU4zY3p6cmpjZTRVRHpuRHVieDhw?=
 =?utf-8?B?WUlKb2oxdTdiM1JuUXErTmg5VGxNenVSTXNCckRkd1FOVks1RXhBdmdVbjZK?=
 =?utf-8?B?eTNOU2liS2d4YnlHdjFzUE5PZms4NEhWY1FRMjNDV0lUYXFTcmpMczZpbVVB?=
 =?utf-8?B?anpXN081dXRXV1VRV3hmbFdyUDFvQ0pJMDUxaHFhOTNKaEE0K29SRG9JRmdY?=
 =?utf-8?B?NS8zTG9xNUR4UzZlTWlLUkhtVGtTNFpiSDAzelYwd1VxSG8rMlIrNStrSzh1?=
 =?utf-8?B?Z2VMV0pyUUVzNGZpd1RDUlJMbVFtWEFiLytoNkEyWklMaGRkQlo0QjEvTk9i?=
 =?utf-8?B?aXpueDNSS1lSZC9idkdHZmJKbHZmZkdFMWZyZkdaYmw5d3FFczJNZHBMQk1Z?=
 =?utf-8?B?Z3dkdTNjSVNkMCtvRGhBaVVWbnBBR2VGTXUxY1hvUkFzQWRadzk3QlNkakxl?=
 =?utf-8?B?TXNHYWpEcWF4aDhVSGV5WVZ1UXk5Z3VVR1pZQU5lMGZrSWdockRKeGtXWmdr?=
 =?utf-8?B?UHljT1hCNHplRFJ1SmNrVHg1WnA5bTZBb0x3VHFxbGtLQzl1ZnRvOFkxSTE5?=
 =?utf-8?B?OVZEN3RGTnZHOElUL2hsQjdRWWdLTjAxVWQybWs2TVpxQXRodEt5MWdOY1NT?=
 =?utf-8?B?L3dnT2p1Q0hBMjZUNURzV2dLQ3lwaVRxREpoaGtwU2FndHh5Y3ppWm5yeEZz?=
 =?utf-8?B?YVVBeUlrSWJYRUJ2YjNveVBtMUVEcW9PTUNsaTVkZExIekhWN3R0ZnVvYWYr?=
 =?utf-8?B?OWxTNklzNytwdFQ2Q05VTmpyM1FUY2pEYllGaEY0MTV0UVBvK3lZaWpHdmdu?=
 =?utf-8?B?R0dSdTd5dENTb1pDM0czRmtIdUJYb25CVnZCK0wxWlBiMEtPNlQyYVYreEhY?=
 =?utf-8?B?WnEvby96NkZ4Z3FsSjEwbStyMzRrQTdmM1pSMHlOUUFsTDB5OERMTUgyeWRG?=
 =?utf-8?B?UGthVXNJNkdSamVvS1NRaUIySEdiejd1YjRCTXMwVHJrN25mdDBHTjR2VmUz?=
 =?utf-8?B?NzhVWGtJeUw1NVowSk5IaklQNWJHRjhHQzlSbDZvMEovdks2RFAwSnE2SnFm?=
 =?utf-8?B?TW53aUNkT0ZRWGZmbWVVbXpqU0x1ZWhRVzFBU2RwcWgzVEJQTGo5bWx2R25X?=
 =?utf-8?B?SldoN0I2eklmamRUbzFjMWRpaTZiT0tOVUxDdHZwcmgyb2drNkppaVkwUzV0?=
 =?utf-8?B?QUZBWEVDd0hXMUQzVHV5b1Nxa3ZONmxPR3l2am0ydDlSOFBiRXdzeWxxVDZL?=
 =?utf-8?B?dmtreDc3QmREVjBWekVUeHdpc24rM1ZRd3FqVVh4VGZyQWhrWjJMaUVKanRl?=
 =?utf-8?B?THZ0bzFCbU9nTGdWWlRiTDJVNHRwcnVuemx3SVZ4QnNjVm11ZkJST1U1dmhZ?=
 =?utf-8?B?bThSZmZXNHJJWmhGSm4xaVhNVWpYR09SWnZhUGcrKytObFp1VWVPMVJGcHRS?=
 =?utf-8?Q?JFNsHG6tLfoLVgEf0/btHtlvdJBmrULdauYuE=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011)(35042699019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 13:18:16.4846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734060fb-9d97-4291-15e4-08dc91f49c9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 13:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201023

SGkgTWFydGEsDQoNCk9uIDMxIE1heSAyMDI0LCBhdCAxNTowNiwgTWFydGEgUnliY3p5bnNrYSB2
aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cnliY3p5bnNrYT1nbWFpbC5jb21AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiAgSG93IHRvIHVzZToNCj4gIDEuIERvd25sb2Fk
IHRoZSBkYXRhYmFzZSB0byB1c2U6DQo+ICAtIGZvciBOVkQsIHVzZSBjdmUtdXBkYXRlLW52ZDIt
bmF0aXZlLnB5DQo+ICAtIGZvciB0aGUgQ1ZFIGRhdGFiYXNlLCBnZXQgdGhlIENWRXY1IGdpdCBy
ZXBvc2l0b3J5OiBlaXRoZXIgdGhlIHVwc3RlYW0gb25lIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9D
VkVQcm9qZWN0L2N2ZWxpc3RWNSBvciB0aGUgb25lIHdpdGggT0UtcmVsYXRlZCBmaXhlcyBhdCBo
dHRwczovL2dpdGh1Yi5jb20vbXJ5YmN6eW4vY3ZlbGlzdFY1LW92ZXJyaWRlcyAocmVjb21tZW5k
ZWQpIA0KDQpUaGlzIGlzIHRoZSBiaWdnZXN0IGlzc3VlIHRoYXTigJlzIGJvdGhlcmluZyBtZSBy
aWdodCBub3cgLSB0aGUgbmVlZCBmb3IgYSBmb3JrLiAgV291bGQgaXQgYmUgcG9zc2libGUgdG8g
bG9hZCB0aGUgY2Fub25pY2FsIGN2ZWxpc3QgYW5kIHRoZW4gYXVnbWVudCBpdCB3aXRoIGV4dHJh
IGRhdGEgKHVzaW5nIHRoZSBBdXRob3JpemVkIERhdGEgUHVibGlzaGVyIHNjaGVtYT8pIGZyb20g
YW5vdGhlciByZXBvc2l0b3J5IHRoYXQganVzdCBjb250YWlucyB0aGF0IGV4dHJhIGRhdGE/ICBI
YXZpbmcgYSBmb3JrIG9mIGN2ZWxpc3RWNSBhbmQgaGF2aW5nIHRvIHJlYmFzZSBpdCBmZWVscyBs
aWtlIGl0IHdpbGwgbGVhZCB0byBwcm9ibGVtcyBhbmQgYmUgZnJhZ2lsZS4NCg0KQ2hlZXJzDQpS
b3Nz

