Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445E1C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 15:39:53 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.81])
 by mx.groups.io with SMTP id smtpd.web10.22006.1713886789012137659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 08:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WWS/ydH0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WWS/ydH0;
 spf=pass (domain: arm.com, ip: 40.107.105.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hx7QR54D8IwT4EZynrgk/rwEs/XuVD6nByN6MdcMU99+x4BrqmDCe1R1mppIIx0m4OkG5Ai1KaJuSe/Anhru0cNHUuf7a4a+OqjuZeeeGo9JoLjSkdusVAgtK5I22pTOqhB49DNC9bTLeAaWqHbuHaHftcNkw1batAt+kFSRRIwHIV/+JC+XUz4hG6fqs7UmKud2Duxy4RrIo/uJvq+zLb5TVuiwtwl0ODuSiMNCPpsQ2AsGarA4o0ug3R+elwN68UdWtjDWz3mwVbtn1uLSfxVrNAr3PXX7P0zNaLP8XP+fs5KFH6pP9lIKDNkCPhIoFmefyjeGXY+LRCViz0zlBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3j0hQj0NmO3WQXsqZhqd1hf3C9xfH4gbitwyD5mk10=;
 b=ItMBZ9dqwSGmJhTr8ZH0DS+Ne59OLqH96ADxy915CV6DghPh6HR+AMNFbfQ5CQT+ORyK7uC9P4K83UADZaxDdn3EnXMyYKWl75K8FewdzLFGIO1ctm8FYRBpKdJD7xswbLlELj73P0Y3P600HtOngKVrmky3FEkLvxkQ154je+HZp6cXwLtHcugl8M0XnVF1UtJHqXEN9ikJ5WaKAeZ4BLF/LQ98mm4qayNF4qXUkICjdFlnRh3/lI7qYzYUqgikmjvaYyy73BOWCL6UjMcdXWIjh4YkMg1qotaMBcUYJDdm7OgEbKIRqnUxESl6ujf43y34tYx7loXQxFy+v+uSvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3j0hQj0NmO3WQXsqZhqd1hf3C9xfH4gbitwyD5mk10=;
 b=WWS/ydH055EpFmmmN8UDiyUfHt0QqDHvR8EL/jVnSQkvuH4drsJ4vnTawyFwF6tEaSvpbcVuukG1kSrihuf/Z39eA89A7Q3GBVNbLHy2y85QpNTkd4aKaMCDUQlcikV8XfYFIJ9Q753igZ6CLgQklzA4Q8oVkEao7lVzkB87yFY=
Received: from DU2PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:10:3b::10)
 by GVXPR08MB10613.eurprd08.prod.outlook.com (2603:10a6:150:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 15:39:45 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::69) by DU2PR04CA0005.outlook.office365.com
 (2603:10a6:10:3b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 15:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 15:39:44 +0000
Received: ("Tessian outbound caed45120527:v313"); Tue, 23 Apr 2024 15:39:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 213d1fa3753af84d
X-CR-MTA-TID: 64aa7808
Received: from 21299136ead5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5158A6A-D468-45AA-BCFC-FF2D2EA146EC.1;
	Tue, 23 Apr 2024 15:39:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21299136ead5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Apr 2024 15:39:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8q+UYRmIVb1/Z7PQcNLnOOTQS3tLIFVLsjoeBSAZP1Dp/1khJ7cTSB7HELRgZb+Ls58AkXe7FQOqs0vY45wd6QjzEaLFsNWIV61P4+QStVe+aME6aGLEYgytoVf5Fqaoa4hsAfUJwDI57fLiCKpR/F3aQ4cp/IJSdxhigE5TAgvvt/4jRh1MrtJdQ+aAvjIN+X2HMXkOoXxuXj7ogkPsixiSVaSBfX3ZNZ359THAxnf8POemwoqoNAVLHgekImw7zL0x6gsPHag+aKPmk3vCjmIlgbajp5qI3NNHKI+x37RHnkTSUxcmfqRjnBW3VvZj6zTnClQVmxY6wMpc7xE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3j0hQj0NmO3WQXsqZhqd1hf3C9xfH4gbitwyD5mk10=;
 b=BU/mLK43SM2FTPi9neTAuw4wbECJXPBACThW6FWwVBTHpKYgqFuRcUabPaLqANxgRKT87cOAIg2EmxEvtAJLXtYuSdBfoXrbWRbt/lCZInwv633V9WdXlSQvhfbc8F4Q2W65Gr3HmusPiPT6i76D6YVTRpK0Y+nPXUWqSPm1mv+/QhLqnOawVIlXVia9BTPTAhan7wuBUVdLo9eN7iAKrawo2O2bh5cVX+E3zn0e+P0MP0EyNkjig8LdKl2CqzT50phYty5d1WAlK/FEtSoaZWPEPnsc2s7Iphqg6+EYv9zcYY0fH/Ep3uPzaNdDrBZGVXLSnkDqblf/8qnRp+P6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3j0hQj0NmO3WQXsqZhqd1hf3C9xfH4gbitwyD5mk10=;
 b=WWS/ydH055EpFmmmN8UDiyUfHt0QqDHvR8EL/jVnSQkvuH4drsJ4vnTawyFwF6tEaSvpbcVuukG1kSrihuf/Z39eA89A7Q3GBVNbLHy2y85QpNTkd4aKaMCDUQlcikV8XfYFIJ9Q753igZ6CLgQklzA4Q8oVkEao7lVzkB87yFY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8456.eurprd08.prod.outlook.com (2603:10a6:20b:55c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 15:39:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 15:39:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core] [PATCH 27/34] python3-setuptools: upgrade 69.1.1 ->
 69.2.0
Thread-Topic: [OE-Core] [PATCH 27/34] python3-setuptools: upgrade 69.1.1 ->
 69.2.0
Thread-Index: AQHafxYqSS+GLSmlcEO90tS98eacuLF19+UAgAAyw4A=
Date: Tue, 23 Apr 2024 15:39:35 +0000
Message-ID: <0ED161DB-7848-46AD-9081-ECE97E040C6B@arm.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
 <1711413292-3025-27-git-send-email-wangmy@fujitsu.com>
 <B22245BC-4659-4C7A-AF05-26E3C7518023@arm.com>
In-Reply-To: <B22245BC-4659-4C7A-AF05-26E3C7518023@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8456:EE_|DB1PEPF00039234:EE_|GVXPR08MB10613:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ec1a3c-9548-4292-9412-08dc63ab9990
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZjNkaGxyQ1QwaGZFcHNaQzB0Qi9oVm1reGg1c0ZxK281aHZkZ3dkOWhWR2F5?=
 =?utf-8?B?UURhN0xQUFZTV3U1U1RPTUtJRmNKTDltYTNXZE05cHRacFZIclBuYjVIZ3Nj?=
 =?utf-8?B?Z05sL1doZlR0bkRxbWtOZnBQbWo3UkRNMUZkT21lK2NXTjdPaHRqaWdWeldU?=
 =?utf-8?B?aVNwU1ZOMkNyTnBVVGJYWjhPWjZlbm1WaElFT1ZGWCtDN0JOTnM3b21adjFh?=
 =?utf-8?B?ZTV6cFNoVDV5RCtJUVN4Y0N6NXgxRGpzNWgrbmJLZFM1UFVsL1ZkT043QXZ5?=
 =?utf-8?B?azQzazU0VjVuYktsU2lnR0lQVHJ6UysvbUE5c1R3UUFiWHBVL2hxdjVaMS96?=
 =?utf-8?B?cDg5VTM0bkovSEZnS045T2VHb1ZYNmN3bnJCdU9hZlF1ellIZ1M4a1NuMWRD?=
 =?utf-8?B?M3pTckdRTlZ6VjdsYzVKSDNDREFXRW9aaXlOeExaVjlBalVlTmJac0tLRXk3?=
 =?utf-8?B?WlprLzhwckk3NC9GRHdlMVBDamdZVkR3STlRUDlnRGhVVUVEdVFpdTVSSDRK?=
 =?utf-8?B?dDZsK04wbHVMdTNKb3hRalc2dWJldGJYUVRIdnIrYkFRTlBCU2FFaE42ZEg0?=
 =?utf-8?B?elNkZmsvVUx4ZXZRTHJvcmRIZEV2N2dENTg3T3BvVnJOVTRlVUdjWElaY3R3?=
 =?utf-8?B?TXluMXUwcktDYUM2ZndUcC9CL3JPdVJZdHE2WkF2WVlhTDg5dEQ1U3c5M3cw?=
 =?utf-8?B?S2lzbmxWYXcvOStiWE05ZUxiL09DbWtDRlgydEl3N2tpSHF4aDU3cys2dDcv?=
 =?utf-8?B?aENwVXFCRndSR2ZFV0VQSVNOdVBiUTVZQmsrbDM5VnZaTVdPZCtjQ2lad1lU?=
 =?utf-8?B?NDU4R1hSeE53aWN3SVFJclRiNkVsaFJ2NVdwK00waVJ4c0FzT1JqYVNJQjBW?=
 =?utf-8?B?VG5yeVBwQXJ3alFCdWZYdmF4VHhtY3FpYTVCMGpNb2txN1k2YWtsQzFSK2Q1?=
 =?utf-8?B?ZTI5NTZxS2hvK1gzWHNQRy9ubnYzZnRSOEpDZTFlSGFESHplQnRhSGtqcWdk?=
 =?utf-8?B?NmY3L21ua1luMk8vWU9CekVnSmpZVmJ5VzVmNTJkRWJ2amt0UlByNEI1R0tN?=
 =?utf-8?B?YmltR1JFVG9TcDlrT3pscDdwUm9wSE14Qlp1NkJyK2ZvYnJjTTN1bktCbUZl?=
 =?utf-8?B?eXZUSjlYaDJYeEFxYjVKaXgvOUpWTlJoOUxNVHloNmpjdzJBd2JuWHk1aWFW?=
 =?utf-8?B?UnUyalErdkFhWXlXZDBsUkEzSVF4YkM0MGtSNW4xSUVPVDVndlA0TzRLT2JX?=
 =?utf-8?B?V0RPMEcwaTY5Zll4L3BlZkF2ZFJhMVg1NTM4ZStnOC9DTFAxWkZaN3J5Syts?=
 =?utf-8?B?dWgyb1hOcE1xdHNDMUQ3T3JOd21zUVZ2ZTAzQWhCUUI2T2IxVU54bUxUbnNW?=
 =?utf-8?B?NEtOV3FaTWhrRFNldEgrZ2ZjV2l2c09oQjI0RnhZY1o0Smd0eWMrd0tQWjAy?=
 =?utf-8?B?RTVHaWw4N21MZWNEcVZxeFlvRmFVSjBCYlhodm1TMXVoOXlnajYyblZEMmxj?=
 =?utf-8?B?U3ZvbzhPOWJPeHRtbHRaZzNQdkdCRG04NmtuTmcxWFJVVExJalVJcTZCbkty?=
 =?utf-8?B?eG4reitLODdvc0RkSE9KdjF4clJzU1BkU3cwczlKTHhWN1o0YWVZcUlReGpQ?=
 =?utf-8?B?VnBDVlpmLzA1TUkxUWNBR3JVUVFPcWYvQ0syc2w3OXR0WFBoZk1IbWdtYnBP?=
 =?utf-8?B?UFdoYmZONzRzZk9nYTBmdG5hSy9yYUk2NGYzeTdDYURBZnJhMit5QnBJNlpl?=
 =?utf-8?B?S3RnQW93K2Y5TjdENmFKWHNKMUpVZ2RCakJ6TGp1LzNDa01GTFZYRHU1SmZn?=
 =?utf-8?B?V3RXZTFSVmtUQjBDYXBOUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC251D55D0444C408E34B34DA0161AB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8456
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a79da4e3-36d4-4b32-fb4a-08dc63ab9420
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VCtabmVXNm13VG9YcFMxcnpPeVovWjR0RHdHMzZzZ3prWUtQSnVBWTVxQzZy?=
 =?utf-8?B?UWpNMFNMWS85QlowSjRmZmY5b3VLK2ZrWVFxQTRjTytvTmFNdEZmM1NPQWM4?=
 =?utf-8?B?YkpxZEIyc1J0UXlSb3A2ZFMvMXRWNGc1Y01UUG00a2d5SGF3dHpESDBKTjI1?=
 =?utf-8?B?MnhDUG8zQWpjTzA3eXdleFZLRVh2ancyRnE5bXlpaDl5QVVCdFBJMmFsVGRP?=
 =?utf-8?B?SGNUbDBEY0dEbVRubS9CVGo1NVZyRU9yekFhUllJd1p4Y2tHdDJoWkJHTEFX?=
 =?utf-8?B?SldKZTFtbktyUExwZU9UVzRLOVAwb2tVenpWNWRIMDlVZEdTSFQ3dXoxVjUv?=
 =?utf-8?B?d09RalprUlhWdzdZaGV2OWtrcit4UllwOStvNWkxYzFuNklXRlhXVjhNOTJC?=
 =?utf-8?B?WVlFTC9vMUQyQTNEZ0tOWHptWEVPK0NaOXEvajdDblRZaXdBQ3owZms3SlRl?=
 =?utf-8?B?SWIySlRQRVg0Wkg1S3VOTGlBay8xU053RzhMKyszYzhjbE5GcXREcCtxTy9v?=
 =?utf-8?B?bGJ1QWtMOURKMlo1OW5Gd3F0RklPTE1lRnptY3VrV3ZURUR3bVc1VERtVkND?=
 =?utf-8?B?b2ViTjYyNjFOQ1NiLzM3VDdhQWRrL3hsTEh4UDdlQWZDRDhNeXBJZTdjVWdo?=
 =?utf-8?B?cWFBdGErdElMWUFodEs3d1gxNWIzdENkNGxTcGkzTFBmOTBPdkpPMFdVSUNj?=
 =?utf-8?B?cGJkQzhQc280Q0YvMzRIUGk1S2hjUWJyTGtRS3R3Q2dBazloT3krV1kyKzNB?=
 =?utf-8?B?anRUazdqVkNyS0tHTkVZTldNU3lWQWE1OGVlZll5RjJQeXNIWVl5c0o5MTJh?=
 =?utf-8?B?KzZybnRjK29IRUJZdDNXK2xUTUpGWHR6Y00vMVF2SDl0b08waXJtVG83a2Rx?=
 =?utf-8?B?MW52ZVdaaXZzaW85Y0hqTTdSTUNyNWwzOEdBbkt1a0Erak9YTGpobHY0SW13?=
 =?utf-8?B?bTg3cWxWSjJWMVdhTkFYaFZNRHUxM0ptckVVTG55dXYvQ3FBTjhGYUhYOXV0?=
 =?utf-8?B?aWRKMWdxKzJXZE9GektlKzJPd3J0dGhzYWpSVzZLVzdEaXF1eGxUcWFSZGFx?=
 =?utf-8?B?Tm1iQmxCQ3g5SUxrUmdrcnBsbEFvZUd6TTM2cGxuWGFLM3BUU0c5TCtiYm9n?=
 =?utf-8?B?VVEzNmV3VEs5MjZ5ZWFqSmVaUEV6UmZlUWZlMGhadkNOUnVORlJhaDRqaVdi?=
 =?utf-8?B?R3ZyTzFPMzJ4cTF1OHhORGpvaVM1bDlDZm9jODB6VWpFL2c4SmRGWTU0UEtH?=
 =?utf-8?B?Z2xCa1poWXdNdFg4UE96czBGQkJuL0VYSm1jZWZVRWFkVVM2SGt6Yy9mZEU1?=
 =?utf-8?B?aVlvc3F5RzE2OXZiUmVxWktUeHN0UjhHNlZiSjlwMnB2TG41VSsvMVdsUHBQ?=
 =?utf-8?B?YTYrT0I5aFZuM2lrbllqbWI1QmtNa2Z6czNtd2k3V0dMS1QyZDkyZXZqVzdj?=
 =?utf-8?B?VzFsTGNXT0dHNmVlQ1VTbEZqYnZrN1gxVjlkeGh1UzBtV3AybjlsYlc0dnFi?=
 =?utf-8?B?c0pjQnVnYytEVE5KS2Q1cHI4NlpWVUZEbUJpMTRQbHJZMysxNHcvYXZZaVJz?=
 =?utf-8?B?SW1MRUJGc3pRZlNHVExUTXZCeHowOWt4dDkrc3IrME51OHNDaXFPejlvWjJy?=
 =?utf-8?B?aXFtOTNFTTE5dVNUSjhJTWR5VEdldTBDelNON3ZOZlZQYnVOSGcyV0wzbzBX?=
 =?utf-8?B?Y1RtWkNjZzlFejdSUXdMT0lPZVdvdVNIQ2ptbUcxa0VXWWdUOFZ4ZEIxQ0tw?=
 =?utf-8?B?czYwTVJrbU85KzY1ZXdSU3BINi90YzlNWFZzbEVHcWozc3BLZDhXbU1wSUtn?=
 =?utf-8?B?amZRR2EzbkwxdkZteEpRNGM3THJsVU1HdkdwaVBibEl0TkpSQWxURVQxOG5Y?=
 =?utf-8?Q?XHFFq19LZZZYY?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 15:39:44.6558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ec1a3c-9548-4292-9412-08dc63ab9990
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 15:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198629

T24gMjMgQXByIDIwMjQsIGF0IDEzOjM3LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IFNvbWVob3csIHRoaXMgZGlzdHJpYnV0ZXMgYSBjb3B5IG9mIHRoZSBidWlsZCB0
cmVlOg0KPiANCj4gQ2hhbmdlcyB0byBwYWNrYWdlcy9hYXJjaDY0LWxpbnV4L3B5dGhvbjMtc2V0
dXB0b29scy1uYXRpdmUgKHN5c3Jvb3QpOg0KPiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBh
Y2thZ2VzL2J1aWxkIHdhcyBhZGRlZA0KPiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBhY2th
Z2VzL2J1aWxkL2xpYiB3YXMgYWRkZWQNCj4gIC91c3IvbGliL3B5dGhvbjMuMTIvc2l0ZS1wYWNr
YWdlcy9idWlsZC9saWIvX2Rpc3R1dGlsc19oYWNrIHdhcyBhZGRlZA0KPiAgL3Vzci9saWIvcHl0
aG9uMy4xMi9zaXRlLXBhY2thZ2VzL2J1aWxkL2xpYi9fZGlzdHV0aWxzX2hhY2svX19pbml0X18u
cHkgd2FzIGFkZGVkDQo+ICAvdXNyL2xpYi9weXRob24zLjEyL3NpdGUtcGFja2FnZXMvYnVpbGQv
bGliL19kaXN0dXRpbHNfaGFjay9vdmVycmlkZS5weSB3YXMgYWRkZWQNCj4gIC91c3IvbGliL3B5
dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9idWlsZC9saWIvcGtnX3Jlc291cmNlcyB3YXMgYWRkZWQN
Cj4gIC91c3IvbGliL3B5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9idWlsZC9saWIvcGtnX3Jlc291
cmNlcy9leHRlcm4gd2FzIGFkZGVkDQo+ICAvdXNyL2xpYi9weXRob24zLjEyL3NpdGUtcGFja2Fn
ZXMvYnVpbGQvbGliL3BrZ19yZXNvdXJjZXMvZXh0ZXJuL19faW5pdF9fLnB5IHdhcyBhZGRlZA0K
PiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBhY2thZ2VzL2J1aWxkL2xpYi9wa2dfcmVzb3Vy
Y2VzL19faW5pdF9fLnB5IHdhcyBhZGRlZA0KPiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBh
Y2thZ2VzL2J1aWxkL2xpYi9wa2dfcmVzb3VyY2VzL192ZW5kb3Igd2FzIGFkZGVkDQo+IOKApg0K
PiANCj4gVGhpcyBpcyB2ZXJ5IGJyb2tlbiBhbmQgaG9wZWZ1bGx5IGEgbmV3ZXIgcmVsZWFzZSBm
aXhlZCBpdC4NCg0KT2RkbHksIGlmIEkgcmVidWlsZCB0aGUgcmVjaXBlIHRoaXMgZGlzYXBwZWFy
cy4gIFRoaXMgaXMgX3ZlcnlfIG9kZCBidXQgSSBjYW7igJl0IGJsYW1lIHNldHVwdG9vbHMganVz
dCB5ZXQuDQoNClJvc3M=

